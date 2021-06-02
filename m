Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB739814F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 08:42:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fvzww5kjBz30Bc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:42:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvzwY2CH3z2xdM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:42:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FvzwL6RhKzB4DW;
 Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9CVo9TAdrt0; Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FvzwL5ZXSzB4DS;
 Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3D578B7D3;
 Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vz9d4AYzKUVS; Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 695928B771;
 Wed,  2 Jun 2021 08:42:10 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3147364064; Wed,  2 Jun 2021 06:42:10 +0000 (UTC)
Message-Id: <169310e08152aa1d96c979770291d165ec6896ae.1622616032.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/44x: Implement Kernel Userspace Exec Protection (KUEP)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  2 Jun 2021 06:42:10 +0000 (UTC)
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

Powerpc 44x has two bits for exec protection in TLBs: one
for user (UX) and one for superviser (SX).

Clear SX on user pages in TLB miss handlers to provide KUEP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-44x.h |  1 +
 arch/powerpc/kernel/head_44x.S               |  8 ++++++++
 arch/powerpc/mm/nohash/44x.c                 | 13 +++++++++++++
 arch/powerpc/platforms/Kconfig.cputype       |  1 +
 4 files changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-44x.h b/arch/powerpc/include/asm/nohash/32/mmu-44x.h
index 2d92a39d8f2e..43ceca128531 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-44x.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-44x.h
@@ -113,6 +113,7 @@ typedef struct {
 
 /* patch sites */
 extern s32 patch__tlb_44x_hwater_D, patch__tlb_44x_hwater_I;
+extern s32 patch__tlb_44x_kuep, patch__tlb_47x_kuep;
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 5c106ac36626..2cfb496df615 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -532,6 +532,10 @@ finish_tlb_load_44x:
 	andi.	r10,r12,_PAGE_USER		/* User page ? */
 	beq	1f				/* nope, leave U bits empty */
 	rlwimi	r11,r11,3,26,28			/* yes, copy S bits to U */
+#ifdef CONFIG_PPC_KUEP
+0:	rlwinm	r11,r11,0,~PPC44x_TLB_SX	/* Clear SX if User page */
+	patch_site 0b, patch__tlb_44x_kuep
+#endif
 1:	tlbwe	r11,r13,PPC44x_TLB_ATTRIB	/* Write ATTRIB */
 
 	/* Done...restore registers and get out of here.
@@ -743,6 +747,10 @@ finish_tlb_load_47x:
 	andi.	r10,r12,_PAGE_USER		/* User page ? */
 	beq	1f				/* nope, leave U bits empty */
 	rlwimi	r11,r11,3,26,28			/* yes, copy S bits to U */
+#ifdef CONFIG_PPC_KUEP
+0:	rlwinm	r11,r11,0,~PPC47x_TLB2_SX	/* Clear SX if User page */
+	patch_site 0b, patch__tlb_47x_kuep
+#endif
 1:	tlbwe	r11,r13,2
 
 	/* Done...restore registers and get out of here.
diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
index 3d6ae7c72412..7da6d1e9fc9b 100644
--- a/arch/powerpc/mm/nohash/44x.c
+++ b/arch/powerpc/mm/nohash/44x.c
@@ -239,3 +239,16 @@ void __init mmu_init_secondary(int cpu)
 	}
 }
 #endif /* CONFIG_SMP */
+
+#ifdef CONFIG_PPC_KUEP
+void __init setup_kuep(bool disabled)
+{
+	if (disabled)
+		patch_instruction_site(&patch__tlb_44x_kuep, ppc_inst(PPC_RAW_NOP()));
+	else
+		pr_info("Activating Kernel Userspace Execution Prevention\n");
+
+	if (IS_ENABLED(CONFIG_PPC_47x) && disabled)
+		patch_instruction_site(&patch__tlb_47x_kuep, ppc_inst(PPC_RAW_NOP()));
+}
+#endif
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 885140055b7a..226c821f1fcd 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -61,6 +61,7 @@ config 44x
 	select 4xx_SOC
 	select HAVE_PCI
 	select PHYS_64BIT
+	select PPC_HAVE_KUEP
 
 endchoice
 
-- 
2.25.0

