Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EF315153
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:13:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZlHk71QfzDsgM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZl2W5YMtzDrcP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:02:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZl2D0xCNz9v0KD;
 Tue,  9 Feb 2021 15:02:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vzzvUCSzVgen; Tue,  9 Feb 2021 15:02:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZl2D050pz9v0KB;
 Tue,  9 Feb 2021 15:02:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E4838B7EA;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wvj3lYxnwGWG; Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0A908B7E9;
 Tue,  9 Feb 2021 15:02:12 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 84DEE67359; Tue,  9 Feb 2021 14:02:12 +0000 (UTC)
Message-Id: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/3] powerpc/uaccess: get rid of small constant size cases
 in raw_copy_{to,from}_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  9 Feb 2021 14:02:12 +0000 (UTC)
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

Copied from commit 4b842e4e25b1 ("x86: get rid of small
constant size cases in raw_copy_{to,from}_user()")

Very few call sites where that would be triggered remain, and none
of those is anywhere near hot enough to bother.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 41 ------------------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 93d33f7e8b53..a4d2569173ac 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -398,26 +398,6 @@ static inline unsigned long raw_copy_from_user(void *to,
 		const void __user *from, unsigned long n)
 {
 	unsigned long ret;
-	if (__builtin_constant_p(n) && (n <= 8)) {
-		ret = 1;
-
-		switch (n) {
-		case 1:
-			__get_user_size(*(u8 *)to, from, 1, ret);
-			break;
-		case 2:
-			__get_user_size(*(u16 *)to, from, 2, ret);
-			break;
-		case 4:
-			__get_user_size(*(u32 *)to, from, 4, ret);
-			break;
-		case 8:
-			__get_user_size(*(u64 *)to, from, 8, ret);
-			break;
-		}
-		if (ret == 0)
-			return 0;
-	}
 
 	allow_read_from_user(from, n);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
@@ -428,27 +408,6 @@ static inline unsigned long raw_copy_from_user(void *to,
 static inline unsigned long
 raw_copy_to_user_allowed(void __user *to, const void *from, unsigned long n)
 {
-	if (__builtin_constant_p(n) && (n <= 8)) {
-		unsigned long ret = 1;
-
-		switch (n) {
-		case 1:
-			__put_user_size_allowed(*(u8 *)from, (u8 __user *)to, 1, ret);
-			break;
-		case 2:
-			__put_user_size_allowed(*(u16 *)from, (u16 __user *)to, 2, ret);
-			break;
-		case 4:
-			__put_user_size_allowed(*(u32 *)from, (u32 __user *)to, 4, ret);
-			break;
-		case 8:
-			__put_user_size_allowed(*(u64 *)from, (u64 __user *)to, 8, ret);
-			break;
-		}
-		if (ret == 0)
-			return 0;
-	}
-
 	return __copy_tofrom_user(to, (__force const void __user *)from, n);
 }
 
-- 
2.25.0

