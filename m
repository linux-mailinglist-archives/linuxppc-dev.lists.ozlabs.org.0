Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2C67EEFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T1R0jYjz3frv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:59:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dIXUHHJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3bynuywykdm4ceby7v08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dIXUHHJy;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdP6ChTz3fKG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:01 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id n8-20020a258d08000000b007facaf67acfso6393660ybl.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PbZvlTacNRMtTYgLZEFyk5N8KO4rHMcD13osXtjRKQc=;
        b=dIXUHHJyt3zldvcJ25OA8M/N2ekAkSadxrM4Vc86G1vAxHUN7FQNbSzlWzbH3EF3Ay
         Np/mC7lgd8yNrbdx+fJZdOiPs5Ax7Y+isaOSeA0W3slHJVunqRE0R5gvKOYJUJLOV6vy
         eusS7uxTBSUHthbBE/M+AcF029iuITRiXxkeDAE1bHTcC4qSxwHlMi32ImCbpO9h9EMV
         +wvjzOskJitBDhg128jcOLxlukATYCWhVPwB6m3ynKWMcyTvnD5SZLfuK2oGD5H+Rl4/
         hAABUVAQozzvBCIG2lhb5atfzqUlxx9w7Rjl6rs3/T9zVK0hATJevSe9VLcJ9uJd0aXA
         HxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbZvlTacNRMtTYgLZEFyk5N8KO4rHMcD13osXtjRKQc=;
        b=yQ8LmB1mW0oWKe0QVQ5IP47a9hrUS16WFYhIDGTZOtuGnqqtQ4DAVyWB2eA80oQ68U
         /0q9ukt3NmTIV4cfKJfgz5H5s28BVBFm2rlwSz6uwrfSnbGO808zCoA4+nwUMILnSDJ7
         H5cafnzEk8aY03uTRk8bnGkncqdDU3Wn33E3eiQQxMQFJU6RQfLYRCo2brKuCLiQof0D
         6KI4dWsdEbNfuCvuNfjLgmSyhiHFuupza/1rpiirwVD7+jmB2y31kMuryvpD8v0ZLAEC
         OkXaAVO8MjolX+9oHC0dC3dOFT+4VgoRJMct+AumvitGTQ89k/EY2uYA4JwEDcG6O0cT
         u3cg==
X-Gm-Message-State: AFqh2kp61I1XzBZihdiS2WPuDVjaRlgAiiuIY2lG16SeQ/vSWf0oqL3s
	mH/Y2S5WgNnHH546+CdjvXhcy6Yid7o=
X-Google-Smtp-Source: AMrXdXtxOfNby/WJjyD0PPf8WyFmfovtGs47EqfediusuKgjOEAtqZl1SXyt3bJWMQsRbQEhpFz5LQpAf70=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:cd4:0:b0:4dc:e929:40fa with SMTP id
 203-20020a810cd4000000b004dce92940famr5633708ywm.331.1674848519684; Fri, 27
 Jan 2023 11:41:59 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:56 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-20-surenb@google.com>
Subject: [PATCH v2 19/33] mm: conditionally write-lock VMA in free_pgtables
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Normally free_pgtables needs to lock affected VMAs except for the case
when VMAs were isolated under VMA write-lock. munmap() does just that,
isolating while holding appropriate locks and then downgrading mmap_lock
and dropping per-VMA locks before freeing page tables.
Add a parameter to free_pgtables for such scenario.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/internal.h | 2 +-
 mm/memory.c   | 6 +++++-
 mm/mmap.c     | 5 +++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 90bb2078444c..52d7e9c2e58f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -105,7 +105,7 @@ void folio_activate(struct folio *folio);
 
 void free_pgtables(struct mmu_gather *tlb, struct maple_tree *mt,
 		   struct vm_area_struct *start_vma, unsigned long floor,
-		   unsigned long ceiling);
+		   unsigned long ceiling, bool mm_wr_locked);
 void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
 
 struct zap_details;
diff --git a/mm/memory.c b/mm/memory.c
index 7a04a1130ec1..d48c76e9fa57 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -348,7 +348,7 @@ void free_pgd_range(struct mmu_gather *tlb,
 
 void free_pgtables(struct mmu_gather *tlb, struct maple_tree *mt,
 		   struct vm_area_struct *vma, unsigned long floor,
-		   unsigned long ceiling)
+		   unsigned long ceiling, bool mm_wr_locked)
 {
 	MA_STATE(mas, mt, vma->vm_end, vma->vm_end);
 
@@ -366,6 +366,8 @@ void free_pgtables(struct mmu_gather *tlb, struct maple_tree *mt,
 		 * Hide vma from rmap and truncate_pagecache before freeing
 		 * pgtables
 		 */
+		if (mm_wr_locked)
+			vma_start_write(vma);
 		unlink_anon_vmas(vma);
 		unlink_file_vma(vma);
 
@@ -380,6 +382,8 @@ void free_pgtables(struct mmu_gather *tlb, struct maple_tree *mt,
 			       && !is_vm_hugetlb_page(next)) {
 				vma = next;
 				next = mas_find(&mas, ceiling - 1);
+				if (mm_wr_locked)
+					vma_start_write(vma);
 				unlink_anon_vmas(vma);
 				unlink_file_vma(vma);
 			}
diff --git a/mm/mmap.c b/mm/mmap.c
index 5bdfd087b632..57cb3a2ac9b1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2157,7 +2157,8 @@ static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
 	update_hiwater_rss(mm);
 	unmap_vmas(&tlb, mt, vma, start, end, mm_wr_locked);
 	free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
-				 next ? next->vm_start : USER_PGTABLES_CEILING);
+				 next ? next->vm_start : USER_PGTABLES_CEILING,
+				 mm_wr_locked);
 	tlb_finish_mmu(&tlb);
 }
 
@@ -3069,7 +3070,7 @@ void exit_mmap(struct mm_struct *mm)
 	mmap_write_lock(mm);
 	mt_clear_in_rcu(&mm->mm_mt);
 	free_pgtables(&tlb, &mm->mm_mt, vma, FIRST_USER_ADDRESS,
-		      USER_PGTABLES_CEILING);
+		      USER_PGTABLES_CEILING, true);
 	tlb_finish_mmu(&tlb);
 
 	/*
-- 
2.39.1

