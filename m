Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105D5A960B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJKBL053mz3f6W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:51:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJK8c0FTHz3bvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:49:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJK7x5nKXz9sp7;
	Thu,  1 Sep 2022 13:49:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_wpoKJ4Y3le; Thu,  1 Sep 2022 13:49:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJK7t3Bdyz9spK;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5273B8B78B;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s9ZW1m4P1APg; Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.131])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B0A938B783;
	Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 281BmrXT1768885
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 13:48:53 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 281Bmrxa1768884;
	Thu, 1 Sep 2022 13:48:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, bgray@linux.ibm.com, agust@denx.de,
        jpoimboe@kernel.org, peterz@infradead.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com
Subject: [PATCH v3 2/6] objtool: Add architecture specific R_REL32 macro
Date: Thu,  1 Sep 2022 13:48:21 +0200
Message-Id: <1cfa46b215a2f39c7f8040ca5447113ff9eb7dd6.1662032631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1662032631.git.christophe.leroy@csgroup.eu>
References: <cover.1662032631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662032901; l=4020; s=20211009; h=from:subject:message-id; bh=OwWd8M/uxNS//G6btleZ+TKvvyn6i2rlmDFSETA0yzo=; b=Qcp0XcUREdwBT/PTHmgZOVSB/qOvqsTcwoTlJ9h0EXsNki+wIql6XaVhuZHfpJDTUT11+IPrUMjB +E1LcnT0DhF/8Bo05rGL0TOpcYM6C+Sf9PuBh7dkDxIxiQb8SOwu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: chenzhongjin@huawei.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to allow other architectures than x86 to use 32 bits
PC relative relocations (S+A-P), define a R_REL32 macro that each
architecture will define, in the same way as already done for
R_NONE, R_ABS32 and R_ABS64.

For x86 that corresponds to R_X86_64_PC32.
For powerpc it is R_PPC_REL32/R_PPC64_REL32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Added powerpc in the patch
v2: Improved commit message based on feedback from Segher
---
 tools/objtool/arch/powerpc/include/arch/elf.h |  1 +
 tools/objtool/arch/x86/include/arch/elf.h     |  1 +
 tools/objtool/check.c                         | 10 +++++-----
 tools/objtool/orc_gen.c                       |  2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/arch/powerpc/include/arch/elf.h b/tools/objtool/arch/powerpc/include/arch/elf.h
index 73f9ae172fe5..befc2e30d38b 100644
--- a/tools/objtool/arch/powerpc/include/arch/elf.h
+++ b/tools/objtool/arch/powerpc/include/arch/elf.h
@@ -6,5 +6,6 @@
 #define R_NONE R_PPC_NONE
 #define R_ABS64 R_PPC64_ADDR64
 #define R_ABS32 R_PPC_ADDR32
+#define R_REL32 R_PPC_REL32 /* R_PPC64_REL32 is identical */
 
 #endif /* _OBJTOOL_ARCH_ELF */
diff --git a/tools/objtool/arch/x86/include/arch/elf.h b/tools/objtool/arch/x86/include/arch/elf.h
index ac14987cf687..e7d228c686db 100644
--- a/tools/objtool/arch/x86/include/arch/elf.h
+++ b/tools/objtool/arch/x86/include/arch/elf.h
@@ -4,5 +4,6 @@
 #define R_NONE R_X86_64_NONE
 #define R_ABS64 R_X86_64_64
 #define R_ABS32 R_X86_64_32
+#define R_REL32	R_X86_64_PC32
 
 #endif /* _OBJTOOL_ARCH_ELF */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9ee48d0761f0..00fdaa86db70 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -655,7 +655,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'addr' */
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(struct static_call_site),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -696,7 +696,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'key' */
 		if (elf_add_reloc(file->elf, sec,
 				  idx * sizeof(struct static_call_site) + 4,
-				  R_X86_64_PC32, key_sym,
+				  R_REL32, key_sym,
 				  is_sibling_call(insn) * STATIC_CALL_SITE_TAIL))
 			return -1;
 
@@ -740,7 +740,7 @@ static int create_retpoline_sites_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .retpoline_sites");
 			return -1;
@@ -838,7 +838,7 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .ibt_endbr_seal");
 			return -1;
@@ -4004,7 +4004,7 @@ static int validate_ibt_insn(struct objtool_file *file, struct instruction *insn
 			continue;
 
 		off = reloc->sym->offset;
-		if (reloc->type == R_X86_64_PC32 || reloc->type == R_X86_64_PLT32)
+		if (reloc->type == R_REL32 || reloc->type == R_X86_64_PLT32)
 			off += arch_dest_reloc_offset(reloc->addend);
 		else
 			off += reloc->addend;
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 1f22b7ebae58..49a877b9c879 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -101,7 +101,7 @@ static int write_orc_entry(struct elf *elf, struct section *orc_sec,
 	orc->bp_offset = bswap_if_needed(elf, orc->bp_offset);
 
 	/* populate reloc for ip */
-	if (elf_add_reloc_to_insn(elf, ip_sec, idx * sizeof(int), R_X86_64_PC32,
+	if (elf_add_reloc_to_insn(elf, ip_sec, idx * sizeof(int), R_REL32,
 				  insn_sec, insn_off))
 		return -1;
 
-- 
2.37.1

