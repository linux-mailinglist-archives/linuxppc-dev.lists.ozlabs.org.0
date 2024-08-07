Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E294A7FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 14:43:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sg2C5rmU;
	dkim-atps=neutral
Received: from lists.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf8xP4Zj7z3dSX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sg2C5rmU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf8tQ4lfKz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 22:41:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723034478;
	bh=1aE2cbYKmjRRZKMb9FZa+Csx+YG7mtBDoiTvd1y2/SU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sg2C5rmUsrFsqB+/CRJzTHnIP6xmWqhy/9TubY/RNKmKWWeTjgP+vaVt67AVzTZPf
	 iklksF8ozO1/pUEUnPh6yFOQ4I327udvpjuydImzJBygfquHjGxbehs4uMchmZHUFm
	 0A9i79ZQEyuCRkIwT5WeWMAzz03crWZEzk16n0H60TH6qjJrY5K15pdSvTt+F5/eSt
	 fgUAcvAO+iARo6Uob3f7RgSar6DyTvksewkHZlS4FkNuFQbMKDMRLhE9EBtKH1pqzy
	 Rx530mNH5cy0e7Ie65ib9m58MUjUmJ+UtOPA1ZtZU7aZ4hpc3sM4Gl4wURb8d+1XoK
	 5kyXGW/QLTpDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wf8tQ3Cp8z4x3J;
	Wed,  7 Aug 2024 22:41:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-mm@kvack.org>
Subject: [PATCH 4/4] powerpc/vdso: Refactor error handling
Date: Wed,  7 Aug 2024 22:41:03 +1000
Message-ID: <20240807124103.85644-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807124103.85644-1-mpe@ellerman.id.au>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, jeffxu@google.com, jeffxu@chromium.org, oliver.sang@intel.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus noticed that the error handling in __arch_setup_additional_pages()
fails to clear the mm VDSO pointer if _install_special_mapping()
fails. In practice there should be no actual bug, because if there's an
error the VDSO pointer is cleared later in arch_setup_additional_pages().

However it's no longer necessary to set the pointer before installing
the mapping. Commit c1bab64360e6 ("powerpc/vdso: Move to
_install_special_mapping() and remove arch_vma_name()") reworked the
code so that the VMA name comes from the vm_special_mapping.name, rather
than relying on arch_vma_name().

So rework the code to only set the VDSO pointer once the mappings have
been installed correctly, and remove the stale comment.

Depends-on: c1bab64360e6 ("powerpc/vdso: Move to _install_special_mapping() and remove arch_vma_name()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 220a76cae7c1..ee4b9d676cff 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -214,13 +214,6 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	/* Add required alignment. */
 	vdso_base = ALIGN(vdso_base, VDSO_ALIGNMENT);
 
-	/*
-	 * Put vDSO base into mm struct. We need to do this before calling
-	 * install_special_mapping or the perf counter mmap tracking code
-	 * will fail to recognise it as a vDSO.
-	 */
-	mm->context.vdso = (void __user *)vdso_base + vvar_size;
-
 	vma = _install_special_mapping(mm, vdso_base, vvar_size,
 				       VM_READ | VM_MAYREAD | VM_IO |
 				       VM_DONTDUMP | VM_PFNMAP, &vvar_spec);
@@ -240,10 +233,15 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	vma = _install_special_mapping(mm, vdso_base + vvar_size, vdso_size,
 				       VM_READ | VM_EXEC | VM_MAYREAD |
 				       VM_MAYWRITE | VM_MAYEXEC, vdso_spec);
-	if (IS_ERR(vma))
+	if (IS_ERR(vma)) {
 		do_munmap(mm, vdso_base, vvar_size, NULL);
+		return PTR_ERR(vma);
+	}
 
-	return PTR_ERR_OR_ZERO(vma);
+	// Now that the mappings are in place, set the mm VDSO pointer
+	mm->context.vdso = (void __user *)vdso_base + vvar_size;
+
+	return 0;
 }
 
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
@@ -257,8 +255,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		return -EINTR;
 
 	rc = __arch_setup_additional_pages(bprm, uses_interp);
-	if (rc)
-		mm->context.vdso = NULL;
 
 	mmap_write_unlock(mm);
 	return rc;
-- 
2.45.2

