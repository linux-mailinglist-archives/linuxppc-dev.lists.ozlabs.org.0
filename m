Return-Path: <linuxppc-dev+bounces-315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6A95AE9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwQ5bq0z2yLT;
	Thu, 22 Aug 2024 17:14:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EXAv4B3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwQ2SmQz2yks
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:30 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so342424b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310868; x=1724915668; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy8AvBGPXewIN0f06tSdN0J5TZbHLAwXxEIbEfEZm70=;
        b=EXAv4B3b0nds3d7opW+skIbhZBQUFH7EsjqvDcmwPO+5CD+sjq/B0LhJNpeNFmomtt
         WVfGdXjuhwx/blq7cVTMbMvpNp3w14v/MW2NVxfnOpjkBKKqJzRNi4FwGijnNe4B6RWJ
         Lxq1lWa7qisLRgM4imtmfakaKE5voERau/IOplfCOfO8xGtu03b7I4oQ2XNXTAdNPiSM
         r/VyIBzIxLVcHbgTXo+vcY7k7fCm7RGCSIV3KZoTQLF7HC14f8d0c26DObB/8ioN51XB
         S4k3j78WQmxgXr2r72SCm4ZjRIhUlm81MAxN/l3AC8kr/slIShdipRfTkxUolXhbOYKR
         yfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310868; x=1724915668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy8AvBGPXewIN0f06tSdN0J5TZbHLAwXxEIbEfEZm70=;
        b=KeTqnPrCRI6BESeqN/r+KMJ5k6eG3m3D/XvTYLtSLhCWrtbhDXkV1jdEztLJkZukWG
         uOGv5fC7w27Nl8b25Cmhj3oA3b8TAajWcTb71Nkgf0AW+/Hq0TNzEQ/rox4KQ5HiYbDd
         O1yHxBku7bgzQrZTGmBVMGSdq58tu9yfRf3seMUwgMZP/aqKlUsGNiuhjdx56ZUTX7ik
         c+pU9VEVONWvCjxN8QG/aKosUOg+gGPHxFX7uDaaJqDhR/zxIOlMV7YuW5zLS5tADIHy
         ycJXDvJ18vlo4ClOFhPAhqYgCNAQFzcvFURJeHKMJgE+IymgxiTLxARrvu/SFv7u2qe3
         yZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXuS2LReSoNret/N9GipJYpML477nHbX0Oa52311nM+/n6zx6FgIfqTcBKuNErY6VuPZoDrSHkUV9/t8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPkbrt+nxqyB3QY/8K1rNsPUVZQnxDfU2YfzSefaidgxwKDcXD
	N/7hciqzjRgkSs2+I9JaA9CzBqSn+MBwUB+pKEGcjsH/lftSlDXbtAkofOMfomA=
X-Google-Smtp-Source: AGHT+IEV/3obR+4TCbDGR6rVI1h9FT7v1/u/+fxVcK1o1ztnph09CHD4OJqmjxMXnPNwi8/vaSiIPQ==
X-Received: by 2002:a05:6a21:6b0a:b0:1c0:e728:a99e with SMTP id adf61e73a8af0-1cada078d94mr5247385637.26.1724310868515;
        Thu, 22 Aug 2024 00:14:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:28 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 07/14] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:22 +0800
Message-Id: <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the write lock of mmap_lock is not held, and the pte_same()
check is not performed after the PTL held. So we should get pgt_pmd and do
pmd_same() check after the ptl held.

For the case where the ptl is released first and then the pml is acquired,
the PTE page may have been freed, so we must do pmd_same() check before
reacquiring the ptl.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 53bfa7f4b7f82..15d3f7f3c65f2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1604,7 +1604,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
 		pml = pmd_lock(mm, pmd);
 
-	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
+	start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
 	if (!pml)
@@ -1612,6 +1612,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	else if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
+		goto abort;
+
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
 	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
@@ -1657,6 +1660,16 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	/* step 4: remove empty page table */
 	if (!pml) {
 		pml = pmd_lock(mm, pmd);
+		/*
+		 * We called pte_unmap() and release the ptl before acquiring
+		 * the pml, which means we left the RCU critical section, so the
+		 * PTE page may have been freed, so we must do pmd_same() check
+		 * before reacquiring the ptl.
+		 */
+		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+			spin_unlock(pml);
+			goto pmd_change;
+		}
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 	}
@@ -1688,6 +1701,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		pte_unmap_unlock(start_pte, ptl);
 	if (pml && pml != ptl)
 		spin_unlock(pml);
+pmd_change:
 	if (notified)
 		mmu_notifier_invalidate_range_end(&range);
 drop_folio:
-- 
2.20.1


