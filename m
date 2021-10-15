Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB542F53D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 16:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW7sR5HDbz3cBc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mW0YwkEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mW0YwkEY; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW7rj023fz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 01:27:16 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id m26so8516057pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=mW0YwkEYI+SkJyiLxlQX3Zdlu5EyWW8zMrdZ1/82zOBc94fM7nZ5imuO8lI0tb5Mlc
 GJX5XvSWu1L0mHI8nSrIRx+Do7SdcoiQJmua/qyhISbG1tvsgGAtKU2iaSZvTJBb65H4
 yybCzMgblNgOoHva0cf/tJmCf6kFhrzB7ImRJELkl+97pLZdPXanfD/7ui3T8inIbbwi
 STKVz/5qY9Dvta4IbwFgUI2HPfp+DgGS87+bamOPu7vRmCtOakuf4SGBbo8DvAGhvNNk
 uMToZ3PnjDxeoU2qn1wjU0aa9BC12o3ATwUQxwGE8QbXhHsGamQhQZz4miZcGUh7D1CO
 yNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=0MaI82CDa6HIe7Ev+E/bwbLer6B5cNVm+k+g3rlr8TV+EIsEiJGqn/4ybWwZkA9aAZ
 zQbHs+c2dCuboLQ3rpUxerms2i/2BvIdjSt+QW38i485vuCd5nUXVuU1meyGWBuPnk65
 LjIR5C/pDXd9Oj9hzWdX3OrleYI8thrB+gqvBTljBJ61WgJMzID//av7DpfDOtsl00Wt
 LpuDnVricBCpXQVBI/nc9TQqxvGHzuIDFL9U7gp+ZLsHKhRhHgZX+++/RZwvDBx/yC7g
 mRBVmczTq2oF+i13gjb372P7b2kv3QuDAVayIKe0ZDBXPAfrtyTNq7Ry+vgRI8wxdQ7d
 oJ0A==
X-Gm-Message-State: AOAM530bovujdzD2Aat8rtJxggCfb0a/KyJ65MToVYfiKUNUSmdTgoPo
 J1cN8Vj4l64W2bdonHb+Ezs=
X-Google-Smtp-Source: ABdhPJxFKApjvWHOznC1si5BoWluKZQ8jEGESoKMvikMsJGlwrW7cHZUum4j158SdHMlbo9VkZ0e4A==
X-Received: by 2002:a62:ab17:0:b0:44c:f727:98cd with SMTP id
 p23-20020a62ab17000000b0044cf72798cdmr12077120pff.35.1634308032813; 
 Fri, 15 Oct 2021 07:27:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:5414:a8c0:67be:6f68:5d31:1ee2])
 by smtp.gmail.com with ESMTPSA id ls7sm5408396pjb.16.2021.10.15.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:27:12 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 00/24] Unify PCI error response checking
Date: Fri, 15 Oct 2021 19:56:31 +0530
Message-Id: <cover.1634300660.git.naveennaidu479@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, linux-hyperv@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Naveen Naidu <naveennaidu479@gmail.com>,
 linux-mediatek@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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
    - Uses SET_PCI_ERROR_RESPONSE() when device is not found and
      RESPONSE_IS_PCI_ERROR() to check hardware read from the hardware.

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 24:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========

v2:
    - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
      to fabricate error response, only use them in PCI_OP_READ and
      PCI_USER_READ_CONFIG

Naveen Naidu (24):
 [PATCH 1/24] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
 [PATCH 2/24] PCI: Set error response in config access defines when ops->read() fails
 [PATCH 3/24] PCI: Unify PCI error response checking
 [PATCH 4/24] PCI: Remove redundant error fabrication when device read fails
 [PATCH 5/24] PCI: thunder: Remove redundant error fabrication when device read fails
 [PATCH 6/24] PCI: iproc: Remove redundant error fabrication when device read fails
 [PATCH 7/24] PCI: mediatek: Remove redundant error fabrication when device read fails
 [PATCH 8/24] PCI: exynos: Remove redundant error fabrication when device read fails
 [PATCH 9/24] PCI: histb: Remove redundant error fabrication when device read fails
 [PATCH 10/24] PCI: kirin: Remove redundant error fabrication when device read fails
 [PATCH 11/24] PCI: aardvark: Remove redundant error fabrication when device read fails
 [PATCH 12/24] PCI: mvebu: Remove redundant error fabrication when device read fails
 [PATCH 13/24] PCI: altera: Remove redundant error fabrication when device read fails
 [PATCH 14/24] PCI: rcar: Remove redundant error fabrication when device read fails
 [PATCH 15/24] PCI: rockchip: Remove redundant error fabrication when device read fails
 [PATCH 16/24] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 18/24] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 19/24] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 20/24] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 21/24] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 22/24] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH 23/24] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
 [PATCH 24/24] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 36 ++++++++--------
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
 24 files changed, 87 insertions(+), 123 deletions(-)

-- 
2.25.1

