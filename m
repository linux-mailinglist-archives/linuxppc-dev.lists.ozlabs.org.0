Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F199840AD47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82NJ5vtqz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:14:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sq4xNJYS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sq4xNJYS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82JC6Gxmz301B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:11:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1B9061130;
 Tue, 14 Sep 2021 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621482;
 bh=gTE6Maj6qRThpm0j9WlP+9jacEHHOVPzS1LeC09xFzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sq4xNJYSujytX0giN9tZTKEaOzYD99AoPZb5diJ6v8ZAjwO5L9EID0jPVwA1owf1M
 TUkNBA2g8rKZnUhOWZqFpX4YIsAShnVKKwNDiVXjBuR/tzUEJxrxofKcFpvIX+0irJ
 +JrqZCjv8Mn0uOgKR/MhH1uWWih3JrcuHdrVCFAJU5Sln4k9/Qqo0VgLXkwbpSs4U4
 imre3233wp3Ze4O59wpDEi+UlzgF2CR5ZwoHG0NdUSH8s4hlC16/ymCV3ijg3efUrD
 ri2dJ8UalQ4h3SdQLeA+gTmhy9W6yusoyBSnHFId2k8x9mekBA7KST/0d7RiSOBFcM
 7x18E6ko3mTPQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/8] powerpc: smp: remove hack to obtain offset of
 task_struct::cpu
Date: Tue, 14 Sep 2021 14:10:34 +0200
Message-Id: <20210914121036.3975026-7-ardb@kernel.org>
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

Instead of relying on awful hacks to obtain the offset of the cpu field
in struct task_struct, move it back into struct thread_info, which does
not create the same level of circular dependency hell when trying to
include the header file that defines it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/powerpc/Makefile             | 11 -----------
 arch/powerpc/include/asm/smp.h    | 17 +----------------
 arch/powerpc/kernel/asm-offsets.c |  2 --
 3 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index aa6808e70647..54cad1faa5d0 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -446,17 +446,6 @@ else
 endif
 endif
 
-ifdef CONFIG_SMP
-ifdef CONFIG_PPC32
-prepare: task_cpu_prepare
-
-PHONY += task_cpu_prepare
-task_cpu_prepare: prepare0
-	$(eval KBUILD_CFLAGS += -D_TASK_CPU=$(shell awk '{if ($$2 == "TASK_CPU") print $$3;}' include/generated/asm-offsets.h))
-
-endif # CONFIG_PPC32
-endif # CONFIG_SMP
-
 PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 7ef1cd8168a0..007332a4a732 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -87,22 +87,7 @@ int is_cpu_dead(unsigned int cpu);
 /* 32-bit */
 extern int smp_hw_index[];
 
-/*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using task_struct we're using _TASK_CPU which is extracted from
- * asm-offsets.h by kbuild to get the current processor ID.
- *
- * This also needs to be safeguarded when building asm-offsets.s because at
- * that time _TASK_CPU is not defined yet. It could have been guarded by
- * _TASK_CPU itself, but we want the build to fail if _TASK_CPU is missing
- * when building something else than asm-offsets.s
- */
-#ifdef GENERATING_ASM_OFFSETS
-#define raw_smp_processor_id()		(0)
-#else
-#define raw_smp_processor_id()		(*(unsigned int *)((void *)current + _TASK_CPU))
-#endif
+#define raw_smp_processor_id()		(current_thread_info()->cpu)
 #define hard_smp_processor_id() 	(smp_hw_index[smp_processor_id()])
 
 static inline int get_hard_smp_processor_id(int cpu)
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e37e4546034e..cc05522f50bf 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -9,8 +9,6 @@
  * #defines from the assembly-language output.
  */
 
-#define GENERATING_ASM_OFFSETS	/* asm/smp.h */
-
 #include <linux/compat.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
-- 
2.30.2

