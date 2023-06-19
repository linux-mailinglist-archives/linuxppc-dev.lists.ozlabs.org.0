Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B139735152
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:00:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTv4iIMC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql4yq2rTBz3cMj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:00:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTv4iIMC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4nY4hTVz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02F7760B4B;
	Mon, 19 Jun 2023 09:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D08C433C0;
	Mon, 19 Jun 2023 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168367;
	bh=EldU9Xh7E1tCtYbsR3NaeaFeInCufKxrl11otRN2CWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DTv4iIMCmcwJ1tRdZXc2B0apoZlbtUnEQyK8FWPl8Vrf4pnTtwtz0RHjoQ77DmQb3
	 od5GOf3zt8/TOqFbsUzDe9wtA1BKwRBmDHkcq12LXyWLGEeYATYVSrIj8dcghd+tmp
	 KKCYU3bpfC3hWszIF8WbL1IbN0op09wiLM1qFuRZTBg4u37yRWNjhQaSnyKhpc6f6A
	 Bz0yyplb53H8oG/AN2CSv2SevTUtj0PWXx96Xu9Vpoans+Hoj9ai7yWnFXmlfGeW0k
	 BW260vRBDTjY6IFCiKZGvAbdp5Rqk0JhrFFm4MJ2U+TVaSuKaBLBdVOjzRI3lBIm9V
	 KifZbJopMWMgQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 06/17] powerpc/ftrace: Extend ftrace support for large kernels to ppc32
Date: Mon, 19 Jun 2023 15:17:24 +0530
Message-Id: <9fa3258cbb9105cf8a0a8135214d44ffbc75fe84.1687166935.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687166935.git.naveen@kernel.org>
References: <cover.1687166935.git.naveen@kernel.org>
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

Commit 67361cf8071286 ("powerpc/ftrace: Handle large kernel configs")
added ftrace support for ppc64 kernel images with a text section larger
than 32MB. The approach itself isn't specific to ppc64, so extend the
same to also work on ppc32.

While at it, reduce the space reserved for the stub from 64 bytes to 32
bytes since the different stub variants are all less than 8
instructions.

To reduce use of #ifdef, a stub implementation is provided for
kernel_toc_address() and -SZ_2G is cast to 'long long' to prevent
errors on ppc32.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h      | 10 +++++--
 arch/powerpc/include/asm/sections.h    |  2 ++
 arch/powerpc/kernel/trace/ftrace.c     | 39 ++++++++++++++------------
 arch/powerpc/kernel/trace/ftrace_low.S |  6 ++--
 arch/powerpc/kernel/vmlinux.lds.S      |  4 ---
 5 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 2edc6269b1a357..702aaf2efa966c 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -124,15 +124,19 @@ static inline u8 this_cpu_get_ftrace_enabled(void)
 {
 	return get_paca()->ftrace_enabled;
 }
-
-void ftrace_free_init_tramp(void);
 #else /* CONFIG_PPC64 */
 static inline void this_cpu_disable_ftrace(void) { }
 static inline void this_cpu_enable_ftrace(void) { }
 static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
 static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
-static inline void ftrace_free_init_tramp(void) { }
 #endif /* CONFIG_PPC64 */
+
+#ifdef CONFIG_FUNCTION_TRACER
+extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
+void ftrace_free_init_tramp(void);
+#else
+static inline void ftrace_free_init_tramp(void) { }
+#endif
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_FTRACE */
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 4e1f548c8d373d..ea26665f82cfc8 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -74,6 +74,8 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
 		(unsigned long)_stext < end;
 }
 
+#else
+static inline unsigned long kernel_toc_addr(void) { BUILD_BUG(); return -1UL; }
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 5aa36272617a03..913c7aa63d3fa3 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -707,11 +707,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-#ifdef CONFIG_PPC64
-#define PACATOC offsetof(struct paca_struct, kernel_toc)
-
-extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
-
 void ftrace_free_init_tramp(void)
 {
 	int i;
@@ -725,28 +720,30 @@ void ftrace_free_init_tramp(void)
 
 int __init ftrace_dyn_arch_init(void)
 {
-	int i;
 	unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
-#ifdef CONFIG_PPC_KERNEL_PCREL
+	unsigned long addr = FTRACE_REGS_ADDR;
+	long reladdr;
+	int i;
 	u32 stub_insns[] = {
+#ifdef CONFIG_PPC_KERNEL_PCREL
 		/* pla r12,addr */
 		PPC_PREFIX_MLS | __PPC_PRFX_R(1),
 		PPC_INST_PADDI | ___PPC_RT(_R12),
 		PPC_RAW_MTCTR(_R12),
 		PPC_RAW_BCTR()
-	};
-#else
-	u32 stub_insns[] = {
-		PPC_RAW_LD(_R12, _R13, PACATOC),
+#elif defined(CONFIG_PPC64)
+		PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
 		PPC_RAW_ADDIS(_R12, _R12, 0),
 		PPC_RAW_ADDI(_R12, _R12, 0),
 		PPC_RAW_MTCTR(_R12),
 		PPC_RAW_BCTR()
-	};
+#else
+		PPC_RAW_LIS(_R12, 0),
+		PPC_RAW_ADDI(_R12, _R12, 0),
+		PPC_RAW_MTCTR(_R12),
+		PPC_RAW_BCTR()
 #endif
-
-	unsigned long addr = FTRACE_REGS_ADDR;
-	long reladdr;
+	};
 
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
 		for (i = 0; i < 2; i++) {
@@ -763,10 +760,10 @@ int __init ftrace_dyn_arch_init(void)
 			tramp[i][1] |= IMM_L(reladdr);
 			add_ftrace_tramp((unsigned long)tramp[i]);
 		}
-	} else {
+	} else if (IS_ENABLED(CONFIG_PPC64)) {
 		reladdr = addr - kernel_toc_addr();
 
-		if (reladdr >= (long)SZ_2G || reladdr < -(long)SZ_2G) {
+		if (reladdr >= (long)SZ_2G || reladdr < -(long long)SZ_2G) {
 			pr_err("Address of %ps out of range of kernel_toc.\n",
 				(void *)addr);
 			return -1;
@@ -778,11 +775,17 @@ int __init ftrace_dyn_arch_init(void)
 			tramp[i][2] |= PPC_LO(reladdr);
 			add_ftrace_tramp((unsigned long)tramp[i]);
 		}
+	} else {
+		for (i = 0; i < 2; i++) {
+			memcpy(tramp[i], stub_insns, sizeof(stub_insns));
+			tramp[i][0] |= PPC_HA(addr);
+			tramp[i][1] |= PPC_LO(addr);
+			add_ftrace_tramp((unsigned long)tramp[i]);
+		}
 	}
 
 	return 0;
 }
-#endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
diff --git a/arch/powerpc/kernel/trace/ftrace_low.S b/arch/powerpc/kernel/trace/ftrace_low.S
index 294d1e05958aae..2fc7dd0a5ae968 100644
--- a/arch/powerpc/kernel/trace/ftrace_low.S
+++ b/arch/powerpc/kernel/trace/ftrace_low.S
@@ -10,19 +10,17 @@
 #include <asm/ppc-opcode.h>
 #include <asm/export.h>
 
-#ifdef CONFIG_PPC64
 .pushsection ".tramp.ftrace.text","aw",@progbits;
 .globl ftrace_tramp_text
 ftrace_tramp_text:
-	.space 64
+	.space 32
 .popsection
 
 .pushsection ".tramp.ftrace.init","aw",@progbits;
 .globl ftrace_tramp_init
 ftrace_tramp_init:
-	.space 64
+	.space 32
 .popsection
-#endif
 
 _GLOBAL(mcount)
 _GLOBAL(_mcount)
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 13614f0b269cf4..1c5970df323366 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -107,9 +107,7 @@ SECTIONS
 #endif
 		/* careful! __ftr_alt_* sections need to be close to .text */
 		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
-#ifdef CONFIG_PPC64
 		*(.tramp.ftrace.text);
-#endif
 		NOINSTR_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
@@ -276,9 +274,7 @@ SECTIONS
 		 */
 		. = ALIGN(PAGE_SIZE);
 		_einittext = .;
-#ifdef CONFIG_PPC64
 		*(.tramp.ftrace.init);
-#endif
 	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
-- 
2.40.1

