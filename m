Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356967D58D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rgH0yySz3fKb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:41:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hZNOyExz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3m9bsywykdlgqspclzemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hZNOyExz;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbJ15ndz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:04 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b201-20020a2534d2000000b0080b87d910a2so2955772yba.21
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlALSRCxyJ0x7DG1bpOTgFUYMDutHYK+9H12DiNU8rs=;
        b=hZNOyExz2CHhT7Lv8/1Oy+IakRoysLUTyaLrhwc6OvOl1RbVfyxPx8HhLjEmNLtcA/
         BY0BX8hVwmwqOoBOAUbSQfgCR7McBjwSKMlnib3/r+Av8uTAud1UBhrmVG6TzF1g76mR
         nuKWivb9Q4wk66ty4yI9N1cosIfPbmFsheg2/502610l56CKG4QzLSoUZoExOYXjJCTQ
         j2mkcTGMWryRdUGvLYawFTWuoFK7ET78LKvwGsKOravZ5CcFDpVAFxFbBhoiYUfS0ekE
         vHIKanEeNQgRE6ZGBJnrux4jsyMuoU7VO1dgH6FWHeLmXl9fOCxu7UFXShpt7uDJ75T0
         D5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlALSRCxyJ0x7DG1bpOTgFUYMDutHYK+9H12DiNU8rs=;
        b=KFHdJxTauMm+0W6b9QdtHZWW+50NlCjXFqixvXbTjgQLnAO3/b685s9iwaqk68Q5UJ
         TtGUFF3s8BtIOluvTDs4m5mv/gdwKmxLSqkmO/uTKV0vpKKedUgkTv1WSQwlLTwOMlAg
         iYp/X2Ja3dB4CXLiSsComRrxXsMaX3S6ziOtEmH91Cfe17rtevETVIWcwO/Jn6VhWwhz
         /PxPsAIIDpB4TU/6ysgY01ji2MQUXUunXBRssAFfHFqA+7QFdaLH7DkAIDEyYCOcXZRO
         JmUUfLMH4pSxJ837F7A+OauR/CbvfSBggTidT+afzn4JMvK/SWNtxisphYXpJW8EgsHu
         qHrw==
X-Gm-Message-State: AO0yUKV5u+K3I0PrZ4VPNFDZtmaH61TzqCsNwn3/QukuqpcJEkduwIPU
	zN6mzogM88fE9zj1BiNlFqhZfNN1hDA=
X-Google-Smtp-Source: AK7set+wPgjPE4jCPi3P5+z8aENnhk2aKoIt+MqVYJV+W2PRabPfSrmAUbfkb2zGPKmrtE86F6tpsEUUWTA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a81:52ce:0:b0:506:60ca:21c3 with SMTP id
 g197-20020a8152ce000000b0050660ca21c3mr1424396ywb.197.1674761883577; Thu, 26
 Jan 2023 11:38:03 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:48 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-4-surenb@google.com>
Subject: [PATCH v4 3/7] mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
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

To simplify the usage of VM_LOCKED_CLEAR_MASK in vm_flags_clear(),
replace it with VM_LOCKED_MASK bitmask and convert all users.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Mel Gorman <mgorman@techsingularity.net>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 4 ++--
 kernel/fork.c      | 2 +-
 mm/hugetlb.c       | 4 ++--
 mm/mlock.c         | 6 +++---
 mm/mmap.c          | 6 +++---
 mm/mremap.c        | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index abb31103d060..ad4fdb9405ba 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -421,8 +421,8 @@ extern unsigned int kobjsize(const void *objp);
 /* This mask defines which mm->def_flags a process can inherit its parent */
 #define VM_INIT_DEF_MASK	VM_NOHUGEPAGE
 
-/* This mask is used to clear all the VMA flags used by mlock */
-#define VM_LOCKED_CLEAR_MASK	(~(VM_LOCKED | VM_LOCKONFAULT))
+/* This mask represents all the VMA flag bits used by mlock */
+#define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
 
 /* Arch-specific flags to clear when updating VM flags on protection change */
 #ifndef VM_ARCH_CLEAR
diff --git a/kernel/fork.c b/kernel/fork.c
index 9260f975b8f4..5e3029ea8e1e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -659,7 +659,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 			tmp->anon_vma = NULL;
 		} else if (anon_vma_fork(tmp, mpnt))
 			goto fail_nomem_anon_vma_fork;
-		tmp->vm_flags &= ~(VM_LOCKED | VM_LOCKONFAULT);
+		vm_flags_clear(tmp, VM_LOCKED_MASK);
 		file = tmp->vm_file;
 		if (file) {
 			struct address_space *mapping = file->f_mapping;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b6cbba105ffc..3a01a9dbf445 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6970,8 +6970,8 @@ static unsigned long page_table_shareable(struct vm_area_struct *svma,
 	unsigned long s_end = sbase + PUD_SIZE;
 
 	/* Allow segments to share if only one is marked locked */
-	unsigned long vm_flags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
-	unsigned long svm_flags = svma->vm_flags & VM_LOCKED_CLEAR_MASK;
+	unsigned long vm_flags = vma->vm_flags & ~VM_LOCKED_MASK;
+	unsigned long svm_flags = svma->vm_flags & ~VM_LOCKED_MASK;
 
 	/*
 	 * match the virtual addresses, permission and the alignment of the
diff --git a/mm/mlock.c b/mm/mlock.c
index 0336f52e03d7..5c4fff93cd6b 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -497,7 +497,7 @@ static int apply_vma_lock_flags(unsigned long start, size_t len,
 		if (vma->vm_start != tmp)
 			return -ENOMEM;
 
-		newflags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
+		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
 		newflags |= flags;
 		/* Here we know that  vma->vm_start <= nstart < vma->vm_end. */
 		tmp = vma->vm_end;
@@ -661,7 +661,7 @@ static int apply_mlockall_flags(int flags)
 	struct vm_area_struct *vma, *prev = NULL;
 	vm_flags_t to_add = 0;
 
-	current->mm->def_flags &= VM_LOCKED_CLEAR_MASK;
+	current->mm->def_flags &= ~VM_LOCKED_MASK;
 	if (flags & MCL_FUTURE) {
 		current->mm->def_flags |= VM_LOCKED;
 
@@ -681,7 +681,7 @@ static int apply_mlockall_flags(int flags)
 	for_each_vma(vmi, vma) {
 		vm_flags_t newflags;
 
-		newflags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
+		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
 		newflags |= to_add;
 
 		/* Ignore errors */
diff --git a/mm/mmap.c b/mm/mmap.c
index d4abc6feced1..fa3cbd625850 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2671,7 +2671,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
 					is_vm_hugetlb_page(vma) ||
 					vma == get_gate_vma(current->mm))
-			vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
+			vm_flags_clear(vma, VM_LOCKED_MASK);
 		else
 			mm->locked_vm += (len >> PAGE_SHIFT);
 	}
@@ -3340,8 +3340,8 @@ static struct vm_area_struct *__install_special_mapping(
 	vma->vm_start = addr;
 	vma->vm_end = addr + len;
 
-	vma->vm_flags = vm_flags | mm->def_flags | VM_DONTEXPAND | VM_SOFTDIRTY;
-	vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
+	vm_flags_init(vma, (vm_flags | mm->def_flags |
+		      VM_DONTEXPAND | VM_SOFTDIRTY) & ~VM_LOCKED_MASK);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
 	vma->vm_ops = ops;
diff --git a/mm/mremap.c b/mm/mremap.c
index 1b3ee02bead7..55157b990091 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -687,7 +687,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 
 	if (unlikely(!err && (flags & MREMAP_DONTUNMAP))) {
 		/* We always clear VM_LOCKED[ONFAULT] on the old vma */
-		vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
+		vm_flags_clear(vma, VM_LOCKED_MASK);
 
 		/*
 		 * anon_vma links of the old vma is no longer needed after its page
-- 
2.39.1

