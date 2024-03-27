Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56088DA11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 10:17:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUMbxhbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Lfv1b5gz3vZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 20:17:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUMbxhbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4LbT5r1Vz3vXJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 20:14:45 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so5487960b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530883; x=1712135683; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZiY/N9QWjiUSrWkYkKKgVbAI8JcvjPgGcqjy1l+QIE=;
        b=PUMbxhbEwrKTZExqLvlJLVvhCgyUQLawBsOL5wfr0LDfTDaM0NRFDp+Wn4yvUQn5nY
         4Drj22B37tMaIUqvUnkE70XIlxYzLRa5yiZmxJ/4MghAfKcD4HHqaNaXw0FwvxPjHCvV
         Fdf+/TxCtm8GrSR5ZUup9GCvTLj4VDCHpufOfft5EZjNWVvtXx0QJi8hycm0/1IQ93v0
         pDiLYeNNi5a83Xl9EYs4emviOd0v9iAJ2fqoUkTREyFEb5SsAdKrtpqM9qU9b2Hj+aiN
         TyZPN49ycHin/wpR8+wQhVzYUa1ynrosS4zvWYOJUoQJNGE9sRiHsit5kH5R5AfTftIa
         MYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530883; x=1712135683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZiY/N9QWjiUSrWkYkKKgVbAI8JcvjPgGcqjy1l+QIE=;
        b=kEh03CPSVpNLdaXd8ZJgTx9rkEwjIUAblxLuzutsuxuf/HB7DeauhCK9f5t5Xdp3M4
         lZdRNvEGhKONw6Lm3RlWFEoTZU5uBjgSHsxeJ1X8SDMUuqYvg1FfscpODwtkrkK6F43h
         IumhU3JSKKBAiutqlhxaLJS56t6hZ/QENcUPw5UoKOwVnZqcYAtHseJEqS+pTXD/jiFd
         RpRgl++EELyBbkIDJSQTgdT49hkQUz/yEoKOTDGkaXQyKI5dcqLrJye+24MBawxlIS9+
         ljBSfExAOc1EvyFTKrJ5Qrqg76Wm05dGpVHi07Wc95KbwTv1SpaOaW6g0fNJ78n+b/Eq
         OpWw==
X-Forwarded-Encrypted: i=1; AJvYcCXvpXGxY/J0xT2yA8ao/+CBGrtQNzfJ5TZSAp7qP0o7jL17iVQuI0g2yyYhwrO8Mn4UZdLJf18toHND2CF+m6Z5I34vc1lYovPylvNjhQ==
X-Gm-Message-State: AOJu0YwSBoWdnT5TqYIpyQRuCOkVHrv21gHT9m/hJFVvwQl/rw/GPuIC
	8bv0kwtmElM5e6/SQKzKJ58ZGphnoz5IhwOAb1T/vjqZ5l8CMIF0WR1WM30Baw==
X-Google-Smtp-Source: AGHT+IEhjrzAmhdc31Ckj+SKUIw8a5+ySLGll4S+n7ONvtok2U56QZlSSqe5kaYrOAdathooGe1xBg==
X-Received: by 2002:a05:6a00:2d25:b0:6ea:bf1c:9dfd with SMTP id fa37-20020a056a002d2500b006eabf1c9dfdmr2337979pfb.27.1711530882957;
        Wed, 27 Mar 2024 02:14:42 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:14:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 14:43:33 +0530
Subject: [PATCH v12 4/8] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v12-4-082625472414@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=xGVEiZ7J2TIauI1NZJAP+R7IoNGzHRfiU2LIamYdE4E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NJFpiteOu/bMaZydpCj3T9fJPQVQN/vgf+I
 pB4YUgDlCSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSQAKCRBVnxHm/pHO
 9dD4B/0TWr4d5WLYoGlJRNd23GLjZofrVBBEdotNf5AQj9lgW1AwbW1nJPy48qrR6OmFgqtMwJU
 AoJRwRrLJd44NPcLVDU7k1DLcM2L6J0jwgpyc83rrCjVdhTIpCqP17u/lg9Tr6o3FaJWRAcR3qd
 UZ29lpeYmZT6uFNuM/VvklfmrSDKH/OoNtDQLszOKd51l/lmKCjdCnM+OEW5UuXSGNNMi2AJGCU
 4jyHZy/eESG8OMB4JoGH+B4jhUN1g55aJd+iEVEAHtrh0s/RQs3/EjMpe/ktSaRupYnD/Sa2eTH
 FDYOiC3JgEjJ7H5spaG21OJihpC5FZLMmkOI3TsWwwBuyCMC
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

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index f06598715412..d87f7642d7f6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -620,13 +620,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 /**
- * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
  *
  * Deinitialize the endpoint device. EPC device is not destroyed since that will
  * be taken care by Devres.
  */
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -638,7 +638,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
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
index 5d29c4cfe0a0..de4bdfaecab3 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -432,7 +432,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1

