Return-Path: <linuxppc-dev+bounces-3880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F239EA552
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfg5jQGz2yQL;
	Tue, 10 Dec 2024 13:41:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798491;
	cv=none; b=Oc4GtlZtq1uqTj5M6bN516fvdAuRFTSOk3dJOUuSqL8vSOuMB9JvOINRZ3ZjduoeZY3Xh4J3L/Qi+pLioLnGqRnTN0vU4ElsBRYvKTxihapR6faDiDrFasV+At+BFy4IS0GQpa1+6zyPJCLJ+Nc3mnP+kzPdEz+hx5X7wKrahALcpHofE20uO0q4OdqjtfvyBiB1r4Zo2gjt1rBpRkGtrTQbXcQw3o311ElDI0fiDQXDbrxJ0S0prdnBk5FZyaZrXiiQHoaMP3zqoY2z0IbIu1b6+UkmtG5s55BnDcn4065QRc5YFYzA3xh2nnseH2w4laXY18Ti1mhKCN+yufYq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798491; c=relaxed/relaxed;
	bh=nXKIsvWsBBTYmcaRz8JoUa2+7Qpfg8xMl3r7PMmLvBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oTRnyBzZa99Qd3hmEBtgAcMZ65If9WkRZ6Z6nJiH13Mb3SEAELMHaImlMLF/ewTv1+nd+aR1c9cBNrpCd5hXAqZ06uke0D84Vx7mjBLKQm9s9Ce/f44a/WW1pGl1FUyoY9LrIqiFp/VvCtarO8TvaqfregCYyiUOi1vjA5/HIPXeyUADv4bTS0tuHhRFii+NlegQZlrmdGa90iLg50EId2c9Itf25fQhIern1yWvKjL6mx2ORfHoEOZc0j88ZcNu0SsTjtAIzAKoYKt9llErK+d8JWEmUPd7rdO4NZWrJuBSlg/DzpJtfpoF9c7i8Sh47O7OF23sRbJ8QoYGnX1wiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dlF29Fho; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3vapxzwskdeowmxq4t4uzsts00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dlF29Fho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3vapxzwskdeowmxq4t4uzsts00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfd3WpXz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:28 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7fb966ee0cdso3579481a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798486; x=1734403286; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXKIsvWsBBTYmcaRz8JoUa2+7Qpfg8xMl3r7PMmLvBk=;
        b=dlF29FhooxJq98r87kOXw8M82jUE9Ph2hczYdNAGnnzTCZmR8EKaOPnnY46ir9Gugm
         L/qM8OJ0jSxVbu1/G0n8vv//z3QjY5nW25XypL7MySjkbGQLejSS2nGRCeSWiC9GW8go
         k7p3LaqVGAYR7KQyMoeo68YYD/Ys7CIGnvbi1Mgg7ww3/LtvZK+j4KwSvyUGzOwsKlIk
         b3rFDVrAotfid9be9Yspmr9RszZ7Mkx1S8zg5dFSh8aP9jAaTaOUQfCQS8Gl/Rn9Qzhq
         8jPzVQPk5UGmd+T0S3OI0xVSwHgX+Zkmcn9zLYQrM9SIt5waEb5yXLIFaoYilqSigPP6
         xLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798486; x=1734403286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXKIsvWsBBTYmcaRz8JoUa2+7Qpfg8xMl3r7PMmLvBk=;
        b=bryB5X2UrdodehsHthaQ9cQm6fdJQCbGE0sTmVzU9jd2qg0iP1IJCEX90+J1jK4fNX
         7Urz73glyWsA2d1+fKanqPE2FrHMYn232dAE0695RThdv/70xNSnxYEK/oEhUoQ1ZP/z
         mh93SL+WRyqvUchnznhnDtN8ATj2v9Lbk8WVoi3qVLtH6JthX2jfYiU/LpSVRgA1Jsyf
         Lwkp3dio7wvVRXMXnWeOThrE4lQALxT1MbPcZ4FfqWfNKybMG6qXOxl/vsygNiyxZ9VI
         9C4z5VBKZUNSaFdIHHhlVjBVlGZdpgdYSBhhXpBjEeNPMR75qJ6Qsv18PMf0BQavignC
         EQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbfHpPJUvAbDJkrWlVmZsdmMJXPJQQxye6CFdVlfNScE/DMfQIet9CbTOAfhsa7InmZ5SjvZij3LyWwiU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZrpuygUZIjFxmhLfDPrlGbr78KlU8NcW0slD2yDerW8kDzG1Q
	wJyElLF+ag3yqQT52uWv4INrA8Ji7zwle0vWG5u4J1zaTtkJjAi+Ro3upjH+I35XSWFco57Ivim
	IuzeA4i7TPXHlFp+YSmfHaw==
X-Google-Smtp-Source: AGHT+IEes4vFC8x7oz2PD6CyRh4s+tzg2fdn8MPTeQEnOJJBB4JDPOzOCc3jB91eMpzo0BdpMiIRvdYY+YmWIeDh+w==
X-Received: from pfau15.prod.google.com ([2002:a05:6a00:aa8f:b0:728:2357:646a])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7483:b0:1e1:adb8:c011 with SMTP id adf61e73a8af0-1e1b4435999mr2770722637.18.1733798485628;
 Mon, 09 Dec 2024 18:41:25 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:03 -0800
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
Message-ID: <20241210024119.2488608-2-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
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

Consolidate the hint searches from both direcitons (topdown and
bottomup) into generic_mmap_hint().

No functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 include/linux/sched/mm.h |  4 ++++
 mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..edeec19d1708 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   unsigned long flags,
 					   vm_flags_t vm_flags);
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..e97eb8bf4889 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
+
+	if (!addr)
+		return 0;
+
+	addr = PAGE_ALIGN(addr);
+	vma = find_vma_prev(mm, addr, &prev);
+	if (mmap_end - len >= addr && addr >= mmap_min_addr &&
+	    (!vma || addr + len <= vm_start_gap(vma)) &&
+	    (!prev || addr >= vm_end_gap(prev)))
+		return addr;
+
+	return 0;
+}
+
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
@@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
@@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		return addr;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
 				  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
@@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 		return addr;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)) &&
-				(!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


