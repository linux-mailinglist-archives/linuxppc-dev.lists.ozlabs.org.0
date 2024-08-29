Return-Path: <linuxppc-dev+bounces-723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181E963C6E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXdN11F4z2ysZ;
	Thu, 29 Aug 2024 17:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724915784;
	cv=none; b=WnFeqU9wIZ/cUEy9nwXkpJIYNjrY28iwER5gdKRgCvyLy7H+HtbI6TfCKL2imiX0kqnMwpAn0aefkAjNXgmifn43Xfa0s7OkajP6HzgN5iDSTIU+wNkF7DaLj7v1i75RZsluRs2D2XYT32csDzhTcHagU1uQAGDgNzl5NqAq7pOlJEQBb8A4mu7eoamQsf/0wkTBljH23Af89jvt9Xm2jSIbpWW8T/Xox9Yat7PPcs0T07MkI8+TQh8CO44u8vnohsJku5rFQmzse9VX4zFormHDT7jF30BAbcI3cKT6694iYVTWznvvDDxRDC1nnqKASImJ4uw4C1KzkQ+HuiJ8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724915784; c=relaxed/relaxed;
	bh=Sbwm6yYi8fii0SQTFAzAiKdXxaRuHZnv4HbMCIc+vRk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=iaX6m6VVmtmLXP9pL2QF+rgW7Ecd3BgyaLEB1S3pXUuqrd1lUx0upPh81qv6isHT2McmihAEwYLqxOkj663nzn4wgjhBIRimRo5mcs1T34NWnxu4o7movlx6BP7fEwQr9da7AWZAd6bfmBLalKUMQ6cn3WX81VHO4ZeN0l5u13klYmoGZb9rrylFtuvS7+b4zZBXUhamE9wm4TnyBGFdjaFfV5ge+6uqzPe5w0+Woh0Z953KM6skY5gpkGHXvB1mAEME4aF/IfGihTxVrpOEOTmfrN1Wze9/73YzGsi+X+UKdX4QZarCliP1uQhQ2r9nzUBnDo+D1K/CybYgjODzwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vwAIcCQ/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vwAIcCQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXdM3yF6z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:16:23 +1000 (AEST)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-829e3fbcb87so16714139f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915780; x=1725520580; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbwm6yYi8fii0SQTFAzAiKdXxaRuHZnv4HbMCIc+vRk=;
        b=vwAIcCQ/hqT2BVItwIbMj9MiTiXwLDOzkXpp73BMfuy5DqCglxGWAgbahx1aJ4K5yN
         OxIj5KfWKyiZFDhjZtNC8W4SbYTusdxkQ99i+gMaFgu2mujDMtgF73bFCVGwADDQo0YY
         wxGfjXrT2R1sbmH/U/uAE7KHgR6MAZTDB/JXcfEEM8plEj5g1EozzgWuPGvhoQ1KehOp
         W1ao1Tjt7QWz28ccasJ1Zg6xrgyOGNlZ6FRM+7RmbeAJ+58eyxU/Yk04Sl1SLETHVJRg
         DR9yU4D6WClQk+FJUFjvETmQgUpRsn9poU0TNgB8Vt/AGJ4DrogSC3oByCfiFkerbLp/
         DqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915780; x=1725520580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sbwm6yYi8fii0SQTFAzAiKdXxaRuHZnv4HbMCIc+vRk=;
        b=W7pmtFglQQBYf3VzDZh+E8jRtBJ0/rarV0/Mr/gI83QPmXleF8OADcdt0/nbnos0rA
         pdWWPca82GIb5VjYfx0ZAoxvd3iOkic0oz3jzHPkmG4eR8oAEq65s3qsYxba6GQD0NkB
         7ljF/JWclSP65uZjLliWYSYqKlCbsrjlAkoG8l2skIBK3bua2WOyd9H3peC1L2MVvJbH
         9tfJfuwvLweo7eSy3ec7D2N1GUMteOtpIE6AZutYw+pE6ezET1xZjCEae1EadtiTUzIW
         keQ4CRSxUmf1LSb/o/HeYANABj4aPRpZs7QJECGbjZ3/GOk0oxUJLEI7VZf49VFKlJBk
         7IpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWneOxleY2V81OHDwYXDoInTnkfm9EsNk27aRuW7RuyqxZaaDCi5rvOGe84m6th/kzwVPq22MrM0J8Gxm8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxljDmr40J6bUj2aspqnxhHCSoh04Ca0uWDdIUGhCBbvuqhJFR
	MvZjtuKfpbuuj3T3jdubdS/0OlicenHxxNavOWFGlFppk69i7Klrzp9y6fku2hs=
X-Google-Smtp-Source: AGHT+IGgPVGnJtoSfqPS27dHBhsP9wE8tGpecq2SA+TpeFejfd/21/ZqZVX0hSOoHcWSmw9m6xWNXw==
X-Received: by 2002:a05:6602:150e:b0:803:c955:eda8 with SMTP id ca18e2360f4ac-82a11010e13mr213412239f.6.1724915779989;
        Thu, 29 Aug 2024 00:16:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:19 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:15:59 -0700
Subject: [PATCH RFC v2 2/4] mm: Add hint and mmap_flags to struct
 vm_unmapped_area_info
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13798; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=cJo+DjHYKAKtcF7uVNq5Hkp7bg1tB/ALtneNIYjVApc=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBYsZBaJsp/MFz8f+MGk86RnpUeMrsf76l5QvfwVzH
 bi3fE/oKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCJhqQx/pZw4Kv/yqWcskTot
 +DC45Z2Xbmt3sqXCfbPzz4uE9X7UMvyPfD0x5fXhZqutguJLblpd/5tsrJGyOK/8zPKTp3N1Txs
 xAQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The hint address and mmap_flags are necessary to determine if
MAP_BELOW_HINT requirements are satisfied.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/alpha/kernel/osf_sys.c      | 2 ++
 arch/arc/mm/mmap.c               | 3 +++
 arch/arm/mm/mmap.c               | 7 +++++++
 arch/csky/abiv1/mmap.c           | 3 +++
 arch/loongarch/mm/mmap.c         | 3 +++
 arch/mips/mm/mmap.c              | 3 +++
 arch/parisc/kernel/sys_parisc.c  | 3 +++
 arch/powerpc/mm/book3s64/slice.c | 7 +++++++
 arch/s390/mm/hugetlbpage.c       | 4 ++++
 arch/s390/mm/mmap.c              | 6 ++++++
 arch/sh/mm/mmap.c                | 6 ++++++
 arch/sparc/kernel/sys_sparc_32.c | 3 +++
 arch/sparc/kernel/sys_sparc_64.c | 6 ++++++
 arch/sparc/mm/hugetlbpage.c      | 4 ++++
 arch/x86/kernel/sys_x86_64.c     | 6 ++++++
 arch/x86/mm/hugetlbpage.c        | 4 ++++
 fs/hugetlbfs/inode.c             | 4 ++++
 include/linux/mm.h               | 2 ++
 mm/mmap.c                        | 6 ++++++
 19 files changed, 82 insertions(+)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index e5f881bc8288..6903700afd12 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1223,6 +1223,8 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 	info.length = len;
 	info.low_limit = addr;
 	info.high_limit = limit;
+	info.hint = addr;
+	info.mmap_flags = flags;
 	return vm_unmapped_area(&info);
 }
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 69a915297155..5922cb51e029 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -29,6 +29,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * We enforce the MAP_FIXED case.
 	 */
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index d65d0e6ed10a..04d9234f049a 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -36,6 +36,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * We only need to do colour alignment if either the I or D
 	 * caches alias.
@@ -56,6 +59,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
+
 	if (addr) {
 		if (do_align)
 			addr = COLOUR_ALIGN(addr, pgoff);
@@ -88,6 +92,9 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * We only need to do colour alignment if either the I or D
 	 * caches alias.
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 7f826331d409..0be4913c6cf3 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -35,6 +35,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		.align_offset = pgoff << PAGE_SHIFT
 	};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * We only need to do colour alignment if either the I or D
 	 * caches alias.
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 889030985135..7d1e8be20519 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -27,6 +27,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
 
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..22e8f9c8eaa0 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -36,6 +36,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
 
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f7722451276e..2ac53f148624 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -108,6 +108,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		.length = len
 	};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
 
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index ef3ce37f1bb3..f0e2550af6d0 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -286,6 +286,10 @@ static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
 		.length = len,
 		.align_mask = PAGE_MASK & ((1ul << pshift) - 1),
 	};
+
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -331,6 +335,9 @@ static unsigned long slice_find_area_topdown(struct mm_struct *mm,
 	};
 	unsigned long min_addr = max(PAGE_SIZE, mmap_min_addr);
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index ded0eff58a19..dc38f7022037 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -254,6 +254,8 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 	info.low_limit = current->mm->mmap_base;
 	info.high_limit = TASK_SIZE;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	return vm_unmapped_area(&info);
 }
 
@@ -270,6 +272,8 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = current->mm->mmap_base;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 206756946589..001345df61b6 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -88,6 +88,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (len > TASK_SIZE - mmap_min_addr)
 		return -ENOMEM;
 
@@ -123,6 +126,9 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE - mmap_min_addr)
 		return -ENOMEM;
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index bee329d4149a..ab1f5613b5e2 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -59,6 +59,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	int do_colour_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
 		 * cache aliasing constraints.
@@ -107,6 +110,9 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	int do_colour_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
 		 * cache aliasing constraints.
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index 08a19727795c..bcc3242e003d 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -43,6 +43,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 {
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
 		 * cache aliasing constraints.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index d9c3b34ca744..05de444d66f6 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -95,6 +95,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
 		 * cache aliasing constraints.
@@ -155,6 +158,9 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
 
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index cc91ca7a1e18..148064142628 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -40,6 +40,8 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *filp,
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = min(task_size, VA_EXCLUDE_START);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	addr = vm_unmapped_area(&info);
 
 	if ((addr & ~PAGE_MASK) && task_size > VA_EXCLUDE_END) {
@@ -71,6 +73,8 @@ hugetlb_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 01d7cd85ef97..248a210c2b0b 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -129,6 +129,9 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
 	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (flags & MAP_FIXED)
 		return addr;
 
@@ -167,6 +170,9 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
 		return -ENOMEM;
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 807a5859a3c4..d3f8cec4895d 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -29,6 +29,8 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 
 	info.length = len;
 	info.low_limit = get_mmap_base(1);
+	info.hint = addr;
+	info.mmap_flags = flags;
 
 	/*
 	 * If hint address is above DEFAULT_MAP_WINDOW, look for unmapped area
@@ -52,6 +54,8 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = get_mmap_base(0);
+	info.hint = addr;
+	info.mmap_flags = flags;
 
 	/*
 	 * If hint address is above DEFAULT_MAP_WINDOW, look for unmapped area
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9f6cff356796..4b35eadd2ad8 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -182,6 +182,8 @@ hugetlb_get_unmapped_area_bottomup(struct file *file, unsigned long addr,
 	info.low_limit = current->mm->mmap_base;
 	info.high_limit = arch_get_mmap_end(addr, len, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	return vm_unmapped_area(&info);
 }
 
@@ -197,6 +199,8 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.hint = addr;
+	info.mmap_flags = flags;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6549d0979b28..b5fcb9dfb942 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3445,6 +3445,8 @@ struct vm_unmapped_area_info {
 	unsigned long align_mask;
 	unsigned long align_offset;
 	unsigned long start_gap;
+	unsigned long hint;
+	unsigned long mmap_flags;
 };
 
 extern unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info);
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..34ba0db23678 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1796,6 +1796,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;
 
@@ -1841,6 +1844,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
+	info.hint = addr;
+	info.mmap_flags = flags;
+
 	/* requested length too big for entire address space */
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;

-- 
2.45.0


