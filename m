Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C41A141D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxD04lx9zDqLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Jm7L/VQb"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jx5G3kQ0zDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:45:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Jx540jNCz9tyrP;
 Thu, 29 Aug 2019 10:45:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Jm7L/VQb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eB9ya2BiEsKH; Thu, 29 Aug 2019 10:45:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Jx536hbPz9tyrN;
 Thu, 29 Aug 2019 10:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567068311; bh=RtnxFZ8galZ9iyHfU5Oz/Hsl2pQKCYgIH0h1HyzzXoc=;
 h=From:Subject:To:Cc:Date:From;
 b=Jm7L/VQbV/d5R5D1o3FVuXWwFcv7oDRbgge0Qw86T666tjKOyx4CeYy6J7wkrRA36
 YP1cGr6aUYYjLdF5PIJLIh6pXnoHL1qQm+6/ouvE6sDY7ry6Lfl/P7pmf2O9HdakOm
 wck+mPr1BldQBXSTdIlpREVRdzY9fr4PapTDHjkg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BC608B8AC;
 Thu, 29 Aug 2019 10:45:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uSHDI0y2b93L; Thu, 29 Aug 2019 10:45:12 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.204.43])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB3318B7B2;
 Thu, 29 Aug 2019 10:45:12 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 61D08696C1; Thu, 29 Aug 2019 08:45:12 +0000 (UTC)
Message-Id: <dd82934ad91aab607d0eb7e626c14e6ac0d654eb.1567068137.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/2] powerpc: permanently include 8xx registers in reg.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org, npiggin@gmail.com
Date: Thu, 29 Aug 2019 08:45:12 +0000 (UTC)
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

Most 8xx registers have specific names, so just include
reg_8xx.h all the time in reg.h in order to have them defined
even when CONFIG_PPC_8xx is not selected. This will avoid
the need for #ifdefs in C code.

Guard SPRN_ICTRL in an #ifdef CONFIG_PPC_8xx as this register
has same name but different meaning and different spr number as
another register in the mpc7450.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: no change

v3: fixed build failure on ppc64e_defconfig (removed asm/mmu.h inclusion from asm/reg_8xx.h)
---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 1 +
 arch/powerpc/include/asm/reg.h               | 2 --
 arch/powerpc/include/asm/reg_8xx.h           | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 1c3133b5f86a..1006a427e99c 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_KUP_8XX_H_
 
 #include <asm/bug.h>
+#include <asm/mmu.h>
 
 #ifdef CONFIG_PPC_KUAP
 
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 10caa145f98b..b17ee25df226 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -25,9 +25,7 @@
 #include <asm/reg_fsl_emb.h>
 #endif
 
-#ifdef CONFIG_PPC_8xx
 #include <asm/reg_8xx.h>
-#endif /* CONFIG_PPC_8xx */
 
 #define MSR_SF_LG	63              /* Enable 64 bit mode */
 #define MSR_ISF_LG	61              /* Interrupt 64b mode valid on 630 */
diff --git a/arch/powerpc/include/asm/reg_8xx.h b/arch/powerpc/include/asm/reg_8xx.h
index 7192eece6c3e..07df35ee8cbc 100644
--- a/arch/powerpc/include/asm/reg_8xx.h
+++ b/arch/powerpc/include/asm/reg_8xx.h
@@ -5,8 +5,6 @@
 #ifndef _ASM_POWERPC_REG_8xx_H
 #define _ASM_POWERPC_REG_8xx_H
 
-#include <asm/mmu.h>
-
 /* Cache control on the MPC8xx is provided through some additional
  * special purpose registers.
  */
@@ -38,7 +36,9 @@
 #define SPRN_CMPF	153
 #define SPRN_LCTRL1	156
 #define SPRN_LCTRL2	157
+#ifdef CONFIG_PPC_8xx
 #define SPRN_ICTRL	158
+#endif
 #define SPRN_BAR	159
 
 /* Commands.  Only the first few are available to the instruction cache.
-- 
2.13.3

