Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29886FD46
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 10:24:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+3c60Ea;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpCtt37MJz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 20:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+3c60Ea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpCsZ5Wp0z3cR4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 20:22:58 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dd01ea35b5so6260945ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544176; x=1710148976; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek1Qy4Ek2Nyv1vPfoJh/C4U3d/HEVvBzxEIXrGxKmxc=;
        b=A+3c60EauIKy9B3pcb64xoqExm8LmarforE4JuQ2VRfJtj5tSqddR/R6olXiPKWDdS
         aVp15tnF5fNM2iUaCFfghJ38CGhNxSlgtj+GiKe1vnoyRlzpuan4WM6QspqXGB/hOAOh
         CwuKW301ubs3VzRu8vVA1epUtZMnXtx+3qXLiggGCg2nDyfetD2vP5v29h3tvo+tKiAa
         M36eVILuEevSgNvOVVfmUVtrm81CelAln28tKAPN4D3cNpu+tnGCvXZsQzoaHjdu4bRd
         UN69UaBK/bJ4vEbIJsPwhB3pjEEvKX9pqIoVyPqiucpOUzyAjyBCVLgDvOLpBMZ81YXZ
         YnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544176; x=1710148976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ek1Qy4Ek2Nyv1vPfoJh/C4U3d/HEVvBzxEIXrGxKmxc=;
        b=eYHfbmxX1G29ZmD+iUj3UDRcemyEc2bJ30jEKdT9R89NFfJua4GnzjdpWnIelIxD4j
         6KtA/NpLVz+uyoICVC8DTXw96W4Ri66rBNLIrVRJEgLSAt1L5EuNGqDvGZi6BofVUTp2
         gujDBdUFfPzExaqRfvyKv9fVwgO99KdmFhPRPJMOccpmgufd49aQ7E+b9FWoWJrCvv2A
         NdpAQQxtJxJ0UZgpXjxBJBRFIMzRaIAbF9MxLs3yo22VSibEuP3/nxhyk1j5REDEZa/t
         GIiAtLFOVf9qwjy2es+IF11qqCXGDwqNhQDlmnLntw0eJ3Wi1+B0QTGP2AURm/ppAsLs
         9r2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJRhBjplV691M3i1aoeGhvkKSpJKly7+jO5twM0hh9F4IT9OqI8Jt6ojc37slD6F7NYv+KfSspgxmKv3nbR9s5rXH/jcmNSqOUKjQiSw==
X-Gm-Message-State: AOJu0YwVVkiXMbkaBfO9VjHKwDiGp8Hfa1OozFPTWIj1swu4r+fsm/Zb
	JVIqXk3Aq9t6jii6sjOK5hd0L5NpQx5jlS3rqGQtUfOb22Vw7sWvBwLgSxzAPQ==
X-Google-Smtp-Source: AGHT+IHrW1nnKn5zFHDGAE9obK5VoI9v1UBB3lkaQWkKz5493qE/Xv91XP6mAleNZ+h1HabT6KzS1w==
X-Received: by 2002:a17:902:6841:b0:1dd:1b3e:cfd8 with SMTP id f1-20020a170902684100b001dd1b3ecfd8mr872464pln.40.1709544175757;
        Mon, 04 Mar 2024 01:22:55 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:22:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:13 +0530
Subject: [PATCH v9 01/10] PCI: dwc: ep: Remove deinit() callback from
 struct dw_pcie_ep_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-1-29d433d99cda@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4282;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=WU0wk1/K+4QF56nwGb7DSq5p2Pb40SPuCM19CB+TfJ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLWoeNHSgA3rdqm72xsW1XNv2ieGm8j3IInJ
 5hT8/Iv0UKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS1gAKCRBVnxHm/pHO
 9c2SCACm976tchHMTt/tn8F/AS6v2O73nB0OB//kHmXjK8Jn3dfXDmZjIpVZr8j0DxyISYzhi2C
 sJTjZmLM38wDS56xlP3Or1uXfTZrE5dsGWZxIf4W+IasJqwc1/isS8HtMzXFj2bXi9RBxuci9f4
 pQdKqCBOvoXfBcaL4Lm+pDULbbZ87a86TB4iuhxR4ZaUB3YXgQ6JvroMza6GuleNqCUAZiMacnd
 1sX8TC59fSUnKdPYwhInIMyNFv0ISnTgomJMX2p23WPV70SzHIXGbQ1XFwGX/DzkPq0IJbEdcOJ
 z5khpdo/K6BXwXL9nxH/IsW4yhMERMdaMSziwfE6NKGtsisA
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

deinit() callback was solely introduced for the pcie-rcar-gen4 driver where
it is used to do platform specific resource deallocation. And this callback
is called right at the end of the dw_pcie_ep_exit() API. So it doesn't
matter whether it is called within or outside of dw_pcie_ep_exit() API.

So let's remove this callback and directly call rcar_gen4_pcie_ep_deinit()
in pcie-rcar-gen4 driver to do resource deallocation after the completion
of dw_pcie_ep_exit() API in rcar_gen4_remove_dw_pcie_ep().

This simplifies the DWC layer.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  9 +--------
 drivers/pci/controller/dwc/pcie-designware.h    |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 14 ++++++++------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..d305f9b4cdfe 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -575,9 +575,6 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 			      epc->mem->window.page_size);
 
 	pci_epc_mem_exit(epc);
-
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
 
@@ -738,7 +735,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 			       ep->page_size);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize address space\n");
-		goto err_ep_deinit;
+		return ret;
 	}
 
 	ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
@@ -775,10 +772,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 err_exit_epc_mem:
 	pci_epc_mem_exit(epc);
 
-err_ep_deinit:
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 26dae4837462..ab7431a37209 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -333,7 +333,6 @@ struct dw_pcie_rp {
 struct dw_pcie_ep_ops {
 	void	(*pre_init)(struct dw_pcie_ep *ep);
 	void	(*init)(struct dw_pcie_ep *ep);
-	void	(*deinit)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
 	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index e9166619b1f9..ac97d594ea47 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -352,11 +352,8 @@ static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
 		dw_pcie_ep_reset_bar(pci, bar);
 }
 
-static void rcar_gen4_pcie_ep_deinit(struct dw_pcie_ep *ep)
+static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
-	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
-	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
-
 	writel(0, rcar->base + PCIEDMAINTSTSEN);
 	rcar_gen4_pcie_common_deinit(rcar);
 }
@@ -408,7 +405,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
 	.init = rcar_gen4_pcie_ep_init,
-	.deinit = rcar_gen4_pcie_ep_deinit,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
@@ -418,18 +414,24 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie_ep *ep = &rcar->dw.ep;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
 		return -ENODEV;
 
 	ep->ops = &pcie_ep_ops;
 
-	return dw_pcie_ep_init(ep);
+	ret = dw_pcie_ep_init(ep);
+	if (ret)
+		rcar_gen4_pcie_ep_deinit(rcar);
+
+	return ret;
 }
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	dw_pcie_ep_exit(&rcar->dw.ep);
+	rcar_gen4_pcie_ep_deinit(rcar);
 }
 
 /* Common */

-- 
2.25.1

