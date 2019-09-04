Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DAA8592
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 16:23:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NmK16nKlzDqwM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 00:23:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NmD120snzDqcS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 00:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NmCz51kqz8t3b
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 00:19:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NmCz2jDxz9sPp; Thu,  5 Sep 2019 00:19:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=gcc1-power7.osuosl.org (client-ip=140.211.15.137;
 helo=gcc1-power7.osuosl.org; envelope-from=segher@gcc1-power7.osuosl.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at bilbo;
 Thu, 05 Sep 2019 00:19:25 AEST
Received: from gcc1-power7.osuosl.org (gcc1-power7.osuosl.org [140.211.15.137])
 by ozlabs.org (Postfix) with ESMTP id 46NmCx6YLlz9s3Z
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Sep 2019 00:19:25 +1000 (AEST)
Received: by gcc1-power7.osuosl.org (Postfix, from userid 10019)
 id 472351240C2E; Wed,  4 Sep 2019 14:11:15 +0000 (UTC)
From: Segher Boessenkool <segher@kernel.crashing.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Add attributes for setjmp/longjmp
Date: Wed,  4 Sep 2019 14:11:07 +0000
Message-Id: <c02ce4a573f3bac907e2c70957a2d1275f910013.1567605586.git.segher@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The setjmp function should be declared as "returns_twice", or bad
things can happen[1].  This does not actually change generated code
in my testing.

The longjmp function should be declared as "noreturn", so that the
compiler can optimise calls to it better.  This makes the generated
code a little shorter.

Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>

[1] See https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-returns_005ftwice-function-attribute
---
 arch/powerpc/include/asm/setjmp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
index d995061..e9f81bb 100644
--- a/arch/powerpc/include/asm/setjmp.h
+++ b/arch/powerpc/include/asm/setjmp.h
@@ -7,7 +7,7 @@
 
 #define JMP_BUF_LEN    23
 
-extern long setjmp(long *);
-extern void longjmp(long *, long);
+extern long setjmp(long *) __attribute__((returns_twice));
+extern void longjmp(long *, long) __attribute__((noreturn));
 
 #endif /* _ASM_POWERPC_SETJMP_H */
-- 
1.8.3.1

