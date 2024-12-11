Return-Path: <linuxppc-dev+bounces-4014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535799EDB56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGn0yt5z30WC;
	Thu, 12 Dec 2024 10:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959697;
	cv=none; b=ccJ4/eLjGyXepobcUVDs1K1Ip+bjEd0taTvB5ljj8QGtQ4NzDOOVuMAiPe4d9yMJlE7ibSWZFDYaszp2Y+J0JzfCFNbgtXFMJds/CMVbwk6aBviqrjQZwQCNYgDVjjEGGOMEX9TifR8jbrS2+icYZdmkRiPCdhJTcczFpnkGNhE/VBdlZQkoOIpRDSWXGQDjGB/gnW8DJZZ5cLwOEHumA+cJS2XL3cJYkZ7kmq8aAfOY+//aKd7MQnR6dHVo1o7hfsNJCyBIsyV9vrurJIwbkf3DyLCNQ6Q+Gf4knkc7uN//sdd5woxPRweetVbUxal0RjPmwXzmzWiLZF1tIb7mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959697; c=relaxed/relaxed;
	bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HhSlRZ44h3ZG5qe3pm0R/TiFYzTdf8w9Grvyt3KYWcSu+qwm6AtIbGO5/XXBZmzY9UAVnIMYQVin/JiouJELZa1m28tXM8G04aVciLzaJ1ZFrL5VpZJ3cGGSmQPUUWgwihe6TVzVfaLnJQQbUdp+vRnH42f+mmwVD1HvR+bSjxOMsgAY9bM327hkZVaQLE5chDIQUF8ugXZEL5DzfPN9LYsxsIZ0It2uO+Sh0xYRQWVOwxzT1z26oJ24X5ODGMFQIeGqG2M+pJ3jrLGt2cBuY/z1rJGaXZS3FYdcWzIB9kE6cbwVJZQxfD23Nth6sPwhPoTsBRLzm/jMkYSWP2LRdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DPqtU1lw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3dsbazwskdpyiyjcqfqglefemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DPqtU1lw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3dsbazwskdpyiyjcqfqglefemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGm1bmnz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:16 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-728cd4fd607so26644b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959693; x=1734564493; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=DPqtU1lwFfAzn3WURf1CCTXXIGMje7Q3oBFckpr79b/7xi+OQkw9h5FwA7y0RfKmwq
         kS0tyO8F/enHI8gXuBdimTg4ktioW+UbxfwxRCUrst+D94+8j67WfdjSYFAqMVdXrJPb
         xSoknHZSuOp3BF1fLL4IWjAO7rfeKFg6/WIrWnS7ZAGg/gcYVMs+7rInC9L4bd6G6Y68
         VU9LDBfVsdarDEMxHMcwbbwtxoejqL3rF52eCy9dMri6ETzvQ9vKzRRrxHEQhsWFid9B
         TqbXP4Hx+q4u2S4cXPnnVsUCf4xoZsDV6OzI+YCcstl2m6rPAxtKaNfjoeoXF2K1oUA/
         MIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959693; x=1734564493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=E14t78LB9SjuYWuhSQgmE7NAwRzLvR5JJdLkN/voxxZpgD9wdlsPWXvf5krkJItdLu
         o7F0mLL9POsnEg+UfPJSoj+LTI5TTjSIZThjtWUcB/2PFoDK5lSISenwSNlsVnkw40ke
         NBCPq+/5LCpkkbyw2k6mHUUCBA+dNyqFqF+N3hVNdtTz0gXubRn8f6Wjmg/doaPwcuRa
         wfoIekJwsuqDbsFyQNrpdKcVXtJsvzpzZTJW6Ra4rv2ae5Dt68Xnh/wl7ozbEe1im9FP
         3/PUWDVqSxVHHOaWDMgMNrE3wem3o4UkvVpq8e6e1Ht3Aq+4LvcA6dqDLhpmrHoxHpFz
         h6GA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsoxR+p54uiNnONhAxL4ZifZy6uFvYGCCiSFhrCLdBDNE/3Ixh1UcIReXwBXF+rydbQqoVNLYnipT0uY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxv0nC2R7xqiuI1kYuNicE9q8flqw8et1Q43+1ssCiR7k70izsk
	/00kQLibDj5q5rgcYWOILhskqs9gpI8sWpFFkHG9Pv7W04yauoMaj22E7wuE+rb5i5AK3V9h/xi
	I3hfS7ny5blbz1IckBogyUA==
X-Google-Smtp-Source: AGHT+IELNRPT2MoTQPIqvo9hLlMpqD0+8YUx/FKtbvg/ITxUep08nhQE+boeOUdV49+7nevT39OL6ys2YO6NUc/bEw==
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:c7de:e052])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:c95:b0:725:f376:f4f4 with SMTP id d2e1a72fcca58-728faa23b24mr1501920b3a.13.1733959693368;
 Wed, 11 Dec 2024 15:28:13 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:46 -0800
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
Message-ID: <20241211232754.1583023-9-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 08/16] mm: mips: Introduce arch_align_mmap_hint()
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

Introduce mips arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/mips/include/asm/pgtable.h |  1 +
 arch/mips/mm/mmap.c             | 50 ++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..837f25624369 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -766,5 +766,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ASM_PGTABLE_H */
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 5d2a1225785b..ee9f675190f1 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -26,15 +26,11 @@ EXPORT_SYMBOL(shm_align_mask);
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	unsigned long addr = addr0;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -54,22 +50,32 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
+	do_color_align = filp || (flags & MAP_SHARED);
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr0, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
-- 
2.47.0.338.g60cca15819-goog


