Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2C399CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfYC4K5Cz3c9Y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfX44qGCz3099
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:41:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWl4bShzBC5p;
 Thu,  3 Jun 2021 10:41:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Xy-rWGip_2A; Thu,  3 Jun 2021 10:41:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWl3hkBzBC5Z;
 Thu,  3 Jun 2021 10:41:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3365B8B767;
 Thu,  3 Jun 2021 10:41:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gGZ2aGWSxbBp; Thu,  3 Jun 2021 10:41:39 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4F508B84A;
 Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BF6BF64BD2; Thu,  3 Jun 2021 08:41:38 +0000 (UTC)
Message-Id: <26b36ef2939234a04b37baf6ffe50cba81f5d1b7.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 03/12] powerpc/32s: move CTX_TO_VSID() into mmu-hash.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:38 +0000 (UTC)
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

From: Christophe Leroy <christophe.leroy@c-s.fr>

In order to reuse it in switch_mmu_context(), this
patch moves CTX_TO_VSID() macro into asm/book3s/32/mmu-hash.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 10 ++++++++++
 arch/powerpc/kvm/book3s_32_mmu_host.c         |  3 ---
 arch/powerpc/mm/book3s32/mmu_context.c        | 13 -------------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index cc0284bbac86..583388399b1b 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -66,6 +66,16 @@ struct ppc_bat {
 
 #ifndef __ASSEMBLY__
 
+/*
+ * This macro defines the mapping from contexts to VSIDs (virtual
+ * segment IDs).  We use a skew on both the context and the high 4 bits
+ * of the 32-bit virtual address (the "effective segment ID") in order
+ * to spread out the entries in the MMU hash table.  Note, if this
+ * function is changed then hash functions will have to be
+ * changed to correspond.
+ */
+#define CTX_TO_VSID(c, id)	((((c) * (897 * 16)) + (id * 0x111)) & 0xffffff)
+
 /*
  * Hardware Page Table Entry
  * Note that the xpn and x bitfields are used only by processors that
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index e8e7b2c530d1..4b3a8d80cfa3 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -353,9 +353,6 @@ void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu)
 	preempt_enable();
 }
 
-/* From mm/mmu_context_hash32.c */
-#define CTX_TO_VSID(c, id)	((((c) * (897 * 16)) + (id * 0x111)) & 0xffffff)
-
 int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index 218996e40a8e..c949363f315f 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -39,19 +39,6 @@
 #define LAST_CONTEXT    	32767
 #define FIRST_CONTEXT    	1
 
-/*
- * This function defines the mapping from contexts to VSIDs (virtual
- * segment IDs).  We use a skew on both the context and the high 4 bits
- * of the 32-bit virtual address (the "effective segment ID") in order
- * to spread out the entries in the MMU hash table.  Note, if this
- * function is changed then arch/ppc/mm/hashtable.S will have to be
- * changed to correspond.
- *
- *
- * CTX_TO_VSID(ctx, va)	(((ctx) * (897 * 16) + ((va) >> 28) * 0x111) \
- *				 & 0xffffff)
- */
-
 static unsigned long next_mmu_context;
 static unsigned long context_map[LAST_CONTEXT / BITS_PER_LONG + 1];
 
-- 
2.25.0

