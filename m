Return-Path: <linuxppc-dev+bounces-4018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9869EDB68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGv0gChz30WL;
	Thu, 12 Dec 2024 10:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959703;
	cv=none; b=AEZJ88fgRF5D7g67270Lx19vwlKArcsKrlwR3rf6Si5emNXaPh6fangHXv5T10LbjrKrGhewNASCjBH+WRZyGh1tYb6AoFs9OFa7i/GBqkA54NNMnWnXloly7sWUoxKG2BIbsvTn4ei73YqsluO6vi3f2O31HEKQehleiozj8FVaFP6IjEvbeSlVet4kgp+tyRZoRsGle4pQ8khqRufnzFFtFwD16YA3sm4I+Y77kb8vwzrDmG9A2CxBDEv4y6pO7+7lOFfp6h8IcYdy5nkORIydUXLELVetncxuiF11IKZNxPwuzLVNhDhbLXTWlunKXDcc/f/+NRzLySwRZlhOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959703; c=relaxed/relaxed;
	bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CUnAsG3MwPVxxSAkhaEnKWtbs1OlWHC+V5+7AFoS1fBBTRUTdVN6zDS83kMCQ19vmB3g+uwq68cBN6PnVHJ3o3kDmNBE2Ch+N50bMHSPsdCWMevWrNiyt4ra7/YvkR0Je3KnxEwN7Gtz+A6yl7rJ+OOI9ym6iSYqy/i2SXgrdOVAVaYm4Y0UlJte/Mp5NRDDmHAMiRsS3SO0ALnkAF7jNubymQ0+NfsTg/2oP2RqG2Ybl62oUJbSbeeC7SsvSQImsb8VoyOCnu4mvH77OTDq1yLigoXmT/mNg7T9VuJBHYQuiHvPy7p7+NbN+prLp/R2m6IG8BiPX4uJUlulUq3ZLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n4pHEmT0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3fcbazwskdp0pfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n4pHEmT0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3fcbazwskdp0pfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGt2m2rz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:22 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728e4e30163so19462b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959701; x=1734564501; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=n4pHEmT0DQpmvsI6F4mBOZb3PZlkCjhzv3Grs8eYt5G2r1xgLPckGYw7Zvbd2zh0ho
         0hmcdLBSnjqY1vj9iyj/XcuRJVYvsKuvoCnPld4dfd3A7j2FDscupk7Rk4l4p7YUKkSL
         FaMIx2P2Uqpl1PZQzDyQQNGQXrlIR8C8AAVSaebQCgKBE//x1lSniySIgTQnd8x0vCPo
         QAzZ17akOI46XhyhjCbl6FoU90XZ4MSSEEVRtlakfzTMV7douwoYtBoaF06/VQfN/HbT
         FFPfUrcMxT6YqIqk9HRa+DHUfsiV6N7Pzh9TseUHKMKJmX1u3pCtJzKH3ifS+jkZrlq7
         ESOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959701; x=1734564501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=YTvg2819xnNo88ms3GBpoBHetNvHsb9tlCBPh5AexgOsZe1fAI4SnklZAdjQUh1HI0
         es4xtvcwebCosOlh4Da02XjUwO2Js2WmJ72RpIBiOKTg0LgfAEkh/gMfrHoknak99MhX
         mRQWPmMD9d7DUtcZWsRW6Q0PWjcwqUP0T0T9HBQnaurjJI4P2r9mMP2AiMFraNIRptNX
         NXqd16sXkXRir6Zs1rCWFCKRQMmWJllpZdRxEp2R1kLVNHlKvPsJFqqHW1Ml3PK2I3yD
         1axl9z9Jes5HYP1uZg4b6Aa8jdfTh04hEChmLfhdwoPLwRBc/K2FYVbkjyu2xuaapc8r
         AXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWCIcmzSKgOQ3aIHukln8ZoCu3iBJCSJyKOmqfL+Y2dJ431o9r3hC77Y0qbpyM+qEyh5dULDhSq7Y8e2L0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxHtved0i4TnJXeq1NWX1c9PmaD3XeTPwfMFAT+YK2KwujdC49m
	NxzpzXaDGC20SD33SLmevX1u3+TIzjggUrVnsInX0kz0HdP6k+OL56ciE/C9QMchwm+i+Nz2X7E
	OnhOYxybak0l2F7Yh6T6lEQ==
X-Google-Smtp-Source: AGHT+IFqVvEP6jzHMp67taGtKGZyTqxXNFEg2GPfnpgGUKbuvSmZTqL3vNpWjeuOs0OQEe1804BSml5OhCqqS6mIfw==
X-Received: from pfbdw6.prod.google.com ([2002:a05:6a00:3686:b0:725:d2c1:3f5f])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43ac:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e1ceb34d58mr1527638637.24.1733959700835;
 Wed, 11 Dec 2024 15:28:20 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:50 -0800
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
Message-ID: <20241211232754.1583023-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 12/16] mm: sparc32: Introduce arch_mmap_hint()
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

Introduce sparc32 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 33 +++++++++++++++++++----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..95084c4d0b01 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -437,6 +437,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd)	((pgtable_t)__pmd_page(pmd))
 
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..0cc717755417 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,13 +40,17 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
+
+	/* See asm-sparc/uaccess.h */
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return -ENOMEM;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -58,14 +62,21 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	/* See asm-sparc/uaccess.h */
-	if (len > TASK_SIZE - PAGE_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool file_hugepage = false;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
-	info.low_limit = addr;
+	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
 		info.align_mask = (flags & MAP_SHARED) ?
-- 
2.47.0.338.g60cca15819-goog


