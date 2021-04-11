Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDE35B614
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJHfY5btvz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 02:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJHf92RXKz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 02:39:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJHdy6tXMzB09bC;
 Sun, 11 Apr 2021 18:39:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ccZeimTKb--K; Sun, 11 Apr 2021 18:39:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJHdy5tmDzB09b7;
 Sun, 11 Apr 2021 18:39:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 638FD8B770;
 Sun, 11 Apr 2021 18:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oaTK-YMuW23J; Sun, 11 Apr 2021 18:39:54 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 229C68B75B;
 Sun, 11 Apr 2021 18:39:54 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C752D679DE; Sun, 11 Apr 2021 16:39:53 +0000 (UTC)
Message-Id: <aad2cb1801a3cc99bc27081022925b9fc18a0dfb.1618159169.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/signal32: Fix build failure with CONFIG_SPE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 linux@roeck-us.net
Date: Sun, 11 Apr 2021 16:39:53 +0000 (UTC)
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

Add missing fault exit label in unsafe_copy_from_user() in order to
avoid following build failure with CONFIG_SPE

  CC      arch/powerpc/kernel/signal_32.o
arch/powerpc/kernel/signal_32.c: In function 'restore_user_regs':
arch/powerpc/kernel/signal_32.c:565:36: error: macro "unsafe_copy_from_user" requires 4 arguments, but only 3 given
  565 |           ELF_NEVRREG * sizeof(u32));
      |                                    ^
In file included from ./include/linux/uaccess.h:11,
                 from ./include/linux/sched/task.h:11,
                 from ./include/linux/sched/signal.h:9,
                 from ./include/linux/rcuwait.h:6,
                 from ./include/linux/percpu-rwsem.h:7,
                 from ./include/linux/fs.h:33,
                 from ./include/linux/huge_mm.h:8,
                 from ./include/linux/mm.h:707,
                 from arch/powerpc/kernel/signal_32.c:17:
./arch/powerpc/include/asm/uaccess.h:428: note: macro "unsafe_copy_from_user" defined here
  428 | #define unsafe_copy_from_user(d, s, l, e) \
      |
arch/powerpc/kernel/signal_32.c:564:3: error: 'unsafe_copy_from_user' undeclared (first use in this function); did you mean 'raw_copy_from_user'?
  564 |   unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
      |   ^~~~~~~~~~~~~~~~~~~~~
      |   raw_copy_from_user
arch/powerpc/kernel/signal_32.c:564:3: note: each undeclared identifier is reported only once for each function it appears in
make[3]: *** [arch/powerpc/kernel/signal_32.o] Error 1

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 627b72bee84d ("powerpc/signal32: Convert restore_[tm]_user_regs() to user access block")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/powerpc/kernel/signal_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 23fdb364b511..d489ccea2ab3 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -562,7 +562,7 @@ static long restore_user_regs(struct pt_regs *regs,
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
 		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32));
+				      ELF_NEVRREG * sizeof(u32), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
 		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
-- 
2.25.0

