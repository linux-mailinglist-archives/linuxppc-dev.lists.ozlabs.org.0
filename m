Return-Path: <linuxppc-dev+bounces-2520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B09AD0A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 18:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYZHz0MPrz2ywq;
	Thu, 24 Oct 2024 03:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729700959;
	cv=none; b=Ji89OcbyQxrlVplr1hR+XlvJu43q0NL2VwBQkgjwxSlE0lmgITLxYlNHIeLWwGqsV/xSvZ8Y1aexiDVt5DiYiE7TmhqhSvnOMB8IhrVFbnxKm4rjqUmsHDhq7H43zmNI0qQPi1NL4sewcmqqi3jYecRGHVo1s6igWW/a3CzPjMqSN5GdrtIAx5R7zjiuEcFg1dxtCMqHEX/vZI4Rh6lEozMhHOrPrQItY5aB6q3kQc48CkUpflsYKRUZxXSVaf0ArS+XXf1cX/L0vTemsBWbuawxyYvOwany7qE+6P4H55TIfnyNSWf2ZlBhopdiRDFY73eRwiL5SgAcYVUNPl8jNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729700959; c=relaxed/relaxed;
	bh=EzE7u0JzVXhb/USFYI+7NhNKE79rkhhIqE4R9lzGZ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eq4u0QvY8Ztp4yboeBjPp/0vPrdIXoagYfAu2supDXvvoGxOfghFejNZBKVM5Xl83b1xvKUGWsXExdXj5DtbsG74frQfxa4Bnox6UhqIVjBrgx7MAzmQ+Je66OnhnvAt2T3DhtxQoUDOFRb8RlETLdUb9iQ9hZgxgAKPUADd6qpx5C5W3FOPnRxIGT1xhlVcKKwRA3pTafGaNUIucoEzqNDqmHKYqLkMlD8jasOWyTupFToB6o6wOqx26lfcR93/99HNd/ZJFFC2Veq+NEX0fFE2o3Qq8VkAqk0OJd5JxHafh/DlAnlX0aKSXro86nQi4+6upPvlmBVBaTHX1OXchA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iumZdcDg; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iumZdcDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYZHx6t5Hz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 03:29:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CB41A40C09;
	Wed, 23 Oct 2024 16:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FF3C4CEE4;
	Wed, 23 Oct 2024 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700955;
	bh=qN3K5c87G2wH4f4O/nLbDpCToKnDXHFoBiC8yapfgHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iumZdcDgAx132bAT8QS3kvVCjEXGvJx294+qUva1kGhj+uHykuBNss4Crds2A/w5x
	 LB3hvvyZVSONcnrrsqkca8CQRd1SCNiYVqWe1MeqO6VxeKIxaybBN6FzL9FOrMi1Td
	 JMQXxFFm2IiizV2cfZWZRF7pPRbgEaJTpz6AG/AafNSctwadijfu8fXKkk141KADb+
	 QRrjDqXnu+IZGdbCuIZUj4NWIH3NxmybdRmNsC3SSdFDT7d9F/s09wKkEs/MJ5NJHV
	 5Xu520AnK2g8FM5bhf1BMYGm8CcxbPXjICg1Xek4+APxE9c2L9SqLkyhnBx12K6Svx
	 ZIoGO3iWTAeYA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v7 6/8] x86/module: prepare module loading for ROX allocations of text
Date: Wed, 23 Oct 2024 19:27:09 +0300
Message-ID: <20241023162711.2579610-7-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023162711.2579610-1-rppt@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

When module text memory will be allocated with ROX permissions, the
memory at the actual address where the module will live will contain
invalid instructions and there will be a writable copy that contains the
actual module code.

Update relocations and alternatives patching to deal with it.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: kdevops <kdevops@lists.linux.dev>
---
 arch/um/kernel/um_arch.c           |  11 +-
 arch/x86/entry/vdso/vma.c          |   3 +-
 arch/x86/include/asm/alternative.h |  14 +--
 arch/x86/kernel/alternative.c      | 181 +++++++++++++++++------------
 arch/x86/kernel/ftrace.c           |  30 ++---
 arch/x86/kernel/module.c           |  45 ++++---
 6 files changed, 167 insertions(+), 117 deletions(-)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index f8de31a0c5d1..e8e8b54b3037 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -435,24 +435,25 @@ void __init arch_cpu_finalize_init(void)
 	os_check_bugs();
 }
 
-void apply_seal_endbr(s32 *start, s32 *end)
+void apply_seal_endbr(s32 *start, s32 *end, struct module *mod)
 {
 }
 
-void apply_retpolines(s32 *start, s32 *end)
+void apply_retpolines(s32 *start, s32 *end, struct module *mod)
 {
 }
 
-void apply_returns(s32 *start, s32 *end)
+void apply_returns(s32 *start, s32 *end, struct module *mod)
 {
 }
 
 void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
-		   s32 *start_cfi, s32 *end_cfi)
+		   s32 *start_cfi, s32 *end_cfi, struct module *mod)
 {
 }
 
-void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
+void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
+			struct module *mod)
 {
 }
 
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index b8fed8b8b9cc..ed21151923c3 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -54,7 +54,8 @@ int __init init_vdso_image(const struct vdso_image *image)
 
 	apply_alternatives((struct alt_instr *)(image->data + image->alt),
 			   (struct alt_instr *)(image->data + image->alt +
-						image->alt_len));
+						image->alt_len),
+			   NULL);
 
 	return 0;
 }
diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index ca9ae606aab9..dc03a647776d 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -96,16 +96,16 @@ extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
  * instructions were patched in already:
  */
 extern int alternatives_patched;
+struct module;
 
 extern void alternative_instructions(void);
-extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
-extern void apply_retpolines(s32 *start, s32 *end);
-extern void apply_returns(s32 *start, s32 *end);
-extern void apply_seal_endbr(s32 *start, s32 *end);
+extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
+			       struct module *mod);
+extern void apply_retpolines(s32 *start, s32 *end, struct module *mod);
+extern void apply_returns(s32 *start, s32 *end, struct module *mod);
+extern void apply_seal_endbr(s32 *start, s32 *end, struct module *mod);
 extern void apply_fineibt(s32 *start_retpoline, s32 *end_retpoine,
-			  s32 *start_cfi, s32 *end_cfi);
-
-struct module;
+			  s32 *start_cfi, s32 *end_cfi, struct module *mod);
 
 struct callthunk_sites {
 	s32				*call_start, *call_end;
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d17518ca19b8..3407efc26528 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -392,8 +392,10 @@ EXPORT_SYMBOL(BUG_func);
  * Rewrite the "call BUG_func" replacement to point to the target of the
  * indirect pv_ops call "call *disp(%ip)".
  */
-static int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr *a)
+static int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr *a,
+			    struct module *mod)
 {
+	u8 *wr_instr = module_writable_address(mod, instr);
 	void *target, *bug = &BUG_func;
 	s32 disp;
 
@@ -403,14 +405,14 @@ static int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr *a)
 	}
 
 	if (a->instrlen != 6 ||
-	    instr[0] != CALL_RIP_REL_OPCODE ||
-	    instr[1] != CALL_RIP_REL_MODRM) {
+	    wr_instr[0] != CALL_RIP_REL_OPCODE ||
+	    wr_instr[1] != CALL_RIP_REL_MODRM) {
 		pr_err("ALT_FLAG_DIRECT_CALL set for unrecognized indirect call\n");
 		BUG();
 	}
 
 	/* Skip CALL_RIP_REL_OPCODE and CALL_RIP_REL_MODRM */
-	disp = *(s32 *)(instr + 2);
+	disp = *(s32 *)(wr_instr + 2);
 #ifdef CONFIG_X86_64
 	/* ff 15 00 00 00 00   call   *0x0(%rip) */
 	/* target address is stored at "next instruction + disp". */
@@ -448,7 +450,8 @@ static inline u8 * instr_va(struct alt_instr *i)
  * to refetch changed I$ lines.
  */
 void __init_or_module noinline apply_alternatives(struct alt_instr *start,
-						  struct alt_instr *end)
+						  struct alt_instr *end,
+						  struct module *mod)
 {
 	u8 insn_buff[MAX_PATCH_LEN];
 	u8 *instr, *replacement;
@@ -477,6 +480,7 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 	 */
 	for (a = start; a < end; a++) {
 		int insn_buff_sz = 0;
+		u8 *wr_instr, *wr_replacement;
 
 		/*
 		 * In case of nested ALTERNATIVE()s the outer alternative might
@@ -490,7 +494,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		}
 
 		instr = instr_va(a);
+		wr_instr = module_writable_address(mod, instr);
+
 		replacement = (u8 *)&a->repl_offset + a->repl_offset;
+		wr_replacement = module_writable_address(mod, replacement);
+
 		BUG_ON(a->instrlen > sizeof(insn_buff));
 		BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
 
@@ -501,9 +509,9 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		 *   patch if feature is *NOT* present.
 		 */
 		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
-			memcpy(insn_buff, instr, a->instrlen);
+			memcpy(insn_buff, wr_instr, a->instrlen);
 			optimize_nops(instr, insn_buff, a->instrlen);
-			text_poke_early(instr, insn_buff, a->instrlen);
+			text_poke_early(wr_instr, insn_buff, a->instrlen);
 			continue;
 		}
 
@@ -513,11 +521,12 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 			instr, instr, a->instrlen,
 			replacement, a->replacementlen, a->flags);
 
-		memcpy(insn_buff, replacement, a->replacementlen);
+		memcpy(insn_buff, wr_replacement, a->replacementlen);
 		insn_buff_sz = a->replacementlen;
 
 		if (a->flags & ALT_FLAG_DIRECT_CALL) {
-			insn_buff_sz = alt_replace_call(instr, insn_buff, a);
+			insn_buff_sz = alt_replace_call(instr, insn_buff, a,
+							mod);
 			if (insn_buff_sz < 0)
 				continue;
 		}
@@ -527,11 +536,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 		apply_relocation(insn_buff, instr, a->instrlen, replacement, a->replacementlen);
 
-		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
+		DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);
 		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
 		DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
 
-		text_poke_early(instr, insn_buff, insn_buff_sz);
+		text_poke_early(wr_instr, insn_buff, insn_buff_sz);
 	}
 
 	kasan_enable_current();
@@ -722,18 +731,20 @@ static int patch_retpoline(void *addr, struct insn *insn, u8 *bytes)
 /*
  * Generated by 'objtool --retpoline'.
  */
-void __init_or_module noinline apply_retpolines(s32 *start, s32 *end)
+void __init_or_module noinline apply_retpolines(s32 *start, s32 *end,
+						struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 		struct insn insn;
 		int len, ret;
 		u8 bytes[16];
 		u8 op1, op2;
 
-		ret = insn_decode_kernel(&insn, addr);
+		ret = insn_decode_kernel(&insn, wr_addr);
 		if (WARN_ON_ONCE(ret < 0))
 			continue;
 
@@ -761,9 +772,9 @@ void __init_or_module noinline apply_retpolines(s32 *start, s32 *end)
 		len = patch_retpoline(addr, &insn, bytes);
 		if (len == insn.length) {
 			optimize_nops(addr, bytes, len);
-			DUMP_BYTES(RETPOLINE, ((u8*)addr),  len, "%px: orig: ", addr);
+			DUMP_BYTES(RETPOLINE, ((u8*)wr_addr),  len, "%px: orig: ", addr);
 			DUMP_BYTES(RETPOLINE, ((u8*)bytes), len, "%px: repl: ", addr);
-			text_poke_early(addr, bytes, len);
+			text_poke_early(wr_addr, bytes, len);
 		}
 	}
 }
@@ -799,7 +810,8 @@ static int patch_return(void *addr, struct insn *insn, u8 *bytes)
 	return i;
 }
 
-void __init_or_module noinline apply_returns(s32 *start, s32 *end)
+void __init_or_module noinline apply_returns(s32 *start, s32 *end,
+					     struct module *mod)
 {
 	s32 *s;
 
@@ -808,12 +820,13 @@ void __init_or_module noinline apply_returns(s32 *start, s32 *end)
 
 	for (s = start; s < end; s++) {
 		void *dest = NULL, *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 		struct insn insn;
 		int len, ret;
 		u8 bytes[16];
 		u8 op;
 
-		ret = insn_decode_kernel(&insn, addr);
+		ret = insn_decode_kernel(&insn, wr_addr);
 		if (WARN_ON_ONCE(ret < 0))
 			continue;
 
@@ -833,32 +846,35 @@ void __init_or_module noinline apply_returns(s32 *start, s32 *end)
 
 		len = patch_return(addr, &insn, bytes);
 		if (len == insn.length) {
-			DUMP_BYTES(RET, ((u8*)addr),  len, "%px: orig: ", addr);
+			DUMP_BYTES(RET, ((u8*)wr_addr),  len, "%px: orig: ", addr);
 			DUMP_BYTES(RET, ((u8*)bytes), len, "%px: repl: ", addr);
-			text_poke_early(addr, bytes, len);
+			text_poke_early(wr_addr, bytes, len);
 		}
 	}
 }
 #else
-void __init_or_module noinline apply_returns(s32 *start, s32 *end) { }
+void __init_or_module noinline apply_returns(s32 *start, s32 *end,
+					     struct module *mod) { }
 #endif /* CONFIG_MITIGATION_RETHUNK */
 
 #else /* !CONFIG_MITIGATION_RETPOLINE || !CONFIG_OBJTOOL */
 
-void __init_or_module noinline apply_retpolines(s32 *start, s32 *end) { }
-void __init_or_module noinline apply_returns(s32 *start, s32 *end) { }
+void __init_or_module noinline apply_retpolines(s32 *start, s32 *end,
+						struct module *mod) { }
+void __init_or_module noinline apply_returns(s32 *start, s32 *end,
+					     struct module *mod) { }
 
 #endif /* CONFIG_MITIGATION_RETPOLINE && CONFIG_OBJTOOL */
 
 #ifdef CONFIG_X86_KERNEL_IBT
 
-static void poison_cfi(void *addr);
+static void poison_cfi(void *addr, void *wr_addr);
 
-static void __init_or_module poison_endbr(void *addr, bool warn)
+static void __init_or_module poison_endbr(void *addr, void *wr_addr, bool warn)
 {
 	u32 endbr, poison = gen_endbr_poison();
 
-	if (WARN_ON_ONCE(get_kernel_nofault(endbr, addr)))
+	if (WARN_ON_ONCE(get_kernel_nofault(endbr, wr_addr)))
 		return;
 
 	if (!is_endbr(endbr)) {
@@ -873,7 +889,7 @@ static void __init_or_module poison_endbr(void *addr, bool warn)
 	 */
 	DUMP_BYTES(ENDBR, ((u8*)addr), 4, "%px: orig: ", addr);
 	DUMP_BYTES(ENDBR, ((u8*)&poison), 4, "%px: repl: ", addr);
-	text_poke_early(addr, &poison, 4);
+	text_poke_early(wr_addr, &poison, 4);
 }
 
 /*
@@ -882,22 +898,23 @@ static void __init_or_module poison_endbr(void *addr, bool warn)
  * Seal the functions for indirect calls by clobbering the ENDBR instructions
  * and the kCFI hash value.
  */
-void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end)
+void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 
-		poison_endbr(addr, true);
+		poison_endbr(addr, wr_addr, true);
 		if (IS_ENABLED(CONFIG_FINEIBT))
-			poison_cfi(addr - 16);
+			poison_cfi(addr - 16, wr_addr - 16);
 	}
 }
 
 #else
 
-void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
+void __init_or_module apply_seal_endbr(s32 *start, s32 *end, struct module *mod) { }
 
 #endif /* CONFIG_X86_KERNEL_IBT */
 
@@ -1119,7 +1136,7 @@ static u32 decode_caller_hash(void *addr)
 }
 
 /* .retpoline_sites */
-static int cfi_disable_callers(s32 *start, s32 *end)
+static int cfi_disable_callers(s32 *start, s32 *end, struct module *mod)
 {
 	/*
 	 * Disable kCFI by patching in a JMP.d8, this leaves the hash immediate
@@ -1131,20 +1148,23 @@ static int cfi_disable_callers(s32 *start, s32 *end)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
+
 		if (!hash) /* nocfi callers */
 			continue;
 
-		text_poke_early(addr, jmp, 2);
+		text_poke_early(wr_addr, jmp, 2);
 	}
 
 	return 0;
 }
 
-static int cfi_enable_callers(s32 *start, s32 *end)
+static int cfi_enable_callers(s32 *start, s32 *end, struct module *mod)
 {
 	/*
 	 * Re-enable kCFI, undo what cfi_disable_callers() did.
@@ -1154,106 +1174,115 @@ static int cfi_enable_callers(s32 *start, s32 *end)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (!hash) /* nocfi callers */
 			continue;
 
-		text_poke_early(addr, mov, 2);
+		text_poke_early(wr_addr, mov, 2);
 	}
 
 	return 0;
 }
 
 /* .cfi_sites */
-static int cfi_rand_preamble(s32 *start, s32 *end)
+static int cfi_rand_preamble(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 		u32 hash;
 
-		hash = decode_preamble_hash(addr);
+		hash = decode_preamble_hash(wr_addr);
 		if (WARN(!hash, "no CFI hash found at: %pS %px %*ph\n",
 			 addr, addr, 5, addr))
 			return -EINVAL;
 
 		hash = cfi_rehash(hash);
-		text_poke_early(addr + 1, &hash, 4);
+		text_poke_early(wr_addr + 1, &hash, 4);
 	}
 
 	return 0;
 }
 
-static int cfi_rewrite_preamble(s32 *start, s32 *end)
+static int cfi_rewrite_preamble(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 		u32 hash;
 
-		hash = decode_preamble_hash(addr);
+		hash = decode_preamble_hash(wr_addr);
 		if (WARN(!hash, "no CFI hash found at: %pS %px %*ph\n",
 			 addr, addr, 5, addr))
 			return -EINVAL;
 
-		text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
-		WARN_ON(*(u32 *)(addr + fineibt_preamble_hash) != 0x12345678);
-		text_poke_early(addr + fineibt_preamble_hash, &hash, 4);
+		text_poke_early(wr_addr, fineibt_preamble_start, fineibt_preamble_size);
+		WARN_ON(*(u32 *)(wr_addr + fineibt_preamble_hash) != 0x12345678);
+		text_poke_early(wr_addr + fineibt_preamble_hash, &hash, 4);
 	}
 
 	return 0;
 }
 
-static void cfi_rewrite_endbr(s32 *start, s32 *end)
+static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr = module_writable_address(mod, addr);
 
-		poison_endbr(addr+16, false);
+		poison_endbr(addr+16, wr_addr, false);
 	}
 }
 
 /* .retpoline_sites */
-static int cfi_rand_callers(s32 *start, s32 *end)
+static int cfi_rand_callers(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (hash) {
 			hash = -cfi_rehash(hash);
-			text_poke_early(addr + 2, &hash, 4);
+			text_poke_early(wr_addr + 2, &hash, 4);
 		}
 	}
 
 	return 0;
 }
 
-static int cfi_rewrite_callers(s32 *start, s32 *end)
+static int cfi_rewrite_callers(s32 *start, s32 *end, struct module *mod)
 {
 	s32 *s;
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (hash) {
-			text_poke_early(addr, fineibt_caller_start, fineibt_caller_size);
-			WARN_ON(*(u32 *)(addr + fineibt_caller_hash) != 0x12345678);
-			text_poke_early(addr + fineibt_caller_hash, &hash, 4);
+			text_poke_early(wr_addr, fineibt_caller_start, fineibt_caller_size);
+			WARN_ON(*(u32 *)(wr_addr + fineibt_caller_hash) != 0x12345678);
+			text_poke_early(wr_addr + fineibt_caller_hash, &hash, 4);
 		}
 		/* rely on apply_retpolines() */
 	}
@@ -1262,8 +1291,9 @@ static int cfi_rewrite_callers(s32 *start, s32 *end)
 }
 
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
-			    s32 *start_cfi, s32 *end_cfi, bool builtin)
+			    s32 *start_cfi, s32 *end_cfi, struct module *mod)
 {
+	bool builtin = mod ? false : true;
 	int ret;
 
 	if (WARN_ONCE(fineibt_preamble_size != 16,
@@ -1281,7 +1311,7 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	 * rewrite them. This disables all CFI. If this succeeds but any of the
 	 * later stages fails, we're without CFI.
 	 */
-	ret = cfi_disable_callers(start_retpoline, end_retpoline);
+	ret = cfi_disable_callers(start_retpoline, end_retpoline, mod);
 	if (ret)
 		goto err;
 
@@ -1292,11 +1322,11 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
 
-		ret = cfi_rand_preamble(start_cfi, end_cfi);
+		ret = cfi_rand_preamble(start_cfi, end_cfi, mod);
 		if (ret)
 			goto err;
 
-		ret = cfi_rand_callers(start_retpoline, end_retpoline);
+		ret = cfi_rand_callers(start_retpoline, end_retpoline, mod);
 		if (ret)
 			goto err;
 	}
@@ -1308,7 +1338,7 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_KCFI:
-		ret = cfi_enable_callers(start_retpoline, end_retpoline);
+		ret = cfi_enable_callers(start_retpoline, end_retpoline, mod);
 		if (ret)
 			goto err;
 
@@ -1318,17 +1348,17 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 
 	case CFI_FINEIBT:
 		/* place the FineIBT preamble at func()-16 */
-		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
+		ret = cfi_rewrite_preamble(start_cfi, end_cfi, mod);
 		if (ret)
 			goto err;
 
 		/* rewrite the callers to target func()-16 */
-		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
+		ret = cfi_rewrite_callers(start_retpoline, end_retpoline, mod);
 		if (ret)
 			goto err;
 
 		/* now that nobody targets func()+0, remove ENDBR there */
-		cfi_rewrite_endbr(start_cfi, end_cfi);
+		cfi_rewrite_endbr(start_cfi, end_cfi, mod);
 
 		if (builtin)
 			pr_info("Using FineIBT CFI\n");
@@ -1347,7 +1377,7 @@ static inline void poison_hash(void *addr)
 	*(u32 *)addr = 0;
 }
 
-static void poison_cfi(void *addr)
+static void poison_cfi(void *addr, void *wr_addr)
 {
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
@@ -1359,8 +1389,8 @@ static void poison_cfi(void *addr)
 		 *	ud2
 		 * 1:	nop
 		 */
-		poison_endbr(addr, false);
-		poison_hash(addr + fineibt_preamble_hash);
+		poison_endbr(addr, wr_addr, false);
+		poison_hash(wr_addr + fineibt_preamble_hash);
 		break;
 
 	case CFI_KCFI:
@@ -1369,7 +1399,7 @@ static void poison_cfi(void *addr)
 		 *	movl	$0, %eax
 		 *	.skip	11, 0x90
 		 */
-		poison_hash(addr + 1);
+		poison_hash(wr_addr + 1);
 		break;
 
 	default:
@@ -1380,22 +1410,21 @@ static void poison_cfi(void *addr)
 #else
 
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
-			    s32 *start_cfi, s32 *end_cfi, bool builtin)
+			    s32 *start_cfi, s32 *end_cfi, struct module *mod)
 {
 }
 
 #ifdef CONFIG_X86_KERNEL_IBT
-static void poison_cfi(void *addr) { }
+static void poison_cfi(void *addr, void *wr_addr) { }
 #endif
 
 #endif
 
 void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
-		   s32 *start_cfi, s32 *end_cfi)
+		   s32 *start_cfi, s32 *end_cfi, struct module *mod)
 {
 	return __apply_fineibt(start_retpoline, end_retpoline,
-			       start_cfi, end_cfi,
-			       /* .builtin = */ false);
+			       start_cfi, end_cfi, mod);
 }
 
 #ifdef CONFIG_SMP
@@ -1692,16 +1721,16 @@ void __init alternative_instructions(void)
 	paravirt_set_cap();
 
 	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
-			__cfi_sites, __cfi_sites_end, true);
+			__cfi_sites, __cfi_sites_end, NULL);
 
 	/*
 	 * Rewrite the retpolines, must be done before alternatives since
 	 * those can rewrite the retpoline thunks.
 	 */
-	apply_retpolines(__retpoline_sites, __retpoline_sites_end);
-	apply_returns(__return_sites, __return_sites_end);
+	apply_retpolines(__retpoline_sites, __retpoline_sites_end, NULL);
+	apply_returns(__return_sites, __return_sites_end, NULL);
 
-	apply_alternatives(__alt_instructions, __alt_instructions_end);
+	apply_alternatives(__alt_instructions, __alt_instructions_end, NULL);
 
 	/*
 	 * Now all calls are established. Apply the call thunks if
@@ -1712,7 +1741,7 @@ void __init alternative_instructions(void)
 	/*
 	 * Seal all functions that do not have their address taken.
 	 */
-	apply_seal_endbr(__ibt_endbr_seal, __ibt_endbr_seal_end);
+	apply_seal_endbr(__ibt_endbr_seal, __ibt_endbr_seal_end, NULL);
 
 #ifdef CONFIG_SMP
 	/* Patch to UP if other cpus not imminent. */
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 8da0e66ca22d..b498897b213c 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -118,10 +118,13 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
 		return ret;
 
 	/* replace the text with the new text */
-	if (ftrace_poke_late)
+	if (ftrace_poke_late) {
 		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
-	else
-		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
+	} else {
+		mutex_lock(&text_mutex);
+		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
+		mutex_unlock(&text_mutex);
+	}
 	return 0;
 }
 
@@ -318,7 +321,7 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	unsigned const char op_ref[] = { 0x48, 0x8b, 0x15 };
 	unsigned const char retq[] = { RET_INSN_OPCODE, INT3_INSN_OPCODE };
 	union ftrace_op_code_union op_ptr;
-	int ret;
+	void *ret;
 
 	if (ops->flags & FTRACE_OPS_FL_SAVE_REGS) {
 		start_offset = (unsigned long)ftrace_regs_caller;
@@ -349,15 +352,15 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	npages = DIV_ROUND_UP(*tramp_size, PAGE_SIZE);
 
 	/* Copy ftrace_caller onto the trampoline memory */
-	ret = copy_from_kernel_nofault(trampoline, (void *)start_offset, size);
-	if (WARN_ON(ret < 0))
+	ret = text_poke_copy(trampoline, (void *)start_offset, size);
+	if (WARN_ON(!ret))
 		goto fail;
 
 	ip = trampoline + size;
 	if (cpu_feature_enabled(X86_FEATURE_RETHUNK))
 		__text_gen_insn(ip, JMP32_INSN_OPCODE, ip, x86_return_thunk, JMP32_INSN_SIZE);
 	else
-		memcpy(ip, retq, sizeof(retq));
+		text_poke_copy(ip, retq, sizeof(retq));
 
 	/* No need to test direct calls on created trampolines */
 	if (ops->flags & FTRACE_OPS_FL_SAVE_REGS) {
@@ -365,8 +368,7 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 		ip = trampoline + (jmp_offset - start_offset);
 		if (WARN_ON(*(char *)ip != 0x75))
 			goto fail;
-		ret = copy_from_kernel_nofault(ip, x86_nops[2], 2);
-		if (ret < 0)
+		if (!text_poke_copy(ip, x86_nops[2], 2))
 			goto fail;
 	}
 
@@ -379,7 +381,7 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	 */
 
 	ptr = (unsigned long *)(trampoline + size + RET_SIZE);
-	*ptr = (unsigned long)ops;
+	text_poke_copy(ptr, &ops, sizeof(unsigned long));
 
 	op_offset -= start_offset;
 	memcpy(&op_ptr, trampoline + op_offset, OP_REF_SIZE);
@@ -395,7 +397,7 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	op_ptr.offset = offset;
 
 	/* put in the new offset to the ftrace_ops */
-	memcpy(trampoline + op_offset, &op_ptr, OP_REF_SIZE);
+	text_poke_copy(trampoline + op_offset, &op_ptr, OP_REF_SIZE);
 
 	/* put in the call to the function */
 	mutex_lock(&text_mutex);
@@ -405,9 +407,9 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	 * the depth accounting before the call already.
 	 */
 	dest = ftrace_ops_get_func(ops);
-	memcpy(trampoline + call_offset,
-	       text_gen_insn(CALL_INSN_OPCODE, trampoline + call_offset, dest),
-	       CALL_INSN_SIZE);
+	text_poke_copy_locked(trampoline + call_offset,
+	      text_gen_insn(CALL_INSN_OPCODE, trampoline + call_offset, dest),
+	      CALL_INSN_SIZE, false);
 	mutex_unlock(&text_mutex);
 
 	/* ALLOC_TRAMP flags lets us know we created it */
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 837450b6e882..8984abd91c00 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -146,18 +146,21 @@ static int __write_relocate_add(Elf64_Shdr *sechdrs,
 		}
 
 		if (apply) {
-			if (memcmp(loc, &zero, size)) {
+			void *wr_loc = module_writable_address(me, loc);
+
+			if (memcmp(wr_loc, &zero, size)) {
 				pr_err("x86/modules: Invalid relocation target, existing value is nonzero for type %d, loc %p, val %Lx\n",
 				       (int)ELF64_R_TYPE(rel[i].r_info), loc, val);
 				return -ENOEXEC;
 			}
-			write(loc, &val, size);
+			write(wr_loc, &val, size);
 		} else {
 			if (memcmp(loc, &val, size)) {
 				pr_warn("x86/modules: Invalid relocation target, existing value does not match expected value for type %d, loc %p, val %Lx\n",
 					(int)ELF64_R_TYPE(rel[i].r_info), loc, val);
 				return -ENOEXEC;
 			}
+			/* FIXME: needs care for ROX module allocations */
 			write(loc, &zero, size);
 		}
 	}
@@ -224,7 +227,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
 {
-	const Elf_Shdr *s, *alt = NULL, *locks = NULL,
+	const Elf_Shdr *s, *alt = NULL,
 		*orc = NULL, *orc_ip = NULL,
 		*retpolines = NULL, *returns = NULL, *ibt_endbr = NULL,
 		*calls = NULL, *cfi = NULL;
@@ -233,8 +236,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 	for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
 		if (!strcmp(".altinstructions", secstrings + s->sh_name))
 			alt = s;
-		if (!strcmp(".smp_locks", secstrings + s->sh_name))
-			locks = s;
 		if (!strcmp(".orc_unwind", secstrings + s->sh_name))
 			orc = s;
 		if (!strcmp(".orc_unwind_ip", secstrings + s->sh_name))
@@ -265,20 +266,20 @@ int module_finalize(const Elf_Ehdr *hdr,
 			csize = cfi->sh_size;
 		}
 
-		apply_fineibt(rseg, rseg + rsize, cseg, cseg + csize);
+		apply_fineibt(rseg, rseg + rsize, cseg, cseg + csize, me);
 	}
 	if (retpolines) {
 		void *rseg = (void *)retpolines->sh_addr;
-		apply_retpolines(rseg, rseg + retpolines->sh_size);
+		apply_retpolines(rseg, rseg + retpolines->sh_size, me);
 	}
 	if (returns) {
 		void *rseg = (void *)returns->sh_addr;
-		apply_returns(rseg, rseg + returns->sh_size);
+		apply_returns(rseg, rseg + returns->sh_size, me);
 	}
 	if (alt) {
 		/* patch .altinstructions */
 		void *aseg = (void *)alt->sh_addr;
-		apply_alternatives(aseg, aseg + alt->sh_size);
+		apply_alternatives(aseg, aseg + alt->sh_size, me);
 	}
 	if (calls || alt) {
 		struct callthunk_sites cs = {};
@@ -297,8 +298,28 @@ int module_finalize(const Elf_Ehdr *hdr,
 	}
 	if (ibt_endbr) {
 		void *iseg = (void *)ibt_endbr->sh_addr;
-		apply_seal_endbr(iseg, iseg + ibt_endbr->sh_size);
+		apply_seal_endbr(iseg, iseg + ibt_endbr->sh_size, me);
 	}
+
+	if (orc && orc_ip)
+		unwind_module_init(me, (void *)orc_ip->sh_addr, orc_ip->sh_size,
+				   (void *)orc->sh_addr, orc->sh_size);
+
+	return 0;
+}
+
+int module_post_finalize(const Elf_Ehdr *hdr,
+			 const Elf_Shdr *sechdrs,
+			 struct module *me)
+{
+	const Elf_Shdr *s, *locks = NULL;
+	char *secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
+		if (!strcmp(".smp_locks", secstrings + s->sh_name))
+			locks = s;
+	}
+
 	if (locks) {
 		void *lseg = (void *)locks->sh_addr;
 		void *text = me->mem[MOD_TEXT].base;
@@ -308,10 +329,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 					    text, text_end);
 	}
 
-	if (orc && orc_ip)
-		unwind_module_init(me, (void *)orc_ip->sh_addr, orc_ip->sh_size,
-				   (void *)orc->sh_addr, orc->sh_size);
-
 	return 0;
 }
 
-- 
2.43.0


