Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D294681654D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 04:20:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StlT749g6z3c2G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 14:20:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StlSh2MgWz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 14:20:19 +1100 (AEDT)
X-QQ-mid: bizesmtp67t1702869194tia5c1x9
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Dec 2023 11:13:10 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: CbHyMb8VrI0YrUNQgdv8Fc3WpubobuDr6zh6jswt2V4GvALaE86ztRNRl/OBQ
	DeMfd71HgSxRURWE7Q6u1XYIrbN9RtZKGmKw3ju1RT241YPw4vaUaYemOwzPY9XSuj6gHTc
	deNbw8RFi2AAV1aK8RJMRuAbDl53AmNZS9h7Y26fL64+/Vj8mP/f9Ah0BYm3CtmJ95EDuwK
	WM8OrPwATcSV8nhAeczWn7fTYW0KFXljmNTxIMv68Nf79XIBXZRnaPFceirh86MLJB9a/fX
	9T/2qvlG4rbSWpdmpnkh7kNYC+lRzodPsoY3sHsKJApQ9lpJpY4x0NaUqw4D0+giJa/IBHE
	+WNpD0/Z/Ho7sgw14r8Hi99OUP3CLPwpOLo/PggfDzGU8tUdu1E7u5fT8ftredu6M0N0A7E
	Ads/GtkisX0=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 16065116552740346806
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v1 1/2] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
Date: Mon, 18 Dec 2023 11:13:08 +0800
Message-ID: <1FD36D52828D2506+20231218031309.2063-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The support for user return notifier infrastructure
is manually hooked into powerpc architecture.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
v0->v1: add user return notifier arch hook manually.
---
 arch/powerpc/Kconfig                    |  1 +
 arch/powerpc/include/asm/entry-common.h | 16 ++++++++++++++++
 arch/powerpc/include/asm/thread_info.h  |  2 ++
 arch/powerpc/kernel/process.c           |  2 ++
 4 files changed, 21 insertions(+)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c10229c0243c..b968068cc04a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -277,6 +277,7 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select HOTPLUG_SMT			if HOTPLUG_CPU
diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
new file mode 100644
index 000000000000..51f1eb767696
--- /dev/null
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_POWERPC_ENTRY_COMMON_H
+#define ARCH_POWERPC_ENTRY_COMMON_H
+
+#include <linux/user-return-notifier.h>
+
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+	if (ti_work & _TIF_USER_RETURN_NOTIFY)
+		fire_user_return_notifiers();
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+
+#endif
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index bf5dde1a4114..47e226032f9c 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -117,6 +117,7 @@ void arch_setup_new_exec(void);
 #endif
 #define TIF_POLLING_NRFLAG	19	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT		20	/* 32 bit binary */
+#define TIF_USER_RETURN_NOTIFY	21	/* notify kernel of userspace return */
 
 /* as above, but as bit values */
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
@@ -125,6 +126,7 @@ void arch_setup_new_exec(void);
 #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
+#define _TIF_USER_RETURN_NOTIFY	(1<<TIF_USER_RETURN_NOTIFY)
 #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
 #define _TIF_PATCH_PENDING	(1<<TIF_PATCH_PENDING)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..70a9ea949798 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -38,6 +38,7 @@
 #include <linux/uaccess.h>
 #include <linux/pkeys.h>
 #include <linux/seq_buf.h>
+#include <linux/user-return-notifier.h>
 
 #include <asm/interrupt.h>
 #include <asm/io.h>
@@ -1386,6 +1387,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	if (current->thread.regs)
 		restore_math(current->thread.regs);
 #endif /* CONFIG_PPC_BOOK3S_64 */
+	propagate_user_return_notify(prev, new);
 
 	return last;
 }
-- 
2.42.0.windows.2

