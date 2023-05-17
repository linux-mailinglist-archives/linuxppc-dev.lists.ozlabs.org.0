Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19B7069AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLv1J1nZSz3fKL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:23:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZhlxehR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZhlxehR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtp84nLlz3f7P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:13:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C39F63EF0;
	Wed, 17 May 2023 13:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0DAC433D2;
	Wed, 17 May 2023 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329198;
	bh=tA8vDceOtwnaYEmuvRonEkfnHU5EgkwYZJxxRjDBrtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZhlxehR2rDeiAnVDqzTiOa3ksnRODBJzi001SQy9km83BCh+sSslpUVguoSeN8Il
	 uwXHjW+IYnLrcNsvGw9/vc5PlLdSb4Gcq8SNGb+9U7jqrv+4zSwUd9/9bPNimcMQok
	 LPjRXrVXwWwUwdDMoTBXVMqAwdmMv0pYUVWZ/lWbR3Sum2O620By8zNUB4CsRzRnGT
	 B8+bZt42Vt5lZ795+/xA9/1lKx/j2eJjWnya+dwVW+/eXJBG2ACQBiEl2QIn7S24uR
	 aIHSN8P8r0X9oWG4waSTw5ry47uHOhsMogxlxAjjiT3E57B6sfhCFfCGfKcQYgqDcQ
	 jSutqMkSXP8Ng==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 13/14] thread_info: move function declarations to linux/thread_info.h
Date: Wed, 17 May 2023 15:11:01 +0200
Message-Id: <20230517131102.934196-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

There are a few __weak functions in kernel/fork.c, which architectures
can override. If there is no prototype, the compiler warns about them:

kernel/fork.c:164:13: error: no previous prototype for 'arch_release_task_struct' [-Werror=missing-prototypes]
kernel/fork.c:991:20: error: no previous prototype for 'arch_task_cache_init' [-Werror=missing-prototypes]
kernel/fork.c:1086:12: error: no previous prototype for 'arch_dup_task_struct' [-Werror=missing-prototypes]

There are already prototypes in a number of architecture specific headers
that have addressed those warnings before, but it's much better to have
these in a single place so the warning no longer shows up anywhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/thread_info.h | 4 ----
 arch/s390/include/asm/thread_info.h  | 3 ---
 arch/sh/include/asm/thread_info.h    | 3 ---
 arch/x86/include/asm/thread_info.h   | 3 ---
 include/linux/thread_info.h          | 5 +++++
 5 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 848739c15de8..553d1bc559c6 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -55,10 +55,6 @@ struct thread_info {
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec     arch_setup_new_exec
 
-void arch_release_task_struct(struct task_struct *tsk);
-int arch_dup_task_struct(struct task_struct *dst,
-				struct task_struct *src);
-
 #endif
 
 #define TIF_SIGPENDING		0	/* signal pending */
diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
index c7c97921ed8d..a674c7d25da5 100644
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@ -52,9 +52,6 @@ struct thread_info {
 
 struct task_struct;
 
-void arch_release_task_struct(struct task_struct *tsk);
-int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
 
diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
index 1400fbb8b423..9f19a682d315 100644
--- a/arch/sh/include/asm/thread_info.h
+++ b/arch/sh/include/asm/thread_info.h
@@ -84,9 +84,6 @@ static inline struct thread_info *current_thread_info(void)
 
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
 
-extern void arch_task_cache_init(void);
-extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-extern void arch_release_task_struct(struct task_struct *tsk);
 extern void init_thread_xstate(void);
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index f1cccba52eb9..d63b02940747 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -232,9 +232,6 @@ static inline int arch_within_stack_frames(const void * const stack,
 			   current_thread_info()->status & TS_COMPAT)
 #endif
 
-extern void arch_task_cache_init(void);
-extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-extern void arch_release_task_struct(struct task_struct *tsk);
 extern void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
 #endif	/* !__ASSEMBLY__ */
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index c02646884fa8..9ea0b28068f4 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -256,6 +256,11 @@ check_copy_size(const void *addr, size_t bytes, bool is_source)
 static inline void arch_setup_new_exec(void) { }
 #endif
 
+void arch_task_cache_init(void); /* for CONFIG_SH */
+void arch_release_task_struct(struct task_struct *tsk);
+int arch_dup_task_struct(struct task_struct *dst,
+				struct task_struct *src);
+
 #endif	/* __KERNEL__ */
 
 #endif /* _LINUX_THREAD_INFO_H */
-- 
2.39.2

