Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85915B2515
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:44:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmhq65g2z3frF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmb337lFz3dsb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:39:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYx6NGvz9sks;
	Thu,  8 Sep 2022 19:38:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wQZlthlj9g1; Thu,  8 Sep 2022 19:38:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYj4ww8z9smR;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8117C8B790;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g2OizmFAtnfx; Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32B218B794;
	Thu,  8 Sep 2022 19:38:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcDab3449209
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcDvX3449208;
	Thu, 8 Sep 2022 19:38:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 17/19] powerpc: Simplify redundant Kconfig tests
Date: Thu,  8 Sep 2022 19:37:50 +0200
Message-Id: <a274e2da320ab42a445e4853cbe5b08d08c60d03.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=1787; s=20211009; h=from:subject:message-id; bh=usDIwDyET2HPqvzqheQPwxWf+mlVIrCjZAGd5cXNP78=; b=OSXLMbKQok7YSYk7Ejj5BpBYcP/eqrmk0zgIZvgGB773jWssJrva+lzE4C5YB8nLiUif31XsvRMC LfFl+qLbAONs3qlDjWa7kHF5zXUeddv7FwdmG6hyG4mR506V9ruQ
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

PPC_85xx implies PPC32 so no need to check PPC32 in addition.

PPC64 && !PPC_BOOK3E_64 means PPC_BOOK3S_64.

PPC_BOOK3E_64 implies PPC_E500.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 arch/powerpc/xmon/xmon.c               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1e6346dcb1b4..da9bd5db1643 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -606,7 +606,7 @@ config RELOCATABLE
 
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image"
-	depends on (PPC_85xx && FLATMEM && PPC32)
+	depends on PPC_85xx && FLATMEM
 	depends on RELOCATABLE
 	help
 	  Randomizes the virtual address at which the kernel image is
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6a216e88423b..51059af63856 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -314,7 +314,7 @@ config 4xx
 
 config BOOKE
 	bool
-	depends on PPC_E500 || 44x || PPC_BOOK3E_64
+	depends on PPC_E500 || 44x
 	default y
 
 config BOOKE_OR_40x
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e6d678d27b0f..f51c882bf902 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -288,7 +288,7 @@ Commands:\n\
   t	print backtrace\n\
   x	exit monitor and recover\n\
   X	exit monitor and don't recover\n"
-#if defined(CONFIG_PPC64) && !defined(CONFIG_PPC_BOOK3E_64)
+#if defined(CONFIG_PPC_BOOK3S_64)
 "  u	dump segment table or SLB\n"
 #elif defined(CONFIG_PPC_BOOK3S_32)
 "  u	dump segment registers\n"
-- 
2.37.1

