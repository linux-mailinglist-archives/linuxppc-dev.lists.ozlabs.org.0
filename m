Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9ED1C066
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 03:46:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4530sk2QRxzDqJj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:46:50 +1000 (AEST)
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
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4530q1044vzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 11:44:27 +1000 (AEST)
Received: from localhost.localdomain (minicloud.parqtec.unicamp.br
 [143.106.167.126]) by git.icu (Postfix) with ESMTPSA id C073A2207C1;
 Tue, 14 May 2019 01:44:23 +0000 (UTC)
From: Shawn Landden <shawn@git.icu>
To: 
Subject: [PATCH 2/2] [PowerPC] Allow use of SIMD in interrupts from kernel code
Date: Mon, 13 May 2019 22:44:12 -0300
Message-Id: <20190514014412.25373-2-shawn@git.icu>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a
In-Reply-To: <20190514014412.25373-1-shawn@git.icu>
References: <20190513005104.20140-1-shawn@git.icu>
 <20190514014412.25373-1-shawn@git.icu>
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
Cc: Shawn Landden <shawn@git.icu>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This second patch is separate because it could be wrong,
like I am not sure about how kernel thread migration works,
and it is even allowing simd in preemptible kernel code.

Signed-off-by: Shawn Landden <shawn@git.icu>
---
 arch/powerpc/include/asm/simd.h      |  8 +++++
 arch/powerpc/include/asm/switch_to.h | 10 ++----
 arch/powerpc/kernel/process.c        | 50 ++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/simd.h b/arch/powerpc/include/asm/simd.h
index 2c02ad531..7b582b07e 100644
--- a/arch/powerpc/include/asm/simd.h
+++ b/arch/powerpc/include/asm/simd.h
@@ -7,7 +7,15 @@
  * It's always ok in process context (ie "not interrupt")
  * but it is sometimes ok even from an irq.
  */
+#ifdef CONFIG_ALTIVEC
+extern bool irq_simd_usable(void);
 static __must_check inline bool may_use_simd(void)
 {
 	return irq_simd_usable();
 }
+#else
+static inline bool may_use_simd(void)
+{
+	return false;
+}
+#endif
diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 5b03d8a82..537998997 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -44,10 +44,7 @@ extern void enable_kernel_altivec(void);
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
@@ -56,10 +53,7 @@ static inline void __giveup_altivec(struct task_struct *t) { }
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
index e436d708a..41a0ab500 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -267,6 +267,29 @@ static int restore_fp(struct task_struct *tsk) { return 0; }
 #ifdef CONFIG_ALTIVEC
 #define loadvec(thr) ((thr).load_vec)
 
+/*
+ * Track whether the kernel is using the SIMD state
+ * currently.
+ *
+ * This flag is used:
+ *
+ *   - by IRQ context code to potentially use the FPU
+ *     if it's unused.
+ *
+ *   - to debug kernel_altivec/vsx_begin()/end() correctness
+ */
+static DEFINE_PER_CPU(bool, in_kernel_simd);
+
+static bool kernel_simd_disabled(void)
+{
+	return this_cpu_read(in_kernel_simd);
+}
+
+static bool interrupted_kernel_simd_idle(void)
+{
+	return !kernel_simd_disabled();
+}
+
 static void __giveup_altivec(struct task_struct *tsk)
 {
 	unsigned long msr;
@@ -295,7 +318,9 @@ void enable_kernel_altivec(void)
 {
 	unsigned long cpumsr;
 
-	WARN_ON(preemptible());
+	WARN_ON_ONCE(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_simd));
+	this_cpu_write(in_kernel_simd, true);
 
 	cpumsr = msr_check_and_set(MSR_VEC);
 
@@ -316,6 +341,14 @@ void enable_kernel_altivec(void)
 }
 EXPORT_SYMBOL(enable_kernel_altivec);
 
+extern void disable_kernel_altivec(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_simd));
+	this_cpu_write(in_kernel_simd, false);
+	msr_check_and_clear(MSR_VEC);
+}
+EXPORT_SYMBOL(disable_kernel_altivec);
+
 /*
  * Make sure the VMX/Altivec register state in the
  * the thread_struct is up to date for task tsk.
@@ -371,7 +404,8 @@ static bool interrupted_user_mode(void)
 bool irq_simd_usable(void)
 {
 	return !in_interrupt() ||
-		interrupted_user_mode();
+		interrupted_user_mode() ||
+		interrupted_kernel_simd_idle();
 }
 EXPORT_SYMBOL(irq_simd_usable);
 
@@ -411,7 +445,9 @@ void enable_kernel_vsx(void)
 {
 	unsigned long cpumsr;
 
-	WARN_ON(preemptible());
+	WARN_ON_ONCE(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_simd));
+	this_cpu_write(in_kernel_simd, true);
 
 	cpumsr = msr_check_and_set(MSR_FP|MSR_VEC|MSR_VSX);
 
@@ -433,6 +469,14 @@ void enable_kernel_vsx(void)
 }
 EXPORT_SYMBOL(enable_kernel_vsx);
 
+void disable_kernel_vsx(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_simd));
+	this_cpu_write(in_kernel_simd, false);
+	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
+}
+EXPORT_SYMBOL(disable_kernel_vsx);
+
 void flush_vsx_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
-- 
2.21.0.1020.gf2820cf01a

