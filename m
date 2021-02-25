Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EB3254CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 18:52:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmgNc5mNBz3dV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 04:52:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmgLV25QWz3cbh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 04:50:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DmgLM0LRyz9v1B6;
 Thu, 25 Feb 2021 18:50:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 723zQETBnfLL; Thu, 25 Feb 2021 18:50:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DmgLL5YzZz9v19y;
 Thu, 25 Feb 2021 18:50:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66C3E8B895;
 Thu, 25 Feb 2021 18:50:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id v_z03NBZXZdX; Thu, 25 Feb 2021 18:50:36 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30D018B88B;
 Thu, 25 Feb 2021 18:50:36 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C40667442; Thu, 25 Feb 2021 17:50:36 +0000 (UTC)
Message-Id: <f26059443f3ded51abfe0a5c982b17b5d49341cf.1614275314.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 06/15] powerpc/uaccess: Call might_fault() inconditionaly
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 25 Feb 2021 17:50:36 +0000 (UTC)
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

Commit 6bfd93c32a50 ("powerpc: Fix incorrect might_sleep in
__get_user/__put_user on kernel addresses") added a check to not call
might_sleep() on kernel addresses. This was to enable the use of
__get_user() in the alignment exception handler for any address.

Then commit 95156f0051cb ("lockdep, mm: fix might_fault() annotation")
added a check of the address space in might_fault(), based on
set_fs() logic. But this didn't solve the powerpc alignment exception
case as it didn't call set_fs(KERNEL_DS).

Nowadays, set_fs() is gone, previous patch fixed the alignment
exception handler and __get_user/__put_user are not supposed to be
used anymore to read kernel memory.

Therefore the is_kernel_addr() check has become useless and can be
removed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index eaa828a6a419..c4bbc64758a0 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -77,8 +77,7 @@ __pu_failed:							\
 	__typeof__(*(ptr)) __pu_val = (x);			\
 	__typeof__(size) __pu_size = (size);			\
 								\
-	if (!is_kernel_addr((unsigned long)__pu_addr))		\
-		might_fault();					\
+	might_fault();						\
 	__chk_user_ptr(__pu_addr);				\
 	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err);	\
 								\
@@ -238,12 +237,12 @@ do {								\
 	__typeof__(size) __gu_size = (size);			\
 								\
 	__chk_user_ptr(__gu_addr);				\
-	if (do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \
+	if (do_allow) {								\
 		might_fault();					\
-	if (do_allow)								\
 		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
-	else									\
+	} else {									\
 		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
+	}									\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
 	__gu_err;						\
-- 
2.25.0

