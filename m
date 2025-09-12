Return-Path: <linuxppc-dev+bounces-12069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F11B545F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 10:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSnF5TSnz3cmp;
	Fri, 12 Sep 2025 18:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757667041;
	cv=none; b=Tq2rFoqn7lYYPEM3AkPMaJ/FY2wbAzlAorX6vk+vrpZkjFtXGgLvTHvFoWvuNBLqucuk7lpJXlGqefI52Jwv+5hOMhGnpFI30xyCMSEgSNFLuoWSm3UqEfsohQW3UXpeeGibN8PcfzN6/kzCrAIzL1q+y/XkU95SjFSxNJvGv8N8BCeuPcnFm/cNV1vPeKF3rHCZJK/j9R/rM/7KYpHOtOiUfRE2wlouBds/ISDYWCM7MrHuGXUwjnYckasACvQDxILUxJu5X9Y9NtJ9ZvFgv4WtNtRSlzPVfkj2e6R5NmOepSdY14kie2e0NivI3yuIB9duCy6ygNgm3v2TAqEdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757667041; c=relaxed/relaxed;
	bh=VyYg3tT1yjWMqcgX/FyCcAdmg/99j2cY7/NQA4kBkQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pi7GM8ouD/uehD3jen2xU95VtnyULwY0a3IH0T9W62+bCE7+qp8ajWGn0dq91cGA6NwoFyNYlBrSPDWdD7pjhhhveCj7QjWD+RnxOFHkOEIXdFfVSwRRsuNdyrnXzka2HAxR4tirn5Eh5vvN4PusdYEmhO0I35ynoBEDe5I0UzNAgqNyg+CrrcS4yQp4MGL+Df8z+Pq29vFhkaZ7r3sm/bZPkBqiA9vpIY8ecuSaObxJJABiquExCauUkpLmG9xF9y1c4QfBDXdK5KsMUiRJ0+L7kIjqr71zN6CcvCN8/E9utZcregS3Ryo/F4ew0eM6QVbi/4ahMZss0EnCYtQlOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSnF0YTmz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:50:39 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cNSV810Hnz9sjH;
	Fri, 12 Sep 2025 10:37:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJsHGcZ--gTw; Fri, 12 Sep 2025 10:37:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cNSV80JmJz9sjD;
	Fri, 12 Sep 2025 10:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA7988B7A7;
	Fri, 12 Sep 2025 10:37:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WbMpPa6hMifm; Fri, 12 Sep 2025 10:37:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B0EF98B764;
	Fri, 12 Sep 2025 10:37:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/32: Fix unpaired stwcx. on interrupt exit
Date: Fri, 12 Sep 2025 10:37:34 +0200
Message-ID: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757666254; l=1672; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5vI3e5CRVNaH9YfMQbqIK6M5whINX0HsBG3gpHpgdQU=; b=3HUtWsJBTeDbibwPdJ+3dy4s3u4+rRHfi40L3ROeVYjn4DCFzLT+fuMd9GQJOPMQI2Z2zJv9x WmDkcA8GXr7A0KnhVg1qliOBwOZ7lBUUSEBBZA5Gt1eNPpoFDVaMahj
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C
exception exit from ppc64") erroneouly copied to powerpc/32 the logic
from powerpc/64 based on feature CPU_FTR_STCX_CHECKS_ADDRESS which is
always 0 on powerpc/32.

Re-instate the logic implemented by commit b64f87c16f3c ("[POWERPC]
Avoid unpaired stwcx. on some processors") which is based on
CPU_FTR_NEED_PAIRED_STWCX feature.

Fixes: b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C exception exit from ppc64")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Fixed the commit message (Wrong patch reference in the beginning)
---
 arch/powerpc/kernel/entry_32.S | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 61ffd2989e7b..16f8ee6cb2cd 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -275,10 +275,9 @@ interrupt_return:
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
@@ -319,10 +318,9 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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


