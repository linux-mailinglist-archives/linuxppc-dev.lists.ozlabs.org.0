Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A251F3EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVLK6fdGz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:37:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVKV4fvXz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:36:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKG4yL1z9sWF;
 Mon,  9 May 2022 07:36:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUhEu2-OyNkj; Mon,  9 May 2022 07:36:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF4CL3z9sTC;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD8B8B763;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eZzkV1eGw1pY; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7368B76E;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTXQ1591243
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aT0Q1591242;
 Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 09/25] powerpc: Replace PPC64_ELF_ABI_v{1/2} by
 CONFIG_PPC64_ELF_ABI_V{1/2}
Date: Mon,  9 May 2022 07:36:07 +0200
Message-Id: <ba13d59e8c50bc9aa6328f1c7f0c0d0278e0a3a7.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074581; l=13645; s=20211009;
 h=from:subject:message-id; bh=n+fJjNfZGXYYu8Kp2QFg9Cg0hKwoJLneMbmp5HOOxdM=;
 b=omIG1yCBR0+f6qUwQZfTrgrHQ/jxUIry4HNzkKmB9GlofBoN1UChs9JT+8E1irnPgrt5RvjCUGLI
 FLKT4J6lCx/ieT4cUWGxnX8hvOoDdwgM1f64XrsYTBfXES4I1xL7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace all uses of PPC64_ELF_ABI_v1 and PPC64_ELF_ABI_v2 by
resp CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 12 ++++++------
 arch/powerpc/include/asm/ftrace.h        |  4 ++--
 arch/powerpc/include/asm/linkage.h       |  2 +-
 arch/powerpc/include/asm/ppc_asm.h       |  4 ++--
 arch/powerpc/include/asm/ptrace.h        |  2 +-
 arch/powerpc/kernel/head_64.S            |  2 +-
 arch/powerpc/kernel/interrupt_64.S       |  2 +-
 arch/powerpc/kernel/kprobes.c            |  6 +++---
 arch/powerpc/kernel/misc_64.S            |  2 +-
 arch/powerpc/kernel/module.c             |  4 ++--
 arch/powerpc/kernel/module_64.c          |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace.c      |  2 +-
 arch/powerpc/kernel/trace/ftrace.c       |  4 ++--
 arch/powerpc/kvm/book3s_interrupts.S     |  2 +-
 arch/powerpc/kvm/book3s_rmhandlers.S     |  2 +-
 arch/powerpc/net/bpf_jit.h               |  2 +-
 arch/powerpc/net/bpf_jit_comp.c          |  2 +-
 arch/powerpc/net/bpf_jit_comp64.c        |  4 ++--
 18 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 4260e89f62b1..8b1a10868275 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -130,7 +130,7 @@ bool is_conditional_branch(ppc_inst_t instr);
 
 static inline unsigned long ppc_function_entry(void *func)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	u32 *insn = func;
 
 	/*
@@ -155,7 +155,7 @@ static inline unsigned long ppc_function_entry(void *func)
 		return (unsigned long)(insn + 2);
 	else
 		return (unsigned long)func;
-#elif defined(PPC64_ELF_ABI_v1)
+#elif defined(CONFIG_PPC64_ELF_ABI_V1)
 	/*
 	 * On PPC64 ABIv1 the function pointer actually points to the
 	 * function's descriptor. The first entry in the descriptor is the
@@ -169,7 +169,7 @@ static inline unsigned long ppc_function_entry(void *func)
 
 static inline unsigned long ppc_global_function_entry(void *func)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	/* PPC64 ABIv2 the global entry point is at the address */
 	return (unsigned long)func;
 #else
@@ -186,7 +186,7 @@ static inline unsigned long ppc_global_function_entry(void *func)
 static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 {
 	unsigned long addr;
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* check for dot variant */
 	char dot_name[1 + KSYM_NAME_LEN];
 	bool dot_appended = false;
@@ -207,7 +207,7 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 	if (!addr && dot_appended)
 		/* Let's try the original non-dot symbol lookup	*/
 		addr = kallsyms_lookup_name(name);
-#elif defined(PPC64_ELF_ABI_v2)
+#elif defined(CONFIG_PPC64_ELF_ABI_V2)
 	addr = kallsyms_lookup_name(name);
 	if (addr)
 		addr = ppc_function_entry((void *)addr);
@@ -224,7 +224,7 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
  */
 
 /* This must match the definition of STK_GOT in <asm/ppc_asm.h> */
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define R2_STACK_OFFSET         24
 #else
 #define R2_STACK_OFFSET         40
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index d83758acd1c7..b56166b7ea68 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -64,7 +64,7 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
  * those.
  */
 #define ARCH_HAS_SYSCALL_MATCH_SYM_NAME
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 static inline bool arch_syscall_match_sym_name(const char *sym, const char *name)
 {
 	/* We need to skip past the initial dot, and the __se_sys alias */
@@ -83,7 +83,7 @@ static inline bool arch_syscall_match_sym_name(const char *sym, const char *name
 		(!strncmp(sym, "ppc32_", 6) && !strcmp(sym + 6, name + 4)) ||
 		(!strncmp(sym, "ppc64_", 6) && !strcmp(sym + 6, name + 4));
 }
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index 1f00d2891d69..b71b9582e754 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -4,7 +4,7 @@
 
 #include <asm/types.h>
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 #define cond_syscall(x) \
 	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
 	     "\t.weak ." #x "\n\t.set ." #x ", .sys_ni_syscall\n")
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 4dea2d963738..83c02f5a7f2a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -149,7 +149,7 @@
 #define __STK_REG(i)   (112 + ((i)-14)*8)
 #define STK_REG(i)     __STK_REG(__REG_##i)
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STK_GOT		24
 #define __STK_PARAM(i)	(32 + ((i)-3)*8)
 #else
@@ -158,7 +158,7 @@
 #endif
 #define STK_PARAM(i)	__STK_PARAM(__REG_##i)
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 
 #define _GLOBAL(name) \
 	.align 2 ; \
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 42f89e2d8f04..a03403695cd4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -120,7 +120,7 @@ struct pt_regs
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 #define STACK_FRAME_MARKER	12
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
 #else
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 5c5181e8d5f1..f85660d054bd 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -435,7 +435,7 @@ generic_secondary_common_init:
 	ld	r12,CPU_SPEC_RESTORE(r23)
 	cmpdi	0,r12,0
 	beq	3f
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	ld	r12,0(r12)
 #endif
 	mtctr	r12
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 7bab2d7de372..4caddff1d6f9 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -721,7 +721,7 @@ _GLOBAL(ret_from_kernel_thread)
 	REST_NVGPRS(r1)
 	mtctr	r14
 	mr	r3,r15
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	mr	r12,r14
 #endif
 	bctrl
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 7dae0b01abfb..f7af1a3e4f75 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -45,7 +45,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 {
 	kprobe_opcode_t *addr = NULL;
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	/* PPC64 ABIv2 needs local entry point */
 	addr = (kprobe_opcode_t *)kallsyms_lookup_name(name);
 	if (addr && !offset) {
@@ -63,7 +63,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 #endif
 			addr = (kprobe_opcode_t *)ppc_function_entry(addr);
 	}
-#elif defined(PPC64_ELF_ABI_v1)
+#elif defined(CONFIG_PPC64_ELF_ABI_V1)
 	/*
 	 * 64bit powerpc ABIv1 uses function descriptors:
 	 * - Check for the dot variant of the symbol first.
@@ -107,7 +107,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 
 static bool arch_kprobe_on_func_entry(unsigned long offset)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #ifdef CONFIG_KPROBES_ON_FTRACE
 	return offset <= 16;
 #else
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index d38a019b38e1..fd6d8d3a548e 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -454,7 +454,7 @@ _GLOBAL(kexec_sequence)
 	beq	1f
 
 	/* clear out hardware hash page table and tlb */
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	ld	r12,0(r27)		/* deref function descriptor */
 #else
 	mr	r12,r27
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 97a76a8619fb..f6d6ae0a1692 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -64,13 +64,13 @@ int module_finalize(const Elf_Ehdr *hdr,
 				  (void *)sect->sh_addr + sect->sh_size);
 #endif /* CONFIG_PPC64 */
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	sect = find_section(hdr, sechdrs, ".opd");
 	if (sect != NULL) {
 		me->arch.start_opd = sect->sh_addr;
 		me->arch.end_opd = sect->sh_addr + sect->sh_size;
 	}
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 	sect = find_section(hdr, sechdrs, "__spec_barrier_fixup");
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 794720530442..c1d87937b962 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -31,7 +31,7 @@
    this, and makes other things simpler.  Anton?
    --RR.  */
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 
 static func_desc_t func_desc(unsigned long addr)
 {
@@ -122,7 +122,7 @@ static u32 ppc64_stub_insns[] = {
 	/* Save current r2 value in magic place on the stack. */
 	PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET),
 	PPC_RAW_LD(_R12, _R11, 32),
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Set up new r2 from function descriptor */
 	PPC_RAW_LD(_R2, _R11, 40),
 #endif
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 6d5026a9db4f..9fbe155a9bd0 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -445,7 +445,7 @@ void __init pt_regs_check(void)
 	 */
 	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long));
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	BUILD_BUG_ON(!IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
 #else
 	BUILD_BUG_ON(IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 1b05d33f96c6..0b199fc9cfd3 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -953,7 +953,7 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 #endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 char *arch_ftrace_match_adjust(char *str, const char *search)
 {
 	if (str[0] == '.' && search[0] != '.')
@@ -961,4 +961,4 @@ char *arch_ftrace_match_adjust(char *str, const char *search)
 	else
 		return str;
 }
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
index 25a3679fb590..f4bec2fc51aa 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -15,7 +15,7 @@
 #include <asm/asm-compat.h>
 
 #if defined(CONFIG_PPC_BOOK3S_64)
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
 #define FUNC(name) 		GLUE(.,name)
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s_rmhandlers.S
index b45b750fa77a..03886ca24498 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -26,7 +26,7 @@
 
 #if defined(CONFIG_PPC_BOOK3S_64)
 
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
 #define FUNC(name) 		GLUE(.,name)
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 979701d360da..80d973da9093 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -13,7 +13,7 @@
 #include <asm/types.h>
 #include <asm/ppc-opcode.h>
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 #define FUNCTION_DESCR_SIZE	24
 #else
 #define FUNCTION_DESCR_SIZE	0
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 427185256216..43e634126514 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -276,7 +276,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		 */
 		bpf_jit_dump(flen, proglen, pass, code_base);
 
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Function descriptor nastiness: Address + TOC */
 	((u64 *)image)[0] = (u64)code_base;
 	((u64 *)image)[1] = local_paca->kernel_toc;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 585f257da045..d7b42f45669e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,7 +126,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
-	if (__is_defined(PPC64_ELF_ABI_v2))
+	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
 
 	/*
@@ -266,7 +266,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
-	if (__is_defined(PPC64_ELF_ABI_v2))
+	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
-- 
2.35.1

