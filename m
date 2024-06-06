Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961AB8FDFC8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:31:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DeXP2w5x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvwxg4nDCz3d2N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DeXP2w5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvwsZ5jQhz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 17:28:02 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-703ed15b273so516359b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658880; x=1718263680; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPG+iYxST5I5DbJlxvzuCXfj8r8tlsuRAuVmKBt4I54=;
        b=DeXP2w5x8BmrixB7LhJ7r7xS3ivTW5AkUFS88Pp3ylN3s0kxtP4t20Hzqe5dHgxacJ
         Ixec8mm6OsleDMh4Vw9euJO9ltWLVJ0x5GQXX4HqKwhwVkAziXeDOvcLakOhpP9k56At
         XJ5Af/SQchlcbw1JBnC8QcVh6LQmoMfhZZhdXacyzKqzwagFrfplX5BSS8qPFKRMlx6s
         pVU0/l5aNNRiYoz+qad+Qt1M84miUptpx5TfQaTeGg8T8hd4F6D5ISetB/qpChTCPvWd
         FF5Hly1F6h8zJeEu18KVV+I6YaZJQM9JNXujKSnMJboZaEBw/nYGjq031e1evZWCyjFZ
         e+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658880; x=1718263680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPG+iYxST5I5DbJlxvzuCXfj8r8tlsuRAuVmKBt4I54=;
        b=DqPyoy0Op7m0Ks/vcel8a7w6KG4kHdMLaWC50YImCAqH6UujV4C4pNQ9BeKmpm3iA5
         HwYDdZFY7nfDQgDbirDAw+31RMWZ7OT0UdiVpIE5Mmw66L8vdKJVgrCkCu18l/zZ0JlY
         QpzB9L6F8KkKthAWAHmY+f/08nKLgFIw1g73tU2ttAK425BuRddoQl2Tf19JOcvT+GH+
         nEt5TiAdK3yn65vTe6R9l7CMl1Wl3oEmqRxqXkZbyRXtPOWP/wTgOMiK7CCCQdlzohqS
         0TUEQTx4+nYTesOlAx+pr3TzpM1dJz5Cdnx1/Yiqtju68hxQT4+9F/fXXEpt/DKlrMXn
         b8lA==
X-Forwarded-Encrypted: i=1; AJvYcCU+CUpJ3qPm55V6AImAu039kyRBibx0VIrI1PKhiR0R0eMLLtZWC14yba0xqAY+qh0TLYNv5AFbEO2yk9VVa1yVXOoZLJoJjaeErfJCgw==
X-Gm-Message-State: AOJu0YxpCA9l6tuEmima82ZgyJ/P6F+FCyETlPqXJ6OJ2gUBKaxF1SkW
	6z8ErO5PuE8/BFlvQV+c7iA2h1RK+QMKwVx/XQZUKkqAJP9Jdrg9OwB3dcvB8g==
X-Google-Smtp-Source: AGHT+IFcf9cgtatPK4aegB5pOtXP/U3r7+aHmKSySRB4gcmnkYTJLzQC9N/nujSZyq7rntRegQ9fyQ==
X-Received: by 2002:a05:6a21:9994:b0:1b2:2893:4c30 with SMTP id adf61e73a8af0-1b2b75a28b6mr5554701637.43.1717658880331;
        Thu, 06 Jun 2024 00:28:00 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:38 +0530
Subject: [PATCH 5/5] PCI: layerscape-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=iTBLcuvewMpJ4faEaIFRB8NCV5eK2XvDog669bY6A04=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTDAWlDlC+iP821vFRRCpXr79KN0oimjGpwM
 9zYQuHhq6WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwwAKCRBVnxHm/pHO
 9dUvB/4geNbdfN8AuZaua5Q6crO4wiBZbDIZpTUEWbj5cD3+PQgZdP2fszAcOMysVUd2LhEzvbX
 kN7XJZcOGcc8d4i5IFEjwKG/dbhVt/tdxFru22kORqs05rEFn8+aFrQwhtSGaYkYgqYgRfP5Y6W
 b7v2+d152TaxfMTEdc5KIpJ3NjqVYBYvg2Gm5ndnVM2TIBPLBmyqzyiXOFEURUukShXcXr+j5P5
 wTPHtr9arU74ONCvNRavuhdpDxwvIoRgVqCiA2vDPG5DViOV2w7sRHoLC0PIvLJstIr0Gh5lZUc
 0TbWhXew/SfM3kcXGjBTL99FKexWWdBkpH4rAOvlZ4HUiEBN
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
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/linux-pci/20240528195539.GA458945@bhelgaas/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 35bb481564c7..a4a800699f89 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -104,7 +104,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dev_dbg(pci->dev, "Link up\n");
 	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
 		dev_dbg(pci->dev, "Link down\n");
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
 		dev_dbg(pci->dev, "Hot reset\n");
 	}

-- 
2.25.1

