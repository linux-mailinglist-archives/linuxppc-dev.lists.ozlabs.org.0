Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7665BD32C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWJn0wZdz3fjr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFm5Md6z3drm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:02:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWDz5t9Tz9sjb;
	Mon, 19 Sep 2022 19:02:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2bXSXiVWDFN; Mon, 19 Sep 2022 19:02:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr5b4Kz9sl3;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A858D8B77C;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cmXSjdREm2Sd; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FD588B77E;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1xer1549641
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:59 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1xve1549640;
	Mon, 19 Sep 2022 19:01:59 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 16/19] powerpc: Replace PPC_85xx || PPC_BOOKE_64 by PPC_E500
Date: Mon, 19 Sep 2022 19:01:40 +0200
Message-Id: <af79696f8cb8536fb4e20c0d98a6bf159a9e371b.1663606876.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606900; l=1782; s=20211009; h=from:subject:message-id; bh=UJi3fSq9YyqvrQXx+rfY1Dr4LEswdpSbyKUknMCg/i0=; b=6twIdX4Th+pdfiRWuQYKheZYVRQls3kKcFzf2tEykOdQ+Qi1EMdDIGJGsafaUhUc0EG+CQafvuRI 3NEWIkkaCdiL+xyBaTAWpXR7tszGAJ2FvFRyURRcS+sFuLr0TGbc
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

PPC_E500 is the same as PPC_85xx || PPC_BOOKE_64

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   | 2 +-
 arch/powerpc/platforms/85xx/Kconfig    | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 38f36eb4d96c..1e6346dcb1b4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -548,7 +548,7 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 
 config KEXEC
 	bool "kexec system call"
-	depends on (PPC_BOOK3S || PPC_85xx || (44x && !SMP)) || PPC_BOOK3E_64
+	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 63fec86e41b4..b92cb2b4d54d 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig FSL_SOC_BOOKE
 	bool "Freescale Book-E Machine Type"
-	depends on PPC_85xx || PPC_BOOK3E_64
+	depends on PPC_E500
 	select FSL_SOC
 	select PPC_UDBG_16550
 	select MPIC
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 1746d19d058f..6a216e88423b 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -487,7 +487,7 @@ config FORCE_SMP
 	select SMP
 
 config SMP
-	depends on PPC_BOOK3S || PPC_BOOK3E_64 || PPC_85xx || PPC_47x
+	depends on PPC_BOOK3S || PPC_E500 || PPC_47x
 	select GENERIC_IRQ_MIGRATION
 	bool "Symmetric multi-processing support" if !FORCE_SMP
 	help
-- 
2.37.1

