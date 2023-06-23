Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79273BD6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkGt1MHFz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:08:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkCp3xV4z3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCT6bxBz9sgY;
	Fri, 23 Jun 2023 19:05:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkdhzeiHZVil; Fri, 23 Jun 2023 19:05:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCR4VNXz9sgb;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 927158B788;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ut0rHJhLxbNN; Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CD298B781;
	Fri, 23 Jun 2023 19:05:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5mDh2645767
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:48 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5m1f2645766;
	Fri, 23 Jun 2023 19:05:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 09/15] objtool: Add INSN_RETURN_CONDITIONAL
Date: Fri, 23 Jun 2023 19:05:20 +0200
Message-Id: <d982d07b9c57e3732596b5c2b4c4a96b484d0d2b.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687539638.git.christophe.leroy@csgroup.eu>
References: <cover.1687539638.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539922; l=3391; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7CpgcGdMVWI2mLfHq7VUN7XPsBJqiK3HaJtUvlq5sSw=; b=nIeUQUBppSc3JGIpSCY2G3rvjgh/e4aSE/z91I4QzRDFuokpgx3wwLUw/o6RpSq7+bcUk9iY9 vsYl6sNv4u1Bagk9Qho98xrx8RpJD6n/Cfrp5VICTR0qWjqmPrfj/Hz
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
index 8936a05f0e5a..ae4a1608d97e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -219,7 +219,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 	func_for_each_insn(file, func, insn) {
 		empty = false;
 
-		if (insn->type == INSN_RETURN)
+		if (insn->type == INSN_RETURN || insn->type == INSN_RETURN_CONDITIONAL)
 			return false;
 	}
 
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 2b6d2ce4f9a5..84ba75112934 100644
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
2.40.1

