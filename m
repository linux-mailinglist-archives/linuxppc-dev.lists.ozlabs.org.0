Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7AB353D5E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDR0w3Rdbz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 19:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDR0b4gbpz2xYj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 19:57:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FDR0M4f3Xz9v3hn;
 Mon,  5 Apr 2021 11:57:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FPUeFE4d_Vc3; Mon,  5 Apr 2021 11:57:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FDR0M3cQKz9v3hm;
 Mon,  5 Apr 2021 11:57:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47EC98B790;
 Mon,  5 Apr 2021 11:57:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XJQP_1IQcNdF; Mon,  5 Apr 2021 11:57:28 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 144608B75B;
 Mon,  5 Apr 2021 11:57:28 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CD38367692; Mon,  5 Apr 2021 09:57:27 +0000 (UTC)
Message-Id: <e43d133bf52fa19e577f64f3a3a38cedc570377d.1617616601.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Remove powerpc specific definition of 'ptrdiff_t'
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  5 Apr 2021 09:57:27 +0000 (UTC)
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

For unknown reason, old commit d27dfd388715 ("Import pre2.0.8")
changed 'ptrdiff_t' from 'int' to 'long'.

GCC expects it as 'int' really, and this leads to the following
warning when building KFENCE:

  CC      mm/kfence/report.o
In file included from ./include/linux/printk.h:7,
                 from ./include/linux/kernel.h:16,
                 from mm/kfence/report.c:10:
mm/kfence/report.c: In function 'kfence_report_error':
./include/linux/kern_levels.h:5:18: warning: format '%td' expects argument of type 'ptrdiff_t', but argument 6 has type 'long int' [-Wformat=]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
   11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
      |                  ^~~~~~~~
./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
  343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~
mm/kfence/report.c:213:3: note: in expansion of macro 'pr_err'
  213 |   pr_err("Out-of-bounds %s at 0x%p (%luB %s of kfence-#%td):\n",
      |   ^~~~~~

<asm-generic/uapi/posix-types.h> defines it as 'int', and
defines 'size_t' and 'ssize_t' exactly as powerpc do, so
remove the powerpc specific definitions and fallback on
generic ones.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/uapi/asm/posix_types.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/posix_types.h b/arch/powerpc/include/uapi/asm/posix_types.h
index f698400e4bb0..9c0342312544 100644
--- a/arch/powerpc/include/uapi/asm/posix_types.h
+++ b/arch/powerpc/include/uapi/asm/posix_types.h
@@ -12,11 +12,6 @@
 typedef unsigned long	__kernel_old_dev_t;
 #define __kernel_old_dev_t __kernel_old_dev_t
 #else
-typedef unsigned int	__kernel_size_t;
-typedef int		__kernel_ssize_t;
-typedef long		__kernel_ptrdiff_t;
-#define __kernel_size_t __kernel_size_t
-
 typedef short		__kernel_ipc_pid_t;
 #define __kernel_ipc_pid_t __kernel_ipc_pid_t
 #endif
-- 
2.25.0

