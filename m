Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BA27A05C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:52:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzgtw48XJzDq8t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:52:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg572rdhzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4z6xTvz9vCy2;
 Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id D2dgZXU0cRZO; Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4z66Hdz9vCxw;
 Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 423908B771;
 Sun, 27 Sep 2020 11:16:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7HAkop84yHSH; Sun, 27 Sep 2020 11:16:40 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EACC78B75B;
 Sun, 27 Sep 2020 11:16:39 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CE5C065DE8; Sun, 27 Sep 2020 09:16:39 +0000 (UTC)
Message-Id: <27d75debd6e4ddeaffe1d66ffed1e7526684a004.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 22/30] powerpc/vdso: Remove vdso_patches[] and associated
 functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:39 +0000 (UTC)
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

vdso_patches[] is now empty, remove it and remove
all functions that depends on it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 161 -------------------------------------
 1 file changed, 161 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index ec0f1aae0cad..5e4e3546f034 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -41,9 +41,6 @@
 #define DBG(fmt...)
 #endif
 
-/* Max supported size for symbol names */
-#define MAX_SYMNAME	64
-
 /* The alignment of the vDSO */
 #define VDSO_ALIGNMENT	(1 << 16)
 
@@ -66,22 +63,6 @@ static union {
 } vdso_data_store __page_aligned_data;
 struct vdso_arch_data *vdso_data = &vdso_data_store.data;
 
-/* Format of the patch table */
-struct vdso_patch_def
-{
-	unsigned long	ftr_mask, ftr_value;
-	const char	*gen_name;
-	const char	*fix_name;
-};
-
-/* Table of functions to patch based on the CPU type/revision
- *
- * Currently, we only change sync_dicache to do nothing on processors
- * with a coherent icache
- */
-static struct vdso_patch_def vdso_patches[] = {
-};
-
 /*
  * Some infos carried around for each of them during parsing at
  * boot time.
@@ -252,62 +233,6 @@ static void * __init find_section32(Elf32_Ehdr *ehdr, const char *secname,
 	*size = 0;
 	return NULL;
 }
-
-static Elf32_Sym * __init find_symbol32(struct lib32_elfinfo *lib,
-					const char *symname)
-{
-	unsigned int i;
-	char name[MAX_SYMNAME], *c;
-
-	for (i = 0; i < (lib->dynsymsize / sizeof(Elf32_Sym)); i++) {
-		if (lib->dynsym[i].st_name == 0)
-			continue;
-		strlcpy(name, lib->dynstr + lib->dynsym[i].st_name,
-			MAX_SYMNAME);
-		c = strchr(name, '@');
-		if (c)
-			*c = 0;
-		if (strcmp(symname, name) == 0)
-			return &lib->dynsym[i];
-	}
-	return NULL;
-}
-
-static int __init vdso_do_func_patch32(struct lib32_elfinfo *v32,
-				       struct lib64_elfinfo *v64,
-				       const char *orig, const char *fix)
-{
-	Elf32_Sym *sym32_gen, *sym32_fix;
-
-	sym32_gen = find_symbol32(v32, orig);
-	if (sym32_gen == NULL) {
-		printk(KERN_ERR "vDSO32: Can't find symbol %s !\n", orig);
-		return -1;
-	}
-	if (fix == NULL) {
-		sym32_gen->st_name = 0;
-		return 0;
-	}
-	sym32_fix = find_symbol32(v32, fix);
-	if (sym32_fix == NULL) {
-		printk(KERN_ERR "vDSO32: Can't find symbol %s !\n", fix);
-		return -1;
-	}
-	sym32_gen->st_value = sym32_fix->st_value;
-	sym32_gen->st_size = sym32_fix->st_size;
-	sym32_gen->st_info = sym32_fix->st_info;
-	sym32_gen->st_other = sym32_fix->st_other;
-	sym32_gen->st_shndx = sym32_fix->st_shndx;
-
-	return 0;
-}
-#else /* !CONFIG_VDSO32 */
-static int __init vdso_do_func_patch32(struct lib32_elfinfo *v32,
-				       struct lib64_elfinfo *v64,
-				       const char *orig, const char *fix)
-{
-	return 0;
-}
 #endif /* CONFIG_VDSO32 */
 
 
@@ -336,56 +261,6 @@ static void * __init find_section64(Elf64_Ehdr *ehdr, const char *secname,
 		*size = 0;
 	return NULL;
 }
-
-static Elf64_Sym * __init find_symbol64(struct lib64_elfinfo *lib,
-					const char *symname)
-{
-	unsigned int i;
-	char name[MAX_SYMNAME], *c;
-
-	for (i = 0; i < (lib->dynsymsize / sizeof(Elf64_Sym)); i++) {
-		if (lib->dynsym[i].st_name == 0)
-			continue;
-		strlcpy(name, lib->dynstr + lib->dynsym[i].st_name,
-			MAX_SYMNAME);
-		c = strchr(name, '@');
-		if (c)
-			*c = 0;
-		if (strcmp(symname, name) == 0)
-			return &lib->dynsym[i];
-	}
-	return NULL;
-}
-
-static int __init vdso_do_func_patch64(struct lib32_elfinfo *v32,
-				       struct lib64_elfinfo *v64,
-				       const char *orig, const char *fix)
-{
-	Elf64_Sym *sym64_gen, *sym64_fix;
-
-	sym64_gen = find_symbol64(v64, orig);
-	if (sym64_gen == NULL) {
-		printk(KERN_ERR "vDSO64: Can't find symbol %s !\n", orig);
-		return -1;
-	}
-	if (fix == NULL) {
-		sym64_gen->st_name = 0;
-		return 0;
-	}
-	sym64_fix = find_symbol64(v64, fix);
-	if (sym64_fix == NULL) {
-		printk(KERN_ERR "vDSO64: Can't find symbol %s !\n", fix);
-		return -1;
-	}
-	sym64_gen->st_value = sym64_fix->st_value;
-	sym64_gen->st_size = sym64_fix->st_size;
-	sym64_gen->st_info = sym64_fix->st_info;
-	sym64_gen->st_other = sym64_fix->st_other;
-	sym64_gen->st_shndx = sym64_fix->st_shndx;
-
-	return 0;
-}
-
 #endif /* CONFIG_PPC64 */
 
 #define VDSO_DO_FIXUPS(type, value, bits, sec) do {					\
@@ -459,39 +334,6 @@ static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 	return 0;
 }
 
-static __init int vdso_fixup_alt_funcs(struct lib32_elfinfo *v32,
-				       struct lib64_elfinfo *v64)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(vdso_patches); i++) {
-		struct vdso_patch_def *patch = &vdso_patches[i];
-		int match = (cur_cpu_spec->cpu_features & patch->ftr_mask)
-			== patch->ftr_value;
-		if (!match)
-			continue;
-
-		DBG("replacing %s with %s...\n", patch->gen_name,
-		    patch->fix_name ? "NONE" : patch->fix_name);
-
-		/*
-		 * Patch the 32 bits and 64 bits symbols. Note that we do not
-		 * patch the "." symbol on 64 bits.
-		 * It would be easy to do, but doesn't seem to be necessary,
-		 * patching the OPD symbol is enough.
-		 */
-		vdso_do_func_patch32(v32, v64, patch->gen_name,
-				     patch->fix_name);
-#ifdef CONFIG_PPC64
-		vdso_do_func_patch64(v32, v64, patch->gen_name,
-				     patch->fix_name);
-#endif /* CONFIG_PPC64 */
-	}
-
-	return 0;
-}
-
-
 static __init int vdso_setup(void)
 {
 	struct lib32_elfinfo	v32;
@@ -505,9 +347,6 @@ static __init int vdso_setup(void)
 	if (vdso_fixup_features(&v32, &v64))
 		return -1;
 
-	if (vdso_fixup_alt_funcs(&v32, &v64))
-		return -1;
-
 	return 0;
 }
 
-- 
2.25.0

