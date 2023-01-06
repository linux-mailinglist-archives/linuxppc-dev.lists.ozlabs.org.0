Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F97B660954
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 23:11:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpcxV2hRXz3fFl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 09:11:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1wBTwMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=anirudh.venkataramanan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1wBTwMq;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npcgf6Bzcz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 08:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673042367; x=1704578367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FTUwp6vti/6MjCft69xiR34bTAXHpf/OAp2V3llnAHs=;
  b=d1wBTwMqSVOtjbIAgdOozIrfLU6Jf3K07Q2wK//3LDD9uQj36kJ6Knqw
   p7H6oHj+qStkFSPcCH4GoDt8xjgKjcbE+SeTMUVXRvYEt5JORFry1M/uN
   9+Es2xuUV6MdpgMzLsiM8nPCwLn3PdWXeyp2y7Z3LZ7KP4Ec6wvD58DSH
   qaIVEfUqWJ9j2ySke+SiwhL7jAvSW6IYJdMKvedG07QHUoZydm2qbM7k0
   TxMEDgOShMO/Otvqe1nxXOffEzj+3VR/QHygeyjUWzdqY6cHCjOh61Opo
   dk1OR74hFL1+PpxXnf6hmhfZrcYJ6OogCyx1+viRUopq/KoUUA7Yqu+nK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387030695"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="387030695"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 13:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="763652873"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="763652873"
Received: from avenkata-desk0.sc.intel.com ([172.25.112.60])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2023 13:59:15 -0800
From: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 0/7] Remove three Sun net drivers
Date: Fri,  6 Jan 2023 14:00:13 -0800
Message-Id: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 Jan 2023 09:09:38 +1100
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series removes the Sun Cassini, LDOM vswitch and sunvnet drivers.

In a recent patch series that touched these drivers [1], it was suggested
that these drivers should be removed completely. git logs suggest that
there hasn't been any significant feature addition, improvement or fixes
to user-visible bugs in a while. A web search didn't indicate any recent
discussions or any evidence that there are users out there who care about
these drivers.

The idea behind putting out this series is to either establish that these
drivers are used and should be maintained, or remove them.

While the bulk of the code removal is in the networking s, and so
multiple subsystem lists are cc'd. Here's a quick breakdown:

  - patches 1/7 and 5/7 remove the drivers (netdev)
  - patch 2/7 removes Sun device IDs from pci_ids.h (linux-pci)
  - patch 3/7 changes ppc6xx_defconfig (linuxppc)
  - patch 4/7 changes MIPS mtx1_defconfig (linux-mips)
  - patch 6/7 removes the event tracing header sunvnet.h (linux-trace)
  - patch 7/7 changes sparc64_defconfig (sparclinux)

This series was compile tested as follows:

make O=b1 ARCH=mips CROSS_COMPILE=mips64-linux-gnu- defconfig
make -j$(nproc) O=b1 ARCH=mips CROSS_COMPILE=mips64-linux-gnu- all

make O=b2 ARCH=sparc64 CROSS_COMPILE=sparc64-linux-gnu- defconfig
make -j$(nproc) O=b2 ARCH=sparc64 CROSS_COMPILE=sparc64-linux-gnu- all

make O=b3 ARCH=powerpc CROSS_COMPILE=ppc64-linux-gnu- ppc6xx_defconfig
make -j$(nproc) O=b3 ARCH=powerpc CROSS_COMPILE=ppc64-linux-gnu- all

[1] https://lore.kernel.org/netdev/99629223-ac1b-0f82-50b8-ea307b3b0197@intel.com/T/#t

Suggested-by: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>

Anirudh Venkataramanan (7):
  ethernet: Remove the Sun Cassini driver
  PCI: Remove PCI IDs used by the Sun Cassini driver
  powerpc: configs: Remove reference to CONFIG_CASSINI
  mips: configs: Remove reference to CONFIG_CASSINI
  ethernet: Remove the Sun LDOM vswitch and sunvnet drivers
  sunvnet: Remove event tracing file
  sparc: configs: Remove references to CONFIG_SUNVNET and CONFIG_LDMVSW

 arch/mips/configs/mtx1_defconfig          |    1 -
 arch/powerpc/configs/ppc6xx_defconfig     |    1 -
 arch/sparc/configs/sparc64_defconfig      |    2 -
 drivers/net/ethernet/sun/Kconfig          |   35 -
 drivers/net/ethernet/sun/Makefile         |    4 -
 drivers/net/ethernet/sun/cassini.c        | 5215 ---------------------
 drivers/net/ethernet/sun/cassini.h        | 2900 ------------
 drivers/net/ethernet/sun/ldmvsw.c         |  476 --
 drivers/net/ethernet/sun/sunvnet.c        |  567 ---
 drivers/net/ethernet/sun/sunvnet_common.c | 1813 -------
 drivers/net/ethernet/sun/sunvnet_common.h |  157 -
 include/linux/pci_ids.h                   |    2 -
 include/trace/events/sunvnet.h            |  140 -
 13 files changed, 11313 deletions(-)
 delete mode 100644 drivers/net/ethernet/sun/cassini.c
 delete mode 100644 drivers/net/ethernet/sun/cassini.h
 delete mode 100644 drivers/net/ethernet/sun/ldmvsw.c
 delete mode 100644 drivers/net/ethernet/sun/sunvnet.c
 delete mode 100644 drivers/net/ethernet/sun/sunvnet_common.c
 delete mode 100644 drivers/net/ethernet/sun/sunvnet_common.h
 delete mode 100644 include/trace/events/sunvnet.h


base-commit: 6bd4755c7c499dbcef46eaaeafa1a319da583b29
-- 
2.37.2

