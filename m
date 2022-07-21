Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6236A57D4B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 22:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpkNc1bpzz3c79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 06:16:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=luna.fluff.org (client-ip=86.15.83.122; helo=luna; envelope-from=ben@luna.fluff.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1228 seconds by postgrey-1.36 at boromir; Fri, 22 Jul 2022 06:15:52 AEST
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net [86.15.83.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpkN86nZBz3c6g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 06:15:51 +1000 (AEST)
Received: from ben by luna with local (Exim 4.96)
	(envelope-from <ben@luna.fluff.org>)
	id 1oEcGM-001knS-0y;
	Thu, 21 Jul 2022 20:55:10 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] profile: setup_profiling_timer() is moslty not implemented
Date: Thu, 21 Jul 2022 20:55:09 +0100
Message-Id: <20220721195509.418205-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org, openrisc@lists.librecores.org, Ben Dooks <ben-linux@fluff.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The setup_profiling_timer() is mostly un-implemented by many
architectures. In many places it isn't guarded by CONFIG_PROFILE
which is needed for it to be used. Make it a weak symbol in
kernel/profile.c and remove the 'return -EINVAL' implementations
from the kenrel.

There are a couple of architectures which do return 0 from
the setup_profiling_timer() function but they don't seem to
do anything else with it. To keep the /proc compatibility for
now, leave these for a future update or removal.

On ARM, this fixes the following sparse warning:
arch/arm/kernel/smp.c:793:5: warning: symbol 'setup_profiling_timer' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/alpha/kernel/smp.c     | 6 ------
 arch/arc/kernel/smp.c       | 8 --------
 arch/arm/kernel/smp.c       | 8 --------
 arch/arm64/kernel/smp.c     | 8 --------
 arch/csky/kernel/smp.c      | 5 -----
 arch/hexagon/kernel/smp.c   | 5 -----
 arch/ia64/kernel/smp.c      | 6 ------
 arch/openrisc/kernel/smp.c  | 6 ------
 arch/parisc/kernel/smp.c    | 7 -------
 arch/powerpc/kernel/smp.c   | 7 -------
 arch/riscv/kernel/smp.c     | 6 ------
 arch/sparc/kernel/smp_32.c  | 5 -----
 arch/sparc/kernel/smp_64.c  | 6 ------
 arch/x86/include/asm/apic.h | 2 --
 arch/x86/kernel/apic/apic.c | 5 -----
 kernel/profile.c            | 8 ++++++--
 16 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index cb64e4797d2a..f4e20f75438f 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -497,12 +497,6 @@ smp_cpus_done(unsigned int max_cpus)
 	       ((bogosum + 2500) / (5000/HZ)) % 100);
 }
 
-int
-setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 static void
 send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 {
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index d947473f1e6d..ab9e75e90f72 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -232,14 +232,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	return 0;
 }
 
-/*
- * not supported here
- */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 /*****************************************************************************/
 /*              Inter Processor Interrupt Handling                           */
 /*****************************************************************************/
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 73fc645fc4c7..978db2d96b44 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -787,14 +787,6 @@ void panic_smp_self_stop(void)
 		cpu_relax();
 }
 
-/*
- * not supported here
- */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 #ifdef CONFIG_CPU_FREQ
 
 static DEFINE_PER_CPU(unsigned long, l_p_j_ref);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 62ed361a4376..ffc5d76cf695 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1078,14 +1078,6 @@ bool smp_crash_stop_failed(void)
 }
 #endif
 
-/*
- * not supported here
- */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 6bb38bc2f39b..4b605aa2e1d6 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -243,11 +243,6 @@ void __init smp_cpus_done(unsigned int max_cpus)
 {
 }
 
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 void csky_start_secondary(void)
 {
 	struct mm_struct *mm = &init_mm;
diff --git a/arch/hexagon/kernel/smp.c b/arch/hexagon/kernel/smp.c
index 619c56420aa0..4ba93e59370c 100644
--- a/arch/hexagon/kernel/smp.c
+++ b/arch/hexagon/kernel/smp.c
@@ -240,11 +240,6 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 	send_ipi(mask, IPI_CALL_FUNC);
 }
 
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 void smp_start_cpus(void)
 {
 	int i;
diff --git a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
index 7b7b64eb3129..e2cc59db86bc 100644
--- a/arch/ia64/kernel/smp.c
+++ b/arch/ia64/kernel/smp.c
@@ -333,9 +333,3 @@ smp_send_stop (void)
 {
 	send_IPI_allbutself(IPI_CPU_STOP);
 }
-
-int
-setup_profiling_timer (unsigned int multiplier)
-{
-	return -EINVAL;
-}
diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index 27041db2c8b0..e1419095a6f0 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -197,12 +197,6 @@ void smp_send_stop(void)
 	smp_call_function(stop_this_cpu, NULL, 0);
 }
 
-/* not supported, yet */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 void __init set_smp_cross_call(void (*fn)(const struct cpumask *, unsigned int))
 {
 	smp_cross_call = fn;
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 24d0744c3b3a..7dbd92cafae3 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -513,10 +513,3 @@ void __cpu_die(unsigned int cpu)
 
 	pdc_cpu_rendezvous_unlock();
 }
-
-#ifdef CONFIG_PROC_FS
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-#endif
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index bcefab484ea6..c037c26540dd 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1674,13 +1674,6 @@ void start_secondary(void *unused)
 	BUG();
 }
 
-#ifdef CONFIG_PROFILING
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return 0;
-}
-#endif
-
 static void __init fixup_topology(void)
 {
 	int i;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b5d30ea92292..441d0ceb80ad 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -64,12 +64,6 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 	return phys_id == cpuid_to_hartid_map(cpu);
 }
 
-/* Unsupported */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 static void ipi_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
index 22b148e5a5f8..ad8094d955eb 100644
--- a/arch/sparc/kernel/smp_32.c
+++ b/arch/sparc/kernel/smp_32.c
@@ -174,11 +174,6 @@ void smp_call_function_interrupt(void)
 	irq_exit();
 }
 
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int i, cpuid, extra;
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index a1f78e9ddaf3..a55295d1b924 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1186,12 +1186,6 @@ void __irq_entry smp_penguin_jailcell(int irq, struct pt_regs *regs)
 	preempt_enable();
 }
 
-/* /proc/profile writes can call this, don't __init it please. */
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 }
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index bd8ae0a7010a..3415321c8240 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -98,8 +98,6 @@ static inline bool apic_from_smp_config(void)
 #include <asm/paravirt.h>
 #endif
 
-extern int setup_profiling_timer(unsigned int);
-
 static inline void native_apic_mem_write(u32 reg, u32 v)
 {
 	volatile u32 *addr = (volatile u32 *)(APIC_BASE + reg);
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 189d3a5e471a..df764ceac2c8 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1115,11 +1115,6 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_apic_timer_interrupt)
 	set_irq_regs(old_regs);
 }
 
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return -EINVAL;
-}
-
 /*
  * Local APIC start and shutdown
  */
diff --git a/kernel/profile.c b/kernel/profile.c
index 37640a0bd8a3..244aa255c488 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -418,6 +418,12 @@ read_profile(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	return read;
 }
 
+/* default is to not implement this call */
+int __weak setup_profiling_timer(unsigned mult)
+{
+	return -EINVAL;
+}
+
 /*
  * Writing to /proc/profile resets the counters
  *
@@ -428,8 +434,6 @@ static ssize_t write_profile(struct file *file, const char __user *buf,
 			     size_t count, loff_t *ppos)
 {
 #ifdef CONFIG_SMP
-	extern int setup_profiling_timer(unsigned int multiplier);
-
 	if (count == sizeof(int)) {
 		unsigned int multiplier;
 
-- 
2.35.1

