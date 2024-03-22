Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B5886BA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 12:54:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRb6+7dx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1LNH4TVwz3vdt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 22:54:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRb6+7dx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1LMb0t4Fz3vYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 22:54:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A556CE17F0;
	Fri, 22 Mar 2024 11:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5125FC433C7;
	Fri, 22 Mar 2024 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711108440;
	bh=b9Cp4C1sz2JvQcloJbd1gxGs1djTlwbzJPl/7QImHrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRb6+7dx+JBAmmwEy/1CbdN2q2OvEsiR/RQXuB4t8hLIaNirKmj/2Trwph9TnuZnq
	 9FLsy/VthCWbXcnq09IdY81DsJdJbeXxGL5SfvszT2ZFMTMbDc4ZphVkmAkucYmB3q
	 uwRuBYE0daZ2r/KSrsMurn/OJcqc8lAmbvavkQdJ1Wal8yBkdX6WuduVDqxSSoJcep
	 46LvtW9lm7lfch2R4MktG5kQjJaFBZggm+vD7/AUSJMFAuzjpnr4w6jV02k/G30/I2
	 jYWN2TwvUDMCfeDD/vRCo2XVllTNp7SFh3RKj8+25msTV0WfF8wI4iCNU+drxf3qJI
	 lvyqUtd9CUZoA==
Date: Fri, 22 Mar 2024 12:53:50 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v10 8/8] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <Zf1xTkuK8yBZXmQ0@ryzen>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
 <20240314-pci-dbi-rework-v10-8-14a45c5a938e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-pci-dbi-rework-v10-8-14a45c5a938e@linaro.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang
  <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 01:18:06PM +0530, Manivannan Sadhasivam wrote:
> "core_init_notifier" flag is set by the glue drivers requiring refclk from
> the host to complete the DWC core initialization. Also, those drivers will
> send a notification to the EPF drivers once the initialization is fully
> completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> will start functioning.
> 
> For the rest of the drivers generating refclk locally, EPF drivers will
> start functioning post binding with them. EPF drivers rely on the
> 'core_init_notifier' flag to differentiate between the drivers.
> Unfortunately, this creates two different flows for the EPF drivers.
> 
> So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> a single initialization flow for the EPF drivers. This is done by calling
> the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> send the notification to the EPF drivers once the initialization is fully
> completed.
> 
> Only difference here is that, the drivers requiring refclk from host will
> send the notification once refclk is received, while others will send it
> during probe time itself.
> 
> But this also requires the EPC core driver to deliver the notification
> after EPF driver bind. Because, the glue driver can send the notification
> before the EPF drivers bind() and in those cases the EPF drivers will miss
> the event. To accommodate this, EPC core is now caching the state of the
> EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> notification to EPF drivers based on that after each EPF driver bind.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
>  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
>  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
>  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
>  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
>  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
>  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
>  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
>  include/linux/pci-epc.h                           |  7 ++++---
>  15 files changed, 58 insertions(+), 18 deletions(-)

FWIW:
Tested-by: Niklas Cassel <cassel@kernel.org>



However, when looking at this, I was surprised that you never call something
that will set:
init_complete = false;
from e.g. dw_pcie_ep_deinit() or dw_pcie_ep_cleanup().

I saw that you do seem to set
init_complete = false;
in your other follow up series that is based on this one.

What will happen if you run with only this series merged (without your
follow up series), on a platform that used to have .core_init_notifier?

If you do remove and recreate the symlink on a platform with external
refclk, since you never set init_complete to false, you could trigger
EPF core_init callback, e.g. pci_epf_test_core_init() to be called,
which will do DBI writes even when there is no refclk.

E.g. (on a platform with external refclk):
1) Create symlink to pci-epf-test in configfs.
2) Start RC, your EPC driver will call ep_init_notifiy() when perst
deasserts.
3) Run pci-epf-test.
4) Remove the pci-epf-test symlink
5) Shutdown RC
6) Create symlink to pci-epf-test in configfs.
   This will see that init_complete is true, and will do DBI writes
   which will crash your system, since you don't have a refclk.

Perhaps you should move the patch that calls a function that sets
init_complete = false;
to this series, so that this crash is not possible?


> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 395042b29ffc..d2d17d37d3e0 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -474,6 +474,8 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bfcafa440ddb..894b5de76e3a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1144,6 +1144,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	/* Start LTSSM. */
>  	imx6_pcie_ltssm_enable(dev);
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 093dbb725e41..b7b30470b394 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1293,6 +1293,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  			goto err_ep_init;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", mode);
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index b712fdd06549..c513598a46d7 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -283,6 +283,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(&pci->ep);
> +
>  	return ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index a6095561db4a..a4630b92489b 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -452,6 +452,8 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", artpec6_pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index ca9b22e654cd..8490c5d6ff9f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -154,6 +154,8 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
>  			dw_pcie_ep_deinit(&pci->ep);
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 250d6acf16dc..9fa9354a5f48 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -438,6 +438,8 @@ static int keembay_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "Invalid device type %d\n", pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 3697b4a944cc..2fb8c15e7a91 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -775,7 +775,6 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
>  
>  static const struct pci_epc_features qcom_pcie_epc_features = {
>  	.linkup_notifier = true,
> -	.core_init_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = false,
>  	.align = SZ_4K,
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index fb7c03639a53..0448928017f3 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -435,6 +435,8 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  		rcar_gen4_pcie_ep_deinit(rcar);
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 264ee76bf008..e02deb31a72d 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2006,7 +2006,6 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  
>  static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.linkup_notifier = true,
> -	.core_init_notifier = true,
>  	.msi_capable = false,
>  	.msix_capable = false,
>  	.reserved_bar = 1 << BAR_2 | 1 << BAR_3 | 1 << BAR_4 | 1 << BAR_5,
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 82ccaea089be..eb1d79fdb1f1 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -410,6 +410,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(&priv->pci.ep);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 18c80002d3bd..fc0282b0d626 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -753,6 +753,7 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
>  	const struct pci_epc_features *epc_features;
>  	struct pci_epc *epc = epf->epc;
>  	struct device *dev = &epf->dev;
> +	bool linkup_notifier = false;
>  	bool msix_capable = false;
>  	bool msi_capable = true;
>  	int ret;
> @@ -795,6 +796,10 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
>  		}
>  	}
>  
> +	linkup_notifier = epc_features->linkup_notifier;
> +	if (!linkup_notifier)
> +		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
> +
>  	return 0;
>  }
>  
> @@ -901,8 +906,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  	const struct pci_epc_features *epc_features;
>  	enum pci_barno test_reg_bar = BAR_0;
>  	struct pci_epc *epc = epf->epc;
> -	bool linkup_notifier = false;
> -	bool core_init_notifier = false;
>  
>  	if (WARN_ON_ONCE(!epc))
>  		return -EINVAL;
> @@ -913,8 +916,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  		return -EOPNOTSUPP;
>  	}
>  
> -	linkup_notifier = epc_features->linkup_notifier;
> -	core_init_notifier = epc_features->core_init_notifier;
>  	test_reg_bar = pci_epc_get_first_free_bar(epc_features);
>  	if (test_reg_bar < 0)
>  		return -EINVAL;
> @@ -927,21 +928,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  	if (ret)
>  		return ret;
>  
> -	if (!core_init_notifier) {
> -		ret = pci_epf_test_core_init(epf);
> -		if (ret)
> -			return ret;
> -	}
> -

While you did fix up all DWC based drivers, the non-DWC EPC drivers that
did not have epc_features->core_init_notifier before this patch:

drivers/pci/controller/cadence/pcie-cadence-ep.c:#include <linux/pci-epc.h>
drivers/pci/controller/pcie-rcar-ep.c:#include <linux/pci-epc.h>
drivers/pci/controller/pcie-rockchip-ep.c:#include <linux/pci-epc.h>

I don't think that they will work with pci-epf-test anymore, since AFAICT,
you did not add a call to: pci_epc_init_notify() or similar in these EPC drivers.
(Like this patch does to all the DWC-based drivers without a core_init_notifier.)


Kind regards,
Niklas
