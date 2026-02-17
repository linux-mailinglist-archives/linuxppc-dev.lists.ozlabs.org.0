Return-Path: <linuxppc-dev+bounces-16909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHiRI1WYlGlAFwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8714E39E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFlYq1bCcz3bq4;
	Wed, 18 Feb 2026 03:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1249"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771345983;
	cv=none; b=PVpTsppZCtAztwZQmN52WR0D0aZSoJKx5fM6FN/u8mzHLP1sxOeGYT36xOVvo9N3DLFebR6Jn/UWV2U+RXN7DMzb7sd8ImhCAojkzYRzncWVq0ynHp8iGR63BbpC5MqGpFk/Khq4dkgI4W22082Lm413QbKr1lfyWKQehD5cSj79uJ7+E3auq7RfnE6PSn54PvqQuqL+0YSuP1r71689RojumrZypRE76Q1DkiDbOOejZvMHk4LydFizfFWBkSuDdKGKQ0FcFA/WYDqY3/J3UtsW8G0VXFAvuwCt6kGyogCkGm/ADO0HilE+zqfElekb6Hkn68KQcPZMfLKifyDTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771345983; c=relaxed/relaxed;
	bh=Z9Ark9R30Qkzih8r6uy5tMYPv262iFz804WfSXpH0hs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IG0y7sovsdv5ZG8yDGdqxWB96IC5RdLvvH2MOQevtecxjehe92mJhZPgN1PZCJmh0YAUG7N9Zg333pKxc5/cFoTX0zkmsjfnECbU7N4aGTnyhKvUsw4MJwGKGyCUy9VtDuW74ogRBtRcxtB1XVCubyjEpk5DdndT48AhMdGnWAWiT8GIL5EeE4UerolLuG+UMgDdYfkrGLcg0zpdXbrzc+7I27Sn9uQl6sozQP6CNK2VCXYAPGvMWql5ftsVVRvUNtr1zwC2aUioxxGAjKnuHKra8H2lF+zXURaMx9TrssHO0GHj6GZ0yD25j7P8eCCpVeWRJdQ9q0Je5/oDbLsfjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eMOiGPnv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1249; helo=mail-dl1-x1249.google.com; envelope-from=3pjiuaqykdbmbdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eMOiGPnv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1249; helo=mail-dl1-x1249.google.com; envelope-from=3pjiuaqykdbmbdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1249.google.com (mail-dl1-x1249.google.com [IPv6:2607:f8b0:4864:20::1249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFlYp2s5Rz3bpL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 03:33:02 +1100 (AEDT)
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12721cd1a2aso3728680c88.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 08:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771345981; x=1771950781; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9Ark9R30Qkzih8r6uy5tMYPv262iFz804WfSXpH0hs=;
        b=eMOiGPnvwEI5kNAABZ31NTJxv7/R4EeApRzCniB1/+RL++CeVL637ydPbqJvT69GUH
         OMRYoAmslElcKS+rGm1xQpwu6DihNYphV6QJ1xkXnHANNs7Z52JmQQwpDlYzPnOLQZnF
         Ftg3DIMzPcxaAmFumHr0yS9fdhh17fkAGEzEd665UYjYza+a5pXXbYnu7rl7uvmrsMRa
         au7TdBb9gaiSV7M72p3N9+sABIC5gPNpSmZ12QwfL6Znx0x1IRt1LQuePumuqZLWjFnG
         h6HBFUIDlSXoKUipUaUIulzCDNLfJ9OxsRr5M5Ax9zSIQ0J8+fkiF4HjBibXMwGEwlnl
         PP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345981; x=1771950781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9Ark9R30Qkzih8r6uy5tMYPv262iFz804WfSXpH0hs=;
        b=KcrQI8lP9pqI0ayTZHeCLRon8aLhhDj4zV0LzYeN92sYybmb8qcwppWt/XnChb4gV8
         5Ni1kQLYv2ynRuOHs4GFLZ1jSuZA15uIrRSfLCJuph/1OEuoPCUaIh1aGz/qS9TDl88e
         pdLbqQ6dXP1eO4Af1zFwBPo21BTgolX7zCM0Qe7aN1Pp82eEe0BAHdqqGOfejZzUAVyv
         BoeNZhpREItSssEl/FWuH6tZLx4loxAwbcvNMuCSmNBgq7LVyN3Q2JFQgFHvsOB8LPtx
         SQek39rfFgK63ywpd5MLxepXRcPJUUvt81nN5BIKRmY26W0YjZtJCQEf9mrd//eU7Ial
         habw==
X-Forwarded-Encrypted: i=1; AJvYcCWYzcLs1fbx8kYGDySwrMg7PoEDLk5rY7I915V5QacY1c0lS5C9GBBwAVkXoX/xoMADUhImj5ZTQSBEw2c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysF3x4wzadX2xvJsvtZXuirz6yDC3XGvcJ+MuUUXc4Q3SEoBWG
	wz4YWKVuyVRHBfNQZZlvJBaS/Llm5TGV6TeVKFgi3bJ+hyRoQKMIe1ycqo3BkktM3nHDlUpd4nh
	H++Oqug==
X-Received: from dlbvt13.prod.google.com ([2002:a05:7022:3f8d:b0:119:49ca:6bae])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:250e:b0:11d:f440:b743
 with SMTP id a92af1059eb24-1273adf34c5mr6016405c88.7.1771345980160; Tue, 17
 Feb 2026 08:33:00 -0800 (PST)
Date: Tue, 17 Feb 2026 08:32:50 -0800
In-Reply-To: <20260217163250.2326001-1-surenb@google.com>
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
References: <20260217163250.2326001-1-surenb@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260217163250.2326001-4-surenb@google.com>
Subject: [PATCH v2 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16909-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 03A8714E39E
X-Rspamd-Action: no action

Replace vma_start_write() with vma_start_write_killable() when
process_vma_walk_lock() is used with PGWALK_WRLOCK option.
Adjust its direct and indirect users to check for a possible error
and handle it.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/s390/kvm/kvm-s390.c |  5 +++--
 arch/s390/mm/gmap.c      | 13 ++++++++++---
 fs/proc/task_mmu.c       |  7 ++++++-
 mm/pagewalk.c            | 20 ++++++++++++++------
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 56a50524b3ee..75aef9c66e03 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -958,6 +958,7 @@ static int kvm_s390_get_mem_control(struct kvm *kvm, struct kvm_device_attr *att
 static int kvm_s390_set_mem_control(struct kvm *kvm, struct kvm_device_attr *attr)
 {
 	int ret;
+	int err;
 	unsigned int idx;
 	switch (attr->attr) {
 	case KVM_S390_VM_MEM_ENABLE_CMMA:
@@ -990,10 +991,10 @@ static int kvm_s390_set_mem_control(struct kvm *kvm, struct kvm_device_attr *att
 		VM_EVENT(kvm, 3, "%s", "RESET: CMMA states");
 		mutex_lock(&kvm->lock);
 		idx = srcu_read_lock(&kvm->srcu);
-		s390_reset_cmma(kvm->arch.gmap->mm);
+		err = s390_reset_cmma(kvm->arch.gmap->mm);
 		srcu_read_unlock(&kvm->srcu, idx);
 		mutex_unlock(&kvm->lock);
-		ret = 0;
+		ret = (err < 0) ? err : 0;
 		break;
 	case KVM_S390_VM_MEM_LIMIT_SIZE: {
 		unsigned long new_limit;
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index dd85bcca817d..96054b124db5 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2271,6 +2271,7 @@ int s390_enable_skey(void)
 {
 	struct mm_struct *mm = current->mm;
 	int rc = 0;
+	int err;
 
 	mmap_write_lock(mm);
 	if (mm_uses_skeys(mm))
@@ -2282,7 +2283,9 @@ int s390_enable_skey(void)
 		mm->context.uses_skeys = 0;
 		goto out_up;
 	}
-	walk_page_range(mm, 0, TASK_SIZE, &enable_skey_walk_ops, NULL);
+	err = walk_page_range(mm, 0, TASK_SIZE, &enable_skey_walk_ops, NULL);
+	if (err < 0)
+		rc = err;
 
 out_up:
 	mmap_write_unlock(mm);
@@ -2305,11 +2308,15 @@ static const struct mm_walk_ops reset_cmma_walk_ops = {
 	.walk_lock		= PGWALK_WRLOCK,
 };
 
-void s390_reset_cmma(struct mm_struct *mm)
+int s390_reset_cmma(struct mm_struct *mm)
 {
+	int err;
+
 	mmap_write_lock(mm);
-	walk_page_range(mm, 0, TASK_SIZE, &reset_cmma_walk_ops, NULL);
+	err = walk_page_range(mm, 0, TASK_SIZE, &reset_cmma_walk_ops, NULL);
 	mmap_write_unlock(mm);
+
+	return (err < 0) ? err : 0;
 }
 EXPORT_SYMBOL_GPL(s390_reset_cmma);
 
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index d7d52e259055..91e806d65bd9 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1797,6 +1797,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 		struct clear_refs_private cp = {
 			.type = type,
 		};
+		int err;
 
 		if (mmap_write_lock_killable(mm)) {
 			count = -EINTR;
@@ -1824,7 +1825,11 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 						0, mm, 0, -1UL);
 			mmu_notifier_invalidate_range_start(&range);
 		}
-		walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
+		err = walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
+		if (err < 0) {
+			count = err;
+			goto out_unlock;
+		}
 		if (type == CLEAR_REFS_SOFT_DIRTY) {
 			mmu_notifier_invalidate_range_end(&range);
 			flush_tlb_mm(mm);
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
 
-- 
2.53.0.273.g2a3d683680-goog


