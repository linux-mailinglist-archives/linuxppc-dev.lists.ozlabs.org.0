Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B817E29D223
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 21:48:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM0zC23L9zDqW3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 07:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0x95pNdzDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:46:52 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id j21so363641ota.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkYpsqioT7Tb7YApRr6kOuIOqhvTBzDRVXioLFVYRRs=;
 b=s5IvEnxFLdV6Zjc9OAeyFo2drtHpBk5dpbvzs8ADLWIfGhr8P6Ln8nvXq2kUFF32cy
 BBqcETb67CKYcEk8dv5FRBzcGDDvUF9iuskq8WcBBw5B2PBFdW0j1cibNDAeNRmJAmxn
 o4nTbZqlkFYPwyAxd1OErQYlqX6aFE2LoCGxW9lWr77qug1nM5ShxWb+F1He3QH4mXG3
 Oi59DjWfPtOcJARLPtgzL2WEmZUz3M4TLnQAP4OH8UMzXiEksbXN6yT7I3IVZgw3X6fB
 7ga3NCbqM0RT8NY0/GVrwnvnI6yEVPLsmxcPTUrFImug+6vPTJglmh1WAssSDuF+NOiu
 5hWw==
X-Gm-Message-State: AOAM530sIybUw80E9OcTb69DMxH0nv4CapHj5FIZw1Lc+8ACZlP78Fzu
 qxTJfysseygAWb//GyaieA==
X-Google-Smtp-Source: ABdhPJzUHZm4YYIM4XMiwc5sacukMJ5Sdrdk/i+veAcVoB9ovA+Vih+j4WmB8WVNzg3/epAFFNC3mg==
X-Received: by 2002:a05:6830:1694:: with SMTP id
 k20mr912314otr.100.1603918009773; 
 Wed, 28 Oct 2020 13:46:49 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 00/13] PCI: dwc: Another round of clean-ups
Date: Wed, 28 Oct 2020 15:46:33 -0500
Message-Id: <20201028204646.356535-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here's another batch of DWC PCI host refactoring. This series primarily
moves more of the MSI, link up, and resource handling to the core
code.

No doubt I've probably broken something. Please test. A git branch is
here[1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-more-dwc-cleanup

Rob Herring (13):
  PCI: dwc/imx6: Drop setting PCI_MSI_FLAGS_ENABLE
  PCI: dwc/intel-gw: Move ATU offset out of driver match data
  PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into
    common code
  PCI: dwc/intel-gw: Remove some unneeded function wrappers
  PCI: dwc: Ensure all outbound ATU windows are reset
  PCI: dwc/dra7xx: Use the common MSI irq_chip
  PCI: dwc: Drop the .set_num_vectors() host op
  PCI: dwc: Move MSI interrupt setup into DWC common code
  PCI: dwc: Rework MSI initialization
  PCI: dwc: Move link handling into common code
  PCI: dwc: Move dw_pcie_msi_init() into core
  PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
  PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()

 drivers/pci/controller/dwc/pci-dra7xx.c       | 141 +-----------------
 drivers/pci/controller/dwc/pci-exynos.c       |  50 ++-----
 drivers/pci/controller/dwc/pci-imx6.c         |  51 +------
 drivers/pci/controller/dwc/pci-keystone.c     |  68 +--------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  37 +----
 drivers/pci/controller/dwc/pci-layerscape.c   |  67 +--------
 drivers/pci/controller/dwc/pci-meson.c        |  53 ++-----
 drivers/pci/controller/dwc/pcie-al.c          |  29 +---
 drivers/pci/controller/dwc/pcie-armada8k.c    |  37 ++---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  76 +---------
 .../pci/controller/dwc/pcie-designware-ep.c   |  29 +++-
 .../pci/controller/dwc/pcie-designware-host.c |  80 ++++++----
 .../pci/controller/dwc/pcie-designware-plat.c |  70 +--------
 drivers/pci/controller/dwc/pcie-designware.h  |  12 +-
 drivers/pci/controller/dwc/pcie-histb.c       |  37 ++---
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  59 ++------
 drivers/pci/controller/dwc/pcie-kirin.c       |  62 +-------
 drivers/pci/controller/dwc/pcie-qcom.c        |  38 +----
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  62 +++-----
 drivers/pci/controller/dwc/pcie-tegra194.c    |  40 +----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  38 +----
 drivers/pci/controller/dwc/pcie-uniphier.c    |  51 +------
 22 files changed, 217 insertions(+), 970 deletions(-)

--
2.25.1
