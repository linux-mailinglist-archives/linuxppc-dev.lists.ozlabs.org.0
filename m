Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F08FDF9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:28:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y6u04jba;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvwsV5hNgz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y6u04jba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvwrl2dtvz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 17:27:18 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-702548b056aso526468b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 00:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658830; x=1718263630; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vATXyYpxDoxuMBWGCsFFKBvV2FwTY9tS2i2Q/lEI70Q=;
        b=y6u04jba3ev9MsTLNhLWoSzfgXzq2LnRJbi5EaJYWdooiSExgmUY7GPCxTjKo/+iOh
         W+Cx/URaQTlSN6jgYuRL2CxtsIQGZL8+/qrOukID6rrVFa3Iw/lqR4tn2FSs0/kf5/iX
         Su03Z7v15egX5chUmAgK1oJgIMIlmBQbxvRt0V82WqpCPUFQTjJVZHHAvY+lVJ+znCUA
         9PoccQks96086iC1OBMscc+vRaQkNEh2XCR1eTAHpNNaj1fInNLsail4r8iNUqpL83Se
         ikUyZuCtDCt0x0oO9h9Z1+lNeLFxs5mL+2upvDEcoQiRdvPqSwRqK0UNoZdbNXtw6Ats
         Gz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658830; x=1718263630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vATXyYpxDoxuMBWGCsFFKBvV2FwTY9tS2i2Q/lEI70Q=;
        b=j4lDVulEnWtsSqV67QzWcqM+YTq4fKtZBV7ePZwigtA8NfiKaCLK64+x2j8mVmoXu5
         MWx7BX1tAj7T1JQM5FSTnkgVzRKWAZ8QTO92lfc0jpQJI2Pk2p7qPJWcPBjz69NhEvyw
         JWfGbslCyXNFYOP26SZk7mooRrEkD3VITG/VazQzWIOrSMF0j9hCV+nScxvRY+zetW9X
         F2uweGn9tlheeguUkc3eYd40NIW8LaJ0MCIzFRb/sEHI6yOX4ZFGFeySK4mTA/rbko1n
         /NAdOpwnxI0CdDQgapd8bWsrGRhAPX9SAoap+G5mi4UxiGEzw7a/VDX8d3g7IaAXC9p8
         HORg==
X-Forwarded-Encrypted: i=1; AJvYcCU4kIlyDZH0D/9udzvDlLIeZNzgBhGOORGgKYQkaM7/PF4DQP2MvjrQ530s40+F3GvNx+S75CiQr2DXoaHrjdVoLJCaecumv+zh57Cjsw==
X-Gm-Message-State: AOJu0YzKlFtNIFUt0/DLN4C/JSqFPPibrpnukhX0CkAk0rtHTZZOKw5l
	DAKGnfnnPtF8/wtnWTzNoOeslObzsZ1BWuHv9y0rrcy5sKRW/Z35J/L0cq4Yfg==
X-Google-Smtp-Source: AGHT+IHaMKRV/ZyBSrUsIgLazsPnTH6mNPZ8ByD6J5KfGegSjHhh2dqKlKHNCqkvzSpa+cIabaAPcw==
X-Received: by 2002:a05:6a20:da9f:b0:1b0:278e:34a6 with SMTP id adf61e73a8af0-1b2b70fe1f0mr6173863637.49.1717658830110;
        Thu, 06 Jun 2024 00:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Date: Thu, 06 Jun 2024 12:56:33 +0530
Message-Id: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlkYWYC/x3MQQqAIBBA0avIrBNUYqCuEi3KGWs2JhoRiHdPW
 r7F/xUKZ+ECs6qQ+ZEiV+ywgwJ/bvFgLdQNzrjRoEGdvGhiiXJrx+gp2J1wCtCDlDnI+8+WtbU
 PTiaPVVwAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=eTnUwNkDQXdrC7n1JvpcvTENi2pHuNndoBzQaRgPaoU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTBvvClBeGF7FTQylWzbsg9oVTTskz2EOoBn
 Zt4GVpYgeSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwQAKCRBVnxHm/pHO
 9dwUB/4/uHuy0pOtmq60P1UyLiR+MH2npT+bFuWCf8fMwExCiwaeJHYifh0b18wJgThFXn7F4Lo
 iuzlAa23KRnrAiq/e0hvZmPmnM30g6EXNbW7THksJEFxLdnoSpeyIWg7uIsVak75r1nSfHIKqNj
 sSx1fUpQvxDgWYY+56ZvpDp7KZ40y4MG8iSOv2wVwPGgxgpugNKqY2ogX1366QUpjBOM1clCvwA
 tuS3Xry4kqdFn3bu9TsWOL4HoG/3r+VB7RwuZoMAOe7z17rawzf4OiRQF/WwQO6VgQomU+JUIBG
 hI3tDABYUW5C9SooxoFvxoHMbJIwb5/mXxW8M6dlQzXxeJpS
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

Hi,

This series includes patches that were left over from previous series [1] for
making the host reboot handling robust in endpoint framework.

When the above mentioned series got merged to pci/endpoint, we got a bug report
from LKP bot [2] and due to that the offending patches were dropped.

This series addressed the issue reported by the bot by adding the stub APIs in
include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
[3].

Testing
=======

This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
connected over PCIe.

- Mani

[1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
[2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
[3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (5):
      PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
      PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event

 drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
 drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
 drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
 drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
 drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
 drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
 drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
 drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
 include/linux/pci-epc.h                           |  13 +++
 include/linux/pci-epf.h                           |   2 +
 18 files changed, 162 insertions(+), 68 deletions(-)
---
base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
change-id: 20240606-pci-deinit-2e6cdf1bd69f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

