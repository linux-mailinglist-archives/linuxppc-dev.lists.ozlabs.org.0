Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B333457F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfhj6yb5z3fDY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwff12XJGz3cTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfdv2j0wz9tytW;
 Wed, 10 Mar 2021 18:46:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6XlsGUGhnDDI; Wed, 10 Mar 2021 18:46:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfdv1r4hz9tytQ;
 Wed, 10 Mar 2021 18:46:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 07A698B78D;
 Wed, 10 Mar 2021 18:46:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 13uzWABqKiYi; Wed, 10 Mar 2021 18:46:44 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B0A898B77E;
 Wed, 10 Mar 2021 18:46:44 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8F65A67568; Wed, 10 Mar 2021 17:46:44 +0000 (UTC)
Message-Id: <2c6e83581b4fa434aa7cf2fa7714c41e98f57007.1615398265.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 05/15] powerpc/uaccess: Move get_user_instr helpers in
 asm/inst.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:44 +0000 (UTC)
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

Those helpers use get_user helpers but they don't participate
in their implementation, so they do not belong to asm/uaccess.h

Move them in asm/inst.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h    | 34 ++++++++++++++++++++++++++++++
 arch/powerpc/include/asm/uaccess.h | 34 ------------------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index cc73c1267572..19e18af2fac9 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -4,6 +4,40 @@
 
 #include <asm/ppc-opcode.h>
 
+#ifdef CONFIG_PPC64
+
+#define ___get_user_instr(gu_op, dest, ptr)				\
+({									\
+	long __gui_ret = 0;						\
+	unsigned long __gui_ptr = (unsigned long)ptr;			\
+	struct ppc_inst __gui_inst;					\
+	unsigned int __prefix, __suffix;				\
+	__gui_ret = gu_op(__prefix, (unsigned int __user *)__gui_ptr);	\
+	if (__gui_ret == 0) {						\
+		if ((__prefix >> 26) == OP_PREFIX) {			\
+			__gui_ret = gu_op(__suffix,			\
+				(unsigned int __user *)__gui_ptr + 1);	\
+			__gui_inst = ppc_inst_prefix(__prefix,		\
+						     __suffix);		\
+		} else {						\
+			__gui_inst = ppc_inst(__prefix);		\
+		}							\
+		if (__gui_ret == 0)					\
+			(dest) = __gui_inst;				\
+	}								\
+	__gui_ret;							\
+})
+#else /* !CONFIG_PPC64 */
+#define ___get_user_instr(gu_op, dest, ptr)				\
+	gu_op((dest).val, (u32 __user *)(ptr))
+#endif /* CONFIG_PPC64 */
+
+#define get_user_instr(x, ptr) \
+	___get_user_instr(get_user, x, ptr)
+
+#define __get_user_instr(x, ptr) \
+	___get_user_instr(__get_user, x, ptr)
+
 /*
  * Instruction data type for POWER
  */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 01aea0df4dd0..eaa828a6a419 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -53,40 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 #define __put_user(x, ptr) \
 	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
-#ifdef CONFIG_PPC64
-
-#define ___get_user_instr(gu_op, dest, ptr)				\
-({									\
-	long __gui_ret = 0;						\
-	unsigned long __gui_ptr = (unsigned long)ptr;			\
-	struct ppc_inst __gui_inst;					\
-	unsigned int __prefix, __suffix;				\
-	__gui_ret = gu_op(__prefix, (unsigned int __user *)__gui_ptr);	\
-	if (__gui_ret == 0) {						\
-		if ((__prefix >> 26) == OP_PREFIX) {			\
-			__gui_ret = gu_op(__suffix,			\
-				(unsigned int __user *)__gui_ptr + 1);	\
-			__gui_inst = ppc_inst_prefix(__prefix,		\
-						     __suffix);		\
-		} else {						\
-			__gui_inst = ppc_inst(__prefix);		\
-		}							\
-		if (__gui_ret == 0)					\
-			(dest) = __gui_inst;				\
-	}								\
-	__gui_ret;							\
-})
-#else /* !CONFIG_PPC64 */
-#define ___get_user_instr(gu_op, dest, ptr)				\
-	gu_op((dest).val, (u32 __user *)(ptr))
-#endif /* CONFIG_PPC64 */
-
-#define get_user_instr(x, ptr) \
-	___get_user_instr(get_user, x, ptr)
-
-#define __get_user_instr(x, ptr) \
-	___get_user_instr(__get_user, x, ptr)
-
 extern long __put_user_bad(void);
 
 #define __put_user_size(x, ptr, size, retval)			\
-- 
2.25.0

