Return-Path: <linuxppc-dev+bounces-4017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42C9EDB63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGt3Y1Mz30Wh;
	Thu, 12 Dec 2024 10:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959702;
	cv=none; b=jtR+7YVlfhXjlpDxEifx9EPXe9l3nabc7Yw+5HWRl5z+qc9luGybH7zvTRI544r5T68obbSXBCr6LSh6urbVP1z2aEFil3mEKpjfwyC5qEcGH0ZGSGQzabWg5vQBpNf3l0VjIlYHwOFAZXzDwrhZUvF/bM5B2pQtvD3vKtfk1T9Rmk/eZqOvxo/aNJkTizwbSXf6d2bNNBulVcHKN7Emi+EgmMwtEV1kPFMPtUSiGzTYz/hODmDgXBZVPBka2yW5v7fExy3CdVQY/rBeZIQY89UMWZhAUDa2nuT8nbdHA6ZIrNfqTvsR7B/GKMtlr9W/RpB5188SQFngPHZfP/Aubg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959702; c=relaxed/relaxed;
	bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V7dEihRBtQRrUEd4QEl/Le0i/giQeMKSASwC4JkzLOckVaS4qOPZYvWLJqiLHx0EA0GpDfA6w/kVDkX4jZ3GBjbQ5BabM5ZWGC5LsLLf2lFF540x4llh1Rr8MChgyhS7MhE/2byh4YTHbRGa7HqpLZ87Yap5wxGhuLbiMTGm7mG1ALOG+1XEUjzta+i8JkNZfWRmTMn5Oq1mIN5+ZmaelgyUQVLve0iCaxInWBwtANtzAe0aE3Uzt7HjN5egrRZAL5Xvkp2Hm4KvJJ2mi+nr4iQBqwNZ75B2rYpGgI97qdc4xXwPaEQYbR5yXlMI71HeQDucXlH62I4g4YQzzrLTRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vL7P4kec; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3eybazwskdpwoepiwlwmrklksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vL7P4kec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3eybazwskdpwoepiwlwmrklksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGs4Xy8z30WL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:21 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2163dc0f5dbso34891995ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959699; x=1734564499; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=vL7P4kechnSW6j6a2cmFHcOCz32Uf8gIuCBEu+dQzDIr13HZYihjI5jqRL1vYUBJKb
         r6U8vxroBHN6zWo+5qrlcHamhni5XtzEd8JSFjII/7gpRtFT4Hz0UNZ8uvdCRt1Zyul8
         maF9GMBAzaX9vc1ETllbddsQ2EsEdeJtVjCBcZF6GSgtmclgOlK64/rxSUhx8xmOB8gU
         2XC+RHe7T4ZIlvhQ4s47mCNUM3buAZn357lRRtLBSg0qxruf6XFiUTH3TVTv3NHbFnrl
         Gq3uD06/B9xmEhLy8rlDX/PAd+aOOgpLIS2yg1Wtl0g8UOdwDjrq+7udS0M4T5RXs/ix
         ZlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959699; x=1734564499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=CQM8d9sUlMm5JvDAYPakAF0G7hsHq4R3Kk45Gm3hnSOQ0v9r1Ogk4UADGMDfnTwSI7
         IG1UQiOSs87Ljvg1lSvzC/AeQGtrFvf/+ovk9s/hhHsenLSEGwcVHpZnuSGzTo1piGUR
         tlvDzP1oc7EhVeKM3YeDzvVeJQoLwP9SzFklQ58Aw2l7R0nXFDRu3K7M6Crzr2f9Maz8
         hP7aByEyBOk7k+wIX+nfVKL3gd46S81a8l0c4CZx0/85+KGgow6nxy9+1fC/IEgGpPnA
         Vfw1/WTkZ++W3RlmQpjsR1sRRf8rAI0pCv2FYFuVwKGlIE7ZrHIsY+s1M6jFxj3HrCUq
         hG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWN/yoDhLg/4HHHUa2K5O2NORWrVYVPBDr1eTqkTz8zehpBeQde4gfr+3cx+DYqDEqzAUlu7uCKlg1SnaU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNrgmtXKD6vvr2u78tWRnUrIlII0ju3n5N0Ezz97tnN+AguXUl
	YgqIgEZP1Gf+6xbJSx03wp/kTmxImfdMH2+qG4PMNwXQ21bGYH6u3hjnocqIfTc3QVwOo+0OZWG
	x5JK3LhmVzWi6voGDD2qEzA==
X-Google-Smtp-Source: AGHT+IH7t7zoi6yI0PaPMLOJjSIpLoHx+Um10nYrD7SAuARxjRKOSw8DIf3dxsqs6hFZHoDsSpm8PlX4hDRCbsA6SQ==
X-Received: from pgbcr9.prod.google.com ([2002:a05:6a02:4109:b0:7fd:4e21:2f5a])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d590:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21778505a3cmr82109795ad.36.1733959699175;
 Wed, 11 Dec 2024 15:28:19 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:49 -0800
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
Message-ID: <20241211232754.1583023-12-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 11/16] mm: sh: Introduce arch_mmap_hint()
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

Introduce sh arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sh/include/asm/pgtable.h |  1 +
 arch/sh/mm/mmap.c             | 83 ++++++++++++++---------------------
 2 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 729f5c6225fb..072dbe038808 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -149,5 +149,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 /* arch/sh/mm/mmap.c */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index c442734d9b0c..ebda962e8c4e 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -51,14 +51,14 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
 	return base + off;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-	unsigned long len, unsigned long pgoff, unsigned long flags,
-	vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_colour_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	if (unlikely(len > TASK_SIZE))
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -70,24 +70,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
+	do_colour_align = filp || (flags & MAP_SHARED);
 
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
+	if (do_colour_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -102,41 +107,17 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	int do_colour_align;
 	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
 
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if ((flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
-			return -EINVAL;
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
-
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
-
-	/* requesting a specific address */
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


