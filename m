Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FE432F96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQSg2h6dz3dyl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQPx0y0mz3c5w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:29 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPK6fdWz9sSs;
 Tue, 19 Oct 2021 09:29:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNGsfHxtrcVu; Tue, 19 Oct 2021 09:29:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP71WBlz9sSB;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DC498B774;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id W4Q0S6JCujtc; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 358F78B780;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7Tc0o3188406
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:38 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TcMM3188405;
 Tue, 19 Oct 2021 09:29:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 02/22] powerpc/8xx: Activate KUEP at all time
Date: Tue, 19 Oct 2021 09:29:13 +0200
Message-Id: <2129e86944323ffe9ed07fffbeafdfd2e363690a.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=2690; s=20211009;
 h=from:subject:message-id; bh=5Hcdv8SHIZckvsLT7lpELb/CUd26NlE7taSteKwUXZA=;
 b=NgJ8+OxHimFcWO7poaSvDync6cdDnVZrgCezl2Kz2YCPL9LQ/wxXZw9xrL367SftBVdsb1ibyqNv
 nga1NqMLA6TDQFW4C3AN9Suf6NNLtludWcJXxKX9i8P9KEBgkL64
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

On the 8xx, there is absolutely no runtime impact with KUEP. Protection
against execution of user code in kernel mode is set up at boot time
by configuring the groups with contain all user pages as having swapped
protection rights, in extenso EX for user and NA for supervisor.

Configure KUEP at startup and force selection of CONFIG_PPC_KUEP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 6 ++----
 arch/powerpc/mm/nohash/8xx.c                 | 5 -----
 arch/powerpc/platforms/Kconfig.cputype       | 1 +
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 997cec973406..0e93a4728c9e 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -39,12 +39,10 @@
  * 0 => Kernel => 11 (all accesses performed according as user iaw page definition)
  * 1 => Kernel+Accessed => 01 (all accesses performed according to page definition)
  * 2 => User => 11 (all accesses performed according as user iaw page definition)
- * 3 => User+Accessed => 00 (all accesses performed as supervisor iaw page definition) for INIT
- *                    => 10 (all accesses performed according to swaped page definition) for KUEP
+ * 3 => User+Accessed => 10 (all accesses performed according to swaped page definition) for KUEP
  * 4-15 => Not Used
  */
-#define MI_APG_INIT	0xdc000000
-#define MI_APG_KUEP	0xde000000
+#define MI_APG_INIT	0xde000000
 
 /* The effective page number register.  When read, contains the information
  * about the last instruction TLB miss.  When MI_RPN is written, bits in
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index baa1f8a40af8..e878e8124ee6 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -215,12 +215,7 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 #ifdef CONFIG_PPC_KUEP
 void setup_kuep(bool disabled)
 {
-	if (disabled)
-		return;
-
 	pr_info("Activating Kernel Userspace Execution Prevention\n");
-
-	mtspr(SPRN_MI_AP, MI_APG_KUEP);
 }
 #endif
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..66650ec1c7e6 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -43,6 +43,7 @@ config PPC_8xx
 	select ARCH_SUPPORTS_HUGETLBFS
 	select FSL_SOC
 	select PPC_HAVE_KUEP
+	select PPC_KUEP
 	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
 	select HUGETLBFS
-- 
2.31.1

