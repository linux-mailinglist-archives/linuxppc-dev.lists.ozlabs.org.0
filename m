Return-Path: <linuxppc-dev+bounces-11992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A8B51924
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 16:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMNBt2vlKz3dDx;
	Thu, 11 Sep 2025 00:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757514038;
	cv=none; b=i30ekxR25fxCOHSxy3ZwZ6hPEzNjb7WFEsT3EA8i1tt85PbbAuQSF++1Tec3I8GN+vlyV7/iD+L9R78sI7uLl6iyswSN7xyW8EoVZ5VXGTDliPFcD3LpApHr8jvoHrvMFb6T9iJm+0jfr7pi1VzOc5JvGBAeB1l8yClYncTwxd4oEmLKUckUgmU8UTfa2uQgq4oCcA2Cn28D0bq5QJLrJ528CZHyM/GBvQB3d6pFvOLo0yP2mJum+sP1TPmSulHKiGgPnn11/BU7FGTXBOZfxvcBdZjJ2Vc/0SOiJglHJ3rQML/pAarWpdOii/rrTRSUgiAHt4h+Rm98bBtqP/Q+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757514038; c=relaxed/relaxed;
	bh=u2NUJDjWaeT7iHCXUXFYohmWfDOQ7fAVzcsEYaLxgA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhi/8BcG+WUZtaMdjYg9CMYcDG2cgHqJ8tEbSEoLKIEF3Njnj/iEN7r5kijzhDyJEZ1WFZcUbnqXuySGwwmZlPQzTMq697OQu96saRCSkSeYaVDQ6m3HzqLSTUEbuuVTPY1uE6PhzVpa9LiIxg8ey1gBkfBifgbcoMyRPIUqTnjqj1RVKyc67t/rQzDPwCG2cbMEHIapRm9NnqJcBB5rKrrBqIRc+KhJ1R3SBuNHILuei30v7a1Grrb2UQEn9nXfH1kEc7WOSy3ZclBuEkfgHV1LOLGeAM0lsvDdEQwO6D+JedoCHtdabaHle8c2aoay0b8qi1sX4ZNZubq0ooKZeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMNBs0kv0z3dDj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 00:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cMMSr5SRtz9sj9;
	Wed, 10 Sep 2025 15:47:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOSqZWIcaoRl; Wed, 10 Sep 2025 15:47:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cMMSr3mRSz9sj8;
	Wed, 10 Sep 2025 15:47:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F80E8B796;
	Wed, 10 Sep 2025 15:47:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WA3MR1UUAydb; Wed, 10 Sep 2025 15:47:40 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 95C828B764;
	Wed, 10 Sep 2025 15:47:39 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc: Remove CONFIG_HIGHMEM
Date: Wed, 10 Sep 2025 15:47:00 +0200
Message-ID: <28d908b95fe358129db18f69b30891788e15ada0.1757512010.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757512026; l=40253; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1JhGvn0Zq73HCABiCOie7GJMDFSwRV1tK2wEfKXxn5o=; b=84v22WReckdnopmG+ObRipH0vPlQzi0sjPDTHWFbNG3YPTKHiJcVnJaDno6MBTsoLH0JI2Qy+ pCclk5U3ManBAdGGb9GOUh3BD/WJ+c/+ImqHM+EJzjmkrcGhLNjUbbY
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are some discussion around to opportunity to get rid of
CONFIG_HIGHMEM, see [1]. This RFC is a tentative to remove it
from powerpc so that people can experiment what it would
look like and what would be the outcomes.

CONFIG_HIGHMEM is being depracated, remove it.

To accomodate boards with up to 1Gbytes RAM, PAGE_OFFSET and
TASK_SIZE is adjusted to 0xb0000000 (a0000000 on book3s/32 with modules).

If you have more than 1Gbytes of RAM you can adjust CONFIG_LOWMEM_SIZE.

[1] https://lore.kernel.org/all/4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com/

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          | 17 ++---
 arch/powerpc/configs/44x/akebono_defconfig    |  1 -
 arch/powerpc/configs/44x/currituck_defconfig  |  1 -
 arch/powerpc/configs/44x/icon_defconfig       |  1 -
 arch/powerpc/configs/85xx-32bit.config        |  1 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig  |  1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig   |  1 -
 arch/powerpc/configs/85xx/ppa8548_defconfig   |  7 --
 arch/powerpc/configs/85xx/stx_gp3_defconfig   |  1 -
 arch/powerpc/configs/85xx/tqm8548_defconfig   |  1 -
 .../configs/85xx/xes_mpc85xx_defconfig        |  1 -
 arch/powerpc/configs/amigaone_defconfig       |  1 -
 arch/powerpc/configs/chrp32_defconfig         |  1 -
 arch/powerpc/configs/mpc86xx_base.config      |  1 -
 arch/powerpc/configs/pmac32_defconfig         |  1 -
 arch/powerpc/configs/ppc6xx_defconfig         |  2 -
 arch/powerpc/crypto/aes-gcm-p10-glue.c        |  2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h  | 10 ---
 arch/powerpc/include/asm/fixmap.h             |  8 ---
 arch/powerpc/include/asm/highmem.h            | 70 -------------------
 arch/powerpc/include/asm/kexec.h              |  1 -
 arch/powerpc/include/asm/kvm_ppc.h            |  1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h  | 10 ---
 arch/powerpc/kvm/book3s.c                     |  1 -
 arch/powerpc/kvm/book3s_32_mmu.c              |  1 -
 arch/powerpc/kvm/book3s_64_mmu.c              |  1 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |  1 -
 arch/powerpc/kvm/book3s_64_vio.c              |  1 -
 arch/powerpc/kvm/book3s_hv.c                  |  1 -
 arch/powerpc/kvm/book3s_hv_uvmem.c            |  2 +-
 arch/powerpc/kvm/book3s_pr.c                  |  1 -
 arch/powerpc/kvm/e500_mmu.c                   |  1 -
 arch/powerpc/kvm/e500_mmu_host.c              | 16 ++++-
 arch/powerpc/mm/book3s32/mmu.c                |  1 -
 arch/powerpc/mm/book3s32/tlb.c                |  1 -
 arch/powerpc/mm/cacheflush.c                  | 69 ++----------------
 arch/powerpc/mm/dma-noncoherent.c             | 48 +------------
 arch/powerpc/mm/fault.c                       |  1 -
 arch/powerpc/mm/init_32.c                     |  3 -
 arch/powerpc/mm/init_64.c                     |  1 -
 arch/powerpc/mm/mem.c                         | 18 -----
 arch/powerpc/mm/nohash/e500.c                 |  1 -
 arch/powerpc/mm/nohash/tlb.c                  |  1 -
 arch/powerpc/mm/nohash/tlb_64e.c              |  7 +-
 arch/powerpc/mm/pageattr.c                    |  3 -
 arch/powerpc/mm/pgtable_32.c                  |  1 -
 arch/powerpc/mm/ptdump/ptdump.c               |  9 ---
 arch/powerpc/platforms/44x/pci.c              |  3 +-
 arch/powerpc/platforms/85xx/smp.c             |  5 +-
 arch/powerpc/platforms/ps3/system-bus.c       |  2 +-
 arch/powerpc/xmon/xmon.c                      |  1 -
 51 files changed, 34 insertions(+), 308 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/highmem.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9f..fec1db5fcb97 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -482,11 +482,6 @@ source "arch/powerpc/platforms/Kconfig"
 
 menu "Kernel options"
 
-config HIGHMEM
-	bool "High memory support"
-	depends on PPC32
-	select KMAP_LOCAL
-
 source "kernel/Kconfig.hz"
 
 config MATH_EMULATION
@@ -1193,7 +1188,7 @@ config LOWMEM_SIZE_BOOL
 
 config LOWMEM_SIZE
 	hex "Maximum low memory size (in bytes)" if LOWMEM_SIZE_BOOL
-	default "0x30000000"
+	default "0x40000000"
 
 config LOWMEM_CAM_NUM_BOOL
 	bool "Set number of CAMs to use to map low memory"
@@ -1245,7 +1240,7 @@ config PAGE_OFFSET_BOOL
 
 config PAGE_OFFSET
 	hex "Virtual address of memory base" if PAGE_OFFSET_BOOL
-	default "0xc0000000"
+	default "0xb0000000"
 
 config KERNEL_START_BOOL
 	bool "Set custom kernel base address"
@@ -1261,8 +1256,8 @@ config KERNEL_START_BOOL
 config KERNEL_START
 	hex "Virtual address of kernel base" if KERNEL_START_BOOL
 	default PAGE_OFFSET if PAGE_OFFSET_BOOL
-	default "0xc2000000" if CRASH_DUMP && !NONSTATIC_KERNEL
-	default "0xc0000000"
+	default "0xb2000000" if CRASH_DUMP && !NONSTATIC_KERNEL
+	default "0xb0000000"
 
 config PHYSICAL_START_BOOL
 	bool "Set physical address where the kernel is loaded"
@@ -1298,8 +1293,8 @@ config TASK_SIZE_BOOL
 config TASK_SIZE
 	hex "Size of user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
-	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
-	default "0xc0000000"
+	default "0xa0000000" if PPC_BOOK3S_32 && EXECMEM
+	default "0xb0000000"
 
 config MODULES_SIZE_BOOL
 	bool "Set custom size for modules/execmem area"
diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index 1882eb2da354..816e7bdfffe7 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -14,7 +14,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_PPC_47x=y
 # CONFIG_EBONY is not set
 CONFIG_AKEBONO=y
-CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
 CONFIG_IRQ_ALL_CPUS=y
 # CONFIG_COMPACTION is not set
diff --git a/arch/powerpc/configs/44x/currituck_defconfig b/arch/powerpc/configs/44x/currituck_defconfig
index 7283b7d4a1a5..a20ee612e1ef 100644
--- a/arch/powerpc/configs/44x/currituck_defconfig
+++ b/arch/powerpc/configs/44x/currituck_defconfig
@@ -12,7 +12,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_PPC_47x=y
 # CONFIG_EBONY is not set
 CONFIG_CURRITUCK=y
-CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
 CONFIG_MATH_EMULATION=y
 CONFIG_IRQ_ALL_CPUS=y
diff --git a/arch/powerpc/configs/44x/icon_defconfig b/arch/powerpc/configs/44x/icon_defconfig
index fb9a15573546..42d27bc70ab7 100644
--- a/arch/powerpc/configs/44x/icon_defconfig
+++ b/arch/powerpc/configs/44x/icon_defconfig
@@ -8,7 +8,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_EBONY is not set
 CONFIG_ICON=y
-CONFIG_HIGHMEM=y
 CONFIG_PCIEPORTBUS=y
 # CONFIG_PCIEASPM is not set
 CONFIG_NET=y
diff --git a/arch/powerpc/configs/85xx-32bit.config b/arch/powerpc/configs/85xx-32bit.config
index a85310bcb1fd..f96db0bc888f 100644
--- a/arch/powerpc/configs/85xx-32bit.config
+++ b/arch/powerpc/configs/85xx-32bit.config
@@ -1,5 +1,4 @@
 CONFIG_PPC64=n
-CONFIG_HIGHMEM=y
 CONFIG_KEXEC=y
 CONFIG_PPC_85xx=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
index 7beb36a41d45..da9f649107dc 100644
--- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
+++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_GE_IMP3A=y
 CONFIG_QE_GPIO=y
 CONFIG_CPM2=y
-CONFIG_HIGHMEM=y
 CONFIG_HZ_1000=y
 CONFIG_PREEMPT=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/arch/powerpc/configs/85xx/ksi8560_defconfig b/arch/powerpc/configs/85xx/ksi8560_defconfig
index 9cb211fb6d1e..f2ac1fc41303 100644
--- a/arch/powerpc/configs/85xx/ksi8560_defconfig
+++ b/arch/powerpc/configs/85xx/ksi8560_defconfig
@@ -9,7 +9,6 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_KSI8560=y
 CONFIG_CPM2=y
 CONFIG_GEN_RTC=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=y
 CONFIG_MATH_EMULATION=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/powerpc/configs/85xx/ppa8548_defconfig b/arch/powerpc/configs/85xx/ppa8548_defconfig
index 4bd5f993d26a..2aab8602d71e 100644
--- a/arch/powerpc/configs/85xx/ppa8548_defconfig
+++ b/arch/powerpc/configs/85xx/ppa8548_defconfig
@@ -10,15 +10,8 @@ CONFIG_RAPIDIO_ENUM_BASIC=y
 CONFIG_RAPIDIO_CPS_XX=y
 CONFIG_RAPIDIO_CPS_GEN2=y
 CONFIG_ADVANCED_OPTIONS=y
-CONFIG_LOWMEM_SIZE_BOOL=y
-CONFIG_LOWMEM_SIZE=0x40000000
 CONFIG_LOWMEM_CAM_NUM_BOOL=y
 CONFIG_LOWMEM_CAM_NUM=4
-CONFIG_PAGE_OFFSET_BOOL=y
-CONFIG_PAGE_OFFSET=0xb0000000
-CONFIG_KERNEL_START_BOOL=y
-CONFIG_TASK_SIZE_BOOL=y
-CONFIG_TASK_SIZE=0xb0000000
 CONFIG_NET=y
 CONFIG_INET=y
 CONFIG_IP_PNP=y
diff --git a/arch/powerpc/configs/85xx/stx_gp3_defconfig b/arch/powerpc/configs/85xx/stx_gp3_defconfig
index 0a42072fa23c..1033977711d6 100644
--- a/arch/powerpc/configs/85xx/stx_gp3_defconfig
+++ b/arch/powerpc/configs/85xx/stx_gp3_defconfig
@@ -7,7 +7,6 @@ CONFIG_MODULES=y
 CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_STX_GP3=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=m
 CONFIG_MATH_EMULATION=y
 CONFIG_PCI=y
diff --git a/arch/powerpc/configs/85xx/tqm8548_defconfig b/arch/powerpc/configs/85xx/tqm8548_defconfig
index afa1b9b633f8..06928dd9bd88 100644
--- a/arch/powerpc/configs/85xx/tqm8548_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8548_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_MSDOS_PARTITION is not set
 CONFIG_TQM8548=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=y
 CONFIG_MATH_EMULATION=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
index 488d03ae6d6c..10764fad2eb9 100644
--- a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
+++ b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
@@ -18,7 +18,6 @@ CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_XES_MPC85xx=y
-CONFIG_HIGHMEM=y
 CONFIG_MATH_EMULATION=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
diff --git a/arch/powerpc/configs/amigaone_defconfig b/arch/powerpc/configs/amigaone_defconfig
index 69ef3dc31c4b..f9e02bd217d6 100644
--- a/arch/powerpc/configs/amigaone_defconfig
+++ b/arch/powerpc/configs/amigaone_defconfig
@@ -18,7 +18,6 @@ CONFIG_AMIGA_PARTITION=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_AMIGAONE=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/chrp32_defconfig b/arch/powerpc/configs/chrp32_defconfig
index b799c95480ae..304de18b51f8 100644
--- a/arch/powerpc/configs/chrp32_defconfig
+++ b/arch/powerpc/configs/chrp32_defconfig
@@ -17,7 +17,6 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_MAC_PARTITION=y
 # CONFIG_PPC_PMAC is not set
 CONFIG_GEN_RTC=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_ISA=y
diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
index 632c014b122d..a1ca1f7da240 100644
--- a/arch/powerpc/configs/mpc86xx_base.config
+++ b/arch/powerpc/configs/mpc86xx_base.config
@@ -3,6 +3,5 @@ CONFIG_GEF_PPC9A=y
 CONFIG_GEF_SBC310=y
 CONFIG_GEF_SBC610=y
 CONFIG_MVME7100=y
-CONFIG_HIGHMEM=y
 CONFIG_KEXEC=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index ae45f70b29f0..24e73489947a 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -20,7 +20,6 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_PMAC=y
 CONFIG_GEN_RTC=y
-CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=m
 CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index bb359643ddc1..75b44ce12332 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -60,7 +60,6 @@ CONFIG_TAU=y
 CONFIG_TAU_AVERAGE=y
 CONFIG_QE_GPIO=y
 CONFIG_MCU_MPC8349EMITX=y
-CONFIG_HIGHMEM=y
 CONFIG_HZ_1000=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BINFMT_MISC=y
@@ -1045,7 +1044,6 @@ CONFIG_DEBUG_OBJECTS_TIMERS=y
 CONFIG_SLUB_DEBUG_ON=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_VM=y
-CONFIG_DEBUG_HIGHMEM=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_DEBUG_SHIRQ=y
 CONFIG_DEBUG_RT_MUTEXES=y
diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index 85f4fd4b1bdc..cba2a42be9cd 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -233,7 +233,7 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
 
 	/* Linearize assoc, if not already linear */
 	if (req->src->length >= assoclen && req->src->length) {
-		assoc = sg_virt(req->src); /* ppc64 is !HIGHMEM */
+		assoc = sg_virt(req->src);
 	} else {
 		gfp_t flags = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
 			      GFP_KERNEL : GFP_ATOMIC;
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 87dcca962be7..64c106b72da3 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -139,12 +139,6 @@ void unmap_kernel_page(unsigned long va);
 
 #endif /* !__ASSEMBLER__ */
 
-/*
- * This is the bottom of the PKMAP area with HIGHMEM or an arbitrary
- * value (for now) on others, from where we can start layout kernel
- * virtual space that goes below PKMAP and FIXMAP
- */
-
 #define FIXADDR_SIZE	0
 #ifdef CONFIG_KASAN
 #include <asm/kasan.h>
@@ -158,11 +152,7 @@ void unmap_kernel_page(unsigned long va);
  * until mem_init() at which point this becomes the top of the vmalloc
  * and ioremap space
  */
-#ifdef CONFIG_HIGHMEM
-#define IOREMAP_TOP	PKMAP_BASE
-#else
 #define IOREMAP_TOP	FIXADDR_START
-#endif
 
 /* PPC32 shares vmalloc area with ioremap */
 #define IOREMAP_START	VMALLOC_START
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index bc5109eab5b7..6d46fc296909 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -18,10 +18,6 @@
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
 #include <asm/page.h>
-#ifdef CONFIG_HIGHMEM
-#include <linux/threads.h>
-#include <asm/kmap_size.h>
-#endif
 
 /*
  * Here we define all the compile-time 'special' virtual
@@ -47,10 +43,6 @@ enum fixed_addresses {
 	/* reserve the top 128K for early debugging purposes */
 	FIX_EARLY_DEBUG_TOP = FIX_HOLE,
 	FIX_EARLY_DEBUG_BASE = FIX_EARLY_DEBUG_TOP+(ALIGN(SZ_128K, PAGE_SIZE)/PAGE_SIZE)-1,
-#ifdef CONFIG_HIGHMEM
-	FIX_KMAP_BEGIN,	/* reserved pte's for temporary kernel mappings */
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
-#endif
 #ifdef CONFIG_PPC_8xx
 	/* For IMMR we need an aligned 512K area */
 #define FIX_IMMR_SIZE	(512 * 1024 / PAGE_SIZE)
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
deleted file mode 100644
index c0fcd1bbdba9..000000000000
--- a/arch/powerpc/include/asm/highmem.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * highmem.h: virtual kernel memory mappings for high memory
- *
- * PowerPC version, stolen from the i386 version.
- *
- * Used in CONFIG_HIGHMEM systems for memory pages which
- * are not addressable by direct kernel virtual addresses.
- *
- * Copyright (C) 1999 Gerhard Wichert, Siemens AG
- *		      Gerhard.Wichert@pdb.siemens.de
- *
- *
- * Redesigned the x86 32-bit VM architecture to deal with
- * up to 16 Terrabyte physical memory. With current x86 CPUs
- * we now support up to 64 Gigabytes physical RAM.
- *
- * Copyright (C) 1999 Ingo Molnar <mingo@redhat.com>
- */
-
-#ifndef _ASM_HIGHMEM_H
-#define _ASM_HIGHMEM_H
-
-#ifdef __KERNEL__
-
-#include <linux/interrupt.h>
-#include <asm/cacheflush.h>
-#include <asm/page.h>
-#include <asm/fixmap.h>
-
-extern pte_t *pkmap_page_table;
-
-/*
- * Right now we initialize only a single pte table. It can be extended
- * easily, subsequent pte tables have to be allocated in one physical
- * chunk of RAM.
- */
-/*
- * We use one full pte table with 4K pages. And with 16K/64K/256K pages pte
- * table covers enough memory (32MB/512MB/2GB resp.), so that both FIXMAP
- * and PKMAP can be placed in a single pte table. We use 512 pages for PKMAP
- * in case of 16K/64K/256K page sizes.
- */
-#ifdef CONFIG_PPC_4K_PAGES
-#define PKMAP_ORDER	PTE_SHIFT
-#else
-#define PKMAP_ORDER	9
-#endif
-#define LAST_PKMAP	(1 << PKMAP_ORDER)
-#ifndef CONFIG_PPC_4K_PAGES
-#define PKMAP_BASE	(FIXADDR_START - PAGE_SIZE*(LAST_PKMAP + 1))
-#else
-#define PKMAP_BASE	((FIXADDR_START - PAGE_SIZE*(LAST_PKMAP + 1)) & PMD_MASK)
-#endif
-#define LAST_PKMAP_MASK	(LAST_PKMAP-1)
-#define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
-#define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
-
-#define flush_cache_kmaps()	flush_cache_all()
-
-#define arch_kmap_local_set_pte(mm, vaddr, ptep, ptev)	\
-	__set_pte_at(mm, vaddr, ptep, ptev, 1)
-#define arch_kmap_local_post_map(vaddr, pteval)	\
-	local_flush_tlb_page(NULL, vaddr)
-#define arch_kmap_local_post_unmap(vaddr)	\
-	local_flush_tlb_page(NULL, vaddr)
-
-#endif /* __KERNEL__ */
-
-#endif /* _ASM_HIGHMEM_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 4bbf9f699aaa..397bca781111 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -23,7 +23,6 @@
 
 /*
  * Maximum address we can reach in physical address mode.
- * XXX: I want to allow initrd in highmem. Otherwise set to rmo on LPAR.
  */
 #define KEXEC_DESTINATION_MEMORY_LIMIT (-1UL)
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index ca3829d47ab7..a52abc65f2b0 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -61,7 +61,6 @@ enum xlate_readwrite {
 
 extern int kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
 extern int __kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
-extern void kvmppc_handler_highmem(void);
 
 extern void kvmppc_dump_vcpu(struct kvm_vcpu *vcpu);
 extern int kvmppc_handle_load(struct kvm_vcpu *vcpu,
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 2d71e4b7cd09..f11c898a32a2 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -54,12 +54,6 @@
 #define pgd_ERROR(e) \
 	pr_err("%s:%d: bad pgd %08llx.\n", __FILE__, __LINE__, (unsigned long long)pgd_val(e))
 
-/*
- * This is the bottom of the PKMAP area with HIGHMEM or an arbitrary
- * value (for now) on others, from where we can start layout kernel
- * virtual space that goes below PKMAP and FIXMAP
- */
-
 #define FIXADDR_SIZE	0
 #ifdef CONFIG_KASAN
 #include <asm/kasan.h>
@@ -73,11 +67,7 @@
  * until mem_init() at which point this becomes the top of the vmalloc
  * and ioremap space
  */
-#ifdef CONFIG_HIGHMEM
-#define IOREMAP_TOP	PKMAP_BASE
-#else
 #define IOREMAP_TOP	FIXADDR_START
-#endif
 
 /* PPC32 shares vmalloc area with ioremap */
 #define IOREMAP_START	VMALLOC_START
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index d79c5d1098c0..7489557f582a 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -20,7 +20,6 @@
 #include <linux/gfp.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
-#include <linux/highmem.h>
 
 #include <asm/reg.h>
 #include <asm/cputable.h>
diff --git a/arch/powerpc/kvm/book3s_32_mmu.c b/arch/powerpc/kvm/book3s_32_mmu.c
index 0215f32932a9..efc2135658dc 100644
--- a/arch/powerpc/kvm/book3s_32_mmu.c
+++ b/arch/powerpc/kvm/book3s_32_mmu.c
@@ -10,7 +10,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
diff --git a/arch/powerpc/kvm/book3s_64_mmu.c b/arch/powerpc/kvm/book3s_64_mmu.c
index 61290282fd9e..92945a74cb24 100644
--- a/arch/powerpc/kvm/book3s_64_mmu.c
+++ b/arch/powerpc/kvm/book3s_64_mmu.c
@@ -10,7 +10,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index f305395cf26e..394f0417189b 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -8,7 +8,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
 #include <linux/hugetlb.h>
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 742aa58a7c7e..9842657aa52a 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -10,7 +10,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7667563fb9ff..b98e14c69e20 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -35,7 +35,6 @@
 #include <linux/debugfs.h>
 #include <linux/gfp.h>
 #include <linux/vmalloc.h>
-#include <linux/highmem.h>
 #include <linux/hugetlb.h>
 #include <linux/kvm_irqfd.h>
 #include <linux/irqbypass.h>
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 03f8c34fa0a2..8aa0680addf8 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -547,7 +547,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	if (!is_zone_device_page(spage))
 		goto out_finalize;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vma, start);
+	dpage = alloc_page_vma(GFP_USER, vma, start);
 	if (!dpage) {
 		ret = -1;
 		goto out_finalize;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 83bcdc80ce51..2ae100709336 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -36,7 +36,6 @@
 #include <linux/gfp.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
-#include <linux/highmem.h>
 #include <linux/module.h>
 #include <linux/miscdevice.h>
 #include <asm/asm-prototypes.h>
diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index e131fbecdcc4..e9e94e053e7b 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -19,7 +19,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 #include <linux/log2.h>
 #include <linux/uaccess.h>
 #include <linux/sched.h>
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 06caf8bbbe2b..6f986b4e3c62 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -19,7 +19,6 @@
 #include <linux/string.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/highmem.h>
 #include <linux/log2.h>
 #include <linux/uaccess.h>
 #include <linux/sched/mm.h>
@@ -667,9 +666,20 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 
 	/* Map a page and get guest's instruction */
 	page = pfn_to_page(pfn);
-	eaddr = (unsigned long)kmap_atomic(page);
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		migrate_disable();
+	else
+		preempt_disable();
+	pagefault_disable();
+	eaddr = (unsigned long)page_address(page);
+
 	*instr = *(u32 *)(eaddr | (unsigned long)(addr & ~PAGE_MASK));
-	kunmap_atomic((u32 *)eaddr);
+
+	pagefault_enable();
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		migrate_enable();
+	else
+		preempt_enable();
 
 	return EMULATE_DONE;
 }
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index be9c4106e22f..b26ce728cdb0 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <linux/memblock.h>
 
 #include <asm/mmu.h>
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 9ad6b56bfec9..dfd136358644 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <linux/pagemap.h>
 #include <linux/export.h>
 
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 7186516eca52..052c030a577f 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#include <linux/highmem.h>
+#include <linux/cacheflush.h>
 #include <linux/kprobes.h>
 
 /**
@@ -76,51 +76,6 @@ void flush_icache_range(unsigned long start, unsigned long stop)
 }
 EXPORT_SYMBOL(flush_icache_range);
 
-#ifdef CONFIG_HIGHMEM
-/**
- * flush_dcache_icache_phys() - Flush a page by its physical address
- * @physaddr: the physical address of the page
- */
-static void flush_dcache_icache_phys(unsigned long physaddr)
-{
-	unsigned long bytes = l1_dcache_bytes();
-	unsigned long nb = PAGE_SIZE / bytes;
-	unsigned long addr = physaddr & PAGE_MASK;
-	unsigned long msr, msr0;
-	unsigned long loop1 = addr, loop2 = addr;
-
-	msr0 = mfmsr();
-	msr = msr0 & ~MSR_DR;
-	/*
-	 * This must remain as ASM to prevent potential memory accesses
-	 * while the data MMU is disabled
-	 */
-	asm volatile(
-		"   mtctr %2;\n"
-		"   mtmsr %3;\n"
-		"   isync;\n"
-		"0: dcbst   0, %0;\n"
-		"   addi    %0, %0, %4;\n"
-		"   bdnz    0b;\n"
-		"   sync;\n"
-		"   mtctr %2;\n"
-		"1: icbi    0, %1;\n"
-		"   addi    %1, %1, %4;\n"
-		"   bdnz    1b;\n"
-		"   sync;\n"
-		"   mtmsr %5;\n"
-		"   isync;\n"
-		: "+&r" (loop1), "+&r" (loop2)
-		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
-		: "ctr", "memory");
-}
-NOKPROBE_SYMBOL(flush_dcache_icache_phys)
-#else
-static void flush_dcache_icache_phys(unsigned long physaddr)
-{
-}
-#endif
-
 /**
  * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
  * Note: this is necessary because the instruction cache does *not*
@@ -151,26 +106,13 @@ static void __flush_dcache_icache(void *p)
 void flush_dcache_icache_folio(struct folio *folio)
 {
 	unsigned int i, nr = folio_nr_pages(folio);
+	void *addr = folio_address(folio);
 
 	if (flush_coherent_icache())
 		return;
 
-	if (!folio_test_highmem(folio)) {
-		void *addr = folio_address(folio);
-		for (i = 0; i < nr; i++)
-			__flush_dcache_icache(addr + i * PAGE_SIZE);
-	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
-		for (i = 0; i < nr; i++) {
-			void *start = kmap_local_folio(folio, i * PAGE_SIZE);
-
-			__flush_dcache_icache(start);
-			kunmap_local(start);
-		}
-	} else {
-		unsigned long pfn = folio_pfn(folio);
-		for (i = 0; i < nr; i++)
-			flush_dcache_icache_phys((pfn + i) * PAGE_SIZE);
-	}
+	for (i = 0; i < nr; i++)
+		__flush_dcache_icache(addr + i * PAGE_SIZE);
 }
 EXPORT_SYMBOL(flush_dcache_icache_folio);
 
@@ -215,7 +157,6 @@ void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 {
 	void *maddr;
 
-	maddr = kmap_local_page(page) + (addr & ~PAGE_MASK);
+	maddr = page_address(page) + (addr & ~PAGE_MASK);
 	flush_icache_range((unsigned long)maddr, (unsigned long)maddr + len);
-	kunmap_local(maddr);
 }
diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..0ca7e06c8eb3 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -9,7 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/types.h>
-#include <linux/highmem.h>
+#include <linux/cacheflush.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 
@@ -46,47 +46,6 @@ static void __dma_sync(void *vaddr, size_t size, int direction)
 	}
 }
 
-#ifdef CONFIG_HIGHMEM
-/*
- * __dma_sync_page() implementation for systems using highmem.
- * In this case, each page of a buffer must be kmapped/kunmapped
- * in order to have a virtual address for __dma_sync(). This must
- * not sleep so kmap_atomic()/kunmap_atomic() are used.
- *
- * Note: yes, it is possible and correct to have a buffer extend
- * beyond the first page.
- */
-static inline void __dma_sync_page_highmem(struct page *page,
-		unsigned long offset, size_t size, int direction)
-{
-	size_t seg_size = min((size_t)(PAGE_SIZE - offset), size);
-	size_t cur_size = seg_size;
-	unsigned long flags, start, seg_offset = offset;
-	int nr_segs = 1 + ((size - seg_size) + PAGE_SIZE - 1)/PAGE_SIZE;
-	int seg_nr = 0;
-
-	local_irq_save(flags);
-
-	do {
-		start = (unsigned long)kmap_atomic(page + seg_nr) + seg_offset;
-
-		/* Sync this buffer segment */
-		__dma_sync((void *)start, seg_size, direction);
-		kunmap_atomic((void *)start);
-		seg_nr++;
-
-		/* Calculate next buffer segment size */
-		seg_size = min((size_t)PAGE_SIZE, size - cur_size);
-
-		/* Add the segment size to our running total */
-		cur_size += seg_size;
-		seg_offset = 0;
-	} while (seg_nr < nr_segs);
-
-	local_irq_restore(flags);
-}
-#endif /* CONFIG_HIGHMEM */
-
 /*
  * __dma_sync_page makes memory consistent. identical to __dma_sync, but
  * takes a struct page instead of a virtual address
@@ -95,13 +54,8 @@ static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned offset = paddr & ~PAGE_MASK;
-
-#ifdef CONFIG_HIGHMEM
-	__dma_sync_page_highmem(page, offset, size, dir);
-#else
 	unsigned long start = (unsigned long)page_address(page) + offset;
 	__dma_sync((void *)start, size, dir);
-#endif
 }
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 806c74e0d5ab..cec4e163f8ac 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -24,7 +24,6 @@
 #include <linux/mman.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
-#include <linux/highmem.h>
 #include <linux/extable.h>
 #include <linux/kprobes.h>
 #include <linux/kdebug.h>
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 4e71dfe7d026..a5e7cafb50ab 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -21,7 +21,6 @@
 #include <linux/mm.h>
 #include <linux/stddef.h>
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <linux/initrd.h>
 #include <linux/pagemap.h>
 #include <linux/memblock.h>
@@ -96,10 +95,8 @@ void __init MMU_init(void)
 	if (total_lowmem > __max_low_memory) {
 		total_lowmem = __max_low_memory;
 		lowmem_end_addr = memstart_addr + total_lowmem;
-#ifndef CONFIG_HIGHMEM
 		total_memory = total_lowmem;
 		memblock_enforce_memory_limit(total_lowmem);
-#endif /* CONFIG_HIGHMEM */
 	}
 
 	/* Initialize the MMU hardware */
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index b6f3ae03ca9e..547745ea99e1 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -29,7 +29,6 @@
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/nodemask.h>
 #include <linux/module.h>
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3ddbfdbfa941..edd6c4964718 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -13,7 +13,6 @@
  */
 
 #include <linux/memblock.h>
-#include <linux/highmem.h>
 #include <linux/suspend.h>
 #include <linux/dma-direct.h>
 #include <linux/execmem.h>
@@ -172,9 +171,6 @@ void __init mem_topology_setup(void)
 {
 	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	min_low_pfn = MEMORY_START >> PAGE_SHIFT;
-#ifdef CONFIG_HIGHMEM
-	max_low_pfn = lowmem_end_addr >> PAGE_SHIFT;
-#endif
 
 	/* Place all memblock_regions in the same node and merge contiguous
 	 * memblock_regions
@@ -232,17 +228,6 @@ void __init paging_init(void)
 	phys_addr_t top_of_ram = memblock_end_of_DRAM();
 	int zone_dma_bits;
 
-#ifdef CONFIG_HIGHMEM
-	unsigned long v = __fix_to_virt(FIX_KMAP_END);
-	unsigned long end = __fix_to_virt(FIX_KMAP_BEGIN);
-
-	for (; v < end; v += PAGE_SIZE)
-		map_kernel_page(v, 0, __pgprot(0)); /* XXX gross */
-
-	map_kernel_page(PKMAP_BASE, 0, __pgprot(0));	/* XXX gross */
-	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
-#endif /* CONFIG_HIGHMEM */
-
 	printk(KERN_DEBUG "Top of RAM: 0x%llx, Total RAM: 0x%llx\n",
 	       (unsigned long long)top_of_ram, total_ram);
 	printk(KERN_DEBUG "Memory hole size: %ldMB\n",
@@ -264,9 +249,6 @@ void __init paging_init(void)
 				      1UL << (zone_dma_bits - PAGE_SHIFT));
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-#ifdef CONFIG_HIGHMEM
-	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
-#endif
 
 	free_area_init(max_zone_pfns);
 
diff --git a/arch/powerpc/mm/nohash/e500.c b/arch/powerpc/mm/nohash/e500.c
index 266fb22131fc..23b111afbdfd 100644
--- a/arch/powerpc/mm/nohash/e500.c
+++ b/arch/powerpc/mm/nohash/e500.c
@@ -34,7 +34,6 @@
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 0a650742f3a0..ec1f58b23865 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -26,7 +26,6 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <linux/pagemap.h>
 #include <linux/preempt.h>
 #include <linux/spinlock.h>
diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index 4f925adf2695..9e2f94ffc90f 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -263,8 +263,7 @@ static void __init early_mmu_set_memory_limit(void)
 	 * Limit memory so we dont have linear faults.
 	 * Unlike memblock_set_current_limit, which limits
 	 * memory available during early boot, this permanently
-	 * reduces the memory available to Linux.  We need to
-	 * do this because highmem is not supported on 64-bit.
+	 * reduces the memory available to Linux.
 	 */
 	memblock_enforce_memory_limit(linear_map_top);
 
@@ -290,8 +289,8 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	/*
 	 * On FSL Embedded 64-bit, usually all RAM is bolted, but with
 	 * unusual memory sizes it's possible for some RAM to not be mapped
-	 * (such RAM is not used at all by Linux, since we don't support
-	 * highmem on 64-bit).  We limit ppc64_rma_size to what would be
+	 * (such RAM is not used at all by Linux.
+	 * We limit ppc64_rma_size to what would be
 	 * mappable if this memblock is the only one.  Additional memblocks
 	 * can only increase, not decrease, the amount that ends up getting
 	 * mapped.  We still limit max to 1G even if we'll eventually map
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ac22bf28086f..2643f50ede1c 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -110,9 +110,6 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 	int err;
 	unsigned long addr = (unsigned long)page_address(page);
 
-	if (PageHighMem(page))
-		return;
-
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
 		err = hash__kernel_map_pages(page, numpages, enable);
 	else if (enable)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 15276068f657..cf24685df64a 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -20,7 +20,6 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index b2358d794855..708fdafeb2a3 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -15,7 +15,6 @@
 #include <linux/hugetlb.h>
 #include <linux/io.h>
 #include <linux/mm.h>
-#include <linux/highmem.h>
 #include <linux/ptdump.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -91,10 +90,6 @@ static struct addr_marker address_markers[] = {
 #else
 	{ 0,	"Early I/O remap start" },
 	{ 0,	"Early I/O remap end" },
-#ifdef CONFIG_HIGHMEM
-	{ 0,	"Highmem PTEs start" },
-	{ 0,	"Highmem PTEs end" },
-#endif
 	{ 0,	"Fixmap start" },
 	{ 0,	"Fixmap end" },
 #endif
@@ -285,10 +280,6 @@ static void populate_markers(void)
 #else /* !CONFIG_PPC64 */
 	address_markers[i++].start_address = ioremap_bot;
 	address_markers[i++].start_address = IOREMAP_TOP;
-#ifdef CONFIG_HIGHMEM
-	address_markers[i++].start_address = PKMAP_BASE;
-	address_markers[i++].start_address = PKMAP_ADDR(LAST_PKMAP);
-#endif
 	address_markers[i++].start_address = FIXADDR_START;
 	address_markers[i++].start_address = FIXADDR_TOP;
 #endif /* CONFIG_PPC64 */
diff --git a/arch/powerpc/platforms/44x/pci.c b/arch/powerpc/platforms/44x/pci.c
index 364aeb86ab64..993ff920caa3 100644
--- a/arch/powerpc/platforms/44x/pci.c
+++ b/arch/powerpc/platforms/44x/pci.c
@@ -1833,8 +1833,7 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
 	hose->last_busno = bus_range ? bus_range[1] : 0xff;
 
 	/* Because of how big mapping the config space is (1M per bus), we
-	 * limit how many busses we support. In the long run, we could replace
-	 * that with something akin to kmap_atomic instead. We set aside 1 bus
+	 * limit how many busses we support. We set aside 1 bus
 	 * for the host itself too.
 	 */
 	busses = hose->last_busno - hose->first_busno; /* This is off by 1 */
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 32fa5fb557c0..f0dad94008b9 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -13,7 +13,6 @@
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/kexec.h>
-#include <linux/highmem.h>
 #include <linux/cpu.h>
 #include <linux/fsl/guts.h>
 #include <linux/pgtable.h>
@@ -204,8 +203,8 @@ static int smp_85xx_start_cpu(int cpu)
 
 	/*
 	 * A secondary core could be in a spinloop in the bootpage
-	 * (0xfffff000), somewhere in highmem, or somewhere in lowmem.
-	 * The bootpage and highmem can be accessed via ioremap(), but
+	 * (0xfffff000), somewhere in lowmem.
+	 * The bootpage can be accessed via ioremap(), but
 	 * we need to directly access the spinloop if its in lowmem.
 	 */
 	ioremappable = *cpu_rel_addr > virt_to_phys(high_memory - 1);
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index afbaabf182d0..1f20311ed0c9 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -510,7 +510,7 @@ static void * ps3_alloc_coherent(struct device *_dev, size_t size,
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
 	unsigned long virt_addr;
 
-	flag &= ~(__GFP_DMA | __GFP_HIGHMEM);
+	flag &= ~__GFP_DMA;
 	flag |= __GFP_ZERO;
 
 	virt_addr = __get_free_pages(flag, get_order(size));
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index cb3a3244ae6f..6be4b0ea9a82 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -24,7 +24,6 @@
 #include <linux/bug.h>
 #include <linux/nmi.h>
 #include <linux/ctype.h>
-#include <linux/highmem.h>
 #include <linux/security.h>
 #include <linux/debugfs.h>
 
-- 
2.49.0




