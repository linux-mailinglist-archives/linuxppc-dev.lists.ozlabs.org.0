Return-Path: <linuxppc-dev+bounces-3889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77649EA587
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfw1c8Hz2ywR;
	Tue, 10 Dec 2024 13:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798504;
	cv=none; b=lf/uZXiI7C4+k3ZgzipHJ+DNbZ8+4XnkPQw/PqdaQQTd08eQbW/P7zujQ6VwrYB+tetIXGS6B/haMk/v7oDktpY6coNpa4nMPoSsiVgonXdgyE9nXaOzaJtKS24ePlQiPH1fZ9mfpZBaV5r1ATfFbm6P6458V9BaC/WewPoqPO2gD2Nd/0wpErB8N+lnvtfhlRNB7oMWqFdvpHJZ7MFZE6TN3gIxgnPghN2XC9Hcm0Uer60QKl+Cl/MSNPE9VgX2yUJ7v0vH7B33wYvfLOl41TKSZBwlF9SKXvIAxtQfKCc5n4Ie2PlWIFu1mNU5B4X2ojkW+ebJbqQ429n1XWiUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798504; c=relaxed/relaxed;
	bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WQcAP9GoIHsViL1af8YQrIi1hgp2fX8hmn+avGiiqxGPoXMs7U7Onj+tS4sg0PlhdD1c5r9it7bJVi93Xy6L5hRZMsRB0dlHb1YJXTEOr1lB8glPO722k/XQ5qrH1LmTtFuFYaMRTSshc9l6Rwwvb4wUkSpVYg+koBWwf4wU9vn5Cx6GKE8Nm2C9DvJCfCE2IzxjVHo30MUhl0OazHsji+ex93jAVR9m9cJgYp7gXwBoaxcc5wUw5vz94gwMoXBhB+o7ZNWqrTUNhYtJudusjriFttFUb96dJH8XelzRQJ1HmnmvgxIJ5au4IfA4s7cyz+39O2q1k7Np3NrP9Z/0lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1pgnrw25; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3zapxzwskdfoc2d6k9kaf898gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1pgnrw25;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3zapxzwskdfoc2d6k9kaf898gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfv2Bh4z2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:43 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so4531042a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798502; x=1734403302; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=1pgnrw25NUGAGOtUm2pyfEJC+2KCgVNiShv5ITbgRO/yF/+iDrNWvfKtYNk0VIotQ8
         8CdtF+ZdmHNCnzzGKVxLUegMVb8/tSf0ymlOtJBfxpOtWY6Iyfu91IBf3/AdJ4vbIuMc
         87SyyAASQMJ4S6j0Gp/9dfhz63FPj0SI2Sc2zOaHpAXvS/cn+iJq1LfQbUCyTECaekyZ
         j/24da5aJTllWCiOLHriNnVBML+Z14UKR/fvoybIowHJcTb+y7K4+MNVORWGfoWCP02m
         3dTIwZWz8j+TiwJhirCTeGjFm3A2ZvAL6Gl7unYxn0NtGLgGHdjEjq3dJWa1IR+CFTCy
         +eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798502; x=1734403302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=X797T0zYrxX4UL4U96HQ9SEV9U0xG5mt3BCCNAYN1d25thM3bJecRfsqOxFn+V7NWw
         gztOxJpGjbjuUgQiBglKTjwi8RHMmy52gCh3rporZDN4eKEUDGhq3BPlhBVRxhDgS7No
         Lmhc1ZMgYQbH7FTFZjBN1gVBRM9DtUSVRS59o9SnM/GG0GF1K/lSDBEC1xTncdS741fK
         V33CUGSE5Yiu0udIZS0YSzy3sRFo3m4L/HquXPoLfEWHBfOJB9Qfeq0vEN4xFbEeVV+x
         bb2Iggz6qsseGW0oRyU39NK5NBkY1QpzyKoFJIhBKTocZpVBch8eotj73l5XkTyd5W3f
         sppA==
X-Forwarded-Encrypted: i=1; AJvYcCXVL+YHFpUPsf33b3QTN6MhrfpuFfAQHx5kBjswX8rHza6JkR69VESPsDLvrY7htiRs3w1q5Ej6Y759SvA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3hEUtAkWh+U24h6BOOg7fXZDRaexdEFuJs3GU1ksBElvI8qBO
	oAMDkVazml6hpe7DaDmUgK7VV/o/I1U5ddbJdfMQNUhUgsSQ4Iozi6rr9Xk/Ec44tzSAbLyZzSI
	L2UTCwHsotROn8O55xiI+dQ==
X-Google-Smtp-Source: AGHT+IHGYo+0xZ93dmqZHCUo2fH2lASnlYW3/982jLUqUj3uy5rS3NmT8SEwDvEmCBiRAIKAMZxd1Te/85r8WkWevA==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:2ea:3a1b:f493])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a91:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2efcf127449mr4419672a91.10.1733798501710;
 Mon, 09 Dec 2024 18:41:41 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:12 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
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
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 10/17] mm: s390: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..3f82401b77cd 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,12 +83,21 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE - mmap_min_addr)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	if (len > TASK_SIZE - mmap_min_addr)
@@ -97,13 +106,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -123,7 +128,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
@@ -135,13 +139,9 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		goto check_asce_limit;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


