Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C443651C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:09:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrVB3B7fz3c74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k+99nwmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k+99nwmD; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrTT1W9fz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:08:27 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id y7so904586pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//N2yjQPwL5Ut6gR7Id3QDkJj4qUz5hOkWw1Y1cnLc=;
 b=k+99nwmDy9pwVyDey675D/OeF6zbd73Y1s2uZR6WXZADWwNUhCQO+ZGEh+HLNI3lfV
 M/Kf0rYS7sJJnHnoVY+B7/kE4zZAM0u36uLUB8v0pMU5V/7Eq5r/XGgyXWVr9eRBp8+F
 NOuU/xIbPzXhWqSbhZlpR8RVr64q0dOVdXYf7D9ZekmEpGC4yCrQb7D9fboynvl+34+e
 oqYUC+uV6q2gtmqvYVS7zWMtNH/zpjhCk9UMidN0n6fGCMYZQgpbMCJieEG3GSfGHVje
 75vLEBhqJpaEZRiNRY6EyakC2UjUcSrrxI9rnYaJ3zp3htOuoo+MEH6hHFHnbwIYUxG4
 48jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//N2yjQPwL5Ut6gR7Id3QDkJj4qUz5hOkWw1Y1cnLc=;
 b=2MYHxU3RTls8SPx+Yn+XBHhs2ZClmf7qrKarVEQkBppdeAtf4Rz4M96z9Pl7OO4zYg
 P3iXQDz8yaCpApsf0YptXmJiLcU928b60nvIb7JCKEe6tTxWJTECZdKPCg1M+78x22Jj
 i1WolagfIsAorxlZZ1NCqZ5Exe416uB1dZtx4RRC6l9gSDsDjPMdAwPQT4RXpf1xuIln
 gkBPr0tqILZJN7ZI7VSyqVqwLuLs9iFVmD59K2rKPWYeVasO+AIBajFaCVaBvTOV8Idf
 8tcS2tEM8RvCqcSD2AYpCf5QDDcD9N6PWLlMZbfZn0pQL7XdX5bAbYigB1CSDWbkmCw1
 N6kw==
X-Gm-Message-State: AOAM5325pwZQBZkdYz/vFAxHvSlOFgw3JBFDUcW7qgMRE+74EsYqixdE
 RBCX8FhgZ26WCvE/G0j7vbE=
X-Google-Smtp-Source: ABdhPJxzAt/sLs2vPoeeMO8ZPLkWPQjz3XF0ai/VhySWL3UT37B9wdYgmFaV/orMaolXHHmCu+HwcA==
X-Received: by 2002:a63:af09:: with SMTP id w9mr4779992pge.323.1634828904829; 
 Thu, 21 Oct 2021 08:08:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:08:24 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 00/25] Unify PCI error response checking
Date: Thu, 21 Oct 2021 20:37:25 +0530
Message-Id: <cover.1634825082.git.naveennaidu479@gmail.com>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Amey Narkhede <ameynarkhede03@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Naveen Naidu <naveennaidu479@gmail.com>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 skhan@linuxfoundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the 
CPU read, so most hardware fabricates ~0 data.

This patch series adds PCI_ERROR_RESPONSE definition and other helper
definition SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

This series also ensures that the error response fabrication now happens
in the PCI_OP_READ and PCI_USER_READ_CONFIG. This removes the
responsibility from controller drivers to do the error response setting. 

Patch 1:
    - Adds the PCI_ERROR_RESPONSE and other related defintions
    - All other patches are dependent on this patch. This patch needs to
      be applied first, before the others

Patch 2:
    - Error fabrication happens in PCI_OP_READ and PCI_USER_READ_CONFIG
      whenever the data read via the controller driver fails.
    - This patch needs to be applied before, Patch 4/24 to Patch 15/24 are
      applied.

Patch 3:
    - Uses SET_PCI_ERROR_RESPONSE() when device is not found 

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 25:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========
v3:
   - Change RESPONSE_IS_PCI_ERROR macro definition
   - Fix the macros, Add () around macro parameters
   - Fix alignment issue in Patch 2/24
   - Add proper receipients for all the patches

v2:
    - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
      to fabricate error response, only use them in PCI_OP_READ and
      PCI_USER_READ_CONFIG

Naveen Naidu (25):
  [Patch 1/25] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
  [Patch 2/25] PCI: Set error response in config access defines when ops->read() fails
  [Patch 3/25] PCI: Use SET_PCI_ERROR_RESPONSE() when device not found
  [Patch 4/25] PCI: Remove redundant error fabrication when device read fails
  [Patch 5/25] PCI: thunder: Remove redundant error fabrication when device read fails
  [Patch 6/25] PCI: iproc: Remove redundant error fabrication when device read fails
  [Patch 7/25] PCI: mediatek: Remove redundant error fabrication when device read fails
  [Patch 8/25] PCI: exynos: Remove redundant error fabrication when device read fails
  [Patch 9/25] PCI: histb: Remove redundant error fabrication when device read fails
  [Patch 10/25] PCI: kirin: Remove redundant error fabrication when device read fails
  [Patch 11/25] PCI: aardvark: Remove redundant error fabrication when device read fails
  [Patch 12/25] PCI: mvebu: Remove redundant error fabrication when device read fails
  [Patch 13/25] PCI: altera: Remove redundant error fabrication when device read fails
  [Patch 14/25] PCI: rcar: Remove redundant error fabrication when device read fails
  [Patch 15/25] PCI: rockchip: Remove redundant error fabrication when device read fails
  [Patch 16/25] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 17/25] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 18/25] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 19/25] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 20/25] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 21/25] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [Patch 22/25] PCI: Use PCI_ERROR_RESPONSE to specify hardware error
  [Patch 23/25] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
  [Patch 24/25] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
  [Patch 25/25] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 32 +++++++-------
 drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
 drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
 drivers/pci/controller/pci-aardvark.c       | 10 +----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  8 +---
 drivers/pci/controller/pci-thunder-ecam.c   | 46 +++++++--------------
 drivers/pci/controller/pci-thunder-pem.c    |  4 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++--
 drivers/pci/controller/pcie-altera.c        |  4 +-
 drivers/pci/controller/pcie-iproc.c         |  4 +-
 drivers/pci/controller/pcie-mediatek.c      | 11 +----
 drivers/pci/controller/pcie-rcar-host.c     |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c |  4 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 +-
 drivers/pci/hotplug/pciehp_hpc.c            | 10 ++---
 drivers/pci/pci.c                           | 10 ++---
 drivers/pci/pcie/dpc.c                      |  4 +-
 drivers/pci/pcie/pme.c                      |  4 +-
 drivers/pci/probe.c                         | 10 ++---
 include/linux/pci.h                         |  9 ++++
 24 files changed, 85 insertions(+), 121 deletions(-)

-- 
2.25.1

