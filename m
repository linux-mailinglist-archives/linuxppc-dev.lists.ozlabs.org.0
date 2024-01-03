Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A74823912
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 00:17:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LwZaK44J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T55GW1Jhtz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 10:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LwZaK44J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T55FX507Gz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 10:16:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 766F8B81647;
	Wed,  3 Jan 2024 23:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C5FC433CB;
	Wed,  3 Jan 2024 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704323788;
	bh=WZ7gAT0aNZtgc7x8Ja+TjiUlaoxGisQLVAAOOJ2bIVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwZaK44JEcHDsXSY1jV5FSOp2qFaEzVqG/Uq40YRnwU4GKg2lm7K5B0AoybLh7w+p
	 AQz7Og7ZxQ9FA3HXlJmUlnRmW5V1lrNuvsUoFVbgQ3K5Rgz/3PikobCdBvfjaoGiUX
	 KwZSvXnEk/YTzLHzMi741xN1/DxjHPaLwAtA05V8xVIeQ9MfqaIhKmpF7VbmR8VqbG
	 9tL/tfbLMQczkH1feC7r9SBzyzCoFJZAI3LPJML4dHEpp3v6sY1fi8h+6t+e/4vkDN
	 YqMwKe9KoFa9VY5UWIeO89P3ZWgP3W5e+0j3oq297LxZVdj8hXWit9Bw6ZnwbFDcIz
	 R0dLS1OmwXqSg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 7/8] powerpc: Fix typos
Date: Wed,  3 Jan 2024 17:16:04 -0600
Message-Id: <20240103231605.1801364-8-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103231605.1801364-1-helgaas@kernel.org>
References: <20240103231605.1801364-1-helgaas@kernel.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos, most reported by "codespell arch/powerpc".  Only touches
comments, no code changes.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/boot/Makefile                   |  4 ++--
 arch/powerpc/boot/dts/acadia.dts             |  2 +-
 arch/powerpc/boot/main.c                     |  2 +-
 arch/powerpc/boot/ps3.c                      |  2 +-
 arch/powerpc/include/asm/io.h                |  2 +-
 arch/powerpc/include/asm/opal-api.h          |  4 ++--
 arch/powerpc/include/asm/pmac_feature.h      |  2 +-
 arch/powerpc/include/asm/uninorth.h          |  2 +-
 arch/powerpc/include/uapi/asm/bootx.h        |  2 +-
 arch/powerpc/kernel/eeh_pe.c                 |  2 +-
 arch/powerpc/kernel/fadump.c                 |  2 +-
 arch/powerpc/kernel/misc_64.S                |  4 ++--
 arch/powerpc/kernel/process.c                | 12 ++++++------
 arch/powerpc/kernel/ptrace/ptrace-tm.c       |  2 +-
 arch/powerpc/kernel/smp.c                    |  2 +-
 arch/powerpc/kernel/sysfs.c                  |  4 ++--
 arch/powerpc/kvm/book3s_xive.c               |  2 +-
 arch/powerpc/mm/cacheflush.c                 |  2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c         |  2 +-
 arch/powerpc/platforms/512x/mpc512x_shared.c |  2 +-
 arch/powerpc/platforms/cell/spufs/sched.c    |  2 +-
 arch/powerpc/platforms/maple/pci.c           |  2 +-
 arch/powerpc/platforms/powermac/pic.c        |  2 +-
 arch/powerpc/platforms/powermac/sleep.S      |  2 +-
 arch/powerpc/platforms/powernv/pci-sriov.c   |  4 ++--
 arch/powerpc/platforms/powernv/vas-window.c  |  2 +-
 arch/powerpc/platforms/pseries/vas.c         |  2 +-
 arch/powerpc/sysdev/xive/common.c            |  4 ++--
 arch/powerpc/sysdev/xive/native.c            |  2 +-
 29 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 968aee2025b8..9c2b6e527ed1 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -108,8 +108,8 @@ DTC_FLAGS	?= -p 1024
 # these files into the build dir, fix up any includes and ensure that dependent
 # files are copied in the right order.
 
-# these need to be seperate variables because they are copied out of different
-# directories in the kernel tree. Sure you COULd merge them, but it's a
+# these need to be separate variables because they are copied out of different
+# directories in the kernel tree. Sure you COULD merge them, but it's a
 # cure-is-worse-than-disease situation.
 zlib-decomp-$(CONFIG_KERNEL_GZIP) := decompress_inflate.c
 zlib-$(CONFIG_KERNEL_GZIP) := inffast.c inflate.c inftrees.c
diff --git a/arch/powerpc/boot/dts/acadia.dts b/arch/powerpc/boot/dts/acadia.dts
index deb52e41ab84..5fedda811378 100644
--- a/arch/powerpc/boot/dts/acadia.dts
+++ b/arch/powerpc/boot/dts/acadia.dts
@@ -172,7 +172,7 @@ ieee1588@ef602800 {
 				reg = <0xef602800 0x60>;
 				interrupt-parent = <&UIC0>;
 				interrupts = <0x4 0x4>;
-				/* This thing is a bit weird.  It has it's own UIC
+				/* This thing is a bit weird.  It has its own UIC
 				 * that it uses to generate snapshot triggers.  We
 				 * don't really support this device yet, and it needs
 				 * work to figure this out.
diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index cae31a6e8f02..2c0e2a1cab01 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -188,7 +188,7 @@ static inline void prep_esm_blob(struct addr_range vmlinux, void *chosen) { }
 
 /* A buffer that may be edited by tools operating on a zImage binary so as to
  * edit the command line passed to vmlinux (by setting /chosen/bootargs).
- * The buffer is put in it's own section so that tools may locate it easier.
+ * The buffer is put in its own section so that tools may locate it easier.
  */
 static char cmdline[BOOT_COMMAND_LINE_SIZE]
 	__attribute__((__section__("__builtin_cmdline")));
diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index f157717ae814..89ff46b8b225 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -25,7 +25,7 @@ BSS_STACK(4096);
 
 /* A buffer that may be edited by tools operating on a zImage binary so as to
  * edit the command line passed to vmlinux (by setting /chosen/bootargs).
- * The buffer is put in it's own section so that tools may locate it easier.
+ * The buffer is put in its own section so that tools may locate it easier.
  */
 
 static char cmdline[BOOT_COMMAND_LINE_SIZE]
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 5220274a6277..7fb001ab3109 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -989,7 +989,7 @@ static inline phys_addr_t page_to_phys(struct page *page)
 }
 
 /*
- * 32 bits still uses virt_to_bus() for it's implementation of DMA
+ * 32 bits still uses virt_to_bus() for its implementation of DMA
  * mappings se we have to keep it defined here. We also have some old
  * drivers (shame shame shame) that use bus_to_virt() and haven't been
  * fixed yet so I need to define it here.
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index a2bc4b95e703..8c9d4b26bf57 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1027,10 +1027,10 @@ struct opal_i2c_request {
  * The host will pass on OPAL, a buffer of length OPAL_SYSEPOW_MAX
  * with individual elements being 16 bits wide to fetch the system
  * wide EPOW status. Each element in the buffer will contain the
- * EPOW status in it's bit representation for a particular EPOW sub
+ * EPOW status in its bit representation for a particular EPOW sub
  * class as defined here. So multiple detailed EPOW status bits
  * specific for any sub class can be represented in a single buffer
- * element as it's bit representation.
+ * element as its bit representation.
  */
 
 /* System EPOW type */
diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
index 2495866f2e97..420e2878ae67 100644
--- a/arch/powerpc/include/asm/pmac_feature.h
+++ b/arch/powerpc/include/asm/pmac_feature.h
@@ -192,7 +192,7 @@ static inline long pmac_call_feature(int selector, struct device_node* node,
 
 /* PMAC_FTR_BMAC_ENABLE		(struct device_node* node, 0, int value)
  * enable/disable the bmac (ethernet) cell of a mac-io ASIC, also drive
- * it's reset line
+ * its reset line
  */
 #define PMAC_FTR_BMAC_ENABLE		PMAC_FTR_DEF(6)
 
diff --git a/arch/powerpc/include/asm/uninorth.h b/arch/powerpc/include/asm/uninorth.h
index e278299b9b37..6949b5daa37d 100644
--- a/arch/powerpc/include/asm/uninorth.h
+++ b/arch/powerpc/include/asm/uninorth.h
@@ -144,7 +144,7 @@
 #define UNI_N_HWINIT_STATE_SLEEPING	0x01
 #define UNI_N_HWINIT_STATE_RUNNING	0x02
 /* This last bit appear to be used by the bootROM to know the second
- * CPU has started and will enter it's sleep loop with IP=0
+ * CPU has started and will enter its sleep loop with IP=0
  */
 #define UNI_N_HWINIT_STATE_CPU1_FLAG	0x10000000
 
diff --git a/arch/powerpc/include/uapi/asm/bootx.h b/arch/powerpc/include/uapi/asm/bootx.h
index 6728c7e24e58..1b8c121071d9 100644
--- a/arch/powerpc/include/uapi/asm/bootx.h
+++ b/arch/powerpc/include/uapi/asm/bootx.h
@@ -108,7 +108,7 @@ typedef struct boot_infos
     /* ALL BELOW NEW (vers. 4) */
 
     /* This defines the physical memory. Valid with BOOT_ARCH_NUBUS flag
-       (non-PCI) only. On PCI, memory is contiguous and it's size is in the
+       (non-PCI) only. On PCI, memory is contiguous and its size is in the
        device-tree. */
     boot_info_map_entry_t
     	        physMemoryMap[MAX_MEM_MAP_SIZE]; /* Where the phys memory is */
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e0ce81279624..95164511fd12 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -527,7 +527,7 @@ EXPORT_SYMBOL_GPL(eeh_pe_state_mark);
  * eeh_pe_mark_isolated
  * @pe: EEH PE
  *
- * Record that a PE has been isolated by marking the PE and it's children as
+ * Record that a PE has been isolated by marking the PE and its children as
  * EEH_PE_ISOLATED (and EEH_PE_CFG_BLOCKED, if required) and their PCI devices
  * as pci_channel_io_frozen.
  */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d14eda1e8589..81c3229a6013 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -705,7 +705,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	 * old_cpu == -1 means this is the first CPU which has come here,
 	 * go ahead and trigger fadump.
 	 *
-	 * old_cpu != -1 means some other CPU has already on it's way
+	 * old_cpu != -1 means some other CPU has already on its way
 	 * to trigger fadump, just keep looping here.
 	 */
 	this_cpu = smp_processor_id();
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 1a8cdafd68e8..91123e102db4 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -192,7 +192,7 @@ _GLOBAL(scom970_read)
 	xori	r0,r0,MSR_EE
 	mtmsrd	r0,1
 
-	/* rotate 24 bits SCOM address 8 bits left and mask out it's low 8 bits
+	/* rotate 24 bits SCOM address 8 bits left and mask out its low 8 bits
 	 * (including parity). On current CPUs they must be 0'd,
 	 * and finally or in RW bit
 	 */
@@ -226,7 +226,7 @@ _GLOBAL(scom970_write)
 	xori	r0,r0,MSR_EE
 	mtmsrd	r0,1
 
-	/* rotate 24 bits SCOM address 8 bits left and mask out it's low 8 bits
+	/* rotate 24 bits SCOM address 8 bits left and mask out its low 8 bits
 	 * (including parity). On current CPUs they must be 0'd.
 	 */
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..3e738be554a4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1647,7 +1647,7 @@ void arch_setup_new_exec(void)
  * cases will happen:
  *
  * 1. The correct thread is running, the wrong thread is not
- * In this situation, the correct thread is woken and proceeds to pass it's
+ * In this situation, the correct thread is woken and proceeds to pass its
  * condition check.
  *
  * 2. Neither threads are running
@@ -1657,15 +1657,15 @@ void arch_setup_new_exec(void)
  * for the wrong thread, or they will execute the condition check immediately.
  *
  * 3. The wrong thread is running, the correct thread is not
- * The wrong thread will be woken, but will fail it's condition check and
+ * The wrong thread will be woken, but will fail its condition check and
  * re-execute wait. The correct thread, when scheduled, will execute either
- * it's condition check (which will pass), or wait, which returns immediately
- * when called the first time after the thread is scheduled, followed by it's
+ * its condition check (which will pass), or wait, which returns immediately
+ * when called the first time after the thread is scheduled, followed by its
  * condition check (which will pass).
  *
  * 4. Both threads are running
- * Both threads will be woken. The wrong thread will fail it's condition check
- * and execute another wait, while the correct thread will pass it's condition
+ * Both threads will be woken. The wrong thread will fail its condition check
+ * and execute another wait, while the correct thread will pass its condition
  * check.
  *
  * @t: the task to set the thread ID for
diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index 210ea834e603..447bff87fd21 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -12,7 +12,7 @@ void flush_tmregs_to_thread(struct task_struct *tsk)
 {
 	/*
 	 * If task is not current, it will have been flushed already to
-	 * it's thread_struct during __switch_to().
+	 * its thread_struct during __switch_to().
 	 *
 	 * A reclaim flushes ALL the state or if not in TM save TM SPRs
 	 * in the appropriate thread structures from live.
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ab691c89d787..4e0c62897405 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1564,7 +1564,7 @@ static void add_cpu_to_masks(int cpu)
 
 	/*
 	 * This CPU will not be in the online mask yet so we need to manually
-	 * add it to it's own thread sibling mask.
+	 * add it to its own thread sibling mask.
 	 */
 	map_cpu_to_node(cpu, cpu_to_node(cpu));
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 0f39a6b84132..b842c83ab497 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -139,7 +139,7 @@ static unsigned long dscr_default;
  * @val:	Returned cpu specific DSCR default value
  *
  * This function returns the per cpu DSCR default value
- * for any cpu which is contained in it's PACA structure.
+ * for any cpu which is contained in its PACA structure.
  */
 static void read_dscr(void *val)
 {
@@ -152,7 +152,7 @@ static void read_dscr(void *val)
  * @val:	New cpu specific DSCR default value to update
  *
  * This function updates the per cpu DSCR default value
- * for any cpu which is contained in it's PACA structure.
+ * for any cpu which is contained in its PACA structure.
  */
 static void write_dscr(void *val)
 {
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 29a382249770..1362c672387e 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -531,7 +531,7 @@ static int xive_vm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
 	xc->cppr = xive_prio_from_guest(new_cppr);
 
 	/*
-	 * IPIs are synthetized from MFRR and thus don't need
+	 * IPIs are synthesized from MFRR and thus don't need
 	 * any special EOI handling. The underlying interrupt
 	 * used to signal MFRR changes is EOId when fetched from
 	 * the queue.
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 15189592da09..7186516eca52 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -78,7 +78,7 @@ EXPORT_SYMBOL(flush_icache_range);
 
 #ifdef CONFIG_HIGHMEM
 /**
- * flush_dcache_icache_phys() - Flush a page by it's physical address
+ * flush_dcache_icache_phys() - Flush a page by its physical address
  * @physaddr: the physical address of the page
  */
 static void flush_dcache_icache_phys(unsigned long physaddr)
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index b4f2786a7d2b..7ac97a28c1b3 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -376,7 +376,7 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 		create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
 	}
 
-	/* Copy the kernel to it's new location and run */
+	/* Copy the kernel to its new location and run */
 	memcpy((void *)kernstart_virt_addr, (void *)_stext, kernel_sz);
 	flush_icache_range(kernstart_virt_addr, kernstart_virt_addr + kernel_sz);
 
diff --git a/arch/powerpc/platforms/512x/mpc512x_shared.c b/arch/powerpc/platforms/512x/mpc512x_shared.c
index 8f75e9574c27..8c1f3b629fc7 100644
--- a/arch/powerpc/platforms/512x/mpc512x_shared.c
+++ b/arch/powerpc/platforms/512x/mpc512x_shared.c
@@ -279,7 +279,7 @@ static void __init mpc512x_setup_diu(void)
 	 * and so negatively affect boot time. Instead we reserve the
 	 * already configured frame buffer area so that it won't be
 	 * destroyed. The starting address of the area to reserve and
-	 * also it's length is passed to memblock_reserve(). It will be
+	 * also its length is passed to memblock_reserve(). It will be
 	 * freed later on first open of fbdev, when splash image is not
 	 * needed any more.
 	 */
diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index 99bd027a7f7c..610ca8570682 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -868,7 +868,7 @@ static int __spu_deactivate(struct spu_context *ctx, int force, int max_prio)
 }
 
 /**
- * spu_deactivate - unbind a context from it's physical spu
+ * spu_deactivate - unbind a context from its physical spu
  * @ctx:	spu context to unbind
  *
  * Unbind @ctx from the physical spu it is running on and schedule
diff --git a/arch/powerpc/platforms/maple/pci.c b/arch/powerpc/platforms/maple/pci.c
index b911b31717cc..b9ff37c7f6f0 100644
--- a/arch/powerpc/platforms/maple/pci.c
+++ b/arch/powerpc/platforms/maple/pci.c
@@ -595,7 +595,7 @@ void __init maple_pci_init(void)
 
 	/* Probe root PCI hosts, that is on U3 the AGP host and the
 	 * HyperTransport host. That one is actually "kept" around
-	 * and actually added last as it's resource management relies
+	 * and actually added last as its resource management relies
 	 * on the AGP resources to have been setup first
 	 */
 	root = of_find_node_by_path("/");
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 7135ea1d7db6..2202bf77c7a3 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -2,7 +2,7 @@
 /*
  *  Support for the interrupt controllers found on Power Macintosh,
  *  currently Apple's "Grand Central" interrupt controller in all
- *  it's incarnations. OpenPIC support used on newer machines is
+ *  its incarnations. OpenPIC support used on newer machines is
  *  in a separate file
  *
  *  Copyright (C) 1997 Paul Mackerras (paulus@samba.org)
diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
index d497a60003d2..822ed70cdcbf 100644
--- a/arch/powerpc/platforms/powermac/sleep.S
+++ b/arch/powerpc/platforms/powermac/sleep.S
@@ -176,7 +176,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	 *    memory location containing the PC to resume from
 	 *    at address 0.
 	 *  - On Core99, we must store the wakeup vector at
-	 *    address 0x80 and eventually it's parameters
+	 *    address 0x80 and eventually its parameters
 	 *    at address 0x84. I've have some trouble with those
 	 *    parameters however and I no longer use them.
 	 */
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 59882da3e742..cc7b1dd54ac6 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -238,7 +238,7 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
 	} else if (pdev->is_physfn) {
 		/*
 		 * For PFs adjust their allocated IOV resources to match what
-		 * the PHB can support using it's M64 BAR table.
+		 * the PHB can support using its M64 BAR table.
 		 */
 		pnv_pci_ioda_fixup_iov_resources(pdev);
 	}
@@ -658,7 +658,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		list_add_tail(&pe->list, &phb->ioda.pe_list);
 		mutex_unlock(&phb->ioda.pe_list_mutex);
 
-		/* associate this pe to it's pdn */
+		/* associate this pe to its pdn */
 		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
 			if (vf_pdn->busno == vf_bus &&
 			    vf_pdn->devfn == vf_devfn) {
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index b664838008c1..5147df3a18ac 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1059,7 +1059,7 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 		}
 	} else {
 		/*
-		 * Interrupt hanlder or fault window setup failed. Means
+		 * Interrupt handler or fault window setup failed. Means
 		 * NX can not generate fault for page fault. So not
 		 * opening for user space tx window.
 		 */
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b1f25bac280b..d8a8c4ccf051 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -228,7 +228,7 @@ static irqreturn_t pseries_vas_irq_handler(int irq, void *data)
 	struct pseries_vas_window *txwin = data;
 
 	/*
-	 * The thread hanlder will process this interrupt if it is
+	 * The thread handler will process this interrupt if it is
 	 * already running.
 	 */
 	atomic_inc(&txwin->pending_faults);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index a289cb97c1d7..fa01818c1972 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -383,7 +383,7 @@ static unsigned int xive_get_irq(void)
  * CPU.
  *
  * If we find that there is indeed more in there, we call
- * force_external_irq_replay() to make Linux synthetize an
+ * force_external_irq_replay() to make Linux synthesize an
  * external interrupt on the next call to local_irq_restore().
  */
 static void xive_do_queue_eoi(struct xive_cpu *xc)
@@ -874,7 +874,7 @@ static int xive_irq_set_vcpu_affinity(struct irq_data *d, void *state)
 		 *
 		 * This also tells us that it's in flight to a host queue
 		 * or has already been fetched but hasn't been EOIed yet
-		 * by the host. This it's potentially using up a host
+		 * by the host. Thus it's potentially using up a host
 		 * queue slot. This is important to know because as long
 		 * as this is the case, we must not hard-unmask it when
 		 * "returning" that interrupt to the host.
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index f1c0fa6ece21..517b963e3e6a 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -415,7 +415,7 @@ static void xive_native_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
 		return;
 	}
 
-	/* Grab it's CAM value */
+	/* Grab its CAM value */
 	rc = opal_xive_get_vp_info(vp, NULL, &vp_cam_be, NULL, NULL);
 	if (rc) {
 		pr_err("Failed to get pool VP info CPU %d\n", cpu);
-- 
2.34.1

