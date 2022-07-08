Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6B56BE80
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfgR51MNhz3fd2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 03:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfgMx3T83z3cjQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 03:32:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LfgMM1wDHz9tK2;
	Fri,  8 Jul 2022 19:32:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYBvPg-FllTN; Fri,  8 Jul 2022 19:32:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LfgMF3Zqkz9tMK;
	Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 646008B7A0;
	Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 87xHo-gisBWW; Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C84D28B79F;
	Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 268HW43V1000736
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 8 Jul 2022 19:32:04 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 268HW48o1000734;
	Fri, 8 Jul 2022 19:32:04 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, agust@denx.de, jpoimboe@kernel.org,
        peterz@infradead.org, jbaron@akamai.com, rostedt@goodmis.org,
        ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com
Subject: [PATCH v2 3/7] objtool: Add architecture specific R_REL32 macro
Date: Fri,  8 Jul 2022 19:31:22 +0200
Message-Id: <44a10adfc8a343416115456d09e234e2e0bca757.1657301423.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657301423.git.christophe.leroy@csgroup.eu>
References: <cover.1657301423.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657301483; l=3463; s=20211009; h=from:subject:message-id; bh=XFZ/nZNDunnD1Hp5+OJHS9YxS2TlTFL6V6h3uWnUhgY=; b=KkCuwHdJGeCBLD3QcBlnRdxLWmPwRIKuUR+KY8tpcRUF6Dd2faB2gkNco8ppL4oVDmfXQ8ZvUJ5L 78V4RklkDSyZvZn5AuN1kv9txPwQNB1Qah/eNpDCOISkd6vtktUs
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
For powerpc it will be R_PPC_REL32/R_PPC64_REL32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Improved commit message based on feedback from Segher
---
 tools/objtool/arch/x86/include/arch/elf.h |  1 +
 tools/objtool/check.c                     | 10 +++++-----
 tools/objtool/orc_gen.c                   |  2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

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
index dec42a226048..ba8fd313372c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -652,7 +652,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'addr' */
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(struct static_call_site),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -693,7 +693,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'key' */
 		if (elf_add_reloc(file->elf, sec,
 				  idx * sizeof(struct static_call_site) + 4,
-				  R_X86_64_PC32, key_sym,
+				  R_REL32, key_sym,
 				  is_sibling_call(insn) * STATIC_CALL_SITE_TAIL))
 			return -1;
 
@@ -737,7 +737,7 @@ static int create_retpoline_sites_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .retpoline_sites");
 			return -1;
@@ -789,7 +789,7 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .ibt_endbr_seal");
 			return -1;
@@ -3718,7 +3718,7 @@ static int validate_ibt_insn(struct objtool_file *file, struct instruction *insn
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
2.36.1

