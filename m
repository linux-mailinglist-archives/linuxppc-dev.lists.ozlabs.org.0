Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3084D2152
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KClZz1n96z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 06:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KClY61lGSz3bff
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 06:20:58 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KClXm2rvYz9sSV;
 Tue,  8 Mar 2022 20:20:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkZyJv_uXUYZ; Tue,  8 Mar 2022 20:20:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KClXj2V9Mz9sSW;
 Tue,  8 Mar 2022 20:20:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 454508B763;
 Tue,  8 Mar 2022 20:20:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PLWLDjQjh2Nk; Tue,  8 Mar 2022 20:20:37 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 341C68B77D;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228JKUlm3553857
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 20:20:30 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228JKUZe3553856;
 Tue, 8 Mar 2022 20:20:30 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 5/6] powerpc: Remove asm/prom.h from all files that don't
 need it
Date: Tue,  8 Mar 2022 20:20:24 +0100
Message-Id: <7c9b8fda63dcf63e1b28f43e7ebdb95182cbc286.1646767214.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
References: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646767223; l=37172; s=20211009;
 h=from:subject:message-id; bh=1P3zpKx1xT4PBIw0mQ4MkamoT60S6fLcRt5n7A5Zgug=;
 b=U8neloG6otfUr7/jt54LCJ1LKirgQUPD1ax6irHVbQD3V2i7p/irZ2E1mItES3HKe7E7Ol9SzHv9
 UwK0eNs4B7xNqjXidFcTrJ1Wz/bLkV6+k0z9P1Fscl9jOIhkcMeG
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several files include asm/prom.h for no reason.

Clean it up.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/cacheinfo.c                  | 1 -
 arch/powerpc/kernel/eeh_driver.c                 | 1 -
 arch/powerpc/kernel/iommu.c                      | 1 -
 arch/powerpc/kernel/irq.c                        | 1 -
 arch/powerpc/kernel/pci_32.c                     | 1 -
 arch/powerpc/kernel/process.c                    | 1 -
 arch/powerpc/kernel/prom.c                       | 1 -
 arch/powerpc/kernel/prom_parse.c                 | 1 -
 arch/powerpc/kernel/rtas-rtc.c                   | 1 -
 arch/powerpc/kernel/rtasd.c                      | 1 -
 arch/powerpc/kernel/smp.c                        | 1 -
 arch/powerpc/kernel/vdso.c                       | 1 -
 arch/powerpc/kexec/core.c                        | 1 -
 arch/powerpc/kexec/crash.c                       | 1 -
 arch/powerpc/mm/book3s32/mmu.c                   | 1 -
 arch/powerpc/mm/init_32.c                        | 1 -
 arch/powerpc/mm/nohash/40x.c                     | 1 -
 arch/powerpc/mm/nohash/fsl_book3e.c              | 1 -
 arch/powerpc/mm/nohash/kaslr_booke.c             | 1 -
 arch/powerpc/mm/numa.c                           | 1 -
 arch/powerpc/mm/pgtable_64.c                     | 1 -
 arch/powerpc/platforms/40x/ppc40x_simple.c       | 1 -
 arch/powerpc/platforms/44x/ppc44x_simple.c       | 1 -
 arch/powerpc/platforms/44x/sam440ep.c            | 1 -
 arch/powerpc/platforms/512x/mpc5121_ads.c        | 1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c    | 1 -
 arch/powerpc/platforms/52xx/efika.c              | 1 -
 arch/powerpc/platforms/52xx/lite5200.c           | 1 -
 arch/powerpc/platforms/82xx/ep8248e.c            | 1 -
 arch/powerpc/platforms/82xx/km82xx.c             | 1 -
 arch/powerpc/platforms/83xx/km83xx.c             | 1 -
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c   | 1 -
 arch/powerpc/platforms/83xx/mpc832x_mds.c        | 1 -
 arch/powerpc/platforms/83xx/mpc834x_itx.c        | 1 -
 arch/powerpc/platforms/83xx/mpc836x_mds.c        | 1 -
 arch/powerpc/platforms/83xx/mpc836x_rdk.c        | 1 -
 arch/powerpc/platforms/85xx/corenet_generic.c    | 1 -
 arch/powerpc/platforms/85xx/ksi8560.c            | 1 -
 arch/powerpc/platforms/85xx/mpc8536_ds.c         | 1 -
 arch/powerpc/platforms/85xx/mpc85xx_mds.c        | 1 -
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c        | 1 -
 arch/powerpc/platforms/85xx/p1010rdb.c           | 1 -
 arch/powerpc/platforms/85xx/socrates.c           | 1 -
 arch/powerpc/platforms/85xx/stx_gp3.c            | 1 -
 arch/powerpc/platforms/85xx/tqm85xx.c            | 1 -
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c       | 1 -
 arch/powerpc/platforms/8xx/adder875.c            | 1 -
 arch/powerpc/platforms/cell/cbe_thermal.c        | 1 -
 arch/powerpc/platforms/cell/pervasive.c          | 1 -
 arch/powerpc/platforms/cell/setup.c              | 1 -
 arch/powerpc/platforms/cell/smp.c                | 1 -
 arch/powerpc/platforms/cell/spu_base.c           | 1 -
 arch/powerpc/platforms/cell/spu_priv1_mmio.c     | 1 -
 arch/powerpc/platforms/chrp/smp.c                | 1 -
 arch/powerpc/platforms/embedded6xx/gamecube.c    | 1 -
 arch/powerpc/platforms/embedded6xx/linkstation.c | 1 -
 arch/powerpc/platforms/embedded6xx/storcenter.c  | 1 -
 arch/powerpc/platforms/powermac/backlight.c      | 1 -
 arch/powerpc/platforms/powermac/feature.c        | 1 -
 arch/powerpc/platforms/powermac/setup.c          | 1 -
 arch/powerpc/platforms/powermac/udbg_adb.c       | 1 -
 arch/powerpc/platforms/powermac/udbg_scc.c       | 1 -
 arch/powerpc/platforms/powernv/pci.c             | 1 -
 arch/powerpc/platforms/ps3/htab.c                | 1 -
 arch/powerpc/platforms/ps3/mm.c                  | 1 -
 arch/powerpc/platforms/ps3/os-area.c             | 2 --
 arch/powerpc/platforms/pseries/dlpar.c           | 1 -
 arch/powerpc/platforms/pseries/hotplug-memory.c  | 1 -
 arch/powerpc/platforms/pseries/lpar.c            | 1 -
 arch/powerpc/platforms/pseries/lparcfg.c         | 1 -
 arch/powerpc/platforms/pseries/pci.c             | 1 -
 arch/powerpc/platforms/pseries/pmem.c            | 1 -
 arch/powerpc/platforms/pseries/reconfig.c        | 1 -
 arch/powerpc/platforms/pseries/smp.c             | 1 -
 arch/powerpc/sysdev/fsl_soc.c                    | 1 -
 arch/powerpc/sysdev/indirect_pci.c               | 1 -
 arch/powerpc/sysdev/xics/ics-native.c            | 1 -
 arch/powerpc/sysdev/xics/ics-opal.c              | 1 -
 arch/powerpc/sysdev/xics/ics-rtas.c              | 1 -
 arch/powerpc/xmon/xmon.c                         | 1 -
 80 files changed, 81 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 00b0992be3e7..f502337dd37d 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -18,7 +18,6 @@
 #include <linux/of.h>
 #include <linux/percpu.h>
 #include <linux/slab.h>
-#include <asm/prom.h>
 #include <asm/cputhreads.h>
 #include <asm/smp.h>
 
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 422f80b5b27b..260273e56431 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -16,7 +16,6 @@
 #include <asm/eeh_event.h>
 #include <asm/ppc-pci.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 
 struct eeh_rmv_data {
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 07093b7cdcb9..d440a2436feb 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -27,7 +27,6 @@
 #include <linux/sched.h>
 #include <linux/debugfs.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/iommu.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 752fb182eacb..0fe38e3c5757 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -58,7 +58,6 @@
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/cache.h>
-#include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/machdep.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 48537964fba1..5a174936c9a0 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -21,7 +21,6 @@
 
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/sections.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 984813a4d5dc..8125517427b5 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -45,7 +45,6 @@
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/runlatch.h>
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 86c4f009563d..feae8509b59c 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -31,7 +31,6 @@
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
 
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/page.h>
 #include <asm/processor.h>
diff --git a/arch/powerpc/kernel/prom_parse.c b/arch/powerpc/kernel/prom_parse.c
index 9cb7f88df563..f3d1ba81d69b 100644
--- a/arch/powerpc/kernel/prom_parse.c
+++ b/arch/powerpc/kernel/prom_parse.c
@@ -6,7 +6,6 @@
 #include <linux/ioport.h>
 #include <linux/etherdevice.h>
 #include <linux/of_address.h>
-#include <asm/prom.h>
 
 void of_parse_dma_window(struct device_node *dn, const __be32 *dma_window,
 			 unsigned long *busno, unsigned long *phys,
diff --git a/arch/powerpc/kernel/rtas-rtc.c b/arch/powerpc/kernel/rtas-rtc.c
index 33c07c8af6c8..5a31d1829bca 100644
--- a/arch/powerpc/kernel/rtas-rtc.c
+++ b/arch/powerpc/kernel/rtas-rtc.c
@@ -6,7 +6,6 @@
 #include <linux/rtc.h>
 #include <linux/delay.h>
 #include <linux/ratelimit.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
 
diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index cf0f42909ddf..5270b450bbde 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -22,7 +22,6 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/rtas.h>
-#include <asm/prom.h>
 #include <asm/nvram.h>
 #include <linux/atomic.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index de0f6f09a5dd..ed006e98d235 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -43,7 +43,6 @@
 #include <asm/kvm_ppc.h>
 #include <asm/dbell.h>
 #include <asm/page.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 717f2c9a7573..0da287544054 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -25,7 +25,6 @@
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/cputable.h>
 #include <asm/sections.h>
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index abf5897ae88c..7ab4980fe13a 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -18,7 +18,6 @@
 #include <asm/kdump.h>
 #include <asm/machdep.h>
 #include <asm/pgalloc.h>
-#include <asm/prom.h>
 #include <asm/sections.h>
 
 void machine_kexec_mask_interrupts(void) {
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 22ceeeb705ab..d85fa9fc6f3c 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -20,7 +20,6 @@
 #include <asm/processor.h>
 #include <asm/machdep.h>
 #include <asm/kexec.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/setjmp.h>
 #include <asm/debug.h>
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 203735caf691..49a737fbbd18 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -23,7 +23,6 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 
-#include <asm/prom.h>
 #include <asm/mmu.h>
 #include <asm/machdep.h>
 #include <asm/code-patching.h>
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 3d690be48e84..693a3a7a9463 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -29,7 +29,6 @@
 #include <linux/slab.h>
 #include <linux/hugetlb.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index 95751c322f6c..b32e465a3d52 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -32,7 +32,6 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index dfe715e0f70a..09742dabd1fa 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -37,7 +37,6 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 96c38f971603..a0a78e47a121 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -15,7 +15,6 @@
 #include <linux/libfdt.h>
 #include <linux/crash_core.h>
 #include <asm/cacheflush.h>
-#include <asm/prom.h>
 #include <asm/kdump.h>
 #include <mm/mmu_decl.h>
 #include <generated/compile.h>
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b9b7fefbb64b..3039af0c644b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -26,7 +26,6 @@
 #include <linux/slab.h>
 #include <asm/cputhreads.h>
 #include <asm/sparsemem.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/topology.h>
 #include <asm/firmware.h>
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 175aabf101e8..5ac1fd30341b 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -32,7 +32,6 @@
 #include <linux/hugetlb.h>
 
 #include <asm/page.h>
-#include <asm/prom.h>
 #include <asm/mmu_context.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
index e70b42729322..dce696c32679 100644
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ b/arch/powerpc/platforms/40x/ppc40x_simple.c
@@ -13,7 +13,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc4xx.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 3dbd8ddd734a..2a0dcdf04b21 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -13,7 +13,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc4xx.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/44x/sam440ep.c b/arch/powerpc/platforms/44x/sam440ep.c
index 68ba4b009da0..ed854b53877e 100644
--- a/arch/powerpc/platforms/44x/sam440ep.c
+++ b/arch/powerpc/platforms/44x/sam440ep.c
@@ -17,7 +17,6 @@
 #include <linux/of_platform.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/time.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index 9d030c2e0004..fc3fb999cd74 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -14,7 +14,6 @@
 
 #include <asm/machdep.h>
 #include <asm/ipic.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index 303bc308b2e6..364564c995bd 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -13,7 +13,6 @@
 
 #include <asm/machdep.h>
 #include <asm/ipic.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 
 #include "mpc512x.h"
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 3b7d70d71692..e0647720ed5e 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -14,7 +14,6 @@
 #include <linux/pci.h>
 #include <linux/of.h>
 #include <asm/dma.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 04cc97397095..7ea9b6ce0591 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -21,7 +21,6 @@
 #include <asm/time.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/mpc52xx.h>
 
 /* ************************************************************************
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 369ebb1b7af1..28e627f8a320 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -20,7 +20,6 @@
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/mpc8260.h>
-#include <asm/prom.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/cpm2_pic.h>
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 745ed61df5d8..1c8bbf4251d9 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -20,7 +20,6 @@
 #include <asm/machdep.h>
 #include <linux/time.h>
 #include <asm/mpc8260.h>
-#include <asm/prom.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/cpm2_pic.h>
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index d9eed0decb28..907acdecc94a 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -29,7 +29,6 @@
 #include <asm/machdep.h>
 #include <asm/ipic.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index a38372f9ac12..34c15dad4ba1 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/kthread.h>
 #include <linux/reboot.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 
 /*
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 850d566ef900..435344405d2c 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -28,7 +28,6 @@
 #include <asm/machdep.h>
 #include <asm/ipic.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index 9630f3aa4d9c..6a110f275304 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -27,7 +27,6 @@
 #include <asm/machdep.h>
 #include <asm/ipic.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index da4cf52cb55b..b1e6665be5d3 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -35,7 +35,6 @@
 #include <asm/machdep.h>
 #include <asm/ipic.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index 3427ad0d9d38..731bc5ce726d 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -12,7 +12,6 @@
 #include <linux/pci.h>
 #include <linux/of_platform.h>
 #include <linux/io.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/ipic.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 17ae75d62518..28d6b36f1ccd 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -19,7 +19,6 @@
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <asm/ehv_pic.h>
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index 6ef8580fdc0e..bdf9d42f8521 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -26,7 +26,6 @@
 #include <asm/mpic.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
-#include <asm/prom.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 53bccb8bbcbe..e5d7386ad612 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -18,7 +18,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <asm/swiotlb.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 7759eca7d535..3a2ac410af18 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -39,7 +39,6 @@
 #include <asm/pci-bridge.h>
 #include <asm/irq.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 80a80174768c..d99aba158235 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -19,7 +19,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <soc/fsl/qe/qe.h>
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 24855284b14a..8ba9306a96b6 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -16,7 +16,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 166b3515ba73..09f64470c765 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -29,7 +29,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 69e917e3ba1c..6b1fe7bb3a8c 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -28,7 +28,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 95a1a1118a31..d187f4b8bff6 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -26,7 +26,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index a6b8ffcbf01a..5294394c9c07 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -19,7 +19,6 @@
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 #include <asm/swiotlb.h>
diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 651486acb896..1e337935a21e 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -15,7 +15,6 @@
 #include <asm/cpm1.h>
 #include <asm/fs_pd.h>
 #include <asm/udbg.h>
-#include <asm/prom.h>
 
 #include "mpc8xx.h"
 
diff --git a/arch/powerpc/platforms/cell/cbe_thermal.c b/arch/powerpc/platforms/cell/cbe_thermal.c
index 2ece77f49bc3..b8b28f64bd8b 100644
--- a/arch/powerpc/platforms/cell/cbe_thermal.c
+++ b/arch/powerpc/platforms/cell/cbe_thermal.c
@@ -39,7 +39,6 @@
 #include <linux/stringify.h>
 #include <asm/spu.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/cell-regs.h>
 
 #include "spu_priv1_mmio.h"
diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index dff8d5e7ab82..58d967ee38b3 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -19,7 +19,6 @@
 
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/reg.h>
 #include <asm/cell-regs.h>
 #include <asm/cpu_has_feature.h>
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index edefa785d2ef..52de014983c9 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -31,7 +31,6 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/pci-bridge.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
index d7ab868aab54..31ce00b52a32 100644
--- a/arch/powerpc/platforms/cell/smp.c
+++ b/arch/powerpc/platforms/cell/smp.c
@@ -28,7 +28,6 @@
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/paca.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index 83cea9e7ee72..2812b9823e75 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -24,7 +24,6 @@
 #include <asm/spu_priv1.h>
 #include <asm/spu_csa.h>
 #include <asm/xmon.h>
-#include <asm/prom.h>
 #include <asm/kexec.h>
 
 const struct spu_management_ops *spu_management_ops;
diff --git a/arch/powerpc/platforms/cell/spu_priv1_mmio.c b/arch/powerpc/platforms/cell/spu_priv1_mmio.c
index 0c2e6bb6fe51..d150e3987304 100644
--- a/arch/powerpc/platforms/cell/spu_priv1_mmio.c
+++ b/arch/powerpc/platforms/cell/spu_priv1_mmio.c
@@ -19,7 +19,6 @@
 #include <asm/spu.h>
 #include <asm/spu_priv1.h>
 #include <asm/firmware.h>
-#include <asm/prom.h>
 
 #include "interrupt.h"
 #include "spu_priv1_mmio.h"
diff --git a/arch/powerpc/platforms/chrp/smp.c b/arch/powerpc/platforms/chrp/smp.c
index e30cd2915e54..ab95155647a4 100644
--- a/arch/powerpc/platforms/chrp/smp.c
+++ b/arch/powerpc/platforms/chrp/smp.c
@@ -24,7 +24,6 @@
 #include <asm/page.h>
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/embedded6xx/gamecube.c b/arch/powerpc/platforms/embedded6xx/gamecube.c
index ade928f7ea73..5c2575adcc7e 100644
--- a/arch/powerpc/platforms/embedded6xx/gamecube.c
+++ b/arch/powerpc/platforms/embedded6xx/gamecube.c
@@ -16,7 +16,6 @@
 
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index eb8342e7f84e..1830e1ac1f8f 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -15,7 +15,6 @@
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/mpic.h>
 #include <asm/pci-bridge.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index e188b90f7016..5f16e80b6ed6 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -17,7 +17,6 @@
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/mpic.h>
 #include <asm/pci-bridge.h>
 
diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
index 32224cb489d7..aeb79a8b3e10 100644
--- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -15,7 +15,6 @@
 #include <linux/pmu.h>
 #include <linux/atomic.h>
 #include <linux/export.h>
-#include <asm/prom.h>
 #include <asm/backlight.h>
 
 #define OLD_BACKLIGHT_MAX 15
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index e67c624f35a2..5cc958adba13 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -31,7 +31,6 @@
 #include <asm/keylargo.h>
 #include <asm/uninorth.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #include <asm/dbdma.h>
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 974d4b49867b..4e10ab5cffe8 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -50,7 +50,6 @@
 
 #include <asm/reg.h>
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/pci-bridge.h>
 #include <asm/ohare.h>
diff --git a/arch/powerpc/platforms/powermac/udbg_adb.c b/arch/powerpc/platforms/powermac/udbg_adb.c
index 12158bb4fed7..93e0a8372fbc 100644
--- a/arch/powerpc/platforms/powermac/udbg_adb.c
+++ b/arch/powerpc/platforms/powermac/udbg_adb.c
@@ -11,7 +11,6 @@
 #include <asm/io.h>
 #include <asm/page.h>
 #include <asm/xmon.h>
-#include <asm/prom.h>
 #include <asm/bootx.h>
 #include <asm/errno.h>
 #include <asm/pmac_feature.h>
diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c b/arch/powerpc/platforms/powermac/udbg_scc.c
index 965827ac2e9c..2465bf466380 100644
--- a/arch/powerpc/platforms/powermac/udbg_scc.c
+++ b/arch/powerpc/platforms/powermac/udbg_scc.c
@@ -8,7 +8,6 @@
 #include <asm/udbg.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pmac_feature.h>
 
 extern u8 real_readb(volatile u8 __iomem  *addr);
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 9a8391b983d1..ae25cb0a45b3 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -18,7 +18,6 @@
 
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/platforms/ps3/htab.c b/arch/powerpc/platforms/ps3/htab.c
index ef710a715903..c27e6cf85272 100644
--- a/arch/powerpc/platforms/ps3/htab.c
+++ b/arch/powerpc/platforms/ps3/htab.c
@@ -10,7 +10,6 @@
 #include <linux/memblock.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/lv1call.h>
 #include <asm/ps3fb.h>
diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index 5ce924611b94..ba040d750072 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -14,7 +14,6 @@
 
 #include <asm/cell-regs.h>
 #include <asm/firmware.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/lv1call.h>
 #include <asm/setup.h>
diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platforms/ps3/os-area.c
index cb844e0add2b..b384cd2d6b99 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -17,8 +17,6 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include <asm/prom.h>
-
 #include "platform.h"
 
 enum {
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index b1f01ac0c29e..eb60b8f514af 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -19,7 +19,6 @@
 #include "of_helpers.h"
 #include "pseries.h"
 
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <linux/uaccess.h>
 #include <asm/rtas.h>
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 91cf23495ccb..2e3a317722a8 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -16,7 +16,6 @@
 
 #include <asm/firmware.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/sparsemem.h>
 #include <asm/fadump.h>
 #include <asm/drmem.h>
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 760581c5752f..937f9c010b22 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -31,7 +31,6 @@
 #include <asm/mmu_context.h>
 #include <asm/iommu.h>
 #include <asm/tlb.h>
-#include <asm/prom.h>
 #include <asm/cputable.h>
 #include <asm/udbg.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 2119c003fcf9..507dc0b5987d 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -28,7 +28,6 @@
 #include <asm/firmware.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/vdso_datapage.h>
 #include <asm/vio.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 3b6800f774c2..6e671c3809ec 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -14,7 +14,6 @@
 
 #include <asm/eeh.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <asm/ppc-pci.h>
 #include <asm/pci.h>
 #include "pseries.h"
diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index 439ac72c2470..3c290b9ed01b 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/firmware.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 7f7369fec46b..cad7a0c93117 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <linux/uaccess.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index f47429323eee..fd2174edfa1d 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -27,7 +27,6 @@
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/paca.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/sysdev/fsl_soc.c b/arch/powerpc/sysdev/fsl_soc.c
index 90ad16161604..78118c188993 100644
--- a/arch/powerpc/sysdev/fsl_soc.c
+++ b/arch/powerpc/sysdev/fsl_soc.c
@@ -31,7 +31,6 @@
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <sysdev/fsl_soc.h>
 #include <mm/mmu_decl.h>
diff --git a/arch/powerpc/sysdev/indirect_pci.c b/arch/powerpc/sysdev/indirect_pci.c
index 09b36617425e..1aacb403a010 100644
--- a/arch/powerpc/sysdev/indirect_pci.c
+++ b/arch/powerpc/sysdev/indirect_pci.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 
diff --git a/arch/powerpc/sysdev/xics/ics-native.c b/arch/powerpc/sysdev/xics/ics-native.c
index dec7d93a8ba1..e33b77da861e 100644
--- a/arch/powerpc/sysdev/xics/ics-native.c
+++ b/arch/powerpc/sysdev/xics/ics-native.c
@@ -19,7 +19,6 @@
 #include <linux/msi.h>
 #include <linux/list.h>
 
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
index c4d95d8beb6f..6cfbb4fac7fb 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -18,7 +18,6 @@
 #include <linux/spinlock.h>
 #include <linux/msi.h>
 
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xics/ics-rtas.c
index b9da317b7a2d..9e7007f9aca5 100644
--- a/arch/powerpc/sysdev/xics/ics-rtas.c
+++ b/arch/powerpc/sysdev/xics/ics-rtas.c
@@ -10,7 +10,6 @@
 #include <linux/spinlock.h>
 #include <linux/msi.h>
 
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad5..bf31b1ee1c9c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -31,7 +31,6 @@
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/string.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/xmon.h>
 #include <asm/processor.h>
-- 
2.34.1

