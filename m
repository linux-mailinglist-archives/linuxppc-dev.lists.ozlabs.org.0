Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5B36188F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2mR1Bwwz3brw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:09:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=W2jKOgDe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.79; helo=rcdn-iport-8.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=W2jKOgDe; dkim-atps=neutral
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM2ly0W66z2yqD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:09:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=4282; q=dns/txt; s=iport;
 t=1618546174; x=1619755774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qPo8os07gANgYc92EpzGmy/chN2RQQ3R6N3KjLTucyI=;
 b=W2jKOgDe08BrxyXZiLsyoMe246InNDg0LneYmSurYtCGBMWJFtuZn/NI
 mQaOfAaL2BAG1UEvVAIFNdcBBot2TDUyTwIhpabOltjI22EKleEqFxF7D
 EFdndCmBvOSevzk/goc2uJIlaCWeeQKXP8BDIrLg8Ro0rzy1zd943OzsN I=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AsIMqfqGs638gs2jIpLqEdseALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY4TuWzkceykPMHkSLugDEKV3063fyGMq+MQXTTnKQFg7U5EL++UG?=
 =?us-ascii?q?Dd1leAA5pl6eLZqQHIPw3b2qpj2bx7c654YeeAbmRSqcrh+gG3H5IBzbC8kZ?=
 =?us-ascii?q?yAvuvVw3dzQQwCUcgJhDtRMBqREUF9WWB9aqYRKZz03Kd6jgvlXXwWa8ihb0?=
 =?us-ascii?q?NkY8Hz4/vWiZnhfRkKQzkg5QXmt0LN1JfKVz6FwxwZTzRDhY0HzFGAuQn46q?=
 =?us-ascii?q?K/2svLryPh6w=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BMAAAiDXlg/4sNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBfgcBAQsBAYIpgU0BOY0YiU2BDJligXwLAQEBDzQEAQGEUIF?=
 =?us-ascii?q?1AiU0CQ4CAwEBDAEBBQEBAQIBBgRxE4VdQxYBhiMBRoE+AYMDgwisCIIrgQG?=
 =?us-ascii?q?IM4FEgTkBiGt0hBwcgUlCgROCbIstBIJABQEBgQ8HHoI4QpwtgX+KS5Figxa?=
 =?us-ascii?q?BJptRDyOkfJUYo2KBVDqBWTMaCBsVgyVPGQ6cLAFbIQNnAgYKAQEDCYlOg0A?=
 =?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; d="scan'208";a="884877150"
Received: from alln-core-6.cisco.com ([173.36.13.139])
 by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 16 Apr 2021 04:09:25 +0000
Received: from zorba.cisco.com ([10.24.7.67])
 by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHf016753;
 Fri, 16 Apr 2021 04:09:24 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [PATCH 0/8] generic command line v4
Date: Thu, 15 Apr 2021 21:09:11 -0700
Message-Id: <20210416040924.2882771-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
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


v4 release changes

* Updated insert-sys-cert tool to change command line symbols after
  compilation.

	This tool is used to release binary kernels internally to companies
	and then later insert certificates for each product by consumers of
	the binary kernel. Cisco uses this tool for this purpose.

	Cisco has a similar need for the command line to be modified on a
	binary released kernels similar to how certificates are setup.

* Added global symbols to hold append and prepend values.

	These changes follow the system certificate code to allow the
	insert-sys-cert tool to be used.

* Added a test case to confirm functionality.

	Seemed sensible to add this to make sure everything is working.

* Dropped powerpc changes

	Christophe Leroy has reservations about the features for powerpc. I
	don't think his reservations are founded, and these changes should
	fully work on powerpc. However, I dropped these changes so Christophe
	can have more time to get comfortable with the changes.


Enjoy!


Daniel Walker (8):
  CMDLINE: add generic builtin command line
  scripts: insert-sys-cert: add command line insert capability
  scripts: insert-sys-cert: change name to insert-symbol
  CMDLINE: mips: convert to generic builtin command line
  drivers: firmware: efi: libstub: enable generic commandline
  CMDLINE: x86: convert to generic builtin command line
  of: allow sending a NULL value to early_init_dt_scan_chosen
  CMDLINE: arm64: convert to generic builtin command line

 arch/arm64/Kconfig                            |  33 +--
 arch/arm64/include/asm/setup.h                |   2 +
 arch/arm64/kernel/idreg-override.c            |   9 +-
 arch/mips/Kconfig                             |   4 +-
 arch/mips/Kconfig.debug                       |  44 ----
 arch/mips/configs/ar7_defconfig               |   9 +-
 arch/mips/configs/bcm47xx_defconfig           |   8 +-
 arch/mips/configs/bcm63xx_defconfig           |  15 +-
 arch/mips/configs/bmips_be_defconfig          |  11 +-
 arch/mips/configs/bmips_stb_defconfig         |  11 +-
 arch/mips/configs/capcella_defconfig          |  11 +-
 arch/mips/configs/ci20_defconfig              |  10 +-
 arch/mips/configs/cu1000-neo_defconfig        |  10 +-
 arch/mips/configs/cu1830-neo_defconfig        |  10 +-
 arch/mips/configs/e55_defconfig               |   4 +-
 arch/mips/configs/generic_defconfig           |   6 +-
 arch/mips/configs/gpr_defconfig               |  18 +-
 arch/mips/configs/loongson3_defconfig         |  13 +-
 arch/mips/configs/mpc30x_defconfig            |   7 +-
 arch/mips/configs/tb0219_defconfig            |   7 +-
 arch/mips/configs/tb0226_defconfig            |   7 +-
 arch/mips/configs/tb0287_defconfig            |   7 +-
 arch/mips/configs/workpad_defconfig           |  11 +-
 arch/mips/include/asm/setup.h                 |   2 +
 arch/mips/kernel/relocate.c                   |  17 +-
 arch/mips/kernel/setup.c                      |  36 +--
 arch/mips/pic32/pic32mzda/early_console.c     |   2 +-
 arch/mips/pic32/pic32mzda/init.c              |   3 +-
 arch/x86/Kconfig                              |  44 +---
 arch/x86/kernel/setup.c                       |  18 +-
 .../firmware/efi/libstub/efi-stub-helper.c    |  29 +++
 drivers/firmware/efi/libstub/efi-stub.c       |   9 +
 drivers/firmware/efi/libstub/efistub.h        |   1 +
 drivers/firmware/efi/libstub/x86-stub.c       |  13 +-
 drivers/of/fdt.c                              |  44 ++--
 include/linux/cmdline.h                       | 103 ++++++++
 init/Kconfig                                  |  78 ++++++
 lib/Kconfig                                   |   4 +
 lib/Makefile                                  |   3 +
 lib/generic_cmdline.S                         |  53 ++++
 lib/test_cmdline1.c                           | 139 ++++++++++
 scripts/Makefile                              |   2 +-
 .../{insert-sys-cert.c => insert-symbol.c}    | 243 ++++++++++++------
 43 files changed, 716 insertions(+), 394 deletions(-)
 create mode 100644 include/linux/cmdline.h
 create mode 100644 lib/generic_cmdline.S
 create mode 100644 lib/test_cmdline1.c
 rename scripts/{insert-sys-cert.c => insert-symbol.c} (72%)

-- 
2.25.1

