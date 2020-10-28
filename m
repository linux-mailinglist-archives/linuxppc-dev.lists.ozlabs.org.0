Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446529CE96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 09:06:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLh3l1KfTzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 19:06:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=HuXd6ATO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLh1w46vWzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 19:04:52 +1100 (AEDT)
Received: from e123331-lin.nice.arm.com
 (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B40C24197;
 Wed, 28 Oct 2020 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603872289;
 bh=S7JrzMswvUuPbRJxoo3zOS2sxFdQoBIPq4Twumglvts=;
 h=From:To:Cc:Subject:Date:From;
 b=HuXd6ATOL21iYpp7E1zoCqcZ3Jsl7qJKRb5xkP9hPT+XULusufkUPutCimgXy7Uxp
 Opo3Od96ZmT5pYJHsMpP+U3yiOGW+qT7SHBYrOhWwh/Hy4FSVX62DZnm+1G4maeTRS
 qFv5XO+l7Nnb98kyAry85wC3hQuKALM7pLIijb5Q=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: avoid broken GCC __attribute__((optimize))
Date: Wed, 28 Oct 2020 09:04:33 +0100
Message-Id: <20201028080433.26799-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Alexei Starovoitov <ast@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Paul Mackerras <paulus@samba.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 7053f80d9696 ("powerpc/64: Prevent stack protection in early boot")
introduced a couple of uses of __attribute__((optimize)) with function
scope, to disable the stack protector in some early boot code.

Unfortunately, and this is documented in the GCC man pages [0], overriding
function attributes for optimization is broken, and is only supported for
debug scenarios, not for production: the problem appears to be that
setting GCC -f flags using this method will cause it to forget about some
or all other optimization settings that have been applied.

So the only safe way to disable the stack protector is to disable it for
the entire source file.

[0] https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <keescook@chromium.org>
Fixes: 7053f80d9696 ("powerpc/64: Prevent stack protection in early boot")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Related discussion here:
https://lore.kernel.org/lkml/CAMuHMdUg0WJHEcq6to0-eODpXPOywLot6UD2=GFHpzoj_hCoBQ@mail.gmail.com/

TL;DR using __attribute__((optimize("-fno-gcse"))) in the BPF interpreter
causes the compiler to forget about -fno-asynchronous-unwind-tables passed
on the command line, resulting in unexpected .eh_frame sections in vmlinux.

 arch/powerpc/kernel/Makefile   | 3 +++
 arch/powerpc/kernel/paca.c     | 2 +-
 arch/powerpc/kernel/setup.h    | 6 ------
 arch/powerpc/kernel/setup_64.c | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index bf0bf1b900d2..fe2ef598e2ea 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -173,6 +173,9 @@ KCOV_INSTRUMENT_cputable.o := n
 KCOV_INSTRUMENT_setup_64.o := n
 KCOV_INSTRUMENT_paca.o := n
 
+CFLAGS_setup_64.o		+= -fno-stack-protector
+CFLAGS_paca.o			+= -fno-stack-protector
+
 extra-$(CONFIG_PPC_FPU)		+= fpu.o
 extra-$(CONFIG_ALTIVEC)		+= vector.o
 extra-$(CONFIG_PPC64)		+= entry_64.o
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 0ad15768d762..fe70834d7283 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -208,7 +208,7 @@ static struct rtas_args * __init new_rtas_args(int cpu, unsigned long limit)
 struct paca_struct **paca_ptrs __read_mostly;
 EXPORT_SYMBOL(paca_ptrs);
 
-void __init __nostackprotector initialise_paca(struct paca_struct *new_paca, int cpu)
+void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 {
 #ifdef CONFIG_PPC_PSERIES
 	new_paca->lppaca_ptr = NULL;
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 2ec835574cc9..2dd0d9cb5a20 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -8,12 +8,6 @@
 #ifndef __ARCH_POWERPC_KERNEL_SETUP_H
 #define __ARCH_POWERPC_KERNEL_SETUP_H
 
-#ifdef CONFIG_CC_IS_CLANG
-#define __nostackprotector
-#else
-#define __nostackprotector __attribute__((__optimize__("no-stack-protector")))
-#endif
-
 void initialize_cache_info(void);
 void irqstack_early_init(void);
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index bb9cab3641d7..da447a62ea1e 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -283,7 +283,7 @@ void __init record_spr_defaults(void)
  * device-tree is not accessible via normal means at this point.
  */
 
-void __init __nostackprotector early_setup(unsigned long dt_ptr)
+void __init early_setup(unsigned long dt_ptr)
 {
 	static __initdata struct paca_struct boot_paca;
 
-- 
2.17.1

