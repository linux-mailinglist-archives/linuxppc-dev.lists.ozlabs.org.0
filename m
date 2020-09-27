Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFEB27A05B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:51:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgsF3C6BzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:51:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg571ZsbzDqB9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4z0s0vz9vCy1;
 Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uUA0IOy9RpUV; Sun, 27 Sep 2020 11:16:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4y6hdJz9vCxw;
 Sun, 27 Sep 2020 11:16:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BD708B771;
 Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sWw5s0MOzYkz; Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEBDF8B75B;
 Sun, 27 Sep 2020 11:16:38 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C231365DE8; Sun, 27 Sep 2020 09:16:38 +0000 (UTC)
Message-Id: <7c192d35a437151837cf4c48aeccb42380d6daac.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 21/30] powerpc/vdso: Remove runtime generated sigtramp
 offsets
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:38 +0000 (UTC)
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

Signal trampoline offsets are now generated at buildtime.

Runtime generated offsets are not used anymore, remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso.h |  5 ---
 arch/powerpc/kernel/vdso.c      | 59 ---------------------------------
 2 files changed, 64 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index f5257b7f17d0..a97384909fe5 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -27,11 +27,6 @@
 
 #define VDSO32_SYMBOL(base, name) ((unsigned long)(base) + (vdso32_offset_##name))
 
-/* Offsets relative to thread->vdso_base */
-extern unsigned long vdso64_rt_sigtramp;
-extern unsigned long vdso32_sigtramp;
-extern unsigned long vdso32_rt_sigtramp;
-
 int vdso_getcpu_init(void);
 
 #else /* __ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 611977010e2d..ec0f1aae0cad 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -48,15 +48,10 @@
 #define VDSO_ALIGNMENT	(1 << 16)
 
 static void *vdso32_kbase;
-unsigned long vdso32_sigtramp;
-unsigned long vdso32_rt_sigtramp;
 
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 static void *vdso64_kbase = &vdso64_start;
-#ifdef CONFIG_PPC64
-unsigned long vdso64_rt_sigtramp;
-#endif /* CONFIG_PPC64 */
 
 static int vdso_ready;
 
@@ -278,22 +273,6 @@ static Elf32_Sym * __init find_symbol32(struct lib32_elfinfo *lib,
 	return NULL;
 }
 
-/* Note that we assume the section is .text and the symbol is relative to
- * the library base
- */
-static unsigned long __init find_function32(struct lib32_elfinfo *lib,
-					    const char *symname)
-{
-	Elf32_Sym *sym = find_symbol32(lib, symname);
-
-	if (sym == NULL) {
-		printk(KERN_WARNING "vDSO32: function %s not found !\n",
-		       symname);
-		return 0;
-	}
-	return sym->st_value - VDSO32_LBASE;
-}
-
 static int __init vdso_do_func_patch32(struct lib32_elfinfo *v32,
 				       struct lib64_elfinfo *v64,
 				       const char *orig, const char *fix)
@@ -323,12 +302,6 @@ static int __init vdso_do_func_patch32(struct lib32_elfinfo *v32,
 	return 0;
 }
 #else /* !CONFIG_VDSO32 */
-static unsigned long __init find_function32(struct lib32_elfinfo *lib,
-					    const char *symname)
-{
-	return 0;
-}
-
 static int __init vdso_do_func_patch32(struct lib32_elfinfo *v32,
 				       struct lib64_elfinfo *v64,
 				       const char *orig, const char *fix)
@@ -384,22 +357,6 @@ static Elf64_Sym * __init find_symbol64(struct lib64_elfinfo *lib,
 	return NULL;
 }
 
-/* Note that we assume the section is .text and the symbol is relative to
- * the library base
- */
-static unsigned long __init find_function64(struct lib64_elfinfo *lib,
-					    const char *symname)
-{
-	Elf64_Sym *sym = find_symbol64(lib, symname);
-
-	if (sym == NULL) {
-		printk(KERN_WARNING "vDSO64: function %s not found !\n",
-		       symname);
-		return 0;
-	}
-	return sym->st_value - VDSO64_LBASE;
-}
-
 static int __init vdso_do_func_patch64(struct lib32_elfinfo *v32,
 				       struct lib64_elfinfo *v64,
 				       const char *orig, const char *fix)
@@ -480,20 +437,6 @@ static __init int vdso_do_find_sections(struct lib32_elfinfo *v32,
 	return 0;
 }
 
-static __init void vdso_setup_trampolines(struct lib32_elfinfo *v32,
-					  struct lib64_elfinfo *v64)
-{
-	/*
-	 * Find signal trampolines
-	 */
-
-#ifdef CONFIG_PPC64
-	vdso64_rt_sigtramp = find_function64(v64, "__kernel_sigtramp_rt64");
-#endif
-	vdso32_sigtramp	   = find_function32(v32, "__kernel_sigtramp32");
-	vdso32_rt_sigtramp = find_function32(v32, "__kernel_sigtramp_rt32");
-}
-
 static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 				      struct lib64_elfinfo *v64)
 {
@@ -565,8 +508,6 @@ static __init int vdso_setup(void)
 	if (vdso_fixup_alt_funcs(&v32, &v64))
 		return -1;
 
-	vdso_setup_trampolines(&v32, &v64);
-
 	return 0;
 }
 
-- 
2.25.0

