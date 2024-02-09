Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E594784F139
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:05:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMm61B3L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWRHn60fxz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:05:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMm61B3L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWRH14rQQz309c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:05:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90E1761EE7;
	Fri,  9 Feb 2024 08:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2FAC433F1;
	Fri,  9 Feb 2024 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707465914;
	bh=l4wPmBotrK0lmvOpGwHwWCSz8z3m/0muNab90qiNBEI=;
	h=From:To:Cc:Subject:Date:From;
	b=EMm61B3LEyUECN3uJswaEe/18RNJLw1HwlyLXu5H4K7TA1NYVcyMghTJjgnullj4g
	 I7HMhUB/CqAn+zmMpaR9NcOVibtpuV+orj2qEDldOhJ3BNkOmGa0ireyZ/4sY4C+NN
	 kIMyB8GMd/JXYGkf2hvUAsOW07TPcbIRwHSttaW/nfwg6llTy4nPhn/a/Go2akSTla
	 QKjIR30m3PicXUX4ueCg0ZZ84NfrozYReiJqBBH6HCLE+980yEToN1nG8s4JgmCztx
	 os0Yqv/aWMQBeswkyTnEvJ2v2HJ3onADI38v1FtgdcZpLqgiOnfPfDFuzrAkKbrvLa
	 bAPubSCY7PkvA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/ftrace: Ignore ftrace locations in exit text sections
Date: Fri,  9 Feb 2024 13:29:31 +0530
Message-ID: <20240209075931.666935-1-naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael reported that we are seeing ftrace bug on bootup when KASAN is
enabled, and if we are using -fpatchable-function-entry:

    ftrace: allocating 47780 entries in 18 pages
    ftrace-powerpc: 0xc0000000020b3d5c: No module provided for non-kernel address
    ------------[ ftrace bug ]------------
    ftrace faulted on modifying
    [<c0000000020b3d5c>] 0xc0000000020b3d5c
    Initializing ftrace call sites
    ftrace record flags: 0
     (0)
     expected tramp: c00000000008cef4
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2180 ftrace_bug+0x3c0/0x424
    Modules linked in:
    CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0-rc3-00120-g0f71dcfb4aef #860
    Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
    NIP:  c0000000003aa81c LR: c0000000003aa818 CTR: 0000000000000000
    REGS: c0000000033cfab0 TRAP: 0700   Not tainted  (6.5.0-rc3-00120-g0f71dcfb4aef)
    MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 28028240  XER: 00000000
    CFAR: c0000000002781a8 IRQMASK: 3
    ...
    NIP [c0000000003aa81c] ftrace_bug+0x3c0/0x424
    LR [c0000000003aa818] ftrace_bug+0x3bc/0x424
    Call Trace:
     ftrace_bug+0x3bc/0x424 (unreliable)
     ftrace_process_locs+0x5f4/0x8a0
     ftrace_init+0xc0/0x1d0
     start_kernel+0x1d8/0x484

With CONFIG_FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY=y and
CONFIG_KASAN=y, compiler emits nops in functions that it generates for
registering and unregistering global variables (unlike with -pg and
-mprofile-kernel where calls to _mcount() are not generated in those
functions). Those functions then end up in INIT_TEXT and EXIT_TEXT
respectively. We don't expect to see any profiled functions in
EXIT_TEXT, so ftrace_init_nop() assumes that all addresses that aren't
in the core kernel text belongs to a module. Since these functions do
not match that criteria, we see the above bug.

Address this by having ftrace ignore all locations in the text exit
sections of vmlinux.

Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
Cc: stable@vger.kernel.org
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h   |  9 +--------
 arch/powerpc/include/asm/sections.h |  1 +
 arch/powerpc/kernel/trace/ftrace.c  | 12 ++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S   |  2 ++
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 1ebd2ca97f12..d6babd083202 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -20,14 +20,7 @@
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
 
-static inline unsigned long ftrace_call_adjust(unsigned long addr)
-{
-	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
-		addr += MCOUNT_INSN_SIZE;
-
-	return addr;
-}
-
+unsigned long ftrace_call_adjust(unsigned long addr);
 unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 				    unsigned long sp);
 
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index ea26665f82cf..d389dcecdb0b 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -14,6 +14,7 @@ typedef struct func_desc func_desc_t;
 
 extern char __head_end[];
 extern char __srwx_boundary[];
+extern char _sexittext[], _eexittext[];
 
 /* Patch sites */
 extern s32 patch__call_flush_branch_caches1;
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 82010629cf88..b5efd8d7bc01 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -27,10 +27,22 @@
 #include <asm/ftrace.h>
 #include <asm/syscall.h>
 #include <asm/inst.h>
+#include <asm/sections.h>
 
 #define	NUM_FTRACE_TRAMPS	2
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
+unsigned long ftrace_call_adjust(unsigned long addr)
+{
+	if (addr >= (unsigned long)_sexittext && addr < (unsigned long)_eexittext)
+		return 0;
+
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
+		addr += MCOUNT_INSN_SIZE;
+
+	return addr;
+}
+
 static ppc_inst_t ftrace_create_branch_inst(unsigned long ip, unsigned long addr, int link)
 {
 	ppc_inst_t op;
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 1c5970df3233..9c376ae6857d 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -281,7 +281,9 @@ SECTIONS
 	 * to deal with references from __bug_table
 	 */
 	.exit.text : AT(ADDR(.exit.text) - LOAD_OFFSET) {
+		_sexittext = .;
 		EXIT_TEXT
+		_eexittext = .;
 	}
 
 	. = ALIGN(PAGE_SIZE);

base-commit: 4ef8376c466ae8b03e632dd8eca1e44315f7dd61
-- 
2.43.0

