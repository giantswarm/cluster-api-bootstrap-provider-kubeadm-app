package project

var (
	description = ""
	gitSHA      = "n/a"
	name        = "cluster-api-bootstrap-provider-kubeadm"
	source      = "https://github.com/giantswarm/cluster-api-bootstrap-provider-kubeadm-app"
	version     = "0.0.0"
)

func Description() string {
	return description
}

func GitSHA() string {
	return gitSHA
}

func Name() string {
	return name
}

func Source() string {
	return source
}

func Version() string {
	return version
}
