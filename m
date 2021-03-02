Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9133296FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:48:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqW4f5DRdz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 19:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqW4L6R76z30NX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 19:48:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqW4D4PSMz9txQj;
 Tue,  2 Mar 2021 09:48:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Uz34-VrBM9n8; Tue,  2 Mar 2021 09:48:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqW4D3d1Lz9txQg;
 Tue,  2 Mar 2021 09:48:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76A778B7AC;
 Tue,  2 Mar 2021 09:48:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pjmndtbJUwFo; Tue,  2 Mar 2021 09:48:13 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1AF458B75F;
 Tue,  2 Mar 2021 09:48:13 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 958C1674AD; Tue,  2 Mar 2021 08:48:12 +0000 (UTC)
Message-Id: <f79f83b551b7c955dd2022552ff1c483f4401922.1614674882.git.christophe.leroy@csgroup.eu>
In-Reply-To: <1fc81f07cabebb875b963e295408cc3dd38c8d85.1614674882.git.christophe.leroy@csgroup.eu>
References: <1fc81f07cabebb875b963e295408cc3dd38c8d85.1614674882.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/2] powerpc: Use %y addressing on bitops
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  2 Mar 2021 08:48:12 +0000 (UTC)
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bitops.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 11847b6a244e..264626b13ea8 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -70,12 +70,12 @@ static inline void fn(unsigned long mask,	\
 	unsigned long *p = (unsigned long *)_p;	\
 	__asm__ __volatile__ (			\
 	prefix					\
-"1:"	PPC_LLARX "%0,0,%3,0\n"			\
+"1:"	PPC_LLARX "%0,%y3,0\n"			\
 	stringify_in_c(op) "%0,%0,%2\n"		\
-	PPC_STLCX "%0,0,%3\n"			\
+	PPC_STLCX "%0,%y3\n"			\
 	"bne- 1b\n"				\
 	: "=&r" (old), "+m" (*p)		\
-	: "r" (mask), "r" (p)			\
+	: "r" (mask), "Z" (*p)			\
 	: "cc", "memory");			\
 }
 
@@ -115,13 +115,13 @@ static inline unsigned long fn(			\
 	unsigned long *p = (unsigned long *)_p;		\
 	__asm__ __volatile__ (				\
 	prefix						\
-"1:"	PPC_LLARX "%0,0,%3,%4\n"			\
+"1:"	PPC_LLARX "%0,%y3,%4\n"				\
 	stringify_in_c(op) "%1,%0,%2\n"			\
-	PPC_STLCX "%1,0,%3\n"				\
+	PPC_STLCX "%1,%y3\n"				\
 	"bne- 1b\n"					\
 	postfix						\
 	: "=&r" (old), "=&r" (t)			\
-	: "r" (mask), "r" (p), "i" (IS_ENABLED(CONFIG_PPC64) ? eh : 0)	\
+	: "r" (mask), "Z" (*p), "i" (IS_ENABLED(CONFIG_PPC64) ? eh : 0)	\
 	: "cc", "memory");				\
 	return (old & mask);				\
 }
@@ -170,12 +170,12 @@ clear_bit_unlock_return_word(int nr, volatile unsigned long *addr)
 
 	__asm__ __volatile__ (
 	PPC_RELEASE_BARRIER
-"1:"	PPC_LLARX "%0,0,%3,0\n"
+"1:"	PPC_LLARX "%0,%y3,0\n"
 	"andc %1,%0,%2\n"
-	PPC_STLCX "%1,0,%3\n"
+	PPC_STLCX "%1,%y3\n"
 	"bne- 1b\n"
 	: "=&r" (old), "=&r" (t)
-	: "r" (mask), "r" (p)
+	: "r" (mask), "Z" (*p)
 	: "cc", "memory");
 
 	return old;
-- 
2.25.0

