Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E785A34AF2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 20:17:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Wvh5dK4z3bwm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 06:17:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=JyF6OXJe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=google header.b=JyF6OXJe; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6WvF0xFvz30Cm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 06:17:26 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id o16so6724016wrn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SSjTo98YxGYQCwPX6z3DUR2zlnHihYnDlW5KdYsyNI=;
 b=JyF6OXJed0RT/7r7ff2CeQeG21KWBTuPND3+LtE+5eUO85GvbV+gvvG+YXqSytLyPm
 bjdTxUGr0JRCjMuff3N7F5vwV9d5n9cPOxK+Ve8T4k8o1VJYw6rDH+ZUn500TvDvMVkN
 TXSad4nHq3US4bLQGigRmE/eyneqt/YdP7yUHVhWzak/x6OXOjepQeleOxLfdX3ae7Mu
 e3YX5aLbIdH2kozvDmCjqSew5b7NLkdn4da+BSnmcRrLwkT4uKQADQRqPtmHgI0d0Bca
 JtJEqJCBNK47X8dQxcfyoEOmfI07YjxxZYkifci3hpk7PquMz4mAZOfDVQir9O0JcY9R
 l7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SSjTo98YxGYQCwPX6z3DUR2zlnHihYnDlW5KdYsyNI=;
 b=h+Ugth3LiXWctCWP6tIGb3o4P2nfBuFT4afAxrKMTMGzVhgsYldn3xs8WjAbSaa/At
 cLIVeyhtVh6r+m2uiCXgx4J04YNZMuKRG8IJyc89HBBug4e9ShPj2geef+ciYchQ3GPg
 lKp+LndUa8UGLouyrL2EAFbImPxuVT4AnhNL4RvzAW0VntrWrTGFyADHZmn5VMX60pGZ
 jXmNbTA7dntmLPa3wTMIIMkHlGKNJ+Ldlt6LLhO6NihYtHXSBXE127YXXJritl3Firqj
 9Li2ty/s//Dx2sAcZQ8wul50MiBLj38r3VVyqtjY5doCNFrrkWZ46Qh98GAdHu8/rWPZ
 XKLg==
X-Gm-Message-State: AOAM532kE8x+XnnsxgwyCZJMtbnFn258VEen9ihPwUYbUCi0adQjN/sR
 Y8YVOmzH17Czhr7zRXECMbeLFA==
X-Google-Smtp-Source: ABdhPJwWruxdCVeug5q/ZhAcgz0+aWwcAjfxJy7hNKwQjVp2kK0TxjN3X3rYT6EPQP81cOQ6P7AL4w==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr16696898wrw.382.1616786241974; 
 Fri, 26 Mar 2021 12:17:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 p17sm10996288wmq.47.2021.03.26.12.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:17:21 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/vdso: Separate vvar vma from vdso
Date: Fri, 26 Mar 2021 19:17:20 +0000
Message-Id: <20210326191720.138155-1-dima@arista.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Andrei Vagin <avagin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 511157ab641e ("powerpc/vdso: Move vdso datapage up front")
VVAR page is in front of the VDSO area. In result it breaks CRIU
(Checkpoint Restore In Userspace) [1], where CRIU expects that "[vdso]"
from /proc/../maps points at ELF/vdso image, rather than at VVAR data page.
Laurent made a patch to keep CRIU working (by reading aux vector).
But I think it still makes sence to separate two mappings into different
VMAs. It will also make ppc64 less "special" for userspace and as
a side-bonus will make VVAR page un-writable by debugger (which previously
would COW page and can be unexpected).

I opportunistically Cc stable on it: I understand that usually such
stuff isn't a stable material, but that will allow us in CRIU have
one workaround less that is needed just for one release (v5.11) on
one platform (ppc64), which we otherwise have to maintain.
I wouldn't go as far as to say that the commit 511157ab641e is ABI
regression as no other userspace got broken, but I'd really appreciate
if it gets backported to v5.11 after v5.12 is released, so as not
to complicate already non-simple CRIU-vdso code. Thanks!

Cc: Andrei Vagin <avagin@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: stable@vger.kernel.org # v5.11
[1]: https://github.com/checkpoint-restore/criu/issues/1417
Signed-off-by: Dmitry Safonov <dima@arista.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mmu_context.h |  2 +-
 arch/powerpc/kernel/vdso.c             | 54 +++++++++++++++++++-------
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 652ce85f9410..4bc45d3ed8b0 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -263,7 +263,7 @@ extern void arch_exit_mmap(struct mm_struct *mm);
 static inline void arch_unmap(struct mm_struct *mm,
 			      unsigned long start, unsigned long end)
 {
-	unsigned long vdso_base = (unsigned long)mm->context.vdso - PAGE_SIZE;
+	unsigned long vdso_base = (unsigned long)mm->context.vdso;
 
 	if (start <= vdso_base && vdso_base < end)
 		mm->context.vdso = NULL;
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index e839a906fdf2..b14907209822 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -55,10 +55,10 @@ static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struc
 {
 	unsigned long new_size = new_vma->vm_end - new_vma->vm_start;
 
-	if (new_size != text_size + PAGE_SIZE)
+	if (new_size != text_size)
 		return -EINVAL;
 
-	current->mm->context.vdso = (void __user *)new_vma->vm_start + PAGE_SIZE;
+	current->mm->context.vdso = (void __user *)new_vma->vm_start;
 
 	return 0;
 }
@@ -73,6 +73,10 @@ static int vdso64_mremap(const struct vm_special_mapping *sm, struct vm_area_str
 	return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
 }
 
+static struct vm_special_mapping vvar_spec __ro_after_init = {
+	.name = "[vvar]",
+};
+
 static struct vm_special_mapping vdso32_spec __ro_after_init = {
 	.name = "[vdso]",
 	.mremap = vdso32_mremap,
@@ -89,11 +93,11 @@ static struct vm_special_mapping vdso64_spec __ro_after_init = {
  */
 static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
-	struct mm_struct *mm = current->mm;
+	unsigned long vdso_size, vdso_base, mappings_size;
 	struct vm_special_mapping *vdso_spec;
+	unsigned long vvar_size = PAGE_SIZE;
+	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	unsigned long vdso_size;
-	unsigned long vdso_base;
 
 	if (is_32bit_task()) {
 		vdso_spec = &vdso32_spec;
@@ -110,8 +114,8 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 		vdso_base = 0;
 	}
 
-	/* Add a page to the vdso size for the data page */
-	vdso_size += PAGE_SIZE;
+	mappings_size = vdso_size + vvar_size;
+	mappings_size += (VDSO_ALIGNMENT - 1) & PAGE_MASK;
 
 	/*
 	 * pick a base address for the vDSO in process space. We try to put it
@@ -119,9 +123,7 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * and end up putting it elsewhere.
 	 * Add enough to the size so that the result can be aligned.
 	 */
-	vdso_base = get_unmapped_area(NULL, vdso_base,
-				      vdso_size + ((VDSO_ALIGNMENT - 1) & PAGE_MASK),
-				      0, 0);
+	vdso_base = get_unmapped_area(NULL, vdso_base, mappings_size, 0, 0);
 	if (IS_ERR_VALUE(vdso_base))
 		return vdso_base;
 
@@ -133,7 +135,13 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO.
 	 */
-	mm->context.vdso = (void __user *)vdso_base + PAGE_SIZE;
+	mm->context.vdso = (void __user *)vdso_base + vvar_size;
+
+	vma = _install_special_mapping(mm, vdso_base, vvar_size,
+				       VM_READ | VM_MAYREAD | VM_IO |
+				       VM_DONTDUMP | VM_PFNMAP, &vvar_spec);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -145,9 +153,12 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * It's fine to use that for setting breakpoints in the vDSO code
 	 * pages though.
 	 */
-	vma = _install_special_mapping(mm, vdso_base, vdso_size,
+	vma = _install_special_mapping(mm, vdso_base + vvar_size, vdso_size,
 				       VM_READ | VM_EXEC | VM_MAYREAD |
 				       VM_MAYWRITE | VM_MAYEXEC, vdso_spec);
+	if (IS_ERR(vma))
+		do_munmap(mm, vdso_base, vvar_size, NULL);
+
 	return PTR_ERR_OR_ZERO(vma);
 }
 
@@ -249,11 +260,22 @@ static struct page ** __init vdso_setup_pages(void *start, void *end)
 	if (!pagelist)
 		panic("%s: Cannot allocate page list for VDSO", __func__);
 
-	pagelist[0] = virt_to_page(vdso_data);
-
 	for (i = 0; i < pages; i++)
-		pagelist[i + 1] = virt_to_page(start + i * PAGE_SIZE);
+		pagelist[i] = virt_to_page(start + i * PAGE_SIZE);
+
+	return pagelist;
+}
+
+static struct page ** __init vvar_setup_pages(void)
+{
+	struct page **pagelist;
 
+	/* .pages is NULL-terminated */
+	pagelist = kcalloc(2, sizeof(struct page *), GFP_KERNEL);
+	if (!pagelist)
+		panic("%s: Cannot allocate page list for VVAR", __func__);
+
+	pagelist[0] = virt_to_page(vdso_data);
 	return pagelist;
 }
 
@@ -295,6 +317,8 @@ static int __init vdso_init(void)
 	if (IS_ENABLED(CONFIG_PPC64))
 		vdso64_spec.pages = vdso_setup_pages(&vdso64_start, &vdso64_end);
 
+	vvar_spec.pages = vvar_setup_pages();
+
 	smp_wmb();
 
 	return 0;
-- 
2.31.0

