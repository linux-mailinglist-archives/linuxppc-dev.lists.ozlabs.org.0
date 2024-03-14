Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19F87B8F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:54:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QRHXYSwV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKQc3j34z3vqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QRHXYSwV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKKL4vWcz3dwr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:49:42 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dd10ae77d8so4381065ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402580; x=1711007380; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oG15CX4beLBeuniF9W2ewRdqC7XGBSpAJslMsJApDnc=;
        b=QRHXYSwVzao2z1g3qSplp3FOBpvukwagk3xae2uVzHWLB7mgvv4FFoHhGIkgB0s5G4
         8w25rGZWYdd7l/GI5vmh6izBkhlBfq7DF+nP+9AI4rxL4obIQiREfqgumP/lrKYXCoDT
         /wZgexfacCN1iC6Yht/bRJhtZK8y1ba9OrJhtE3qfHpeeswhM+MSG+TV7T+hMJdRP2AO
         CsiKT40RQTqmtzvZPrC298wETVWYrAtp4gWGaYzMkhC+IO1xyfJk2KTlI01Pm8x7bNZ1
         qOeHlvxku8vExs3NYrgSotvY6FVHdq+ICmIoNqe5yaRt0FBqDgMKobpQcJTuYA8eEgys
         UelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402580; x=1711007380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oG15CX4beLBeuniF9W2ewRdqC7XGBSpAJslMsJApDnc=;
        b=D6iEcypVKf0D540q7MxHcEBrPO1BwHRQ4QOiIhag1+VReBY9+RgCMSHQXif6wpPf7v
         QRpWpdvPfOwG3r3uNbWOPgTEkObYP6Anpw7V58GqgZGrteysg2V9g7Db+W9bQvrRY3mH
         IgxlBhRJ7pMeMl4ZyUhyeZ87qj1vjPb2pNMGgZbuSNXtKDqhlpq5AqVbcwbh79+06vbq
         kNb1fuizStm9gkW1X8UlpCtODQ/tXFOBt9JoJ+kMkAIaDUamqXEIlpa38awx9bObohsO
         Au5R7Y4k8oqqSZMcf97yiomeJGJQW8Xwx4FuSh6fMSDGSbIPJZaVaS7enJInYmDr+RcC
         yr/w==
X-Forwarded-Encrypted: i=1; AJvYcCUYRwLbKjNiL5mdlK1zs0icHAJlroBu2RTgRR+wDDEPV3YYhqZb7uZHWpONdX3H/KO/tgj22ILhj6vyD+d64/DbNKrRiM9q3A6mSxtMPQ==
X-Gm-Message-State: AOJu0Yxz/95T0BqXKODQ2iVarA37Pl8H66BzhmRpc9vyfjWQEtMajsa0
	udDKc5/Z5AOKgdbv7oY+/CChioAnjU/81aP3+F5xJ7vt3BKNAHslNVLobzIRZQ==
X-Google-Smtp-Source: AGHT+IFKTemGoIv+4/BI+Sr5GPPsL+zXDqxidpS2ymUj3e46VG33KArpiuOjL3t0E8ECnVFGgOEKJA==
X-Received: by 2002:a17:903:187:b0:1de:e122:1826 with SMTP id z7-20020a170903018700b001dee1221826mr64009plg.38.1710402579876;
        Thu, 14 Mar 2024 00:49:39 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:05 +0530
Subject: [PATCH v10 7/8] PCI: dwc: ep: Call dw_pcie_ep_init_registers() API
 directly from all glue drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-7-14a45c5a938e@linaro.org>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
In-Reply-To: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=10236;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=boqks+rPWZIsvj6aCpTVxfVD8A0dgCaOVh/U3pIyzt8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvDHSISMo3EtlVPbU21S7k7KWnMxX8oflF2T
 ilBD9MxoOiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwwAKCRBVnxHm/pHO
 9ZtaB/9O7AR6EGstD7mPT1K8DDxpVZcYpDAuId5D/qybl0Ik9ZxlXhKD0HG1fv+wHmgAfyEL+1C
 nkx01BLSCztYeuU0LsgnzBKWmO21VJgY+Tx1gDPtZx2vgwRQ8aUT6LK5rQUB/+f7+a0lQD+Z3P8
 o4gFx9ZyPWnNy6tQOjOhZZCXCIHH3OZYRyNatCzlPl87D7LknxZGGtVwK5xZa7kC92Q/Cf0Asp4
 28nwrs+/o1m3omJVX48a2fW8OU76OL2iqP1eQ67CGrFwNp7YqZd7bsay7SYmRNYY4jXhNXAOkWS
 eXMKz23Wltv5PCgVpr6T0mn+UyERTXzE/t1rDuVJDe3PmAP4
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, dw_pcie_ep_init_registers() API is directly called by the glue
drivers requiring active refclk from host. But for the other drivers, it is
getting called implicitly by dw_pcie_ep_init(). This is due to the fact
that this API initializes DWC EP specific registers and that requires an
active refclk (either from host or generated locally by endpoint itsef).

But, this causes a discrepancy among the glue drivers. So to avoid this
confusion, let's call this API directly from all glue drivers irrespective
of refclk dependency. Only difference here is that the drivers requiring
refclk from host will call this API only after the refclk is received and
other drivers without refclk dependency will call this API right after
dw_pcie_ep_init().

With this change, the check for 'core_init_notifier' flag can now be
dropped from dw_pcie_ep_init() API. This will also allow us to remove the
'core_init_notifier' flag completely in the later commits.

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
 drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
 drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
 drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
 drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
 10 files changed, 90 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 0e406677060d..395042b29ffc 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
 		return ret;
 	}
 
+	ret = dw_pcie_ep_init_registers(ep);
+	if (ret) {
+		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+		dw_pcie_ep_deinit(ep);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index dc2c036ab28c..bfcafa440ddb 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1136,6 +1136,14 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
 		dev_err(dev, "failed to initialize endpoint\n");
 		return ret;
 	}
+
+	ret = dw_pcie_ep_init_registers(ep);
+	if (ret) {
+		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+		dw_pcie_ep_deinit(ep);
+		return ret;
+	}
+
 	/* Start LTSSM. */
 	imx6_pcie_ltssm_enable(dev);
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index c0c62533a3f1..093dbb725e41 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
 		ret = dw_pcie_ep_init(&pci->ep);
 		if (ret < 0)
 			goto err_get_sync;
+
+		ret = dw_pcie_ep_init_registers(&pci->ep);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+			goto err_ep_init;
+		}
+
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", mode);
@@ -1295,6 +1302,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_ep_init:
+	dw_pcie_ep_deinit(&pci->ep);
 err_get_sync:
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 2e398494e7c0..b712fdd06549 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -276,6 +276,13 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dw_pcie_ep_init_registers(&pci->ep);
+	if (ret) {
+		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+		dw_pcie_ep_deinit(&pci->ep);
+		return ret;
+	}
+
 	return ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 9ed0a9ba7619..a6095561db4a 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -441,7 +441,18 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 
 		pci->ep.ops = &pcie_ep_ops;
 
-		return dw_pcie_ep_init(&pci->ep);
+		ret = dw_pcie_ep_init(&pci->ep);
+		if (ret)
+			return ret;
+
+		ret = dw_pcie_ep_init_registers(&pci->ep);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+			dw_pcie_ep_deinit(&pci->ep);
+			return ret;
+		}
+
+		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", artpec6_pcie->mode);
 	}
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 9354671644b6..3893a8c1a11c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -815,7 +815,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct device *dev = pci->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
-	const struct pci_epc_features *epc_features;
 
 	INIT_LIST_HEAD(&ep->func_list);
 
@@ -861,29 +860,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		goto err_exit_epc_mem;
 	}
 
-	if (ep->ops->get_features) {
-		epc_features = ep->ops->get_features(ep);
-		if (epc_features->core_init_notifier)
-			return 0;
-	}
-
-	/*
-	 * NOTE:- Avoid accessing the hardware (Ex:- DBI space) before this
-	 * step as platforms that implement 'core_init_notifier' feature may
-	 * not have the hardware ready (i.e. core initialized) for access
-	 * (Ex: tegra194). Any hardware access on such platforms result
-	 * in system hang.
-	 */
-	ret = dw_pcie_ep_init_registers(ep);
-	if (ret)
-		goto err_free_epc_mem;
-
 	return 0;
 
-err_free_epc_mem:
-	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
-			      epc->mem->window.page_size);
-
 err_exit_epc_mem:
 	pci_epc_mem_exit(epc);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 778588b4be70..ca9b22e654cd 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -145,6 +145,15 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 
 		pci->ep.ops = &pcie_ep_ops;
 		ret = dw_pcie_ep_init(&pci->ep);
+		if (ret)
+			return ret;
+
+		ret = dw_pcie_ep_init_registers(&pci->ep);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+			dw_pcie_ep_deinit(&pci->ep);
+		}
+
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 208d3b0ba196..250d6acf16dc 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -392,6 +392,7 @@ static int keembay_pcie_probe(struct platform_device *pdev)
 	struct keembay_pcie *pcie;
 	struct dw_pcie *pci;
 	enum dw_pcie_device_mode mode;
+	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -426,11 +427,24 @@ static int keembay_pcie_probe(struct platform_device *pdev)
 			return -ENODEV;
 
 		pci->ep.ops = &keembay_pcie_ep_ops;
-		return dw_pcie_ep_init(&pci->ep);
+		ret = dw_pcie_ep_init(&pci->ep);
+		if (ret)
+			return ret;
+
+		ret = dw_pcie_ep_init_registers(&pci->ep);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+			dw_pcie_ep_deinit(&pci->ep);
+			return ret;
+		}
+
+		break;
 	default:
 		dev_err(dev, "Invalid device type %d\n", pcie->mode);
 		return -ENODEV;
 	}
+
+	return 0;
 }
 
 static const struct keembay_pcie_of_data keembay_pcie_rc_of_data = {
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 9d9d22e367bb..fb7c03639a53 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -414,6 +414,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie_ep *ep = &rcar->dw.ep;
+	struct device *dev = rcar->dw.dev;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
@@ -422,8 +423,17 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 	ep->ops = &pcie_ep_ops;
 
 	ret = dw_pcie_ep_init(ep);
-	if (ret)
+	if (ret) {
 		rcar_gen4_pcie_ep_deinit(rcar);
+		return ret;
+	}
+
+	ret = dw_pcie_ep_init_registers(ep);
+	if (ret) {
+		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+		dw_pcie_ep_deinit(ep);
+		rcar_gen4_pcie_ep_deinit(rcar);
+	}
 
 	return ret;
 }
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 3fced0d3e851..82ccaea089be 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -399,7 +399,18 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 		return ret;
 
 	priv->pci.ep.ops = &uniphier_pcie_ep_ops;
-	return dw_pcie_ep_init(&priv->pci.ep);
+	ret = dw_pcie_ep_init(&priv->pci.ep);
+	if (ret)
+		return ret;
+
+	ret = dw_pcie_ep_init_registers(&priv->pci.ep);
+	if (ret) {
+		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
+		dw_pcie_ep_deinit(&priv->pci.ep);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {

-- 
2.25.1

