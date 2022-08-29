Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F045A56B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkyZ4jmfz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:05:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=V7GGgx77;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=32i4nywykdis796t2qv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=V7GGgx77;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4r52Gcz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:48 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id v135-20020a63618d000000b0042db630eeb7so119240pgb.20
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=Ymgoo1txtx46eok3IPOZQ+7oQJBGfBlI8J01hhP7hOA=;
        b=V7GGgx774wbENy2sL3aG99hkTB/qGZUI2IMkW5Z7Ox/AY4k1IvJaJqWcS2+hJrQTXz
         qJiaho12WNhOPkKsDNI4kFEEE0MJklisQUNbnL2MLe3SXi7RR3OSC49CxUHm5rWNBWOA
         wHnBj0rB97rbw4NvbtXfeTLWG+Vyzon45DGcHKdD67SN4QP16ppc4Mfgkavx0/TZazKT
         jRNtTwjBlBNTzgM29WASwCLg6OtowkNwGUZwoCyX8zuUMvza2TeNlSBp6kFeN5K2wkE2
         aGwm4Y8asgOKWmz3tiq46nHGojR+kREyp0h1B2grUgz1rUK/O35dZpO1+I8qz72cYmP5
         /MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Ymgoo1txtx46eok3IPOZQ+7oQJBGfBlI8J01hhP7hOA=;
        b=5sm4IXC2aP89UrM/hzD3JAqHKj30jMR3SFUoD876sFyUGpsnZU/cNQYbkkXG/6w4Iq
         dJiUOReHWN3Mapcw/WCwfiqdSogTYHJhXLYcdqtaO8QmW49d3Vxcn0V2W5GhtnpYiluG
         4FuZUk95Yi97x3hiPENUvj+I2FVlgAY8WgZ3mwtayYaajoyILFSzziLo0bUUzIo4ICUg
         GYxE5X8glYldLcSRPh8DLy8LbBDG7phlEojbrbjVxNg6erZHg467ves95Dd6n4uIQ+V+
         rFe8WEaAIbcgUqDm+8q1H9CxErPeJLUqdWJ9bB1i4bgxd3Rh+nATNivJ+9PBGb1oYrAo
         I2Dg==
X-Gm-Message-State: ACgBeo0yYJBo0xoH/FgpUuGTNswa66hYesBo7kOLghjCIeIczlyFc+52
	5eODNKa3i9ZdnK1EMhG4UBcYP8vSyDE=
X-Google-Smtp-Source: AA6agR5xVu1GUsjULFDqf0en50jiRHsHcqxte0InGO36KTqnyV9YWBjqbQ+B0gx1566Kx/T+OnpxLJSWOq4=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:d48a:b0:16f:c31:7005 with SMTP id
 c10-20020a170902d48a00b0016f0c317005mr18369268plg.173.1661808346364; Mon, 29
 Aug 2022 14:25:46 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:09 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-7-surenb@google.com>
Subject: [RFC PATCH 06/28] mm: mark VMA as locked whenever vma->vm_flags are modified
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
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
2.37.2.672.g94769d06f0-goog

