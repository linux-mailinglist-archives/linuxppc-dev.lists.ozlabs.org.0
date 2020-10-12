Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D328BCAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 17:44:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C92zq6VdJzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 02:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C92tN4TsWzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 02:39:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C92t45LYpz9v10q;
 Mon, 12 Oct 2020 17:39:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tIzJjLTsdFXn; Mon, 12 Oct 2020 17:39:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C92t447XWz9v10n;
 Mon, 12 Oct 2020 17:39:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51EFA8B793;
 Mon, 12 Oct 2020 17:39:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0doUTwML87kl; Mon, 12 Oct 2020 17:39:46 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E9718B792;
 Mon, 12 Oct 2020 17:39:46 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F0BF866440; Mon, 12 Oct 2020 15:39:45 +0000 (UTC)
Message-Id: <06bf0e094463533e7aec6900bddd435171e9f44f.1602517171.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/mm: Add mask of always present MMU features
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2020 15:39:45 +0000 (UTC)
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

On the same principle as commit 773edeadf672 ("powerpc/mm: Add mask
of possible MMU features"), add mask for MMU features that are
always there in order to optimise out dead branches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Features must be anded with MMU_FTRS_POSSIBLE instead of ~0, otherwise
    MMU_FTRS_ALWAYS is ~0 when no #ifdef matches.
---
 arch/powerpc/include/asm/mmu.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 255a1837e9f7..64e7e7f7cda9 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -201,8 +201,30 @@ enum {
 		0,
 };
 
+enum {
+	MMU_FTRS_ALWAYS =
+#ifdef CONFIG_PPC_8xx
+		MMU_FTR_TYPE_8xx &
+#endif
+#ifdef CONFIG_40x
+		MMU_FTR_TYPE_40x &
+#endif
+#ifdef CONFIG_PPC_47x
+		MMU_FTR_TYPE_47x &
+#elif defined(CONFIG_44x)
+		MMU_FTR_TYPE_44x &
+#endif
+#if defined(CONFIG_E200) || defined(CONFIG_E500)
+		MMU_FTR_TYPE_FSL_E &
+#endif
+		MMU_FTRS_POSSIBLE,
+};
+
 static inline bool early_mmu_has_feature(unsigned long feature)
 {
+	if (MMU_FTRS_ALWAYS & feature)
+		return true;
+
 	return !!(MMU_FTRS_POSSIBLE & cur_cpu_spec->mmu_features & feature);
 }
 
@@ -231,6 +253,9 @@ static __always_inline bool mmu_has_feature(unsigned long feature)
 	}
 #endif
 
+	if (MMU_FTRS_ALWAYS & feature)
+		return true;
+
 	if (!(MMU_FTRS_POSSIBLE & feature))
 		return false;
 
-- 
2.25.0

