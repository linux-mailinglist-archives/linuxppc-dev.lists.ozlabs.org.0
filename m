Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9D5A9E67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT496DHMz3fjV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KRAo4osv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hu0qywykdmm130nwkpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KRAo4osv;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrS5GfBz30Ll
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:08 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-33f8988daecso226850277b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=b/hqij6YMtUKn07CMMZGWuY0xy+IpIQzVd6D2LweKqw=;
        b=KRAo4osvkXfti83dlr7pDy0khew3B+/GxQjWEAl6TnacUwl+mtLybx0YLCFQUFV0lg
         sqmNuGzCNSRuL2SViXVJ2r0wrXOlXyxs3u9yAmqqg3AvKB9F3JJSO7rq3ZQJpqtxodOF
         i7G/Yua6+zv1pQayP4MuTvdM1yGvpgFJMwTj6dIMUAQKUS2ErYsxnukeEQ3tr0wanncl
         yMd9bQqlR0P+NMVZ/l+rGeUj3MMbqQRN0a5ORe8qDMpkAqtMCeKLfNSS6669H06w2E3e
         HhGcmv1HGm3kJoo9dZc+gF0PSVEl7OpLVCRJfkfc6aws3/7f1ZLX+WRY47T74JB1rzMb
         smKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=b/hqij6YMtUKn07CMMZGWuY0xy+IpIQzVd6D2LweKqw=;
        b=u55lfwoWn6xSIOXf7pW3zfxST4Q7gYwoevT3CL4n8AH2if97x53XxDAfIVLdZwkgj0
         txiPSjpfzOc0RO16rePMrRczjD9u4hYjI2uJb5Pr72foyOwZ0+r8bOAcx9++tISNS+Tr
         hGQEUcnEqH6WYCJ6RBAYX9J/Nuz2G4K6aLAxCJBTKvpIMi4QBE6J1cilxnTPYWCSIKfu
         AtXmmAVUQXGhkiljLMkws2vqygOp7JsZdg8g9oT3Z9uIZVgEG5tyMCtbym892rCMRQgh
         66HNRnvsgQZslQxngxPnBpMFpAhMHZOONvZ6iN92L5GPlSUjfh5An6ebIKkIq2LGj803
         4U7g==
X-Gm-Message-State: ACgBeo3iUQ0N+ijtv9xks5/gITr2CRT/v3khgZJb6WcaHW6xjF+3qTjL
	2SgE8jvdEh8nh0HTQofN2klFTKjeVW8=
X-Google-Smtp-Source: AA6agR5jEvG/zgKOeD87JHuYvOxB9Vp8GPj5NQSbzUKBEagOp3ZLZ7YArxKySukyQ3HnfRTZ0d7o3HLJ11s=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a05:6902:91d:b0:672:e583:9ed9 with SMTP id
 bu29-20020a056902091d00b00672e5839ed9mr20010197ybb.225.1662053766633; Thu, 01
 Sep 2022 10:36:06 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:05 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-18-surenb@google.com>
Subject: [RFC PATCH RESEND 17/28] mm/mmap: prevent pagefault handler from
 racing with mmu_notifier registration
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pagefault handlers might need to fire MMU notifications while a new
notifier is being registered. Modify mm_take_all_locks to mark all VMAs
as locked and prevent this race with fault handlers that would hold VMA
locks.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b31cc97c2803..1edfcd384f5e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3538,6 +3538,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
  *     hugetlb mapping);
  *   - all i_mmap_rwsem locks;
  *   - all anon_vma->rwseml
+ *   - all vmas marked locked
  *
  * We can take all locks within these types randomly because the VM code
  * doesn't nest them and we protected from parallel mm_take_all_locks() by
@@ -3579,6 +3580,7 @@ int mm_take_all_locks(struct mm_struct *mm)
 		if (vma->anon_vma)
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
 				vm_lock_anon_vma(mm, avc->anon_vma);
+		vma_mark_locked(vma);
 	}
 
 	return 0;
@@ -3636,6 +3638,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
 	mmap_assert_write_locked(mm);
 	BUG_ON(!mutex_is_locked(&mm_all_locks_mutex));
 
+	vma_mark_unlocked_all(mm);
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
 		if (vma->anon_vma)
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-- 
2.37.2.789.g6183377224-goog

