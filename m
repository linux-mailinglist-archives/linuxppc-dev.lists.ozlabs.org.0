Return-Path: <linuxppc-dev+bounces-2139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821CE99B092
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCG1Xc9z3c2h;
	Sat, 12 Oct 2024 15:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705642;
	cv=none; b=BwIeMZG6xdwp+42vVtEPIy2jc4CqlTQ9zv2KK3uohEYAuJen5gXp1AVWoGrtEhK7p5y3hnBpVPQshY4PdKoOvzcBPdmzvOgqAfucnRiCwmvmdn5EeE+65ieF2mijR2+2LoXyxVbV0KRR4Ur5WEJQp8aSeHsGYtT6xlA4s1cBi41U69xODnB5C6YS6CqngOco7RadcYhfJXJ9e09EUVfbORiBviZhOkAXLgFSlONbdkBsMVuctoqcoFZbggnvdTffv1uct3Yrstj+DyCH6t34z4eD1uh916DSWOd+xDIlUVQD3yYotsHmnVFo24kt9UFKloM6Ehbro9U8it4F7jfmng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705642; c=relaxed/relaxed;
	bh=LjwvbF5vepQE+i5OyYrXQos7cWxwTmlrw/gvzkWIJCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+BEZomfRFY4Z9LSHPeg0aKj47oQeiFpHueLgI68XxS2c1waqJnOIdvYl7sY8r2g84JAmoxOfuBIsrcvY8OKCZclYvLjrlqgtLbeMGQStvyveJP3m2Y4+G6phrI44w9ESk5LzI6UeIy98B6hKwdBdOFUmksDQwnzCVQcv20bGQ+iTWxZuyktOz0BJK1J9PknR+PVkS4igLHefL0RRycbnuE3cnWnwAFdV7uWa5mOPT4IDfaiztbn46oLhoHLqMEBl1bybOYricWMrG/ZXiaoqqOaMywH0AKRMYu+qoT6xv5K7JpJZhPPCb8o1Ih3qyS8fBdIspsrshAq151snVdYtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVCD61bjz3brD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:40 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705575tbh0my9
X-QQ-Originating-IP: evgYxnrRA2WGchSnnVqidAQmo6I3OZGYQ4vQkF864E0=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10512866763440344402
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 1/7] powerpc/entry: convert to common and generic entry
Date: Sat, 12 Oct 2024 11:56:15 +0800
Message-ID: <88E2581B1D024E9A+20241012035621.1245-3-luming.yu@shingroup.cn>
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
X-QQ-XMAILINFO: MWsoaJIuuiAXvfnlZfkjgL8PdfQANVHPgRbe2Comh3RuthrH9FeuKqTC
	mOxK/GrGBxrbh+nZS+KXrON8AK6aZvGZ0XAtmnz6Ses9l/nl8/FsXVnbap3O4eL56df9EST
	vmvl5LUCeO2UFbJHFdVzPrflzogks2hUtmwbtoMR7R4/YA3wVC4lHuMEH1ToGtG72wnwy3y
	cb+VJcbqQNgyUE9TH85TsYnYqriufWvQUx0dGNwjDCwjYnNIwEVBi8VJAgg4UZ2HQ5Ud4QT
	BOkLqQoB237pz/kXdkEYudDVZIfWPeOdRe1s6rErrISk4E5pxK2fmsn2dtamYaYPpqoTE7V
	hYXdkaOTsngrJ+T05im2HeN2ZxFGSzZLRWx6GmS5qEM3Ben3uxrlhYNRVID749Bh/dM0pZ5
	VgN/0ExQ5F9bzL77tusqWKjfcIBNcsn2xKNjbIGsQ72w9Ez357KkVPViUaSNBJnJ0K/xw24
	kboJtooMhoi+lXWBnRN8XNnrIbVbty1tBqY9f1HY1hzyO4idWvoCWdKmTy3AjwiIpfl3nRb
	TzwKxIjwU8YGjCvJ8wZnu+KrXaNV8FXOiqjWuPaF4oBSAiFy9ltNmfrxqZAy8CEsuoPQezs
	ehoIOeeu8r5VRn8iqEW1piJKC7ZojDJbuxEW4pRs1dI4rDj4MXLcBIUKMs1RfHait+aY1aM
	L2vcV5FwwEL955J0w3Fx5cpkCYr8K7TpU8xpK95ADs4wWIWDM95lYKAJm0FBM7w6Q04cLOi
	79o0kgS8zM2leZzazZtl533Coe4mWy88LC0+vhlW8qWtqHVvJy0xSucZZQjns57IkpdAFAI
	ARNTnrjlnTRLCpFY+QcjP9f9lBjONEjTfsrVL7CA5sFx85r7ZwByvvO03wQoze0QMJVBHSf
	jvlNgUOG0nqORoeITiOBU7O2hWvfQck8l9fNVrR+vhHlz3HKqYEzSjt08sYI/QFnkTSoKoL
	Eh+cREpOrfHP7Qw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

convert powerpc entry code in syscall and fault to use syscall_work
and irqentry_state as well as common calls implemented in generic
entry infrastructure.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/include/asm/hw_irq.h      | 5 +++++
 arch/powerpc/include/asm/processor.h   | 6 ++++++
 arch/powerpc/include/asm/syscall.h     | 5 +++++
 arch/powerpc/include/asm/thread_info.h | 1 +
 arch/powerpc/kernel/syscall.c          | 5 ++++-
 arch/powerpc/mm/fault.c                | 3 +++
 7 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..261c9116d6fa 100644
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
index bf5dde1a4114..9df2bcf28544 100644
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
index 77fedb190c93..e0338bd8d383 100644
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
+		r0 = syscall_enter_from_user_mode(regs, r0);
 		if (unlikely(r0 >= NR_syscalls))
 			return regs->gpr[3];
 
@@ -184,6 +185,8 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
 	 */
 	choose_random_kstack_offset(mftb());
+	/*common entry*/
+	syscall_exit_to_user_mode(regs);
 
 	return ret;
 }
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9e49ede2bc1c..6cb923fe4c4d 100644
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
@@ -577,7 +578,9 @@ static __always_inline void __do_page_fault(struct pt_regs *regs)
 
 DEFINE_INTERRUPT_HANDLER(do_page_fault)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	__do_page_fault(regs);
+	irqentry_exit(regs, state);
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.42.0.windows.2


