Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1C432FA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQWJ5Wnmz3fFR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:35:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQQP5g3bz3cm8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPQ23Prz9sSm;
 Tue, 19 Oct 2021 09:30:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10x_9KnyJlTZ; Tue, 19 Oct 2021 09:30:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP758jKz9sSy;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B9128B786;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ra3SWlL39iq0; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41A308B780;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7Tftk3188486
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7Tf3l3188485;
 Tue, 19 Oct 2021 09:29:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 22/22] powerpc: Remove CONFIG_PPC_HAVE_KUAP and
 CONFIG_PPC_HAVE_KUEP
Date: Tue, 19 Oct 2021 09:29:33 +0200
Message-Id: <a3c007ad0951965199e6ab2ef1035966bc66e771.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628571; l=2518; s=20211009;
 h=from:subject:message-id; bh=+Ag+EzR4jN80NF6HBsWjInBW4fd1lRK6plQvTBEObwc=;
 b=0L6eY0+OEIBUyOAvLtLb6mHjb6iQfFSGStHCP5vyNVn3284Plcny75wq7gqOOvNm5raSRfHaBKaS
 bBxbxjpsCmzFQIo6/terkNHlwuGaudHP+fW8ryCU570ZTsZ3sJLn
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All platforms now have KUAP and KUEP so remove CONFIG_PPC_HAVE_KUAP
and CONFIG_PPC_HAVE_KUEP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/Kconfig.cputype | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index f3614bfd47ad..744cb201ae4d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -30,22 +30,17 @@ config PPC_BOOK3S_32
 	bool "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
 	imply PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
-	select PPC_HAVE_KUEP
-	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
 
 config PPC_85xx
 	bool "Freescale 85xx"
 	select E500
-	select PPC_HAVE_KUAP
 
 config PPC_8xx
 	bool "Freescale 8xx"
 	select ARCH_SUPPORTS_HUGETLBFS
 	select FSL_SOC
-	select PPC_HAVE_KUEP
 	select PPC_KUEP
-	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
 	select HUGETLBFS
 
@@ -55,8 +50,6 @@ config 40x
 	select PPC_UDBG_16550
 	select 4xx_SOC
 	select HAVE_PCI
-	select PPC_HAVE_KUAP
-	select PPC_HAVE_KUEP
 	select PPC_KUEP if PPC_KUAP
 
 config 44x
@@ -66,9 +59,7 @@ config 44x
 	select 4xx_SOC
 	select HAVE_PCI
 	select PHYS_64BIT
-	select PPC_HAVE_KUEP
 	select PPC_KUEP
-	select PPC_HAVE_KUAP
 
 endchoice
 
@@ -113,8 +104,6 @@ config PPC_BOOK3S_64
 	select HAVE_MOVE_PUD
 	select IRQ_WORK
 	select PPC_MM_SLICES
-	select PPC_HAVE_KUEP
-	select PPC_HAVE_KUAP
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
@@ -122,7 +111,6 @@ config PPC_BOOK3E_64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select ZONE_DMA
-	select PPC_HAVE_KUAP
 
 endchoice
 
@@ -303,7 +291,6 @@ config PPC_FSL_BOOK3E
 	select FSL_EMB_PERFMON
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
-	select PPC_HAVE_KUEP
 	select PPC_KUEP
 	default y if FSL_BOOKE
 
@@ -402,24 +389,16 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
-config PPC_HAVE_KUEP
-	bool
-
 config PPC_KUEP
 	bool "Kernel Userspace Execution Prevention" if !40x
-	depends on PPC_HAVE_KUEP
 	default y if !40x
 	help
 	  Enable support for Kernel Userspace Execution Prevention (KUEP)
 
 	  If you're unsure, say Y.
 
-config PPC_HAVE_KUAP
-	bool
-
 config PPC_KUAP
 	bool "Kernel Userspace Access Protection"
-	depends on PPC_HAVE_KUAP
 	default y
 	help
 	  Enable support for Kernel Userspace Access Protection (KUAP)
-- 
2.31.1

