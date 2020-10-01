Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D427FF6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 14:46:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2CYl3748zDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 22:46:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2CT51klszDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 22:42:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C2CSt5lgqz9twyY;
 Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ee-S4nOmSyib; Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C2CSt4ZHCz9twnv;
 Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 852758B97A;
 Thu,  1 Oct 2020 14:42:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XmSyWz3tLv_U; Thu,  1 Oct 2020 14:42:40 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 434E28B903;
 Thu,  1 Oct 2020 14:42:40 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 283A765ED8; Thu,  1 Oct 2020 12:42:40 +0000 (UTC)
Message-Id: <6bf23ec744aab4ba63506a011f6a145ea35d620d.1601556145.git.christophe.leroy@csgroup.eu>
In-Reply-To: <94dc68d3d9ef9eb549796d4b938b6ba0305a049b.1601556145.git.christophe.leroy@csgroup.eu>
References: <94dc68d3d9ef9eb549796d4b938b6ba0305a049b.1601556145.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/6] powerpc/time: Make mftb() common to PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  1 Oct 2020 12:42:40 +0000 (UTC)
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

No need to have two versions that are identical.

CONFIG_PPC_CELL is only selected by PPC64 targets.
CONFIG_E500 is the only PPC64 target selecting CONFIG_FSL_BOOK3E.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/reg.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index c66dcdb47c44..f877a576b338 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1419,8 +1419,7 @@ static inline void msr_check_and_clear(unsigned long bits)
 		__msr_check_and_clear(bits);
 }
 
-#ifdef __powerpc64__
-#if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_FSL_BOOK3E)
+#if defined(CONFIG_PPC_CELL) || defined(CONFIG_E500)
 #define mftb()		({unsigned long rval;				\
 			asm volatile(					\
 				"90:	mfspr %0, %2;\n"		\
@@ -1430,28 +1429,23 @@ static inline void msr_check_and_clear(unsigned long bits)
 			: "=r" (rval) \
 			: "i" (CPU_FTR_CELL_TB_BUG), "i" (SPRN_TBRL) : "cr0"); \
 			rval;})
+#elif defined(CONFIG_PPC_8xx)
+#define mftb()		({unsigned long rval;	\
+			asm volatile("mftbl %0" : "=r" (rval)); rval;})
 #else
 #define mftb()		({unsigned long rval;	\
 			asm volatile("mfspr %0, %1" : \
 				     "=r" (rval) : "i" (SPRN_TBRL)); rval;})
 #endif /* !CONFIG_PPC_CELL */
 
-#else /* __powerpc64__ */
-
 #if defined(CONFIG_PPC_8xx)
-#define mftb()		({unsigned long rval;	\
-			asm volatile("mftbl %0" : "=r" (rval)); rval;})
 #define mftbu()		({unsigned long rval;	\
 			asm volatile("mftbu %0" : "=r" (rval)); rval;})
 #else
-#define mftb()		({unsigned long rval;	\
-			asm volatile("mfspr %0, %1" : "=r" (rval) : \
-				"i" (SPRN_TBRL)); rval;})
 #define mftbu()		({unsigned long rval;	\
 			asm volatile("mfspr %0, %1" : "=r" (rval) : \
 				"i" (SPRN_TBRU)); rval;})
 #endif
-#endif /* !__powerpc64__ */
 
 #define mttbl(v)	asm volatile("mttbl %0":: "r"(v))
 #define mttbu(v)	asm volatile("mttbu %0":: "r"(v))
-- 
2.25.0

