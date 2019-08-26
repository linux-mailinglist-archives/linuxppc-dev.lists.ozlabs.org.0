Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE09D3BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 18:11:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HH6q5N3RzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LFhVV3yl"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGjL2QT1zDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:52:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HGj95f14z9v7Dl;
 Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LFhVV3yl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wk5ekpmnXdrp; Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HGj94d2mz9v7Dq;
 Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566834733; bh=55lfFWIpIzscVbpNaJwDOZ2UksxWlh2EvsbwLUcbQjc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LFhVV3yl32gaLsoIMftaT8Jv9yDRzm3bocYvXr+XqPNQMIwNX7eBMeEyDjDk4veB5
 z22LY1PWKkSglPC6/V91+SbKGlO593AfPaNPqJUki9nL/SRkQ5RhJPnQZCQ15h2L01
 FeLo8wEPlzIFAoDBQn3Z1trGpI0GZVsg6/htTQN4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFD4D8B7E1;
 Mon, 26 Aug 2019 17:52:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hhafPt5-8mZj; Mon, 26 Aug 2019 17:52:18 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F8728B7F0;
 Mon, 26 Aug 2019 17:52:18 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 140B8696D8; Mon, 26 Aug 2019 15:52:18 +0000 (UTC)
Message-Id: <b5902144266d2f4eed1ffea53915bd0245841e02.1566834712.git.christophe.leroy@c-s.fr>
In-Reply-To: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
References: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 5/6] powerpc/32: drop CPU_FTR_UNIFIED_ID_CACHE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 15:52:18 +0000 (UTC)
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

Only 601 and e200 have unified I/D cache.

Drop the feature and use CONFIG_PPC_BOOK3S_601 and CONFIG_E200.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cputable.h | 5 ++---
 arch/powerpc/kernel/misc_32.S       | 4 ++--
 arch/powerpc/kernel/setup_32.c      | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fac1b81bbbd9..a1ebcbc3931f 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -158,7 +158,6 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_NEED_COHERENT		ASM_CONST(0x01000000)
 #define CPU_FTR_NO_BTIC			ASM_CONST(0x02000000)
 #define CPU_FTR_PPC_LE			ASM_CONST(0x04000000)
-#define CPU_FTR_UNIFIED_ID_CACHE	ASM_CONST(0x08000000)
 #define CPU_FTR_SPE			ASM_CONST(0x10000000)
 #define CPU_FTR_NEED_PAIRED_STWCX	ASM_CONST(0x20000000)
 #define CPU_FTR_INDEXED_DCR		ASM_CONST(0x40000000)
@@ -292,7 +291,7 @@ static inline void cpu_feature_keys_init(void) { }
 #endif
 
 #define CPU_FTRS_PPC601	(CPU_FTR_COMMON | \
-	CPU_FTR_COHERENT_ICACHE | CPU_FTR_UNIFIED_ID_CACHE)
+	CPU_FTR_COHERENT_ICACHE)
 #define CPU_FTRS_603	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | \
 	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_604	(CPU_FTR_COMMON | CPU_FTR_PPC_LE)
@@ -383,7 +382,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_47X	(CPU_FTRS_440x6)
 #define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
 	    CPU_FTR_NODSISRALIGN | CPU_FTR_COHERENT_ICACHE | \
-	    CPU_FTR_UNIFIED_ID_CACHE | CPU_FTR_NOEXECUTE | \
+	    CPU_FTR_NOEXECUTE | \
 	    CPU_FTR_DEBUG_LVL_EXC)
 #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
 	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_NODSISRALIGN | \
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index b917641cdaa6..3d21fb110797 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -292,14 +292,14 @@ _GLOBAL(flush_instruction_cache)
 	iccci	0,r3
 #endif
 #elif defined(CONFIG_FSL_BOOKE)
-BEGIN_FTR_SECTION
+#ifdef CONFIG_E200
 	mfspr   r3,SPRN_L1CSR0
 	ori     r3,r3,L1CSR0_CFI|L1CSR0_CLFC
 	/* msync; isync recommended here */
 	mtspr   SPRN_L1CSR0,r3
 	isync
 	blr
-END_FTR_SECTION_IFSET(CPU_FTR_UNIFIED_ID_CACHE)
+#endif
 	mfspr	r3,SPRN_L1CSR1
 	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
 	mtspr	SPRN_L1CSR1,r3
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 94517e4a2723..a7541edf0cdb 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -206,6 +206,6 @@ __init void initialize_cache_info(void)
 	dcache_bsize = cur_cpu_spec->dcache_bsize;
 	icache_bsize = cur_cpu_spec->icache_bsize;
 	ucache_bsize = 0;
-	if (cpu_has_feature(CPU_FTR_UNIFIED_ID_CACHE))
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601) || IS_ENABLED(CONFIG_E200))
 		ucache_bsize = icache_bsize = dcache_bsize;
 }
-- 
2.13.3

