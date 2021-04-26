Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17836BAC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 22:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTc9X667Xz30Gj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 06:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JZKpcTWI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JZKpcTWI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTc974Zwmz2yxN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 06:35:39 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E89D1601FC;
 Mon, 26 Apr 2021 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619469336;
 bh=dWUS68fI1Cq65yaAuW1711yZzsjTCGo01+dzI5wZyOg=;
 h=From:To:Cc:Subject:Date:From;
 b=JZKpcTWIGHvo2ju0xvHbAMfO5KD+YY7U0Ui2tsf0R8vzyMCIIX4Es+MJ/kJu3w4sQ
 hEBHl4Hir0hPig9Yd6IFN/QA8hi47gloUMqvjkMg8RNUSuIcJnwQReMWBsJ2MRC/t7
 hs5aKoR7KFQTl/8p43SZ/goygTlKXmI67ojsC1OSth5uJ+13flim6wBCM4BgwwE8u4
 t7Qa59jYacCAtUZTSHUGS2y0CDeuGPuV9N3HZ0r49JE/HZdxDXo50zf/ypLQjwX31l
 YGLCzjzY6pVmvSKGzx4aFzxoScRtAcEbHUwok6qArwK1TbFvYwoy+vznqZroQ9XmPh
 h2PBbdE72lW/g==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Avoid clang uninitialized warning in
 __get_user_size_allowed
Date: Mon, 26 Apr 2021 13:35:18 -0700
Message-Id: <20210426203518.981550-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.1.362.g311531c9de
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9975f852ce1b ("powerpc/uaccess: Remove calls to __get_user_bad()
and __put_user_bad()") switch to BUILD_BUG() in the default case, which
leaves x uninitialized. This will not be an issue because the build will
be broken in that case but clang does static analysis before it realizes
the default case will be done so it warns about x being uninitialized
(trimmed for brevity):

 In file included from mm/mprotect.c:13:
 In file included from ./include/linux/hugetlb.h:28:
 In file included from ./include/linux/mempolicy.h:16:
 ./include/linux/pagemap.h:772:16: warning: variable '__gu_val' is used
 uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                 if (unlikely(__get_user(c, uaddr) != 0))
                              ^~~~~~~~~~~~~~~~~~~~
 ./arch/powerpc/include/asm/uaccess.h:266:2: note: expanded from macro '__get_user'
         __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./arch/powerpc/include/asm/uaccess.h:235:2: note: expanded from macro
 '__get_user_size_allowed'
        default: BUILD_BUG();                                   \
        ^~~~~~~

Commit 5cd29b1fd3e8 ("powerpc/uaccess: Use asm goto for get_user when
compiler supports it") added an initialization for x because of the same
reason. Do the same thing here so there is no warning across all
versions of clang.

Link: https://github.com/ClangBuiltLinux/linux/issues/1359
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a4e791bcd3fe..a09e4240c5b1 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -232,7 +232,7 @@ do {								\
 	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
 	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
 	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
-	default: BUILD_BUG();					\
+	default: x = 0; BUILD_BUG();				\
 	}							\
 } while (0)
 

base-commit: ee6b25fa7c037e42cc5f3b5c024b2a779edab6dd
-- 
2.31.1.362.g311531c9de

