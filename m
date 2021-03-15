Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847633BEDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 15:53:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzfYS0sfNz303K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 01:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzfY64C4vz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 01:52:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzfXt3wJYz9tyTK;
 Mon, 15 Mar 2021 15:52:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vniJaSbpwf9e; Mon, 15 Mar 2021 15:52:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzfXt2SyJz9tyTJ;
 Mon, 15 Mar 2021 15:52:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8CD08B776;
 Mon, 15 Mar 2021 15:52:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ABtNn8k4BisG; Mon, 15 Mar 2021 15:52:51 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 861B48B75B;
 Mon, 15 Mar 2021 15:52:51 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5E62F675E2; Mon, 15 Mar 2021 14:52:51 +0000 (UTC)
Message-Id: <8038392f38d81f2ad169347efac29146f553b238.1615819955.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/mm: Remove unneeded #ifdef CONFIG_PPC_MEM_KEYS
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 15 Mar 2021 14:52:51 +0000 (UTC)
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

In fault.c, #ifdef CONFIG_PPC_MEM_KEYS is not needed because all
functions are always defined, and arch_vma_access_permitted()
always returns true when CONFIG_PPC_MEM_KEYS is not defined so
access_pkey_error() will return false so bad_access_pkey()
will never be called.

Include linux/pkeys.h to get a definition of vma_pkeys() for
bad_access_pkey().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/fault.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index bb368257b55c..f1b3f5922f90 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -32,6 +32,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hugetlb.h>
 #include <linux/uaccess.h>
+#include <linux/pkeys.h>
 
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
@@ -87,7 +88,6 @@ static noinline int bad_area(struct pt_regs *regs, unsigned long address)
 	return __bad_area(regs, address, SEGV_MAPERR);
 }
 
-#ifdef CONFIG_PPC_MEM_KEYS
 static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
 				    struct vm_area_struct *vma)
 {
@@ -127,7 +127,6 @@ static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
 
 	return 0;
 }
-#endif
 
 static noinline int bad_access(struct pt_regs *regs, unsigned long address)
 {
@@ -234,7 +233,6 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 	return false;
 }
 
-#ifdef CONFIG_PPC_MEM_KEYS
 static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
 			      struct vm_area_struct *vma)
 {
@@ -248,7 +246,6 @@ static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
 
 	return false;
 }
-#endif
 
 static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma)
 {
@@ -492,11 +489,9 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 			return bad_area(regs, address);
 	}
 
-#ifdef CONFIG_PPC_MEM_KEYS
 	if (unlikely(access_pkey_error(is_write, is_exec,
 				       (error_code & DSISR_KEYFAULT), vma)))
 		return bad_access_pkey(regs, address, vma);
-#endif /* CONFIG_PPC_MEM_KEYS */
 
 	if (unlikely(access_error(is_write, is_exec, vma)))
 		return bad_access(regs, address);
-- 
2.25.0

