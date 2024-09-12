Return-Path: <linuxppc-dev+bounces-1277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FD976468
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 10:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X49Wv5vJPz2yF4;
	Thu, 12 Sep 2024 18:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=15.184.82.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726129595;
	cv=none; b=g/JDe39VVlQi6KnLqf/OjaigGVHo56CwTYwYBkem1a4FSwMdHDsU5SMPLG4CAlTMqnbd38fDTQCqP+kSsDE/0zAFqpcUOI9Gf2EFa5aAFAlJoOO5nf0RuuL2xCEdO5JPgvfrkY3I4R0KBPQc23YHmZukVjaRMVp2KG8V60oxVdGgj1YfJ0n8AOBW6ZoPUJgxPKFeMoCkYe0sPbWqBPciMj2RQJ+rb9MjPNheYhXhRkUqaXZRv9ptbEAkWXGeOTTHIt6CJ46n2zc8967zDJpBlEyninuQ3Y0Aj3xPQJXCtg39lTEX4FnKXVC32aXIZ1IcG0UzgP0UrpUas0ymFibHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726129595; c=relaxed/relaxed;
	bh=aumF4UMtxddlJBsIu3pStopzeapSai3yCu5DyihQPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCcrvn78VNVtkFLEAqFQDQrLqiSgfShu41qL4Csr8v88Hob4W+kMzyeqxTMltVm2dwkX9g3dM4+rthkpO4M4pp/8tzbghr1pqPQtcYpaotK9bufaniFuWh6lGF3/wHVGkoo+quI0rBVMoOJqEYipYXV/L2sT9R1eGUTGYxWZgsucq0VdxhprR1bRux/z0C7aLSE5enWGv1zI6UagCwXTBcqC34rHV63GOVYddAaiZDCROsMZMifcIWMw4RbAvelQQRmI7oGxyBP1hZ0VEMpBQQA9PzN+6ZRu+555e/2fJQ7fF4yVcQn82ajkiW9Os0kGa1iCGq703SbzOcij1g2tBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=15.184.82.18; helo=smtpbg156.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X49Wt0v9Pz2y8t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 18:26:28 +1000 (AEST)
X-QQ-mid: bizesmtpsz3t1726129530tb5gy2u
X-QQ-Originating-IP: Xr0oQPFvbsRAicqeAiZPlplsFVjUVuZkr2XlG4+yueg=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 16:25:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4008263070620092588
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 1/2] powerpc/entry: convert to common and generic entry
Date: Thu, 12 Sep 2024 16:24:58 +0800
Message-ID: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
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
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

From: Yu Luming <luming.yu@gmail.com>

convert powerpc entry code in syscall and fault to use syscall_work
and irqentry_state as well as common calls from generic entry infrastructure.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/include/asm/hw_irq.h      | 5 +++++
 arch/powerpc/include/asm/processor.h   | 6 ++++++
 arch/powerpc/include/asm/syscall.h     | 5 +++++
 arch/powerpc/include/asm/thread_info.h | 1 +
 arch/powerpc/kernel/syscall.c          | 6 +++++-
 arch/powerpc/mm/fault.c                | 5 +++++
 7 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e21f72bcb61f..e94e7e4bfd40 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -202,6 +202,7 @@ config PPC
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
 	select GENERIC_PTDUMP
+        select GENERIC_ENTRY
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 317659fdeacf..a3d591784c95 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -216,6 +216,11 @@ static inline bool arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
+/*common entry*/
+static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
+{
+	return arch_irqs_disabled();
+}
 static inline void set_pmi_irq_pending(void)
 {
 	/*
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index b2c51d337e60..1292282f8b0e 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -383,6 +383,12 @@ int validate_sp(unsigned long sp, struct task_struct *p);
 int validate_sp_size(unsigned long sp, struct task_struct *p,
 		     unsigned long nbytes);
 
+/*for common entry*/
+static __always_inline bool on_thread_stack(void)
+{
+	return validate_sp(current_stack_pointer, current);
+}
+
 /*
  * Prefetch macros.
  */
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 3dd36c5e334a..0e94806c7bfe 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -119,4 +119,9 @@ static inline int syscall_get_arch(struct task_struct *task)
 	else
 		return AUDIT_ARCH_PPC64;
 }
+
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	return false;
+}
 #endif	/* _ASM_SYSCALL_H */
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 47e226032f9c..c52ca3aaebb5 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -58,6 +58,7 @@ struct thread_info {
 	unsigned int	cpu;
 #endif
 	unsigned long	local_flags;		/* private flags for thread */
+	unsigned long	syscall_work;
 #ifdef CONFIG_LIVEPATCH_64
 	unsigned long *livepatch_sp;
 #endif
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 77fedb190c93..cbf0510ed10e 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -3,6 +3,7 @@
 #include <linux/compat.h>
 #include <linux/context_tracking.h>
 #include <linux/randomize_kstack.h>
+#include <linux/entry-common.h>
 
 #include <asm/interrupt.h>
 #include <asm/kup.h>
@@ -131,7 +132,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		 * and the test against NR_syscalls will fail and the return
 		 * value to be used is in regs->gpr[3].
 		 */
-		r0 = do_syscall_trace_enter(regs);
+		syscall_enter_from_user_mode(regs, r0);
 		if (unlikely(r0 >= NR_syscalls))
 			return regs->gpr[3];
 
@@ -185,5 +186,8 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	 */
 	choose_random_kstack_offset(mftb());
 
+	/*common entry*/
+	syscall_exit_to_user_mode(regs);
+
 	return ret;
 }
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9e49ede2bc1c..64c6eb06ebe8 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -23,6 +23,7 @@
 #include <linux/mman.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
+#include <linux/entry-common.h>
 #include <linux/highmem.h>
 #include <linux/extable.h>
 #include <linux/kprobes.h>
@@ -569,15 +570,19 @@ NOKPROBE_SYMBOL(___do_page_fault);
 static __always_inline void __do_page_fault(struct pt_regs *regs)
 {
 	long err;
+	irqentry_state_t state = irqentry_enter(regs);
 
 	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
 	if (unlikely(err))
 		bad_page_fault(regs, err);
+	irqentry_exit(regs, state);
 }
 
 DEFINE_INTERRUPT_HANDLER(do_page_fault)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	__do_page_fault(regs);
+	irqentry_exit(regs, state);
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.42.0.windows.2


