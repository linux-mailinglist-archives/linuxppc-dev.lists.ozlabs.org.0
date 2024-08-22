Return-Path: <linuxppc-dev+bounces-366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00B95B98A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWy626mz2ymf;
	Fri, 23 Aug 2024 01:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339550;
	cv=none; b=maakic8J7wMDfgDwt4lVfYOUQCvHmyjM7qsoYo22NPE6rHhX8TVnzShUTGAaq1T7lAK+MliBKQloq0Q9brp84bG9TYbZ6F59RuA1ke9Uw7LHhOJw7dqvoNa6GaXHHGMpAZfkeQxNtlb1I3DnFybV3eTB1d2DljN7UmPy2wtl8idjIGc27dD64fPg9xHzSi5Ifdt/2HfzlrFvlCnlWc5c5tzcgNKiV/C05EZth2fIDGAXUuJqso2abtdDpZ/XUD8UNpR448U81dsTirK2MaaaUZxWCvFMwpOQHH7plaw6QNy30Yb6OzqWvocpxY3HANBOVJ5o8EByrMuyed5eTNyTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339550; c=relaxed/relaxed;
	bh=OpQ2k58t6nEQbtkgVhwz3rLdStOXjxbUhiBjdUnicRA=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=evXuhu2Nz89zUKb+u4Jleb7JPiZ96s0Ny3/wA9Y8B9O3ao/ZfCztO7z7ky9RM/mxxQxnwJE2PPJFYYd9Ebjdm23ogfervIFzoNoQVCSEwAZy3YPUKRE5dojxjpppfE9rf2ZFS+iO3PCF4J8CFcFZIRHsgybkR4rlwVr98hySxaf45TGZXX/Mbc+flT5ZT0Y1lXqqhCtRuMWekP5RB7B6jfKL771gcdcV5rtCpHnHjCbQsSAK2eI6uG1NszUcOFLwQwiJDynzecOJ3Wc1Iv3eSMG2Qzs9SzZcf8cNJcQhx5S8H37eZ7hSnoByoaItZxO11vdnuRZs+lQliDkOPqlLMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWy38JCz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4605B15BF;
	Thu, 22 Aug 2024 08:12:16 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 275E73F58B;
	Thu, 22 Aug 2024 08:11:46 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Date: Thu, 22 Aug 2024 16:10:49 +0100
Message-Id: <20240822151113.1479789-7-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

POR_EL0 is a register that can be modified by userspace directly,
so it must be context switched.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/cpufeature.h |  6 ++++++
 arch/arm64/include/asm/processor.h  |  1 +
 arch/arm64/include/asm/sysreg.h     |  3 +++
 arch/arm64/kernel/process.c         | 28 ++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git arch/arm64/include/asm/cpufeature.h arch/arm64/include/asm/cpufeature.h
index 558434267271..3d261cc123c1 100644
--- arch/arm64/include/asm/cpufeature.h
+++ arch/arm64/include/asm/cpufeature.h
@@ -832,6 +832,12 @@ static inline bool system_supports_lpa2(void)
 	return cpus_have_final_cap(ARM64_HAS_LPA2);
 }
 
+static inline bool system_supports_poe(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_POE) &&
+		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git arch/arm64/include/asm/processor.h arch/arm64/include/asm/processor.h
index f77371232d8c..e6376f979273 100644
--- arch/arm64/include/asm/processor.h
+++ arch/arm64/include/asm/processor.h
@@ -184,6 +184,7 @@ struct thread_struct {
 	u64			sctlr_user;
 	u64			svcr;
 	u64			tpidr2_el0;
+	u64			por_el0;
 };
 
 static inline unsigned int thread_get_vl(struct thread_struct *thread,
diff --git arch/arm64/include/asm/sysreg.h arch/arm64/include/asm/sysreg.h
index 4a9ea103817e..494e9efd856f 100644
--- arch/arm64/include/asm/sysreg.h
+++ arch/arm64/include/asm/sysreg.h
@@ -1077,6 +1077,9 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+/* Initial value for Permission Overlay Extension for EL0 */
+#define POR_EL0_INIT	POE_RXW
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */
diff --git arch/arm64/kernel/process.c arch/arm64/kernel/process.c
index 4ae31b7af6c3..a3a61ecdb165 100644
--- arch/arm64/kernel/process.c
+++ arch/arm64/kernel/process.c
@@ -271,12 +271,23 @@ static void flush_tagged_addr_state(void)
 		clear_thread_flag(TIF_TAGGED_ADDR);
 }
 
+static void flush_poe(void)
+{
+	if (!system_supports_poe())
+		return;
+
+	write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
+	/* ISB required for kernel uaccess routines when changing POR_EL0 */
+	isb();
+}
+
 void flush_thread(void)
 {
 	fpsimd_flush_thread();
 	tls_thread_flush();
 	flush_ptrace_hw_breakpoint(current);
 	flush_tagged_addr_state();
+	flush_poe();
 }
 
 void arch_release_task_struct(struct task_struct *tsk)
@@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (system_supports_tpidr2())
 			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
 
+		if (system_supports_poe())
+			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
+
 		if (stack_start) {
 			if (is_compat_thread(task_thread_info(p)))
 				childregs->compat_sp = stack_start;
@@ -495,6 +509,19 @@ static void erratum_1418040_new_exec(void)
 	preempt_enable();
 }
 
+static void permission_overlay_switch(struct task_struct *next)
+{
+	if (!system_supports_poe())
+		return;
+
+	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
+	if (current->thread.por_el0 != next->thread.por_el0) {
+		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
+		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
+		isb();
+	}
+}
+
 /*
  * __switch_to() checks current->thread.sctlr_user as an optimisation. Therefore
  * this function must be called with preemption disabled and the update to
@@ -530,6 +557,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	ssbs_thread_switch(next);
 	erratum_1418040_thread_switch(next);
 	ptrauth_thread_switch_user(next);
+	permission_overlay_switch(next);
 
 	/*
 	 * Complete any pending TLB or cache maintenance on this CPU in case
-- 
2.25.1


