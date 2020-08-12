Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AED34242A10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:08:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRVQD6nrLzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:08:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRTS2072nzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:25:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRTRx1gnyzB09Zb;
 Wed, 12 Aug 2020 14:25:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UlvtX8EgB1-Z; Wed, 12 Aug 2020 14:25:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRTRx0nZWzB09ZY;
 Wed, 12 Aug 2020 14:25:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6445D8B826;
 Wed, 12 Aug 2020 14:25:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hFml_FvOlAVn; Wed, 12 Aug 2020 14:25:18 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19DD78B7FC;
 Wed, 12 Aug 2020 14:25:18 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BD14565C3B; Wed, 12 Aug 2020 12:25:17 +0000 (UTC)
Message-Id: <13041c7df39e89ddf574ea0cdc6dedfdd9734140.1597235091.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c27bc4e598daf3bbb225de7a1f5c52121cf1e279.1597235091.git.christophe.leroy@csgroup.eu>
References: <c27bc4e598daf3bbb225de7a1f5c52121cf1e279.1597235091.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 2/2] powerpc/uaccess: Add pre-update addressing to
 __get_user_asm() and __put_user_asm()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 12 Aug 2020 12:25:17 +0000 (UTC)
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

Enable pre-update addressing mode in __get_user_asm() and __put_user_asm()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: new, splited out from patch 1.
---
 arch/powerpc/include/asm/uaccess.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c546fb36043d..eadb25f4cc9f 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -159,7 +159,7 @@ extern long __put_user_bad(void);
  */
 #define __put_user_asm(x, addr, err, op)			\
 	__asm__ __volatile__(					\
-		"1:	" op "%X2 %1,%2	# put_user\n"		\
+		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
 		"2:\n"						\
 		".section .fixup,\"ax\"\n"			\
 		"3:	li %0,%3\n"				\
@@ -167,7 +167,7 @@ extern long __put_user_bad(void);
 		".previous\n"					\
 		EX_TABLE(1b, 3b)				\
 		: "=r" (err)					\
-		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
+		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))
 
 #ifdef __powerpc64__
 #define __put_user_asm2(x, ptr, retval)				\
@@ -317,7 +317,7 @@ extern long __get_user_bad(void);
 
 #define __get_user_asm(x, addr, err, op)		\
 	__asm__ __volatile__(				\
-		"1:	"op"%X2 %1, %2	# get_user\n"	\
+		"1:	"op"%U2%X2 %1, %2	# get_user\n"	\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li %0,%3\n"			\
@@ -326,7 +326,7 @@ extern long __get_user_bad(void);
 		".previous\n"				\
 		EX_TABLE(1b, 3b)			\
 		: "=r" (err), "=r" (x)			\
-		: "m" (*addr), "i" (-EFAULT), "0" (err))
+		: "m<>" (*addr), "i" (-EFAULT), "0" (err))
 
 #ifdef __powerpc64__
 #define __get_user_asm2(x, addr, err)			\
-- 
2.25.0

