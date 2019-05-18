Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C822405
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 18:07:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455qmr0Z6XzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 02:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=git.icu
 (client-ip=163.172.180.134; helo=git.icu; envelope-from=shawn@git.icu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=git.icu
Received: from git.icu (git.icu [163.172.180.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455qk020cwzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 02:04:56 +1000 (AEST)
Received: from localhost.localdomain (minicloud.parqtec.unicamp.br
 [143.106.167.126]) by git.icu (Postfix) with ESMTPSA id 7925C2209A3;
 Sat, 18 May 2019 16:04:51 +0000 (UTC)
From: Shawn Landden <shawn@git.icu>
To: 
Subject: [RESEND v4 PATCH 2/2] [PowerPC] Allow use of SIMD in interrupts from
 kernel code
Date: Sat, 18 May 2019 13:04:41 -0300
Message-Id: <20190518160441.25008-2-shawn@git.icu>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a
In-Reply-To: <20190518160441.25008-1-shawn@git.icu>
References: <20190515013725.2198-1-shawn@git.icu>
 <20190518160441.25008-1-shawn@git.icu>
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
Cc: Paul Mackerras <paulus@samba.org>, Shawn Landden <shawn@git.icu>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This even allows simd in preemptible kernel code,
as does x86, although this is rarely safe (could be used with
kthread_create_on_cpu). All callers are disabling preemption.

v4: fix build without CONFIG_AVX
    change commit message
Signed-off-by: Shawn Landden <shawn@git.icu>
---
 arch/powerpc/include/asm/switch_to.h |  15 +---
 arch/powerpc/kernel/process.c        | 117 +++++++++++++++++++--------
 2 files changed, 88 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 5b03d8a82..c79f7d24a 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -30,10 +30,7 @@ extern void enable_kernel_fp(void);
 extern void flush_fp_to_thread(struct task_struct *);
 extern void giveup_fpu(struct task_struct *);
 extern void save_fpu(struct task_struct *);
-static inline void disable_kernel_fp(void)
-{
-	msr_check_and_clear(MSR_FP);
-}
+extern void disable_kernel_fp(void);
 #else
 static inline void save_fpu(struct task_struct *t) { }
 static inline void flush_fp_to_thread(struct task_struct *t) { }
@@ -44,10 +41,7 @@ extern void enable_kernel_altivec(void);
 extern void flush_altivec_to_thread(struct task_struct *);
 extern void giveup_altivec(struct task_struct *);
 extern void save_altivec(struct task_struct *);
-static inline void disable_kernel_altivec(void)
-{
-	msr_check_and_clear(MSR_VEC);
-}
+extern void disable_kernel_altivec(void);
 #else
 static inline void save_altivec(struct task_struct *t) { }
 static inline void __giveup_altivec(struct task_struct *t) { }
@@ -56,10 +50,7 @@ static inline void __giveup_altivec(struct task_struct *t) { }
 #ifdef CONFIG_VSX
 extern void enable_kernel_vsx(void);
 extern void flush_vsx_to_thread(struct task_struct *);
-static inline void disable_kernel_vsx(void)
-{
-	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
-}
+extern void disable_kernel_vsx(void);
 #endif
 
 #ifdef CONFIG_SPE
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index ef534831f..0136fd132 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -170,6 +170,29 @@ void __msr_check_and_clear(unsigned long bits)
 EXPORT_SYMBOL(__msr_check_and_clear);
 
 #ifdef CONFIG_PPC_FPU
+/*
+ * Track whether the kernel is using the FPU state
+ * currently.
+ *
+ * This flag is used:
+ *
+ *   - by IRQ context code to potentially use the FPU
+ *     if it's unused.
+ *
+ *   - to debug kernel_fpu/altivec/vsx_begin()/end() correctness
+ */
+static DEFINE_PER_CPU(bool, in_kernel_fpu);
+
+static bool kernel_fpu_disabled(void)
+{
+	return this_cpu_read(in_kernel_fpu);
+}
+
+static bool interrupted_kernel_fpu_idle(void)
+{
+	return !kernel_fpu_disabled();
+}
+
 static void __giveup_fpu(struct task_struct *tsk)
 {
 	unsigned long msr;
@@ -230,7 +253,8 @@ void enable_kernel_fp(void)
 {
 	unsigned long cpumsr;
 
-	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_FP);
 
@@ -251,6 +275,15 @@ void enable_kernel_fp(void)
 }
 EXPORT_SYMBOL(enable_kernel_fp);
 
+void disable_kernel_fp(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, false);
+
+	msr_check_and_clear(MSR_FP);
+}
+EXPORT_SYMBOL(disable_kernel_fp);
+
 static int restore_fp(struct task_struct *tsk)
 {
 	if (tsk->thread.load_fp || tm_active_with_fp(tsk)) {
@@ -260,6 +293,37 @@ static int restore_fp(struct task_struct *tsk)
 	}
 	return 0;
 }
+
+/*
+ * Were we in user mode when we were
+ * interrupted?
+ *
+ * Doing kernel_altivec/vsx_begin/end() is ok if we are running
+ * in an interrupt context from user mode - we'll just
+ * save the FPU state as required.
+ */
+static bool interrupted_user_mode(void)
+{
+        struct pt_regs *regs = get_irq_regs();
+
+        return regs && user_mode(regs);
+}
+
+/*
+ * Can we use FPU in kernel mode with the
+ * whole "kernel_fpu/altivec/vsx_begin/end()" sequence?
+ *
+ * It's always ok in process context (ie "not interrupt")
+ * but it is sometimes ok even from an irq.
+ */
+bool may_use_simd(void)
+{
+        return !in_interrupt() ||
+                interrupted_user_mode() ||
+                interrupted_kernel_fpu_idle();
+}
+EXPORT_SYMBOL(may_use_simd);
+
 #else
 static int restore_fp(struct task_struct *tsk) { return 0; }
 #endif /* CONFIG_PPC_FPU */
@@ -295,7 +359,8 @@ void enable_kernel_altivec(void)
 {
 	unsigned long cpumsr;
 
-	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_VEC);
 
@@ -316,6 +381,14 @@ void enable_kernel_altivec(void)
 }
 EXPORT_SYMBOL(enable_kernel_altivec);
 
+extern void disable_kernel_altivec(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, false);
+	msr_check_and_clear(MSR_VEC);
+}
+EXPORT_SYMBOL(disable_kernel_altivec);
+
 /*
  * Make sure the VMX/Altivec register state in the
  * the thread_struct is up to date for task tsk.
@@ -346,35 +419,6 @@ static int restore_altivec(struct task_struct *tsk)
 	return 0;
 }
 
-/*
- * Were we in user mode when we were
- * interrupted?
- *
- * Doing kernel_altivec/vsx_begin/end() is ok if we are running
- * in an interrupt context from user mode - we'll just
- * save the FPU state as required.
- */
-static bool interrupted_user_mode(void)
-{
-	struct pt_regs *regs = get_irq_regs();
-
-	return regs && user_mode(regs);
-}
-
-/*
- * Can we use FPU in kernel mode with the
- * whole "kernel_fpu/altivec/vsx_begin/end()" sequence?
- *
- * It's always ok in process context (ie "not interrupt")
- * but it is sometimes ok even from an irq.
- */
-bool may_use_simd(void)
-{
-	return !in_interrupt() ||
-		interrupted_user_mode();
-}
-EXPORT_SYMBOL(may_use_simd);
-
 #else
 #define loadvec(thr) 0
 static inline int restore_altivec(struct task_struct *tsk) { return 0; }
@@ -411,7 +455,8 @@ void enable_kernel_vsx(void)
 {
 	unsigned long cpumsr;
 
-	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_FP|MSR_VEC|MSR_VSX);
 
@@ -433,6 +478,14 @@ void enable_kernel_vsx(void)
 }
 EXPORT_SYMBOL(enable_kernel_vsx);
 
+void disable_kernel_vsx(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+	this_cpu_write(in_kernel_fpu, false);
+	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
+}
+EXPORT_SYMBOL(disable_kernel_vsx);
+
 void flush_vsx_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
-- 
2.21.0.1020.gf2820cf01a

