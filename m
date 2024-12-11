Return-Path: <linuxppc-dev+bounces-4009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40409EDB3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGZ1jW1z30Tm;
	Thu, 12 Dec 2024 10:28:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959686;
	cv=none; b=XNRIN4/Ub3NYGNytKbRERjPUyIJBBAlFFVEfGUI+0q7FiJ6Z5LN1TFPQtCP1VN4lcAmeHa8O99Lcl8Ku7a0Jv9CtELmkAQpOmMjSFuQjqlcL3g0UKfkDW6vXgionRH6xo3/mK/T3EyZsKsd/WPoNn5i3id/7qAASmv6MdS39GBfcvPrSNArr7f588+3blJMbYyzgwd8K+eu0RW5VTi7urXyYhmER3LQOf/iaWtyCT2sVR6uaGlqyHx0tvCkfKtd+9MwrSjCvnADsWpFbahFRHMZuZJ/2WFkLGHj1IJwKLR1BmdqxANdF/K93t+GLLfwsr1V5VIwYEZ9HWsyv+8+ZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959686; c=relaxed/relaxed;
	bh=t+2SZZ0hfvfE1wB/PVG8ptvYr9aJVJPmVtSy9l3KX7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GsUiS/gczluDsQHwrr3DH8ts6VqPOylx+q5fVcC/941TvWKpXktl4qS57TF0TVewxWriMh8DLx2SfBTwe19Xj9Pqt9py8Zdtd7stVM4vB+ySI09wFv7GyFfNbvCkuWUku5i2Bdi1aFI3jQbW9VjsJhGKSARUIvy6JAEkWbfgopiLM/yoo6mA4rEhFwK9O/m1GaPIHVz+PwI6bpKG0InUrMhK5jkmnABn6Bkv5PVEseSvQ0OHiqMFJYLTW5w3yBu7XMniUsWnloocre6q9jku7Yr5nHtulB6E18p4qdG1mAYEjKuPZlz9Yn1e9LB/z3v8CQ1ARQg4au+4GwjrVjG5ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=t8THSRZ9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3aybazwskdowyozsgvgwbuvuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=t8THSRZ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3aybazwskdowyozsgvgwbuvuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGY2RDbz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:05 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7c6b192a39bso34115a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959684; x=1734564484; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+2SZZ0hfvfE1wB/PVG8ptvYr9aJVJPmVtSy9l3KX7E=;
        b=t8THSRZ9gEYT46x+0Xls7oWPmeXmorEzMe8vKaCnwsupCMb9LZqvPQxEyUOU4BP0EA
         XXMmCgBW4CyMCKmTS8exXy0AQTIA/0ci1kMd4VUTZnA6MwdJGwmEjYf/IamPmQLcUBBJ
         R8QiEm8HfO++fxz6P4XyCLq34EzZshgTye1AW30B+NBoyn8pjkB47EvLuY9pSo4g6lyo
         Uaqs96triFIvmaj4N7tMiSXInhMrbmIdt0TBEfpIN/1vCBdJn4NHg87yLW85M5sRIfTy
         KhjpyN708slMwBz9rPUVrGJypQ52J062QQ4qnmNGPkR0+PjCnpaceymRIrKO76g/hQnp
         YUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959684; x=1734564484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+2SZZ0hfvfE1wB/PVG8ptvYr9aJVJPmVtSy9l3KX7E=;
        b=GjE0CjnSILgJrTovcNOLTEDR8Xw+AcxUdYh014Car8/UBYaUNmgZEFUmmh0SSXHywo
         5e+1zAp1NNH7/mZGAYEEDzQjcY3zpbsrfFDLQWGDBh9veu5f2QrH9PrSJicv0FFpq7z4
         kWvwsTevpW8Oyg7zYM6QOuCCg9maQEcWjZeJUb0and5gNAu8YIiIbK5Qr4T5EB+LzQlj
         09VBiM6vxKbQC6gPZy0Q+bnEosnHIc5/0p2QM26bVBpbxbX7GNBm0Bixj5G4zp4jBimk
         KPquHsUigIPGTwWeKoNfp4KXnyvLJBfvgIF7CznU+S0RbNQ9PDy9qGDfxY5bce8Mj6Hh
         Ah3A==
X-Forwarded-Encrypted: i=1; AJvYcCXMtPRtewPj/PB56m3aCsann4hA2pvGRCl2XkZdX4D9kCO1+bcIToXknl6glnZVVEq08KM8JYoVpsWyxOo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwimMVj9nh94wnzB4RNTJKsL8XHdwvKfjr0m0iKqoTPFjAJGtW4
	Hc3v7d1fUZ2Fp1FBYln+rP7ykwUybwA4DbcNUj/TqtHdrKaOkSkXThfAtT/L9Db/wCwMpl7EcPm
	iMfoiz2rmPf2wb6HiNQJ0MA==
X-Google-Smtp-Source: AGHT+IE/Z/5jS7mczW6P1buMx2K0ifA2tKb3E5Z4r/r+p5Ssl9msAfOzZLWtpmRsmVcD4OTpdOSyZZHLgcfY4EVEyg==
X-Received: from pfxa22.prod.google.com ([2002:a05:6a00:1d16:b0:725:db2d:370e])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43ac:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e1ceb34d58mr1526584637.24.1733959683818;
 Wed, 11 Dec 2024 15:28:03 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:41 -0800
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
Message-ID: <20241211232754.1583023-4-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 03/16] mm: arm: Introduce arch_mmap_hint()
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

Introduce arm arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/arm/include/asm/pgtable.h |   1 +
 arch/arm/mm/mmap.c             | 107 ++++++++++++++-------------------
 2 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..1433b3ff4caa 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -330,6 +330,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c26d5..15e7e4348af7 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -17,6 +17,41 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
+
+	/* requested length too big for entire address space */
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (aliasing && flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
+
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -32,42 +67,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_align = 0;
-	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	if (aliasing)
-		do_align = filp || (flags & MAP_SHARED);
-
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (aliasing && flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
 
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -82,42 +90,17 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		        const unsigned long len, const unsigned long pgoff,
 		        const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	int do_align = 0;
-	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
+	bool aliasing = cache_is_vipt_aliasing();
+	bool do_align;
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	if (aliasing)
-		do_align = filp || (flags & MAP_SHARED);
-
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED) {
-		if (aliasing && flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
 
-	/* requesting a specific address */
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_align = aliasing && (filp || (flags & MAP_SHARED));
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


