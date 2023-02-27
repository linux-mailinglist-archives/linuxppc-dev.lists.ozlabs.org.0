Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC26A48A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSn31tN0z3fjq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:54:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bS7cuWST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3uur8ywykdeevxuhqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bS7cuWST;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPG5LN5z3cd1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:22 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536a5a0b6e3so155611287b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4IoNs8/2s63po158n4pCM20IldvB6LsORlyoWZYhDA=;
        b=bS7cuWSTvikNO5/1/KRQJLPoIX97MSDopLQjzIYhd9M4ATiilp+2nnzhJYwm+xkfAw
         CA4PkRjLFErdI6iJpWSrCW/0zzxhXa3aDXwe+0SrD6SM1VCA8VjhRHuY2QcHPeKNakQW
         P+DawdVxSLtrg/I5seo5dukO8m39Wj2s4hqiK8xve+bjTmkIkwxAaDpb3/Zo6UgfUlrQ
         EPB7WXnu31e6AaMIPOJ6t49a2aYPUJ8xG3eJeremwZc8bnMi2k5b+Q5ZfPziQ2FlHzzp
         w2I2hG7tsvd97Sj45eHKWDA+0nQshMfUHld0I+kGvTMYTZlSoT7VYdn14KEIlMTUGdtE
         e10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4IoNs8/2s63po158n4pCM20IldvB6LsORlyoWZYhDA=;
        b=0+L41+krQHm4yDgG4V2woWpzQ71b6DJoD+hpOzHqTgXbMpxXmZKU0ZzKLrgU68pPSG
         fofMKSDR2GvCIbVdq32+ekE5crFdf0x2lTeOnktVMZjiJbRteW9oD3BCVck0UCHpN1Rb
         uYJs/n0umuoLH3pck2epABsRWZGI0KLqcg1kL1rN+wAMq10ABhEnYlsJH1RQdAEURtpr
         D/R1vPqtvCQHO0r7iKLX3X8UVhP621PW5eTr0EXQ1uUalqGt9sQurEBRk9gwhpw3cMw7
         hAXvp7zTSsJsNZ6dQ1JitMt7oGxyMwcm35URQs73AQLOTh3nwqF08B3P9Pq2HZw2KjFk
         pXYg==
X-Gm-Message-State: AO0yUKV2lVw5sRbmr+vlpGDC1fgfitSIvA0op44XkpA6CyvBtJgqdjTg
	fKu1zZdMn6+vtNoDdtuSEbASEL38gMQ=
X-Google-Smtp-Source: AK7set/PpfdmNkoTcymoja/27Ir9z6PS18iSX+0Y7AEWmCWJmOIOQsn+Wv7zMECojEbGHKP0cPXfu+hFpqg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a05:6902:1388:b0:855:fdcb:4467 with SMTP id
 x8-20020a056902138800b00855fdcb4467mr287176ybu.0.1677519442170; Mon, 27 Feb
 2023 09:37:22 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:18 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-20-surenb@google.com>
Subject: [PATCH v4 19/33] mm: conditionally write-lock VMA in free_pgtables
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
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
index 08ce56dbb1d9..fce94775819c 100644
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
index bfa3100ec5a3..f7f412833e42 100644
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
index f7ed357056c4..ec745586785c 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2152,7 +2152,8 @@ static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
 	update_hiwater_rss(mm);
 	unmap_vmas(&tlb, mt, vma, start, end, mm_wr_locked);
 	free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
-				 next ? next->vm_start : USER_PGTABLES_CEILING);
+				 next ? next->vm_start : USER_PGTABLES_CEILING,
+				 mm_wr_locked);
 	tlb_finish_mmu(&tlb);
 }
 
@@ -3056,7 +3057,7 @@ void exit_mmap(struct mm_struct *mm)
 	mmap_write_lock(mm);
 	mt_clear_in_rcu(&mm->mm_mt);
 	free_pgtables(&tlb, &mm->mm_mt, vma, FIRST_USER_ADDRESS,
-		      USER_PGTABLES_CEILING);
+		      USER_PGTABLES_CEILING, true);
 	tlb_finish_mmu(&tlb);
 
 	/*
-- 
2.39.2.722.g9855ee24e9-goog

