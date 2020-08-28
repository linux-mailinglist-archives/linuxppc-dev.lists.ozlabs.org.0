Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B107625542F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 08:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd8Bq5r8nzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 16:02:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd86h1SH6zDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 15:58:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bd86Y6Ctkz9v46D;
 Fri, 28 Aug 2020 07:58:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id T6UqNHO5jRzl; Fri, 28 Aug 2020 07:58:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bd86Y5Ks6z9v1yg;
 Fri, 28 Aug 2020 07:58:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DCE48B783;
 Fri, 28 Aug 2020 07:58:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SCkNkZwN6Va9; Fri, 28 Aug 2020 07:58:46 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71E818B769;
 Fri, 28 Aug 2020 07:58:46 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 66AAF65D47; Fri, 28 Aug 2020 05:58:46 +0000 (UTC)
Message-Id: <0f65bb24a2519e5e6c33089016cb249a7c1b1e35.1598594308.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/5] powerpc/vdso: Remove DBG()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 28 Aug 2020 05:58:46 +0000 (UTC)
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

DBG() is defined as void when DEBUG is not defined,
and DEBUG is explicitly undefined.

It means there is no other way than modifying source code
to get the messages printed.

It was most likely useful in the first days of VDSO, but
today the only 3 DBG() calls don't deserve a special
handling.

Just remove them. If one day someone need such messages back,
use a standard pr_debug() or equivalent.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
This is a follow up series, applying on top of the series that
switches powerpc VDSO to _install_special_mapping(),
rebased on today's powerpc/next-test (dd419a93bd99)

v2 removes the modification to arch_setup_additional_pages() to
consider when is_32bit_task() returning true when CONFIG_VDSO32
not set, as this should never happen.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index e2568d9ecdff..3ef3fc546ac8 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -31,14 +31,6 @@
 #include <asm/vdso_datapage.h>
 #include <asm/setup.h>
 
-#undef DEBUG
-
-#ifdef DEBUG
-#define DBG(fmt...) printk(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
 /* Max supported size for symbol names */
 #define MAX_SYMNAME	64
 
@@ -567,9 +559,6 @@ static __init int vdso_fixup_alt_funcs(struct lib32_elfinfo *v32,
 		if (!match)
 			continue;
 
-		DBG("replacing %s with %s...\n", patch->gen_name,
-		    patch->fix_name ? "NONE" : patch->fix_name);
-
 		/*
 		 * Patch the 32 bits and 64 bits symbols. Note that we do not
 		 * patch the "." symbol on 64 bits.
@@ -704,7 +693,6 @@ static int __init vdso_init(void)
 	 * Calculate the size of the 64 bits vDSO
 	 */
 	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
-	DBG("vdso64_kbase: %p, 0x%x pages\n", vdso64_kbase, vdso64_pages);
 
 	vdso32_kbase = &vdso32_start;
 
@@ -712,7 +700,6 @@ static int __init vdso_init(void)
 	 * Calculate the size of the 32 bits vDSO
 	 */
 	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
-	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
 
 	/*
 	 * Setup the syscall map in the vDOS
-- 
2.25.0

