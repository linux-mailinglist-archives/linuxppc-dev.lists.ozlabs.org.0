Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CD51E4BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ0d6Lbpz3cJY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwHzY0tcPz3cDK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzG1wkVz9sWT;
 Sat,  7 May 2022 08:46:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzb8jQau59s8; Sat,  7 May 2022 08:46:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD51KVz9sVh;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A3248B7B8;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kRTRbM6dQ_Q8; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC06C8B770;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kdVP1320481
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kdQb1320480;
 Sat, 7 May 2022 08:46:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 03/25] powerpc/code-patching: Inline
 is_offset_in_{cond}_branch_range()
Date: Sat,  7 May 2022 08:46:05 +0200
Message-Id: <a05be0ccb7373e6a9789a1988fcd0c810f5f9269.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905980; l=3156; s=20211009;
 h=from:subject:message-id; bh=gLaYW1av0GijX4+cqYkHFoJkNFVZ0gQqCQkmFifsN0M=;
 b=aU3+KJhAGr4mwTSfxcdb6ogHvqEV7BW2Tgo5oC66pJSuQzGkmAX1r7woj/pfNAuEZ+ldtpi5FRLK
 GCQAWyCgCe5ZsRW1L5SSCkNWvGsAeyaPpuBKCKTfLSJiQJLJRpFH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test in is_offset_in_branch_range() and is_offset_in_cond_branch_range()
are simple tests that are worth inlining.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 29 ++++++++++++++++++++++--
 arch/powerpc/lib/code-patching.c         | 27 ----------------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 409483b2d0ce..e7c5df50cb4e 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -22,8 +22,33 @@
 #define BRANCH_SET_LINK	0x1
 #define BRANCH_ABSOLUTE	0x2
 
-bool is_offset_in_branch_range(long offset);
-bool is_offset_in_cond_branch_range(long offset);
+/*
+ * Powerpc branch instruction is :
+ *
+ *  0         6                 30   31
+ *  +---------+----------------+---+---+
+ *  | opcode  |     LI         |AA |LK |
+ *  +---------+----------------+---+---+
+ *  Where AA = 0 and LK = 0
+ *
+ * LI is a signed 24 bits integer. The real branch offset is computed
+ * by: imm32 = SignExtend(LI:'0b00', 32);
+ *
+ * So the maximum forward branch should be:
+ *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
+ * The maximum backward branch should be:
+ *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
+ */
+static inline bool is_offset_in_branch_range(long offset)
+{
+	return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
+}
+
+static inline bool is_offset_in_cond_branch_range(long offset)
+{
+	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
+}
+
 int create_branch(ppc_inst_t *instr, const u32 *addr,
 		  unsigned long target, int flags);
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 00c68e7fb11e..58262c7e447c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -208,33 +208,6 @@ int patch_branch(u32 *addr, unsigned long target, int flags)
 	return patch_instruction(addr, instr);
 }
 
-bool is_offset_in_branch_range(long offset)
-{
-	/*
-	 * Powerpc branch instruction is :
-	 *
-	 *  0         6                 30   31
-	 *  +---------+----------------+---+---+
-	 *  | opcode  |     LI         |AA |LK |
-	 *  +---------+----------------+---+---+
-	 *  Where AA = 0 and LK = 0
-	 *
-	 * LI is a signed 24 bits integer. The real branch offset is computed
-	 * by: imm32 = SignExtend(LI:'0b00', 32);
-	 *
-	 * So the maximum forward branch should be:
-	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backward branch should be:
-	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
-	 */
-	return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
-}
-
-bool is_offset_in_cond_branch_range(long offset)
-{
-	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
-}
-
 /*
  * Helper to check if a given instruction is a conditional branch
  * Derived from the conditional checks in analyse_instr()
-- 
2.35.1

