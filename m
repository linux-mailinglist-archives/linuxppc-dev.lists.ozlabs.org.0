Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB8862340
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 08:00:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6AJqzA+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Thd7J0G7vz3vgv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 18:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6AJqzA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Thd1X11jLz3vbx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 17:55:27 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53fa455cd94so858824a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 22:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757725; x=1709362525; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4kBnhFW3kXs5MV7HBAtNKmBF6mw/2AY7QLZbCEVN8o=;
        b=Z6AJqzA+yfq92gCpIEKfKWfmhJDj7ar1d6sAh7oDzZj1AUYAISDloym4yuaKFL8k7/
         UR1lElFlrBstBj1z9X3cJN81qs7i/AYKw4pVl8BpAvi1kxfWzJu5Y9MKkutIgZJ4Zlx7
         bLpPcM3xIb6PSJQSgItxebqr5iw7CvOJqNykKYMR29+zd8J39NLB9/Wc4NDFu6D7BXGG
         VdEn6+9uOFjUnXbCNuF2WxhkNPMS8BqtbFFUFBK+cQMRYjkex6pbm/Q5WHjz6tTQFf2Y
         DMaCg9l7JSPKxTl+rX8FEsn7QsKdLP3LG4f9BN7VnC4tNKhtnw/y7n/T9J/KAe0TQsie
         aEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757725; x=1709362525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4kBnhFW3kXs5MV7HBAtNKmBF6mw/2AY7QLZbCEVN8o=;
        b=WLQ+63AZGOOmNYsXUyZ8QIE6/V9AQgLgja58lu3lJgH1NPZ5CFkLqPpytb8mtrKdXf
         eOW2AWvEhZtcF7635OeMRXv/AbCBM0aPJb20sLS74mjbeLA07u9lnMfJOQuvi8yRjdWA
         aTnkKENsFKT8X/+Ct4X91oCDYw3T97rIj7OzVnsJKiCA0JPM5Imiurxw5SSyB4knFCeh
         1qT9VULWAJ4aOwKW6WiUOKMeVXC8Me8lHUIjaGlEgjXAlankrAo/esdeSEfsQN9fyb1K
         V5TXgugcoXIeogRQh8Dc5ycyIqUtaUj/TmzqVn3fiL0rqTjaql6y/IjjlpTWEuKlUxdp
         5ioQ==
X-Forwarded-Encrypted: i=1; AJvYcCX19xunJv6SuzI354HwqEqi1ozaIVnz+pO5T2pgxELYexdM7B/wthOg2HIy8X5Cd6kqTIqr7Eyxwn1d88201hxkVCFxBb6+iAWMeLi6uQ==
X-Gm-Message-State: AOJu0YyrHFl+RI5RX+ztLVjzA7QvnFHJm4wASol90SJEba1hXGLhHFUJ
	V5OvYugXYkg/O1Pp2I3Qx0XG0Zx9YqfjCGSPfUkT1V+UP/m/4o4r7pZu2GERiQ==
X-Google-Smtp-Source: AGHT+IGHCVFh9n7ol3Pg1eGJ8Ndmm+fuDS808aA+BkNlPzypdTGjFByLo3Obpk7fC1NXIqhL1Orxtg==
X-Received: by 2002:a05:6a00:4588:b0:6e2:9ff2:19b1 with SMTP id it8-20020a056a00458800b006e29ff219b1mr2107981pfb.13.1708757725430;
        Fri, 23 Feb 2024 22:55:25 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:55:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:13 +0530
Subject: [PATCH v8 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-7-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9101;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=MTzQ50W9Zqtn+bUqQgebIF3c7K0cVBAu1J31qfUnMSg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKXSYVYoYh3lwNExROonRs3ZXrv3EkEejZx6
 fXrI6K7niCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlwAKCRBVnxHm/pHO
 9UB8B/94f6kxwxFsrO2EUdfi11pcRdC5Xkih5xJdEh9M3uAa1uILjXB7QGmyK4IFNexgnAnvP/A
 x9OyhKa/c306tldTWBW/+a49MgUs9usfRQXUrEvltkdZ3O8zxYeWyT6Nu2QQNuMTKTwmLWeUsau
 3WZHN0+hrVNS1wuTRl+zhKSFok/EdJY+4hFn6ur2zSvTVUQoj2CuWNpCTCTXaTyVJxmXOgsKceV
 QMVXxl/9AIk/Bf3zn7N0ldjaENuf4ARB2i8xZVn3CAqgpF9B4XbkfenyVrImsTc17l7M/SuV0hl
 iEVvitXP1zB27+poFBQj6Nj2dgAaEyhxCVKMO5HClGZg12Hq
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"core_init_notifier" flag is set by the glue drivers requiring refclk from
the host to complete the DWC core initialization. Also, those drivers will
send a notification to the EPF drivers once the initialization is fully
completed using the pci_epc_init_notify() API. Only then, the EPF drivers
will start functioning.

For the rest of the drivers generating refclk locally, EPF drivers will
start functioning post binding with them. EPF drivers rely on the
'core_init_notifier' flag to differentiate between the drivers.
Unfortunately, this creates two different flows for the EPF drivers.

So to avoid that, let's get rid of the "core_init_notifier" flag and follow
a single initialization flow for the EPF drivers. This is done by calling
the dw_pcie_ep_init_notify() from all glue drivers after the completion of
dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
send the notification to the EPF drivers once the initialization is fully
completed.

Only difference here is that, the drivers requiring refclk from host will
send the notification once refclk is received, while others will send it
during probe time itself.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
 drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
 drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
 drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
 drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
 drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
 include/linux/pci-epc.h                           |  3 ---
 11 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 395042b29ffc..d2d17d37d3e0 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -474,6 +474,8 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
 		return ret;
 	}
 
+	dw_pcie_ep_init_notify(ep);
+
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index bfcafa440ddb..894b5de76e3a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1144,6 +1144,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
 		return ret;
 	}
 
+	dw_pcie_ep_init_notify(ep);
+
 	/* Start LTSSM. */
 	imx6_pcie_ltssm_enable(dev);
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 8392894ed286..1d00c5fa14ce 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1293,6 +1293,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
 			goto err_ep_init;
 		}
 
+		dw_pcie_ep_init_notify(&pci->ep);
+
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", mode);
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index b712fdd06549..c513598a46d7 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -283,6 +283,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dw_pcie_ep_init_notify(&pci->ep);
+
 	return ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index ca9b22e654cd..8490c5d6ff9f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -154,6 +154,8 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 			dw_pcie_ep_deinit(&pci->ep);
 		}
 
+		dw_pcie_ep_init_notify(&pci->ep);
+
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 3697b4a944cc..2fb8c15e7a91 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -775,7 +775,6 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 
 static const struct pci_epc_features qcom_pcie_epc_features = {
 	.linkup_notifier = true,
-	.core_init_notifier = true,
 	.msi_capable = true,
 	.msix_capable = false,
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index fb7c03639a53..0448928017f3 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -435,6 +435,8 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 		rcar_gen4_pcie_ep_deinit(rcar);
 	}
 
+	dw_pcie_ep_init_notify(ep);
+
 	return ret;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 264ee76bf008..e02deb31a72d 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2006,7 +2006,6 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 static const struct pci_epc_features tegra_pcie_epc_features = {
 	.linkup_notifier = true,
-	.core_init_notifier = true,
 	.msi_capable = false,
 	.msix_capable = false,
 	.reserved_bar = 1 << BAR_2 | 1 << BAR_3 | 1 << BAR_4 | 1 << BAR_5,
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 82ccaea089be..eb1d79fdb1f1 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -410,6 +410,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dw_pcie_ep_init_notify(&priv->pci.ep);
+
 	return 0;
 }
 
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 18c80002d3bd..fc0282b0d626 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -753,6 +753,7 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
 	const struct pci_epc_features *epc_features;
 	struct pci_epc *epc = epf->epc;
 	struct device *dev = &epf->dev;
+	bool linkup_notifier = false;
 	bool msix_capable = false;
 	bool msi_capable = true;
 	int ret;
@@ -795,6 +796,10 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
 		}
 	}
 
+	linkup_notifier = epc_features->linkup_notifier;
+	if (!linkup_notifier)
+		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
+
 	return 0;
 }
 
@@ -901,8 +906,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	const struct pci_epc_features *epc_features;
 	enum pci_barno test_reg_bar = BAR_0;
 	struct pci_epc *epc = epf->epc;
-	bool linkup_notifier = false;
-	bool core_init_notifier = false;
 
 	if (WARN_ON_ONCE(!epc))
 		return -EINVAL;
@@ -913,8 +916,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 		return -EOPNOTSUPP;
 	}
 
-	linkup_notifier = epc_features->linkup_notifier;
-	core_init_notifier = epc_features->core_init_notifier;
 	test_reg_bar = pci_epc_get_first_free_bar(epc_features);
 	if (test_reg_bar < 0)
 		return -EINVAL;
@@ -927,21 +928,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	if (ret)
 		return ret;
 
-	if (!core_init_notifier) {
-		ret = pci_epf_test_core_init(epf);
-		if (ret)
-			return ret;
-	}
-
 	epf_test->dma_supported = true;
 
 	ret = pci_epf_test_init_dma_chan(epf_test);
 	if (ret)
 		epf_test->dma_supported = false;
 
-	if (!linkup_notifier && !core_init_notifier)
-		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
-
 	return 0;
 }
 
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 40ea18f5aa02..03d22aed5ac6 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -148,8 +148,6 @@ struct pci_epc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
- * @core_init_notifier: indicate cores that can notify about their availability
- *			for initialization
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @reserved_bar: bitmap to indicate reserved BAR unavailable to function driver
@@ -159,7 +157,6 @@ struct pci_epc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
-	unsigned int	core_init_notifier : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	u8	reserved_bar;

-- 
2.25.1

