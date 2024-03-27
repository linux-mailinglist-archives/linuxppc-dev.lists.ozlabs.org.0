Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5288D6C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 07:43:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kk0liqz8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4HDP728Yz3vcf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 17:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kk0liqz8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4H7w5kkDz3vj0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 17:39:08 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e0f2798b47so3889825ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521546; x=1712126346; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DfQOYc1JN5nrBehzJkZHt1akeRs7lpnsLdaI1nfPLU=;
        b=Kk0liqz8rBjOyLLsFzMj7s4AdEveupDE77ehYPEJy/QnwSU7/Z/pAvtwsr21Nh6Pqj
         6zEyuMpd3Pzy2lQ3cV1chIQ94EqWmLWUvonBjl3NKaEFDBXtWPuPpFBtMjlMzXl4wipr
         tpkWWZhpi6nf6P9vm5uI/cLPdB8avocy0w72edhmDHjdSLdOzhtP5fQYop9a9s3ZIvqm
         C/MSu3c+iJVcKZ+2s9qnClb5WfczJHQnn4RNOnHLBi5WJS2U5oKLlzFyXlQ2o6c4XVlt
         Nf+v/Mp1oDM+47hbRGLd3LoAWnttpyU50/M7X1PepUW/Kvt2tyR2uGaGXmTpFrtjF98B
         5EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521546; x=1712126346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DfQOYc1JN5nrBehzJkZHt1akeRs7lpnsLdaI1nfPLU=;
        b=JhkJyQJ+wEHhFKhBrJtIc/2YLGFrCgR/jQo7vn1drcB2MYNQlkDFZSaIJJmr1hieGt
         BZ57pOfqcXAZ3remym5aPe7MElHZGFbcevjt/dE6RlzHEVGg26vkOzeR4l64KNjeTUXS
         kpwy57ERj6uu/koEKzW0BhGwzF8arf6DDEKY1BdRrP02RToxA59tBmEz3FbKsY63bhXR
         /at4fNpqC3dtL83a9VOXUtfLhwjovJpgr2AtgTMoOOd2KXaYaQiZCHbqIItXd/DDM49a
         ngy5jazRPyaiJb0IG/EyaJ+zVVwzO8PqeFjlc8r4r9rHngFaqYK6N0IpLwgP085QY9hS
         lrAg==
X-Forwarded-Encrypted: i=1; AJvYcCU7SIWFlI+La7o5wjKWS06Q3Y/Deatz12ffBDZ3rV6cEyDxQbvhAhrlYaFhzTRZcvfdykoo7B5qnO0dQHWUSADnhsI+Dd6kSYGvuHfq1g==
X-Gm-Message-State: AOJu0YwyU0TcfxKe5QmbIykhc3JndTfFxKyGcNPmlAEMoEzVLG86jaMN
	fiWWa3rlOyiobZvssp6T1UJEXfT7k3J3V3vrlvi6ZieBFdbX7E+lL7HE3pet3w==
X-Google-Smtp-Source: AGHT+IG9tkeLSux89RDN7jdZLa4I9cQEl6MhGSBjtccqzZ7asOarqJOrM5ja9d0DupKloRxYagDqLg==
X-Received: by 2002:a17:902:dac2:b0:1e0:a3b9:2e7a with SMTP id q2-20020a170902dac200b001e0a3b92e7amr5435896plx.6.1711521546022;
        Tue, 26 Mar 2024 23:39:06 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:39:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:54 +0530
Subject: [PATCH v11 8/8] PCI: endpoint: Remove "core_init_notifier" flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-8-6f5259f90673@linaro.org>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
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
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=16248;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Z90+hpyS7BTYS+5IhBwCQlHmOswh/JP6rqgyquNWImA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75WX+kb3lCzbDSKWf6R/y+0OWcYOCZVdrgur
 WzvicT8hiKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+VgAKCRBVnxHm/pHO
 9XjKB/9j8a7tWA27fz2x4jlLEJwzZqGdc9y9WIpBu6jm7P4jaUni/EpWdCHgNGoGeiWQVXAcTrP
 ZKFjIIDqW2e87TG62zCem2IglMvOg7Yt1h99+sXpdDw7QEb+G4mz0AXRtc6fdpJcL8QNvfUgqkP
 3HIorsY99ntCzufoxq9GB/2bbq43s0ZuJSbJjM9ogqjKOUzb2YJ57Q27xs1jFJkjAps9NzviiYe
 NvKAwEOrQreNPuvkI8yVc+a5aj28L3Bsxj4VoRx9KtT0mKyskY0P8Q1wJVfj31cZou99q0i/nee
 y1DLXH242gxAUKy+SqojLlFmnDn4QzwKnywUvS2cNQJ8OrxC
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
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/cadence/pcie-cadence-ep.c  |  2 ++
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
 drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
 drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
 drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
 drivers/pci/controller/dwc/pcie-designware-ep.c   |  1 +
 drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
 drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
 drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
 drivers/pci/controller/pcie-rcar-ep.c             |  2 ++
 drivers/pci/controller/pcie-rockchip-ep.c         |  2 ++
 drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
 drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
 drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
 include/linux/pci-epc.h                           |  7 ++++---
 19 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 2d0a8d78bffb..da67a06ee790 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -734,6 +734,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 
 	spin_lock_init(&ep->lock);
 
+	dw_pcie_ep_init_notify(&pci->ep);
+
 	return 0;
 
  free_epc_mem:
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
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index e0c654f242d2..5bfecc629bfc 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -630,6 +630,7 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
 	dw_pcie_edma_remove(pci);
+	ep->epc->init_complete = false;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
 
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
 
diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index e6909271def7..45449171d71f 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -538,6 +538,8 @@ static int rcar_pcie_ep_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	dw_pcie_ep_init_notify(&pci->ep);
+
 	return 0;
 
 err_pm_put:
diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index c9046e97a1d2..d3412ce17440 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -609,6 +609,8 @@ static int rockchip_pcie_ep_probe(struct platform_device *pdev)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_CONF_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
+	dw_pcie_ep_init_notify(&pci->ep);
+
 	return 0;
 err_epc_mem_exit:
 	pci_epc_mem_exit(epc);
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

