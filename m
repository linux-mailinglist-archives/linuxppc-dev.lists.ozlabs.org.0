Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E687B8F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:53:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xAg4IMGw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKPq38W9z3vnH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:53:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xAg4IMGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKK82P9Pz3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:49:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so440841a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402570; x=1711007370; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=En7dKEz8/ozmX3HuMMdU7IHb33r7hZjjGkDZD6oOuns=;
        b=xAg4IMGwdLHc9XgC4QCxHZBqyPWRoliQa5ky7TW8AVw6beepHY9T2YvAWMkYmNsrym
         mZPAA9VxUSHmjxsLG6zCYWOiddFJBAnmi4KmYSuz+1G0fc971t2RLRz4kawsheQsi0KY
         UMWdVlo0+MxmIIGnrAgd7nSreLkccgZ5AAUAh0NE5uZ+LuzvoIIAJ2yG0GWlYpkt8+WI
         K9vXFv331m7rfDusRIF0rv0b/jTz2kPocoVun6cjBXc2QEuzXNSH+ASdwwG95ghJMdSD
         JCCPoiD3tcUbTbfHFCwPVwaUsO9lXs6IPIYCL5ZG/a69tyfCaikAIsLBL8vThD9fuPg+
         wuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402570; x=1711007370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En7dKEz8/ozmX3HuMMdU7IHb33r7hZjjGkDZD6oOuns=;
        b=lfCWO00uG28ZtY/KzmLuYlxzXl5ERVvjnrUH2L6uV3TJfataVWNpzDIxz3A3h2/0TZ
         NgkJeGXbvVl45b06M/Cw+lpwaA0ZBaxPKWRwpq1JaPuWdgci2lKajWLDz8f/Dsyt/Iev
         FDEi/wpA9/MLyapD3bvpM9KUrLI1Y4kGv3ZRyXuPvuXZQDL9B8jGk96Q3dgnHtYIAnIM
         T3XTDE3CVbzaxk5Di9Lc8/3KsTDINYFGXkGFNKlhoQzjv+Z1ya0HqONi1+ePVVoUBfQ/
         OGOgJgD3sKhITWXK4a9heEHCKVoyG6ilT/OM2YKRW+0Egx146KnqgxNJyGmwJO1je+qq
         btIA==
X-Forwarded-Encrypted: i=1; AJvYcCWVgpO7aTYLxTF075+cU1uzcIiGD6CiYUF8LvIyRiVxOPGkIh8TbkZIu6QcTv9Xx+PDcHRY0YfRSsrkvNLT9j1nWnUaKyQCgZa06N9ckQ==
X-Gm-Message-State: AOJu0YwD3GtzJAll5HJGUJfliVh5pNNvBrTzsaWd51UMPg5WjLMuT3QQ
	7PF0PM1JJOsdCXVwYF4qCtfXB4B3H3kDMi7RO4LfpV8RPGJKT3mK+MWJlCa3Gw==
X-Google-Smtp-Source: AGHT+IEGoczMod+dsnL7adnGmvhSh1eHjlM03Qs1NijvAz6fHHyauYMIQZcr1BsMS1R4JRu8iS/Smg==
X-Received: by 2002:a05:6a20:3d8a:b0:1a3:2b9c:9791 with SMTP id s10-20020a056a203d8a00b001a32b9c9791mr1421085pzi.13.1710402569518;
        Thu, 14 Mar 2024 00:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:04 +0530
Subject: [PATCH v10 6/8] PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to
 dw_pcie_ep_init_registers()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-6-14a45c5a938e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4791;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=a51syM47ClPRjjK9nJZyqAiavM5OunFIsMImjH4DoPw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvDqHiRrZ60+xiRvuW7IFNGKavGN9Ic8X+L4
 1LSqO5+opuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwwAKCRBVnxHm/pHO
 9U5dCACcjLPUojUut4+RcYSTAPL+b1wo6pRrXFxNAQjfyMzNdnlMyQ72kbnygTj/hdL1jFbell9
 D9jtiTVWgqfKKthT43Pl9IvwekuN5xm2P2eLigs6SMyMOG0gluvaDIJOmJhw7HAZz/7PHC21tkS
 3/STFRRx++mrwsWFPF/bg0Gw4F3fix+dFhCtET2mLQskkHeUYl3hNhziW0e+oRvc2+q1dKrJmf9
 bTeWY+gVOFOTtqLJC2hBTykO/l6AbICZj5oHk2o0CcH8RzBAAHIco15rWGcuc6a/+4mF99kJVqK
 r3jTpmD+smOgHh1w48V3vMo+ytzSBMWQoxKccayBmibpujnb
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The goal of the dw_pcie_ep_init_complete() API is to initialize the DWC
specific registers post registering the controller with the EP framework.

But the naming doesn't reflect its functionality and causes confusion. So,
let's rename it to dw_pcie_ep_init_registers() to make it clear that it
initializes the DWC specific registers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 14 +++++++-------
 drivers/pci/controller/dwc/pcie-designware.h    |  4 ++--
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 4c21a38245b6..9354671644b6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -673,14 +673,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 }
 
 /**
- * dw_pcie_ep_init_complete - Complete DWC EP initialization
+ * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
  *
- * Complete the initialization of the registers (CSRs) specific to DWC EP. This
- * API should be called only when the endpoint receives an active refclk (either
- * from host or generated locally).
+ * Initialize the registers (CSRs) specific to DWC EP. This API should be called
+ * only when the endpoint receives an active refclk (either from host or
+ * generated locally).
  */
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
@@ -795,7 +795,7 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
 /**
  * dw_pcie_ep_init - Initialize the endpoint device
@@ -874,7 +874,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	 * (Ex: tegra194). Any hardware access on such platforms result
 	 * in system hang.
 	 */
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret)
 		goto err_free_epc_mem;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 351d2fe3ea4d..f8e5431a207b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -669,7 +669,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
@@ -693,7 +693,7 @@ static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	return 0;
 }
 
-static inline int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 59b1c0110288..3697b4a944cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -463,7 +463,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
 	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
 
-	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
+	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto err_disable_resources;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 68bfeed3429b..264ee76bf008 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1897,7 +1897,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	val = (upper_32_bits(ep->msi_mem_phys) & MSIX_ADDR_MATCH_HIGH_OFF_MASK);
 	dw_pcie_writel_dbi(pci, MSIX_ADDR_MATCH_HIGH_OFF, val);
 
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto fail_init_complete;

-- 
2.25.1

