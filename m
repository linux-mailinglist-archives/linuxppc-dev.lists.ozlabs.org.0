Return-Path: <linuxppc-dev+bounces-961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E796B51D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDq6ZCbz2yDx;
	Wed,  4 Sep 2024 18:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439291;
	cv=none; b=GHk5pf9FEVjnr2aL+Fp2iWjvje+fQs3+5CV48I3xguRg1uaN0Xd69xEwPzo+Md39ScCj31S5+6R5xw+3CxTJmSh53zgsNHUBbpvGu8dUt+9dFQn79VtcXhaVhx+xlyRAj5nKpOHa2gV9JQ0dNM8rFnQByLq2/J/S7vRpHJ3e7URIXeaw12dq0y3vxblcHBhhNiOguydBw2XS1orId4neccCssV6XuQRj5FhbdUi5HpFyJgboZcHp1aaZaJ9WneJC7qu1yIOYiySGOeKu2ib3pBVCf1vxA4qxCIKh7pUa9/JH8N9v2uwj7Y9QEpR9QUpBZpuFyBsqwcbMbWj4hSUhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439291; c=relaxed/relaxed;
	bh=jJ720IHYb4PoZSjS34HAH7fD9gF/j7WA/1t49m6Kiwg=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=O6fEAgcM+34ghuK/+ZhsGTuyc7VNPMM4OcrjIAk8FldY1Gn/KRaNwP8/W3pGYnTw1a2ZVsFYfSQAK3/0ILfYPhL5gioTJQDmhQKNgV3JZgUGOcaKZouH+uGKfwHmeN0uDqhoKLmJBOZrxZTN0/3Etki8gq1CrMzqrcYWLrBLzK+uXeOHzwj9CCYidrxrka/NKKBs/z93hf1xGvNHHQNfW0Ipvm9bTuyu5bruVxfibHKtg1bu9aD+hyWlZ5VqzOXo5GsbAOmCkZ39VMZV2UQxDTyn/SwzdCbg9pCOmuylchUNAZwjLki4HiHPnQourqItzNbJtg7PNeYJ3i0U1wTOww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WfQyXzy4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WfQyXzy4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDq4KNRz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:31 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71781f42f75so75787b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439289; x=1726044089; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ720IHYb4PoZSjS34HAH7fD9gF/j7WA/1t49m6Kiwg=;
        b=WfQyXzy4MYWVqRsDoBGvYNZVoisPcdUQrxi2o3n6nSNCyZE+BJRajNXHxuBXj6yH1h
         ThO0kR7TK6ISw1Fknwdbo/lTjSc+BXS6rtrBFfGCRRH735E+KaL7cXszrZLLhA5oP3mY
         WfZmGNfoG1cug2k5M+Cv1QOoTo37HD0ySAnSHcmYooKlDdiKLcmoykUTK1X9/xI8DlWu
         SukxfRlbzJLaGHgoPwvm/DNzWMo1kgFMGM2STKPYwLb7jGxCfIndje+Gyfivg9uzV4X2
         2mIn5WxKdAZnAFwMrlE7yBohYdsIGHRUp48I37HHtj3J7jRxRsicWtWRyV/zVFTMXk0o
         ovnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439289; x=1726044089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ720IHYb4PoZSjS34HAH7fD9gF/j7WA/1t49m6Kiwg=;
        b=a2D/1JgKubAgsREohi4lJJ/Q0QEgrTXsOXN70vE4Eyrfxj4nRMewfaSwyZ48JdwiLF
         5/5RhZRPoIfHN4Kqrd0T88Ex+OFH0hx6sS/xcNxgTJbeZzeYZrET5OHWC+sqTPDVXYrB
         cmTDWfqJfrnFYaXVewHEervixrJS0ZyZ6nifxLnagA8+lEYk76Uaf1dQsqjpuBK1BrWD
         UeXjMig4JTCUMt3cPET7/ggE8uY0QKcQy5h+Wm7PAJsPqf64nhsNjwPdqdwf8e4hS8X7
         oRISfcccjI0mZLe/o6aNpsnw8v/7KRJjiUcs1D+XwZCjud79hQrxgh8xS0NbQmd20k1H
         BSOg==
X-Forwarded-Encrypted: i=1; AJvYcCWLSFiXWRZDrXNa6i5pSSBpnWxn2cdSHDMf0xgjFXlPXpAfLn9Ax2dcJBW7yLCJNc4mheu3OvQhQy3DTzo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywm2lHsC+9BB+ysQeC7kNWGHxkz6TvGgkw1r+ESmMgAWXgzev7J
	q0uyOfnSDEUjzX4PpO9PpCsxXyj+zo4+Ot6fV0Kt+dj/+IjzR/sMhyzfJq9vAxM=
X-Google-Smtp-Source: AGHT+IHVhSodGEWLJbqfntGARXqFTBke8IrjtWuvc6P4tKsUnW/m6YB1esVTiG0+MVp8pwa1UVDERA==
X-Received: by 2002:a05:6a21:330b:b0:1c6:edfb:431f with SMTP id adf61e73a8af0-1cecf788518mr14875554637.44.1725439288977;
        Wed, 04 Sep 2024 01:41:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:28 -0700 (PDT)
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
Subject: [PATCH v3 07/14] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:15 +0800
Message-Id: <20240904084022.32728-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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
this time, the pte_same() check is not performed after the PTL held. So we
should get pgt_pmd and do pmd_same() check after the ptl held.

For the case where the ptl is released first and then the pml is acquired,
the PTE page may have been freed, so we must do pmd_same() check before
reacquiring the ptl.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 6498721d4783a..a117d35f33aee 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
 		pml = pmd_lock(mm, pmd);
 
-	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
+	start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
 	if (!pml)
@@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	else if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
+		goto abort;
+
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
 	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
@@ -1658,6 +1661,16 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
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
@@ -1689,6 +1702,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		pte_unmap_unlock(start_pte, ptl);
 	if (pml && pml != ptl)
 		spin_unlock(pml);
+pmd_change:
 	if (notified)
 		mmu_notifier_invalidate_range_end(&range);
 drop_folio:
-- 
2.20.1


