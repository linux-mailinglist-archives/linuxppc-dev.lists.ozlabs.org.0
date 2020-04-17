Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930521AE360
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:13:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493jN56BXMzDq67
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 03:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LW5PQXRB; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493jHH444PzDrQb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 03:08:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 493jH7702vz9tyxB;
 Fri, 17 Apr 2020 19:08:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LW5PQXRB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r1kkrlHPH2ff; Fri, 17 Apr 2020 19:08:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 493jH75Q3zz9tyx8;
 Fri, 17 Apr 2020 19:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587143331; bh=8PZ7zqrNdw1HVCHe6hX++DbwkBGST2rBcWVwmI2RJcA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LW5PQXRBPzqoM8diZt6CgiztQP08BFWR5fPJEifl4RhnzOIbhs9cPi+HlBDZEFfYT
 2xgLHJ0VCUd9H4D6AfeQLE3FYNrqhthBqHsZH19F9+cOrc+dLS3Yeuu16uxGkNr3Mt
 Su4wldA3uOkR/rPEWqw0YMngR/+hna3SiWY6Zjeg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 98D978BB98;
 Fri, 17 Apr 2020 19:08:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sa6pRHBqzzbM; Fri, 17 Apr 2020 19:08:53 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CC7F8B75E;
 Fri, 17 Apr 2020 19:08:53 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F200C657A3; Fri, 17 Apr 2020 17:08:52 +0000 (UTC)
Message-Id: <fe952112c29bf6a0a2778c9e6bbb4f4afd2c4258.1587143308.git.christophe.leroy@c-s.fr>
In-Reply-To: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 2/2] powerpc/uaccess: Implement unsafe_copy_to_user() as a
 simple loop
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, segher@kernel.crashing.org
Date: Fri, 17 Apr 2020 17:08:52 +0000 (UTC)
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

At the time being, unsafe_copy_to_user() is based on
raw_copy_to_user() which calls __copy_tofrom_user().

__copy_tofrom_user() is a big optimised function to copy big amount
of data. It aligns destinations to cache line in order to use
dcbz instruction.

Today unsafe_copy_to_user() is called only from filldir().
It is used to mainly copy small amount of data like filenames,
so __copy_tofrom_user() is not fit.

Also, unsafe_copy_to_user() is used within user_access_begin/end
sections. In those section, it is preferable to not call functions.

Rewrite unsafe_copy_to_user() as a macro that uses __put_user_goto().
We first perform a loop of long, then we finish with necessary
complements.

unsafe_copy_to_user() might be used in the near future to copy
fixed-size data, like pt_regs structs during signal processing.
Having it as a macro allows GCC to optimise it for instead when
it knows the size in advance, it can unloop loops, drop complements
when the size is a multiple of longs, etc ...

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v4: new
---
 arch/powerpc/include/asm/uaccess.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 9365b59495a2..b24fbe75f9ce 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -514,7 +514,26 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
 #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
+
 #define unsafe_copy_to_user(d, s, l, e) \
-	unsafe_op_wrap(raw_copy_to_user_allowed(d, s, l), e)
+do {									\
+	u8 __user *_dst = (u8 __user *)(d);				\
+	const u8 *_src = (const u8 *)(s);				\
+	size_t _len = (l);						\
+	int _i;								\
+									\
+	for (_i = 0; _i < (_len & ~(sizeof(long) - 1)); _i += sizeof(long))		\
+		__put_user_goto(*(long*)(_src + _i), (long __user *)(_dst + _i), e);\
+	if (IS_ENABLED(CONFIG_PPC64) && (_len & 4)) {			\
+		__put_user_goto(*(u32*)(_src + _i), (u32 __user *)(_dst + _i), e);	\
+		_i += 4;						\
+	}								\
+	if (_len & 2) {							\
+		__put_user_goto(*(u16*)(_src + _i), (u16 __user *)(_dst + _i), e);	\
+		_i += 2;						\
+	}								\
+	if (_len & 1) \
+		__put_user_goto(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e);\
+} while (0)
 
 #endif	/* _ARCH_POWERPC_UACCESS_H */
-- 
2.25.0

