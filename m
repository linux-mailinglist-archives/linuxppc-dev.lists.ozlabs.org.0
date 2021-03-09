Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D0331B4E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 01:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvb5w6N4fz3dKW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 11:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=Q2AIAtza;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=Q2AIAtza; dkim-atps=neutral
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvb4t376cz30Mt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 11:02:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3040; q=dns/txt; s=iport;
 t=1615248174; x=1616457774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qOW1VpsX4fbS7pi7TUvKz3uyZUc7qjDe5+CAjX227XY=;
 b=Q2AIAtzaCqchExreHlHZU120gR3SMnHmlyfJZwVuWqZI3xfhWVZGV24I
 nGEZelw6Z0a4OXD0+MdniIx2Rk+CxQyfg/ODtTQt2OH2wS769sblP5+V9
 8PECxZYcoABLLGFS5jIN/vx2TL8QwioleO0r7KfPxyYnvu/jKJAZg2i0B E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BDAwAiukZg/4cNJK1iHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGCD4IrgUwBObMcCwEBAQ80BAEBhE2BfAIlOBMCAwEBCwEBBQE?=
 =?us-ascii?q?BAQIBBgRxhW6GfQFGgT4BgwKDCKwkgiiJCoFFFIEliFx0hBgcgUlCjxwEgkd?=
 =?us-ascii?q?pJQGBCGc/nkCcAoMIgR+PKotODyKjbJRdolWBayOBVzMaCBsVgyVPGQ2cKwF?=
 =?us-ascii?q?cIANnAgYKAQEDCY8mAQE?=
X-IronPort-AV: E=Sophos;i="5.81,233,1610409600"; d="scan'208";a="873669200"
Received: from alln-core-2.cisco.com ([173.36.13.135])
 by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Mar 2021 00:02:49 +0000
Received: from zorba.cisco.com ([10.24.7.91])
 by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12902mKa014497;
 Tue, 9 Mar 2021 00:02:48 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 xe-linux-external@cisco.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] Generic Command Line changes
Date: Mon,  8 Mar 2021 16:02:36 -0800
Message-Id: <20210309000247.2989531-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.91, [10.24.7.91]
X-Outbound-Node: alln-core-2.cisco.com
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
Cc: linux-efi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixed some problem identified in my last release. I made updates
based on comments from Christophe Leroy.

I added scripted updates to the defconfig file for mips and powerpc.
This is required in order to maintain the status quo for those platforms
which used the prior builtin command line system.

These were tested on all effected architectures.

Daniel Walker (7):
  CMDLINE: add generic builtin command line
  CMDLINE: drivers: of: ifdef out cmdline section
  powerpc: convert config files to generic cmdline
  CMDLINE: powerpc: convert to generic builtin command line
  mips: convert config files to generic cmdline
  CMDLINE: mips: convert to generic builtin command line
  CMDLINE: x86: convert to generic builtin command line

 arch/mips/Kconfig                             |  4 +-
 arch/mips/Kconfig.debug                       | 44 ---------
 arch/mips/configs/ar7_defconfig               |  9 +-
 arch/mips/configs/bcm47xx_defconfig           |  8 +-
 arch/mips/configs/bcm63xx_defconfig           | 15 ++--
 arch/mips/configs/bmips_be_defconfig          | 11 +--
 arch/mips/configs/bmips_stb_defconfig         | 11 +--
 arch/mips/configs/capcella_defconfig          | 11 +--
 arch/mips/configs/ci20_defconfig              | 10 +--
 arch/mips/configs/cu1000-neo_defconfig        | 10 +--
 arch/mips/configs/cu1830-neo_defconfig        | 10 +--
 arch/mips/configs/e55_defconfig               |  4 +-
 arch/mips/configs/generic_defconfig           |  6 +-
 arch/mips/configs/gpr_defconfig               | 18 +---
 arch/mips/configs/loongson3_defconfig         | 13 +--
 arch/mips/configs/mpc30x_defconfig            |  7 +-
 arch/mips/configs/tb0219_defconfig            |  7 +-
 arch/mips/configs/tb0226_defconfig            |  7 +-
 arch/mips/configs/tb0287_defconfig            |  7 +-
 arch/mips/configs/workpad_defconfig           | 11 +--
 arch/mips/kernel/setup.c                      | 36 +-------
 arch/powerpc/Kconfig                          | 37 +-------
 arch/powerpc/configs/44x/fsp2_defconfig       | 33 ++++---
 arch/powerpc/configs/44x/iss476-smp_defconfig | 25 +++---
 arch/powerpc/configs/44x/warp_defconfig       | 17 ++--
 arch/powerpc/configs/holly_defconfig          | 13 +--
 arch/powerpc/configs/mvme5100_defconfig       | 23 ++---
 arch/powerpc/configs/skiroot_defconfig        | 12 ++-
 arch/powerpc/configs/storcenter_defconfig     | 18 ++--
 arch/powerpc/kernel/prom.c                    |  1 +
 arch/powerpc/kernel/prom_init.c               | 35 +++++---
 arch/x86/Kconfig                              | 44 +--------
 arch/x86/kernel/setup.c                       | 18 +---
 drivers/firmware/efi/libstub/x86-stub.c       |  2 +-
 drivers/of/fdt.c                              | 12 +++
 include/linux/cmdline.h                       | 89 +++++++++++++++++++
 init/Kconfig                                  | 68 ++++++++++++++
 37 files changed, 321 insertions(+), 385 deletions(-)
 create mode 100644 include/linux/cmdline.h

-- 
2.25.1

