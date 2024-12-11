Return-Path: <linuxppc-dev+bounces-4019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27A9EDB6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGw5HLPz30YS;
	Thu, 12 Dec 2024 10:28:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959704;
	cv=none; b=bEovkpB4dqOfe6tO1U7vkHHZ9xN6720r8DOPa+LGw0XddlZhyzGfFm7Nc2glaQsOvv2Nb/V30GNk4WmvOlWdf3iBJXnkQYfhd44oOBYJAacKc204k/sNKVOejCiAe0tagVe9HxPjku2ayNdQOBERzqF3IBsJ8703EJvZQUxM+mca44jVBZ09qzvv5N2K5OkcbAVsi89Ia6Pr+4UqewIy1kiC64FIvgstZoRsNzhsiD4nZful5E96AliLaAUOHeSjd0Il7aYpv4wvij3FO9lZpUxhg93CGdzK1KWp6DHGNZJ3hhMRhP3vRzq9SrVhgKxhpqR34au3uZaWVWIWlUSr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959704; c=relaxed/relaxed;
	bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kx1gar8lxL5MdTcIupEyTBrP3o/jJgWpQEOBfPqHhxrB9eQ68/4ajRKH+M8BIehDsBnLZEkbnZyzXapiPtEWuHVCSi2DAh4584bo6E2vU8sq5odtQmQzeVPJRgDUQGVYWN42e0yz5Ut0yZUqSCPbp39Lh/Rldh7JYOLMSyJosvepJ8SPEMjYg6yD0fuSWtMQjDIUFJAiCI/Hw3t8RQqwVs2BeJS3/rfdNiL19Rm8pU4B1cE05boPmGd/s9QPrFhgmfOGgE6ZF04CKKHBSUCrbkV6D33tWOZuGQzYLk5v3uWrvlLuZcgmk/b7qvS/zWMawVHgi9oTPFdcDSnnAE9Uag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tc+UUjJe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3fibazwskdaelbmftitjohihpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tc+UUjJe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3fibazwskdaelbmftitjohihpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGw0QGlz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:24 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728eb2e190cso13280b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959702; x=1734564502; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=tc+UUjJeW92BDxFTVHwePTWJatPfeLEl8Tlgk0oI0dEsOJve2LmfRJFmF+K21+B9Dq
         cHBxWzFdkgYo7eZcGx3K7nF7smAXq5znaQoDV4bxYSxN/i7eag5DCaD/8J/JlBL66mV0
         a3MkougobBgV2ee+E54P6I/y7NpOHAitbqwP6XdQCYkJIqGFDttRUYivsOBQnl7VeC8J
         uKG0YcS2KiGLPYTCb1fhg/XnYGeIRZHKH2rfcdn7GgEc6sscP1V3xxTe5ApXMTJ78YdV
         d9kCMitTkPJh6+xPBfZRFRGWlekMIS+ceoU33+VbDEZndo/MjoagdqBEL7mshyvItnyd
         VqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959702; x=1734564502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=hnfFO8wUAXt96m33x8d5PpOnZdAjQ+CayRmIFIcEPSPTupTpGmefSJaje647ReeaAU
         L8g98i0DR/XxUaBVrMqsXTIacty04QFUouu3ucqovxOONktggWKuL3NtCKd9rwHq1azN
         YHDhVebRDTGtHjC9GxnJwc6arSaYsCVupsce3xHGOiwROrdH5NIjQtGZlnEItVqVnvtj
         NVgUiahgIJHACC7FC5uIi7T38uXkUfKEaSPsxiTbt59nWlPZPNaHUyuOuNhdsT90FUQe
         awxWvu30mg+Qn5547vMmLjjlE2iM6SAZ5hwPXbLF6MoTj00dfZJ1qiUprYSs6aCZZlfj
         oX5A==
X-Forwarded-Encrypted: i=1; AJvYcCXWEVqD+M6sod7b783xU5wX3cxanwCuKkqdXwSYravqPNGK1Hj1xB6iVpPZ0na+MB9nJq9v6zRX5b4Ygmo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxy3YvswfqcFG1xg8f0hZMggLCm0jNAK+l1TDNbNlrI7GxtxDCz
	1iykEk1qBWObfLcGs5wZwqx5WrTXSeq3IGLbzHHunyTDf4vKDz536yzNq0/YulYezPEImwtE6Y/
	y+CxbrQ+HSjPy61t6PHrLxw==
X-Google-Smtp-Source: AGHT+IGWTEcN8NSoCgFvsRpfbkF7zue8+P2XAq5n+JVkXUUPL+bOWBEsvAKL/CZzz2D8WnFsu8nT+1urmYWqTc7eRw==
X-Received: from pfaw10.prod.google.com ([2002:a05:6a00:ab8a:b0:725:ee5e:6efd])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:92a6:b0:727:3cd0:1145 with SMTP id d2e1a72fcca58-728fa9a8139mr1688780b3a.2.1733959702467;
 Wed, 11 Dec 2024 15:28:22 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:51 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 13/16] mm: sparc64: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 96 +++++++++++------------------
 2 files changed, 37 insertions(+), 60 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..e44d55b30a84 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,17 +98,19 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
-	unsigned long task_size = TASK_SIZE;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	unsigned long task_size;
+	bool do_color_align;
+	bool file_hugepage;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return -ENOMEM;
+
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -120,26 +122,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	if (test_thread_flag(TIF_32BIT))
-		task_size = STACK_TOP32;
-	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
-		return -ENOMEM;
+	do_color_align = (filp || (flags & MAP_SHARED)) && !file_hugepage;
 
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	unsigned long task_size;
+	bool file_hugepage;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -164,49 +169,20 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
-	unsigned long task_size = STACK_TOP32;
 	unsigned long addr = addr0;
-	int do_color_align;
 	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
 
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
-
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if (!file_hugepage && (flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (unlikely(len > task_size))
-		return -ENOMEM;
-
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
-
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


