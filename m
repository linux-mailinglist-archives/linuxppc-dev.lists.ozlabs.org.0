Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71400254A77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcnwQ1psCzDqCs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:18:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcnGn1GBlzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:49:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcnGY6QxJz9v4bT;
 Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 04lsUqrsDZaj; Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcnGY5bXSz9v2FV;
 Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 601FE8B8A3;
 Thu, 27 Aug 2020 17:49:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5n3OaebEi7eJ; Thu, 27 Aug 2020 17:49:27 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 22EC18B8A2;
 Thu, 27 Aug 2020 17:49:26 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 894EE65D45; Thu, 27 Aug 2020 15:49:26 +0000 (UTC)
Message-Id: <c4bb4789ee2b0e4eeff9589722920c58ce05242a.1598543237.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e8d735102627299303acd8fbec8c7a706b1e7882.1598543237.git.christophe.leroy@csgroup.eu>
References: <e8d735102627299303acd8fbec8c7a706b1e7882.1598543237.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/6] powerpc/vdso: Don't rely on vdso_pages being 0 for
 failure
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 27 Aug 2020 15:49:26 +0000 (UTC)
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

If vdso initialisation failed, vdso_ready is not set.
Otherwise, vdso_pages is only 0 when it is a 32 bits task
and CONFIG_VDSO32 is not selected.

As arch_setup_additional_pages() now bails out directly in
that case, we don't need to set vdso_pages to 0.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 465150253c31..c173c70ca7d2 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -178,11 +178,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	current->mm->context.vdso_base = 0;
 
-	/* vDSO has a problem and was disabled, just don't "enable" it for the
-	 * process
-	 */
-	if (vdso_pages == 0)
-		return 0;
 	/* Add a page to the vdso size for the data page */
 	vdso_pages ++;
 
@@ -712,14 +707,16 @@ static int __init vdso_init(void)
 	 * Initialize the vDSO images in memory, that is do necessary
 	 * fixups of vDSO symbols, locate trampolines, etc...
 	 */
-	if (vdso_setup())
-		goto setup_failed;
+	if (vdso_setup()) {
+		pr_err("vDSO setup failure, not enabled !\n");
+		return 0;
+	}
 
 	if (IS_ENABLED(CONFIG_VDSO32)) {
 		/* Make sure pages are in the correct state */
 		pagelist = kcalloc(vdso32_pages + 1, sizeof(struct page *), GFP_KERNEL);
 		if (!pagelist)
-			goto alloc_failed;
+			return 0;
 
 		pagelist[0] = virt_to_page(vdso_data);
 
@@ -732,7 +729,7 @@ static int __init vdso_init(void)
 	if (IS_ENABLED(CONFIG_PPC64)) {
 		pagelist = kcalloc(vdso64_pages + 1, sizeof(struct page *), GFP_KERNEL);
 		if (!pagelist)
-			goto alloc_failed;
+			return 0;
 
 		pagelist[0] = virt_to_page(vdso_data);
 
@@ -745,14 +742,6 @@ static int __init vdso_init(void)
 	smp_wmb();
 	vdso_ready = 1;
 
-	return 0;
-
-setup_failed:
-	pr_err("vDSO setup failure, not enabled !\n");
-alloc_failed:
-	vdso32_pages = 0;
-	vdso64_pages = 0;
-
 	return 0;
 }
 arch_initcall(vdso_init);
-- 
2.25.0

