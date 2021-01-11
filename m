Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B872F1290
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 13:49:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDtnr3SrTzDqGF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 23:49:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDtjq6lTKzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:46:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDtjY61Tyz9v02P;
 Mon, 11 Jan 2021 13:45:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id flsZkM5S4mty; Mon, 11 Jan 2021 13:45:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDtjY57wJz9v02R;
 Mon, 11 Jan 2021 13:45:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B76D8B791;
 Mon, 11 Jan 2021 13:45:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WTqNKj9scYew; Mon, 11 Jan 2021 13:45:59 +0100 (CET)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE6728B78E;
 Mon, 11 Jan 2021 13:45:58 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C32B166978; Mon, 11 Jan 2021 12:45:58 +0000 (UTC)
Message-Id: <8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc: get rid of small constant size cases in
 raw_copy_{to,from}_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Mon, 11 Jan 2021 12:45:58 +0000 (UTC)
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
 arch/powerpc/include/asm/uaccess.h | 45 ------------------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 501c9a79038c..6e97616e03e8 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -407,30 +407,6 @@ static inline unsigned long raw_copy_from_user(void *to,
 		const void __user *from, unsigned long n)
 {
 	unsigned long ret;
-	if (__builtin_constant_p(n) && (n <= 8)) {
-		ret = 1;
-
-		switch (n) {
-		case 1:
-			barrier_nospec();
-			__get_user_size(*(u8 *)to, from, 1, ret);
-			break;
-		case 2:
-			barrier_nospec();
-			__get_user_size(*(u16 *)to, from, 2, ret);
-			break;
-		case 4:
-			barrier_nospec();
-			__get_user_size(*(u32 *)to, from, 4, ret);
-			break;
-		case 8:
-			barrier_nospec();
-			__get_user_size(*(u64 *)to, from, 8, ret);
-			break;
-		}
-		if (ret == 0)
-			return 0;
-	}
 
 	barrier_nospec();
 	allow_read_from_user(from, n);
@@ -442,27 +418,6 @@ static inline unsigned long raw_copy_from_user(void *to,
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

