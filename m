Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2D9F113
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 19:04:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HwFz0LP1zDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 03:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="gVWWO6Ic"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hw675nbrzDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:57:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Hw5z6vG9z9txt1;
 Tue, 27 Aug 2019 18:57:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gVWWO6Ic; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AE3RAvWcKv5D; Tue, 27 Aug 2019 18:57:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Hw5z5PW7z9txsv;
 Tue, 27 Aug 2019 18:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566925047; bh=ubHkbneok8K2cTYT/jQrBsXkaZGXihrm+aatYILFw2I=;
 h=From:Subject:To:Cc:Date:From;
 b=gVWWO6IcTMnvIj39ktT9tiPESnFDEQ0WhT3Xpm6aktoOi2R6+6fGoyFguDAxdmJBy
 zEdtfwOipOahid/G69xheHIBQiYtTmi49UEolD3hsqI1j2d9dA/j2DiMa5Y2mY8hWy
 +CeBVXNOtF5Jd4dmCIwKpIDu6/P/gCISNN8H4ZGk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 72E3B8B842;
 Tue, 27 Aug 2019 18:57:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g4EpfJcQhBIs; Tue, 27 Aug 2019 18:57:29 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CB608B847;
 Tue, 27 Aug 2019 18:57:29 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CF443696EA; Tue, 27 Aug 2019 16:57:28 +0000 (UTC)
Message-Id: <b1142845c040b9702d1609d5ec473d97595dc0c3.1566925029.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc: permanently include 8xx registers in reg.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ravi.bangoria@linux.ibm.com
Date: Tue, 27 Aug 2019 16:57:28 +0000 (UTC)
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
 arch/powerpc/include/asm/reg.h     | 2 --
 arch/powerpc/include/asm/reg_8xx.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index 7192eece6c3e..abc663c0f1db 100644
--- a/arch/powerpc/include/asm/reg_8xx.h
+++ b/arch/powerpc/include/asm/reg_8xx.h
@@ -38,7 +38,9 @@
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

