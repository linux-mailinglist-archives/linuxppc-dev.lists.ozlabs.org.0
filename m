Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6225A9E4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSyh2CpXz3fHB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=osN5P5u2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ce0qywykdk4gifsbpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=osN5P5u2;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSr40FHjz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:47 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id p2-20020a170902e74200b001755a859b3aso1831017plf.17
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=f3HBd//8MTEjGtUKjIJ6VlUao66B8ATA87dRitXKN6o=;
        b=osN5P5u2gNPNqCUBvTG+Zi66behXZjVMeiTYran173d3bK7x/C4pNezlQHCFvkYQk7
         qOQqzQeCFbXQDX9e+QRzeVBdZKr22OFya12CKF/BNucIJ15gJeM6CJ6xJtVhkJ86JMIW
         z0BrEcSFGRuuGzZ7AIa/XsKdDh+JkQT9DWUmeCCWJ5VsR1VGSIBZmgZx0ZCJYBHl+XPj
         GoCI/RFibFsonWSqgiZwplWva8pXUgT5urz+18AucAe/seeiQYlfr5LWvUC2qg96tyno
         slrVqaBJlR1Fm38ZmASWvylf1J3rbhYM8n7OsiK4uazMHDS7+qFeKWZULOPVqfmGOKH5
         n3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=f3HBd//8MTEjGtUKjIJ6VlUao66B8ATA87dRitXKN6o=;
        b=01sdyVLn4Nf21tDWwRA+NLWElyU4eQI/6GZLPt7CuMPh6xPTv6twva9+2ckbtYUtVx
         0Lgz5o0ZRUP1earjbNIRBsIEv+mk59TixSq7UxSZDkM59gVd8QwWv/gffStFzvxlLhy0
         0wGPIeOzrYopRQo8dMZY7EOL9Ob5Uepfo+Nbx357xBU9gAgwiT+PIpEw+p5S3V93MKpV
         m93O9DKLDbVl4ivNNzRHMcRm+Mh+X8lC/MebS+h8gkaW/5Vk4MQlQ9dKF/nKFVl5SOZf
         1t8v791fyjvnSv5p5ZHy8bHbNzTnJDVVyHMjvWEQlNxpqJgMwP6VUILwsMa12VcIumbf
         uLGQ==
X-Gm-Message-State: ACgBeo23X6eF6RhoGJeYrAuH6bfkvAdz+6QAWoXkbIYoEOdGzCzNLHdn
	jQ/WVOfxU0XomZXkpyKaIXu4+KKdLa4=
X-Google-Smtp-Source: AA6agR6Q3wPydZYjoco/mRjMkhmNWxJo3Xdi/ebZ3ovzfa+ebF5iWZWFhqHdfMvubIqW+qGVzpwNqTYAd9U=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a17:903:2351:b0:175:58b8:cdef with SMTP id
 c17-20020a170903235100b0017558b8cdefmr4890777plh.30.1662053745409; Thu, 01
 Sep 2022 10:35:45 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:57 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-10-surenb@google.com>
Subject: [RFC PATCH RESEND 09/28] mm/mempolicy: mark VMA as locked when
 changing protection policy
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

Protect VMA from concurrent page fault handler while performing VMA
protection policy changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mempolicy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b73d3248d976..6be1e5c75556 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -383,8 +383,10 @@ void mpol_rebind_mm(struct mm_struct *mm, nodemask_t *new)
 	struct vm_area_struct *vma;
 
 	mmap_write_lock(mm);
-	for (vma = mm->mmap; vma; vma = vma->vm_next)
+	for (vma = mm->mmap; vma; vma = vma->vm_next) {
+		vma_mark_locked(vma);
 		mpol_rebind_policy(vma->vm_policy, new);
+	}
 	mmap_write_unlock(mm);
 }
 
@@ -632,6 +634,7 @@ unsigned long change_prot_numa(struct vm_area_struct *vma,
 	struct mmu_gather tlb;
 	int nr_updated;
 
+	vma_mark_locked(vma);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
 	nr_updated = change_protection(&tlb, vma, addr, end, PAGE_NONE,
@@ -765,6 +768,7 @@ static int vma_replace_policy(struct vm_area_struct *vma,
 	if (IS_ERR(new))
 		return PTR_ERR(new);
 
+	vma_mark_locked(vma);
 	if (vma->vm_ops && vma->vm_ops->set_policy) {
 		err = vma->vm_ops->set_policy(vma, new);
 		if (err)
-- 
2.37.2.789.g6183377224-goog

