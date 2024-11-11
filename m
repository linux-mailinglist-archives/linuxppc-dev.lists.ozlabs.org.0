Return-Path: <linuxppc-dev+bounces-3084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8B9C36F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmvxP0LfXz2yMX;
	Mon, 11 Nov 2024 14:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295353;
	cv=none; b=kohAHdzAzHs1hylFt83p2oBu0gb8ziBR5xpZ+sLtKlMz7Y2XKhl2kVrNtKnO0Ifmp4s4wDcRNVD1d1JeP6k6NYrCU1AvU+HWEI775A+rUQ8LQqfuMyf6A1DuJrsLm5YULy6k9G7nxTBiM3K/JwkWMzxDXUSCY0GftvlvF0v8joFEsZBRLPp4Z9r0K1UgVdYKgET4ya6jd6O4cBmiYo1JrSF+QBWB9fLIMlbTvXKZy57bG8kE3nlZO1kZTCyIMM1To6laWUSBPIHjfu/Yd9qRtgvHrjD9knFM1/Xq8lYbGpmV2owhzUmkKRbJZqWG03fBoOysILn9pkt9KKikyOLxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295353; c=relaxed/relaxed;
	bh=PygPSfrF6/ZPZycNWp0gfxNgipfwun+gFs3PUTgf3Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0y2UabQFip9Pwb+XyQZXRFAtntRfhNpOkfKs6pV8kyWMgYqOY8nQIOehBstUTX3e56/UZNs13Gz8Kg6t2uDjcu98eovNkotkEKZgrEX2asFV+k+Idq8srUnvOCn8OiLmVIvHBmG/3xuyoTNBzyMAJNbHVjCO9SnNdUFuo+M0w2goiXf0iKxoQwuf1xt71igVJxapu4Go13EhL36NjXWvy8pjtC7hi594fBvXEobWsdJquHTIbBhwYLb1x6p0tKnE/2gbUhIUpQcKw2Ogdh9WPGnp8nGHuZeYwycfuy5AkoNAfebabPgq/75p0lEhHqwaCBkLGeo8opxocvXRG6Ytg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=54.254.200.92; helo=smtpbgsg1.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=54.254.200.92; helo=smtpbgsg1.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 75005 seconds by postgrey-1.37 at boromir; Mon, 11 Nov 2024 14:22:31 AEDT
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmvxM6YKQz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:22:31 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295305tmfjooy
X-QQ-Originating-IP: CGn9UdnFUXVCmJNZjsCPptGYVxeYEqMVov44SNNVocU=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:21:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12849565497526947182
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 3/8] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
Date: Mon, 11 Nov 2024 11:19:30 +0800
Message-ID: <027637B09D70E22F+20241111031934.1579-6-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241111031934.1579-2-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
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
X-QQ-XMAILINFO: M28vnsO5i7WeqXDjdTzu5d3NXlP+XBVE252YyNEGs/9wg3WlQPoai9H4
	7W2cDkcZXK6vwPpos1jzKgdWBGiUHgJgpGc5pk3U4yzqwtJbsznH0wNEEaDiw3r7UHtCNZ/
	Lg2h+DYIhNvQrnR6V+JHPc6nAn/3UsMiipCwIMmBQJMG7ZRHvyHL1ol5LsPphrQ3YnlPlLt
	RL7DZuKD2CD1tLGrJWQFYAeyOnBMlZ9qOxJh+x8JOl0cIHn0l1zhy0BRrH6VkA+gX1pgIcm
	8Jvo9TgWfZJu4G+r+WfTiBre8Hab+4FZEZUAfElsorLKa9+T1SDauGxkbkNaXMeBZMgo7wZ
	ejj9zaDG6Vy4pWQCu0YL0f2qibVBD5QdOpSCFbRxyFWFO1GWirTO3L1ZOiQuOL69zh2NzaB
	HJZ3NyiwQtuTbZcvU90svu91OrgJ24nTOdwsKozabRq/0TQ0jxNIUPyFjhVK4PB1+sj9tsp
	PfUkgkG010FGMTlgYOe+N4yRO6F1wBOJNcYS48byu8+tEuKLBP00OCL7HidcsPgjlmnlMtO
	90LlzFfNVio6IDhLWlnYRjjCV408mjkfLvckHyeA3fBM6GDGmNCDf04FqS2CPLhq+JjjB9I
	WzolEIlgLP7n5OrbWMcZqA2PA+YynleBE76HfDhc9DOc+SOx71DfwPfzX7sc23Fp9wbpWvW
	mg0QoqnNIplfW4I3yh2ZPISO1uKC5U26GMk1AOlykVXt7EeY0NoAuV8HlZoo16Bt0lxU3Bg
	Qi+1sYe9I/XEfYnXA1dGzaLmim+Ih51RzVDgtSo5RlABJQZ86pfvCYFUhzuBeOz+/qiuxDO
	OQyPH8MHm45McQjcIGOau0tD7OHr1jx0HeD6KbtesJ2kDQiZqgMuExLcIwpjIna0770eIXz
	WvfV3WoVO0faKNKcHPKlaiF38am9c80U48M0SuJvMRRAHKEVzBLbBjFTJKPikGH/lrKu/X9
	/824QA4PSW2+3Uw5M2Lx2cvFW3o/RmgdR2QE=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
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


