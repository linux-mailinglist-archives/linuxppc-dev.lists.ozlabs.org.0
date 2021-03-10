Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D83345AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwflC4Ywwz3g36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:51:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwff95xkSz3cnw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwff54wDWz9tyv8;
 Wed, 10 Mar 2021 18:46:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6YwoWykoiIDO; Wed, 10 Mar 2021 18:46:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwff53dhsz9tytH;
 Wed, 10 Mar 2021 18:46:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FBF78B78D;
 Wed, 10 Mar 2021 18:46:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wiBXs09fYcDI; Wed, 10 Mar 2021 18:46:55 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16F398B77E;
 Wed, 10 Mar 2021 18:46:55 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E804E67568; Wed, 10 Mar 2021 17:46:54 +0000 (UTC)
Message-Id: <403745b5aaa1b315bb4e8e46c1ba949e77eecec0.1615398265.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 15/15] powerpc/uaccess: Use asm goto for get_user when
 compiler supports it
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:54 +0000 (UTC)
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

clang 11 and future GCC are supporting asm goto with outputs.

Use it to implement get_user in order to get better generated code.

Note that clang requires to set x in the default branch of
__get_user_size_goto() otherwise is compliant about x not being
initialised :puzzled:

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index e3e53e88cb26..960ab5c04b11 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -136,6 +136,59 @@ do {								\
 		: "=r" (err)			\
 		: "b" (uaddr), "b" (kaddr), "i" (-EFAULT), "0" (err))
 
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+
+#define __get_user_asm_goto(x, addr, label, op)			\
+	asm_volatile_goto(					\
+		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
+		EX_TABLE(1b, %l2)				\
+		: "=r" (x)					\
+		: "m"UPD_CONSTR (*addr)				\
+		:						\
+		: label)
+
+#ifdef __powerpc64__
+#define __get_user_asm2_goto(x, addr, label)			\
+	__get_user_asm_goto(x, addr, label, "ld")
+#else /* __powerpc64__ */
+#define __get_user_asm2_goto(x, addr, label)			\
+	asm_volatile_goto(					\
+		"1:	lwz%X1 %0, %1\n"			\
+		"2:	lwz%X1 %L0, %L1\n"			\
+		EX_TABLE(1b, %l2)				\
+		EX_TABLE(2b, %l2)				\
+		: "=r" (x)					\
+		: "m" (*addr)					\
+		:						\
+		: label)
+#endif /* __powerpc64__ */
+
+#define __get_user_size_goto(x, ptr, size, label)				\
+do {										\
+	BUILD_BUG_ON(size > sizeof(x));						\
+	switch (size) {								\
+	case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;	\
+	case 2: __get_user_asm_goto(x, (u16 __user *)ptr, label, "lhz"); break;	\
+	case 4: __get_user_asm_goto(x, (u32 __user *)ptr, label, "lwz"); break;	\
+	case 8: __get_user_asm2_goto(x, (u64 __user *)ptr, label);  break;	\
+	default: x = 0; BUILD_BUG();						\
+	}									\
+} while (0)
+
+#define __get_user_size_allowed(x, ptr, size, retval)			\
+do {									\
+		__label__ __gus_failed;					\
+									\
+		__get_user_size_goto(x, ptr, size, __gus_failed);	\
+		retval = 0;						\
+		break;							\
+__gus_failed:								\
+		x = 0;							\
+		retval = -EFAULT;					\
+} while (0)
+
+#else /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
+
 #define __get_user_asm(x, addr, err, op)		\
 	__asm__ __volatile__(				\
 		"1:	"op"%U2%X2 %1, %2	# get_user\n"	\
@@ -192,6 +245,8 @@ do {								\
 		goto label;					\
 } while (0)
 
+#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
+
 /*
  * This is a type: either unsigned long, if the argument fits into
  * that type, or otherwise unsigned long long.
-- 
2.25.0

