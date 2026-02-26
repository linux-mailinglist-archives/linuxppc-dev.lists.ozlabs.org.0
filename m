Return-Path: <linuxppc-dev+bounces-17232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mm1BgLxn2kyfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDB1A19FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2Yp0qZJz3bn8;
	Thu, 26 Feb 2026 18:06:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::134a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772089582;
	cv=none; b=c/rgSGGGcfxqdWVL8fJtUgt1SPGH2tinf4psmMt1QrgFvgK3vTecVnDeSOEAc0hBDRVVB4h59jv7F/o3Cgq4JMtIcH7gqVDC0NKp5Q/UFcYg/dEqco9+kMmXC641lAiH2a1LE3ZwQ16G4DLP1vWkPuk+lYdH9boQJxzG+9mTDbPwEfLVGkXX8Zm++h9uPW+zTe0NWi2r2eNY7+ymRpCKs3vsgLhZaOafWasKvaWed/hh1J6J4J+UXdhjwimc1FArs39tsrduR+T/qja5XxOgmClwwcHKWwJVMkU53I3eQs68Mm+S3A++ejbToc/3KmnLebd1L0/k6nmOOhePgZzGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772089582; c=relaxed/relaxed;
	bh=5I1QOj3Vyf2nTpPPlemTkxt7qh7oWHe4YCv7YkUsRic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FdGjqUwa5fxL0ib1M9oPM9yTquuzVPQn/ZZe6c4Wz+7EUy5sYT80GZvqRnJfdBLw6oK1QvyXhl9lMSVjmIt+78fWf7RETSnqQq8de5USYYM73keoWzbZvacXVk9JhPg/AXZ6LI8JiUiZVIItdmj45I0smM+ockdmyAP8sID685Q9XqHfCoaENjTcdRAz97f0Pa7Gu1WHNdmZlUKiLsaJaQeZb7WwstLgaIH1AuFC0uEh2t2ILzIDHF8vdHIQNKcHdRAsJPsyvcbrGmAf1ygMHNPrxXT0r/6uxA/w8g9uYJJD5/FtetfgJPlLFH4JE9MkJPjrbUso+A7gx6vKrmHfWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P90+VGE2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::134a; helo=mail-dy1-x134a.google.com; envelope-from=36_cfaqykdkasurenbgoogle.comlinuxppc-devlists.ozlabs.org@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P90+VGE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::134a; helo=mail-dy1-x134a.google.com; envelope-from=36_cfaqykdkasurenbgoogle.comlinuxppc-devlists.ozlabs.org@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x134a.google.com (mail-dy1-x134a.google.com [IPv6:2607:f8b0:4864:20::134a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2Yn2cwbz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 18:06:21 +1100 (AEDT)
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdb58f18f0so6636808eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 23:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772089580; x=1772694380; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5I1QOj3Vyf2nTpPPlemTkxt7qh7oWHe4YCv7YkUsRic=;
        b=P90+VGE2JlbpeSmaa0amFs1Pg5o0pXo62sWHwiIjNMbc4r561jPdg1D2H/GrAfZ577
         M6tQj1uCRuVGOlU+QYah0z6VLpzDbR6rXBpeSS5jYlccOPIj+OWRnfUT8SEi5PvXRX2+
         gZzD82p0lXVNaUejHede1/K5nwAxyCFyd8LNnaVlkwmjfdgfe6Xt+ZhSX9J8r3CbLDu5
         Qh+X7HXRgQrqzG9pikCtWk9hdSxvT2XYh4OPi1rGpOgG2Prsf0CmZeztdlB//eyQAUAd
         sjzK+o1rSDPMGt3IofqGkt/IbABIgbTiSFI+ufVSS0musjWx5zPlU4+EP6CfybgQG+OP
         t9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089580; x=1772694380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5I1QOj3Vyf2nTpPPlemTkxt7qh7oWHe4YCv7YkUsRic=;
        b=kVRJ3eBrrCY6mP8/4npKbsXB2Xz1qw1W2vHsyPuOcfbqRQcz5a027os+2LCbROvhAF
         hhrCmPLli0+1G/4dPldX4CdEda4jJLeFREr0QOZ3OdgGcjlenTWq/nrISeY5zrS0QXqL
         v+m7HOahn8IQS968mOgXND/HXx8zzvQ2pIxIeqfyz9Pug1Na7LETYBwMMfJpl4uvcc+0
         VMWov3jMsVtYwAhjTwje1mVhgWBHDeWLfConDHXJ4MYXH/HUwZiZWPFr2Iawgh+5aTOI
         gtdZAXX/0cKzj1lCDEXlB5yWvmMpY6AzjTSTpzbsaHmlDLyHt8TUSSZNugA5TXcQEZrI
         sQPw==
X-Forwarded-Encrypted: i=1; AJvYcCVv4LBnYC1sKrfwvEgNOlqAusAxdQKzhwyrmIUFz0Sl4Pjvpr207EHKzV4hBPuU5Vm8Vm2OzfI1wisxGJY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEveVpxCsplPahLX5byKJRg5eXEej8Zy3A46Sxyt8gBsBTXU1L
	R7nfBMImqOnqVZDW75KB+K1PsBmZ2U4hyQnOsTU4Z02TroJwC6wGHwrpukrmh7JoK/jjR8rlUeZ
	pYY/cmQ==
X-Received: from dybri2.prod.google.com ([2002:a05:7300:f082:b0:2bd:c0e6:3762])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:4348:b0:2b4:5b59:af52
 with SMTP id 5a478bee46e88-2bdd301cbc8mr527999eec.29.1772089579483; Wed, 25
 Feb 2026 23:06:19 -0800 (PST)
Date: Wed, 25 Feb 2026 23:06:09 -0800
In-Reply-To: <20260226070609.3072570-1-surenb@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20260226070609.3072570-1-surenb@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226070609.3072570-4-surenb@google.com>
Subject: [PATCH v3 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17232-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.935];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6FDDB1A19FC
X-Rspamd-Action: no action

Replace vma_start_write() with vma_start_write_killable() when
process_vma_walk_lock() is used with PGWALK_WRLOCK option.
Adjust its direct and indirect users to check for a possible error
and handle it. Ensure users handle EINTR correctly and do not ignore
it.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/s390/kvm/kvm-s390.c |  2 +-
 fs/proc/task_mmu.c       |  5 ++++-
 mm/mempolicy.c           | 14 +++++++++++---
 mm/pagewalk.c            | 20 ++++++++++++++------
 mm/vma.c                 | 22 ++++++++++++++--------
 mm/vma.h                 |  6 ++++++
 6 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 7a175d86cef0..337e4f7db63a 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -2948,7 +2948,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		}
 		/* must be called without kvm->lock */
 		r = kvm_s390_handle_pv(kvm, &args);
-		if (copy_to_user(argp, &args, sizeof(args))) {
+		if (r != -EINTR && copy_to_user(argp, &args, sizeof(args))) {
 			r = -EFAULT;
 			break;
 		}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e091931d7ca1..1238a2988eb6 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1797,6 +1797,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 		struct clear_refs_private cp = {
 			.type = type,
 		};
+		int err;
 
 		if (mmap_write_lock_killable(mm)) {
 			count = -EINTR;
@@ -1824,7 +1825,9 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 						0, mm, 0, -1UL);
 			mmu_notifier_invalidate_range_start(&range);
 		}
-		walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
+		err = walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
+		if (err < 0)
+			count = err;
 		if (type == CLEAR_REFS_SOFT_DIRTY) {
 			mmu_notifier_invalidate_range_end(&range);
 			flush_tlb_mm(mm);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 90939f5bde02..3c8b3dfc9c56 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -988,6 +988,8 @@ queue_pages_range(struct mm_struct *mm, unsigned long start, unsigned long end,
 			&queue_pages_lock_vma_walk_ops : &queue_pages_walk_ops;
 
 	err = walk_page_range(mm, start, end, ops, &qp);
+	if (err == -EINTR)
+		return err;
 
 	if (!qp.first)
 		/* whole range in hole */
@@ -1309,9 +1311,14 @@ static long migrate_to_node(struct mm_struct *mm, int source, int dest,
 				      flags | MPOL_MF_DISCONTIG_OK, &pagelist);
 	mmap_read_unlock(mm);
 
+	if (nr_failed == -EINTR)
+		err = nr_failed;
+
 	if (!list_empty(&pagelist)) {
-		err = migrate_pages(&pagelist, alloc_migration_target, NULL,
-			(unsigned long)&mtc, MIGRATE_SYNC, MR_SYSCALL, NULL);
+		if (!err)
+			err = migrate_pages(&pagelist, alloc_migration_target,
+					    NULL, (unsigned long)&mtc,
+					    MIGRATE_SYNC, MR_SYSCALL, NULL);
 		if (err)
 			putback_movable_pages(&pagelist);
 	}
@@ -1611,7 +1618,8 @@ static long do_mbind(unsigned long start, unsigned long len,
 				MR_MEMPOLICY_MBIND, NULL);
 	}
 
-	if (nr_failed && (flags & MPOL_MF_STRICT))
+	/* Do not mask EINTR */
+	if ((err != -EINTR) && (nr_failed && (flags & MPOL_MF_STRICT)))
 		err = -EIO;
 	if (!list_empty(&pagelist))
 		putback_movable_pages(&pagelist);
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index a94c401ab2cf..dc9f7a7709c6 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -425,14 +425,13 @@ static inline void process_mm_walk_lock(struct mm_struct *mm,
 		mmap_assert_write_locked(mm);
 }
 
-static inline void process_vma_walk_lock(struct vm_area_struct *vma,
+static inline int process_vma_walk_lock(struct vm_area_struct *vma,
 					 enum page_walk_lock walk_lock)
 {
 #ifdef CONFIG_PER_VMA_LOCK
 	switch (walk_lock) {
 	case PGWALK_WRLOCK:
-		vma_start_write(vma);
-		break;
+		return vma_start_write_killable(vma);
 	case PGWALK_WRLOCK_VERIFY:
 		vma_assert_write_locked(vma);
 		break;
@@ -444,6 +443,7 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 		break;
 	}
 #endif
+	return 0;
 }
 
 /*
@@ -487,7 +487,9 @@ int walk_page_range_mm_unsafe(struct mm_struct *mm, unsigned long start,
 			if (ops->pte_hole)
 				err = ops->pte_hole(start, next, -1, &walk);
 		} else { /* inside vma */
-			process_vma_walk_lock(vma, ops->walk_lock);
+			err = process_vma_walk_lock(vma, ops->walk_lock);
+			if (err)
+				break;
 			walk.vma = vma;
 			next = min(end, vma->vm_end);
 			vma = find_vma(mm, vma->vm_end);
@@ -704,6 +706,7 @@ int walk_page_range_vma_unsafe(struct vm_area_struct *vma, unsigned long start,
 		.vma		= vma,
 		.private	= private,
 	};
+	int err;
 
 	if (start >= end || !walk.mm)
 		return -EINVAL;
@@ -711,7 +714,9 @@ int walk_page_range_vma_unsafe(struct vm_area_struct *vma, unsigned long start,
 		return -EINVAL;
 
 	process_mm_walk_lock(walk.mm, ops->walk_lock);
-	process_vma_walk_lock(vma, ops->walk_lock);
+	err = process_vma_walk_lock(vma, ops->walk_lock);
+	if (err)
+		return err;
 	return __walk_page_range(start, end, &walk);
 }
 
@@ -734,6 +739,7 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
 		.vma		= vma,
 		.private	= private,
 	};
+	int err;
 
 	if (!walk.mm)
 		return -EINVAL;
@@ -741,7 +747,9 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
 		return -EINVAL;
 
 	process_mm_walk_lock(walk.mm, ops->walk_lock);
-	process_vma_walk_lock(vma, ops->walk_lock);
+	err = process_vma_walk_lock(vma, ops->walk_lock);
+	if (err)
+		return err;
 	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
 }
 
diff --git a/mm/vma.c b/mm/vma.c
index 9f2664f1d078..46bbad6e64a4 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -998,14 +998,18 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (anon_dup)
 		unlink_anon_vmas(anon_dup);
 
-	/*
-	 * This means we have failed to clone anon_vma's correctly, but no
-	 * actual changes to VMAs have occurred, so no harm no foul - if the
-	 * user doesn't want this reported and instead just wants to give up on
-	 * the merge, allow it.
-	 */
-	if (!vmg->give_up_on_oom)
-		vmg->state = VMA_MERGE_ERROR_NOMEM;
+	if (err == -EINTR) {
+		vmg->state = VMA_MERGE_ERROR_INTR;
+	} else {
+		/*
+		 * This means we have failed to clone anon_vma's correctly,
+		 * but no actual changes to VMAs have occurred, so no harm no
+		 * foul - if the user doesn't want this reported and instead
+		 * just wants to give up on the merge, allow it.
+		 */
+		if (!vmg->give_up_on_oom)
+			vmg->state = VMA_MERGE_ERROR_NOMEM;
+	}
 	return NULL;
 }
 
@@ -1681,6 +1685,8 @@ static struct vm_area_struct *vma_modify(struct vma_merge_struct *vmg)
 	merged = vma_merge_existing_range(vmg);
 	if (merged)
 		return merged;
+	if (vmg_intr(vmg))
+		return ERR_PTR(-EINTR);
 	if (vmg_nomem(vmg))
 		return ERR_PTR(-ENOMEM);
 
diff --git a/mm/vma.h b/mm/vma.h
index eba388c61ef4..fe4560f81f4f 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -56,6 +56,7 @@ struct vma_munmap_struct {
 enum vma_merge_state {
 	VMA_MERGE_START,
 	VMA_MERGE_ERROR_NOMEM,
+	VMA_MERGE_ERROR_INTR,
 	VMA_MERGE_NOMERGE,
 	VMA_MERGE_SUCCESS,
 };
@@ -226,6 +227,11 @@ static inline bool vmg_nomem(struct vma_merge_struct *vmg)
 	return vmg->state == VMA_MERGE_ERROR_NOMEM;
 }
 
+static inline bool vmg_intr(struct vma_merge_struct *vmg)
+{
+	return vmg->state == VMA_MERGE_ERROR_INTR;
+}
+
 /* Assumes addr >= vma->vm_start. */
 static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
 				       unsigned long addr)
-- 
2.53.0.414.gf7e9f6c205-goog


