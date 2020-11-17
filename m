Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C11392B5905
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 06:10:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZvBt4kbxzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 16:09:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZv8p0WrqzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 16:08:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CZv8b24L7z9vDG6;
 Tue, 17 Nov 2020 06:07:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x9UUr05vZLOG; Tue, 17 Nov 2020 06:07:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CZv8b1JzCz9vDG4;
 Tue, 17 Nov 2020 06:07:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFBEC8B773;
 Tue, 17 Nov 2020 06:07:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 78yuI76GK0ll; Tue, 17 Nov 2020 06:07:59 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 675458B75F;
 Tue, 17 Nov 2020 06:07:59 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5EDC166885; Tue, 17 Nov 2020 05:07:59 +0000 (UTC)
Message-Id: <288b6048597c0fdc495b203fda57a223d89499d2.1605589460.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34ebc3ba2c768d97f363bd5f2deea2356e9ae127.1605589460.git.christophe.leroy@csgroup.eu>
References: <34ebc3ba2c768d97f363bd5f2deea2356e9ae127.1605589460.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc: Remove ucache_bsize
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 17 Nov 2020 05:07:59 +0000 (UTC)
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

ppc601 and e200 were the users of ucache_bsize.
ppc601 and e200 are now gone.

Remove ucache_bsize.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/elf.h     | 2 +-
 arch/powerpc/kernel/setup-common.c | 4 ----
 arch/powerpc/kernel/setup_32.c     | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index 53ed2ca40151..900b8d7fdffa 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -168,7 +168,7 @@ do {									\
 	/* Cache size items */						\
 	NEW_AUX_ENT(AT_DCACHEBSIZE, dcache_bsize);			\
 	NEW_AUX_ENT(AT_ICACHEBSIZE, icache_bsize);			\
-	NEW_AUX_ENT(AT_UCACHEBSIZE, ucache_bsize);			\
+	NEW_AUX_ENT(AT_UCACHEBSIZE, 0);					\
 	VDSO_AUX_ENT(AT_SYSINFO_EHDR, current->mm->context.vdso_base);	\
 	ARCH_DLINFO_CACHE_GEOMETRY;					\
 } while (0)
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 808ec9fab605..c23449a93fef 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -90,8 +90,6 @@ EXPORT_SYMBOL_GPL(boot_cpuid);
  */
 int dcache_bsize;
 int icache_bsize;
-int ucache_bsize;
-
 
 unsigned long klimit = (unsigned long) _end;
 
@@ -802,8 +800,6 @@ static __init void print_system_info(void)
 
 	pr_info("dcache_bsize      = 0x%x\n", dcache_bsize);
 	pr_info("icache_bsize      = 0x%x\n", icache_bsize);
-	if (ucache_bsize != 0)
-		pr_info("ucache_bsize      = 0x%x\n", ucache_bsize);
 
 	pr_info("cpu_features      = 0x%016lx\n", cur_cpu_spec->cpu_features);
 	pr_info("  possible        = 0x%016lx\n",
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 416e2c7a8b0a..8ba49a6bf515 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -222,5 +222,4 @@ __init void initialize_cache_info(void)
 	 */
 	dcache_bsize = cur_cpu_spec->dcache_bsize;
 	icache_bsize = cur_cpu_spec->icache_bsize;
-	ucache_bsize = 0;
 }
-- 
2.25.0

