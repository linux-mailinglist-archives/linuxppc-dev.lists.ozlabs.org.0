Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5001DD3B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:02:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SbXV25nvzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:02:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SbPJ6SckzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 02:56:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49SbNP3xptz9tyFq;
 Thu, 21 May 2020 18:55:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id t1vK45dStyxb; Thu, 21 May 2020 18:55:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49SbNP33vLz9v125;
 Thu, 21 May 2020 18:55:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BBF548B7DB;
 Thu, 21 May 2020 18:55:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OyFS_cgZ7i-a; Thu, 21 May 2020 18:55:51 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 705198B778;
 Thu, 21 May 2020 18:55:51 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3959665A53; Thu, 21 May 2020 16:55:51 +0000 (UTC)
Message-Id: <cover.1590079968.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 00/13] Modernise powerpc 40x
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Thu, 21 May 2020 16:55:51 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v1 and v2 of this series were aiming at removing 40x entirely,
but it led to protests.

v3 is trying to start modernising powerpc 40x:
- Rework TLB miss handlers to not use PTE_ATOMIC_UPDATES and _PAGE_HWWRITE
- Remove old versions of 40x processors, namely 403 and 405GP and associated
errata.
- Last two patches are trivial changes in TLB miss handlers to reduce number
of scratch registers.

v4:
- Fixing a build failure with patch 2 due to a missing ;
- There was in patch 5 some stuff belonging to patch 6. Moved them.
- Rebased to today's powerpc/merge

v5:
- Rebase on top of 35a26089dd1c Automatic merge of 'next-test' into merge-test (2020-05-22 00:14)

I would have liked to test it with QEMU, but I get the following error when
trying to start QEMU for machine ref405ep.

	qemu-system-ppc: Could not load PowerPC BIOS 'ppc405_rom.bin'

Can someone help with that ?

Christophe Leroy (12):
  powerpc/40x: Rework 40x PTE access and TLB miss
  powerpc/pgtable: Drop PTE_ATOMIC_UPDATES
  powerpc/40x: Remove support for IBM 403GCX
  powerpc/40x: Remove STB03xxx
  powerpc/40x: Remove WALNUT
  powerpc/40x: Remove EP405
  powerpc/40x: Remove support for ISS Simulator
  powerpc/40x: Remove support for IBM 405GP
  powerpc/40x: Remove IBM405 Erratum #51
  powerpc: Remove IBM405 Erratum #77
  powerpc/40x: Avoid using r12 in TLB miss handlers
  powerpc/40x: Don't save CR in SPRN_SPRG_SCRATCH6

Michal Simek (1):
  powerpc: Remove Xilinx PPC405/PPC440 support

 Documentation/devicetree/bindings/xilinx.txt | 143 ------
 Documentation/powerpc/bootwrapper.rst        |  28 +-
 arch/powerpc/Kconfig.debug                   |   2 +-
 arch/powerpc/boot/Makefile                   |  14 +-
 arch/powerpc/boot/dts/Makefile               |   1 -
 arch/powerpc/boot/dts/ep405.dts              | 230 ---------
 arch/powerpc/boot/dts/virtex440-ml507.dts    | 406 ----------------
 arch/powerpc/boot/dts/virtex440-ml510.dts    | 466 -------------------
 arch/powerpc/boot/dts/walnut.dts             | 246 ----------
 arch/powerpc/boot/ep405.c                    |  71 ---
 arch/powerpc/boot/ops.h                      |   1 -
 arch/powerpc/boot/serial.c                   |   5 -
 arch/powerpc/boot/treeboot-walnut.c          |  81 ----
 arch/powerpc/boot/uartlite.c                 |  79 ----
 arch/powerpc/boot/virtex.c                   |  97 ----
 arch/powerpc/boot/virtex405-head.S           |  31 --
 arch/powerpc/boot/wrapper                    |   8 -
 arch/powerpc/configs/40x/acadia_defconfig    |   1 -
 arch/powerpc/configs/40x/ep405_defconfig     |  62 ---
 arch/powerpc/configs/40x/kilauea_defconfig   |   1 -
 arch/powerpc/configs/40x/klondike_defconfig  |   1 -
 arch/powerpc/configs/40x/makalu_defconfig    |   1 -
 arch/powerpc/configs/40x/obs600_defconfig    |   1 -
 arch/powerpc/configs/40x/virtex_defconfig    |  75 ---
 arch/powerpc/configs/44x/virtex5_defconfig   |  74 ---
 arch/powerpc/configs/ppc40x_defconfig        |   9 -
 arch/powerpc/configs/ppc44x_defconfig        |   8 -
 arch/powerpc/include/asm/asm-405.h           |  19 -
 arch/powerpc/include/asm/atomic.h            |  11 -
 arch/powerpc/include/asm/bitops.h            |   4 -
 arch/powerpc/include/asm/cache.h             |   2 +-
 arch/powerpc/include/asm/cmpxchg.h           |  11 -
 arch/powerpc/include/asm/futex.h             |   3 -
 arch/powerpc/include/asm/nohash/32/pgtable.h |  16 -
 arch/powerpc/include/asm/nohash/32/pte-40x.h |  23 +-
 arch/powerpc/include/asm/nohash/pgtable.h    |   2 -
 arch/powerpc/include/asm/reg_booke.h         |  54 ---
 arch/powerpc/include/asm/spinlock.h          |   4 -
 arch/powerpc/include/asm/time.h              |  12 -
 arch/powerpc/include/asm/xilinx_intc.h       |  16 -
 arch/powerpc/include/asm/xilinx_pci.h        |  21 -
 arch/powerpc/kernel/cputable.c               | 102 ----
 arch/powerpc/kernel/entry_32.S               |  11 -
 arch/powerpc/kernel/head_40x.S               | 316 +++----------
 arch/powerpc/kernel/misc_32.S                |   9 -
 arch/powerpc/kernel/setup-common.c           |   4 -
 arch/powerpc/mm/nohash/40x.c                 |   4 +-
 arch/powerpc/platforms/40x/Kconfig           |  76 ---
 arch/powerpc/platforms/40x/Makefile          |   3 -
 arch/powerpc/platforms/40x/ep405.c           | 123 -----
 arch/powerpc/platforms/40x/virtex.c          |  54 ---
 arch/powerpc/platforms/40x/walnut.c          |  65 ---
 arch/powerpc/platforms/44x/Kconfig           |  40 +-
 arch/powerpc/platforms/44x/Makefile          |   2 -
 arch/powerpc/platforms/44x/virtex.c          |  60 ---
 arch/powerpc/platforms/44x/virtex_ml510.c    |  30 --
 arch/powerpc/platforms/Kconfig               |   4 -
 arch/powerpc/sysdev/Makefile                 |   2 -
 arch/powerpc/sysdev/xilinx_intc.c            |  88 ----
 arch/powerpc/sysdev/xilinx_pci.c             | 132 ------
 drivers/char/Kconfig                         |   2 +-
 drivers/video/fbdev/Kconfig                  |   2 +-
 62 files changed, 83 insertions(+), 3386 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/ep405.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
 delete mode 100644 arch/powerpc/boot/dts/walnut.dts
 delete mode 100644 arch/powerpc/boot/ep405.c
 delete mode 100644 arch/powerpc/boot/treeboot-walnut.c
 delete mode 100644 arch/powerpc/boot/uartlite.c
 delete mode 100644 arch/powerpc/boot/virtex.c
 delete mode 100644 arch/powerpc/boot/virtex405-head.S
 delete mode 100644 arch/powerpc/configs/40x/ep405_defconfig
 delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
 delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
 delete mode 100644 arch/powerpc/include/asm/asm-405.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
 delete mode 100644 arch/powerpc/platforms/40x/ep405.c
 delete mode 100644 arch/powerpc/platforms/40x/virtex.c
 delete mode 100644 arch/powerpc/platforms/40x/walnut.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c

-- 
2.25.0

