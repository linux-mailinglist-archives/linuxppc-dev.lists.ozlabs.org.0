Return-Path: <linuxppc-dev+bounces-8-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC794E881
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:26:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fFPHXE1d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6zl66Xcz2y8V;
	Mon, 12 Aug 2024 18:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fFPHXE1d;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6zl59RDz2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 18:26:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723451171;
	bh=90PGWBEPImYbqdKWstTCR2/CnGQLSesaZNbFieveKuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fFPHXE1dOvj+bKatKB56csNqaldo10qmfdXwB1reponcEmik+TvrSRPKhatzXSHSx
	 wSbXA5pkgkbvxhDr6zSSvFQvnSDu+1oJErPK+JPOsOUZur2lv/ndnIqPxMc8HyxMjH
	 XN95VVCbSnJRNpFyLmuBWBUzmwADAyxkNtqaWmYpunfu4p5z7Zg0u5fPeMVuH5Hok/
	 mFcKZgybv4Zx8Q8guL83cj7gAwLZmUwBrL9ZzgTi64YSYhfhdZdn+TRgNvBMhtEpRn
	 oUYqRjmf0fWRjTlu2BtTD5vHgOShzNnppXzHKFJvbRd7ZradwBPOHQNgO/ABDbGAKX
	 nKLrIq6sdYBhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj6zl3y2Sz4x8w;
	Mon, 12 Aug 2024 18:26:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-mm@kvack.org>
Cc: <linuxppc-dev@lists.ozlabs.org>,
	torvalds@linux-foundation.org,
	akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu,
	jeffxu@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org,
	npiggin@gmail.com,
	oliver.sang@intel.com,
	pedro.falcato@gmail.com
Subject: [PATCH v2 2/4] powerpc/mm: Handle VDSO unmapping via close() rather than arch_unmap()
Date: Mon, 12 Aug 2024 18:26:03 +1000
Message-ID: <20240812082605.743814-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812082605.743814-1-mpe@ellerman.id.au>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a close() callback to the VDSO special mapping to handle unmapping
of the VDSO. That will make it possible to remove the arch_unmap() hook
entirely in a subsequent patch.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/mmu_context.h |  4 ----
 arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

v2: Unchanged except for collecting tags.

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 37bffa0f7918..9b8c1555744e 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct *mm);
 static inline void arch_unmap(struct mm_struct *mm,
 			      unsigned long start, unsigned long end)
 {
-	unsigned long vdso_base = (unsigned long)mm->context.vdso;
-
-	if (start <= vdso_base && vdso_base < end)
-		mm->context.vdso = NULL;
 }
 
 #ifdef CONFIG_PPC_MEM_KEYS
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 7a2ff9010f17..220a76cae7c1 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_special_mapping *sm, struct vm_area_str
 	return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start);
 }
 
+static void vdso_close(const struct vm_special_mapping *sm, struct vm_area_struct *vma)
+{
+	struct mm_struct *mm = vma->vm_mm;
+
+	/*
+	 * close() is called for munmap() but also for mremap(). In the mremap()
+	 * case the vdso pointer has already been updated by the mremap() hook
+	 * above, so it must not be set to NULL here.
+	 */
+	if (vma->vm_start != (unsigned long)mm->context.vdso)
+		return;
+
+	mm->context.vdso = NULL;
+}
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf);
 
@@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec __ro_after_init = {
 static struct vm_special_mapping vdso32_spec __ro_after_init = {
 	.name = "[vdso]",
 	.mremap = vdso32_mremap,
+	.close = vdso_close,
 };
 
 static struct vm_special_mapping vdso64_spec __ro_after_init = {
 	.name = "[vdso]",
 	.mremap = vdso64_mremap,
+	.close = vdso_close,
 };
 
 #ifdef CONFIG_TIME_NS
-- 
2.45.2


