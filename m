Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA91CC00B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 11:44:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K2Mc3vhszDr6w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 19:43:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K2Kw6HNxzDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 19:42:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49K2Kl03dpz9twwr;
 Sat,  9 May 2020 11:42:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id k7gWcFdnhRdJ; Sat,  9 May 2020 11:42:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49K2Kk6DRQz9tww3;
 Sat,  9 May 2020 11:42:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DA7A8B771;
 Sat,  9 May 2020 11:42:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id T85gcY7K1Kn2; Sat,  9 May 2020 11:42:15 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BE408B75F;
 Sat,  9 May 2020 11:42:15 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id ACCC76590E; Sat,  9 May 2020 09:42:14 +0000 (UTC)
Message-Id: <7316a9e2c0c2517923eb4b0411c4a08d15e675a4.1589017281.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH fixes] powerpc/vdso32: Fallback on getres syscall when clock is
 unknown
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>
Date: Sat,  9 May 2020 09:42:14 +0000 (UTC)
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

There are other clocks than the standard ones, for instance
per process clocks. Therefore, being above the last standard clock
doesn't mean it is a bad clock. So, fallback to syscall instead
of returning -EINVAL inconditionaly.

Fixes: e33ffc956b08 ("powerpc/vdso32: implement clock_getres entirely")
Cc: stable@vger.kernel.org
Reported-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index a3951567118a..e7f8f9f1b3f4 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -218,11 +218,11 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 	blr
 
 	/*
-	 * invalid clock
+	 * syscall fallback
 	 */
 99:
-	li	r3, EINVAL
-	crset	so
+	li	r0,__NR_clock_getres
+	sc
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_clock_getres)
-- 
2.25.0

