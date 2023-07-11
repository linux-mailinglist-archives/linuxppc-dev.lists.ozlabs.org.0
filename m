Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579F74F437
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0lvk1Y8nz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:00:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ltc5PLVz3c3v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:59:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0ltQ5KVLz9sFG;
	Tue, 11 Jul 2023 17:59:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cE3bpIlibbsJ; Tue, 11 Jul 2023 17:59:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0ltP5RB0z9sF7;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3BD18B77D;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Pa7miF_0YDAO; Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B3C38B77A;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BFxPtY3695843
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 17:59:25 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BFxPuj3695842;
	Tue, 11 Jul 2023 17:59:25 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 3/9] powerpc/kuap: Fold kuep_is_disabled() into its only user
Date: Tue, 11 Jul 2023 17:59:15 +0200
Message-ID: <b2247147c0a8c830ac82966451647850df4a64da.1689091022.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091022.git.christophe.leroy@csgroup.eu>
References: <cover.1689091022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091151; l=1592; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xPDEUS91RJ+Z0qj6uThAwAk6Rpfb4Lya66JNABcMboc=; b=AxaZLZGfSHpbeGvqoS73MhSQe3bRyX3H9T90vImH5GXu1PMgUSUwwKpw5umHybcgWzGqFNmEz SXHkRp76wygAbLgzSliigdiewsprwA5tmJmKsUhEIHqM1q7FDUPGbyP
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

kuep_is_disabled() was introduced by commit 91bb30822a2e ("powerpc/32s:
Refactor update of user segment registers") but then all users but one
were removed by commit 526d4a4c77ae ("powerpc/32s: Do kuep_lock() and
kuep_unlock() in assembly").

Fold kuep_is_disabled() into init_new_context() which is its only user.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 5 -----
 arch/powerpc/mm/book3s32/mmu_context.c   | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 466a19cfb4df..0da0dea76c47 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -13,11 +13,6 @@
 
 extern struct static_key_false disable_kuap_key;
 
-static __always_inline bool kuep_is_disabled(void)
-{
-	return !IS_ENABLED(CONFIG_PPC_KUEP);
-}
-
 #ifdef CONFIG_PPC_KUAP
 
 #include <linux/sched.h>
diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index 269a3eb25a73..1922f9a6b058 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -71,7 +71,7 @@ int init_new_context(struct task_struct *t, struct mm_struct *mm)
 	mm->context.id = __init_new_context();
 	mm->context.sr0 = CTX_TO_VSID(mm->context.id, 0);
 
-	if (!kuep_is_disabled())
+	if (IS_ENABLED(CONFIG_PPC_KUEP))
 		mm->context.sr0 |= SR_NX;
 	if (!kuap_is_disabled())
 		mm->context.sr0 |= SR_KS;
-- 
2.41.0

