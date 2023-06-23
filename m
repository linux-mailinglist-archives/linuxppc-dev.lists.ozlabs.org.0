Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41873BD75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkHz3fL7z3dRJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkCw5SBqz3c1R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCW1Dnbz9sgb;
	Fri, 23 Jun 2023 19:05:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbRYBzS1my8F; Fri, 23 Jun 2023 19:05:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCR55D7z9sgV;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A99B08B763;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0-3xKf3bt8fl; Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 870108B787;
	Fri, 23 Jun 2023 19:05:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5msl2645773
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:48 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5mj82645770;
	Fri, 23 Jun 2023 19:05:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 10/15] objtool: Add support for relative switch tables
Date: Fri, 23 Jun 2023 19:05:21 +0200
Message-Id: <14330deb46bf212ed1f05177ee2aa671501ba549.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687539638.git.christophe.leroy@csgroup.eu>
References: <cover.1687539638.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539922; l=3463; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=r21iVHTcLsyayQ64RiuGyq7u+HchS/YEeh6pwhGw+Js=; b=X8oWk4WZXKkCDSkt0YQClGH0IiqMjrDvnAFSmbcax32j1PsWt3V3wlvhxQjUWxw5laONRtb1a q4vTPBIQCb4B2pXOzIv/VJKlPAAa0wRuSX4djGjJ7wvdvnjvFPPZwfG
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index ae4a1608d97e..05d789e6d3b6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1988,7 +1988,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct symbol *pfunc = insn_func(insn)->pfunc;
 	struct reloc *table = insn_jump_table(insn);
 	struct instruction *dest_insn;
-	unsigned int prev_offset = 0;
+	unsigned int offset, prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
 
@@ -2003,7 +2003,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			break;
 
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
+		if (prev_offset && reloc_offset(reloc) != prev_offset + elf_addr_size(file->elf))
 			break;
 
 		/* Detect function pointers from contiguous objects: */
@@ -2011,7 +2011,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
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
2.40.1

