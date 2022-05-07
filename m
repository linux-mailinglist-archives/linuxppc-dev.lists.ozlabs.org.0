Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0951E4BD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ1S50HJz3dw7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwHzj1GQqz3cCy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzJ6mHqz9sVl;
 Sat,  7 May 2022 08:46:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nV-xq3crS7jX; Sat,  7 May 2022 08:46:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD5B9bz9sVq;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B1058B76C;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id us1uqfBldFX1; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEC888B763;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kemG1320510
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:40 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476keOU1320509;
 Sat, 7 May 2022 08:46:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 10/25] powerpc: Finalise cleanup around ABI use
Date: Sat,  7 May 2022 08:46:12 +0200
Message-Id: <709d9d69523c14c8a9fba4486395dca0f2d675b1.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=4161; s=20211009;
 h=from:subject:message-id; bh=WxVopPaHaxL4NhbA6gDzSbUKU21wfZC2s9FczOO6P/8=;
 b=dIOduIFC0bsk391EAMe1Idp9xQab/x/86Dca6hXexc8dcTPr/jSLt3HGPtHgOMhgBpi+uwRvS0Nj
 2PzdCWX/DlTBD657r6e2rsoqVPUCsKTw4yFfBFpXDdA9WkFf/+P3
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

Now that we have CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2,
get rid of all indirect detection of ABI version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                |  2 +-
 arch/powerpc/Makefile               |  2 +-
 arch/powerpc/include/asm/types.h    |  8 --------
 arch/powerpc/kernel/fadump.c        | 13 ++++++++-----
 arch/powerpc/kernel/ptrace/ptrace.c |  6 ------
 arch/powerpc/net/bpf_jit_comp64.c   |  4 ++--
 6 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..5514fed3f072 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -208,7 +208,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_CPU)
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
-	select HAVE_FUNCTION_DESCRIPTORS	if PPC64 && !CPU_LITTLE_ENDIAN
+	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 1ba98be84101..8bd3b631f094 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -213,7 +213,7 @@ CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
 CHECKFLAGS	+= -D__BIG_ENDIAN__
 else
-CHECKFLAGS	+= -D__LITTLE_ENDIAN__ -D_CALL_ELF=2
+CHECKFLAGS	+= -D__LITTLE_ENDIAN__
 endif
 
 ifdef CONFIG_476FPE_ERR46
diff --git a/arch/powerpc/include/asm/types.h b/arch/powerpc/include/asm/types.h
index 84078c28c1a2..93157a661dcc 100644
--- a/arch/powerpc/include/asm/types.h
+++ b/arch/powerpc/include/asm/types.h
@@ -11,14 +11,6 @@
 
 #include <uapi/asm/types.h>
 
-#ifdef __powerpc64__
-#if defined(_CALL_ELF) && _CALL_ELF == 2
-#define PPC64_ELF_ABI_v2 1
-#else
-#define PPC64_ELF_ABI_v1 1
-#endif
-#endif /* __powerpc64__ */
-
 #ifndef __ASSEMBLY__
 
 typedef __vector128 vector128;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..5f7224d66586 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -968,11 +968,14 @@ static int fadump_init_elfcore_header(char *bufp)
 	elf->e_entry = 0;
 	elf->e_phoff = sizeof(struct elfhdr);
 	elf->e_shoff = 0;
-#if defined(_CALL_ELF)
-	elf->e_flags = _CALL_ELF;
-#else
-	elf->e_flags = 0;
-#endif
+
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+		elf->e_flags = 2;
+	else if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+		elf->e_flags = 1;
+	else
+		elf->e_flags = 0;
+
 	elf->e_ehsize = sizeof(struct elfhdr);
 	elf->e_phentsize = sizeof(struct elf_phdr);
 	elf->e_phnum = 0;
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 9fbe155a9bd0..4d2dc22d4a2d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -444,10 +444,4 @@ void __init pt_regs_check(void)
 	 * real registers.
 	 */
 	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long));
-
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
-#else
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
-#endif
 }
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index d7b42f45669e..594c54931e20 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,7 +126,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
-	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
 
 	/*
@@ -266,7 +266,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
-	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
-- 
2.35.1

