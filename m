Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80034373CF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 16:03:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZz1z4FBcz3bVT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 00:03:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZz1J56Hyz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 00:02:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZz134psKz9sQy;
 Wed,  5 May 2021 16:02:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRG5U1s_uRx8; Wed,  5 May 2021 16:02:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZz116Tnzz9sXR;
 Wed,  5 May 2021 16:02:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 987C88B7D9;
 Wed,  5 May 2021 16:02:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qQ_G9t_DmGZA; Wed,  5 May 2021 16:02:13 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EDBD8B7D7;
 Wed,  5 May 2021 16:02:13 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3116364856; Wed,  5 May 2021 14:02:13 +0000 (UTC)
Message-Id: <6e1813953da38c452c131fe3e2a2761a0fddb975.1620223303.git.christophe.leroy@csgroup.eu>
In-Reply-To: <1c80981548dc0c4f145109cdd473022c1aad8d2b.1620223302.git.christophe.leroy@csgroup.eu>
References: <1c80981548dc0c4f145109cdd473022c1aad8d2b.1620223302.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc/paca: Remove mm_ctx_id and
 mm_ctx_slb_addr_limit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Wed,  5 May 2021 14:02:13 +0000 (UTC)
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

mm_ctx_id and mm_ctx_slb_addr_limit are not used anymore.

Remove them.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/paca.h | 2 --
 arch/powerpc/kernel/paca.c      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index ec18ac818e3a..ecc8d792a431 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -149,11 +149,9 @@ struct paca_struct {
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S
-	mm_context_id_t mm_ctx_id;
 #ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
-	unsigned long mm_ctx_slb_addr_limit;
 #else
 	u16 mm_ctx_user_psize;
 	u16 mm_ctx_sllp;
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 7f5aae3c387d..9bd30cac852b 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -346,10 +346,8 @@ void copy_mm_to_paca(struct mm_struct *mm)
 #ifdef CONFIG_PPC_BOOK3S
 	mm_context_t *context = &mm->context;
 
-	get_paca()->mm_ctx_id = context->id;
 #ifdef CONFIG_PPC_MM_SLICES
 	VM_BUG_ON(!mm_ctx_slb_addr_limit(context));
-	get_paca()->mm_ctx_slb_addr_limit = mm_ctx_slb_addr_limit(context);
 	memcpy(&get_paca()->mm_ctx_low_slices_psize, mm_ctx_low_slices(context),
 	       LOW_SLICE_ARRAY_SZ);
 	memcpy(&get_paca()->mm_ctx_high_slices_psize, mm_ctx_high_slices(context),
-- 
2.25.0

