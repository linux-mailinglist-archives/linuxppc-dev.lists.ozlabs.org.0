Return-Path: <linuxppc-dev+bounces-4012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A19EDB4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGh1Bmvz30Vn;
	Thu, 12 Dec 2024 10:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959692;
	cv=none; b=P0P4XlvXA378sLh0vLzayWfQOUCW1KHU+vKw7QuypMw4pUd6WpZjfQAovE5EnylwswXpMoHDKUR3USy575SkPXRWchI+zD/x9KQvhVbI8Gv+Lqno8nM34udzS/6zS7WRJ5RBlrZJNp0u6JwHjzpXdi/Nz2CX3/cqx7nJCT71TCSTiLsmohbbVQnxxsq473CK7lH51D95KKEze5kqG6ru0YIOBWLebzXvaNAsmnpiETEwkQHq4I9lG0jaE9MLJhTVkLNqrUA2BSpWbaH9RfFnSUdA05+LhHib2Zk8C+VQz++Wnu/7NpLwdq93ENcDZpwPAXgGu4M0h4880MisdJh2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959692; c=relaxed/relaxed;
	bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WdhSetH4hq4VPI86H4eoUcxVA5Of6VwCkuNgD9untHzTn7sKOjRi1H/gBH2wlzw3ilhadKHjfDd9DjwM0NH9OXoQVPXZTQ/hf+JEwV/D161t+OYNPrp8dj4fF+cVHlNTATYT24cQQJfik4Eg+NI9tg1KmjZI2cYkyw43FG82UJN4hRvUVtGt1YIIXYu6wCgwxqi+NhP918axEG4w8cwoU/M/4zji7otOQxPP9T+3ChLoNW+fT/Y8gpD5XuxzQL+uW64d3XBXaPXx9JtAAf044EOErDdIg6uhKcGzXNoA72vEiJvgjWbXeXiaJueH/lzJdIvaMp+Bc+4C02/vP6hddg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qqF74snd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3csbazwskdpieufymbmchabaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qqF74snd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3csbazwskdpieufymbmchabaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGg1dZKz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:11 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-72739b83336so34837b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959689; x=1734564489; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=qqF74sndXTNyaD7hE2+1pEDlrTKeNRSMfNvK1w/S5k22+BM7MWn05a6zJVHbXanhYX
         aQU6pSc4BTa4FXqCbYyQ8m0CLTTz0MTeEaDIT7LUTSlQrfpF0Y/1yVkb0WH/cpReIlhk
         zbyLIkMrHpHkRfa7ips9uS6PeOTG72xDUm3BBEUauhDkFv4nICczUmHjSFVS1zzxCnOB
         cN5e2Wi3uX9xtZ6TzZep1WgU+IOkhZNCVOHJJRUBsZNg4i0SaZJ+xLLWa48zyxkTu995
         dFh/D55qWkf8suwDSLMYNS4/F0B/o10fENI8HTjzr2ccr01gtbtRDcAgYhUqkDqYz/Ll
         RqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959689; x=1734564489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=eeYR9xjv0QMOzci82Ga8kd0NpwW5em97Tw28xCYvbZ8HZYd7+ZIFu0w8REx16Mw2YF
         e4TkZhJGokQecP0BJBMR8xWuckvJ1o56OnvTPnbCij+1AyvXWBi6Ni7q6jRqnzmnz/tE
         s1U+YyybY5EoWSsEN0WgsAD5KCPn289/fS0hd4mfihtuYkOHP3VBSh23CqduqSYb3xRv
         ll9ea6d62haidXT3EX37pstbsBhZuptP9XeJon3SbrmxAQK2zKfiPwb1QC90XkAo+GpC
         L8uvY/cGl/vQ8DmT5WDR5967Xp3GcQYditDBFipPZAsmLx/jjBs7QyW85iWbOe67SGe2
         LRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwGjgciyK0tCpgSxyHDdu3hl6/fgXtw8Fvq/5a1wO7cj9abZIk8QftofFfpnu29wVmZhwEtPVPu4VIwOw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+g87f2RZsywH7P64Ycagfvls0O5JsY895IgYwZCbDR3GjdvEe
	L5xLbcyhvV+5tFdRY2A0hdkVQ4gOGx0KogsMXX7BBFZPoqB/06MrdcRe9OjY/hYtfjIBlSVULvA
	gCi/FLO2F//L5jKsCKJNhgA==
X-Google-Smtp-Source: AGHT+IHgv+hz6lUV53h1smjsDXGUMrAdu+yMyNI0Y1qN6skLJAQw6jBsC8TmY8m6/oNaMxzzcfOLndyqCxWrzR4uSQ==
X-Received: from pgbee13.prod.google.com ([2002:a05:6a02:458d:b0:7fd:4d08:df94])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7890:b0:1db:e40d:5f89 with SMTP id adf61e73a8af0-1e1cebb5277mr1761320637.28.1733959689528;
 Wed, 11 Dec 2024 15:28:09 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:44 -0800
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
Message-ID: <20241211232754.1583023-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 06/16] mm: csky: Introduce arch_mmap_hint()
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 68 ++++++++++++++------------
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..0c5c51a081e4 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,39 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	bool do_align;
+
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
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
@@ -27,8 +60,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_align = 0;
+	bool do_align;
 	struct vm_unmapped_area_info info = {
 		.length = len,
 		.low_limit = mm->mmap_base,
@@ -36,37 +68,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		.align_offset = pgoff << PAGE_SHIFT
 	};
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	do_align = filp || (flags & MAP_SHARED);
-
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
 
+	do_align = filp || (flags & MAP_SHARED);
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
 }
-- 
2.47.0.338.g60cca15819-goog


