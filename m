Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3675A9E3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:39:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSwl4GvJz3f72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:39:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KO0CCoeJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ae0qywykdkyyaxkthmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KO0CCoeJ;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqv6z0Tz2xyD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:39 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-32a115757b6so236802087b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=OSuAy3hdf+ZsQNxs3kxuMbhy9QBzPPm6GtoQo3aB3NA=;
        b=KO0CCoeJjfr6uQrGAGyvNgiswHns8WtW+vNCGbmb+v3lgrTdGqCfv4Q0htUhCqi7L8
         NjudqvxWt3vJ1U4f4TaUrpiWDGDkYHTslXKwJR5AqzCzKMPyrwODeBVbDXy2W3OJ+0AJ
         32abPt60ZQu7g2dOidue0bSh6Xh6XjE19T0FxDLe4AuFdEJaS9z9AXmzzaZHqpBfL4WP
         CC3bKhkCnU66eINFmY1rA50iR0WfFedon1RB2Q6DxPGeP1j32wzMpXKoaqT2OAwWSdUJ
         2Dr+2H3hwJpx9s6tPPyXHohy9BSbHgL+aey4lgZu/S9fAtQBjK/jZiqIlpp1Ch7Jebxy
         Blpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=OSuAy3hdf+ZsQNxs3kxuMbhy9QBzPPm6GtoQo3aB3NA=;
        b=spsSGqAD/Olbbrry1jRfstSrHDRUU0scU6XLPTE4oOjTUXBcfJmjqsS83TEtt/if7q
         +7sVPpt7CMjDUHYPDh4a+lCh4PRhA+rP1YAZ+r+yqVK2efHGBRXTY/SwUREGfR9RH81f
         352J2GhKh+damY7dhgnDdj6i7lveSNWRMEPwVEsWC/j5rvkFBdP2WJCeFaUIbAFRRLpF
         yvBRyj2q1l8dAPCcM7BxM2OhmThoLjZVduDFWJOfzPELqWKJXC836kSS013owzu1SU5z
         CLte3C9SGQ2kVxYw1V8RTarK3nNkyprW27DpoqBo6aw7fwn7OjGY8A2j6uzcIxcrQ6R4
         2ItA==
X-Gm-Message-State: ACgBeo0IW3dgcbErO5jjI1JBRYSPPUeCwcjDFEVid3iWapaa+hlzhLf4
	cXqViQWBavzzoIHnSh7eW4YuW0MssD4=
X-Google-Smtp-Source: AA6agR5mOhnOZ5TXGA7QbMyhBcTFpfMYAPy+7Q1nZkdORl1Ru4vF2e+A26u5Wht4tIYfxlBv6SIkkjkdNGw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a0d:edc2:0:b0:338:957:a719 with SMTP id
 w185-20020a0dedc2000000b003380957a719mr24916063ywe.132.1662053737185; Thu, 01
 Sep 2022 10:35:37 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:54 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-7-surenb@google.com>
Subject: [RFC PATCH RESEND 06/28] mm: mark VMA as locked whenever
 vma->vm_flags are modified
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

VMA flag modifications should be done under VMA lock to prevent concurrent
page fault handling in that area.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/proc/task_mmu.c | 1 +
 fs/userfaultfd.c   | 6 ++++++
 mm/madvise.c       | 1 +
 mm/mlock.c         | 2 ++
 mm/mmap.c          | 1 +
 mm/mprotect.c      | 1 +
 6 files changed, 12 insertions(+)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 4e0023643f8b..ceffa5c2c650 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1285,6 +1285,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 			for (vma = mm->mmap; vma; vma = vma->vm_next) {
 				if (!(vma->vm_flags & VM_SOFTDIRTY))
 					continue;
+				vma_mark_locked(vma);
 				vma->vm_flags &= ~VM_SOFTDIRTY;
 				vma_set_page_prot(vma);
 			}
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 175de70e3adf..fe557b3d1c07 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -620,6 +620,7 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
 		mmap_write_lock(mm);
 		for (vma = mm->mmap; vma; vma = vma->vm_next)
 			if (vma->vm_userfaultfd_ctx.ctx == release_new_ctx) {
+				vma_mark_locked(vma);
 				vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
 				vma->vm_flags &= ~__VM_UFFD_FLAGS;
 			}
@@ -653,6 +654,7 @@ int dup_userfaultfd(struct vm_area_struct *vma, struct list_head *fcs)
 
 	octx = vma->vm_userfaultfd_ctx.ctx;
 	if (!octx || !(octx->features & UFFD_FEATURE_EVENT_FORK)) {
+		vma_mark_locked(vma);
 		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
 		vma->vm_flags &= ~__VM_UFFD_FLAGS;
 		return 0;
@@ -734,6 +736,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct *vma,
 		atomic_inc(&ctx->mmap_changing);
 	} else {
 		/* Drop uffd context if remap feature not enabled */
+		vma_mark_locked(vma);
 		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
 		vma->vm_flags &= ~__VM_UFFD_FLAGS;
 	}
@@ -891,6 +894,7 @@ static int userfaultfd_release(struct inode *inode, struct file *file)
 			vma = prev;
 		else
 			prev = vma;
+		vma_mark_locked(vma);
 		vma->vm_flags = new_flags;
 		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
 	}
@@ -1449,6 +1453,7 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 		 * the next vma was merged into the current one and
 		 * the current one has not been updated yet.
 		 */
+		vma_mark_locked(vma);
 		vma->vm_flags = new_flags;
 		vma->vm_userfaultfd_ctx.ctx = ctx;
 
@@ -1630,6 +1635,7 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		 * the next vma was merged into the current one and
 		 * the current one has not been updated yet.
 		 */
+		vma_mark_locked(vma);
 		vma->vm_flags = new_flags;
 		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
 
diff --git a/mm/madvise.c b/mm/madvise.c
index 5f0f0948a50e..a173f0025abd 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -181,6 +181,7 @@ static int madvise_update_vma(struct vm_area_struct *vma,
 	/*
 	 * vm_flags is protected by the mmap_lock held in write mode.
 	 */
+	vma_mark_locked(vma);
 	vma->vm_flags = new_flags;
 	if (!vma->vm_file) {
 		error = replace_anon_vma_name(vma, anon_name);
diff --git a/mm/mlock.c b/mm/mlock.c
index b14e929084cc..f62e1a4d05f2 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -380,6 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 	 */
 	if (newflags & VM_LOCKED)
 		newflags |= VM_IO;
+	vma_mark_locked(vma);
 	WRITE_ONCE(vma->vm_flags, newflags);
 
 	lru_add_drain();
@@ -456,6 +457,7 @@ static int mlock_fixup(struct vm_area_struct *vma, struct vm_area_struct **prev,
 
 	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
 		/* No work to do, and mlocking twice would be wrong */
+		vma_mark_locked(vma);
 		vma->vm_flags = newflags;
 	} else {
 		mlock_vma_pages_range(vma, start, end, newflags);
diff --git a/mm/mmap.c b/mm/mmap.c
index 693e6776be39..f89c9b058105 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1818,6 +1818,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 out:
 	perf_event_mmap(vma);
 
+	vma_mark_locked(vma);
 	vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
 	if (vm_flags & VM_LOCKED) {
 		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
diff --git a/mm/mprotect.c b/mm/mprotect.c
index bc6bddd156ca..df47fc21b0e4 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -621,6 +621,7 @@ mprotect_fixup(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	 * vm_flags and vm_page_prot are protected by the mmap_lock
 	 * held in write mode.
 	 */
+	vma_mark_locked(vma);
 	vma->vm_flags = newflags;
 	/*
 	 * We want to check manually if we can change individual PTEs writable
-- 
2.37.2.789.g6183377224-goog

