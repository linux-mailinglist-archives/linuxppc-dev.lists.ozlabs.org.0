Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFC455D50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 15:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw1lJ4k7Vz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 01:05:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U2AsFUKZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U2AsFUKZ; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw1kb07njz2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 01:04:21 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so5774463pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+h5Kd/hjqlgWPZhxmNy3OoG7OiHuipUsgtMWPBV6Ak=;
 b=U2AsFUKZLXJxwq1AOzr4+SXvMtjFGsxO8ExXuBT8byCkoGnUJsmIHIE9RaBdrO41Rl
 8huvDZAw5E9R6TLbkkzhiG0KK3ozoaeqyNAOCPgfaVXDO9RiMVzPYQO8kM0jpDHGImp7
 mGfT7LqSqvp0vGwEav+2G8mOB/HtIp0+n1d5lT7on4J/eCJ5BhjDOqpUJNodLcLk69LE
 dsQIh5VyqtbSeUIvPCt28VdXKYnJ3AC6q5Y7i7rFWNmPQzuQYztj2GETNDY5XVCxMBRi
 +q4uDB/9eeOsa42CQY/qDnZw4RfX5KuaXc2wcxRoWzNfS6iF4pK1CZwYlyHMbvLRGlQR
 cSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+h5Kd/hjqlgWPZhxmNy3OoG7OiHuipUsgtMWPBV6Ak=;
 b=2Ywcf18n102jEbLutlQkFIEE/iQ9CLN4OtenMUhwQY7gXklgfSJcImsRgmjE/PPxsF
 XOXpTGmdJyqlFeT8Wa6rtvCV7jpXCApbEC3mgmjP30FqewWELEZjTVQlQC3JD5IqRc6I
 p5zhycXqH8zbPpNhoWIpSGiSTDzwuxgRdo7pmEEE+JWOAivNlMw83qldvxDZHBeBNEgv
 hnbQzW5d730QN3IMjX7ScTuK7N5YVD5EIRjJS9qZL8Dza7g8z4ioZV31dbpYw+1xP7Om
 PrNw/v31vJiGhN1hwgP0nmcRsauCkVn7f87oWkeJ7T+88MJacqjrDRBvmvhupmeSi3aY
 5sdw==
X-Gm-Message-State: AOAM530tgQzABF9H3fhlvtu6ezUrkCgEnW/xlscDZPzFsfbJEwlt6dP3
 3oOBjFHR3aV9QuEMqVRsVpU=
X-Google-Smtp-Source: ABdhPJxcxZ6cnPohSI0/EFdUtlWDJVxg7caCTPrSiqQO3khzZ31HBiXw2/qZEqHgRBRrRj1t2soQnA==
X-Received: by 2002:a17:902:9303:b0:143:d6c7:babc with SMTP id
 bc3-20020a170902930300b00143d6c7babcmr21567418plb.58.1637244258545; 
 Thu, 18 Nov 2021 06:04:18 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:04:18 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 00/25] Unify PCI error response checking
Date: Thu, 18 Nov 2021 19:33:10 +0530
Message-Id: <cover.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
definition PCI_SET_ERROR_RESPONSE and PCI_POSSIBLE_ERROR and uses it
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
    - Uses PCI_SET_ERROR_RESPONSE() when device is not found 

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses PCI_POSSIBLE_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 25:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========
v4:
   - Rename SET_PCI_ERROR_RESPONSE to PCI_SET_ERROR_RESPONSE
   - Rename RESPONSE_IS_PCI_ERROR to PCI_POSSIBLE_ERROR

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
 [PATCH v4 1/25] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
 [PATCH v4 2/25] PCI: Set error response in config access defines when ops->read() fails
 [PATCH v4 3/25] PCI: Use PCI_SET_ERROR_RESPONSE() when device not found
 [PATCH v4 4/25] PCI: Remove redundant error fabrication when device read fails
 [PATCH v4 5/25] PCI: thunder: Remove redundant error fabrication when device read fails
 [PATCH v4 6/25] PCI: iproc: Remove redundant error fabrication when device read fails
 [PATCH v4 7/25] PCI: mediatek: Remove redundant error fabrication when device read fails
 [PATCH v4 8/25] PCI: exynos: Remove redundant error fabrication when device read fails
 [PATCH v4 9/25] PCI: histb: Remove redundant error fabrication when device read fails
 [PATCH v4 10/25] PCI: kirin: Remove redundant error fabrication when device read fails
 [PATCH v4 11/25] PCI: aardvark: Remove redundant error fabrication when device read fails
 [PATCH v4 12/25] PCI: mvebu: Remove redundant error fabrication when device read fails
 [PATCH v4 13/25] PCI: altera: Remove redundant error fabrication when device read fails
 [PATCH v4 14/25] PCI: rcar: Remove redundant error fabrication when device read fails
 [PATCH v4 15/25] PCI: rockchip: Remove redundant error fabrication when device read fails
 [PATCH v4 16/25] PCI/ERR: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 17/25] PCI: vmd: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 18/25] PCI: pciehp: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 19/25] PCI/DPC: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 20/25] PCI/PME: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 21/25] PCI: cpqphp: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 22/25] PCI: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH v4 23/25] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH v4 24/25] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
 [PATCH v4 25/25] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 32 +++++++-------
 drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
 drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
 drivers/pci/controller/pci-aardvark.c       |  4 +-
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
 24 files changed, 84 insertions(+), 116 deletions(-)

-- 
2.25.1

