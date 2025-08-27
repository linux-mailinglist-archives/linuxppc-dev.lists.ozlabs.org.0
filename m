Return-Path: <linuxppc-dev+bounces-11383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2FB38571
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 16:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBnX25h7Dz3bmQ;
	Thu, 28 Aug 2025 00:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756306242;
	cv=none; b=IHLIQL8v5rFFCshVdI/sxeJoNkIkM9v7yELcWad8e7yNH5vOU8PiUB24RTH1SkYit/nQx0bi6mBfcCMvIIJT5dWSCBzuSb1mr0K39sno4bX8oozAERrhHCWbHVBsRjwifSVbg5qS76yH8CFZAH6kyGkTdGAzGrIhMg0w/fbOYpjO1lCXODAasHBC2XbV4EcfH2vaTA7mGnl92D99FM+tzkjNbT5oD/qaDORrd6PXpP1T7Rq8exkQ27iKQHP98on1llzIyiSnfT+KCO7Sc6mpRJX6e/ExsuqICDiSyi1WYT5qm/tHKQ8NtXvJQT3mhEJntxMFCsyH/apDb9bop7FDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756306242; c=relaxed/relaxed;
	bh=oNR+5DIBfzLypCUr6xkiafSH9hFbWF534Eqj5+NQwZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=guZTphD7mq9e9vzfL7Z4xj1fvRoioKOT3EDp6Ea5Cua7u6yrBJ1fwGsOPOG+PcGeuPJfwXlbV67zRI2rzvu8GWyrmuo6vEkZe50doHwxN/yF19PvO7unbVbEfFJTtyO/225KVAXrznk9o3zxSqmvmXFoiUR+6A8qyf4tbgv9OzHHN/lYEIAg61SVwMgdoI0SzQYHdhTWx5T11oyCN1ye2J868PcX1HvdgYde1mo23+/7CmachOi3eabiRPa0/5gF4uUZVYtuOGtNGD5B9CXEvMWCFZ78oA+b3vUS0JO/DTz1KTVPfdWkfYAp/foq+M6/YdlxenfL3ekuMf1OAK6tzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBnX21rnYz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 00:50:42 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cBmql4Fsnz9sSS;
	Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZDcgQWG095e; Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cBmql3cMxz9sSN;
	Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69E468B764;
	Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id n6IPFYSBYu05; Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17A178B763;
	Wed, 27 Aug 2025 16:19:15 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Fix unpaired stwcx. on interrupt exit
Date: Wed, 27 Aug 2025 16:19:14 +0200
Message-ID: <465f323523f677816cc4f26d5e988279a277a37d.1756304342.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756304354; l=1523; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2npINxb8oQMKnIaxjh0X0IDfdSNnY9TlWZbMisNq49c=; b=+J17fCe7FTmIs0xyopfCDFVHCs4IOzvmvwDQNQ6+MAJb7k5f7tHn3CrKcOx+hK4tjdtz6m9qD 5QS2YKfjkchDGwyXrGBK2T646f0PyE/iPIl8BHm8lF9Yk69/V/J2S8S
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit b64f87c16f3c ("[POWERPC] Avoid unpaired stwcx. on some
processors") erroneouly copied to powerpc/32 the logic from powerpc/64
based on feature CPU_FTR_STCX_CHECKS_ADDRESS which is always 0 on
powerpc/32.

Re-instate the logic implemented by commit b64f87c16f3c ("[POWERPC]
Avoid unpaired stwcx. on some processors")

Fixes: b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C exception exit from ppc64")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 762df811433c..c37480176a1c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -260,10 +260,9 @@ interrupt_return:
 	mtspr	SPRN_SRR1,r12
 
 BEGIN_FTR_SECTION
+	lwarx   r0,0,r1
+END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	stwcx.	r0,0,r1		/* to clear the reservation */
-FTR_SECTION_ELSE
-	lwarx	r0,0,r1
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	lwz	r3,_CCR(r1)
 	lwz	r4,_LINK(r1)
@@ -303,10 +302,9 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_SRR1,r12
 
 BEGIN_FTR_SECTION
+	lwarx   r0,0,r1
+END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	stwcx.	r0,0,r1		/* to clear the reservation */
-FTR_SECTION_ELSE
-	lwarx	r0,0,r1
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	lwz	r3,_LINK(r1)
 	lwz	r4,_CTR(r1)
-- 
2.49.0


