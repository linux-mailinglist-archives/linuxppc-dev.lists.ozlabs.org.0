Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8627A065
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:59:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzh1t6wFMzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:58:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg5B4yRxzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg516rbdz9vCy4;
 Sun, 27 Sep 2020 11:16:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1PkD_OUD6WZc; Sun, 27 Sep 2020 11:16:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg515fF5z9vCxw;
 Sun, 27 Sep 2020 11:16:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5686D8B771;
 Sun, 27 Sep 2020 11:16:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CsK6p0TCGpfP; Sun, 27 Sep 2020 11:16:42 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 138DD8B75B;
 Sun, 27 Sep 2020 11:16:42 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E230F65DE8; Sun, 27 Sep 2020 09:16:41 +0000 (UTC)
Message-Id: <b779e5b7cc0354e2f87fd407fe5b02f4a8a73825.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 24/30] powerpc/vdso: Remove symbol section information in
 struct lib32/64_elfinfo
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:41 +0000 (UTC)
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

The members related to the symbol section in struct lib32_elfinfo and
struct lib64_elfinfo are not used anymore, removed them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 90 --------------------------------------
 1 file changed, 90 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index fa1cbddfb978..f7b477da0b8a 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -70,17 +70,11 @@ struct vdso_arch_data *vdso_data = &vdso_data_store.data;
 struct lib32_elfinfo
 {
 	Elf32_Ehdr	*hdr;		/* ptr to ELF */
-	Elf32_Sym	*dynsym;	/* ptr to .dynsym section */
-	unsigned long	dynsymsize;	/* size of .dynsym section */
-	char		*dynstr;	/* ptr to .dynstr section */
 };
 
 struct lib64_elfinfo
 {
 	Elf64_Ehdr	*hdr;
-	Elf64_Sym	*dynsym;
-	unsigned long	dynsymsize;
-	char		*dynstr;
 };
 
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma,
@@ -208,59 +202,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	return rc;
 }
 
-#ifdef CONFIG_VDSO32
-static void * __init find_section32(Elf32_Ehdr *ehdr, const char *secname,
-				  unsigned long *size)
-{
-	Elf32_Shdr *sechdrs;
-	unsigned int i;
-	char *secnames;
-
-	/* Grab section headers and strings so we can tell who is who */
-	sechdrs = (void *)ehdr + ehdr->e_shoff;
-	secnames = (void *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
-
-	/* Find the section they want */
-	for (i = 1; i < ehdr->e_shnum; i++) {
-		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0) {
-			if (size)
-				*size = sechdrs[i].sh_size;
-			return (void *)ehdr + sechdrs[i].sh_offset;
-		}
-	}
-	*size = 0;
-	return NULL;
-}
-#endif /* CONFIG_VDSO32 */
-
-
-#ifdef CONFIG_PPC64
-
-static void * __init find_section64(Elf64_Ehdr *ehdr, const char *secname,
-				  unsigned long *size)
-{
-	Elf64_Shdr *sechdrs;
-	unsigned int i;
-	char *secnames;
-
-	/* Grab section headers and strings so we can tell who is who */
-	sechdrs = (void *)ehdr + ehdr->e_shoff;
-	secnames = (void *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
-
-	/* Find the section they want */
-	for (i = 1; i < ehdr->e_shnum; i++) {
-		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0) {
-			if (size)
-				*size = sechdrs[i].sh_size;
-			return (void *)ehdr + sechdrs[i].sh_offset;
-		}
-	}
-	if (size)
-		*size = 0;
-	return NULL;
-}
-#endif /* CONFIG_PPC64 */
-
 #define VDSO_DO_FIXUPS(type, value, bits, sec) do {					\
 	void *__start = (void *)VDSO##bits##_SYMBOL(&vdso##bits##_start, sec##_start);	\
 	void *__end = (void *)VDSO##bits##_SYMBOL(&vdso##bits##_start, sec##_end);	\
@@ -268,34 +209,6 @@ static void * __init find_section64(Elf64_Ehdr *ehdr, const char *secname,
 	do_##type##_fixups((value), __start, __end);					\
 } while (0)
 
-static __init int vdso_do_find_sections(struct lib32_elfinfo *v32,
-					struct lib64_elfinfo *v64)
-{
-	/*
-	 * Locate symbol tables & text section
-	 */
-
-#ifdef CONFIG_VDSO32
-	v32->dynsym = find_section32(v32->hdr, ".dynsym", &v32->dynsymsize);
-	v32->dynstr = find_section32(v32->hdr, ".dynstr", NULL);
-	if (v32->dynsym == NULL || v32->dynstr == NULL) {
-		printk(KERN_ERR "vDSO32: required symbol section not found\n");
-		return -1;
-	}
-#endif
-
-#ifdef CONFIG_PPC64
-	v64->dynsym = find_section64(v64->hdr, ".dynsym", &v64->dynsymsize);
-	v64->dynstr = find_section64(v64->hdr, ".dynstr", NULL);
-	if (v64->dynsym == NULL || v64->dynstr == NULL) {
-		printk(KERN_ERR "vDSO64: required symbol section not found\n");
-		return -1;
-	}
-#endif /* CONFIG_PPC64 */
-
-	return 0;
-}
-
 static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 				      struct lib64_elfinfo *v64)
 {
@@ -325,9 +238,6 @@ static __init int vdso_setup(void)
 
 	v32.hdr = vdso32_kbase;
 	v64.hdr = vdso64_kbase;
-	if (vdso_do_find_sections(&v32, &v64))
-		return -1;
-
 	if (vdso_fixup_features(&v32, &v64))
 		return -1;
 
-- 
2.25.0

