Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0867EEDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:55:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SxN2XyRz3fLx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lE9qRR84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3_ijuywykdmu352pymrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lE9qRR84;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdD33Jcz3fLF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:52 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id g138-20020a25db90000000b0080c27bde887so2634385ybf.18
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xM1gV9tZESxmDxiysmAmLZq38ZaKZXSlDI1GeX9HKic=;
        b=lE9qRR84U5+rYrRmzpPAw7Ud6uFSOEezLerrdXzskk/7N7IWEzIS+P8h33l5/GHLwm
         pzf0b8p0OfVWGzGLb/dMUWWv/4+TG3PN/VW/HgmJDf4GTYQxz4qhZvzGmSe6iwYXQbEv
         pmRWin5z3kTr/dQHGmOmQouL9X7gNxEvHMfX/Mw4+j3xs8bwN3ke4zv6/7Jpk/cXGw8a
         hnXfsAcVwtJnLNS//9cNJnJKu2XJduYEuopAyOxXqZTZsrcp23rvXM55Jk6t7ntayedf
         QFH2QchxeUajMjFYvRPLkdcrU5vfcJYPLkQ5Wb/mKP36Ds4BBv5V6MGo7zAGbp1SePYq
         xw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xM1gV9tZESxmDxiysmAmLZq38ZaKZXSlDI1GeX9HKic=;
        b=Y3yd0miCYXfHo79Awl6ROmDUDGOsrccstf7I2y/LW7JJTuxqSGzlNWSw9mg/jt8Xa0
         ZQV8ss6p+lWxm625DdUZSBvlcP88PWBAPzSrlAlAqdW1v2vd/dfMYwvSPOOWYBDXkZrb
         jr1sxUBGwyhJbrNzrJB10K/onEaQJS/eTUQjHpNhq1BcUBwNZYe11ndgqYgfaRFgnGRt
         1HJxc1xNMVzst5DHA3u1ECLGCJ9PZsFnnEqwlau+qJg7NTu9MZuPG1ACUYziIot6NoHA
         J7ok2qjKjpxf+idQyBrI91EbrcbU+LECK7P1jORhL/dguU1TO5uBdmfeFv/6AWxjx5MX
         NbHw==
X-Gm-Message-State: AFqh2krHkhec88zLf9a3QIDLTVuuzScnkuSq2evWKkoHdcTcj9MspkgT
	4RHDeQtMlj5U3pUPNAAO5k1dsKLzXvw=
X-Google-Smtp-Source: AMrXdXsibCiIco7YlC7GUbshkOFJQAk8PpTkup371cElxWyegDeUsxNSE/XyOxE1JUpmHxGWPZOyG9ioimM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:b94d:0:b0:801:e503:dd0c with SMTP id
 s13-20020a25b94d000000b00801e503dd0cmr2559229ybm.384.1674848510225; Fri, 27
 Jan 2023 11:41:50 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:52 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-16-surenb@google.com>
Subject: [PATCH v2 15/33] mm/mmap: write-lock VMAs before merging, splitting
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
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
index 7467d691e357..6fff76334177 100644
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

