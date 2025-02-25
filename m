Return-Path: <linuxppc-dev+bounces-6455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985DBA4374A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 09:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z29Wp18sNz30TP;
	Tue, 25 Feb 2025 19:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740471606;
	cv=none; b=AoZ2tFP3/i3od85ExvHjJttVnyUtpvcIwGMRLi5aE6LWTgvXpGsh7+nSLvGaSaa50vG6f8XopzZmv03EFzYVar9gwH7rmLLGXXG/5AeDGbftZacGbfqeia/aOYQDIgxLLeU5hzmqNV9GhjJe2tairRfXxIvfAeTO8mPbKDfX0ZPhHo1IUbnViLcFhHWtAqxTkWj7zPfmjEDkA+e+f0+vwjgqr2emlfYzPgsyEXVdbWKs87iDtMpQto74UIns7lEt7GUMsgyX9uNGLi9rSi8EhsQ4WfnGuqSUXFfG+wL2ZcqR6wSGmd1dMsT5Vz39M9F0Bp9Gaz/F6EPk5s4kagmkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740471606; c=relaxed/relaxed;
	bh=3CGxW0IhmgYPl5LFhfxqkq4UzTFam36fdRHyt2d1V6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gG+mrCcg0GmpdtsZeDmBvujgOY8yxrSor2B8mJagRuhWtmSkM9qzR4L2ZluWaoonotSXEagjcDgvnSLymAN5IEGErVKTRNw+av5k6Lmd9toa2Av+MHMmdRM4px+dz2eqUtMFrXZAts7I1JuEEVLlUNk4HgVYAEIky7BfzoWvZ3cEaPwSMXgMbTykAGC8oWPRjsjS4IiL+WNMmud8NsbpiskP/r9iyW0Or0k5yvTG8NPK+EeG7QKtHzKbJCMEYaQx7A2fEyJYXfuXTRVgHUyBB/MhWVRmRfTqZdoXS1xBKrm3jGNHRF7jS898W39nLSOBA7Avy/CZPa1rZ6RqCj8Atg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z29Wn303hz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 19:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z29CQ5nnmz9sSd;
	Tue, 25 Feb 2025 09:05:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOg3G3RLLwfI; Tue, 25 Feb 2025 09:05:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z29CM62YDz9sSY;
	Tue, 25 Feb 2025 09:05:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B84C28B780;
	Tue, 25 Feb 2025 09:05:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0Az_q5mFkqk4; Tue, 25 Feb 2025 09:05:51 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0385A8B77C;
	Tue, 25 Feb 2025 09:05:50 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Segher Boessenkool <segher@kewrnel.crashing.org>
Subject: [PATCH v5 2/4] objtool/powerpc: Add support for decoding all types of uncond branches
Date: Tue, 25 Feb 2025 09:05:49 +0100
Message-ID: <bf0b4d554547bc34fa3d1af5b4e62a84c0bc182b.1740470510.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <0ca71a4b0ac679ea52bd9fdd1f607195d72b499f.1733245362.git.christophe.leroy@csgroup.eu>
References: <cover.1733245362.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740470749; l=1915; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=8JbHItkDNTqx7ppT/iSayCN1jPwzTMbHToRWPnGXZ+8=; b=kDGs0rx51ssFnmq55d2aoKmsBU2DAAmDzguoyq3tyjbjJbM4jrsG8ij4o0PNedE9Vme8j9BUr x0rsWe/Na1UAXrX4N8/CmGrpflO/ZQFmsAwWzcfysb78yw/g0I16gKg
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add support for 'bla' instruction.

This is done by 'flagging' the address as an absolute address so that
arch_jump_destination() can calculate it as expected. Because code is
_always_ 4 bytes aligned, use bit 30 as flag.

Also add support for 'b' and 'ba' instructions. Objtool call them jumps.

And make sure the special 'bl .+4' used by clang in relocatable code is
not seen as an 'unannotated intra-function call'. clang should use the
special 'bcl 20,31,.+4' form like gcc but for the time being it does not
so lets work around that.

Link: https://github.com/llvm/llvm-project/issues/128644
Reviewed-by: Segher Boessenkool <segher@kewrnel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Add a special case for clang to ignore 'bl .+4' form.
---
 tools/objtool/arch/powerpc/decode.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..26d5050424a9 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -55,12 +55,17 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 	switch (opcode) {
 	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if (ins == 0x48000005)	/* bl .+4 */
+			typ = INSN_OTHER;
+		else if (ins & 1)	/* bl[a] */
 			typ = INSN_CALL;
+		else		/* b[a] */
+			typ = INSN_JUMP_UNCONDITIONAL;
 
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
+		imm |= ins & 2;	/* AA flag */
 		break;
 	}
 
@@ -77,6 +82,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 unsigned long arch_jump_destination(struct instruction *insn)
 {
+	if (insn->immediate & 2)
+		return insn->immediate & ~2;
+
 	return insn->offset + insn->immediate;
 }
 
-- 
2.47.0


