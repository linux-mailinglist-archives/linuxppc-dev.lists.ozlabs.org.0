Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18843254E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 18:54:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmgR76Kb5z3ck1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 04:54:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmgLZ2V9Yz3cZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 04:50:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DmgLT6T7Tz9v1BF;
 Thu, 25 Feb 2021 18:50:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bufoj8NCcU2h; Thu, 25 Feb 2021 18:50:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DmgLT5Ssvz9v19y;
 Thu, 25 Feb 2021 18:50:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96DAD8B895;
 Thu, 25 Feb 2021 18:50:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sOO75PUKSqhN; Thu, 25 Feb 2021 18:50:43 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 651528B88B;
 Thu, 25 Feb 2021 18:50:43 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3E11F67442; Thu, 25 Feb 2021 17:50:43 +0000 (UTC)
Message-Id: <d62271da6eca26c98ba4624ec829c8d341c521ae.1614275314.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 13/15] powerpc/uaccess: Swap clear_user() and __clear_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 25 Feb 2021 17:50:43 +0000 (UTC)
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

It is clear_user() which is expected to call __clear_user(),
not the reverse.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 671c083f2f2f..b3bd1fb42242 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -283,21 +283,20 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 
 unsigned long __arch_clear_user(void __user *addr, unsigned long size);
 
-static inline unsigned long clear_user(void __user *addr, unsigned long size)
+static inline unsigned long __clear_user(void __user *addr, unsigned long size)
 {
-	unsigned long ret = size;
+	unsigned long ret;
+
 	might_fault();
-	if (likely(access_ok(addr, size))) {
-		allow_write_to_user(addr, size);
-		ret = __arch_clear_user(addr, size);
-		prevent_write_to_user(addr, size);
-	}
+	allow_write_to_user(addr, size);
+	ret = __arch_clear_user(addr, size);
+	prevent_write_to_user(addr, size);
 	return ret;
 }
 
-static inline unsigned long __clear_user(void __user *addr, unsigned long size)
+static inline unsigned long clear_user(void __user *addr, unsigned long size)
 {
-	return clear_user(addr, size);
+	return likely(access_ok(addr, size)) ? __clear_user(addr, size) : size;
 }
 
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
-- 
2.25.0

