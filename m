Return-Path: <linuxppc-dev+bounces-11382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C12DB3856F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 16:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBnWy5Bhfz300M;
	Thu, 28 Aug 2025 00:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756306238;
	cv=none; b=GUztDpZO17gmkzugcjsXAv2Vv2pcsiqNoy1xPwcfFyGFQyJywxG6LPV18rvI+RW+GUoxBkSG06/OFnXWijneEjmoUg6m0SDw9CcOSEgqmB2dxOV3toqXCknaNp4Ocs2W4JR0xfSiwjfkf5g7C/4OwX23F4+niLlufEzpXahHiWoVsP29MtN20QUStRnihGAQ6EDEW2ivKimMkBMzKG1cItkBx+fps65n6X8HkW9KjQtGpALP1OxrjqaaB/6HA1lcz8ZnuQdBI9/sqNRk21WspRkIcLBmYOn4je7KJZYqKn7wBmUnFkzwW86SgeqjSCgNWDLq4UuSTPZZ2jI2vzEYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756306238; c=relaxed/relaxed;
	bh=HPvgeg4Utm2duhtMJaUL2PdfvM/e1oWGmJnTmtS3CfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Asswkj+9pV3nVoI6EOWPCU+j8QBHaViXVPk1EW18zYsm2hAiOWw1enivJfsB1NuqT3JHYMlzu9DpHCbyn45WXBFzOf4xjC4/8NKosCgsfD+AvFS7Lu1FX9gYoJVioLmxC+Y0tbu+DnN0o/KYwrWnf8z4wyvjOIbRjV2g4NULcB7c9abhNBPzbdZWzbNo9EJKbil3p0fD+N9jMsF355NrZpmMNCHeHzsT/j6CS8vYVsbpU9/jmSaSFPM0lCJHeoWTBawxTn1HuSHOGQ/Ghtshix3PLGbTsB/qSNF5qaktHVtG/jGWP0WoYkpgQhdeJ9Z+o0J1LPUo2pCn6fyJxy5L6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBnWx2nY2z2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 00:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cBmqM2Vk7z9sSL;
	Wed, 27 Aug 2025 16:18:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQd1F6GM_ru7; Wed, 27 Aug 2025 16:18:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cBmqM1qYbz9sS7;
	Wed, 27 Aug 2025 16:18:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AB9F8B764;
	Wed, 27 Aug 2025 16:18:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yo6pDWUFDWhs; Wed, 27 Aug 2025 16:18:55 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3C938B763;
	Wed, 27 Aug 2025 16:18:54 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/8xx: Remove specific code from fast_exception_return
Date: Wed, 27 Aug 2025 16:18:53 +0200
Message-ID: <39de3e0f0122b571474b1ba352a2dc3ad8cb71dd.1756304318.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756304333; l=1240; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=BGqk+ZHtbDcp14hLUoVWqfA4Qu7UUwR0VhirzMOLS8M=; b=TywMfj0R83yFULH9w5LpdDXqVvfuNGlJLKTmnTgLg/J/yv3hzhDHn/oXsxSwLhDvP635D9jbb 0Ct3wus2JeGAM70cOMLXglmfPswHTfcOFOsMSsMidVB6CQyBdnJ9IFS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The label 2: in fast_exception_return is a leftover from
commit b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C
exception exit from ppc64"). Once removed, we see that
fast_exception_return is a standalone function that is called only
from pieces of assembly dedicated to book3s/32 or booke, never by
common code or 8xx code.

So remove the clear of MSR[RI] enclosed in #ifdef CONFIG_PPC_8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index f4a8c9877249..762df811433c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -216,7 +216,7 @@ fast_exception_return:
 	beq	3f			/* if not, we've got problems */
 #endif
 
-2:	lwz	r10,_CCR(r11)
+	lwz	r10,_CCR(r11)
 	REST_GPRS(1, 6, r11)
 	mtcr	r10
 	lwz	r10,_LINK(r11)
@@ -225,9 +225,6 @@ fast_exception_return:
 	li	r10, 0
 	stw	r10, 8(r11)
 	REST_GPR(10, r11)
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
 	mtspr	SPRN_SRR1,r9
 	mtspr	SPRN_SRR0,r12
 	REST_GPR(9, r11)
-- 
2.49.0


