Return-Path: <linuxppc-dev+bounces-2140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CF99B094
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCG2HQ7z3c2k;
	Sat, 12 Oct 2024 15:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705642;
	cv=none; b=Nq5Px3D5qVIQU0L4jPvudv0ooM7VOzjiK6H9ybGVhE7UHXpvcwNmwhhKvkxy77ToZqxtojybtIlOpv1xMgKWyi/OJyzqyTk0KZd8NBjRXfv3+DmzPXRZz7jOE9jFMkv7v19i9Uf28H13fEQ05KOkECVClDXZTosJhMDOWO/OMD3CYCKOZpa4r5j+iQq9Xp07lnhyRmvILoM84fIwgHNIine33Gk88mYtzvHGPHyXj4VSXUYiMWLfZpErvewpETfa2ZKoI0+pNhXrw9LhEbEHT/SopUOdq6ymCgIEnqD09oaj+HKiyvYfBOtByvvhG5mkBWH6Ys2reaY8uz/qxcc+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705642; c=relaxed/relaxed;
	bh=PygPSfrF6/ZPZycNWp0gfxNgipfwun+gFs3PUTgf3Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fc5Kw48r14OwsnsaUM+yNnx6XcprXDPYEpoLjhLrdZScNQir9BKZ1K4hrGXKMmDG8jfleAfuBS39Cuqi8koFr0kf8Abx+FDH450UBT4FFEtn3c/GgI8vOmbwRtIbzDnbKKNwGCU/XAD+V78+QjqKargJ3wrl+U/jTUJ6WgEF+xXRCUskQK1jM37I/BS49jxjQ4G8AxvJ3ZjEHLe2hwQydEqvXHmhLI5toMOX+bqQCzJTGZzcbMrAYKlNL4eMkRYw8pTpo3MGn5pfQ/IFJd/RevdDG1X4Ab6hJ87vcnLXTIxDX3eBHXtBOlsL1UmTRypQ4HGUnsIGByE6iqY9qzvLEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVCF0ptfz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:40 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705580tlyfyuz
X-QQ-Originating-IP: yVwmqMbLCoQX6+2lfjY3FDbo/wQXr232dPvID4ttcbQ=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7210153061131760617
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 3/7] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
Date: Sat, 12 Oct 2024 11:56:17 +0800
Message-ID: <7D68F1E553E8E06D+20241012035621.1245-5-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241012035621.1245-3-luming.yu@shingroup.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
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
X-QQ-XMAILINFO: MFdGPHhuqhNobOzPmY/+W4OuHqcSrgD/oOqbwsEa7/lTHvv9nqmqFVtL
	iHIbt4TvSplBzMH3hnqjHhX4vW5f6Wwh71E3c+a+YWhih76s0ktKLRJGl9IQco0PksZYdeR
	XRKB6Hq5uLdM0eN9I9eYyfVSnVlFqYiPTZws/ctVabroO6OaZaeD0J3AbEvFkFVZVTnfuDP
	8xLYr03y6JqeVXIy5TwHpWX/wctKmGPH/HOhaazNbDyTsSbSq9WDqNCr9rypKwTEe8m/9DY
	/BMDryeQnhCt5+kQ2T+Uzemb4Es6RDjbfvVsBHFE50Luzx4bZbXOBS5MTnDBlw9mlb2CMvH
	GXegcMrS70TMNA4jSaPa9q5eCu6E5ZjTGgHsoqc2Sf+IZnE9Yw4xQAgvls/rVklfeVDJpFs
	a3IodAsKUkFfLr9Qb+4t0+X3YxfrFCo5ip8JADNTF+h1u0cXTBfxeD4qX7af/oItDgvZDsz
	/Wx1kw/OUA4x2JGcFh2qjkTnYIn7ilN1WAlXLX2ZntbAWOtz+tzFcRFgFxSLyeQ4QVaz9Vu
	JqeziRRYS6VUdvE5bcNlsNp3qZu8VhahSTjLB3rhGZKci8/FZ43VWcDVtD6OG2ub8fi2qr4
	l0Hyz3gRL3KmG9X77Gvg+OsSu7ReyruiPVaTYx5LCWt0JKHpvKL3AFYMhTWjXHBPM26mco0
	yh3SGAyYh/bnuS655L10ZN317HM6lEREX6+144UHlOuoDVMJDv3QNum7JAcOMj7212UEF63
	CqJr1viDgbv2rCQUqJsmJdifxHywMZPyEKlxV2ShaSaCoyDY9OWfzjh0NYPUZsCtQT7guYM
	AQtNoWp1iUzurm5j+z0ljIH1IPiqoKiSuaM1FZhasmgTlTNvSKldAatWJo3NBnj4uuGhteY
	ox9GqUgUK8P5qVtlV74KoRJIHgLmw51p9aajbJXS/I6L68foovAvjB1L09VIO9IAYIWgJqm
	YHdZeeYskblZqdtvfccJ7TRIAhoBeFL+R3qmoCHld0m90fA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

enable the common entry of user return notifier for powerpc as
a debug feature.

Signed-off-by Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig                    |  1 +
 arch/powerpc/include/asm/entry-common.h | 16 ++++++++++++++++
 arch/powerpc/include/asm/thread_info.h  |  2 ++
 arch/powerpc/kernel/process.c           |  2 ++
 4 files changed, 21 insertions(+)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 261c9116d6fa..9a1e6669fa24 100644
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
index 9df2bcf28544..c52ca3aaebb5 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -118,6 +118,7 @@ void arch_setup_new_exec(void);
 #endif
 #define TIF_POLLING_NRFLAG	19	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT		20	/* 32 bit binary */
+#define TIF_USER_RETURN_NOTIFY	21	/* notify kernel of userspace return */
 
 /* as above, but as bit values */
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
@@ -126,6 +127,7 @@ void arch_setup_new_exec(void);
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


