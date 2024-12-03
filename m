Return-Path: <linuxppc-dev+bounces-3752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD99E2C44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:46:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rkp69ckz30Sw;
	Wed,  4 Dec 2024 06:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255202;
	cv=none; b=WOtJMewjp4uMAdcYqzHIqbpCF+Uz2RDgx1w6CO2QnqLUW6JkuUEYlIH/3t+yzpZX4g7AfSJZZOJVtI+pj5LorjQOqpVXzLimpIrsRYZQEAkecAKcFxPezRBwB1BF4L2kecN5TQULoV41e4Y1um9fxpssxSU9QXhjLyVSTr/4J50i/79v8lj+06bkya889uXJ1l8jQicqZotAN4jgHeDskKTK83h+Y9zFkFNs9b1fY5PPVeEkTMLKBEmKWYs63gXUudaPOoe1QlymFEgHfuLyEKpDwtaXU6+vTxH6MokdcnYSEXiRQ4DlWm6EBCfZOPbnt0gS3ldfq+KI+CZ11YhuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255202; c=relaxed/relaxed;
	bh=ijyvOWQRk4cqcLcKh/Y+nZlzEq1+kUqIpNdtcYWrB2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRjupmH+StPgKKymPe9tGoE4PAKq6jvvH1PzeyLeVn+5EMkYIjUFM0ksiEz+rcWWaJFWTO6FEOgvW2GMkDIb4J0+8BcrBGKy4ijT4n59fWsGJMlMdxVNv4aGkvN6DFgnKUguZsm25V5bBiqCCmnvXVsT6ug+MIcCUdq3IBFQBs843Hm3Js43roUZla56k56QmFDV/7kWc4THiggWNhNTEzkabKSE33DS2z2LaN/0j7lVMYkHaDdnq7i1HZCmsqqG5k5uukoyGTA6kDxsI3R3nPQ/Zs6hnh9t6N8hGXX9h/2yNZjXfwojRT3eUr1lBvhCgj/YBn6he2a/eYcteMqP0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rkn6zr5z2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:46:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rkV1Dg1z9stH;
	Tue,  3 Dec 2024 20:46:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV_W0aAXLTr7; Tue,  3 Dec 2024 20:46:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rkV0Sl9z9stD;
	Tue,  3 Dec 2024 20:46:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E2E0B8B763;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SLEBpkwrXIB1; Tue,  3 Dec 2024 20:46:25 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 243048B767;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/4] objtool/powerpc: Add support for decoding all types of uncond branches
Date: Tue,  3 Dec 2024 20:44:50 +0100
Message-ID: <0ca71a4b0ac679ea52bd9fdd1f607195d72b499f.1733245362.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1733245362.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733255162; l=1411; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=rkc6rbl9zc2WEtrRWE9QRdGj1KrdadCRvxADO58Yds0=; b=MUTxe8REiHlw+JI/+u8V3K4lDnK/5EtJEVeqBc6ax4BfVURzLhLCDA5tDY/ZXNLL09g8PwuEo 4I2ho4Wdd6PCfriQVC/4QrKAKoaSfaqZq4Pz3Z0LEHDb7gyYbbbNSI5
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/decode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..c1228fef3dec 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -55,12 +55,15 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 	switch (opcode) {
 	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if (ins & 1)	/* bl[a] */
 			typ = INSN_CALL;
+		else		/* b[a] */
+			typ = INSN_JUMP_UNCONDITIONAL;
 
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
+		imm |= ins & 2;	/* AA flag */
 		break;
 	}
 
@@ -77,6 +80,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 unsigned long arch_jump_destination(struct instruction *insn)
 {
+	if (insn->immediate & 2)
+		return insn->immediate & ~2;
+
 	return insn->offset + insn->immediate;
 }
 
-- 
2.47.0


