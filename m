Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D2315135
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:06:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZl7b5TvxzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:06:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZl2W5cHczDsGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:02:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZl2F5sGlz9v0KF;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id p6-Bo566TAbD; Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZl2F4yJ7z9v0KB;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0997E8B7E7;
 Tue,  9 Feb 2021 15:02:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ICB81XodAmk8; Tue,  9 Feb 2021 15:02:14 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEAA28B764;
 Tue,  9 Feb 2021 15:02:14 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9A3F767359; Tue,  9 Feb 2021 14:02:14 +0000 (UTC)
Message-Id: <3ae114740317187e12edbd5ffa9157cb8c396dea.1612879284.git.christophe.leroy@csgroup.eu>
In-Reply-To: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
References: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/3] powerpc/uaccess: Merge raw_copy_to_user_allowed() into
 raw_copy_to_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  9 Feb 2021 14:02:14 +0000 (UTC)
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

Since commit 17bc43367fc2 ("powerpc/uaccess: Implement
unsafe_copy_to_user() as a simple loop"), raw_copy_to_user_allowed()
is only used by raw_copy_to_user().

Merge raw_copy_to_user_allowed() into raw_copy_to_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2fb1d95f10d3..33b2de642120 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -401,19 +401,13 @@ static inline unsigned long raw_copy_from_user(void *to,
 	return ret;
 }
 
-static inline unsigned long
-raw_copy_to_user_allowed(void __user *to, const void *from, unsigned long n)
-{
-	return __copy_tofrom_user(to, (__force const void __user *)from, n);
-}
-
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	unsigned long ret;
 
 	allow_write_to_user(to, n);
-	ret = raw_copy_to_user_allowed(to, from, n);
+	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
 	prevent_write_to_user(to, n);
 	return ret;
 }
-- 
2.25.0

