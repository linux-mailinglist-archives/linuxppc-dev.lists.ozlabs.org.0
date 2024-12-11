Return-Path: <linuxppc-dev+bounces-4011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD89EDB44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGd64CDz30VR;
	Thu, 12 Dec 2024 10:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959689;
	cv=none; b=gDQ/SCw9KzN3kxDy2wf41z75sjH3ePReGQvJmuPiWhxYB0uKojE02zxKHdo0mpFMyZoReNzXIHTu8L8SxyOj5DVPVebphNx9LbFsXvEE9t9Oz1SpX0O1dUJhfSJ4M7O/GN+EkrE4jVHLg4OZ7RzeqgsinCEtCjCC8QXt4+t5PdRdUJs6rfKeVgitVV2ho5dIhY1aT9R1fZKhCOemxJs073oGKi5yDkRzOAgbcYWmYN1/gmAQCnwACvb/4M8+XhqIj1SbUmuQD/dOuhxawnLq18lk4zb8kVWSrYNd9/Hd3+RJdpq257FMMKEUdOqX/FMkdAfVhy7D2DrSRcTSqZQgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959689; c=relaxed/relaxed;
	bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NDSBML87JT+UTfQQQUNwsD3Zn7DmIFY7tJn+fJpa3SL5vWkWueaik5bxbSzWN5ZUiL2r0G0cTj6vscQJ6IcQrG4svia7cAcpNKGLq1UEnxXNJvrRbn2QoHdS0BS4uVdJL7uSQtEVpCUerntvX2uvyk9RKQPXFBELgCFcCO2idjNuOJwOt2xVLI00d9/ojTn7X19l9yNKE87/ZgjlY6LuNp+E5f4KRbltI9E1mJaeVBW87a5nQvFcAkYyLy5uP1QntQTHiRMsG6y81QeGoEK4//Lf0+3spw0fc2jIJH+lHN5CtHovVeasClV10MTCsphvlvh/ZlvKs+XYP3XVEX4jRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RYyEU/SB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3bybazwskdpacsdwkzkafyzyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RYyEU/SB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3bybazwskdpacsdwkzkafyzyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGd1GNdz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:09 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728e7c06768so19694b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959687; x=1734564487; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=RYyEU/SBxCSjxIvb1TFKuOPzHcCYSrFsKqyUE5hMvByA7qxwjGNN8VpNL6Fjj47eYH
         qRZ2kCjMKyyyGLGzt2EB9M9NWuTg6D6lVYSWGXXQ9Lr4Ed63SH/QiwxrBoNB+HLEK4q/
         WXB3ypGuPx6YN5AioZ48YgwsLx7PgnqDgpzyd5tcv19g1VQ0d+i0qsObzdMxLTgvW2A7
         U2L1SGH7JmQQZxpWwFPPOGkPa+k+051hcSQTh+6dDLhwmF/lA5kZS8Qdo94llwEBMw2q
         yq6jvl2b/TPW5bLDdsrjoPbYR9J7q5XL++nPoC4HPK87bQt7HOsrnIaeZ5EfhwiwZeHi
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959687; x=1734564487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=THCs0En1e97rcPffGOesNloGch2MSqrjqKcpxWLag/vdEaA9rBR4/nY9rrvq72wd92
         F0Jwm2oD2S5/hr8+L+4NyfMHxZX8Lo9vnkR47I//qMTXDfqwfQbNiuzLnlJb9c0d1Vmk
         SY2ai9l1u9V7pMCLqtwMx/4naW+NHZNKtayuSXDkEPSTw4Oq50rmEMHS3vhw6hKg5pOL
         nRsNSUd0mk0EX/kBI06Ppe2lHX43c0JTCPPaNTeuLch1X1hPsseR4QOwC53XbUCVEYKt
         bUk7OwvvsmJnT7+urrpbnt7SmBe07eXBxMr5j2shWUJCFnCHtSFXjUjWLZWo8aer5Kbr
         dsRA==
X-Forwarded-Encrypted: i=1; AJvYcCVRbHQe8bRabusMUIJUFtiax1qZf6KnFRZpNZfB7GZjOIAV95S9g6xS0I3lnhyxe1etVFrOsvhAmRwl+7M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypR1Q5LFOi01PjZaXlBOALACn5JfCw1TTImyY+TI9dBy6v/v9n
	dD8WUqieKgX1Z7lkoZk2M3i1HcMrmzv0OJAtkX6Y4BKRDsX48eHrXHD9lVCsSoYngPNnrkcasbL
	yUvawjceEl//69OpeKVZtlQ==
X-Google-Smtp-Source: AGHT+IE2HKYkuc89mtKU0bTUEVS1IdL7Se1Uvka0+Ku7HObHaGYamVyFYxuD0miLaBxiy9U265ART8wkxAXV/hrgFQ==
X-Received: from pgbct5.prod.google.com ([2002:a05:6a02:2105:b0:7fd:356a:ef35])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7288:b0:1e0:d848:9e83 with SMTP id adf61e73a8af0-1e1ceb1006dmr1536938637.25.1733959687513;
 Wed, 11 Dec 2024 15:28:07 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:43 -0800
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
Message-ID: <20241211232754.1583023-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 05/16] mm: arc: Use generic_mmap_hint()
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

Introduce arc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/arc/include/asm/pgtable.h |  1 +
 arch/arc/mm/mmap.c             | 43 +++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 4cf45a99fd79..af3210ea4888 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -28,6 +28,7 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 
 /* to cope with aliasing VIPT cache */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..df01d4d9964b 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -14,6 +14,26 @@
 
 #include <asm/cacheflush.h>
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * Ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.
@@ -27,30 +47,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


