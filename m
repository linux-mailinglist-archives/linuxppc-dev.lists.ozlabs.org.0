Return-Path: <linuxppc-dev+bounces-1544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 462EC983CB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTy441yNz2yPq;
	Tue, 24 Sep 2024 16:11:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158268;
	cv=none; b=EVfsnOIWf6G6WZv/+8HSuCd+C+5lsPmZnbTIZsAp286Apt0GppMoHKLjo1wxukf/WF4zs7uffiJF5eWuoeQWcqgVlgSonPZWWUTDyrsdrNclGYSmnLCB+wSYY99EBdbF07AvnXBBZZigxTn9wmrcEdu7KDO4YsiQ9WPQokU3HxQ32hWq7WRaPQ3ItOLZ0YbJF9aMjsiE1JJBr3YcPGM48RNCF/d4dSLw+MemVtRz2lq+docuwSk3JIsNICzBmICzJS7G7d1aYwoG6ptsD60lqfssKGzu7jyo+SJmVl9B/6UGxvrJEtE++5zvj1+Qh7xJxAH3SkuhGJty+uo3iXxswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158268; c=relaxed/relaxed;
	bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=izZFv6ljEM4szTPU8XN7seETYpbnualztXbmJrjtGqqtkkxyWpfKMZAQEKmTgBKwLgu5eRLZBdACuQV2bitc3a+1TWuyKHgrShtSoIpL+jtYBYcxV/ZZagM4vfCVrr4rm3bAZ3owfCCY8cpDf55spv0Df3aPgb5xgBDnJKN9JUAI4zMVAcrwaZeZJdXK3fn33COLVIr1X6iRIoZX8z/yFYma89hivGZ7nsH813MgaQ+kXsxXWfeqXJ3InGHaaxd4k4c9UaoA+DEIrOU2jVkuhJC9YsylsRY/B1oiVB2vr6VVm7bEtFyrLGGQAgIluuvHMvUJR3DGgIoeQBTbKawU2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F6jLDhfZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F6jLDhfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTy42P1Rz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:08 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2054feabfc3so45793725ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158266; x=1727763066; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
        b=F6jLDhfZs25Nx5GvKLylE5bfWMO9nVh0wtMJKZt0ocBa9T7tJMpIIRy+KpsS4AVXLG
         PCrUOUO+g2JBWz18qC5voixBR9CKYL/1Ge+hqH3xXOS/7TmlWdKeKyNGx4KcnpveIB+a
         6B1Yi4IcGXfy3+Y9he72wHpV9aO0vSo802GduS70mW5gngr+xax+Ab0REBBqme8E7eXE
         daAN7Fcty6OqH3tsgq7N8CkYtQb2DArUi+ALPY35f0gc2xVzWmSo4tWihBny/qkf8SXd
         fEYsG/sONvl0cQObMdyLzj0/PIgxkgDvBrAgTX87P5FyTlOfXRWyx+ebZweiCB1UrpTt
         GoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158266; x=1727763066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
        b=Gwj4IGiq4291mAD7eQfy9ahJRbWPW3Bxiz+6ZMHmsP44CHRp7W6sSlwtEkHUMcAkkM
         E/7J83zJhkJeBQ6BPQP3VDdxUeVvGsOHyeTrce8VHRYcJksQJ1+UIAwZrmxzxaO0ptH4
         2GQnH1FU4R8Tp0IyXU+459A5ZC9/xRx/wa7cUD/b27uIUpVFT2UPxYOsleRBTHLxo0Mh
         QCYBMEO51zS1rYId/ER80oB+LOTTuEWJPkbmFKjU2SnRnAI+pNvvcyIjne1sCTf9f+LA
         zaEyaMYApzXaa0mXEaupl0Q7O10eBUSTC2X/2FKP5vSH9qlQrS0e1vRtnhRFUAuVW7Jk
         UXPA==
X-Forwarded-Encrypted: i=1; AJvYcCWAZeNcnwXx4pzUR0WfOfxGt0sikpa6CjG8WmnRr8gPWJ7Rkf5vKbrlnVuMGj37UQsQbBSTvYeF6GL0q/g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtrE15NhZlI8Thdb/upelZ31Y7367utiM4uCNzmxUCa+Zhhrri
	ayRctS7Kgc04VT0zzpg6/lh4+TAD5Z4xkt8gjUhMYvhQkFZwv3nKPeXLk0tjxqM=
X-Google-Smtp-Source: AGHT+IE0gKFIx3/KW4QPIJwQt51ZMLGla2X2YU2KRRy7vcX0w9t/15+gAAip1FE70+J7SP+04M4CVg==
X-Received: by 2002:a17:902:d511:b0:205:7574:3b87 with SMTP id d9443c01a7336-208d980bb34mr182109485ad.15.1727158265764;
        Mon, 23 Sep 2024 23:11:05 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:05 -0700 (PDT)
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
Subject: [PATCH v4 06/13] mm: handle_pte_fault() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:09:58 +0800
Message-Id: <eed9571b3d6f260e6e9d571fcac8b1ce8dd3571d.1727148662.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727148662.git.zhengqi.arch@bytedance.com>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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

In handle_pte_fault(), we may modify the vmf->pte after acquiring the
vmf->ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
will do the pte_same() check, so there is no need to get pmdval to do
pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/memory.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index a245d28787034..6432b636d1ba7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5750,14 +5750,24 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		vmf->pte = NULL;
 		vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
 	} else {
+		pmd_t dummy_pmdval;
+
 		/*
 		 * A regular pmd is established and it can't morph into a huge
 		 * pmd by anon khugepaged, since that takes mmap_lock in write
 		 * mode; but shmem or file collapse to THP could still morph
 		 * it into a huge pmd: just retry later if so.
+		 *
+		 * Use the maywrite version to indicate that vmf->pte may be
+		 * modified, but since we will use pte_same() to detect the
+		 * change of the !pte_none() entry, there is no need to recheck
+		 * the pmdval. Here we chooes to pass a dummy variable instead
+		 * of NULL, which helps new user think about why this place is
+		 * special.
 		 */
-		vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
-						 vmf->address, &vmf->ptl);
+		vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
+						    vmf->address, &dummy_pmdval,
+						    &vmf->ptl);
 		if (unlikely(!vmf->pte))
 			return 0;
 		vmf->orig_pte = ptep_get_lockless(vmf->pte);
-- 
2.20.1


