Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35927FF7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 14:51:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2CgD6QP9zDqW5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 22:51:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2CT46rR0zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 22:42:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C2CSt1kgDz9twnx;
 Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Uze5SQgXDq8H; Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C2CSt0dCxz9twnv;
 Thu,  1 Oct 2020 14:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D85B98B96F;
 Thu,  1 Oct 2020 14:42:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zzfhcmh3VLXJ; Thu,  1 Oct 2020 14:42:39 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E6E58B903;
 Thu,  1 Oct 2020 14:42:39 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2295D65ED8; Thu,  1 Oct 2020 12:42:39 +0000 (UTC)
Message-Id: <94dc68d3d9ef9eb549796d4b938b6ba0305a049b.1601556145.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/6] powerpc/time: Rename mftbl() to mftb()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  1 Oct 2020 12:42:39 +0000 (UTC)
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

On PPC64, we have mftb().
On PPC32, we have mftbl() and an #define mftb() mftbl().

mftb() and mftbl() are equivalent, their purpose is to read the
content of SPRN_TRBL, as returned by 'mftb' simplified instruction.

binutils seems to define 'mftbl' instruction as an equivalent
of 'mftb'.

However in both 32 bits and 64 bits documentation, only 'mftb' is
defined, and when performing a disassembly with objdump, the displayed
instruction is 'mftb'

No need to have two ways to do the same thing with different
names, rename mftbl() to have only mftb().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/reg.h  | 5 ++---
 arch/powerpc/include/asm/time.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 788058af1d44..c66dcdb47c44 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1439,19 +1439,18 @@ static inline void msr_check_and_clear(unsigned long bits)
 #else /* __powerpc64__ */
 
 #if defined(CONFIG_PPC_8xx)
-#define mftbl()		({unsigned long rval;	\
+#define mftb()		({unsigned long rval;	\
 			asm volatile("mftbl %0" : "=r" (rval)); rval;})
 #define mftbu()		({unsigned long rval;	\
 			asm volatile("mftbu %0" : "=r" (rval)); rval;})
 #else
-#define mftbl()		({unsigned long rval;	\
+#define mftb()		({unsigned long rval;	\
 			asm volatile("mfspr %0, %1" : "=r" (rval) : \
 				"i" (SPRN_TBRL)); rval;})
 #define mftbu()		({unsigned long rval;	\
 			asm volatile("mfspr %0, %1" : "=r" (rval) : \
 				"i" (SPRN_TBRU)); rval;})
 #endif
-#define mftb()		mftbl()
 #endif /* !__powerpc64__ */
 
 #define mttbl(v)	asm volatile("mttbl %0":: "r"(v))
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index a80abf64c8a5..b0fb8456305f 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -50,7 +50,7 @@ struct div_result {
 
 static inline unsigned long get_tbl(void)
 {
-	return mftbl();
+	return mftb();
 }
 
 static inline unsigned int get_tbu(void)
-- 
2.25.0

