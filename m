Return-Path: <linuxppc-dev+bounces-3082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885F9C36F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmvxL70Mcz2xsW;
	Mon, 11 Nov 2024 14:22:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295350;
	cv=none; b=aL4Tha2n6AC3QRXIM6cv2EvhDoNJanIbVCcmn6PZTKMwZTMt+kZWbe0NKGXa2yKi/PB0HIYgENBHvt7B5sd9BBS2edPdZAIm06z/557izgwMevJniKhWSGt/CkxuEXKpzvRCW25yi1GaqC82qRww9eksLYFNwaHhIRu4sOlXwJD/voF52B8puPQLgWoSj+vWgBU/5qy+EuhJDKbc4CI7qZS3zX+2I0mtJQZZL6m09uk+INB2OBh5eVJmzxZOmmqsx6xP+IHuQpuSQ7IJse2a7i3VdJAJHq9fzYJugDlqOW80ADzxlUKy1g1EjMxJZugST8g5NlHcXgxOfDJYn2SJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295350; c=relaxed/relaxed;
	bh=eOa/0vmDlpGwE7os20FrPllQfh4CGlav2F8QSVAbR6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIz/eB/l8LU7wS63e5LwKbnzz3nry64qKPNYuAap8S6cxNMeay5wseBMLQJT+mJico1p/Xblv2yK84naB8HYTZuwsufRJk9tSHJYC8d8JHvsuIYWZvQ89bV9CdBCpGo25/YyYTJV51WSktKD1Hh2JFEcE7WSZqBMK02JCkYRCMiiejFMh6DiJX1nVF5dhiN96nE90mDfj+JUtuoYFXfXh8us9XSGOlP86eicqgZ8VVC1QtVK5g+B2MMgv7tdF0UWN1uh2FkgvhEqUC9CpZM4m5MiVn/2ylz4SV4mOUWH1pCDjPT1aMvBdkWTi18YUquNNR+6UDB8EOwxjf7/TsEz1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmvxK3BSQz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:22:27 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295266thwmuwl
X-QQ-Originating-IP: Q2y7X3cnjFZOhjfAcpkHrhgyw0X7/r3GqnDyvzLJO1M=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:21:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11046684575156124262
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 1/8] powerpc/entry: convert to common and generic entry
Date: Mon, 11 Nov 2024 11:19:26 +0800
Message-ID: <F0AE0A4571CE3126+20241111031934.1579-2-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NOnalZjVTVf0PdX+TiWwR5wGXQfDdiUaDSO3CqQsmaX3kcJPiR2QwaG8
	pVWp7gE3muz6RH37o3sE6VMEYGGAozv/mMzvT5Hcy+3uNUpVY2lHfGLVogPySlU4igZzOZr
	1g2clOaNceUnaUnk7A42baYn/o7x3GHv6vy0AbXPVyooHef5/AQRaKc/+ul4zh4izmWKwJY
	e8LQzDXFI3716Tsfo4G4zR+s/iQd13LGMpuqeEdGaC8WE3mLGt5Xg0ujs/4ObSqsPe2U0L6
	sV2gzWtcIXa8Br2Uy+OPtfYGLaZKwyE0oiBIv0ljQiPr+qGq/4jzGnT1JajeinUCjescykA
	/j1nhLRnfpk/I0Hm7R7U2g0gRPJr+m7kq2hhxuo2LTtznbKWX3PgK9aW2HO7WRxMhvMCpwi
	Xu6HG/Rnku2dDjsi4XHQNP/3Zj9hLrzV6wMhah0/xokhQ4qJ9Vw7lBR2ynr8DZhMiK/GpU8
	xmH1/bKUr2N+inwdNrPkBbE04rAESLy0DmZTefKWSX4gSZL/Es1ShS9K6i2PYqtIVULRldN
	9/VJWku1j8gk7tyHIjJcjGpamSqS61y9yV/eN/Cqsl4vdniyApqDi12hujcT9cssYI2xYQ6
	xedXqKiHcMc5i8rIOqIVR+AC4NqkWYylU8RtujEqnfftWtfC+HjYSGyxvW2rjZn+vg1G88+
	BN5LLrr+Z/tlqsOvaLRMXLA7eUGzhcpoq2NlohV9UqlEQFfI68rDWxq8ASi7Oe/yq+O8bQI
	VWQf2SPkRBXOpksTjUXaAY1/+FSfoVTTQHXdlt9D3UuUmypHfxEQQp9V/9q2RGy0XT90FSs
	Oj4UH2HWYjZ1Bmudsyu7hCsV3PUuhfzJlQZWrnU5aHs1eOPDcltjHZbl3DlMEQcFprjGHIc
	JVmvWpEvo+8enCAPqS5h1O9vFaGWUoZtFfZTKQbCbHiiNiVRsJOHD1ZhDFkBhO1h9k54Pkn
	g9JnAFUhtzqWkEZPbWi2AA6X6
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
v1->v2: fix ppc syscall entry seccomp_bpf test errors for common entry conversion.
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


