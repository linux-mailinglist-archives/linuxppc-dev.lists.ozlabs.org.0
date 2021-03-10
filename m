Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F4334581
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfj26BjPz3dT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:49:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwff25QtPz3ck6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfdy4k3fzB09Zh;
 Wed, 10 Mar 2021 18:46:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SYegPfdj-NsR; Wed, 10 Mar 2021 18:46:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfdy3t56z9tytQ;
 Wed, 10 Mar 2021 18:46:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 325A68B77E;
 Wed, 10 Mar 2021 18:46:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VvrnuTwU3aZ0; Wed, 10 Mar 2021 18:46:48 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E1BC58B78D;
 Wed, 10 Mar 2021 18:46:47 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B5F3067568; Wed, 10 Mar 2021 17:46:47 +0000 (UTC)
Message-Id: <b6552149209aebd887a6977272b06a41256bdb9f.1615398265.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 08/15] powerpc/uaccess: Remove __unsafe_put_user_goto()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:47 +0000 (UTC)
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

__unsafe_put_user_goto() is just an intermediate layer to
__put_user_size_goto() without added value other than doing
the __user pointer type checking.

Do the __user pointer type checking in __put_user_size_goto()
and remove __unsafe_put_user_goto().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c4bbc64758a0..a6d3563cf3ee 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -130,23 +130,17 @@ __pu_failed:							\
 
 #define __put_user_size_goto(x, ptr, size, label)		\
 do {								\
+	__typeof__(*(ptr)) __user *__pus_addr = (ptr);		\
+								\
 	switch (size) {						\
-	case 1: __put_user_asm_goto(x, ptr, label, "stb"); break;	\
-	case 2: __put_user_asm_goto(x, ptr, label, "sth"); break;	\
-	case 4: __put_user_asm_goto(x, ptr, label, "stw"); break;	\
-	case 8: __put_user_asm2_goto(x, ptr, label); break;	\
+	case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;	\
+	case 2: __put_user_asm_goto(x, __pus_addr, label, "sth"); break;	\
+	case 4: __put_user_asm_goto(x, __pus_addr, label, "stw"); break;	\
+	case 8: __put_user_asm2_goto(x, __pus_addr, label); break;		\
 	default: __put_user_bad();				\
 	}							\
 } while (0)
 
-#define __unsafe_put_user_goto(x, ptr, size, label)		\
-do {								\
-	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
-	__chk_user_ptr(ptr);					\
-	__put_user_size_goto((x), __pu_addr, (size), label);	\
-} while (0)
-
-
 extern long __get_user_bad(void);
 
 /*
@@ -405,7 +399,7 @@ user_write_access_begin(const void __user *ptr, size_t len)
 } while (0)
 
 #define unsafe_put_user(x, p, e) \
-	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
+	__put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
 
 #define unsafe_copy_to_user(d, s, l, e) \
 do {									\
-- 
2.25.0

