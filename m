Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E217E87B8F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:54:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=azcZjzVn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKRP4tkVz3cPX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=azcZjzVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKKZ0f6kz3vZP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:49:53 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so4470645ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402592; x=1711007392; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1IH4JXPyGY5G2M+FE3S5VV95kQawRh2XQdzV9wj3zI=;
        b=azcZjzVn4cHraesMMRso37WSuUsb4r0YVIbruhBtLBZSyyI4AQPbySpblHQRNCjgNW
         pi5iiZ7RKSDQQ2IBhO4OuzkpHpUdJVZuet/ohH8/gt+/q88CNIa8LJmsBGFMOhASRd8Q
         92seV0drKs9VhrRR08Nr8qc8L4Ya+a/Jdh+3TkqrFT8Kap4gjTi60rkxHHbXJPXIYdUh
         9rIMenYRWzZvKog8b7nnkfxVBrQ5z/s5OMlec4rta9JPq8XsVjoEDxbo46c9uuD+WCo+
         IwyofDEWziC786d9XyANRSzafEf8/BqTM4/qVBLvHY+udEtWs5N0CqKl5cNWrEcLj0ie
         zCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402592; x=1711007392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1IH4JXPyGY5G2M+FE3S5VV95kQawRh2XQdzV9wj3zI=;
        b=pZkqLgrm+w47aXncuo0DWrmYXsLgK4tYhAMV7uo7y++cWCw+9CDpMi2df1D/JtdrYT
         Pdhcp3cGD7QT+FnDBWkaa01+dx1OQn/+UHKQ8pZQ9EZP7aoCrAWTI8OrvODHHyFDgSq9
         /1AM8F/dMUlk3+87wFh+454iLnlYbDH04Qzk0Cj81JRicD1SIEfLRAOmOi9Jbr2FU7OK
         YDyNNyS49FE0Fe+zypMc4i5FheoUaOfhxfw3dNaRa6SgcJ2yac/nCJ7iUEqD9BM6m5mH
         va+Tn9qd1+sWBQIl5V/46+6YzgLupX6F2hbX+E5e3jHkGG/lJGZWK49v1cYZT/TYUVDD
         s+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUeYgM2JcyCdn+KfcvRHgzewAfHni5wqss2lPTTpDXieImFT3059/nzbzRcd1MQckUqYPMgYKdnaROzskMBD+0vOtJIFzBBz/awr7c0VA==
X-Gm-Message-State: AOJu0Yx1hv+fJ4lsZ/ryrRIvFeP9gQFvBKnWu3QNv1gtNwd9Rz/6XEGH
	k6Tcr0I6p4wezYf8sPe1PA11dJ3XG/RLx8QBmzlhV6JFlvfIIglr8B6YFDFrAMY7xiIMoDNgBdo
	=
X-Google-Smtp-Source: AGHT+IFRoWC/HPBrw71SlL9Xc8OJuqzWc/bBWuQ3n9WklxGo0g0LLQYqYMly7CUmrUvwsMMbUvTFSg==
X-Received: by 2002:a17:902:da88:b0:1dd:d869:a237 with SMTP id j8-20020a170902da8800b001ddd869a237mr3907038plx.34.1710402591972;
        Thu, 14 Mar 2024 00:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:06 +0530
Subject: [PATCH v10 8/8] PCI: dwc: ep: Remove "core_init_notifier" flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-8-14a45c5a938e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14106;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=S2uv0dCCbhiU2qhbMjneII/AXKnesPZEwsDKdaLNH1s=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvEnjDMt0fC3AEek+ZebxmAkGUV98ktdKT4w
 pi6cD4dXsCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrxAAKCRBVnxHm/pHO
 9fFvB/9dsE406HBVkYP7CnZHAv77sMSzBAPSzJevA0+uFWPuaqLWI2/rgpttPDfm7VTCgMtlqO9
 SDsdL4oscB15r3Ei90fbPVvqC3TXfo1VksRWwqy9v9qA7FxckWmohHpQMRtlpYjtuKYpA6WvQP1
 IyC8guMXbFB7QzE0gYC2A2Gjj5WvgMeaTa3l/mv9NxcZLaSjvKIJjEfzIs8OtTSnmA1FpYHTnhw
 XUYk8Qgcob93j6ipCqK/4WFiVx53a3XJFwaP99oXxXEeE99NrY+EvG5ZzKMqIGRXGy2ZNFmEYbJ
 PRVWoZjTVky5Iy+iRA5J5jPXu8uYuGyDDvN55z3bSLcmrKBx
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

But this also requires the EPC core driver to deliver the notification
after EPF driver bind. Because, the glue driver can send the notification
before the EPF drivers bind() and in those cases the EPF drivers will miss
the event. To accommodate this, EPC core is now caching the state of the
EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
notification to EPF drivers based on that after each EPF driver bind.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
 drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
 drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
 drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
 drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
 drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
 drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
 drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
 drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
 drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
 include/linux/pci-epc.h                           |  7 ++++---
 15 files changed, 58 insertions(+), 18 deletions(-)

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
index 093dbb725e41..b7b30470b394 100644
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
 
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index a6095561db4a..a4630b92489b 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -452,6 +452,8 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 			return ret;
 		}
 
+		dw_pcie_ep_init_notify(&pci->ep);
+
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", artpec6_pcie->mode);
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
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 250d6acf16dc..9fa9354a5f48 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -438,6 +438,8 @@ static int keembay_pcie_probe(struct platform_device *pdev)
 			return ret;
 		}
 
+		dw_pcie_ep_init_notify(&pci->ep);
+
 		break;
 	default:
 		dev_err(dev, "Invalid device type %d\n", pcie->mode);
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
 
diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index 0ea64e24ed61..3b21e28f9b59 100644
--- a/drivers/pci/endpoint/pci-ep-cfs.c
+++ b/drivers/pci/endpoint/pci-ep-cfs.c
@@ -64,6 +64,9 @@ static int pci_secondary_epc_epf_link(struct config_item *epf_item,
 		return ret;
 	}
 
+	/* Send any pending EPC initialization complete to the EPF driver */
+	pci_epc_notify_pending_init(epc, epf);
+
 	return 0;
 }
 
@@ -125,6 +128,9 @@ static int pci_primary_epc_epf_link(struct config_item *epf_item,
 		return ret;
 	}
 
+	/* Send any pending EPC initialization complete to the EPF driver */
+	pci_epc_notify_pending_init(epc, epf);
+
 	return 0;
 }
 
@@ -230,6 +236,9 @@ static int pci_epc_epf_link(struct config_item *epc_item,
 		return ret;
 	}
 
+	/* Send any pending EPC initialization complete to the EPF driver */
+	pci_epc_notify_pending_init(epc, epf);
+
 	return 0;
 }
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index dcd4e66430c1..ba2ff037dfa6 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -753,10 +753,32 @@ void pci_epc_init_notify(struct pci_epc *epc)
 			epf->event_ops->core_init(epf);
 		mutex_unlock(&epf->lock);
 	}
+	epc->init_complete = true;
 	mutex_unlock(&epc->list_lock);
 }
 EXPORT_SYMBOL_GPL(pci_epc_init_notify);
 
+/**
+ * pci_epc_notify_pending_init() - Notify the pending EPC device initialization
+ *                                 complete to the EPF device
+ * @epc: the EPC device whose core initialization is pending to be notified
+ * @epf: the EPF device to be notified
+ *
+ * Invoke to notify the pending EPC device initialization complete to the EPF
+ * device. This is used to deliver the notification if the EPC initialization
+ * got completed before the EPF driver bind.
+ */
+void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
+{
+	if (epc->init_complete) {
+		mutex_lock(&epf->lock);
+		if (epf->event_ops && epf->event_ops->core_init)
+			epf->event_ops->core_init(epf);
+		mutex_unlock(&epf->lock);
+	}
+}
+EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
+
 /**
  * pci_epc_bme_notify() - Notify the EPF device that the EPC device has received
  *			  the BME event from the Root complex
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 40ea18f5aa02..adee6dbe4e45 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -128,6 +128,8 @@ struct pci_epc_mem {
  * @group: configfs group representing the PCI EPC device
  * @lock: mutex to protect pci_epc ops
  * @function_num_map: bitmap to manage physical function number
+ * @init_complete: flag to indicate whether the EPC initialization is complete
+ *                 or not
  */
 struct pci_epc {
 	struct device			dev;
@@ -143,13 +145,12 @@ struct pci_epc {
 	/* mutex to protect against concurrent access of EP controller */
 	struct mutex			lock;
 	unsigned long			function_num_map;
+	bool				init_complete;
 };
 
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
- * @core_init_notifier: indicate cores that can notify about their availability
- *			for initialization
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @reserved_bar: bitmap to indicate reserved BAR unavailable to function driver
@@ -159,7 +160,6 @@ struct pci_epc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
-	unsigned int	core_init_notifier : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	u8	reserved_bar;
@@ -198,6 +198,7 @@ int pci_epc_add_epf(struct pci_epc *epc, struct pci_epf *epf,
 void pci_epc_linkup(struct pci_epc *epc);
 void pci_epc_linkdown(struct pci_epc *epc);
 void pci_epc_init_notify(struct pci_epc *epc);
+void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf);
 void pci_epc_bme_notify(struct pci_epc *epc);
 void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
 			enum pci_epc_interface_type type);

-- 
2.25.1

