Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244D331B20
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 00:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvZtW3QFMz3cbr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:53:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=VRLLXtcQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.92; helo=alln-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=VRLLXtcQ; dkim-atps=neutral
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvZt32lrdz30LR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 10:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3040; q=dns/txt; s=iport;
 t=1615247611; x=1616457211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qOW1VpsX4fbS7pi7TUvKz3uyZUc7qjDe5+CAjX227XY=;
 b=VRLLXtcQREtUUvmVphwPvwl3Syo/m01VMAPcXPujbmqxYNqYN4eTjC2G
 dDzNEQffoyoMzrzNFMxuK/ErgVTST4UPvl97X/RBTdTJMqlA5+oMD+KqQ
 QvA5sO26eBwzkOnIx7O0W+SpJTpRQtF31eepett51jBRdFz4PfkwRlv8i s=;
X-IPAS-Result: =?us-ascii?q?A0CAAQCat0ZgkIoNJK1iHAEBAQEBAQcBARIBAQQEAQGCD?=
 =?us-ascii?q?4N3ATmzHQsBAQEPNAQBAYRNgXwCJTgTAgMBAQEDAgMBAQEBBQEBAQIBBgQUA?=
 =?us-ascii?q?QEBAQEBhkWGfQFGgT4BgwKDCKwogiiJCYFFgTmIXHSEGByBSUKPHASCR2klA?=
 =?us-ascii?q?YEIZz+eQJwCgwiBH48qi04PIqNslF2iVYFrIYFZMxoIGxWDJU8ZDY44jXMBX?=
 =?us-ascii?q?CADZwIGCgEBAwmPJgEB?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,233,1610409600"; d="scan'208";a="676271451"
Received: from alln-core-5.cisco.com ([173.36.13.138])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 08 Mar 2021 23:53:21 +0000
Received: from zorba.cisco.com ([10.24.7.91])
 by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTP id 128NrKRh007218;
 Mon, 8 Mar 2021 23:53:20 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] Generic Command Line changes
Date: Mon,  8 Mar 2021 15:53:08 -0800
Message-Id: <20210308235319.2988609-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.24.7.91, [10.24.7.91]
X-Outbound-Node: alln-core-5.cisco.com
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

