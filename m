Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAA3345AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfks5N3rz3fxM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwff80Brtz3d4C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwff34T7mz9tytW;
 Wed, 10 Mar 2021 18:46:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id T32SC-PDlxkm; Wed, 10 Mar 2021 18:46:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwff33hfLz9tytH;
 Wed, 10 Mar 2021 18:46:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B70C8B78E;
 Wed, 10 Mar 2021 18:46:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aVmZLcTRz2w5; Wed, 10 Mar 2021 18:46:53 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 060E78B77E;
 Wed, 10 Mar 2021 18:46:53 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D84E367568; Wed, 10 Mar 2021 17:46:52 +0000 (UTC)
Message-Id: <eebc554f6a81f570c46ea3551000ff5b886e4faa.1615398265.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 13/15] powerpc/uaccess: Refactor get/put_user() and
 __get/put_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:52 +0000 (UTC)
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

Make get_user() do the access_ok() check then call __get_user().
Make put_user() do the access_ok() check then call __put_user().

Then embed  __get_user_size() and __put_user_size() in
__get_user() and __put_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 66 +++++++++++-------------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 616a3a7928c2..671c083f2f2f 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -43,21 +43,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
  * exception handling means that it's no longer "just"...)
  *
  */
-#define __put_user_size(x, ptr, size, retval)			\
-do {								\
-	__label__ __pu_failed;					\
-								\
-	retval = 0;						\
-	allow_write_to_user(ptr, size);				\
-	__put_user_size_goto(x, ptr, size, __pu_failed);	\
-	prevent_write_to_user(ptr, size);			\
-	break;							\
-								\
-__pu_failed:							\
-	retval = -EFAULT;					\
-	prevent_write_to_user(ptr, size);			\
-} while (0)
-
 #define __put_user(x, ptr)					\
 ({								\
 	long __pu_err;						\
@@ -66,23 +51,29 @@ __pu_failed:							\
 	__typeof__(sizeof(*(ptr))) __pu_size = sizeof(*(ptr));	\
 								\
 	might_fault();						\
-	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err);	\
+	do {							\
+		__label__ __pu_failed;				\
+								\
+		allow_write_to_user(__pu_addr, __pu_size);	\
+		__put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);	\
+		prevent_write_to_user(__pu_addr, __pu_size);	\
+		__pu_err = 0;					\
+		break;						\
+								\
+__pu_failed:							\
+		prevent_write_to_user(__pu_addr, __pu_size);	\
+		__pu_err = -EFAULT;				\
+	} while (0);						\
 								\
 	__pu_err;						\
 })
 
 #define put_user(x, ptr)						\
 ({									\
-	long __pu_err = -EFAULT;					\
-	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
-	__typeof__(*(ptr)) __pu_val = (__typeof__(*(ptr)))(x);		\
-	__typeof__(sizeof(*(ptr))) __pu_size = sizeof(*(ptr));		\
+	__typeof__(*(ptr)) __user *_pu_addr = (ptr);			\
 									\
-	might_fault();							\
-	if (access_ok(__pu_addr, __pu_size))				\
-		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
-									\
-	__pu_err;							\
+	access_ok(_pu_addr, sizeof(*(ptr))) ?				\
+		  __put_user(x, _pu_addr) : -EFAULT;			\
 })
 
 /*
@@ -192,13 +183,6 @@ do {								\
 	}							\
 } while (0)
 
-#define __get_user_size(x, ptr, size, retval)			\
-do {								\
-	allow_read_from_user(ptr, size);			\
-	__get_user_size_allowed(x, ptr, size, retval);		\
-	prevent_read_from_user(ptr, size);			\
-} while (0)
-
 /*
  * This is a type: either unsigned long, if the argument fits into
  * that type, or otherwise unsigned long long.
@@ -214,7 +198,9 @@ do {								\
 	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));	\
 								\
 	might_fault();					\
-	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
+	allow_read_from_user(__gu_addr, __gu_size);		\
+	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
+	prevent_read_from_user(__gu_addr, __gu_size);		\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
 	__gu_err;						\
@@ -222,17 +208,11 @@ do {								\
 
 #define get_user(x, ptr)						\
 ({									\
-	long __gu_err = -EFAULT;					\
-	__long_type(*(ptr)) __gu_val = 0;				\
-	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
-	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));		\
-									\
-	might_fault();							\
-	if (access_ok(__gu_addr, __gu_size))				\
-		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
-	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
+	__typeof__(*(ptr)) __user *_gu_addr = (ptr);			\
 									\
-	__gu_err;							\
+	access_ok(_gu_addr, sizeof(*(ptr))) ?				\
+		  __get_user(x, _gu_addr) :				\
+		  ((x) = (__force __typeof__(*(ptr)))0, -EFAULT);	\
 })
 
 /* more complex routines */
-- 
2.25.0

