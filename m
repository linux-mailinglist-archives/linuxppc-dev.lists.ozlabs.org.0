Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8B87B8E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:51:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kcApgJax;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKMK2Cxcz3dW2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kcApgJax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKJb3CDLz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:49:03 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso463657a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402541; x=1711007341; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFUDkoHyz9LeULNwW4yG5nE0pHh+5Z8GzIxjEBcfij0=;
        b=kcApgJaxNNpu6fc+3cx/vTUTFexJJ4uqS6awi7ml44VjeQ4xujnjliqLR8UyXRbIxk
         ph8CV49xRO7C4V5YnTcGnw+Fq1ntGalY4uexPDmT6K5lse37gajsYQ7aBsp4GoQ5ekx6
         ASDjyTDwQIkjHs89SjQxow5M6O2dUbc35rrcnp0cIzjAIzaVqntzT4AWfHfybgMhRBku
         ZeLJOc2EZ9ys9HUA+yRSdz8ExAlZc/P++nCS0200hfKHvHtnm7uaSMjA0C1yNceqUj+Q
         t5W+Nhm4ux+HzEEEXmA+02nWW6cP2jxzOrhds28O/7/WJQZh3fUcEQXkG74QQ9WaHbGO
         h0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402541; x=1711007341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFUDkoHyz9LeULNwW4yG5nE0pHh+5Z8GzIxjEBcfij0=;
        b=OO92jz3ZaHBp09yhPFBd8F0WUB+6AJXgrJ42kwUX9anpqMbx51HcE47IAnAFVbPX3d
         bcSJe6xN1wbg/0o+jBm+fcR1bDNr5A0yhtU+k5kGORGLF72pWopoGbZGqRAi5NOQPAAe
         mp4fSKvQbXBpUriPg0cnm9EUSzI4UUoRdKzJ5Mj2iaNxqYCNist2BXjd6TW6spoM/0+m
         MS6VEBenX35H7srdSZsiUr3qKYz2+Hd0fxFktAoS3oc6eNkuc6t8g4Ai1ogxGmkj++NW
         nPdDuHJuHhYZpre86PFQx6fzZFyrcbcbUgFTlfx3GYbPGwMJIGmqLQcW3VfilyzuLCAd
         QaMg==
X-Forwarded-Encrypted: i=1; AJvYcCXnKexScXoPHk8xn9nm4dODXXkBS3/i6LlO2+ggQmALKq11QDEaVoTH9fqlPxFB39vjQpYzmncDwXc/JI/wPntceQE2v9NWDEUnBdeRQw==
X-Gm-Message-State: AOJu0Yyz5NM6ryKq97QZYbn+XBjjD/E+pLOwiGyrmZJI+EJuDBaHUZPs
	rc5sEJXV/sImGTGqB+5JbvA4ygjjWQHVfegEZ+VePa5Rt6jG+VDY9pCAo6QR8A==
X-Google-Smtp-Source: AGHT+IHs4Bhh/4OuXN28jpY5wnBbg3xK6RZzdFlb/UX0jfTQzFTIEG8C65cm7rq4CMvhFndrlJ1Gaw==
X-Received: by 2002:a05:6a20:da86:b0:1a3:1255:6062 with SMTP id iy6-20020a056a20da8600b001a312556062mr1619514pzb.1.1710402540493;
        Thu, 14 Mar 2024 00:49:00 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:00 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:01 +0530
Subject: [PATCH v10 3/8] PCI: dwc: ep: Remove deinit() callback from struct
 dw_pcie_ep_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-3-14a45c5a938e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=WPirwW+iP8JXj6QFV6jVDyoSEOSnkNpLiBiLrW1qc0Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvCKfuwMrr9bE0D2e3SY4o91UOc9sK1+o7Zs
 Z0/s7TX9x+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwgAKCRBVnxHm/pHO
 9T/YCACqyABcDOmHJk4WNBebHLu5Y6KDm9gCJCw5vPnkWuwfYJgbNWctdcbdMXbFYmu6jY8ikco
 bFTeIwbF7LAv1eS04Z8WBRn3Wb0fsphqx1jtnjYg192W4jjXAsrN7ykWUlZgCpMFhcKT6ZU6mub
 /mwq36BcTt6BziUDMgJy+7t/JiQ5Qm9B+4EmUBHTLR0Ps71JvllypObGNUMhAPHFaZhN9cGQHRC
 Dm8WWudOf0kPmG/sC4FsDh4fYZFReR18FF4r5fZJb1UvhkpE6ikNCJC/bxOEO49vGn/kOZ1Csb8
 7sGfybl1xr3TbTLNi/NeIicMyhTug6HpStbjfSCL+DaIBVN5
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
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  9 +--------
 drivers/pci/controller/dwc/pcie-designware.h    |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 14 ++++++++------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d7e8f2dda6ce..e59e35fd7251 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -636,9 +636,6 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 			      epc->mem->window.page_size);
 
 	pci_epc_mem_exit(epc);
-
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
 
@@ -838,7 +835,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 			       ep->page_size);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize address space\n");
-		goto err_ep_deinit;
+		return ret;
 	}
 
 	ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
@@ -875,10 +872,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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

