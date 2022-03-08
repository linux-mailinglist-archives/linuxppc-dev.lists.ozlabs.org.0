Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6864D2155
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:23:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KClbc28Ljz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 06:23:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KClYB29PPz3bp3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 06:21:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KClXn3mThz9sSW;
 Tue,  8 Mar 2022 20:20:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57XsqodaZrFN; Tue,  8 Mar 2022 20:20:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KClXj4pstz9sSj;
 Tue,  8 Mar 2022 20:20:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93AC68B763;
 Tue,  8 Mar 2022 20:20:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0VYLQXHwLEPB; Tue,  8 Mar 2022 20:20:37 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FA4D8B781;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228JKUB03553861
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 20:20:30 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228JKU8h3553860;
 Tue, 8 Mar 2022 20:20:30 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 6/6] powerpc: Add missing headers
Date: Tue,  8 Mar 2022 20:20:25 +0100
Message-Id: <be8bdc934d152a7d8ee8d1a840d5596e2f7d85e0.1646767214.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
References: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646767223; l=82665; s=20211009;
 h=from:subject:message-id; bh=4GYoLphejBFl+g/IDDVsAoBFZAtPuT0IaE/Aw3z1vfc=;
 b=FC8PWyPdYYedvSNjncVzgw/lbuK5T0q4iiwLHm0l3nOjZwbf3rCDDw4jS8kTSsbtMSMzGEUBxhIW
 TKbo/IMjAGegSONOshCf1wa3X86fzqXouHHLwtuVOG1J7iRmdQhh
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

Don't inherit headers "by chances" from asm/prom.h, asm/mpc52xx.h,
asm/pci.h etc...

Include the needed headers, and remove asm/prom.h when it was
needed exclusively for pulling necessary headers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pnv-pci.h                 | 1 +
 arch/powerpc/kernel/btext.c                        | 2 +-
 arch/powerpc/kernel/cputable.c                     | 2 +-
 arch/powerpc/kernel/crash_dump.c                   | 2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                  | 2 +-
 arch/powerpc/kernel/eeh_pe.c                       | 1 +
 arch/powerpc/kernel/eeh_sysfs.c                    | 1 +
 arch/powerpc/kernel/fadump.c                       | 3 ++-
 arch/powerpc/kernel/isa-bridge.c                   | 2 +-
 arch/powerpc/kernel/legacy_serial.c                | 2 +-
 arch/powerpc/kernel/nvram_64.c                     | 2 +-
 arch/powerpc/kernel/pci-common.c                   | 2 +-
 arch/powerpc/kernel/pci-hotplug.c                  | 1 +
 arch/powerpc/kernel/pci_64.c                       | 2 +-
 arch/powerpc/kernel/pci_dn.c                       | 2 +-
 arch/powerpc/kernel/pci_of_scan.c                  | 2 +-
 arch/powerpc/kernel/proc_powerpc.c                 | 2 +-
 arch/powerpc/kernel/prom_init.c                    | 2 ++
 arch/powerpc/kernel/rtas-proc.c                    | 2 +-
 arch/powerpc/kernel/rtas.c                         | 3 ++-
 arch/powerpc/kernel/rtas_pci.c                     | 3 ++-
 arch/powerpc/kernel/setup-common.c                 | 3 ++-
 arch/powerpc/kernel/setup_32.c                     | 3 ++-
 arch/powerpc/kernel/setup_64.c                     | 3 ++-
 arch/powerpc/kernel/sysfs.c                        | 2 +-
 arch/powerpc/kernel/time.c                         | 2 +-
 arch/powerpc/kexec/core_64.c                       | 2 +-
 arch/powerpc/kvm/book3s_hv.c                       | 1 +
 arch/powerpc/kvm/powerpc.c                         | 1 +
 arch/powerpc/mm/book3s64/hash_utils.c              | 2 +-
 arch/powerpc/mm/drmem.c                            | 2 +-
 arch/powerpc/perf/imc-pmu.c                        | 1 +
 arch/powerpc/platforms/44x/canyonlands.c           | 1 +
 arch/powerpc/platforms/44x/fsp2.c                  | 2 +-
 arch/powerpc/platforms/44x/ppc476.c                | 2 +-
 arch/powerpc/platforms/44x/warp.c                  | 3 ++-
 arch/powerpc/platforms/4xx/hsta_msi.c              | 1 +
 arch/powerpc/platforms/4xx/pci.c                   | 1 +
 arch/powerpc/platforms/4xx/uic.c                   | 3 ++-
 arch/powerpc/platforms/512x/mpc5121_ads_cpld.c     | 3 ++-
 arch/powerpc/platforms/512x/mpc512x_shared.c       | 2 +-
 arch/powerpc/platforms/52xx/lite5200_pm.c          | 2 ++
 arch/powerpc/platforms/52xx/media5200.c            | 3 ++-
 arch/powerpc/platforms/52xx/mpc5200_simple.c       | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_common.c       | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c          | 2 ++
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c      | 3 ++-
 arch/powerpc/platforms/52xx/mpc52xx_pci.c          | 1 +
 arch/powerpc/platforms/52xx/mpc52xx_pic.c          | 3 ++-
 arch/powerpc/platforms/52xx/mpc52xx_pm.c           | 2 ++
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c       | 2 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c          | 1 +
 arch/powerpc/platforms/83xx/mpc834x_mds.c          | 2 +-
 arch/powerpc/platforms/83xx/mpc837x_mds.c          | 2 +-
 arch/powerpc/platforms/83xx/usb.c                  | 2 +-
 arch/powerpc/platforms/85xx/ge_imp3a.c             | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c          | 3 ++-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c           | 2 +-
 arch/powerpc/platforms/85xx/p1022_ds.c             | 1 +
 arch/powerpc/platforms/85xx/p1022_rdk.c            | 1 +
 arch/powerpc/platforms/85xx/p1023_rdb.c            | 2 +-
 arch/powerpc/platforms/85xx/qemu_e500.c            | 1 +
 arch/powerpc/platforms/85xx/xes_mpc85xx.c          | 2 +-
 arch/powerpc/platforms/86xx/gef_ppc9a.c            | 2 +-
 arch/powerpc/platforms/86xx/gef_sbc310.c           | 2 +-
 arch/powerpc/platforms/86xx/gef_sbc610.c           | 2 +-
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c         | 3 ++-
 arch/powerpc/platforms/86xx/mvme7100.c             | 1 +
 arch/powerpc/platforms/8xx/cpm1.c                  | 2 +-
 arch/powerpc/platforms/8xx/m8xx_setup.c            | 3 ++-
 arch/powerpc/platforms/8xx/pic.c                   | 3 ++-
 arch/powerpc/platforms/amigaone/setup.c            | 1 +
 arch/powerpc/platforms/cell/axon_msi.c             | 2 +-
 arch/powerpc/platforms/cell/cbe_powerbutton.c      | 2 +-
 arch/powerpc/platforms/cell/cbe_regs.c             | 2 +-
 arch/powerpc/platforms/cell/interrupt.c            | 3 ++-
 arch/powerpc/platforms/cell/iommu.c                | 2 ++
 arch/powerpc/platforms/cell/ras.c                  | 2 +-
 arch/powerpc/platforms/cell/spider-pci.c           | 1 +
 arch/powerpc/platforms/cell/spider-pic.c           | 3 ++-
 arch/powerpc/platforms/cell/spu_manage.c           | 3 ++-
 arch/powerpc/platforms/cell/spufs/inode.c          | 2 +-
 arch/powerpc/platforms/chrp/nvram.c                | 2 +-
 arch/powerpc/platforms/chrp/pci.c                  | 2 +-
 arch/powerpc/platforms/chrp/setup.c                | 4 +++-
 arch/powerpc/platforms/chrp/time.c                 | 2 +-
 arch/powerpc/platforms/embedded6xx/holly.c         | 3 ++-
 arch/powerpc/platforms/embedded6xx/ls_uart.c       | 2 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c  | 2 +-
 arch/powerpc/platforms/embedded6xx/mvme5100.c      | 2 +-
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c | 3 ++-
 arch/powerpc/platforms/embedded6xx/wii.c           | 2 +-
 arch/powerpc/platforms/fsl_uli1575.c               | 1 +
 arch/powerpc/platforms/maple/pci.c                 | 2 +-
 arch/powerpc/platforms/maple/setup.c               | 2 +-
 arch/powerpc/platforms/maple/time.c                | 2 +-
 arch/powerpc/platforms/pasemi/dma_lib.c            | 2 ++
 arch/powerpc/platforms/pasemi/iommu.c              | 1 +
 arch/powerpc/platforms/pasemi/misc.c               | 1 +
 arch/powerpc/platforms/pasemi/msi.c                | 2 +-
 arch/powerpc/platforms/pasemi/pci.c                | 1 +
 arch/powerpc/platforms/pasemi/setup.c              | 2 +-
 arch/powerpc/platforms/powermac/bootx_init.c       | 1 +
 arch/powerpc/platforms/powermac/low_i2c.c          | 2 +-
 arch/powerpc/platforms/powermac/nvram.c            | 2 +-
 arch/powerpc/platforms/powermac/pci.c              | 3 ++-
 arch/powerpc/platforms/powermac/pfunc_core.c       | 2 +-
 arch/powerpc/platforms/powermac/pic.c              | 4 +++-
 arch/powerpc/platforms/powermac/smp.c              | 2 +-
 arch/powerpc/platforms/powermac/time.c             | 2 +-
 arch/powerpc/platforms/powermac/udbg_adb.c         | 1 +
 arch/powerpc/platforms/powermac/udbg_scc.c         | 1 +
 arch/powerpc/platforms/powernv/eeh-powernv.c       | 1 +
 arch/powerpc/platforms/powernv/pci-cxl.c           | 1 +
 arch/powerpc/platforms/powernv/pci-ioda.c          | 3 ++-
 arch/powerpc/platforms/ps3/setup.c                 | 2 +-
 arch/powerpc/platforms/pseries/msi.c               | 1 +
 arch/powerpc/platforms/pseries/nvram.c             | 2 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c       | 3 ++-
 arch/powerpc/platforms/pseries/setup.c             | 2 +-
 arch/powerpc/platforms/pseries/vio.c               | 1 +
 arch/powerpc/sysdev/cpm2_pic.c                     | 2 +-
 arch/powerpc/sysdev/dart_iommu.c                   | 2 +-
 arch/powerpc/sysdev/dcr.c                          | 2 +-
 arch/powerpc/sysdev/fsl_lbc.c                      | 3 ++-
 arch/powerpc/sysdev/fsl_msi.c                      | 4 +++-
 arch/powerpc/sysdev/fsl_pci.c                      | 3 ++-
 arch/powerpc/sysdev/ge/ge_pic.c                    | 4 +++-
 arch/powerpc/sysdev/grackle.c                      | 2 +-
 arch/powerpc/sysdev/i8259.c                        | 2 +-
 arch/powerpc/sysdev/ipic.c                         | 3 ++-
 arch/powerpc/sysdev/mmio_nvram.c                   | 2 +-
 arch/powerpc/sysdev/mpic.c                         | 2 ++
 arch/powerpc/sysdev/mpic_msgr.c                    | 3 ++-
 arch/powerpc/sysdev/mpic_msi.c                     | 3 ++-
 arch/powerpc/sysdev/mpic_u3msi.c                   | 2 +-
 arch/powerpc/sysdev/msi_bitmap.c                   | 1 +
 arch/powerpc/sysdev/pmi.c                          | 3 ++-
 arch/powerpc/sysdev/rtc_cmos_setup.c               | 2 +-
 arch/powerpc/sysdev/tsi108_dev.c                   | 3 ++-
 arch/powerpc/sysdev/tsi108_pci.c                   | 3 ++-
 arch/powerpc/sysdev/xics/icp-native.c              | 3 ++-
 arch/powerpc/sysdev/xics/xics-common.c             | 2 +-
 arch/powerpc/sysdev/xive/common.c                  | 2 +-
 arch/powerpc/sysdev/xive/native.c                  | 2 +-
 arch/powerpc/sysdev/xive/spapr.c                   | 2 ++
 146 files changed, 195 insertions(+), 108 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
index b3f480799352..8afc92860dbb 100644
--- a/arch/powerpc/include/asm/pnv-pci.h
+++ b/arch/powerpc/include/asm/pnv-pci.h
@@ -9,6 +9,7 @@
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
 #include <linux/irq.h>
+#include <linux/of.h>
 #include <misc/cxl-base.h>
 #include <asm/opal-api.h>
 
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 9d9d56b574cc..2f4ce5bd652f 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -10,9 +10,9 @@
 #include <linux/export.h>
 #include <linux/memblock.h>
 #include <linux/pgtable.h>
+#include <linux/of.h>
 
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/btext.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..7d2a3ea62a05 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -12,9 +12,9 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/jump_label.h>
+#include <linux/of.h>
 
 #include <asm/cputable.h>
-#include <asm/prom.h>		/* for PTRRELOC on ARCH=ppc */
 #include <asm/mce.h>
 #include <asm/mmu.h>
 #include <asm/setup.h>
diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 5693e1c67c2b..c438c60fbc54 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -12,9 +12,9 @@
 #include <linux/crash_dump.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 #include <asm/code-patching.h>
 #include <asm/kdump.h>
-#include <asm/prom.h>
 #include <asm/firmware.h>
 #include <linux/uaccess.h>
 #include <asm/rtas.h>
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 7d1b2c4a4891..c8e147b66d34 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -10,6 +10,7 @@
 #include <linux/jump_label.h>
 #include <linux/libfdt.h>
 #include <linux/memblock.h>
+#include <linux/of_fdt.h>
 #include <linux/printk.h>
 #include <linux/sched.h>
 #include <linux/string.h>
@@ -19,7 +20,6 @@
 #include <asm/dt_cpu_ftrs.h>
 #include <asm/mce.h>
 #include <asm/mmu.h>
-#include <asm/prom.h>
 #include <asm/setup.h>
 
 
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 845e024321d4..d7a9cf376831 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index 429620da73ba..706e1eb95efe 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -6,6 +6,7 @@
  *
  * Send comments and feedback to Linas Vepstas <linas@austin.ibm.com>
  */
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/stat.h>
 #include <asm/ppc-pci.h>
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index cf92f3fb17d2..6b3dd84df667 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -25,9 +25,10 @@
 #include <linux/cma.h>
 #include <linux/hugetlb.h>
 #include <linux/debugfs.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/page.h>
-#include <asm/prom.h>
 #include <asm/fadump.h>
 #include <asm/fadump-internal.h>
 #include <asm/setup.h>
diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
index 39c625737c09..dc746611ebc0 100644
--- a/arch/powerpc/kernel/isa-bridge.c
+++ b/arch/powerpc/kernel/isa-bridge.c
@@ -18,11 +18,11 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/notifier.h>
+#include <linux/of_address.h>
 #include <linux/vmalloc.h>
 
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 #include <asm/ppc-pci.h>
diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index cfc03e016ff2..5c58460b269a 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -7,10 +7,10 @@
 #include <linux/pci.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/serial_reg.h>
 #include <asm/io.h>
 #include <asm/mmu.h>
-#include <asm/prom.h>
 #include <asm/serial.h>
 #include <asm/udbg.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 0d9f9cd41e13..e385d3164648 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -19,9 +19,9 @@
 #include <linux/pstore.h>
 #include <linux/zlib.h>
 #include <linux/uaccess.h>
+#include <linux/of.h>
 #include <asm/nvram.h>
 #include <asm/rtas.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 
 #undef DEBUG_NVRAM
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 8bc9cf62cd93..e4b68d1814ea 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -30,10 +30,10 @@
 #include <linux/vgaarb.h>
 #include <linux/numa.h>
 #include <linux/msi.h>
+#include <linux/irqdomain.h>
 
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/byteorder.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 2fc12198ec07..0fe251c6ac2c 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -12,6 +12,7 @@
 
 #include <linux/pci.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 #include <asm/firmware.h>
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 81f84e71ab93..19b03ddf5631 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -19,10 +19,10 @@
 #include <linux/syscalls.h>
 #include <linux/irq.h>
 #include <linux/vmalloc.h>
+#include <linux/of.h>
 
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/byteorder.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 61571ae23953..938ab8838ab5 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -12,9 +12,9 @@
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/gfp.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 #include <asm/firmware.h>
diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index c3024f104765..1feabe90e5a4 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -13,8 +13,8 @@
 
 #include <linux/pci.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 
 /**
  * get_int_prop - Decode a u32 from a device tree property
diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 6a029f2378e1..b109cd7b5d01 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -7,12 +7,12 @@
 #include <linux/mm.h>
 #include <linux/proc_fs.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/vdso_datapage.h>
 #include <asm/rtas.h>
 #include <linux/uaccess.h>
-#include <asm/prom.h>
 
 #ifdef CONFIG_PPC64
 
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 0ac5faacc909..e556f4e0e51d 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -28,6 +28,8 @@
 #include <linux/bitops.h>
 #include <linux/pgtable.h>
 #include <linux/printk.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index 6857a5b0a1c3..291aadd19c5e 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -24,11 +24,11 @@
 #include <linux/seq_file.h>
 #include <linux/bitops.h>
 #include <linux/rtc.h>
+#include <linux/of.h>
 
 #include <linux/uaccess.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/machdep.h> /* for ppc_md */
 #include <asm/time.h>
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 1f42aabbbab3..a6bbce998ddf 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -24,9 +24,10 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/syscalls.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/interrupt.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
index 781c1869902e..5a2f5ea3b054 100644
--- a/arch/powerpc/kernel/rtas_pci.c
+++ b/arch/powerpc/kernel/rtas_pci.c
@@ -14,10 +14,11 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 518ae5aa9410..462ed4e62315 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -30,12 +30,13 @@
 #include <linux/serial_8250.h>
 #include <linux/percpu.h>
 #include <linux/memblock.h>
+#include <linux/of_irq.h>
+#include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/paca.h>
-#include <asm/prom.h>
 #include <asm/processor.h>
 #include <asm/vdso_datapage.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index a6e9d36d7c01..813261789303 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -20,9 +20,10 @@
 #include <linux/export.h>
 #include <linux/nvram.h>
 #include <linux/pgtable.h>
+#include <linux/of_fdt.h>
+#include <linux/irq.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e547066a06aa..d69d33f57662 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -31,11 +31,12 @@
 #include <linux/memory.h>
 #include <linux/nmi.h>
 #include <linux/pgtable.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
-#include <asm/prom.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index d45a415d5374..4799c82018f9 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -9,12 +9,12 @@
 #include <linux/nodemask.h>
 #include <linux/cpumask.h>
 #include <linux/notifier.h>
+#include <linux/of.h>
 
 #include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/cputable.h>
 #include <asm/hvcall.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/smp.h>
 #include <asm/pmc.h>
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 958e2929776f..b1b55a718803 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -54,6 +54,7 @@
 #include <linux/of_clk.h>
 #include <linux/suspend.h>
 #include <linux/processor.h>
+#include <linux/platform_device.h>
 #include <asm/trace.h>
 
 #include <asm/interrupt.h>
@@ -63,7 +64,6 @@
 #include <asm/machdep.h>
 #include <linux/uaccess.h>
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/irq.h>
 #include <asm/div64.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 6cc7793b8420..73412dfdc643 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/cpu.h>
 #include <linux/hardirq.h>
+#include <linux/of.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -25,7 +26,6 @@
 #include <asm/paca.h>
 #include <asm/mmu.h>
 #include <asm/sections.h>	/* _end */
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/hw_breakpoint.h>
 #include <asm/svm.h>
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c886557638a1..c7a06d9211c8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -42,6 +42,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/of.h>
+#include <linux/irqdomain.h>
 
 #include <asm/ftrace.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9772b176e406..4d0fe4f6214a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/irqbypass.h>
 #include <linux/kvm_irqfd.h>
+#include <linux/of.h>
 #include <asm/cputable.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_ppc.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 985cabdd7f67..976206c9ac12 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -37,6 +37,7 @@
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
 #include <linux/debugfs.h>
+#include <linux/of_fdt.h>
 
 #include <asm/interrupt.h>
 #include <asm/processor.h>
@@ -46,7 +47,6 @@
 #include <asm/types.h>
 #include <linux/uaccess.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/eeh.h>
 #include <asm/tlb.h>
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 22197b18d85e..2369d1bf2411 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/memblock.h>
-#include <asm/prom.h>
+#include <linux/slab.h>
 #include <asm/drmem.h>
 
 static int n_root_addr_cells, n_root_size_cells;
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index e7583fbcc8fa..cbf0bfce80d1 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -6,6 +6,7 @@
  *           (C) 2017 Anju T Sudhakar, IBM Corporation.
  *           (C) 2017 Hemant K Shaw, IBM Corporation.
  */
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/slab.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/platforms/44x/canyonlands.c b/arch/powerpc/platforms/44x/canyonlands.c
index 807968a755ef..5b23aef8bdef 100644
--- a/arch/powerpc/platforms/44x/canyonlands.c
+++ b/arch/powerpc/platforms/44x/canyonlands.c
@@ -12,6 +12,7 @@
 #include <asm/ppc4xx.h>
 #include <asm/udbg.h>
 #include <asm/uic.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/delay.h>
 #include "44x.h"
diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index af13a59d2f60..e2e4f6d8150d 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -14,11 +14,11 @@
  */
 
 #include <linux/init.h>
+#include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/rtc.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/time.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index fb7db5cedd4e..20cc8f80b086 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -19,11 +19,11 @@
 
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/rtc.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/time.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index 665f18e37efb..f03432ef010b 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -11,12 +11,13 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/time.h>
 #include <asm/uic.h>
diff --git a/arch/powerpc/platforms/4xx/hsta_msi.c b/arch/powerpc/platforms/4xx/hsta_msi.c
index fee430eadcc6..d4f7fff1fc87 100644
--- a/arch/powerpc/platforms/4xx/hsta_msi.c
+++ b/arch/powerpc/platforms/4xx/hsta_msi.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index 24f41e178cbc..ca5dd7a5842a 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 
diff --git a/arch/powerpc/platforms/4xx/uic.c b/arch/powerpc/platforms/4xx/uic.c
index 89e2587b1a59..d667ad039bd3 100644
--- a/arch/powerpc/platforms/4xx/uic.c
+++ b/arch/powerpc/platforms/4xx/uic.c
@@ -19,9 +19,10 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/dcr.h>
 
 #define NR_UIC_INTS	32
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c b/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
index ea46870e5d6e..6f08d07aee3b 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
@@ -14,7 +14,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <asm/prom.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 static struct device_node *cpld_pic_node;
 static struct irq_domain *cpld_pic_host;
diff --git a/arch/powerpc/platforms/512x/mpc512x_shared.c b/arch/powerpc/platforms/512x/mpc512x_shared.c
index e3411663edad..d882a46c995b 100644
--- a/arch/powerpc/platforms/512x/mpc512x_shared.c
+++ b/arch/powerpc/platforms/512x/mpc512x_shared.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/fsl-diu-fb.h>
 #include <linux/memblock.h>
@@ -20,7 +21,6 @@
 #include <asm/cacheflush.h>
 #include <asm/machdep.h>
 #include <asm/ipic.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/mpc5121.h>
 #include <asm/mpc52xx_psc.h>
diff --git a/arch/powerpc/platforms/52xx/lite5200_pm.c b/arch/powerpc/platforms/52xx/lite5200_pm.c
index e7da22d1df87..129313b1d021 100644
--- a/arch/powerpc/platforms/52xx/lite5200_pm.c
+++ b/arch/powerpc/platforms/52xx/lite5200_pm.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <linux/suspend.h>
+#include <linux/of_address.h>
+
 #include <asm/io.h>
 #include <asm/time.h>
 #include <asm/mpc52xx.h>
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index 110c444f4bc7..ee367ff3ec8a 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -20,8 +20,9 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/mpc52xx.h>
 
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index b9f5675b0a1d..cc349d579061 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -22,8 +22,8 @@
  */
 
 #undef DEBUG
+#include <linux/of.h>
 #include <asm/time.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/mpc52xx.h>
 
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index 565e3a83dc9e..032edae57d67 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -15,11 +15,11 @@
 #include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/export.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/mpc52xx.h>
 
 /* MPC5200 device tree match tables */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f862b48b4824..0579b23cffbf 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -55,6 +55,8 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/kernel.h>
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
index b91ebebd9ff2..b37023d8d75a 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
@@ -11,11 +11,12 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/mpc52xx.h>
 #include <asm/time.h>
 
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
index af0f79995214..a456df5c1ab2 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
@@ -13,6 +13,7 @@
 #undef DEBUG
 
 #include <linux/pci.h>
+#include <linux/of_address.h>
 #include <asm/mpc52xx.h>
 #include <asm/delay.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
index 76a8102bdb98..1e0a5e9644dc 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
@@ -101,8 +101,9 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/mpc52xx.h>
 
 /* HW IRQ mapping */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pm.c b/arch/powerpc/platforms/52xx/mpc52xx_pm.c
index b1d208ded981..549b3629e39a 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pm.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pm.c
@@ -2,6 +2,8 @@
 #include <linux/init.h>
 #include <linux/suspend.h>
 #include <linux/io.h>
+#include <linux/of_address.h>
+
 #include <asm/time.h>
 #include <asm/cacheflush.h>
 #include <asm/mpc52xx.h>
diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
index 285bfe19b798..cf3210042a2e 100644
--- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -14,9 +14,9 @@
 #include <linux/irq.h>
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <linux/of_irq.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/cpm2.h>
 
 #include "pq2.h"
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index b6133a237a70..bb8caa5071f8 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -15,6 +15,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/mmc_spi.h>
 #include <linux/mmc/host.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/fsl_devices.h>
 
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 0713deffb40c..7dde5a75332b 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <linux/atomic.h>
@@ -27,7 +28,6 @@
 #include <asm/machdep.h>
 #include <asm/ipic.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index fc88ab97f6e3..fa3538803af7 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -9,12 +9,12 @@
 
 #include <linux/pci.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/ipic.h>
 #include <asm/udbg.h>
-#include <asm/prom.h>
 #include <sysdev/fsl_pci.h>
 
 #include "mpc83xx.h"
diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
index b0bda20aaccf..e2a13a052f96 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb.c
@@ -11,9 +11,9 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <sysdev/fsl_soc.h>
 
 #include "mpc83xx.h"
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 743c65e4d8e4..8e827376d97b 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -17,13 +17,13 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <asm/swiotlb.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 5bd487030256..5f664c3683d0 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -21,6 +21,8 @@
 #include <linux/initrd.h>
 #include <linux/interrupt.h>
 #include <linux/fsl_devices.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pgtable.h>
 
@@ -33,7 +35,6 @@
 #include <asm/pci-bridge.h>
 #include <asm/irq.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <asm/i8259.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 2157a8017aa4..f8d2c97f39bd 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -15,13 +15,13 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include <asm/i8259.h>
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 1f1af0557470..537599906146 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -18,6 +18,7 @@
 
 #include <linux/fsl/guts.h>
 #include <linux/pci.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <asm/div64.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index fd9e3e7ef234..bc58a99164c9 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -14,6 +14,7 @@
 
 #include <linux/fsl/guts.h>
 #include <linux/pci.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <asm/div64.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index 3b9cc4979641..c04868eb2eb1 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/fsl_devices.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/of_device.h>
 
@@ -22,7 +23,6 @@
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 #include "smp.h"
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 4c4d577effd9..64109ad6736c 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/pgtable.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 397e158c1edb..5836e4ecb7a0 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -16,13 +16,13 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
 #include <mm/mmu_decl.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
 
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index 44bbbc535e1d..28833fc17962 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -18,12 +18,12 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index 46d6d3d4957a..8f3718409e01 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -18,12 +18,12 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index acf2c6c3c1eb..6599b213f50d 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -18,12 +18,12 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index 7733d0607da2..b593b9afd30a 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -20,12 +20,13 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/fsl/guts.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index ee983613570c..b2cc32a32d0b 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -19,6 +19,7 @@
 
 #include <linux/pci.h>
 #include <linux/of.h>
+#include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index c58b6f1c40e3..9909456903fe 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -33,12 +33,12 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
+#include <linux/of_irq.h>
 #include <asm/page.h>
 #include <asm/8xx_immap.h>
 #include <asm/cpm1.h>
 #include <asm/io.h>
 #include <asm/rheap.h>
-#include <asm/prom.h>
 #include <asm/cpm.h>
 
 #include <asm/fs_pd.h>
diff --git a/arch/powerpc/platforms/8xx/m8xx_setup.c b/arch/powerpc/platforms/8xx/m8xx_setup.c
index df4d57d07f9a..c6004a0210a0 100644
--- a/arch/powerpc/platforms/8xx/m8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/m8xx_setup.c
@@ -17,10 +17,11 @@
 #include <linux/time.h>
 #include <linux/rtc.h>
 #include <linux/fsl_devices.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 
 #include <asm/io.h>
 #include <asm/8xx_immap.h>
-#include <asm/prom.h>
 #include <asm/fs_pd.h>
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index f2ba837249d6..4436d63bd3f9 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -4,7 +4,8 @@
 #include <linux/signal.h>
 #include <linux/irq.h>
 #include <linux/dma-mapping.h>
-#include <asm/prom.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/8xx_immap.h>
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index 9d252c554f7f..397ce6a40bd0 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -8,6 +8,7 @@
  * Copyright 2003 by Hans-Joerg Frieden and Thomas Frieden
  */
 
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 354a58c1e6f2..f3291e957a19 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -13,10 +13,10 @@
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/debugfs.h>
+#include <linux/of_irq.h>
 
 #include <asm/dcr.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 
 #include "cell.h"
 
diff --git a/arch/powerpc/platforms/cell/cbe_powerbutton.c b/arch/powerpc/platforms/cell/cbe_powerbutton.c
index bda589dfb051..a3ee397486f6 100644
--- a/arch/powerpc/platforms/cell/cbe_powerbutton.c
+++ b/arch/powerpc/platforms/cell/cbe_powerbutton.c
@@ -9,9 +9,9 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <asm/pmi.h>
-#include <asm/prom.h>
 
 static struct input_dev *button_dev;
 static struct platform_device *button_pdev;
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 1c4c53bec66c..a6c679bff806 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -10,12 +10,12 @@
 #include <linux/percpu.h>
 #include <linux/types.h>
 #include <linux/export.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/cell-regs.h>
 
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 0873a7a20271..03ee8152ee97 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -18,15 +18,16 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/export.h>
 #include <linux/percpu.h>
 #include <linux/types.h>
 #include <linux/ioport.h>
 #include <linux/kernel_stat.h>
 #include <linux/pgtable.h>
+#include <linux/of_address.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/machdep.h>
 #include <asm/cell-regs.h>
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 25e726bf0172..df87cbe339e3 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -12,8 +12,10 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/memblock.h>
diff --git a/arch/powerpc/platforms/cell/ras.c b/arch/powerpc/platforms/cell/ras.c
index 4325c05bedd9..8d934ea6270c 100644
--- a/arch/powerpc/platforms/cell/ras.c
+++ b/arch/powerpc/platforms/cell/ras.c
@@ -12,11 +12,11 @@
 #include <linux/reboot.h>
 #include <linux/kexec.h>
 #include <linux/crash_dump.h>
+#include <linux/of.h>
 
 #include <asm/kexec.h>
 #include <asm/reg.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include <asm/cell-regs.h>
diff --git a/arch/powerpc/platforms/cell/spider-pci.c b/arch/powerpc/platforms/cell/spider-pci.c
index a1c293f42a1f..6f349b3dee38 100644
--- a/arch/powerpc/platforms/cell/spider-pci.c
+++ b/arch/powerpc/platforms/cell/spider-pci.c
@@ -8,6 +8,7 @@
 #undef DEBUG
 
 #include <linux/kernel.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/io.h>
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index 8af75867cb42..11df737c8c6a 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -10,9 +10,10 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/ioport.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/pgtable.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 
 #include "interrupt.h"
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index ddf8742f09a3..1ccf17f255dd 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -16,11 +16,12 @@
 #include <linux/io.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <asm/spu.h>
 #include <asm/spu_priv1.h>
 #include <asm/firmware.h>
-#include <asm/prom.h>
 
 #include "spufs/spufs.h"
 #include "interrupt.h"
diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 4c702192412f..34334c32b7f5 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -21,10 +21,10 @@
 #include <linux/namei.h>
 #include <linux/pagemap.h>
 #include <linux/poll.h>
+#include <linux/of.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 
-#include <asm/prom.h>
 #include <asm/spu.h>
 #include <asm/spu_priv1.h>
 #include <linux/uaccess.h>
diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
index e820332b59a0..dab78076fedb 100644
--- a/arch/powerpc/platforms/chrp/nvram.c
+++ b/arch/powerpc/platforms/chrp/nvram.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
-#include <asm/prom.h>
+#include <linux/of.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include "chrp.h"
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 76e6256cb0a7..6f6598e771ff 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -9,11 +9,11 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/of_address.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/hydra.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/sections.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 3cfc382841e5..ef4c2b15f9dd 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -32,9 +32,11 @@
 #include <linux/root_dev.h>
 #include <linux/initrd.h>
 #include <linux/timer.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/of_irq.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/dma.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/chrp/time.c b/arch/powerpc/platforms/chrp/time.c
index acde7bbe0716..3ea535b5265d 100644
--- a/arch/powerpc/platforms/chrp/time.c
+++ b/arch/powerpc/platforms/chrp/time.c
@@ -21,10 +21,10 @@
 #include <linux/init.h>
 #include <linux/bcd.h>
 #include <linux/ioport.h>
+#include <linux/of_address.h>
 
 #include <asm/io.h>
 #include <asm/nvram.h>
-#include <asm/prom.h>
 #include <asm/sections.h>
 #include <asm/time.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 07e71ba3e846..78f2378d9223 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -22,12 +22,13 @@
 #include <linux/serial.h>
 #include <linux/tty.h>
 #include <linux/serial_core.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/extable.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/tsi108.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/embedded6xx/ls_uart.c b/arch/powerpc/platforms/embedded6xx/ls_uart.c
index 9d891bd5df5a..0133e175a0fc 100644
--- a/arch/powerpc/platforms/embedded6xx/ls_uart.c
+++ b/arch/powerpc/platforms/embedded6xx/ls_uart.c
@@ -14,8 +14,8 @@
 #include <linux/delay.h>
 #include <linux/serial_reg.h>
 #include <linux/serial_8250.h>
+#include <linux/of.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/termbits.h>
 
 #include "mpc10x.h"
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 9eb9abb5bce2..8b2b42210356 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -27,10 +27,10 @@
 #include <linux/serial.h>
 #include <linux/tty.h>
 #include <linux/serial_core.h>
+#include <linux/of_irq.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/tsi108.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index c06a0490d157..4854cc592cec 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -12,12 +12,12 @@
  * Author: Stephen Chivers <schivers@csc.com>
  */
 
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include <asm/i8259.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
index 5aea46566233..e02bdabf358c 100644
--- a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
+++ b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
@@ -7,10 +7,11 @@
  * Copyright (C) 2008,2009 Albert Herranz
  */
 
+#include <linux/of_address.h>
+
 #include <mm/mmu_decl.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/udbg.h>
 #include <asm/fixmap.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index f60ade584bb2..9e03ff8f631c 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -13,13 +13,13 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/seq_file.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/memblock.h>
 #include <mm/mmu_decl.h>
 
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 
diff --git a/arch/powerpc/platforms/fsl_uli1575.c b/arch/powerpc/platforms/fsl_uli1575.c
index 044a20c1fbde..84afae7a2561 100644
--- a/arch/powerpc/platforms/fsl_uli1575.c
+++ b/arch/powerpc/platforms/fsl_uli1575.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/interrupt.h>
 #include <linux/mc146818rtc.h>
+#include <linux/of_irq.h>
 
 #include <asm/pci-bridge.h>
 
diff --git a/arch/powerpc/platforms/maple/pci.c b/arch/powerpc/platforms/maple/pci.c
index 37875e478b3a..b911b31717cc 100644
--- a/arch/powerpc/platforms/maple/pci.c
+++ b/arch/powerpc/platforms/maple/pci.c
@@ -12,10 +12,10 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/irq.h>
+#include <linux/of_irq.h>
 
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 4e9ad5bf3efb..c26c379e1cc8 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -36,12 +36,12 @@
 #include <linux/serial.h>
 #include <linux/smp.h>
 #include <linux/bitops.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/memblock.h>
 
 #include <asm/processor.h>
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/pci-bridge.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/maple/time.c b/arch/powerpc/platforms/maple/time.c
index 78209bb7629c..823e219ef8ee 100644
--- a/arch/powerpc/platforms/maple/time.c
+++ b/arch/powerpc/platforms/maple/time.c
@@ -19,9 +19,9 @@
 #include <linux/interrupt.h>
 #include <linux/mc146818rtc.h>
 #include <linux/bcd.h>
+#include <linux/of_address.h>
 
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 26427311fc72..1be1f18f6f09 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -10,6 +10,8 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/sched.h>
 
 #include <asm/pasemi_dma.h>
diff --git a/arch/powerpc/platforms/pasemi/iommu.c b/arch/powerpc/platforms/pasemi/iommu.c
index 5be7242fbd86..0a38663d44ed 100644
--- a/arch/powerpc/platforms/pasemi/iommu.c
+++ b/arch/powerpc/platforms/pasemi/iommu.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include <linux/spinlock.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 #include <asm/iommu.h>
 #include <asm/machdep.h>
 #include <asm/firmware.h>
diff --git a/arch/powerpc/platforms/pasemi/misc.c b/arch/powerpc/platforms/pasemi/misc.c
index 1bf65d02d3ba..f859ada29074 100644
--- a/arch/powerpc/platforms/pasemi/misc.c
+++ b/arch/powerpc/platforms/pasemi/misc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/i2c.h>
 
 #ifdef CONFIG_I2C_BOARDINFO
diff --git a/arch/powerpc/platforms/pasemi/msi.c b/arch/powerpc/platforms/pasemi/msi.c
index ea1e41451408..dc1846660005 100644
--- a/arch/powerpc/platforms/pasemi/msi.c
+++ b/arch/powerpc/platforms/pasemi/msi.c
@@ -9,9 +9,9 @@
  */
 
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index d4b922759d6e..55f0160910bf 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -12,6 +12,7 @@
 
 
 #include <linux/kernel.h>
+#include <linux/of_address.h>
 #include <linux/pci.h>
 
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index f974bfe7fde1..2aef49e04dd4 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -18,8 +18,8 @@
 #include <linux/pci.h>
 #include <linux/of_platform.h>
 #include <linux/gfp.h>
+#include <linux/irqdomain.h>
 
-#include <asm/prom.h>
 #include <asm/iommu.h>
 #include <asm/machdep.h>
 #include <asm/i8259.h>
diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
index d20ef35e6d9d..d38ad9288dbf 100644
--- a/arch/powerpc/platforms/powermac/bootx_init.c
+++ b/arch/powerpc/platforms/powermac/bootx_init.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/init.h>
+#include <linux/of_fdt.h>
 #include <generated/utsrelease.h>
 #include <asm/sections.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index df89d916236d..06c7e9ad6026 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -40,10 +40,10 @@
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/of_irq.h>
 #include <asm/keylargo.h>
 #include <asm/uninorth.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/smu.h>
 #include <asm/pmac_pfunc.h>
diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index de8fcb607290..7b13a08e3d8e 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -17,9 +17,9 @@
 #include <linux/memblock.h>
 #include <linux/completion.h>
 #include <linux/spinlock.h>
+#include <linux/of_address.h>
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/nvram.h>
 
diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index e9abe0f2e7f0..d71359b5331c 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -12,11 +12,12 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/irq.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
diff --git a/arch/powerpc/platforms/powermac/pfunc_core.c b/arch/powerpc/platforms/powermac/pfunc_core.c
index 94df0a91b46f..c746c889969a 100644
--- a/arch/powerpc/platforms/powermac/pfunc_core.c
+++ b/arch/powerpc/platforms/powermac/pfunc_core.c
@@ -12,8 +12,8 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 
-#include <asm/prom.h>
 #include <asm/pmac_pfunc.h>
 
 /* Debug */
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index bb0566633af5..71a3f62d9b5f 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -20,11 +20,13 @@
 #include <linux/adb.h>
 #include <linux/minmax.h>
 #include <linux/pmu.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <asm/sections.h>
 #include <asm/io.h>
 #include <asm/smp.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/time.h>
 #include <asm/pmac_feature.h>
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index da1efdc30d6c..0798ecea2474 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -22,6 +22,7 @@
 #include <linux/sched/hotplug.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel_stat.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -39,7 +40,6 @@
 #include <asm/page.h>
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 31d6213a6c8f..4c5790aff1b5 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -24,9 +24,9 @@
 #include <linux/interrupt.h>
 #include <linux/hardirq.h>
 #include <linux/rtc.h>
+#include <linux/of_address.h>
 
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/powermac/udbg_adb.c b/arch/powerpc/platforms/powermac/udbg_adb.c
index 93e0a8372fbc..b4756defd596 100644
--- a/arch/powerpc/platforms/powermac/udbg_adb.c
+++ b/arch/powerpc/platforms/powermac/udbg_adb.c
@@ -7,6 +7,7 @@
 #include <linux/adb.h>
 #include <linux/pmu.h>
 #include <linux/cuda.h>
+#include <linux/of.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c b/arch/powerpc/platforms/powermac/udbg_scc.c
index 2465bf466380..734df5a32f99 100644
--- a/arch/powerpc/platforms/powermac/udbg_scc.c
+++ b/arch/powerpc/platforms/powermac/udbg_scc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2001-2005 PPC 64 Team, IBM Corp
  */
 #include <linux/types.h>
+#include <linux/of.h>
 #include <asm/udbg.h>
 #include <asm/processor.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 89e22c460ebf..178b226ab322 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/list.h>
 #include <linux/msi.h>
 #include <linux/of.h>
diff --git a/arch/powerpc/platforms/powernv/pci-cxl.c b/arch/powerpc/platforms/powernv/pci-cxl.c
index 53172862d23b..7e419de71db8 100644
--- a/arch/powerpc/platforms/powernv/pci-cxl.c
+++ b/arch/powerpc/platforms/powernv/pci-cxl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/module.h>
+#include <misc/cxl-base.h>
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b722ac902269..6fbf265a0818 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -21,10 +21,11 @@
 #include <linux/rculist.h>
 #include <linux/sizes.h>
 #include <linux/debugfs.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <asm/sections.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index 3de9145c20bc..d7495785fe47 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -13,13 +13,13 @@
 #include <linux/console.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
 #include <asm/time.h>
 #include <asm/iommu.h>
 #include <asm/udbg.h>
-#include <asm/prom.h>
 #include <asm/lv1call.h>
 #include <asm/ps3gpu.h>
 
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index fb2919fd6bc0..a3a71d37cb9a 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -7,6 +7,7 @@
 #include <linux/crash_dump.h>
 #include <linux/device.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/msi.h>
 
 #include <asm/rtas.h>
diff --git a/arch/powerpc/platforms/pseries/nvram.c b/arch/powerpc/platforms/pseries/nvram.c
index 69db2eca367f..cbf1720eb4aa 100644
--- a/arch/powerpc/platforms/pseries/nvram.c
+++ b/arch/powerpc/platforms/pseries/nvram.c
@@ -13,9 +13,9 @@
 #include <linux/slab.h>
 #include <linux/ctype.h>
 #include <linux/uaccess.h>
+#include <linux/of.h>
 #include <asm/nvram.h>
 #include <asm/rtas.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 
 /* Max bytes to read/write in one go */
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 35f9cb602c30..ed00aa245f41 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -13,9 +13,10 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/crash_dump.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/page.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/fadump.h>
 #include <asm/fadump-internal.h>
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 069d7b3bb142..41b32a8f809b 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -36,6 +36,7 @@
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/memblock.h>
 #include <linux/swiotlb.h>
@@ -43,7 +44,6 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/pci-bridge.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index c9f9be4ea26a..00ecac2c205b 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -23,6 +23,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/kobject.h>
 #include <linux/kexec.h>
+#include <linux/of_irq.h>
 
 #include <asm/iommu.h>
 #include <asm/dma.h>
diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pic.c
index 9e86074719a9..cb9ba4ef557a 100644
--- a/arch/powerpc/sysdev/cpm2_pic.c
+++ b/arch/powerpc/sysdev/cpm2_pic.c
@@ -30,11 +30,11 @@
 #include <linux/sched.h>
 #include <linux/signal.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 
 #include <asm/immap_cpm2.h>
 #include <asm/mpc8260.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/fs_pd.h>
 
 #include "cpm2_pic.h"
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index be6b99b1b352..610ca7074066 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -25,8 +25,8 @@
 #include <linux/memblock.h>
 #include <linux/gfp.h>
 #include <linux/kmemleak.h>
+#include <linux/of_address.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/iommu.h>
 #include <asm/pci-bridge.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/sysdev/dcr.c b/arch/powerpc/sysdev/dcr.c
index 22991e1128e3..3093f14111e6 100644
--- a/arch/powerpc/sysdev/dcr.c
+++ b/arch/powerpc/sysdev/dcr.c
@@ -8,7 +8,7 @@
 
 #include <linux/kernel.h>
 #include <linux/export.h>
-#include <asm/prom.h>
+#include <linux/of_address.h>
 #include <asm/dcr.h>
 
 #ifdef CONFIG_PPC_DCR_MMIO
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 1985e067e952..54a9f5931e87 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -18,13 +18,14 @@
 #include <linux/types.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
 #include <linux/syscore_ops.h>
-#include <asm/prom.h>
 #include <asm/fsl_lbc.h>
 
 static DEFINE_SPINLOCK(fsl_lbc_lock);
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index b3475ae9f236..ef9a5999fa93 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -11,11 +11,13 @@
 #include <linux/msi.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/seq_file.h>
 #include <sysdev/fsl_soc.h>
-#include <asm/prom.h>
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 674f047b7820..43d468ea94c3 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -22,6 +22,8 @@
 #include <linux/interrupt.h>
 #include <linux/memblock.h>
 #include <linux/log2.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
@@ -29,7 +31,6 @@
 #include <linux/uaccess.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
index 02553a8ce191..0c97bc15468e 100644
--- a/arch/powerpc/sysdev/ge/ge_pic.c
+++ b/arch/powerpc/sysdev/ge/ge_pic.c
@@ -14,12 +14,14 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/spinlock.h>
 
 #include <asm/byteorder.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/irq.h>
 
 #include "ge_pic.h"
diff --git a/arch/powerpc/sysdev/grackle.c b/arch/powerpc/sysdev/grackle.c
index aaba0b809032..fd2f94a884f0 100644
--- a/arch/powerpc/sysdev/grackle.c
+++ b/arch/powerpc/sysdev/grackle.c
@@ -9,9 +9,9 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/grackle.h>
 
diff --git a/arch/powerpc/sysdev/i8259.c b/arch/powerpc/sysdev/i8259.c
index 3b1ae98e3ce9..06e391485da7 100644
--- a/arch/powerpc/sysdev/i8259.c
+++ b/arch/powerpc/sysdev/i8259.c
@@ -6,11 +6,11 @@
 
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <asm/io.h>
 #include <asm/i8259.h>
-#include <asm/prom.h>
 
 static volatile void __iomem *pci_intack; /* RO, gives us the irq vector */
 
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 3f10c9fc3b68..5f69e2d50f26 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -18,9 +18,10 @@
 #include <linux/device.h>
 #include <linux/spinlock.h>
 #include <linux/fsl_devices.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/ipic.h>
 
 #include "ipic.h"
diff --git a/arch/powerpc/sysdev/mmio_nvram.c b/arch/powerpc/sysdev/mmio_nvram.c
index 628f9b759c84..eb48210ef98e 100644
--- a/arch/powerpc/sysdev/mmio_nvram.c
+++ b/arch/powerpc/sysdev/mmio_nvram.c
@@ -10,12 +10,12 @@
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/of_address.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include <asm/machdep.h>
 #include <asm/nvram.h>
-#include <asm/prom.h>
 
 static void __iomem *mmio_nvram_start;
 static long mmio_nvram_len;
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index dbcbaa4c0663..9a9381f102d6 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -30,6 +30,8 @@
 #include <linux/syscore_ops.h>
 #include <linux/ratelimit.h>
 #include <linux/pgtable.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <asm/ptrace.h>
 #include <asm/signal.h>
diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index 36ec0bdd8b63..45733e828018 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -7,12 +7,13 @@
  */
 
 #include <linux/list.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/slab.h>
-#include <asm/prom.h>
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/mpic_msgr.h>
diff --git a/arch/powerpc/sysdev/mpic_msi.c b/arch/powerpc/sysdev/mpic_msi.c
index f412d6ad0b66..f88b03b67b96 100644
--- a/arch/powerpc/sysdev/mpic_msi.c
+++ b/arch/powerpc/sysdev/mpic_msi.c
@@ -4,10 +4,11 @@
  */
 
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_irq.h>
 #include <linux/bitmap.h>
 #include <linux/msi.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/sysdev/mpic_u3msi.c b/arch/powerpc/sysdev/mpic_u3msi.c
index 3f4841dfefb5..503e0916e15e 100644
--- a/arch/powerpc/sysdev/mpic_u3msi.c
+++ b/arch/powerpc/sysdev/mpic_u3msi.c
@@ -5,9 +5,9 @@
  */
 
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <asm/mpic.h>
-#include <asm/prom.h>
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/sysdev/msi_bitmap.c b/arch/powerpc/sysdev/msi_bitmap.c
index fdd3e17150fc..0b6e37f3ffb8 100644
--- a/arch/powerpc/sysdev/msi_bitmap.c
+++ b/arch/powerpc/sysdev/msi_bitmap.c
@@ -8,6 +8,7 @@
 #include <linux/kmemleak.h>
 #include <linux/bitmap.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 #include <asm/msi_bitmap.h>
 #include <asm/setup.h>
 
diff --git a/arch/powerpc/sysdev/pmi.c b/arch/powerpc/sysdev/pmi.c
index 9c8744e09a9c..9dabb50c36eb 100644
--- a/arch/powerpc/sysdev/pmi.c
+++ b/arch/powerpc/sysdev/pmi.c
@@ -17,12 +17,13 @@
 #include <linux/spinlock.h>
 #include <linux/module.h>
 #include <linux/workqueue.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include <asm/io.h>
 #include <asm/pmi.h>
-#include <asm/prom.h>
 
 struct pmi_data {
 	struct list_head	handler;
diff --git a/arch/powerpc/sysdev/rtc_cmos_setup.c b/arch/powerpc/sysdev/rtc_cmos_setup.c
index af0f9beddca9..47cc87bd6a33 100644
--- a/arch/powerpc/sysdev/rtc_cmos_setup.c
+++ b/arch/powerpc/sysdev/rtc_cmos_setup.c
@@ -14,8 +14,8 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mc146818rtc.h>
+#include <linux/of_address.h>
 
-#include <asm/prom.h>
 
 static int  __init add_rtc(void)
 {
diff --git a/arch/powerpc/sysdev/tsi108_dev.c b/arch/powerpc/sysdev/tsi108_dev.c
index 9e13fb35ed5c..30051397292f 100644
--- a/arch/powerpc/sysdev/tsi108_dev.c
+++ b/arch/powerpc/sysdev/tsi108_dev.c
@@ -16,13 +16,14 @@
 #include <linux/device.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_net.h>
 #include <asm/tsi108.h>
 
 #include <linux/atomic.h>
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <mm/mmu_decl.h>
 
 #undef DEBUG
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 1070220f15d5..5af4c35ff584 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -12,7 +12,9 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
 
 #include <asm/byteorder.h>
 #include <asm/io.h>
@@ -23,7 +25,6 @@
 #include <asm/tsi108.h>
 #include <asm/tsi108_pci.h>
 #include <asm/tsi108_irq.h>
-#include <asm/prom.h>
 
 #undef DEBUG
 #ifdef DEBUG
diff --git a/arch/powerpc/sysdev/xics/icp-native.c b/arch/powerpc/sysdev/xics/icp-native.c
index 7d13d2ef5a90..edc17b6b1cc2 100644
--- a/arch/powerpc/sysdev/xics/icp-native.c
+++ b/arch/powerpc/sysdev/xics/icp-native.c
@@ -6,15 +6,16 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index f3fb2a12124c..ce76f9759952 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -6,6 +6,7 @@
 #include <linux/threads.h>
 #include <linux/kernel.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/debugfs.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
@@ -17,7 +18,6 @@
 #include <linux/spinlock.h>
 #include <linux/delay.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 32863b4daf72..f056df0c5fd1 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -9,6 +9,7 @@
 #include <linux/threads.h>
 #include <linux/kernel.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/debugfs.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
@@ -21,7 +22,6 @@
 #include <linux/msi.h>
 #include <linux/vmalloc.h>
 
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index f940428ad13f..c105509cb9c4 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/delay.h>
@@ -21,7 +22,6 @@
 #include <linux/kmemleak.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 29456c255f9f..1669ddba7884 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -11,6 +11,8 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/cpumask.h>
-- 
2.34.1

