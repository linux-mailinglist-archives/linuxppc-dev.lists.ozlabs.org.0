Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE048FDFAC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:28:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VCwoJZI+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvwtH1H0yz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VCwoJZI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvwrq1X9nz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 17:27:23 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70245b22365so500894b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658841; x=1718263641; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBwbkrCA0TqUNhFf1X74rV9wZuOSuStFGznhcPYGXFs=;
        b=VCwoJZI+RFybII+4/xkeprfHi4GpjOXfR0yb+AJiOS18nI9R99EXTloIkGK7lHNwV0
         ZrNyAIs3pB0qN5m9fPM+6xfhz9+LMJBH3GgVn/+16ZNIIdfnfLEz4buDALU7NJq1ScdI
         is/lXju6DUqRfETl4DL321v88xSYg/JHRI+QKvwHNM2qKwh4E+8FgGzR8Q0uLm3NyZ6t
         EJOrMw8lCvOwj/EVkwx6/ipIXorjjp0KBYvFEH8oHalwE8o1uzNJvSSMdfHH7AmAs4xT
         pU4KJVdAMi4zK19X1H08WCmtYlYvzio3VlmXa3kRUVPZPKNkfZ+rixYjhXbSIX6jqWpI
         dhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658841; x=1718263641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBwbkrCA0TqUNhFf1X74rV9wZuOSuStFGznhcPYGXFs=;
        b=geLQdZUiqiApphtXfi/dfd7XYsBe6uqjl46342+0jBDxJCoRLtGC+iG+lboUdpBEYb
         Wpp0bZT7seKbgp7HuECyvONT2Qfmrpc/o7KosfHren+knFHhwmbaPc1Fc3aS3RinbX5g
         lShKZOKyRtaoBZyoRcPEOR4ne+OjM9AQ2yH3/vXU9F1eyKQCg9J2lZVksI13YGPzQIt3
         6jS5tAoKaIB+1j2xOs4Wj0eb9ZjqAamh1bKKgutBWIHIMLOrnX5I1aWoBK0HFVqSMZVL
         iv++8ex2McIQbTf+NEUFIm7VnOr77qXQ551th9W5zRYcct9h36Eesn9LPhlDCmhDAoU7
         S9HA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4TStGBaCRSDKQ9Zuch0ZbuMt1xrun1PqdQRHS1NcyQKBUgeZcdf+gZunJ3gAx4qTfY+o6HVYCzQ+xiQZiT77iq4vbb18Ak1tnRma6w==
X-Gm-Message-State: AOJu0YwYff53ncoJGF+/mmn8+RMUy00GNVS1O7PoTCJmHz1T4vGawCv2
	jPdIqtnDLN/dxyW37KdiWk4MlAQBDY4ECJNt6Rsfx2iuq3CKPcPlNdNac0hVYg==
X-Google-Smtp-Source: AGHT+IFnIUwznqu9u6MYNsnelzJn1VgHUtykElhx3ssZeiNo68mnCPqGNdTRBVe2iI9ZvQRVR2Dx9A==
X-Received: by 2002:a05:6a00:98a:b0:6e9:38d0:5019 with SMTP id d2e1a72fcca58-703e56fb190mr5742198b3a.0.1717658840683;
        Thu, 06 Jun 2024 00:27:20 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:34 +0530
Subject: [PATCH 1/5] PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-1-4395534520dc@linaro.org>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8261;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=XfhruISZ6W6R/LbDDvmS/1LRRcCdxW1e2vnybSWgY64=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTCd6OusAPWj8/EhofvKCGw0bb2fJ7CBP789
 MUhRI4+ZwmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwgAKCRBVnxHm/pHO
 9UPbCACmpesgufNbd+/06XFOPPifCGFzoXuFNZvjloHcTt5jKhb91yQtvvslDVmrsSO7MPGXfNV
 sWYep9sTwAits18G98ywyuTzVz01h0PD/4W9QSTh+3n7svU3XY9LQy/1JOfxCJMQlsLhQTijMF6
 HSJC65HnT3yTkO+pBo/AsQtv9uHgnqv3OD63v71cK1ofkiF1Gk7GQgp0buARc1SOYAQ7UyQ7ZWO
 V151SUoUGcqz0qzCJAZXQNBVsg5NmZ3bca4RsFWH77rv4NFm54xKjWT33Skf8Gs43Wz4NLrcrqc
 ZhIF2srA1GaMOp43xafLsUweSWlQI9flN6hMwWnek6Nmh2Ja
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
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently dw_pcie_ep_init_notify() wrapper just calls pci_epc_init_notify()
directly. So this wrapper provides no benefit to the glue drivers.

So let's remove it and call pci_epc_init_notify() directly from glue
drivers.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c         |  2 +-
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c         |  2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 12 ------------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  5 -----
 drivers/pci/controller/dwc/pcie-keembay.c         |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |  2 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 +-
 13 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d2d17d37d3e0..e491d0ff3962 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -474,7 +474,7 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
 		return ret;
 	}
 
-	dw_pcie_ep_init_notify(ep);
+	pci_epc_init_notify(ep->epc);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 917c69edee1d..a876b8e6e741 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1131,7 +1131,7 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
 		return ret;
 	}
 
-	dw_pcie_ep_init_notify(ep);
+	pci_epc_init_notify(ep->epc);
 
 	/* Start LTSSM. */
 	imx6_pcie_ltssm_enable(dev);
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index d3a7d14ee685..ca1054f5c79a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1293,7 +1293,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 			goto err_ep_init;
 		}
 
-		dw_pcie_ep_init_notify(&pci->ep);
+		pci_epc_init_notify(pci->ep.epc);
 
 		break;
 	default:
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 7dde6d5fa4d8..35bb481564c7 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -286,7 +286,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dw_pcie_ep_init_notify(&pci->ep);
+	pci_epc_init_notify(pci->ep.epc);
 
 	return ls_pcie_ep_interrupt_init(pcie, pdev);
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index a4630b92489b..dc8dd7f27b78 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -452,7 +452,7 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		dw_pcie_ep_init_notify(&pci->ep);
+		pci_epc_init_notify(pci->ep.epc);
 
 		break;
 	default:
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 47391d7d3a73..2e69f81baf99 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -27,18 +27,6 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
-/**
- * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization complete
- * @ep: DWC EP device
- */
-void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
-{
-	struct pci_epc *epc = ep->epc;
-
-	pci_epc_init_notify(epc);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
-
 /**
  * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
  *				 the endpoint function
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8490c5d6ff9f..771b9d9be077 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -154,7 +154,7 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 			dw_pcie_ep_deinit(&pci->ep);
 		}
 
-		dw_pcie_ep_init_notify(&pci->ep);
+		pci_epc_init_notify(pci->ep.epc);
 
 		break;
 	default:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f8e5431a207b..49ae845a3662 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -670,7 +670,6 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
-void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
@@ -698,10 +697,6 @@ static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	return 0;
 }
 
-static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
-{
-}
-
 static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 98bbc83182b4..278205db60a2 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -442,7 +442,7 @@ static int keembay_pcie_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		dw_pcie_ep_init_notify(&pci->ep);
+		pci_epc_init_notify(pci->ep.epc);
 
 		break;
 	default:
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 1ecf602c225a..4d2d7457dcb3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -482,7 +482,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	val &= ~PARF_MSTR_AXI_CLK_EN;
 	writel_relaxed(val, pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
 
-	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
+	pci_epc_init_notify(pcie_ep->pci.ep.epc);
 
 	/* Enable LTSSM */
 	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index cfeccc2f9ee1..237a6a8818de 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -437,7 +437,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 		rcar_gen4_pcie_ep_deinit(rcar);
 	}
 
-	dw_pcie_ep_init_notify(ep);
+	pci_epc_init_notify(ep->epc);
 
 	return ret;
 }
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 93f5433c5c55..432ed9d9a463 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1903,7 +1903,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		goto fail_init_complete;
 	}
 
-	dw_pcie_ep_init_notify(ep);
+	pci_epc_init_notify(ep->epc);
 
 	/* Program the private control to allow sending LTR upstream */
 	if (pcie->of_data->has_ltr_req_fix) {
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index a2b844268e28..d6e73811216e 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -410,7 +410,7 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dw_pcie_ep_init_notify(&priv->pci.ep);
+	pci_epc_init_notify(priv->pci.ep.epc);
 
 	return 0;
 }

-- 
2.25.1

