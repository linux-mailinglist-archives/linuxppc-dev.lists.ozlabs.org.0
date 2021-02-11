Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19401318540
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 07:39:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbn680kjqzDwkx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 17:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LqbEHmVd; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbn3P3JZfzDsj6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 17:36:47 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id c11so3096985pfp.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 22:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKvZg1Obj3kycgfWcXq0rZW4LE2bwRUmf+STmfQZzQs=;
 b=LqbEHmVdXkYeAOj2mPWmK+JPUUjBp4PKH8QgIiLLxOuiyarjYh2dCKa65hzaGJ/p/3
 QArvv+VmZNke8kZKWXtyoJHFqogPncjtbNChL4QEXMcTezWoox6vBYm6Ov+ycBt3rj8H
 b7VlRETF3u2Jlke0VCLDEe0uskB61gir5gfPuroGGHKzqXMwdR5lQCAh7wG9OXhgNUjJ
 dqDmenOe3Fx4eUNd7G01KDp8kbxcgpK1+3JjhjFRvKoOjIDoSdqwdTE1DGUqkiiopsK9
 BeFaUFQlnAAy9buBkf5ijBKTb3258tNjaaCywCLfCk7qmMKGVkzbRmCiQINFOE5NlODS
 XCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKvZg1Obj3kycgfWcXq0rZW4LE2bwRUmf+STmfQZzQs=;
 b=BXsXz5kSZEQfvDiEcW+rC+y7AkEvlpwF3Brbc5q1qQDIc6+WJ5y5aiz3EOBCa2qSX/
 R2URMGWA2re6HPYKfmI6vxKi0qOz5CZ41e1TlfUSOJ094XAsoUCcV2JhoODO9iPEeo90
 IhFPyfeHG3KoHn0X0DYLBp9iBQyGx2Bv/2x1eQr8JymlH7kqxXFrXzGeRjdzOT6yj0cu
 v9elYgxODYURR50MkQVTJLsnuQIq8Ba0ZMexNaH1Z+6xhs7aGWJhxlHPvnh+VqWf44Qs
 Y+rGHNmUo5B49zX2N2Nu7kKFUyzamuR6O3KJiwFwwnRqfCOS3NKWeG1jXJKA9xK/Hdbm
 TahQ==
X-Gm-Message-State: AOAM532tquw4UGK0Qt+sna18K7KYBT5NRqfei1HcCV2LU/n0DM/hK8+5
 NSM64VSiQhTMksfYBDEKl4HruWoRGdo=
X-Google-Smtp-Source: ABdhPJxyJUijKFrEeHnEHT2vB2B/bAxfW16ZdfyHyZ0RkPrVaqf1f1mFVliwbGCQKzhiP4F05Oka1g==
X-Received: by 2002:a62:7d03:0:b029:1bb:5919:6dec with SMTP id
 y3-20020a627d030000b02901bb59196decmr6816374pfc.76.1613025403301; 
 Wed, 10 Feb 2021 22:36:43 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id o135sm4074500pfg.21.2021.02.10.22.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 22:36:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove interrupt handler functions from the noinstr
 section
Date: Thu, 11 Feb 2021 16:36:36 +1000
Message-Id: <20210211063636.236420-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The allyesconfig ppc64 kernel fails to link with relocations unable to
fit after commit 3a96570ffceb ("powerpc: convert interrupt handlers to
use wrappers"), which is due to the interrupt handler functions being
put into the .noinstr.text section, which the linker script places on
the opposite side of the main .text section from the interrupt entry
asm code which calls the handlers.

This results in a lot of linker stubs that overwhelm the 252-byte sized
space we allow for them, or in the case of BE a .opd relocation link
error for some reason.

It's not required to put interrupt handlers in the .noinstr section,
previously they used NOKPROBE_SYMBOL, so take them out and replace
with a NOKPROBE_SYMBOL in the wrapper macro. Remove the explicit
NOKPROBE_SYMBOL macros in the interrupt handler functions. This makes
a number of interrupt handlers nokprobe that were not prior to the
interrupt wrappers commit, but since that commit they were made
nokprobe due to being in .noinstr.text, so this fix does not change
that.

The fixes tag is different to the commit that first exposes the problem
because it is where the wrapper macros were introduced.

Fixes: 8d41fc618ab8 ("powerpc: interrupt handler wrapper functions")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 25 ++++++++++++++++++++-----
 arch/powerpc/kernel/traps.c          |  9 ---------
 arch/powerpc/mm/fault.c              |  1 -
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4badb3e51c19..ffb568587553 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,7 @@
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
 #include <asm/ftrace.h>
+#include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
 struct interrupt_state {
@@ -164,6 +165,15 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 #endif
 }
 
+/*
+ * Don't use like to use noinstr here like x86, but rather add NOKPROBE_SYMBOL
+ * to each function definition. The reason for this is the noinstr section
+ * is placed after the main text section, i.e., very far away from the
+ * interrupt entry asm. That creates problems with fitting linker stubs when
+ * building large kernels.
+ */
+#define interrupt_handler __visible noinline notrace __no_kcsan __no_sanitize_address
+
 /**
  * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
  * @func:	Function name of the entry point
@@ -198,7 +208,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
@@ -206,6 +216,7 @@ __visible noinstr long func(struct pt_regs *regs)			\
 									\
 	return ret;							\
 }									\
+NOKPROBE_SYMBOL(func);							\
 									\
 static __always_inline long ____##func(struct pt_regs *regs)
 
@@ -228,7 +239,7 @@ static __always_inline long ____##func(struct pt_regs *regs)
 #define DEFINE_INTERRUPT_HANDLER(func)					\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+interrupt_handler void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -238,6 +249,7 @@ __visible noinstr void func(struct pt_regs *regs)			\
 									\
 	interrupt_exit_prepare(regs, &state);				\
 }									\
+NOKPROBE_SYMBOL(func);							\
 									\
 static __always_inline void ____##func(struct pt_regs *regs)
 
@@ -262,7 +274,7 @@ static __always_inline void ____##func(struct pt_regs *regs)
 #define DEFINE_INTERRUPT_HANDLER_RET(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 	long ret;							\
@@ -275,6 +287,7 @@ __visible noinstr long func(struct pt_regs *regs)			\
 									\
 	return ret;							\
 }									\
+NOKPROBE_SYMBOL(func);							\
 									\
 static __always_inline long ____##func(struct pt_regs *regs)
 
@@ -297,7 +310,7 @@ static __always_inline long ____##func(struct pt_regs *regs)
 #define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+interrupt_handler void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -307,6 +320,7 @@ __visible noinstr void func(struct pt_regs *regs)			\
 									\
 	interrupt_async_exit_prepare(regs, &state);			\
 }									\
+NOKPROBE_SYMBOL(func);							\
 									\
 static __always_inline void ____##func(struct pt_regs *regs)
 
@@ -331,7 +345,7 @@ static __always_inline void ____##func(struct pt_regs *regs)
 #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_nmi_state state;				\
 	long ret;							\
@@ -344,6 +358,7 @@ __visible noinstr long func(struct pt_regs *regs)			\
 									\
 	return ret;							\
 }									\
+NOKPROBE_SYMBOL(func);							\
 									\
 static __always_inline long ____##func(struct pt_regs *regs)
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 39c8b7e9b91a..1583fd1c6010 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -513,7 +513,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 
 	return 0;
 }
-NOKPROBE_SYMBOL(system_reset_exception);
 
 /*
  * I/O accesses can cause machine checks on powermacs.
@@ -798,7 +797,6 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 		nmi_exit();
 	die(str, regs, err);
 }
-NOKPROBE_SYMBOL(die_mce);
 
 /*
  * BOOK3S_64 does not call this handler as a non-maskable interrupt
@@ -851,7 +849,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	return 0;
 #endif
 }
-NOKPROBE_SYMBOL(machine_check_exception);
 
 DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
 {
@@ -1113,7 +1110,6 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 
 	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
 }
-NOKPROBE_SYMBOL(single_step_exception);
 
 /*
  * After we have successfully emulated an instruction, we have to
@@ -1556,7 +1552,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
 	do_program_check(regs);
 }
-NOKPROBE_SYMBOL(program_check_exception);
 
 /*
  * This occurs when running in hypervisor mode on POWER6 or later
@@ -1567,7 +1562,6 @@ DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
 	regs->msr |= REASON_ILLEGAL;
 	do_program_check(regs);
 }
-NOKPROBE_SYMBOL(emulation_assist_interrupt);
 
 DEFINE_INTERRUPT_HANDLER(alignment_exception)
 {
@@ -2034,7 +2028,6 @@ DEFINE_INTERRUPT_HANDLER(DebugException)
 	} else
 		handle_debug(regs, debug_status);
 }
-NOKPROBE_SYMBOL(DebugException);
 #endif /* CONFIG_PPC_ADV_DEBUG_REGS */
 
 #ifdef CONFIG_ALTIVEC
@@ -2183,7 +2176,6 @@ DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
 		 regs->trap, regs->nip, regs->msr);
 	die("Unrecoverable exception", regs, SIGABRT);
 }
-NOKPROBE_SYMBOL(unrecoverable_exception);
 
 #if defined(CONFIG_BOOKE_WDT) || defined(CONFIG_40x)
 /*
@@ -2214,7 +2206,6 @@ DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
 	       regs->gpr[1], regs->nip);
 	die("Bad kernel stack pointer", regs, SIGABRT);
 }
-NOKPROBE_SYMBOL(kernel_bad_stack);
 
 void __init trap_init(void)
 {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b26a7643fc6e..bb368257b55c 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -566,7 +566,6 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
 	return __do_page_fault(regs);
 }
-NOKPROBE_SYMBOL(do_page_fault);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
-- 
2.23.0

