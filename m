Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F283A8FDFC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:30:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XE7qhoZu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvwwm0n5fz3d2n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:30:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XE7qhoZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvwsN0CcSz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 17:27:51 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-701b0b0be38so629732b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658869; x=1718263669; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJExdlshI/LzGxmgV0APY0jbCwHbAgtoC/BDFnsN7OQ=;
        b=XE7qhoZuPYB4fhjEZusV2QiVigXEGAZWRhFGQMngYEQkZo/e2+q2iKPwO2FYdpBwCK
         spzf74md1OLfNM63CsdpbdOqKrq1L/HlSU7Waw8FjfFeOM16SDCj1SEiK9ngHxaSJCEl
         rJW8TigGzJ4lPslTSTQwk/w2MCaTMCHpIDi3XhMw2oMInJxOSsxzHm2nNgvUH1l+LRmG
         tDI1rmedIosDqf5S/7xnFZLYCOQ2GTfkjJ+R6XGqR+v0D49OzU/ypcW8l7c7gb8MkJjJ
         UOovVGTNW3afw6EsPis75C5bEKDe3bhpek8ZJX0hoTqpfigEIzk+B5tjOTsoD2a0ojaU
         AJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658869; x=1718263669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJExdlshI/LzGxmgV0APY0jbCwHbAgtoC/BDFnsN7OQ=;
        b=k50iufmFrxJdYji63Pff1cRUjWZavqQKiEzMwq3sm8vdmI2DZv4UQ+JeZhI+vPC5WI
         yguAFIL4JvfuZVAxqw2cK2XSCWQyvGleQaIYKz9XfI2zkZcvQTPsVKHmUFKI0598mu1w
         moAnVyfGZGuiA3t205o9EQMwiaJ16o/NVRJZA5nSSvBihzeKaz31CUXC+RP6il7qZZx+
         v9Yz3fTxgTIoVVss+O2L0oZ+d4ptm4w+A2kGIVYt2hck1rSuvCyWV28cGG3UINFsgBUN
         6g23lCmnsj7mIQmJeDOofLh9e43rHt81uVaA01T3/XnpBd5m9wFbuy8YjpclH6ri/JI8
         N+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0TFou6tOilogbahmYTz5Ju97Fq8DjKDoQPvienFuvZgPwdddOTlNv7KZUjqP1Q0cey2ikcW62nuPaVfnH2SC42m64mqA4ybh86En0Tg==
X-Gm-Message-State: AOJu0YzfgT04CHgqnnnKjn5CF51z5bFfG/WYGO5Fx3/o7ijqdFYEzSoa
	Jq6jnIv8SCWzFBYfbrn5lQaAEmqRtALW7Pu4Gox7c7PKy9pTVTDQ+fXuGE0oHA==
X-Google-Smtp-Source: AGHT+IHE2oR5v0Why3yjnX38J4mrLlwOPGlZ2u6XUoxDRmSxOxrVfN+J6poCz9GXnIiql3GkZYmfXg==
X-Received: by 2002:a05:6a21:6d96:b0:1b0:180b:218a with SMTP id adf61e73a8af0-1b2b73ade98mr4841566637.13.1717658869466;
        Thu, 06 Jun 2024 00:27:49 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:37 +0530
Subject: [PATCH 4/5] PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown()
 API to handle Link Down event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-4-4395534520dc@linaro.org>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=O5xFzhtcTVsPW2oRgvJYNIDWPOdCoxabhuVw8QIdZvA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTCDD3Zk89+yzevKC0hNBYDEyFsV6QzuZHsh
 tHaN4WUEIeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwgAKCRBVnxHm/pHO
 9R0cB/9bA9491NDevYfqU5Xd3giwVDoj11ZyiC+uOfmItJ2Mqg+LjY5yIgYgU2b5u9eza2+qgOi
 4U0wQ++MHB3cRN8Qfi6FrDe0E+qa0KqH+kH+cY35umoGm8Zpgcx4MwJ/tMbjbEDe9tmPP6pdeeo
 aoRbCqLKiT7RwZIm/MH0OGPuFhv9nisV904RgEfR3gT+0Tpx3feFJWRFxSULskIjFCUOfubNx57
 A8RoeX3+G02D4OkIxrJBn3o6BIPuD8zGx+pfD2AEwZMjJAUhWsHsYx8R5f50vb+7YNWV/GhNkbP
 dPojiLZWnG6HfXVSNGT8M7+Mr1QS3JOavCuJ4pGNZfPAW5uG
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
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2324e56c9bfc..02a2a871a91f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -641,7 +641,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received Bus Master Enable event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

