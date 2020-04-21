package src

import (
	"io/ioutil"
	"os/exec"
        "github.com/hashicorp/terraform-plugin-sdk/helper/schema"
)

func dataSourceGitRevParse() *schema.Resource {
	return &schema.Resource{
		Read: DataSourceGitRevParseRead,
		Schema: map[string]*schema.Schema{
			"arg": &schema.Schema{
				Type: schema.TypeString,
				Required: true,
			},
		},
	}
}

func DataSourceGitRevParseRead(d *schema.ResourceData, m interface{}) error {
	_, err := exec.LookPath("git")
	if err != nil {
		return err
	}
	arg := d.Get("arg").(string)
	cmd := exec.Command("git", "rev-parse", arg)

	stdout, err := cmd.StdoutPipe()
	if err != nil { return err }

	bytes, err := ioutil.ReadAll(stdout)
	if err != nil { return err }

	d.Set("hash", string(bytes))

	return nil
}
