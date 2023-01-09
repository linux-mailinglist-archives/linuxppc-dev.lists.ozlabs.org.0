Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D699663266
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRTT2KSvz3fSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MKIFYUVg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3bx-8ywykdboikh4d16ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MKIFYUVg;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5M4F8Xz3cf5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:31 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id l194-20020a2525cb000000b007b411fbdc13so10390299ybl.23
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ves4Zx76RBv25M18zzcj7gVloTdTuNMdyKmYC5DDvz0=;
        b=MKIFYUVg3C+KcUmk/DiJLvwQZvDLVNMlr8DQ0MCXFdkv6hN2eBfUWDzxIZ7BfVHp8I
         9ZQKQbnc3cjtIsfRVDcXo71Ba38rTMbcUdq5jPPQ/O/qUYTP0dyF6taFqjbQZ9FRkBHu
         4AhRyAaM/Xs1rNZHH4s644beTjAgsiLfyufSEIgttXRExgdKqL3ufxpDIm4mlvORyhtg
         8KPqhXKz4czDblD/OO3yCfwh5TQTP8fNUj9/04RnIZEyuuEXUuTlBqAldxaXV0tj/mD/
         bYzPmov2AWSWqL0UrgwZuK2hqucg36ElYTON5SUI9h/73LoxJPTGa7ERIj/8Aw4bHycM
         nzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ves4Zx76RBv25M18zzcj7gVloTdTuNMdyKmYC5DDvz0=;
        b=606bkpsLnzgG1ohy8aQycYyo70NC4GOPAoQ2OaXO5Opa7qairaAAoi+1HMMYur2Doq
         DJlFze17ls0/wqqYjjJj+iu4/6988SnE16CEgyKlM+TgtiTV9FbDQvSC9xKlpKK9flNA
         vv+mB1W7pY4pUTUnDUx/cO09nMm3xtFDclOYGoIElvbRq3uXKLigT21e/3MW4Ytozuhn
         7nhGJuc7eHlSrr+L0sbNr8KR4rhtAj6A+yPhS5xcwJiZwZhf2+S5CaChjPBkD4xnglI7
         gdz737bnlvxj4ln7c8nJWqNloQg8sh42EFVittCrnF69ofUXj0pydCjbQoVtt80rE4nm
         WI0A==
X-Gm-Message-State: AFqh2ko8JM4pFEj7EQ85hPZNC6rSxCohW33PcX50LSHtAcuOzV0+nzhm
	/HOEmg3DvwlTKiULz+PHaW4AIZ/vfCU=
X-Google-Smtp-Source: AMrXdXvMc8uw91kFZQ5TZdRrbkHWe3EKuKErf5QuBh5uD1fMXXAng4XpjPLPHBE1E+VnZgCLzgnV8hcsb8Y=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a81:a013:0:b0:4a9:884a:20c4 with SMTP id
 x19-20020a81a013000000b004a9884a20c4mr4780346ywg.139.1673297669408; Mon, 09
 Jan 2023 12:54:29 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:14 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-20-surenb@google.com>
Subject: [PATCH 19/41] mm/mmap: write-lock VMAs before merging, splitting or
 expanding them
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Decisions about whether VMAs can be merged, split or expanded must be
made while VMAs are protected from the changes which can affect that
decision. For example, merge_vma uses vma->anon_vma in its decision
whether the VMA can be merged. Meanwhile, page fault handler changes
vma->anon_vma during COW operation.
Write-lock all VMAs which might be affected by a merge or split operation
before making decision how such operations should be performed.

Not sure if expansion really needs this, just being paranoid. Otherwise
mmap_region and vm_brk_flags might not locking.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 53d885e70a54..f6ca4a87f9e2 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -254,8 +254,11 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
 	 */
 	mas_set(&mas, oldbrk);
 	next = mas_find(&mas, newbrk - 1 + PAGE_SIZE + stack_guard_gap);
-	if (next && newbrk + PAGE_SIZE > vm_start_gap(next))
-		goto out;
+	if (next) {
+		vma_write_lock(next);
+		if (newbrk + PAGE_SIZE > vm_start_gap(next))
+			goto out;
+	}
 
 	brkvma = mas_prev(&mas, mm->start_brk);
 	/* Ok, looks good - let it rip. */
@@ -1017,10 +1020,17 @@ struct vm_area_struct *vma_merge(struct mm_struct *mm,
 	if (vm_flags & VM_SPECIAL)
 		return NULL;
 
+	if (prev)
+		vma_write_lock(prev);
 	next = find_vma(mm, prev ? prev->vm_end : 0);
 	mid = next;
-	if (next && next->vm_end == end)		/* cases 6, 7, 8 */
+	if (next)
+		vma_write_lock(next);
+	if (next && next->vm_end == end) {		/* cases 6, 7, 8 */
 		next = find_vma(mm, next->vm_end);
+		if (next)
+			vma_write_lock(next);
+	}
 
 	/* verify some invariant that must be enforced by the caller */
 	VM_WARN_ON(prev && addr <= prev->vm_start);
@@ -2198,6 +2208,7 @@ int __split_vma(struct mm_struct *mm, struct vm_area_struct *vma,
 	int err;
 	validate_mm_mt(mm);
 
+	vma_write_lock(vma);
 	if (vma->vm_ops && vma->vm_ops->may_split) {
 		err = vma->vm_ops->may_split(vma, addr);
 		if (err)
@@ -2564,6 +2575,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 
 	/* Attempt to expand an old mapping */
 	/* Check next */
+	if (next)
+		vma_write_lock(next);
 	if (next && next->vm_start == end && !vma_policy(next) &&
 	    can_vma_merge_before(next, vm_flags, NULL, file, pgoff+pglen,
 				 NULL_VM_UFFD_CTX, NULL)) {
@@ -2573,6 +2586,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	}
 
 	/* Check prev */
+	if (prev)
+		vma_write_lock(prev);
 	if (prev && prev->vm_end == addr && !vma_policy(prev) &&
 	    (vma ? can_vma_merge_after(prev, vm_flags, vma->anon_vma, file,
 				       pgoff, vma->vm_userfaultfd_ctx, NULL) :
@@ -2942,6 +2957,8 @@ static int do_brk_flags(struct ma_state *mas, struct vm_area_struct *vma,
 	if (security_vm_enough_memory_mm(mm, len >> PAGE_SHIFT))
 		return -ENOMEM;
 
+	if (vma)
+		vma_write_lock(vma);
 	/*
 	 * Expand the existing vma if possible; Note that singular lists do not
 	 * occur after forking, so the expand will only happen on new VMAs.
-- 
2.39.0

