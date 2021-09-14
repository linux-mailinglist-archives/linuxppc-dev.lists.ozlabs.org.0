Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D235940AD51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82Pd5Ljlz3cl2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ig+JhbgZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ig+JhbgZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82JR62rsz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:11:35 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C83CF6113B;
 Tue, 14 Sep 2021 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621494;
 bh=Un8y/D+KQ7QnI5WCuToXds/wfl/En/jtOwh4rNfj9R8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ig+JhbgZYvBpoEkePCkGJri/drWhd/zNQud4qJwR8VAt84t30tIDeaFs97pqovpnU
 WCFrlyeMm6+1wzrVATtgyga9C5qWYHs1yX99yykHrOJ3pCi9FXJKirLieFGvLxzC0K
 Mywhpb0yr9NkpYWBDViktx8s3C+pE5TggWsvKK4IyjcPZc1m8gjUT/JKfmfVm6FX8H
 CX7KnVaCKBdHWEu2l+bHSQiZ1f1aWajC83sfiAJLI1WCxOKfU4PeSC6JVYfKKmXY+Q
 NIiIwTM/plhEKszesgnnR42HGaTtjXF+XLsz785RrqO0IDw4DjfEQpDioB90gj8vwG
 AVBFyfowsQ6nQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 8/8] ARM: rely on core code to keep thread_info::cpu
 updated
Date: Tue, 14 Sep 2021 14:10:36 +0200
Message-Id: <20210914121036.3975026-9-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the core code switched back to using thread_info::cpu to keep
a task's CPU number, we no longer need to keep it in sync explicitly. So
just drop the code that does this.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
This patch applies onto [0], which we hope to get merged for v5.16

[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm32-ti-in-task-v5

 arch/arm/include/asm/switch_to.h | 14 --------------
 arch/arm/kernel/smp.c            |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/arch/arm/include/asm/switch_to.h b/arch/arm/include/asm/switch_to.h
index db2be1f6550d..61e4a3c4ca6e 100644
--- a/arch/arm/include/asm/switch_to.h
+++ b/arch/arm/include/asm/switch_to.h
@@ -23,23 +23,9 @@
  */
 extern struct task_struct *__switch_to(struct task_struct *, struct thread_info *, struct thread_info *);
 
-static inline void set_ti_cpu(struct task_struct *p)
-{
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/*
-	 * The core code no longer maintains the thread_info::cpu field once
-	 * CONFIG_THREAD_INFO_IN_TASK is in effect, but we rely on it for
-	 * raw_smp_processor_id(), which cannot access struct task_struct*
-	 * directly for reasons of circular #inclusion hell.
-	 */
-	task_thread_info(p)->cpu = p->cpu;
-#endif
-}
-
 #define switch_to(prev,next,last)					\
 do {									\
 	__complete_pending_tlbi();					\
-	set_ti_cpu(next);						\
 	if (IS_ENABLED(CONFIG_CURRENT_POINTER_IN_TPIDRURO))		\
 		__this_cpu_write(__entry_task, next);			\
 	last = __switch_to(prev,task_thread_info(prev), task_thread_info(next));	\
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index cde5b6d8bac5..97ee6b1567e9 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -154,9 +154,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	secondary_data.swapper_pg_dir = get_arch_pgd(swapper_pg_dir);
 #endif
 	secondary_data.task = idle;
-	if (IS_ENABLED(CONFIG_THREAD_INFO_IN_TASK))
-		task_thread_info(idle)->cpu = cpu;
-
 	sync_cache_w(&secondary_data);
 
 	/*
-- 
2.30.2

