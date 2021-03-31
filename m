Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F134F587
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F96s23jdmz3cFS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:39:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XOFiVmJW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XOFiVmJW; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F96rD2MbWz2xxh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:38:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F96rC6mjCz9sWQ; Wed, 31 Mar 2021 11:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617151131;
 bh=OH7gob9rAXaTSBgBG7GaGrUGCm+LY31sbCKliSDQ4yQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XOFiVmJWSVknBiGCt5GsDkpHFRCpmYxx0JTevMqBtdOLefgPFzpcTdgQQb/p8m29X
 0p8S7xC65SpaA5fESEtKqSU3B1y6fGTyjBLLIY3P0qzFaJXDGogNnkRNR1ueOsVoR7
 spYr4TK50/lSwsWDy7IJvQOu3OtugfYJjy8o1pPOnA3nROppWVdmvAoXdlS8DDuuMr
 hbOiG/WXojeYUKBrgar6odlovdAUjFVObVzL4gRTZXemfb4Se7icHgSituh7R9GT55
 dl9ngWfos59UASRC5CdjdWhGfIv61nZzQ0If3iKLSV4cBAXyoOzJKoJePk9Mg0TaEp
 4NwjBgohsrm4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
Date: Wed, 31 Mar 2021 11:38:44 +1100
Message-Id: <20210331003845.216246-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331003845.216246-1-mpe@ellerman.id.au>
References: <20210331003845.216246-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we enabled STRICT_KERNEL_RWX we received some reports of boot
failures when using the Hash MMU and running under phyp. The crashes
are intermittent, and often exhibit as a completely unresponsive
system, or possibly an oops.

One example, which was caught in xmon:

  [   14.068327][    T1] devtmpfs: mounted
  [   14.069302][    T1] Freeing unused kernel memory: 5568K
  [   14.142060][  T347] BUG: Unable to handle kernel instruction fetch
  [   14.142063][    T1] Run /sbin/init as init process
  [   14.142074][  T347] Faulting instruction address: 0xc000000000004400
  cpu 0x2: Vector: 400 (Instruction Access) at [c00000000c7475e0]
      pc: c000000000004400: exc_virt_0x4400_instruction_access+0x0/0x80
      lr: c0000000001862d4: update_rq_clock+0x44/0x110
      sp: c00000000c747880
     msr: 8000000040001031
    current = 0xc00000000c60d380
    paca    = 0xc00000001ec9de80   irqmask: 0x03   irq_happened: 0x01
      pid   = 347, comm = kworker/2:1
  ...
  enter ? for help
  [c00000000c747880] c0000000001862d4 update_rq_clock+0x44/0x110 (unreliable)
  [c00000000c7478f0] c000000000198794 update_blocked_averages+0xb4/0x6d0
  [c00000000c7479f0] c000000000198e40 update_nohz_stats+0x90/0xd0
  [c00000000c747a20] c0000000001a13b4 _nohz_idle_balance+0x164/0x390
  [c00000000c747b10] c0000000001a1af8 newidle_balance+0x478/0x610
  [c00000000c747be0] c0000000001a1d48 pick_next_task_fair+0x58/0x480
  [c00000000c747c40] c000000000eaab5c __schedule+0x12c/0x950
  [c00000000c747cd0] c000000000eab3e8 schedule+0x68/0x120
  [c00000000c747d00] c00000000016b730 worker_thread+0x130/0x640
  [c00000000c747da0] c000000000174d50 kthread+0x1a0/0x1b0
  [c00000000c747e10] c00000000000e0f0 ret_from_kernel_thread+0x5c/0x6c

This shows that CPU 2, which was idle, woke up and then appears to
randomly take an instruction fault on a completely valid area of
kernel text.

The cause turns out to be the call to hash__mark_rodata_ro(), late in
boot. Due to the way we layout text and rodata, that function actually
changes the permissions for all of text and rodata to read-only plus
execute.

To do the permission change we use a hypervisor call, H_PROTECT. On
phyp that appears to be implemented by briefly removing the mapping of
the kernel text, before putting it back with the updated permissions.
If any other CPU is executing during that window, it will see spurious
faults on the kernel text and/or data, leading to crashes.

To fix it we use stop machine to collect all other CPUs, and then have
them drop into real mode (MMU off), while we change the mapping. That
way they are unaffected by the mapping temporarily disappearing.

We don't see this bug on KVM because KVM always use VPM=1, where
faults are directed to the hypervisor, and the fault will be
serialised vs the h_protect() by HPTE_V_HVLOCK.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c | 105 +++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

v2: Add mention of why we don't see the issue on KVM.
    Use hard_irq_disable() not __hard_EE_RI_disable() as noticed by Nick.

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 3663d3cdffac..ad5eff097d31 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/mm_types.h>
 #include <linux/mm.h>
+#include <linux/stop_machine.h>
 
 #include <asm/sections.h>
 #include <asm/mmu.h>
@@ -400,6 +401,19 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
+struct change_memory_parms {
+	unsigned long start, end, newpp;
+	unsigned int step, nr_cpus, master_cpu;
+	atomic_t cpu_counter;
+};
+
+// We'd rather this was on the stack but it has to be in the RMO
+static struct change_memory_parms chmem_parms;
+
+// And therefore we need a lock to protect it from concurrent use
+static DEFINE_MUTEX(chmem_lock);
+
 static void change_memory_range(unsigned long start, unsigned long end,
 				unsigned int step, unsigned long newpp)
 {
@@ -414,6 +428,73 @@ static void change_memory_range(unsigned long start, unsigned long end,
 							mmu_kernel_ssize);
 }
 
+static int notrace chmem_secondary_loop(struct change_memory_parms *parms)
+{
+	unsigned long msr, tmp, flags;
+	int *p;
+
+	p = &parms->cpu_counter.counter;
+
+	local_irq_save(flags);
+	hard_irq_disable();
+
+	asm volatile (
+	// Switch to real mode and leave interrupts off
+	"mfmsr	%[msr]			;"
+	"li	%[tmp], %[MSR_IR_DR]	;"
+	"andc	%[tmp], %[msr], %[tmp]	;"
+	"mtmsrd %[tmp]			;"
+
+	// Tell the master we are in real mode
+	"1:				"
+	"lwarx	%[tmp], 0, %[p]		;"
+	"addic	%[tmp], %[tmp], -1	;"
+	"stwcx.	%[tmp], 0, %[p]		;"
+	"bne-	1b			;"
+
+	// Spin until the counter goes to zero
+	"2:				;"
+	"lwz	%[tmp], 0(%[p])		;"
+	"cmpwi	%[tmp], 0		;"
+	"bne-	2b			;"
+
+	// Switch back to virtual mode
+	"mtmsrd %[msr]			;"
+
+	: // outputs
+	  [msr] "=&r" (msr), [tmp] "=&b" (tmp), "+m" (*p)
+	: // inputs
+	  [p] "b" (p), [MSR_IR_DR] "i" (MSR_IR | MSR_DR)
+	: // clobbers
+	  "cc", "xer"
+	);
+
+	local_irq_restore(flags);
+
+	return 0;
+}
+
+static int change_memory_range_fn(void *data)
+{
+	struct change_memory_parms *parms = data;
+
+	if (parms->master_cpu != smp_processor_id())
+		return chmem_secondary_loop(parms);
+
+	// Wait for all but one CPU (this one) to call-in
+	while (atomic_read(&parms->cpu_counter) > 1)
+		barrier();
+
+	change_memory_range(parms->start, parms->end, parms->step, parms->newpp);
+
+	mb();
+
+	// Signal the other CPUs that we're done
+	atomic_dec(&parms->cpu_counter);
+
+	return 0;
+}
+
 static bool hash__change_memory_range(unsigned long start, unsigned long end,
 				      unsigned long newpp)
 {
@@ -428,7 +509,29 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 	if (start >= end)
 		return false;
 
-	change_memory_range(start, end, step, newpp);
+	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		mutex_lock(&chmem_lock);
+
+		chmem_parms.start = start;
+		chmem_parms.end = end;
+		chmem_parms.step = step;
+		chmem_parms.newpp = newpp;
+		chmem_parms.master_cpu = smp_processor_id();
+
+		cpus_read_lock();
+
+		atomic_set(&chmem_parms.cpu_counter, num_online_cpus());
+
+		// Ensure state is consistent before we call the other CPUs
+		mb();
+
+		stop_machine_cpuslocked(change_memory_range_fn, &chmem_parms,
+					cpu_online_mask);
+
+		cpus_read_unlock();
+		mutex_unlock(&chmem_lock);
+	} else
+		change_memory_range(start, end, step, newpp);
 
 	return true;
 }
-- 
2.25.1

