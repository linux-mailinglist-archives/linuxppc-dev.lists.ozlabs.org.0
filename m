Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AF27A067
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 12:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzh3T4MMfzDqw8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 20:00:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg5C2qVJzDq9d
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg536sj5z9vCy9;
 Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lqQ3TzBlVsSM; Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg5367rRz9vCxw;
 Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 524618B771;
 Sun, 27 Sep 2020 11:16:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 62pYDYhttMyY; Sun, 27 Sep 2020 11:16:44 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E8EB8B75B;
 Sun, 27 Sep 2020 11:16:44 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 00E0B65DE8; Sun, 27 Sep 2020 09:16:43 +0000 (UTC)
Message-Id: <11522eec6140f510a8c89c63cbb739277d097fdc.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 26/30] powerpc/vdso: Remove vdso_setup()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:43 +0000 (UTC)
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

vdso_fixup_features() cannot fail anymore and that's
the only function called by vdso_setup().

vdso_setup() has become trivial and can be removed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 0cb320b72923..14fbcc76a629 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -192,7 +192,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	do_##type##_fixups((value), __start, __end);					\
 } while (0)
 
-static int __init vdso_fixup_features(void)
+static void __init vdso_fixup_features(void)
 {
 #ifdef CONFIG_PPC64
 	VDSO_DO_FIXUPS(feature, cur_cpu_spec->cpu_features, 64, ftr_fixup);
@@ -209,16 +209,6 @@ static int __init vdso_fixup_features(void)
 #endif /* CONFIG_PPC64 */
 	VDSO_DO_FIXUPS(lwsync, cur_cpu_spec->cpu_features, 32, lwsync_fixup);
 #endif
-
-	return 0;
-}
-
-static __init int vdso_setup(void)
-{
-	if (vdso_fixup_features())
-		return -1;
-
-	return 0;
 }
 
 /*
@@ -313,14 +303,7 @@ static int __init vdso_init(void)
 
 	vdso_setup_syscall_map();
 
-	/*
-	 * Initialize the vDSO images in memory, that is do necessary
-	 * fixups of vDSO symbols, locate trampolines, etc...
-	 */
-	if (vdso_setup()) {
-		printk(KERN_ERR "vDSO setup failure, not enabled !\n");
-		return 0;
-	}
+	vdso_fixup_features();
 
 	if (IS_ENABLED(CONFIG_VDSO32))
 		vdso32_spec.pages = vdso_setup_pages(&vdso32_start, &vdso32_end);
-- 
2.25.0

