Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E127A064
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:57:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzh0L3MHWzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:57:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg5B50WpzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg526prGz9vCy8;
 Sun, 27 Sep 2020 11:16:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0BBrnOOn4YNL; Sun, 27 Sep 2020 11:16:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg525k2gz9vCxw;
 Sun, 27 Sep 2020 11:16:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EAF18B771;
 Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KDvXqI6w6aS4; Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17B9E8B75B;
 Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EED3A65DE8; Sun, 27 Sep 2020 09:16:42 +0000 (UTC)
Message-Id: <01ac65abf22f0428f8f764525a7d84459c54d806.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 25/30] powerpc/vdso: Remove lib32_elfinfo and lib64_elfinfo
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:42 +0000 (UTC)
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

lib32_elfinfo and lib64_elfinfo are not used anymore, remove them.

Also remove vdso32_kbase and vdso64_kbase while removing the
last use.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index f7b477da0b8a..0cb320b72923 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -44,11 +44,8 @@
 /* The alignment of the vDSO */
 #define VDSO_ALIGNMENT	(1 << 16)
 
-static void *vdso32_kbase;
-
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
-static void *vdso64_kbase = &vdso64_start;
 
 static int vdso_ready;
 
@@ -63,20 +60,6 @@ static union {
 } vdso_data_store __page_aligned_data;
 struct vdso_arch_data *vdso_data = &vdso_data_store.data;
 
-/*
- * Some infos carried around for each of them during parsing at
- * boot time.
- */
-struct lib32_elfinfo
-{
-	Elf32_Ehdr	*hdr;		/* ptr to ELF */
-};
-
-struct lib64_elfinfo
-{
-	Elf64_Ehdr	*hdr;
-};
-
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma,
 		       unsigned long text_size)
 {
@@ -209,8 +192,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	do_##type##_fixups((value), __start, __end);					\
 } while (0)
 
-static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
-				      struct lib64_elfinfo *v64)
+static int __init vdso_fixup_features(void)
 {
 #ifdef CONFIG_PPC64
 	VDSO_DO_FIXUPS(feature, cur_cpu_spec->cpu_features, 64, ftr_fixup);
@@ -233,12 +215,7 @@ static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 
 static __init int vdso_setup(void)
 {
-	struct lib32_elfinfo	v32;
-	struct lib64_elfinfo	v64;
-
-	v32.hdr = vdso32_kbase;
-	v64.hdr = vdso64_kbase;
-	if (vdso_fixup_features(&v32, &v64))
+	if (vdso_fixup_features())
 		return -1;
 
 	return 0;
@@ -334,8 +311,6 @@ static int __init vdso_init(void)
 	vdso_data->icache_log_block_size = ppc64_caches.l1i.log_block_size;
 #endif /* CONFIG_PPC64 */
 
-	vdso32_kbase = &vdso32_start;
-
 	vdso_setup_syscall_map();
 
 	/*
-- 
2.25.0

