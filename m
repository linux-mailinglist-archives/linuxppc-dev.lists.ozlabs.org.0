Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D54196C3E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 11:50:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qrRm2yGczDqVn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 20:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nZv9uTJv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qrFK1wddzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 20:41:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qrFB0973z9tyY3;
 Sun, 29 Mar 2020 11:41:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nZv9uTJv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2zmiWZ7-AHN8; Sun, 29 Mar 2020 11:41:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qrF967dnz9tyXy;
 Sun, 29 Mar 2020 11:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585474861; bh=gyc0KSG1MOaZHgdnpG7GtSJMQKPfyUcdPBh1LT8OAPs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=nZv9uTJvBi9sz3t0BN8DmBroEZznWR2oWX4vsucTq3Eha9WuP8SLt0UkhE2KVaGAi
 z/wM5T5YhxccumGLsvHs/B9RFf/+FnLA+DdXnEne969H6OtK41SW9GMyhqxF7RYLXQ
 Snkez6OnADZtyYvS/memwPWTYVm/BcD/fvzpCzjs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE9548B770;
 Sun, 29 Mar 2020 11:41:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x0WEmDHMfGUF; Sun, 29 Mar 2020 11:41:04 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9787A8B752;
 Sun, 29 Mar 2020 11:41:04 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6868A65653; Sun, 29 Mar 2020 09:41:04 +0000 (UTC)
Message-Id: <29793874e2963d6fe072d2bbd184151a2798c36d.1585474724.git.christophe.leroy@c-s.fr>
In-Reply-To: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 04/12] powerpc/powermac: Blacklist functions running with MMU
 disabled for kprobe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Sun, 29 Mar 2020 09:41:04 +0000 (UTC)
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

kprobe does not handle events happening in real mode, all
functions running with MMU disabled have to be blacklisted.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/powermac/cache.S | 2 ++
 arch/powerpc/platforms/powermac/sleep.S | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/cache.S b/arch/powerpc/platforms/powermac/cache.S
index da69e0fcb4f1..ced225415486 100644
--- a/arch/powerpc/platforms/powermac/cache.S
+++ b/arch/powerpc/platforms/powermac/cache.S
@@ -184,6 +184,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 	mtlr	r10
 	blr
+_ASM_NOKPROBE_SYMBOL(flush_disable_75x)
 
 /* This code is for 745x processors */
 flush_disable_745x:
@@ -351,4 +352,5 @@ END_FTR_SECTION_IFSET(CPU_FTR_L3CR)
 	mtmsr	r11		/* restore DR and EE */
 	isync
 	blr
+_ASM_NOKPROBE_SYMBOL(flush_disable_745x)
 #endif	/* CONFIG_PPC_BOOK3S_32 */
diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
index bd6085b470b7..f9a680fdd9c4 100644
--- a/arch/powerpc/platforms/powermac/sleep.S
+++ b/arch/powerpc/platforms/powermac/sleep.S
@@ -244,7 +244,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPEC7450)
 	mtmsr	r2
 	isync
 	b	1b
-
+_ASM_NOKPROBE_SYMBOL(low_cpu_die)
 /*
  * Here is the resume code.
  */
@@ -282,6 +282,7 @@ _GLOBAL(core99_wake_up)
 	lwz	r1,0(r3)
 
 	/* Pass thru to older resume code ... */
+_ASM_NOKPROBE_SYMBOL(core99_wake_up)
 /*
  * Here is the resume code for older machines.
  * r1 has the physical address of SL_PC(sp).
@@ -429,6 +430,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	lwz	r0,4(r1)
 	mtlr	r0
 	blr
+_ASM_NOKPROBE_SYMBOL(grackle_wake_up)
 
 turn_on_mmu:
 	mflr	r4
@@ -438,6 +440,7 @@ turn_on_mmu:
 	sync
 	isync
 	rfi
+_ASM_NOKPROBE_SYMBOL(turn_on_mmu)
 
 #endif /* defined(CONFIG_PM) || defined(CONFIG_CPU_FREQ) */
 
-- 
2.25.0

