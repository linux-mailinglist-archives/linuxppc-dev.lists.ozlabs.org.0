Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3DD56A651
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdzyM5zzLz3dyS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:56:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzxH67rkz3c5G
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:55:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ldzx42v9hz9t90;
	Thu,  7 Jul 2022 16:55:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGeRlFMvrpmv; Thu,  7 Jul 2022 16:55:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ldzx20t7cz9tGl;
	Thu,  7 Jul 2022 16:55:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0934B8B79F;
	Thu,  7 Jul 2022 16:55:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OQtiZNxWGIkV; Thu,  7 Jul 2022 16:55:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B38748B768;
	Thu,  7 Jul 2022 16:55:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267EtOoq541785
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:55:25 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267EtOrU541784;
	Thu, 7 Jul 2022 16:55:24 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/ppc-opcode: Define and use PPC_RAW_SETB()
Date: Thu,  7 Jul 2022 16:55:16 +0200
Message-Id: <b08a4f26919a8f8cdcf7544ab552d9c1c63418b5.1657205708.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
References: <b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657205714; l=2466; s=20211009; h=from:subject:message-id; bh=MA6xOj9VVExuUsXYFao1TGXDnAJxvOazN6adHfrGfKw=; b=GDomlNnPfB4QFvP1BsU9IFZH6sUc/nVNlR02hQbgUJh4+JhIHvaYw2Q3C5vXKSHrkHkh1cCfjiOx DAcibdPEA22OTmCxPVt7uzy8L60KNDDD0CZWXyzEpzz54t5+GO+M
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

We have PPC_INST_SETB then build the 'setb' instruction in the
user.

Instead, define PPC_RAW_SETB() and use it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 2 +-
 arch/powerpc/lib/test_emulate_step.c  | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 5527a955fb4a..7b81b37a191e 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -290,7 +290,6 @@
 #define PPC_INST_STRING			0x7c00042a
 #define PPC_INST_STRING_MASK		0xfc0007fe
 #define PPC_INST_STRING_GEN_MASK	0xfc00067e
-#define PPC_INST_SETB			0x7c000100
 #define PPC_INST_STSWI			0x7c0005aa
 #define PPC_INST_STSWX			0x7c00052a
 #define PPC_INST_TRECHKPT		0x7c0007dd
@@ -583,6 +582,7 @@
 #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
 #define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
+#define PPC_RAW_SETB(t, bfa)		(0x7c000100 | ___PPC_RT(t) | ___PPC_RA((bfa) << 2))
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index f2e47be05e8c..23c7805fb7b3 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -53,9 +53,6 @@
 	ppc_inst_prefix(PPC_PREFIX_MLS | __PPC_PRFX_R(pr) | IMM_H(i), \
 			PPC_RAW_ADDI(t, a, i))
 
-#define TEST_SETB(t, bfa)       ppc_inst(PPC_INST_SETB | ___PPC_RT(t) | ___PPC_RA((bfa & 0x7) << 2))
-
-
 static void __init init_pt_regs(struct pt_regs *regs)
 {
 	static unsigned long msr;
@@ -935,21 +932,21 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "BFA = 1, CR = GT",
-				.instr = TEST_SETB(20, 1),
+				.instr = ppc_inst(PPC_RAW_SETB(20, 1)),
 				.regs = {
 					.ccr = 0x4000000,
 				}
 			},
 			{
 				.descr = "BFA = 4, CR = LT",
-				.instr = TEST_SETB(20, 4),
+				.instr = ppc_inst(PPC_RAW_SETB(20, 4)),
 				.regs = {
 					.ccr = 0x8000,
 				}
 			},
 			{
 				.descr = "BFA = 5, CR = EQ",
-				.instr = TEST_SETB(20, 5),
+				.instr = ppc_inst(PPC_RAW_SETB(20, 5)),
 				.regs = {
 					.ccr = 0x200,
 				}
-- 
2.36.1

