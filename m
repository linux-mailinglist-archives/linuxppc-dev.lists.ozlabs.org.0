Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1C87B8B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:49:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KooVb+PR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKJp4hJYz3dXb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KooVb+PR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKJ31ZkTz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:48:32 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dd81aee2b4so6564715ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402510; x=1711007310; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyf14pBAhDhhFGrYWiT4/jCBlK7mnjlUhjZRxVjfPSE=;
        b=KooVb+PRn6fUq3YDECZTo74Wu1z06aZSVwzSV3DdwclgrR8vJL1O0grGEJnOuL5+RA
         9al/RFmzJdWJbaDcXaEYnxMmS/Z9o6mgdPrEnITVuG1lOsvzssyAkZBl43KWnUem2H8I
         G7mDYhvVznKa0et/SCnnDh5fo4MOGYavHnndhj/br6b68bBUH1yuP/7NGp/pTNP9XXfc
         aL60S5yWY6qzDX8AvO9ME4fhKuQCK3Ecrjo1eBfK+QOgEc/9z4Y/ACFND4lA1eMhwoKQ
         Ci6PkwttmXd3sAoZZIw/YrISkHtm9sCjBCrO9Fq0PVriGHnm6ERDvaRuV+HAGY1rMrBy
         vgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402510; x=1711007310;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyf14pBAhDhhFGrYWiT4/jCBlK7mnjlUhjZRxVjfPSE=;
        b=YsQ7qvsiG+F4vv+u4uMkWMZBCG9ODdJYjbQbMDhq+UF9jT/XBkMO7W9VXQstWzTQ/C
         JH485WGzW4Ga56jZsNYESWHwPZG0qvxEraVsBHnpF095bwnAWZPZzBgZ0WUpFeVJrAQm
         v7RCH2Sb4dvQZyXYQ9sPYwzm56VZNxWQMVhVpCV13xplnRbUBSdR2pRNks6G8idXGMoE
         Ope7ci3Re62iQa/wQXeyuthoTNWV63EimTjynRkhMyiTKkxLDgFSNqz4JtKzTVlJcIFe
         cfu1DcFBkRNklQbugJx+kkuEJzXC5rAKmUd3YFWrVdtzQpX50T4BI4P/PHkRfjmsNqfW
         tzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVU8hyH0+7YVndis3xFhBIu6mqiWF4/kaw/YJyeFf1CjbIQFJ9oOA4dO/wQhGiovaZFcF9E5qwMUTHc6qIAYM0833hsBKU8vnvRxAyxw==
X-Gm-Message-State: AOJu0YzIlZVgQdV5jNaVdWQC/GfWdlOCwdJWTscEBGtiLtstrN3bTZnG
	S8vo8ldR5YSNccieJh1vis5T7XxtepALHzA/tZPwsFrxr/syZ15OGA7O4HuoFg==
X-Google-Smtp-Source: AGHT+IHz3ApD8+Ag/UOw/XWndm/T4na831Alez5sq3zZZs/lnsbW8ewWPcqsjnUpEFsiAEl5A/gcNw==
X-Received: by 2002:a17:902:ea11:b0:1dc:b003:ed7a with SMTP id s17-20020a170902ea1100b001dcb003ed7amr1318928plg.5.1710402509983;
        Thu, 14 Mar 2024 00:48:29 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:48:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v10 0/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Date: Thu, 14 Mar 2024 13:17:58 +0530
Message-Id: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+r8mUC/3WNQQrCMBBFryJZG4lJqB1X3kNcpMm0HZSmTCQqp
 Xc37UZEXL4P7/1JJGTCJI6bSTBmShSHAnu13Qjfu6FDSaEMQittldZWjp5kaEgyPiJfZaMRwFU
 ajPKiSCNjS8+1eL4U7indI7/Wg1wv699UrqWSlfWHNijfYmVPNxocx13kTiytDB/fqF8fiq8hW
 GMCgA/uy5/n+Q1fJbfg7gAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5493;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CggBA8aNWTDzfwGQGM+X6nkpKcrObdtq1F7g5VVbJk4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvCA+hbuErSsdUxYM/Lde4n06sZJbHaIBKNC
 8nJfIS8fkmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwgAKCRBVnxHm/pHO
 9VwoB/4/YSDH0OxycdTz+m+zTBwOkP9kDksqJ7fTZ8ohVBh+E6wqWXDKMNYO+ayZ8bcRM5gwWqO
 xVhFD/94EoJokvdBK00d5aAyiOh1MrIqbQrp8rZXXPKP5E50A3ldvsjpOsTrSEwM6l+xMhXXEDf
 Y57gm8cAqrLQaGwORGULOljxnq/C5MA+fvbaNms7Ta68l7azhsVM0DGHv22dJ1ScdDjLimyf0Pk
 Q5SNSDdLgKWRPY5ZgFuI49uJrQbXt1fnD5ieYR6nRx3lj8q2kyjjTa1gxTLRPyeEUyRaowCaCHY
 AV21rFKLO+7V3TlJtv+kWd8A+0dXYJyecRtGRp2UYwxTZPpx
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

Hello,

This series is the continuation of previous work by Vidya Sagar [1] to fix the
issues related to accessing DBI register space before completing the core
initialization in some EP platforms like Tegra194/234 and Qcom EP.

Since Vidya is busy, I took over the series based on his consent (off-list
discussion).

NOTE
====

Based on the comments received in v7 [2], I've heavily modified the series
to fix several other issues reported by Bjorn and Niklas. One noticeable
change is getting rid of the 'core_init_notifer' flag added to differentiate
between glue drivers requiring refclk from host and drivers getting refclk
locally.

By getting rid of this flag, now both the DWC EP driver and the EPF drivers
can use a single flow and need not distinguish between the glue drivers.

We can also get rid of the 'link_up_notifier' flag in the future by following
the same convention.

Testing
=======

I've tested the series on Qcom SM8450 based dev board that depends on refclk
from host with EPF_MHI driver. It'd be good to test this series on platforms
that generate refclk locally and also with EPF_TEST driver.

- Mani

[1] https://lore.kernel.org/linux-pci/20221013175712.7539-1-vidyas@nvidia.com/
[2] https://lore.kernel.org/linux-pci/20231120084014.108274-1-manivannan.sadhasivam@linaro.org/

Changes in v10:
- Reordered the commits by moving the independent fixes/cleanups first (Niklas)
- Addressed several comments from Niklas
- Moved PTM register setting out of dw_pcie_ep_init_non_sticky_registers() (Niklas)
- Addressed the issue that EPF drivers were missing init notification after the
  removal of core_init_notifier (Niklas)
- Dropped a few cleanup patches to be clubbed with the follow up series
- Collected review tags
- Dropped the review tags for patch 8/8 as it got changed 
- Link to v9: https://lore.kernel.org/r/20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org

Changes in v9:
- Incorporated changes for missing drivers (Niklas)
- Reworded the dw_pcie_ep_cleanup() API kdoc (Niklas)
- Reworded the description of patch 6/10 (Frank)
- Collected reviews
- Link to v8: https://lore.kernel.org/r/20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org

Changes in v8:

- Rebased on top of v6.8-rc1
- Removed the deinit callback from struct dw_pcie_ep_ops
- Renamed dw_pcie_ep_exit() to dw_pcie_ep_deinit()
- Introduced dw_pcie_ep_cleanup() API for drivers supporting PERST#
- Renamed dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
- Called dw_pcie_ep_init_registers() API directly from all glue drivers
- Removed "core_init_notifier" flag
- Added a generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event and used
  it in qcom driver
- Added Kernel-doc comments for DWC EP APIs

Changes in v7:

- Rebased on top of v6.7-rc1
- Kept the current dw_pcie_ep_init_complete() API instead of renaming it to
  dw_pcie_ep_init_late(), since changing the name causes a slight ambiguity.
- Splitted the change that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify() to help bisecting and also to avoid build issue.
- Added a new patch that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify().
- Took over the authorship and dropped the previous Ack as the patches are
  heavily modified.

Changes in v6:

- Rebased on top of pci/next (6e2fca71e187)
- removed ep_init_late() callback as it is no longer necessary

For previous changelog, please refer [1].

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (8):
      PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
      PCI: dwc: ep: Add Kernel-doc comments for APIs
      PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
      PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
      PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
      PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
      PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
      PCI: dwc: ep: Remove "core_init_notifier" flag

 drivers/pci/controller/dwc/pci-dra7xx.c           |   9 +
 drivers/pci/controller/dwc/pci-imx6.c             |  10 +
 drivers/pci/controller/dwc/pci-keystone.c         |  11 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   9 +
 drivers/pci/controller/dwc/pcie-artpec6.c         |  15 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 238 +++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  11 +
 drivers/pci/controller/dwc/pcie-designware.h      |  14 +-
 drivers/pci/controller/dwc/pcie-keembay.c         |  18 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  28 ++-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   5 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  15 +-
 drivers/pci/endpoint/functions/pci-epf-test.c     |  18 +-
 drivers/pci/endpoint/pci-ep-cfs.c                 |   9 +
 drivers/pci/endpoint/pci-epc-core.c               |  22 ++
 include/linux/pci-epc.h                           |   7 +-
 17 files changed, 332 insertions(+), 111 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240224-pci-dbi-rework-b2e99a62930c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

