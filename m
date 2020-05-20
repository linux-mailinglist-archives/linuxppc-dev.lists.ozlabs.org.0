Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8E1DB237
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:47:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rrbc2b2PzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RrWc3cbkzDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:44:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N9j260OO; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49RrWc063hz9sT8; Wed, 20 May 2020 21:44:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RrWb62nnz9sTC; Wed, 20 May 2020 21:44:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589975067;
 bh=3Ct7ArB23Uxt76VjuJnGWClIJwukD1hkevKdd/KT7Zg=;
 h=From:To:Cc:Subject:Date:From;
 b=N9j260OOCnkQ9+l75P7n2ljduB48PXiI8xL38Rjy8gj2O9HADhSntIUTwSin7988G
 u0K2yImsPu1dXibgZ/OSjq9vg8Fm3VfvmNupqy2ZRr4CTcVs0TQQ/iEieK//OtnRPM
 +CVK7N2BdDNKhXm8VoiMCLkgJ4BPdweZxoCWMcKoJnE7sfboFp0R0rCQvHpArEwaX+
 onl+Ym7F1eRBjauMOkvuZicS4dlFZ8KrPzTxKgu0j1sTG1cyVVIHzZk18RDNrbB8DK
 +SKR/e9x3iICsauJu74yq3fwvH5EqZKopu63m60x4ScURM4z8eNh7OqEi6sU3kY/W+
 g+qrVq7HE8XCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Add ppc_inst_next()
Date: Wed, 20 May 2020 21:44:46 +1000
Message-Id: <20200520114446.956215-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a few places we want to calculate the address of the next
instruction. Previously that was simple, we just added 4 bytes, or if
using a u32 * we incremented that pointer by 1.

But prefixed instructions make it more complicated, we need to advance
by either 4 or 8 bytes depending on the actual instruction. We also
can't do pointer arithmetic using struct ppc_inst, because it is
always 8 bytes in size on 64-bit, even though we might only need to
advance by 4 bytes.

So add a ppc_inst_next() helper which calculates the location of the
next instruction, if the given instruction was located at the given
address. Note the instruction doesn't need to actually be at the
address in memory.

Convert several locations to use it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/inst.h   |  9 +++++++++
 arch/powerpc/kernel/uprobes.c     |  2 +-
 arch/powerpc/lib/feature-fixups.c | 10 +++++-----
 arch/powerpc/xmon/xmon.c          |  2 +-
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index d82e0c99cfa1..7d5ee1309b92 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -100,6 +100,15 @@ static inline int ppc_inst_len(struct ppc_inst x)
 	return ppc_inst_prefixed(x) ? 8 : 4;
 }
 
+/*
+ * Return the address of the next instruction, if the instruction @value was
+ * located at @location.
+ */
+static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst value)
+{
+	return location + ppc_inst_len(value);
+}
+
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst __user *nip);
 
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 83e883e1a42d..683ba76919a7 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
+	regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, auprobe->insn);
 
 	user_disable_single_step(current);
 	return 0;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 80f320c2e189..0ad01eebf112 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -84,13 +84,13 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 	src = alt_start;
 	dest = start;
 
-	for (; src < alt_end; src = (void *)src + ppc_inst_len(ppc_inst_read(src)),
-	     (dest = (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
+	for (; src < alt_end; src = ppc_inst_next(src, *src),
+			      dest = ppc_inst_next(dest, *dest)) {
 		if (patch_alt_instruction(src, dest, alt_start, alt_end))
 			return 1;
 	}
 
-	for (; dest < end; dest = (void *)dest + ppc_inst_len(ppc_inst(PPC_INST_NOP)))
+	for (; dest < end; dest = ppc_inst_next(dest, ppc_inst(PPC_INST_NOP)))
 		raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
 
 	return 0;
@@ -405,8 +405,8 @@ static void do_final_fixups(void)
 	while (src < end) {
 		inst = ppc_inst_read(src);
 		raw_patch_instruction(dest, inst);
-		src = (void *)src + ppc_inst_len(inst);
-		dest = (void *)dest + ppc_inst_len(inst);
+		src = ppc_inst_next(src, *src);
+		dest = ppc_inst_next(dest, *dest);
 	}
 #endif
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fb135f2cd6b0..aa123f56b7d4 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -939,7 +939,7 @@ static void insert_bpts(void)
 		}
 
 		patch_instruction(bp->instr, instr);
-		patch_instruction((void *)bp->instr + ppc_inst_len(instr),
+		patch_instruction(ppc_inst_next(bp->instr, instr),
 				  ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
-- 
2.25.1

