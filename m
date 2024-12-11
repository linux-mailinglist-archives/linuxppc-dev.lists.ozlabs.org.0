Return-Path: <linuxppc-dev+bounces-4008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 957319EDB35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGY5Rq0z30TN;
	Thu, 12 Dec 2024 10:28:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959685;
	cv=none; b=bqMnR7m9WkB1lKHF0vd7WusSAkFxV5PxO9tqFyVISLkxH4eF5YcPwGtyifOyBGhFALZ5olK9+GjN6ODgz3I0gi2n43x8p+UhTWH0/7xQs5xsu5ZT2D1hcpcQbwWe8XVGZDVrSJwryqV9hP3Q4maUdkrUsjNxQyPwrwbst+99kiihE1wYvrCqYWmtAa/1AYJnbzCZcYfgscMPtKbqRSzHiguCLqCXkqOb7ZIHQUP2P5xrZP0pYQHZzZFQgmGsYL5hqqgfcCblXGldX+lukgPfhUpfTrYERkcZgGQuH6FTlbod6MXkrvc7JiTSyCWiBxqLKmWdZwsNHdpMbbPI2dNr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959685; c=relaxed/relaxed;
	bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Si+Z9j1Y8lswZWvxzgCyk68R14HnZHxlJWE9TvPkm6ZUUQpax4FzBkpSFAzKy7ijNG7M4SMKLOHRXKMBF6A8uQRfPT/aU1nA44fCQHzzJiPdoUjYDRrjpu/1NmSjulMyYTtrIxHNvr0TjseCVXVTayCN7d92yC11De391IAhviBCoI0PNi1aBi17weTPVUDLkKsWxT6aybD68C5zEWn+AKR8NpZGVLQ5HAxWNVRvw4s1ikJdfoky+XFOS62preG3oeexF+i62HOhOduDk7XbQcvrfEiYsf/+zfDkbcRpAUh9OmzvhqQc8+ZQFGrcr5+fD09yWZd63vRMRHQI2aqmHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RKsJ/O/j; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3asbazwskdoowmxqeteuzstsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RKsJ/O/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3asbazwskdoowmxqeteuzstsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGX5SBlz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:04 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728cd4fd607so26524b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959682; x=1734564482; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=RKsJ/O/jaaeUlfJWJzr4k9gAa/4G1L5da/8XRTChr1cQOCgmIgkubhCeNIhNFa0LQz
         OZXwWaP+avMme/AuF9Rv6pMSHF9LDckVqsctmxYOPTveEjjOjeqnUgwZPhbBfUjPoHbl
         Zx1QEFFYaF4uIZRXpxgObV948saiiRAVXG4ucCQ1Nxum/9+YNnkqCBo/lLpcw9V0oSyk
         db3Wz6IEnt/r7KlogNnxVN05RzN2ZuYH6nwBIe8DHCywPgVh9L7maMmJuxoWSlm1fVRV
         hrzo3+yx9nj7LWJo8Q22Z0PRMP82IbTRQbBLVddgEDwbk7w1fGFYbvhlKqBCs1QrH/u2
         Z4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959682; x=1734564482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=eYZC3bV+mSvYOuNKezwNxL2Jk8c0lAEXOE+N9SY7NCUZYSH/FlSJmGCGtgQLIM/j0Y
         me/Q63zLYn/18p8BOLH3X0M/1HXKnmZKZjFg9yD7YyAf0Qw5715jmI//A2VQMtwjqevO
         Y4iN+vws3OkgnA7fZahPhvNkJvRChq/GwAooHo0a9Mm7IcXqKs8px+8ie8ijzyITRo0J
         kvvnKmY66k54HdKdhUaIAp3882okqEUZe+QVuldTyQJQGzu7bD2Akv5lq449rN7VqMOI
         ui+vX1D4EedWgUzz5nY2DiZx9lTRngfKaM2DgzwB9vtPjpvsaoyY/zY/Nwg0hJ42aYVk
         /xiw==
X-Forwarded-Encrypted: i=1; AJvYcCXfz2WS+iFKdyYMuBdZoLf85HrMQUKyMpi1MSHnXB8E0x9Xs4uumsNjB21ihgc138S+FqYlMfXidLTg+mM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgMQYC+HU5kZ4SbhDxTRFmh/R6WELr3pcqxjkENb+bJIsnXSw3
	hDfp8NDpu+sXiBRsDx/AAslazs67474ZutRMYEUUtSgs8wdxxc6k1AxOXiznjbN8R9rL7DFh61N
	3R2Km2pcNd7/3euAcfb892w==
X-Google-Smtp-Source: AGHT+IHwoWCnSZAFhgfRGzh0vJKMetndx4pRL/iGA/i3q5lPp5GtpRRmcU9xCr75DNYXJvBdH8Wl1Hh5YkFK8klCiw==
X-Received: from pge13.prod.google.com ([2002:a05:6a02:2d0d:b0:801:9432:2d6d])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cf83:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1e1ceafb16amr1741157637.21.1733959681795;
 Wed, 11 Dec 2024 15:28:01 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:40 -0800
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
Message-ID: <20241211232754.1583023-3-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 02/16] mm: x86: Introduce arch_mmap_hint()
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

Introduce x86 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Fallback to generic_mmap_hint() if an architecture doesn't
provide HAVE_ARCH_MMAP_HINT.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Fallback to generic_mmap_hint() if arch_mmap_hint() is not provided.

 arch/x86/include/asm/pgtable_64.h |  1 +
 arch/x86/kernel/sys_x86_64.c      | 64 +++++++++++++++----------------
 include/linux/sched/mm.h          |  5 +++
 mm/mmap.c                         |  9 +++++
 4 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index d1426b64c1b9..4472fd0040c3 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -245,6 +245,7 @@ extern void cleanup_highmap(void);
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define PAGE_AGP    PAGE_KERNEL_NOCACHE
 #define HAVE_PAGE_AGP 1
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 776ae6fa7f2d..008c6d19bd02 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -123,31 +123,44 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long begin, end;
+
+	find_start_end(addr, flags, &begin, &end);
+
+	/* requested length too big for entire address space */
+	if (len > end || len > TASK_SIZE)
+		return -ENOMEM;
+
+	/* No address checking. See comment at mmap_address_hint_valid() */
+	if (flags & MAP_FIXED)
+		return addr;
+
+	addr = PAGE_ALIGN(addr);
+
+	/* Fallback to VA space search? */
+	if (!mmap_address_hint_valid(addr, len))
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
-	if (flags & MAP_FIXED)
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
 	find_start_end(addr, flags, &begin, &end);
 
-	if (len > end)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (end - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = begin;
 	info.high_limit = end;
@@ -168,34 +181,17 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
-	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
 
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	/* No address checking. See comment at mmap_address_hint_valid() */
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* for MAP_32BIT mappings we force the legacy mmap base */
 	if (!in_32bit_syscall() && (flags & MAP_32BIT))
 		goto bottomup;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr &= PAGE_MASK;
-		if (!mmap_address_hint_valid(addr, len))
-			goto get_unmapped_area;
-
-		vma = find_vma(mm, addr);
-		if (!vma || addr + len <= vm_start_gap(vma))
-			return addr;
-	}
-get_unmapped_area:
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index edeec19d1708..f4143703f234 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -205,6 +205,11 @@ unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
 				unsigned long len, unsigned long pgoff,
 				unsigned long flags);
 
+/* See generic_mmap_hint() */
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index 382b4eac5406..76dd6acdf051 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -705,6 +705,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+				      unsigned long len, unsigned long pgoff,
+				      unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


