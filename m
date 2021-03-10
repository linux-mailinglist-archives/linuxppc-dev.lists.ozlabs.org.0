Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81433460B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfwd2D7dz3gMs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfsy0WQQz3cnr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfss6jfXzB09Zd;
 Wed, 10 Mar 2021 18:57:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YagTIsKA6u6g; Wed, 10 Mar 2021 18:57:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfss5mllz9tytT;
 Wed, 10 Mar 2021 18:57:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A163A8B78D;
 Wed, 10 Mar 2021 18:57:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xBOPPdddCg7U; Wed, 10 Mar 2021 18:57:07 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51BF98B77E;
 Wed, 10 Mar 2021 18:57:07 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A53CF6756B; Wed, 10 Mar 2021 17:57:06 +0000 (UTC)
Message-Id: <6cd202cdc4f939d47822e4ddd3c0856210431a58.1615398498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398498.git.christophe.leroy@csgroup.eu>
References: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 7/8] powerpc/futex: Switch to user_access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:57:06 +0000 (UTC)
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

Use user_access_begin() instead of the access_ok/allow_access sequence.

This brings the missing might_fault() check.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/futex.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/futex.h b/arch/powerpc/include/asm/futex.h
index e93ee3202e4c..b3001f8b2c1e 100644
--- a/arch/powerpc/include/asm/futex.h
+++ b/arch/powerpc/include/asm/futex.h
@@ -33,9 +33,8 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 {
 	int oldval = 0, ret;
 
-	if (!access_ok(uaddr, sizeof(u32)))
+	if (!user_access_begin(uaddr, sizeof(u32)))
 		return -EFAULT;
-	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -56,10 +55,10 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 	default:
 		ret = -ENOSYS;
 	}
+	user_access_end();
 
 	*oval = oldval;
 
-	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
 	return ret;
 }
 
@@ -70,11 +69,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	int ret = 0;
 	u32 prev;
 
-	if (!access_ok(uaddr, sizeof(u32)))
+	if (!user_access_begin(uaddr, sizeof(u32)))
 		return -EFAULT;
 
-	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
-
         __asm__ __volatile__ (
         PPC_ATOMIC_ENTRY_BARRIER
 "1:     lwarx   %1,0,%3         # futex_atomic_cmpxchg_inatomic\n\
@@ -93,8 +90,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
         : "r" (uaddr), "r" (oldval), "r" (newval), "i" (-EFAULT)
         : "cc", "memory");
 
+	user_access_end();
+
 	*uval = prev;
-	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
 
         return ret;
 }
-- 
2.25.0

