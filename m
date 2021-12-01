Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FB465085
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42B22kq9z3dqq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O/L9WPFI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=O/L9WPFI; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yn242Vz30Hr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:41 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id y7so17909068plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVg8kQOPluGPpW1nEed/2jgfMixtRwdzMIV6QiUiZyU=;
 b=O/L9WPFI63h2B++wcpn0tzaayK9oY39G1CrWY5ProHf67L03Gsuu7Agyt6n4MWkojM
 T6yv4rHL/gAwvZZCokZnNTVcq0SLuoOk0OSKOnFhcHBVPb98GnCIVQ7Tw+/TXFsYOMVt
 3gnHv++OnBgM1iwWhSrNQY8OREPg4/jxBgFlZy6e2PJWwl9tMiQw3RCwRrbjcBjr/L+U
 ZXOHNMEDaT+iEHnXxCNA+KBmenJIoUvnGYmGaRq0Lhqk3w5X/3eomj+5vTRMolZPhx6g
 ev125HUQDws0ywvtvqU5y6IHA257WY1BjumP1hNLMh3k427Br3xZqN88jXlWjACjOUqz
 zrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AVg8kQOPluGPpW1nEed/2jgfMixtRwdzMIV6QiUiZyU=;
 b=UWtP7SahNgsGMLD51CKIPMawlRJH5r+lq8R9ljZsxXzW4YKyXHfxivTnvbdeBL7S4c
 j7AlZnRFMO9cv+H6r6rADkF2e6Ej4Mr8A+qmmL0em+v88qcbA158d7ELzoQ0n44GSXtC
 LMbh58IiWx+PPQ1cQkHO5Z8/RX0T3Aqc/4xBJ5/a4pVfkaRWauNJuloVCUf7AIQP+g3n
 iXejEId5eSXIA6GPcztcKHnmM7eiT8c0XiYd7E4EvTze+vQ3sqIIncFho/YCK0ystvAU
 +ZVgGGoAnC8h0rmxW0VE129rjDGdZ7qsaykR9ng9o7zCMSHTTcP3WRZh0IlGxzzZy0l2
 0lqA==
X-Gm-Message-State: AOAM531M32BBSoFY2AsH1X+VB5fdCXHo02MXBUs0peanIWD35rdI8C6S
 KZjentJb0i1qiZTKNHa1tR6QKbF3vWw=
X-Google-Smtp-Source: ABdhPJxzoZ1ud7F9C2iLN1QcETmCfN+VpQcgXVUBNkpyt+bnSjmwnR8l+4GgExy67FgboIaLty0lZQ==
X-Received: by 2002:a17:90b:3e85:: with SMTP id
 rj5mr8114734pjb.172.1638369759505; 
 Wed, 01 Dec 2021 06:42:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 15/18] powerpc/64s: Always define arch unmapped area calls
Date: Thu,  2 Dec 2021 00:41:50 +1000
Message-Id: <20211201144153.2456614-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid any functional changes to radix paths when building with hash
MMU support disabled (and CONFIG_PPC_MM_SLICES=n), always define the
arch get_unmapped_area calls on 64s platforms.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/hash.h |  4 ---
 arch/powerpc/include/asm/book3s/64/mmu.h  |  6 ++++
 arch/powerpc/mm/hugetlbpage.c             | 16 ++++++---
 arch/powerpc/mm/mmap.c                    | 40 +++++++++++++++++++----
 arch/powerpc/mm/slice.c                   | 20 ------------
 5 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 674fe0e890dc..a7a0572f3846 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -99,10 +99,6 @@
  * Defines the address of the vmemap area, in its own region on
  * hash table CPUs.
  */
-#ifdef CONFIG_PPC_MM_SLICES
-#define HAVE_ARCH_UNMAPPED_AREA
-#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-#endif /* CONFIG_PPC_MM_SLICES */
 
 /* PTEIDX nibble */
 #define _PTEIDX_SECONDARY	0x8
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..015d7d972d16 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -4,6 +4,12 @@
 
 #include <asm/page.h>
 
+#ifdef CONFIG_HUGETLB_PAGE
+#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
+#endif
+#define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+
 #ifndef __ASSEMBLY__
 /*
  * Page size definition
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 82d8b368ca6d..ddead41e2194 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -542,20 +542,26 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
 	return page;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
+static inline int file_to_psize(struct file *file)
+{
+	struct hstate *hstate = hstate_file(file);
+	return shift_to_mmu_psize(huge_page_shift(hstate));
+}
+
 unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags)
 {
-	struct hstate *hstate = hstate_file(file);
-	int mmu_psize = shift_to_mmu_psize(huge_page_shift(hstate));
-
 #ifdef CONFIG_PPC_RADIX_MMU
 	if (radix_enabled())
 		return radix__hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
 #endif
-	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
+#ifdef CONFIG_PPC_MM_SLICES
+	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
+#endif
+	BUG();
 }
 #endif
 
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index ae683fdc716c..c475cf810aa8 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -80,6 +80,7 @@ static inline unsigned long mmap_base(unsigned long rnd,
 	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
 }
 
+#ifdef HAVE_ARCH_UNMAPPED_AREA
 #ifdef CONFIG_PPC_RADIX_MMU
 /*
  * Same function as generic code used only for radix, because we don't need to overload
@@ -181,11 +182,42 @@ radix__arch_get_unmapped_area_topdown(struct file *filp,
 	 */
 	return radix__arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
 }
+#endif
+
+unsigned long arch_get_unmapped_area(struct file *filp,
+				     unsigned long addr,
+				     unsigned long len,
+				     unsigned long pgoff,
+				     unsigned long flags)
+{
+#ifdef CONFIG_PPC_MM_SLICES
+	return slice_get_unmapped_area(addr, len, flags,
+				       mm_ctx_user_psize(&current->mm->context), 0);
+#else
+	BUG();
+#endif
+}
+
+unsigned long arch_get_unmapped_area_topdown(struct file *filp,
+					     const unsigned long addr0,
+					     const unsigned long len,
+					     const unsigned long pgoff,
+					     const unsigned long flags)
+{
+#ifdef CONFIG_PPC_MM_SLICES
+	return slice_get_unmapped_area(addr0, len, flags,
+				       mm_ctx_user_psize(&current->mm->context), 1);
+#else
+	BUG();
+#endif
+}
+#endif /* HAVE_ARCH_UNMAPPED_AREA */
 
 static void radix__arch_pick_mmap_layout(struct mm_struct *mm,
 					unsigned long random_factor,
 					struct rlimit *rlim_stack)
 {
+#ifdef CONFIG_PPC_RADIX_MMU
 	if (mmap_is_legacy(rlim_stack)) {
 		mm->mmap_base = TASK_UNMAPPED_BASE;
 		mm->get_unmapped_area = radix__arch_get_unmapped_area;
@@ -193,13 +225,9 @@ static void radix__arch_pick_mmap_layout(struct mm_struct *mm,
 		mm->mmap_base = mmap_base(random_factor, rlim_stack);
 		mm->get_unmapped_area = radix__arch_get_unmapped_area_topdown;
 	}
-}
-#else
-/* dummy */
-extern void radix__arch_pick_mmap_layout(struct mm_struct *mm,
-					unsigned long random_factor,
-					struct rlimit *rlim_stack);
 #endif
+}
+
 /*
  * This function, called very early during the creation of a new
  * process VM image, sets up which VM layout function to use:
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index 82b45b1cb973..f42711f865f3 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -639,26 +639,6 @@ unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
 }
 EXPORT_SYMBOL_GPL(slice_get_unmapped_area);
 
-unsigned long arch_get_unmapped_area(struct file *filp,
-				     unsigned long addr,
-				     unsigned long len,
-				     unsigned long pgoff,
-				     unsigned long flags)
-{
-	return slice_get_unmapped_area(addr, len, flags,
-				       mm_ctx_user_psize(&current->mm->context), 0);
-}
-
-unsigned long arch_get_unmapped_area_topdown(struct file *filp,
-					     const unsigned long addr0,
-					     const unsigned long len,
-					     const unsigned long pgoff,
-					     const unsigned long flags)
-{
-	return slice_get_unmapped_area(addr0, len, flags,
-				       mm_ctx_user_psize(&current->mm->context), 1);
-}
-
 unsigned int notrace get_slice_psize(struct mm_struct *mm, unsigned long addr)
 {
 	unsigned char *psizes;
-- 
2.23.0

