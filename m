Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC995B24FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmfM34hZz3fW4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmZb59FQz3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:39:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYr0dSxz9sm2;
	Thu,  8 Sep 2022 19:38:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUE2XaSnPuKu; Thu,  8 Sep 2022 19:38:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYg5c52z9smM;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B9FDA8B78F;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hBBxy5nnz-4I; Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C40F88B79E;
	Thu,  8 Sep 2022 19:38:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcD0S3449205
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcDYD3449204;
	Thu, 8 Sep 2022 19:38:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 16/19] powerpc: Replace PPC_85xx || PPC_BOOKE_64 by PPC_E500
Date: Thu,  8 Sep 2022 19:37:49 +0200
Message-Id: <e6e8cfcf9ade7ce2bdf1cd1943e51fc6666742bf.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=1782; s=20211009; h=from:subject:message-id; bh=UJi3fSq9YyqvrQXx+rfY1Dr4LEswdpSbyKUknMCg/i0=; b=KhaLCGFF27CvSDgey4I4BvaTjy0EPKdndfBpapc88eK1vcQwFMuG7HqvaaN0IZbvjMAvEUUWkeMl x0LBike8CjRnTQEvI6OGBcWLCiXYgaxmL4L5hoHfrN1EkOcONqzr
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

