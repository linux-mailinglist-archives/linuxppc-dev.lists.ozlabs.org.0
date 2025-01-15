Return-Path: <linuxppc-dev+bounces-5316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB70A12EA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnK03Mfz3dBD;
	Thu, 16 Jan 2025 09:50:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981444;
	cv=none; b=lWM11lwh5SDGrywLi3ivN/X+xFrTs4ymvv6IPDJrKEZYKPII1u4X++GVGWvU3WXGCcqWHYOrJMG+95geCGtCilQAL0Zpmod5N0mYVJypdF6pmUBKhSl3NktDnI6ypvQgbmR5n8SIReSbcti0a02kUryd2sqoWn5d3WMjVnA6DpP0kV827wmmDccImPGbvyfTrg1lULH9zKyuLTQ7LFDnE4Rhl2uK/bZT5DGOZlrcda/ReISlNlsujl2Y/z0GFkbd1uQnUJhrazKCntdy1IDM92X0BLw7gDsZfswM889R2aDXPKg01Q1l1sCv2GHEUMPJqgn5cVEmO2Za2R1/U0NYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981444; c=relaxed/relaxed;
	bh=Pqc/zgDbm/l7oKTqq+IU6CroXy7+EuMbi/fx0qhpP3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXcN3mHv6+ZQvGmFrsU+X8QKBHMI69dG+MFrum/dopzvBUYJlhR5yR26QJweVW1p3mJ1X+6cSU4JVC7DgQIzy1I036mVabri9XsYL14b6lc2lAU+VU3jn5WQ6Sji00Hz3mHRJ5slymGqFgrxMN8GUK2V5RrzN4iWhdGw+eRTOn0dhEqV+2uur2bwJ7UqmbMklvDtn9jNL/J9edXu8U4swYXDpNQ7DbMdccAj5D29B0O/UKuXNz9kCgRsyPND2WfTcU7I474gJ5Utnzzb7DphwviAVxMSryg7v/POAeAaKlF/YVakrtTWQGx46LeWrJKitbK2HnE7wijF8QGmUiquPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnJ3NNvz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:44 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcg4pRZz9sSc;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdwoUHxHyRny; Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcg43nvz9sSZ;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 75C5F8B77A;
	Wed, 15 Jan 2025 23:43:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3fVrbZ-f6jS4; Wed, 15 Jan 2025 23:43:15 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 498838B774;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
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
Subject: [PATCH v5 10/15] objtool: When looking for switch tables also follow conditional and dynamic jumps
Date: Wed, 15 Jan 2025 23:42:50 +0100
Message-ID: <a191a5fb599889c3c64489adaf6adfe38746035d.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=1637; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JuwlSgEwF/YR6LrF/3dyTUkenLYF1P/hJhBSM22DTYs=; b=6n79kSoRqJEkcLY6Y1MpivBmSAT/lzEzZyAMGNN3v6mvPqEx/uoTD+ysqCfWtDqZDQCsWhr20 HH+SYrmEjHED2JmmWjRWWspBKF4dphfKId01AsZ6iKYLf6WU0zSih5j
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When walking backward to find the base address of a switch table,
also take into account conditionnal branches and dynamic jumps from
a previous switch table.

To avoid mis-routing, break when stumbling on a function return.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 0ad2bdd92232..87b81d8e01c0 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1998,6 +1998,8 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		alt->next = insn->alts;
 		insn->alts = alt;
 		prev_offset = reloc_offset(reloc);
+		if (!dest_insn->first_jump_src)
+			dest_insn->first_jump_src = insn;
 	}
 
 	if (!prev_offset) {
@@ -2032,6 +2034,9 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		    insn->gpr == orig_insn->gpr)
 			break;
 
+		if (insn->type == INSN_RETURN)
+			break;
+
 		/* allow small jumps within the range */
 		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
 		    insn->jump_dest &&
@@ -2093,8 +2098,7 @@ static int mark_add_func_jump_tables(struct objtool_file *file,
 		 * that find_jump_table() can back-track using those and
 		 * avoid some potentially confusing code.
 		 */
-		if (insn->type == INSN_JUMP_UNCONDITIONAL && insn->jump_dest &&
-		    insn->offset > last->offset &&
+		if (is_static_jump(insn) && insn->jump_dest &&
 		    insn->jump_dest->offset > insn->offset &&
 		    !insn->jump_dest->first_jump_src) {
 
-- 
2.47.0


