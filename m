Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED623345EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfvd6BbJz3fBw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfsw1g5hz3cVX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfsm6yTHz9tyv7;
 Wed, 10 Mar 2021 18:57:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XlBJvvFHkHRe; Wed, 10 Mar 2021 18:57:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfsm55CNz9tytT;
 Wed, 10 Mar 2021 18:57:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D3728B78D;
 Wed, 10 Mar 2021 18:57:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6d3exhKAqAss; Wed, 10 Mar 2021 18:57:02 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A0178B77E;
 Wed, 10 Mar 2021 18:57:02 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 801CC6756B; Wed, 10 Mar 2021 17:57:01 +0000 (UTC)
Message-Id: <d8ec01fb22f33d87321451d5e5f01cb56dacaa39.1615398498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398498.git.christophe.leroy@csgroup.eu>
References: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/8] powerpc/uaccess: Swap clear_user() and __clear_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:57:01 +0000 (UTC)
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
index 2c09cff205ef..1c1d404514b1 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -414,21 +414,20 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 
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

