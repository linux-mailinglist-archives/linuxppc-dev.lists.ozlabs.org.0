Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B77B1092
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 16:02:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TgT05G4hzF4SD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 00:02:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="gTfQ67k1"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TgB44tCxzF3Nx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:49:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Tg9x2GMQz9tyn6;
 Thu, 12 Sep 2019 15:49:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gTfQ67k1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S3aS4dXQEy-S; Thu, 12 Sep 2019 15:49:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Tg9x19tsz9tyn0;
 Thu, 12 Sep 2019 15:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568296181; bh=tIuj7A2g/wU/lfgUsNki9hmYUsxY/tQJgq5pQBOkNp4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=gTfQ67k1tf2KkSnDykBo5FX6Li0ChIVjzDG+72kVlnhGaywvk70KYgV4g1zYVXtX3
 p5y7lqaPAYlQVhoo7fdOfj8B8MafL7Zci3rcugkwcvB0XL78Ln9v5bvs05MgRkhH/V
 JF1VBxY7YcG49WMAeglOIKpU434k0wKrIuii+s2g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B11AE8B933;
 Thu, 12 Sep 2019 15:49:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xXQnglXC8Qh4; Thu, 12 Sep 2019 15:49:42 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D7228B93C;
 Thu, 12 Sep 2019 15:49:42 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4F0CC6B736; Thu, 12 Sep 2019 13:49:42 +0000 (UTC)
Message-Id: <f4984c615f90caa3277775a68849afeea846850d.1568295907.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1568295907.git.christophe.leroy@c-s.fr>
References: <cover.1568295907.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 2/4] powerpc/fixmap: Use __fix_to_virt() instead of
 fix_to_virt()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@infradead.org
Date: Thu, 12 Sep 2019 13:49:42 +0000 (UTC)
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

Modify back __set_fixmap() to using __fix_to_virt() instead
of fix_to_virt() otherwise the following happens because it
seems GCC doesn't see idx as a builtin const.

  CC      mm/early_ioremap.o
In file included from ./include/linux/kernel.h:11:0,
                 from mm/early_ioremap.c:11:
In function ‘fix_to_virt’,
    inlined from ‘__set_fixmap’ at ./arch/powerpc/include/asm/fixmap.h:87:2,
    inlined from ‘__early_ioremap’ at mm/early_ioremap.c:156:4:
./include/linux/compiler.h:350:38: error: call to ‘__compiletime_assert_32’ declared with attribute error: BUILD_BUG_ON failed: idx >= __end_of_fixed_addresses
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
./include/linux/compiler.h:331:4: note: in definition of macro ‘__compiletime_assert’
    prefix ## suffix();    \
    ^
./include/linux/compiler.h:350:2: note: in expansion of macro ‘_compiletime_assert’
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
./include/linux/build_bug.h:50:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^
./include/asm-generic/fixmap.h:32:2: note: in expansion of macro ‘BUILD_BUG_ON’
  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
  ^

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 4cfac2f9c7f1 ("powerpc/mm: Simplify __set_fixmap()")
---
 arch/powerpc/include/asm/fixmap.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 0cfc365d814b..722289a1d000 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -77,7 +77,12 @@ enum fixed_addresses {
 static inline void __set_fixmap(enum fixed_addresses idx,
 				phys_addr_t phys, pgprot_t flags)
 {
-	map_kernel_page(fix_to_virt(idx), phys, flags);
+	if (__builtin_constant_p(idx))
+		BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
+	else if (WARN_ON(idx >= __end_of_fixed_addresses))
+		return;
+
+	map_kernel_page(__fix_to_virt(idx), phys, flags);
 }
 
 #endif /* !__ASSEMBLY__ */
-- 
2.13.3

