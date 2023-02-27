Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1156A4891
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:50:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSgv3cHyz3fSl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:50:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qq9ST5KY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3rur8ywykddujlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qq9ST5KY;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSP40MB6z3bgW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:11 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id f9-20020a170902860900b0019cf8d258c0so3141272plo.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QWCYeH3rb3vSAFp54Mmrv1+eix/+tyqClZQn+3lumNA=;
        b=qq9ST5KYd7H0i08HiNSL8c29Xrjl3aIZNo0vqd33ohY7IlOekjqUFmHX1pCbc/0CIB
         UJYRScXv/uQI5WgiH6m5n3NDzNqXvXc+EBT3Nr8sb84051cUA5rcu7NsZAUPZLQbAT+k
         L1+D52rxNhib5vRaYFXHr0l0OBrPbhYiKHs0HG8E+v4FWKdNvWFhRWhiPM7+2blQtGKB
         AQqKpecJF/PSLRs/Iu3OWc/90nRfqSr4OY1HTu201oV1jp1/8gN3EH/qUSvYipkLdMaB
         KA1JreUYCECV/wYDbpy6/KFPjd6XlpEX5mJczzYRoBrzVCeQlTDt7q+I0gm0goYKe+3A
         HbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWCYeH3rb3vSAFp54Mmrv1+eix/+tyqClZQn+3lumNA=;
        b=YtwANgseVrAtF7aI0U9lIsGxnj9O54PIktxfV1rxpuREM58JDFDEbH5G14kp4KbP+x
         ZZ//BC1WJGKBS9hm/NIZSzZ81pMc480qY1mE/K+LfeKm2UzamO1Bz9hHcboMJNTO3SOK
         SOBesAtIemaZESH/5ZPGp6woYlbgvrYW2iLCp5tsoRUnXWQ8xMGgLO89Ysf3dGhB95+e
         SCXfXRVsDU/8hG9XGDjxC0t65wNdHRBjxtxbC7q0wSHqom5VaMCCu8Jyv7qznM/42TGl
         6OC9q1OhuNhGwxcPt+8qAekezyfFoHbt8fItYo7jS28PfTCFQbvaEgJpsGEAIxGaLrDw
         DGZg==
X-Gm-Message-State: AO0yUKXzzPIDf9ew9nLrkb4Em+A6fWWGRK8IM0GOjoJ7WmHGmRFA9iO1
	oC5NK6pFIuR9AMPy1wdbNI+49a+TRFI=
X-Google-Smtp-Source: AK7set8jO949nwq1qPTfiOwF5d/NxOGl9PwUBICmy0J7iLD+CPMrX0ZITRyhhJB1FHKtenUKzwzPrWF2iBQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a17:903:2682:b0:199:56f2:3fc4 with SMTP id
 jf2-20020a170903268200b0019956f23fc4mr6277864plb.8.1677519430200; Mon, 27 Feb
 2023 09:37:10 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:13 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-15-surenb@google.com>
Subject: [PATCH v4 14/33] mm/mmap: move vma_prepare before vma_adjust_trans_huge
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

vma_prepare() acquires all locks required before VMA modifications.
Move vma_prepare() before vma_adjust_trans_huge() so that VMA is locked
before any modification.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index c234443ee24c..92893d86c0af 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -683,12 +683,12 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	if (vma_iter_prealloc(vmi))
 		goto nomem;
 
+	vma_prepare(&vp);
 	vma_adjust_trans_huge(vma, start, end, 0);
 	/* VMA iterator points to previous, so set to start if necessary */
 	if (vma_iter_addr(vmi) != start)
 		vma_iter_set(vmi, start);
 
-	vma_prepare(&vp);
 	vma->vm_start = start;
 	vma->vm_end = end;
 	vma->vm_pgoff = pgoff;
@@ -723,8 +723,8 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		return -ENOMEM;
 
 	init_vma_prep(&vp, vma);
-	vma_adjust_trans_huge(vma, start, end, 0);
 	vma_prepare(&vp);
+	vma_adjust_trans_huge(vma, start, end, 0);
 
 	if (vma->vm_start < start)
 		vma_iter_clear(vmi, vma->vm_start, start);
@@ -994,12 +994,12 @@ struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
 	if (vma_iter_prealloc(vmi))
 		return NULL;
 
-	vma_adjust_trans_huge(vma, vma_start, vma_end, adj_next);
 	init_multi_vma_prep(&vp, vma, adjust, remove, remove2);
 	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
 		   vp.anon_vma != adjust->anon_vma);
 
 	vma_prepare(&vp);
+	vma_adjust_trans_huge(vma, vma_start, vma_end, adj_next);
 	if (vma_start < vma->vm_start || vma_end > vma->vm_end)
 		vma_expanded = true;
 
@@ -2198,10 +2198,10 @@ int __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	if (new->vm_ops && new->vm_ops->open)
 		new->vm_ops->open(new);
 
-	vma_adjust_trans_huge(vma, vma->vm_start, addr, 0);
 	init_vma_prep(&vp, vma);
 	vp.insert = new;
 	vma_prepare(&vp);
+	vma_adjust_trans_huge(vma, vma->vm_start, addr, 0);
 
 	if (new_below) {
 		vma->vm_start = addr;
@@ -2910,9 +2910,9 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		if (vma_iter_prealloc(vmi))
 			goto unacct_fail;
 
-		vma_adjust_trans_huge(vma, vma->vm_start, addr + len, 0);
 		init_vma_prep(&vp, vma);
 		vma_prepare(&vp);
+		vma_adjust_trans_huge(vma, vma->vm_start, addr + len, 0);
 		vma->vm_end = addr + len;
 		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_iter_store(vmi, vma);
-- 
2.39.2.722.g9855ee24e9-goog

