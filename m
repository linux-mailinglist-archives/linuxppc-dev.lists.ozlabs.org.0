Return-Path: <linuxppc-dev+bounces-5309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C738A12E99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:50:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmk4zlFz3cbX;
	Thu, 16 Jan 2025 09:50:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981414;
	cv=none; b=kqPaF9A5dA4ZXrmENSyVWsFiMTdhdZWlYnvVU6SPWUWQ7dxCUuchYYWUs8pNJODZ9uRPTBGzdZB9R3MBCC6pV6u0Xnoh87wMGXGhQ3mBlBBO+7aGAeF66eg/Y+VsbAvF4XzGWHC1iT/cXwpLXbG/z7tVqXxhHGm9LT28J2EKB1ufTGNJIpRw+n8z/9EsxgvFilS0ipjU4ZCYMDwuIZ9zbZ6CCJkvIHF6Srk1jQFVoTm+kHJT83RKV781boTOuU/b+uewNbn2yPE9lJwIxkkWfyCY8K6yTZZYW4JBfLM/W6JHjhaGA/QpFcaXC+LoOPUl0iK3hh8YzOPMInsvnDQuew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981414; c=relaxed/relaxed;
	bh=ncJ55Tl+W/9nuqBTVL/Tyo2N/pRMQ4Sd8uEOgz2Bw3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c59BiA3H8gUeyHbtrqPHTTcu44BYc90JroxDI2v35zQ8UQMa0sPbD2cCGbmpVIp08yp+PIMqjx8BXYfmo3136ktlCaDT5VNByxKY0m2GetGd5Sdz4igX6f71MhAN9+fRMsTIkc3h2GVayXGYTZ/v/uRn7CfVzP1n9u0rNv5ezENzPV5YxPvMg5rynbRIan8hag3IEhowqgWH1YUWafWO0es4g85pXR8houQYtoKcw9rlNtB/ncUrAOGoGc4aqiMZiJh8wggUZnFgfUhTjM9maaq8UGIbBDT5RuQJDMvU1YnXBRzsBBhYqLcr1Bhhabzd+o09q1ME2dc5pcMh0cGycw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmj6sC4z2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcR1LrKz9sSL;
	Wed, 15 Jan 2025 23:43:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb_q4sKRoTO4; Wed, 15 Jan 2025 23:43:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcR09klz9sSK;
	Wed, 15 Jan 2025 23:43:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8F908B77A;
	Wed, 15 Jan 2025 23:43:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xP54RDpKO_cp; Wed, 15 Jan 2025 23:43:02 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 432CA8B774;
	Wed, 15 Jan 2025 23:42:59 +0100 (CET)
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
Subject: [PATCH v5 05/15] objtool: Add INSN_RETURN_CONDITIONAL
Date: Wed, 15 Jan 2025 23:42:45 +0100
Message-ID: <537e5d8f181b1f1c2b8918f1aefa1dba3f972c03.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=3391; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=fxh6MSeYgn++RudIjNcYn69iUXicHtRIQBFpkzWYb8Q=; b=jvHbYKz3q4JJ4G7AnJq6DHGhOgfwQATdZWWKk0hsbDSMM1eyb1Nf9zLMZ1MbrPVgf8PziSN3Y BbpOYDdYJWRDwizo/BZDBd4QZXTIkm0xt/xnp+eiOBqTTm/uvR2awTA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Most functions have an unconditional return at the end, like
this one:

	00000000 <is_exec_fault>:
	   0:	81 22 04 d0 	lwz     r9,1232(r2)
	   4:	38 60 00 00 	li      r3,0
	   8:	2c 09 00 00 	cmpwi   r9,0
	   c:	4d 82 00 20 	beqlr		<== Conditional return
	  10:	80 69 00 a0 	lwz     r3,160(r9)
	  14:	54 63 00 36 	clrrwi  r3,r3,4
	  18:	68 63 04 00 	xori    r3,r3,1024
	  1c:	7c 63 00 34 	cntlzw  r3,r3
	  20:	54 63 d9 7e 	srwi    r3,r3,5
	  24:	4e 80 00 20 	blr		<== Unconditional return

But other functions like this other one below only have
conditional returns:

	00000028 <pte_update.isra.0>:
	  28:	81 25 00 00 	lwz     r9,0(r5)
	  2c:	2c 08 00 00 	cmpwi   r8,0
	  30:	7d 29 30 78 	andc    r9,r9,r6
	  34:	7d 27 3b 78 	or      r7,r9,r7
	  38:	54 84 65 3a 	rlwinm  r4,r4,12,20,29
	  3c:	81 23 00 18 	lwz     r9,24(r3)
	  40:	41 82 00 58 	beq     98 <pte_update.isra.0+0x70>
	  44:	7d 29 20 2e 	lwzx    r9,r9,r4
	  48:	55 29 07 3a 	rlwinm  r9,r9,0,28,29
	  4c:	2c 09 00 0c 	cmpwi   r9,12
	  50:	41 82 00 08 	beq     58 <pte_update.isra.0+0x30>
	  54:	39 00 00 80 	li      r8,128
	  58:	2c 08 00 01 	cmpwi   r8,1
	  5c:	90 e5 00 00 	stw     r7,0(r5)
	  60:	4d a2 00 20 	beqlr+		<== Conditional return
	  64:	7c e9 3b 78 	mr      r9,r7
	  68:	39 40 00 00 	li      r10,0
	  6c:	39 4a 00 04 	addi    r10,r10,4
	  70:	7c 0a 40 00 	cmpw    r10,r8
	  74:	91 25 00 04 	stw     r9,4(r5)
	  78:	91 25 00 08 	stw     r9,8(r5)
	  7c:	38 a5 00 10 	addi    r5,r5,16
	  80:	91 25 ff fc 	stw     r9,-4(r5)
	  84:	4c 80 00 20 	bgelr		<== Conditional return
	  88:	55 49 60 26 	slwi    r9,r10,12
	  8c:	7d 29 3a 14 	add     r9,r9,r7
	  90:	91 25 00 00 	stw     r9,0(r5)
	  94:	4b ff ff d8 	b       6c <pte_update.isra.0+0x44>
	  98:	39 00 00 04 	li      r8,4
	  9c:	4b ff ff bc 	b       58 <pte_update.isra.0+0x30>

If conditional returns are decoded as INSN_OTHER, objtool considers
that the second function never returns.

If conditional returns are decoded as INSN_RETURN, objtool considers
that code after that conditional return is dead.

To overcome this situation, introduce INSN_RETURN_CONDITIONAL which
is taken as a confirmation that a function is not noreturn but still
sees following code as reachable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 tools/objtool/check.c                | 2 +-
 tools/objtool/include/objtool/arch.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 58d9b1a750e3..10979d68103d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -279,7 +279,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 	func_for_each_insn(file, func, insn) {
 		empty = false;
 
-		if (insn->type == INSN_RETURN)
+		if (insn->type == INSN_RETURN || insn->type == INSN_RETURN_CONDITIONAL)
 			return false;
 	}
 
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index d63b46a19f39..900601e2f22b 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -19,6 +19,7 @@ enum insn_type {
 	INSN_CALL,
 	INSN_CALL_DYNAMIC,
 	INSN_RETURN,
+	INSN_RETURN_CONDITIONAL,
 	INSN_CONTEXT_SWITCH,
 	INSN_BUG,
 	INSN_NOP,
-- 
2.47.0


