Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34455862322
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 07:56:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r9K82lQ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Thd2w6jCKz3vd6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 17:56:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r9K82lQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Thd0j2RrBz3dng
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 17:54:45 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bbbc6bcc78so1054026b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 22:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757682; x=1709362482; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=r9K82lQ0/bUK4P7mNjVNcKvXo/SzR91Yq9rghgn7qKYyPNvvAQR8h4sXhFFZkraRf0
         UqAAV50F3HlH8rdI1umaX9CDZfO6YbCvV23L32wCrR1qTaAfJLKaKG7KRUfO8nCV66za
         05Iyql3V09AvzEiWlpfje8QNlRB5hApiLh9P3ld01qqrZRYulEG7T+GqV1r07aQDVbeb
         VJxSxL9cNDOdSJRIZUKlg5BIu1LZW2IA8zYwo3O4sD5IjSlNetFm+RWD53mBrxh7/SSZ
         JhKj4RrjDQq81FpfNAYWyylEgbkrwwH8qEEkEXkctfl1kF6Ji46N2FY9/BMFG5YEZ1sK
         5v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757682; x=1709362482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=mLT4ZQuZIjq2VK41ENa9TT9eaVuLTioSvFTpVHT2Z865ZxQxE5QhrC7jmJdKOl9QrZ
         cDbYF2oKri+hzHifzE3lMSeJU7mP9xZ3HPPezNN6l/6yyi+QB7UASITRRpGY5UHUr+CZ
         f8FbTUA9B5PB6QsDojIZE0JonvP9xUooaSnCLcjgdf8idA6/HT4kKuHRjsmYLzc7E9tv
         L9gEahWxvVx1o+4zAW92ipOJTYlmcwJ+Nggnc+nrfzBt1WY2z8iPHdhvq+Ii8/CEnpSP
         FXcFI6rWRzgqH8u8PxXPmhx+m6kUWI/IPt/NvvIv15Qhr9jBtwfdwvJQpXD4Odghi5J2
         +DSw==
X-Forwarded-Encrypted: i=1; AJvYcCViF/Ra+v1l3JYLHjh9PIc1UD7TEokyC5/Hz1QvKXswhpHAIUkH5Z8SAAHbEMIglszD8nfM9H9bhCAAGQ6bMj6gtvU8XQlCw6vQrYVPWw==
X-Gm-Message-State: AOJu0YwHq0r1VzPWX/ZXKmT5Yz3i7+r6LFokMuvemKBqdfOBvEx+R9aY
	tEPyQu20ayV/fMHY4MI9nIbuXzkj9pCEEXSahTn9mR9Xnfy+12yPupMrqtZnmA==
X-Google-Smtp-Source: AGHT+IFibM5pzclLgfVnWQ4q04YXZMJ7dUMTwZy1iwdyXNkxIyosF3kkQlye3pmzcpuyS0AlJbR0Dw==
X-Received: by 2002:a05:6808:2a8d:b0:3c1:823c:b1bd with SMTP id fc13-20020a0568082a8d00b003c1823cb1bdmr1832555oib.45.1708757682265;
        Fri, 23 Feb 2024 22:54:42 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:08 +0530
Subject: [PATCH v8 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-2-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CvKJcI2GoHpQh51Boj5towsTve0nBMUjEP2Ds5TPKjI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKWG4loyEX1PEXJOdKId2sdqeLbJUkwZLok2
 Moo1uGlljqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlgAKCRBVnxHm/pHO
 9brkCACCV3ENWKeo83c0pKegS+iCQkTVUm7uxJuMA4icLm9vKffetGG+G1medZQ6vUtnp+xYgM8
 jtr/r51Dpdvf/+tKOfvW4IfFsHykbamiHO0EN5/hNph48t8h4ieskst7PY1fFBtS4np9OCr4uok
 2H1aAYLQ7au5Qj39kSKXI1o1cG5U7d/0Y+Y7Ybq9nXIAJxMG4KlVOd5yQBd3U8HhJ9kkQ8mK6S5
 V2pdxgQ4+hLFmuLuSKFaHvhqXoBqmlzWvOkfrjprSZcR8R9suy6B2U9nEIDPsEj8y+xWBmaOevz
 tv7BLVrXYcdUd9VpmP7rtLOYndcgCDhDE45aRvv3dp1KZXTa
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d305f9b4cdfe..2b11290aab4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1

