Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442286FDB0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 10:30:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rffF7ZOb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpD2Q729Rz3vyy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 20:30:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rffF7ZOb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpCvP2RHbz3vbs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 20:24:33 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dcc7f4717fso42539525ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544272; x=1710149072; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKApz9irlhQK7YOF+8+xnE4LjbCpqvxzEctgkEdtmlY=;
        b=rffF7ZOb9kiSD155M6jjbFc/b0RdyBOipidyaxEdAVRYtTYJWQmbqv/TH6YDgN2LVp
         LQnR/to4Vmetf4X4W9NdGejMRjM+a+awvrNUEfjDabv1RQezdOdcMLfvGlkKs5jgYLJV
         XflCeqtllzAPod2M91QksV0O3odRjozFX50Ed3jkR70ux51n7eA5yd7V6UIsSZY8OaPW
         Lq8WOM8Agrt2OJFVSJcqMH7lwDM6anCDAHdVjQE5xNRvaD3b/0ya8tYGbjSK3jYNS4Rt
         oTyK59/OXHmtr83PQqPdhB7rWzXUVzd4et0z+NRCUi2HHUUac0nZawV0AxJgXCcwiDuz
         TA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544272; x=1710149072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKApz9irlhQK7YOF+8+xnE4LjbCpqvxzEctgkEdtmlY=;
        b=TbW3m3u7JzwyS+cdHl6p6ZdafvEFGB26rYbw3IPlwVhOe9lhvfiYNiAQL+MCL5BuR/
         J8iv4vrC/8PLxJ9pSs47vW+7yD2C9M2yg+G1lncN7mNNk39MMyxjukA/sumVARkxQBHX
         9muWuoJUl9eBWK/fPjJS8dbzfYrYQM6Ri2PR1GrrweZr3MIxMIyPBgZd1YGafRPXo0fN
         bwpZumpSbx4AXW+qjiqn6jm2s5IDw7WoPcqWfHFMuqTDyiZNaQ5F8ajOKEidHkPDtimC
         +X2VPz83MpwcdBNNm3YDw5g0ZwASXGURDDXGA6StRG1yHBtTNOXzSCPTXcV8JF5Mzx/S
         mgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTmNhdFBo8txKPZHiNQHIbzzfMP0I03bHfI1zZpZ1Iad+j1FJAeaTJMDjsjf9Ol749AL0JgY3Vf6Sp8U6QWFQE37EvNLTOxINMNVBvaA==
X-Gm-Message-State: AOJu0YyeYLErsz1418SDrqc9Q3yy+dw2rEUeE8z1S9bmIPUjNZHYxMaU
	UNILru4sxhWeMVxaUPCwvWVJxnIhgL0ow53La6AKWkdqd54PZAJIS5ZIJfQruA==
X-Google-Smtp-Source: AGHT+IF4YTs2Kpu6fiTzAPwNlCcr4XDNQmr1k3fHuS6nfsdDSGwckiq/zFRGje4c6qjRF2yf2DBhGg==
X-Received: by 2002:a17:902:eac4:b0:1dc:90c0:1e9a with SMTP id p4-20020a170902eac400b001dc90c01e9amr8888988pld.64.1709544271681;
        Mon, 04 Mar 2024 01:24:31 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:24:31 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:22 +0530
Subject: [PATCH v9 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-10-29d433d99cda@linaro.org>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6415;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=WjZ4+mNCQcDtI3R3bog3jBOb0ktWOFeqYYk+qv8ZsXo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLZg8bOTT0oLqT2NyAJQTr9HfKYG39kFmtg5
 A8RDcaHmcWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS2QAKCRBVnxHm/pHO
 9TY+B/0Xiw9hnMzcEVTeRvv8fKNAVavUTvd5zFLasDuEhWvi0JO11ciyRYx/3nt9Ja8JvlO0BvF
 h0r6OeL7IYvOCK4+Kwge1yDe6dgYffR3GliEE2SM4sQeWooBXVIG6+ZMbQIzKQibR6JIyQdHTXV
 G8VAyGwZrDSeRml2FSKFinvZtWDMJTDT2at/hXCDymbTPlt6GuNHQgS2JcYsZntzQ329z3O2js9
 Oiak6ntiveYiUp/0yD+uEUOD6+Xs+N1dlkMCyTtdn0XNdEnJsuElNOu5XmqT15+2CKbNdnX/c7u
 e8TKDLhkdT+mckGJbCwwrX3aJWMus/GGWoKLqsrN0DJJVSA2
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

All of the APIs are missing the Kernel-doc comments. Hence, add them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 94 +++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index fed4c2936c78..1f33f2929c2b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -14,6 +14,11 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+/**
+ * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization
+ *			    complete
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -22,6 +27,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
 
+/**
+ * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
+ *				 the endpoint function
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ *
+ * Return: struct dw_pcie_ep_func if success, NULL otherwise.
+ */
 struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 {
@@ -52,6 +65,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+/**
+ * dw_pcie_ep_reset_bar - Reset endpoint BAR
+ * @pci: DWC PCI device
+ * @bar: BAR number of the endpoint
+ */
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 	u8 func_no, funcs;
@@ -431,6 +449,13 @@ static const struct pci_epc_ops epc_ops = {
 	.get_features		= dw_pcie_ep_get_features,
 };
 
+/**
+ * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -442,6 +467,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
 
+/**
+ * dw_pcie_ep_raise_msi_irq - Raise MSI IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
@@ -490,6 +523,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
 
+/**
+ * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSIX to the host using Doorbell
+ *					method
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 				       u16 interrupt_num)
 {
@@ -509,6 +551,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_raise_msix_irq - Raise MSIX to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
@@ -556,6 +606,14 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
+ * @ep: DWC EP device
+ *
+ * Cleans up the DWC EP specific resources like eDMA etc... after fundamental
+ * reset like PERST#. Note that this API is only applicable for drivers
+ * supporting PERST# or any other methods of fundamental reset.
+ */
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -564,6 +622,13 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
 
+/**
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Deinitialize the endpoint device. EPC device is not destroyed since that will
+ * taken care by Devres.
+ */
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -635,6 +700,14 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+/**
+ * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
+ * @ep: DWC EP device
+ *
+ * Initialize the registers (CSRs) specific to DWC EP. This API should be called
+ * only when the endpoint receives an active refclk (either from host or
+ * generated locally).
+ */
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -718,6 +791,10 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about link up event
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -726,6 +803,14 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
+/**
+ * dw_pcie_ep_linkdown - Notify EPF drivers about link down event
+ * @ep: DWC EP device
+ *
+ * Non-sticky registers are also initialized before sending the notification to
+ * the EPF drivers. This is needed since the registers need to be initialized
+ * before the link comes back again.
+ */
 void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -743,6 +828,15 @@ void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
 
+/**
+ * dw_pcie_ep_init - Initialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Initialize the endpoint device. Allocate resources and create the EPC
+ * device with the endpoint framework.
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;

-- 
2.25.1

