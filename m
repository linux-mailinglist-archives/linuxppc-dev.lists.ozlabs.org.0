Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3DA88D682
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 07:38:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=chJHvg3L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4H6b3NF6z3vZr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 17:37:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=chJHvg3L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4H5C3VSsz3dWd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 17:36:47 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1def3340682so52865095ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521405; x=1712126205; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms4/cCoO9t4kQQ5ANCu4uj6Ldb1VzG42n8OC1+sLfgU=;
        b=chJHvg3L+n2MZjjjrImswFNVOWEdhyAdrzme1kGgkA1dYYCQAEpIlGl7QYF2HoJang
         CaKdEfPEHTviY7D4MhqqaOlvlxYkdiJrhPp8Rlj4Jtryw/XVJOBRwQBLT6eoBot+m5nt
         pMxwK4jQ3LCj0tsJSp11ZivpLazoH55ah/Z8DsBuh48ZWPkHRQ/gTyph5V0NK0M13pHv
         vLeRo0ekfcueIIrwVtNCRPYEZdVhTOvg8uKG/CBP3DAQ4mT4KmCStwwUAlpGivQxvvpn
         VlghXhU13wd0Jq4bLqHqWGDXCNEyTlbAnQaxVieggRWu7cBNoCkAOm38U/BtnYL1BmfJ
         SPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521405; x=1712126205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms4/cCoO9t4kQQ5ANCu4uj6Ldb1VzG42n8OC1+sLfgU=;
        b=EKChWM4H8iOy2RkS5OmYC8ud12P9Dwdrck3+k+MGfyctby0hAOVgpCF4b2sdjdI3mi
         LgMrUEKUaqiyTkPcYdK1SGoPzNFhdVyw/UnFZL6pLp+C29PIkMMWFXb7j0fpSV02Wiqc
         YlgxzGNYAQkdFbEOIeVo5iS6JvlCY/fVSvqutjuWGtmEwlpNE7PyZ/3UXejBz0g97kep
         Vvcb6Hw9xrsufDW8iIDxle5fvsWerUJ/x6NYVPC25eYmAWvuyWW9vPyQ77ZzfNIkSicN
         TX48T6G+orQfhAlJKkRpoegi5qhfyDyAZOGd0BksXwLK5zq8yG8QG2ZCwzT9g1V0a0be
         JSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6LqCGDA1XICTasml339OnTsgOG7QV4RhKVjb7xRpMcz1GmTMxoqrz8J6E0qPgQndMg/+5lku3UlRUm/HkddF+OuNVcAXbd8d7YEHBdw==
X-Gm-Message-State: AOJu0YyxiStti+I4B7/RQpWxZyIb3kNq9PpITyooQBBrsoPoic7OZfya
	CVtf/1n/S623an3HH7oT//DDFSfNBQ7OLPBHeDOLRzA0W1m/zxqCcIkPTta0Wg==
X-Google-Smtp-Source: AGHT+IGfb/5qpheudJAFQDoQ+Y66yU71tsgjR+uPsTCQEqq4JR9dsREPelKP5MBglXDbwKKL8InnkA==
X-Received: by 2002:a17:902:f707:b0:1e0:2344:e8fa with SMTP id h7-20020a170902f70700b001e02344e8famr507533plo.66.1711521404473;
        Tue, 26 Mar 2024 23:36:44 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:36:43 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:47 +0530
Subject: [PATCH v11 1/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-1-6f5259f90673@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7480;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DDCZoLHduZCUgXgmwVWPg1p7qsh6fab55IAmfI5Ain8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75VejBfr07ROuibuxbZqYO8QEep5hEFy1PLd
 iQo+IXhdMqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+VQAKCRBVnxHm/pHO
 9dHbB/4pmhskP37BwSxqMzzmK2lo7rBUUac8PcmWoW8wwynl21raO/S4FPL7awE92Kf/WrDW9BR
 RZvUM9Z4LMenjrVKVui+wJ6/tXWnQ+OJAeMwrj/Yz1GsRPwAEAUvkAMg+StfG2iV93wlJTBUanW
 arD6jN7mVq4BqqBzlVqTWlsen0TVvepRtKLV0AyM/797EF5q1s46EdEJiVrA/B9ld+hUV+yc4+H
 7fbrLIoiKbMxJ3DzLmoLHrI+Xkw/bIOdJDr5Sej93a5n2mLLQqKRLhm/Wt+/flW0zD7h1E7MpsG
 I8lAs1e/d+QJDIVXKO1XqFNTIZfS7zW6wx+IgFuCMfjw6Y4Y
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
index 5befed2dc02b..c05304eabb89 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -602,11 +602,16 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
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
@@ -617,6 +622,58 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
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
 
@@ -651,14 +708,17 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
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
@@ -666,7 +726,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	const struct pci_epc_features *epc_features;
-	struct dw_pcie_ep_func *ep_func;
 
 	INIT_LIST_HEAD(&ep->func_list);
 
@@ -684,26 +743,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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
@@ -717,23 +756,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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
@@ -749,25 +771,25 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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

