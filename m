Return-Path: <linuxppc-dev+bounces-5319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DBA12EAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnZ3xtqz3cf8;
	Thu, 16 Jan 2025 09:50:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981458;
	cv=none; b=Eegz25pojI2lnjUd/LOqLf419lradsDvIb1nxO2W+O5iqHFUbCriOkSHllaIumbLoer4751Gc+wZpd/UwfTkGWArAmKWLbwwXkscmrHJd0eZgX3QHSfmuozBZjiLlhO2QHcsaReYIHFbUHnPjKVAJJUg91bpgPr4oE1W8z9uzpRo/nfEbIAJWD6dbMaEyrteCfrkhIw+QlbT1giRNSBqqyZrfLCOBIWuvpNxPb39Z7EFLoxQhtsObMGOWg+qIbIuuW/qLglfzaV0B3s+8bXuXPOdyDKDIq69mPC29d+vkM9FuLSGCQCrKWGEvVC/HWaFPWY6gz/nVwkpNiIcCuIdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981458; c=relaxed/relaxed;
	bh=OBCi5rnMDRyKsRJYbRgEarPlFdcCHWqrLFtXHsgxTnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnzBVmfFbt2rnmSCm31jy2qP93IwuoLLW/ss5bCuI6Dg7Ke/lbGUK35xi6y7q0yqzDTlbfTu98qBBAlKojg9Crk22U8fR+KmW2jWvp4qls+MCd75lylASC0XIxOVu1x5EqyGELbPiCzpFm7zyK60LqLfbGak+PY0C2R0NVWExlCWrGTxv18Mp9wbKmLj7BUYKhU7JfduvVVqUUFNvftixh+1PEcP7ce+K/NKsiiOJ6OePHl7XhBxILBNxQPSOwemPZ03iuK86d4VjtaFtjRTIrtzBd8e29WNn43ojJe4OGPRO4S0YkndvHE1YR1sxqfbrbVTyd6JGy7oKGL0wQMmEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnY6Gfhz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcT5fpGz9sSR;
	Wed, 15 Jan 2025 23:43:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGI684IZnpuz; Wed, 15 Jan 2025 23:43:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcT4rZ8z9sSN;
	Wed, 15 Jan 2025 23:43:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 965228B77A;
	Wed, 15 Jan 2025 23:43:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jnXJZo8I46BV; Wed, 15 Jan 2025 23:43:05 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 09BDD8B774;
	Wed, 15 Jan 2025 23:43:02 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 06/15] objtool: Add support for relative switch tables
Date: Wed, 15 Jan 2025 23:42:46 +0100
Message-ID: <3b380e5e0cf3e54304d52c45a551fb7a6c9627bb.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=3463; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=fqttkCOH/DPr21Jy9pk9KHcyBNc9VVe/REU9Zsv+9Qk=; b=LSTIL6frG7RFbeahKwa9DSgA5iHcfOsT5UT1LBv1jKoVYMhtlqEAlpQ79RgFph57SAcqPHakA HQg/1M/i9PRCRCSSTD6yf4l8b8Mja8Pyf0Hr5TyVJZwDlTzgvcxU+7c
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On powerpc, switch tables are relative, than means the address of the
table is added to the value of the entry in order to get the pointed
address: (r10 is the table address, r4 the index in the table)

      lis     r10,0		<== Load r10 with upper part of .rodata address
          R_PPC_ADDR16_HA     .rodata
      addi    r10,r10,0		<== Add lower part of .rodata address
          R_PPC_ADDR16_LO     .rodata
      lwzx    r8,r10,r4		<== Read table entry at r10 + r4 into r8
      add     r10,r8,r10	<== Add table address to read value
      mtctr   r10		<== Save calculated address in CTR
      bctr			<== Branch to address in CTR

      RELOCATION RECORDS FOR [.rodata]:
      OFFSET   TYPE              VALUE
      00000000 R_PPC_REL32       .text+0x0000054c
      00000004 R_PPC_REL32       .text+0x000003d0
	...

But for c_jump_tables it is not the case, they contain the
pointed address directly:

      lis     r28,0		<== Load r28 with upper .rodata..c_jump_table
          R_PPC_ADDR16_HA   .rodata..c_jump_table
      addi    r28,r28,0		<== Add lower part of .rodata..c_jump_table
          R_PPC_ADDR16_LO   .rodata..c_jump_table
      lwzx    r10,r28,r10	<== Read table entry at r10 + r28 into r10
      mtctr   r10		<== Save read value in CTR
      bctr			<== Branch to address in CTR

      RELOCATION RECORDS FOR [.rodata..c_jump_table]:
      OFFSET   TYPE              VALUE
      00000000 R_PPC_ADDR32      .text+0x00000dc8
      00000004 R_PPC_ADDR32      .text+0x00000dc8
	...

Add support to objtool for relative tables, based on the relocation
type which is R_PPC_REL32 for switch tables and R_PPC_ADDR32 for
C jump tables. Do the comparison using R_ABS32 and R_ABS64 which are
architecture agnostic.

And use correct size for 'long' instead of hard coding a size of '8'.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 10979d68103d..4495e7823b29 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1950,7 +1950,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct symbol *pfunc = insn_func(insn)->pfunc;
 	struct reloc *table = insn_jump_table(insn);
 	struct instruction *dest_insn;
-	unsigned int prev_offset = 0;
+	unsigned int offset, prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
 
@@ -1967,7 +1967,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			break;
 
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
+		if (prev_offset && reloc_offset(reloc) != prev_offset + elf_addr_size(file->elf))
 			break;
 
 		/* Detect function pointers from contiguous objects: */
@@ -1975,7 +1975,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		    reloc_addend(reloc) == pfunc->offset)
 			break;
 
-		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (reloc_type(reloc) == R_ABS32 || reloc_type(reloc) == R_ABS64)
+			offset = reloc_addend(reloc);
+		else
+			offset = reloc_addend(reloc) + reloc_offset(table) - reloc_offset(reloc);
+
+		dest_insn = find_insn(file, reloc->sym->sec, offset);
 		if (!dest_insn)
 			break;
 
-- 
2.47.0


