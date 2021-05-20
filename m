Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6D38A659
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5TQ0Fb1z3cYw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:24:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Rc6sPQz3bv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RG2rmVz9sVw;
 Thu, 20 May 2021 12:23:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmM-GTmB7N-F; Thu, 20 May 2021 12:23:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RG1qmXz9sVn;
 Thu, 20 May 2021 12:23:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF8E48B811;
 Thu, 20 May 2021 12:23:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8qLsadfVOGau; Thu, 20 May 2021 12:23:05 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71DCB8B80D;
 Thu, 20 May 2021 12:23:05 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5B71064C44; Thu, 20 May 2021 10:23:05 +0000 (UTC)
Message-Id: <c04f88d0e53d2122fbbe92226892a01ebc668b6a.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 06/12] powerpc/security: Use PPC_RAW_BLR() and PPC_RAW_NOP()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:05 +0000 (UTC)
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

On the road to remove all use of PPC_INST_xxx, replace
PPC_INST_BLR by PPC_RAW_BLR(). Same for PPC_INST_NOP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h |  3 +--
 arch/powerpc/kernel/security.c        | 12 ++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 91b7f6bb478b..2c97ee3e0db1 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -288,7 +288,6 @@
 #define PPC_INST_MFLR			0x7c0802a6
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
-#define PPC_INST_BLR			0x4e800020
 #define PPC_INST_DIVD			0x7c0003d2
 #define PPC_INST_RLDICR			0x78000004
 #define PPC_INST_ORI			0x60000000
@@ -477,7 +476,7 @@
 #define PPC_RAW_ADDC(t, a, b)		(0x7c000014 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_ADDC_DOT(t, a, b)	(0x7c000014 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 #define PPC_RAW_NOP()			(PPC_INST_NOP)
-#define PPC_RAW_BLR()			(PPC_INST_BLR)
+#define PPC_RAW_BLR()			(0x4e800020)
 #define PPC_RAW_BLRL()			(0x4e800021)
 #define PPC_RAW_MTLR(r)			(0x7c0803a6 | ___PPC_RT(r))
 #define PPC_RAW_MFLR(t)			(PPC_INST_MFLR | ___PPC_RT(t))
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 0fdfcdd9d880..118f10d14af8 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -438,7 +438,7 @@ static void update_branch_cache_flush(void)
 	site = &patch__call_kvm_flush_link_stack;
 	// This controls the branch from guest_exit_cont to kvm_flush_link_stack
 	if (link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
-		patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+		patch_instruction_site(site, ppc_inst(PPC_RAW_NOP()));
 	} else {
 		// Could use HW flush, but that could also flush count cache
 		patch_branch_site(site, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
@@ -447,11 +447,11 @@ static void update_branch_cache_flush(void)
 
 	// Patch out the bcctr first, then nop the rest
 	site = &patch__call_flush_branch_caches3;
-	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+	patch_instruction_site(site, ppc_inst(PPC_RAW_NOP()));
 	site = &patch__call_flush_branch_caches2;
-	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+	patch_instruction_site(site, ppc_inst(PPC_RAW_NOP()));
 	site = &patch__call_flush_branch_caches1;
-	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+	patch_instruction_site(site, ppc_inst(PPC_RAW_NOP()));
 
 	// This controls the branch from _switch to flush_branch_caches
 	if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE &&
@@ -474,12 +474,12 @@ static void update_branch_cache_flush(void)
 		// If we just need to flush the link stack, early return
 		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE) {
 			patch_instruction_site(&patch__flush_link_stack_return,
-					       ppc_inst(PPC_INST_BLR));
+					       ppc_inst(PPC_RAW_BLR()));
 
 		// If we have flush instruction, early return
 		} else if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW) {
 			patch_instruction_site(&patch__flush_count_cache_return,
-					       ppc_inst(PPC_INST_BLR));
+					       ppc_inst(PPC_RAW_BLR()));
 		}
 	}
 }
-- 
2.25.0

