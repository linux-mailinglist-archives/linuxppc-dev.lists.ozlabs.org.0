Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D69254A3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:08:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcnhs5ylgzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:08:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcnGk0H7HzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:49:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcnGY3sHgz9v2LC;
 Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZjmVJkdYt3RE; Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcnGY2lkmz9v2Kg;
 Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F6828B880;
 Thu, 27 Aug 2020 17:49:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AKqaYu0OjhlB; Thu, 27 Aug 2020 17:49:26 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9CAF8B8A2;
 Thu, 27 Aug 2020 17:49:25 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 8282165D45; Thu, 27 Aug 2020 15:49:25 +0000 (UTC)
Message-Id: <5b8cee42a5dffd3f8cdda44b4723b5bb7055fdd3.1598543237.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e8d735102627299303acd8fbec8c7a706b1e7882.1598543237.git.christophe.leroy@csgroup.eu>
References: <e8d735102627299303acd8fbec8c7a706b1e7882.1598543237.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/6] powerpc/vdso: Don't reference vdso32 static
 functions/vars without CONFIG_VDSO32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 27 Aug 2020 15:49:25 +0000 (UTC)
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

When CONFIG_VDSO32 is not selected, just don't reference the static
vdso32 variables and functions.

This allows the compiler to optimise them out, and allows to
drop an #ifdef CONFIG_VDSO32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index a44e8e6a4692..465150253c31 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -159,11 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (!vdso_ready)
 		return 0;
 
-	if (is_32bit_task()) {
-		vdso_spec = &vdso32_spec;
-		vdso_pages = vdso32_pages;
-		vdso_base = VDSO32_MBASE;
-	} else {
+	if (!is_32bit_task()) {
 		vdso_spec = &vdso64_spec;
 		vdso_pages = vdso64_pages;
 		/*
@@ -172,6 +168,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		 * and most likely share a SLB entry.
 		 */
 		vdso_base = 0;
+	} else if (IS_ENABLED(CONFIG_VDSO32)) {
+		vdso_spec = &vdso32_spec;
+		vdso_pages = vdso32_pages;
+		vdso_base = VDSO32_MBASE;
+	} else {
+		return 0;
 	}
 
 	current->mm->context.vdso_base = 0;
@@ -696,12 +698,10 @@ static int __init vdso_init(void)
 
 	vdso32_kbase = &vdso32_start;
 
-#ifdef CONFIG_VDSO32
 	/*
 	 * Calculate the size of the 32 bits vDSO
 	 */
 	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
-#endif
 
 	/*
 	 * Setup the syscall map in the vDOS
-- 
2.25.0

