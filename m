Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94797698C09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:33:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNs23Y2Xz3fn7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:33:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPrkg6Ab;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3qbztywykdp4y0xkthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPrkg6Ab;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWw0ST5z3f41
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:36 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t13-20020a056902018d00b0074747131938so855549ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=28uvo2IqceKOssyZjY7i8BHUgiXFo9Fj5hjouTFWFAM=;
        b=ZPrkg6AbbvOKBZi1SkD/IxKxJeFUcG0rgRJFt48c6bsRhM/elzC2zYFPNxVAX1Pb/y
         v8gEIUO6XL4wPMpxHAJU/jtJ7FTBRhHG6n1tq7RCpsfo3BvcbN99La419Vjdnmr4LZUg
         Gb+YjubKYslJ6dowNgphM8TvAV/LOX1cmszsmnXszpI4IFG2RXQTfj4jwXf+4wC/qln3
         8/CHWsl7LtqeSj/ymA2+araRUo+8VrDVeXfGOtKcUcgJXUwZ/d5G40s9s5ABK3v0GdSA
         ZKM8IbDd/wXIDY67hjDQxG31fd3mnWXrl8BZPhPKFflZXpp+nOaLG/s24K3lMQ1hF8se
         I12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28uvo2IqceKOssyZjY7i8BHUgiXFo9Fj5hjouTFWFAM=;
        b=5FTu3QPecpg8ynUm59V5z5D85sA18OvqaQ/lqwJXTLHbOnikVS++Qr/6U+h8SQkPNB
         12jFtsWz6P0SVkSieDWBnXECuvha/nH65kkzGxls46tWsCf/EjXJXzkejeqgAR0qmyyQ
         Mzmph+bqTnn74J+K28q5v+CbcmNNgEUeSEOriyhkpEStsUEVsIHcjhMXzW3qZiE2hXWT
         rLWHO0LHIrRPFpyJbH6ngfzruNbTiRnPKGwFe0IbXxEmc8i4DJyLuPMCfJ0qPpz3qgli
         Un+wq4a29iEngw3/SJWpjVSpCW1U94zAbCUtAV5ytbShjTbC84RQ4Ek60Cd4gJPf0A2I
         yHvg==
X-Gm-Message-State: AO0yUKVyrfvGYk3VgffnYoBR30aDwufWV3SqV0M37b10uZokLqa0J6zZ
	GLY1z+GyWLws9IbhXWrKBhYTGTSJuyg=
X-Google-Smtp-Source: AK7set9S4UPuY0Di9CvIunrawIij5qvY5UYsfRSe+cxMHLWbfH6TBfZEYx+EaVk4FGZlSlGHqCNzztV/E7o=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:90d:0:b0:94a:ebba:cba1 with SMTP id
 a13-20020a5b090d000000b0094aebbacba1mr584331ybq.179.1676524713985; Wed, 15
 Feb 2023 21:18:33 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:31 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-17-surenb@google.com>
Subject: [PATCH v3 16/35] mm/mmap: write-lock VMAs before merging, splitting
 or expanding them
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

Decisions about whether VMAs can be merged, split or expanded must be
made while VMAs are protected from the changes which can affect that
decision. For example, merge_vma uses vma->anon_vma in its decision
whether the VMA can be merged. Meanwhile, page fault handler changes
vma->anon_vma during COW operation.
Write-lock all VMAs which might be affected by a merge or split operation
before making decision how such operations should be performed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index c5f2ddf17b87..ec2f8d0af280 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -269,8 +269,11 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
 	 */
 	vma_iter_init(&vmi, mm, oldbrk);
 	next = vma_find(&vmi, newbrk + PAGE_SIZE + stack_guard_gap);
-	if (next && newbrk + PAGE_SIZE > vm_start_gap(next))
-		goto out;
+	if (next) {
+		vma_start_write(next);
+		if (newbrk + PAGE_SIZE > vm_start_gap(next))
+			goto out;
+	}
 
 	brkvma = vma_prev_limit(&vmi, mm->start_brk);
 	/* Ok, looks good - let it rip. */
@@ -912,10 +915,17 @@ struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
 	if (vm_flags & VM_SPECIAL)
 		return NULL;
 
+	if (prev)
+		vma_start_write(prev);
 	next = find_vma(mm, prev ? prev->vm_end : 0);
+	if (next)
+		vma_start_write(next);
 	mid = next;
-	if (next && next->vm_end == end)		/* cases 6, 7, 8 */
+	if (next && next->vm_end == end) {		/* cases 6, 7, 8 */
 		next = find_vma(mm, next->vm_end);
+		if (next)
+			vma_start_write(next);
+	}
 
 	/* verify some invariant that must be enforced by the caller */
 	VM_WARN_ON(prev && addr <= prev->vm_start);
@@ -2163,6 +2173,7 @@ int __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	WARN_ON(vma->vm_start >= addr);
 	WARN_ON(vma->vm_end <= addr);
 
+	vma_start_write(vma);
 	if (vma->vm_ops && vma->vm_ops->may_split) {
 		err = vma->vm_ops->may_split(vma, addr);
 		if (err)
@@ -2518,6 +2529,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 
 	/* Attempt to expand an old mapping */
 	/* Check next */
+	if (next)
+		vma_start_write(next);
 	if (next && next->vm_start == end && !vma_policy(next) &&
 	    can_vma_merge_before(next, vm_flags, NULL, file, pgoff+pglen,
 				 NULL_VM_UFFD_CTX, NULL)) {
@@ -2527,6 +2540,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	}
 
 	/* Check prev */
+	if (prev)
+		vma_start_write(prev);
 	if (prev && prev->vm_end == addr && !vma_policy(prev) &&
 	    (vma ? can_vma_merge_after(prev, vm_flags, vma->anon_vma, file,
 				       pgoff, vma->vm_userfaultfd_ctx, NULL) :
@@ -2900,6 +2915,8 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	if (security_vm_enough_memory_mm(mm, len >> PAGE_SHIFT))
 		return -ENOMEM;
 
+	if (vma)
+		vma_start_write(vma);
 	/*
 	 * Expand the existing vma if possible; Note that singular lists do not
 	 * occur after forking, so the expand will only happen on new VMAs.
-- 
2.39.1

