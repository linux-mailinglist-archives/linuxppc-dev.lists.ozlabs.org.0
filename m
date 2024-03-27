Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DD88D9EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 10:15:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSZ3k9IP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4LcN6HLhz3vdJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 20:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSZ3k9IP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4LZr6R0rz3dfy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 20:14:12 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-29a8911d11cso3636569a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530850; x=1712135650; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+x0WiOVlEoxEWj6JmzpWEM32pTOAvBFw/2lqI7CQ3Y=;
        b=DSZ3k9IPb3yHaQYa6lEOTNmqnHZFeRJVISjVKpr7sGPan+8hJEo7/Ierkjw9fnUhhX
         FzGP/4kEbdOzw03m4fF6/SUSXHLXEyXVdDPJp6oIaZ6XKwc0mLzsuEywp9+B8UQTal8q
         w15y6jyp8bhZowOpJaBnTiBiFR1Nv7P9CGJ9LO7K5zd67pI8+RaeZBuTjmBu01zdpcpx
         806I18glTYgfhz38wnm026rUBJq0q3N3DmsEf4spzS70bF/v7GYYDDhUgurxX8Zjq5K1
         jf2EbYOqET9046800rIVH2a2HEAkb9Y2mQAYQUsU3jgD6XzV+PunvhB5JyL9soTVyO3h
         neqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530850; x=1712135650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+x0WiOVlEoxEWj6JmzpWEM32pTOAvBFw/2lqI7CQ3Y=;
        b=nLqgLy1hJ0M0q4CSdgfTSfY0wBEyJe13hI/29oqEmUIMryWOrxeHfgco3ZWLCpT+10
         V2y7iXV38XXso+GnAEy9MuqcK7TAMu/SOKQLGzFmZl9ajV3du/P86TLyLuyWgkDen/+G
         3oVr8NE8pkVVYRJAmPkgmSRMUJiKwdAMQrU8SG51mFTDJZDvcIjA62247bRNyBXB4Ge/
         G9tCWYTKBUjOvfS+NH5VWzb+Zeu69MHA13GS//DC3sPOewHa/kunudGcHQF9tGKoWETj
         JTfOhRMoa/wMmqXy0GxN+QmOF5VSVEM2MvN7PutaAciWxB9YXYl5Z0JDUc3a+BHMxlFQ
         TWzg==
X-Forwarded-Encrypted: i=1; AJvYcCVoxap1fcWPs89oQUEQu+ZJe3tBs5jqLs12DiEXTLwJGxLpwdsuMzUw9sl/2cfBLxCaHEJMUa2jnON+AERu2mxwC02/RugVTxD8q6bfZQ==
X-Gm-Message-State: AOJu0YwuKnbwQCXcIakiskx8J3vS9GgQBUY6U1xeWWaxv13tNaJBLzhT
	CyMvw/LVQ/nB1fFwa6bRNji2BCLydcHF8rih3/NKzLi5pv27WG63KuWPDs7UsA==
X-Google-Smtp-Source: AGHT+IGgoOBDdamY0w9pmOqmWVWOcqQuZDgDIWGyjcZElUTVYGxdc7EmsdQmE4x6o3Q48n8wUoM2tg==
X-Received: by 2002:a17:90a:ba8b:b0:29b:961a:29c3 with SMTP id t11-20020a17090aba8b00b0029b961a29c3mr4336581pjr.49.1711530849946;
        Wed, 27 Mar 2024 02:14:09 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:14:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 14:43:30 +0530
Subject: [PATCH v12 1/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v12-1-082625472414@linaro.org>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
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
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7480;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=C9itwwrFPiwdNm8Zd8w7cqdwK6rVpgcx54kNU3MQW98=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NIJnfXD7LMZio8W0A249GNJA5H9smQ0/YIV
 2Mbshx2fmCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSAAKCRBVnxHm/pHO
 9SFSCACcl92q4s6I4nZd3WCcfhQumw0iLwZ/wn0ylz4u11oziIW8gOj04TPmEFpvKK4yUo2H2gV
 emRIqlv3a2MowhrvoJ/FySPsqbtDFadni6vd5WA+H1hK0Cc5vAmsMuverqXHYM37THcdHfKjGVf
 dnUP8okf0Y594v6qqTsidArO8n/hzakaqI++awJiG9/LH8RFIR5CvkdtH0gnsksv9fhZJsmXJLv
 HHU5iUqaNDOnOKsBxS/m+1G5GP12FiFevRHj3ySuW/KGbiQ7rAc7qe76wzQXksTMbMWHBG7llAa
 aZWRSGu6qekGHKePMBoUsGEAOFcBvwCqKD8NKC0q7hQEWBg2
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
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DWC glue drivers requiring an active reference clock from the PCIe host
for initializing their PCIe EP core, set a flag called 'core_init_notifier'
to let DWC driver know that these drivers need a special attention during
initialization. In these drivers, access to the hw registers (like DBI)
before receiving the active refclk from host will result in access failure
and also could cause a whole system hang.

But the current DWC EP driver doesn't honor the requirements of the drivers
setting 'core_init_notifier' flag and tries to access the DBI registers
during dw_pcie_ep_init(). This causes the system hang for glue drivers such
as Tegra194 and Qcom EP as they depend on refclk from host and have set the
above mentioned flag.

To workaround this issue, users of the affected platforms have to maintain
the dependency with the PCIe host by booting the PCIe EP after host boot.
But this won't provide a good user experience, since PCIe EP is _one_ of
the features of those platforms and it doesn't make sense to delay the
whole platform booting due to PCIe requiring active refclk.

So to fix this issue, let's move all the DBI access from
dw_pcie_ep_init() in the DWC EP driver to the dw_pcie_ep_init_complete()
API. This API will only be called by the drivers setting
'core_init_notifier' flag once refclk is received from host. For the rest
of the drivers that gets the refclk locally, this API will be called
within dw_pcie_ep_init().

Fixes: e966f7390da9 ("PCI: dwc: Refactor core initialization code for EP mode")
Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 120 ++++++++++++++----------
 1 file changed, 71 insertions(+), 49 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 746a11dcb67f..c43a1479de2c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -604,11 +604,16 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ep_func *ep_func;
+	struct device *dev = pci->dev;
+	struct pci_epc *epc = ep->epc;
 	unsigned int offset, ptm_cap_base;
 	unsigned int nbars;
 	u8 hdr_type;
+	u8 func_no;
+	int i, ret;
+	void *addr;
 	u32 reg;
-	int i;
 
 	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
 		   PCI_HEADER_TYPE_MASK;
@@ -619,6 +624,58 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 		return -EIO;
 	}
 
+	dw_pcie_version_detect(pci);
+
+	dw_pcie_iatu_detect(pci);
+
+	ret = dw_pcie_edma_detect(pci);
+	if (ret)
+		return ret;
+
+	if (!ep->ib_window_map) {
+		ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
+						       GFP_KERNEL);
+		if (!ep->ib_window_map)
+			goto err_remove_edma;
+	}
+
+	if (!ep->ob_window_map) {
+		ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
+						       GFP_KERNEL);
+		if (!ep->ob_window_map)
+			goto err_remove_edma;
+	}
+
+	if (!ep->outbound_addr) {
+		addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
+				    GFP_KERNEL);
+		if (!addr)
+			goto err_remove_edma;
+		ep->outbound_addr = addr;
+	}
+
+	for (func_no = 0; func_no < epc->max_functions; func_no++) {
+
+		ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+		if (ep_func)
+			continue;
+
+		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
+		if (!ep_func)
+			goto err_remove_edma;
+
+		ep_func->func_no = func_no;
+		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
+							      PCI_CAP_ID_MSI);
+		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
+							       PCI_CAP_ID_MSIX);
+
+		list_add_tail(&ep_func->list, &ep->func_list);
+	}
+
+	if (ep->ops->init)
+		ep->ops->init(ep);
+
 	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
 	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
 
@@ -658,14 +715,17 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
+
+err_remove_edma:
+	dw_pcie_edma_remove(pci);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
 
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;
-	void *addr;
-	u8 func_no;
 	struct resource *res;
 	struct pci_epc *epc;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -673,7 +733,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	const struct pci_epc_features *epc_features;
-	struct dw_pcie_ep_func *ep_func;
 
 	INIT_LIST_HEAD(&ep->func_list);
 
@@ -691,26 +750,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ep->ops->pre_init)
 		ep->ops->pre_init(ep);
 
-	dw_pcie_version_detect(pci);
-
-	dw_pcie_iatu_detect(pci);
-
-	ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
-					       GFP_KERNEL);
-	if (!ep->ib_window_map)
-		return -ENOMEM;
-
-	ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
-					       GFP_KERNEL);
-	if (!ep->ob_window_map)
-		return -ENOMEM;
-
-	addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
-			    GFP_KERNEL);
-	if (!addr)
-		return -ENOMEM;
-	ep->outbound_addr = addr;
-
 	epc = devm_pci_epc_create(dev, &epc_ops);
 	if (IS_ERR(epc)) {
 		dev_err(dev, "Failed to create epc device\n");
@@ -724,23 +763,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret < 0)
 		epc->max_functions = 1;
 
-	for (func_no = 0; func_no < epc->max_functions; func_no++) {
-		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
-		if (!ep_func)
-			return -ENOMEM;
-
-		ep_func->func_no = func_no;
-		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
-							      PCI_CAP_ID_MSI);
-		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
-							       PCI_CAP_ID_MSIX);
-
-		list_add_tail(&ep_func->list, &ep->func_list);
-	}
-
-	if (ep->ops->init)
-		ep->ops->init(ep);
-
 	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 			       ep->page_size);
 	if (ret < 0) {
@@ -756,25 +778,25 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		goto err_exit_epc_mem;
 	}
 
-	ret = dw_pcie_edma_detect(pci);
-	if (ret)
-		goto err_free_epc_mem;
-
 	if (ep->ops->get_features) {
 		epc_features = ep->ops->get_features(ep);
 		if (epc_features->core_init_notifier)
 			return 0;
 	}
 
+	/*
+	 * NOTE:- Avoid accessing the hardware (Ex:- DBI space) before this
+	 * step as platforms that implement 'core_init_notifier' feature may
+	 * not have the hardware ready (i.e. core initialized) for access
+	 * (Ex: tegra194). Any hardware access on such platforms result
+	 * in system hang.
+	 */
 	ret = dw_pcie_ep_init_complete(ep);
 	if (ret)
-		goto err_remove_edma;
+		goto err_free_epc_mem;
 
 	return 0;
 
-err_remove_edma:
-	dw_pcie_edma_remove(pci);
-
 err_free_epc_mem:
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);

-- 
2.25.1

