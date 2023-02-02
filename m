Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC3687B48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 12:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6wpW5r3nz3f48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 22:01:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6wnx1FkBz302m
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 22:01:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P6wnm60SJz9svy;
	Thu,  2 Feb 2023 12:01:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RsAhJRFSqBV; Thu,  2 Feb 2023 12:01:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P6wnl5FQYz9svt;
	Thu,  2 Feb 2023 12:01:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A51AE8B779;
	Thu,  2 Feb 2023 12:01:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JTaqZHlsZ_TI; Thu,  2 Feb 2023 12:01:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.5.213])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 706558B767;
	Thu,  2 Feb 2023 12:01:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 312B1Due4109513
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 2 Feb 2023 12:01:13 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 312B1BVI4109507;
	Thu, 2 Feb 2023 12:01:11 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Disable CPU unknown by CLANG when CC_IS_CLANG
Date: Thu,  2 Feb 2023 12:01:04 +0100
Message-Id: <e62892e32c14a7a5738c597e39e0082cb0abf21c.1675335659.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675335662; l=1918; s=20211009; h=from:subject:message-id; bh=T1nm18iJl4xpzofZJ+3Z32joE+oZKTCIgLvBiflPfmI=; b=ki6QPdVA71l70DsTw316cQGEqYIa1O1NQ6XC1aacpUVfw8BJtC1bWsleSB2MW9+5Jh7dVfR2PTny yq2fug/1AzQsN57PnuOLdeoJDb+Q7rb0tKiJHx8EuyIb28MV6/wn
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

CLANG only knows the following CPUs:

generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630,
g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500,
power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6,
pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9,
power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le,
ppc64le, futur

Disable other ones when CC_IS_CLANG.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/Kconfig.cputype | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 29d6be033576..046b571496b1 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -143,6 +143,7 @@ config POWERPC_CPU
 config CELL_CPU
 	bool "Cell Broadband Engine"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	depends on !CC_IS_CLANG
 	select PPC_64S_HASH_MMU
 
 config PPC_970_CPU
@@ -187,11 +188,13 @@ config E5500_CPU
 config E6500_CPU
 	bool "Freescale e6500"
 	depends on PPC64 && PPC_E500
+	depends on !CC_IS_CLANG
 	select PPC_HAS_LBARX_LHARX
 
 config 405_CPU
 	bool "40x family"
 	depends on 40x
+	depends on !CC_IS_CLANG
 
 config 440_CPU
 	bool "440 (44x family)"
@@ -200,22 +203,27 @@ config 440_CPU
 config 464_CPU
 	bool "464 (44x family)"
 	depends on 44x
+	depends on !CC_IS_CLANG
 
 config 476_CPU
 	bool "476 (47x family)"
 	depends on PPC_47x
+	depends on !CC_IS_CLANG
 
 config 860_CPU
 	bool "8xx family"
 	depends on PPC_8xx
+	depends on !CC_IS_CLANG
 
 config E300C2_CPU
 	bool "e300c2 (832x)"
 	depends on PPC_BOOK3S_32
+	depends on !CC_IS_CLANG
 
 config E300C3_CPU
 	bool "e300c3 (831x)"
 	depends on PPC_BOOK3S_32
+	depends on !CC_IS_CLANG
 
 config G4_CPU
 	bool "G4 (74xx)"
-- 
2.39.1

