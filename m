Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB12C39E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:18:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgsg00KRTzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:18:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgsVj3DY9zDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:10:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgsVb5t28z9tx28;
 Wed, 25 Nov 2020 08:10:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6Q5jLAb28zu9; Wed, 25 Nov 2020 08:10:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgsVb55Vjz9tyTJ;
 Wed, 25 Nov 2020 08:10:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 626DF8B7C3;
 Wed, 25 Nov 2020 08:10:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n0ZD0RSMGl2B; Wed, 25 Nov 2020 08:10:48 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 338C68B7B7;
 Wed, 25 Nov 2020 08:10:48 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 16726668BA; Wed, 25 Nov 2020 07:10:48 +0000 (UTC)
Message-Id: <61790f1a91692950a6bb5bb53d6d514d9bcdad74.1606285014.git.christophe.leroy@csgroup.eu>
In-Reply-To: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
References: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/8] powerpc/32s: Fix an FTR_SECTION_ELSE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 25 Nov 2020 07:10:48 +0000 (UTC)
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

An FTR_SECTION_ELSE is in the middle of
BEGIN_MMU_FTR_SECTION/ALT_MMU_FTR_SECTION_END_IFSET

Change it to MMU_FTR_SECTION_ELSE

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 27767f3e7ec1..236a95d163be 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -332,7 +332,7 @@ BEGIN_MMU_FTR_SECTION
 	rlwinm	r3, r5, 32 - 15, 21, 21		/* DSISR_STORE -> _PAGE_RW */
 	bl	hash_page
 	b	handle_page_fault_tramp_1
-FTR_SECTION_ELSE
+MMU_FTR_SECTION_ELSE
 	b	handle_page_fault_tramp_2
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 #endif	/* CONFIG_VMAP_STACK */
-- 
2.25.0

