Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BC5A9609
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJK9t6G68z2yy7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJK8Q6gyYz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:49:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJK7w158vz9spP;
	Thu,  1 Sep 2022 13:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSvPxYvRcxEa; Thu,  1 Sep 2022 13:49:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJK7t2zVlz9spG;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CD3F8B788;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3P_eU_v_bXG1; Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.131])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B30088B786;
	Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 281BmrTK1768881
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 13:48:53 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 281BmqNw1768877;
	Thu, 1 Sep 2022 13:48:52 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, bgray@linux.ibm.com, agust@denx.de,
        jpoimboe@kernel.org, peterz@infradead.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com
Subject: [PATCH v3 1/6] Fixup for "objtool/powerpc: Add --mcount specific implementation"
Date: Thu,  1 Sep 2022 13:48:20 +0200
Message-Id: <ebe11b73d1015a17034a2c4bedf093fa57f5d29f.1662032631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1662032631.git.christophe.leroy@csgroup.eu>
References: <cover.1662032631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662032901; l=2256; s=20211009; h=from:subject:message-id; bh=HC0ktShMm6bJ1zScR3VyRz14h29LLTvobR6l/QidGzI=; b=6TYx2j7BP3jG58DXp59d6lRn8N25lVMVgt3RqZBTTFKBttVeMLrGkyx908zywXniPgvLV9zrcCGm NmCHW/L0BVMtXIKdQD8hosmdwVfcmn+ykuwq5QZfat9xh8Hf6B3r
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

Make arch_decode_instruction() more future proof and less error prone:
- Use local vars for type and imm so that GCC will detect when we
forget to update them
- Handle imm outside the branch type check
- Adapt len for prefixed instructions

Handle the four branch types b, bl, ba, bla

Part of it should probably go into "objtool/powerpc: Enable objtool
to be built on ppc" for instance the setup of the len. Maybe all the
skeleton with the local vars, the switch with its default, etc ...
Then following patches only have to add stuff inside the switch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/decode.c | 39 +++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index b71c265ed503..f9932351908c 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -50,31 +50,48 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 {
 	u32 insn;
 	unsigned int opcode;
+	unsigned long imm;
+	enum insn_type typ;
 
-	*immediate = 0;
 	insn = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
-	*len = 4;
-	*type = INSN_OTHER;
 
 	opcode = insn >> 26;
 
 	switch (opcode) {
-	case 18: /* bl */
-		if ((insn & 3) == 1) {
-			*type = INSN_CALL;
-			*immediate = insn & 0x3fffffc;
-			if (*immediate & 0x2000000)
-				*immediate -= 0x4000000;
-		}
+	case 18: /* bl/b/bla/ba */
+		if (insn & 1)
+			typ = INSN_CALL;
+		else
+			typ = INSN_JUMP_UNCONDITIONAL;
+
+		imm = insn & 0x3fffffc;
+		if (imm & 0x2000000)
+			imm -= 0x4000000;
+		imm |= insn & 2;	/* AA flag */
+		break;
+	default:
+		typ = INSN_OTHER;
+		imm = 0;
 		break;
 	}
 
+	if (opcode == 1)
+		*len = 8;
+	else
+		*len = 4;
+
+	*type = typ;
+	*immediate = imm;
+
 	return 0;
 }
 
 unsigned long arch_jump_destination(struct instruction *insn)
 {
-	return insn->offset +  insn->immediate;
+	if (insn->immediate & 2)
+		return insn->immediate & ~2;
+
+	return insn->offset + insn->immediate;
 }
 
 void arch_initial_func_cfi_state(struct cfi_init_state *state)
-- 
2.37.1

