Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F170698C35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP1V1xHcz3g5k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:40:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e8FcGNDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3vlztywykdbmbdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e8FcGNDH;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXH0Nwyz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:55 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p83-20020a25d856000000b0095d2ada3d26so832760ybg.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u26HcyQZUssNB/wvgmnc8FNLt5Bjt6C27EcCpLSHQ2I=;
        b=e8FcGNDH5VkVzBTYRblbtAQ0+ZP2ugsPFuxmDPyoQXwVKDnKFUyAPJn/SJMrsaQ1Ia
         jo+Cd4OdGYV2adIa7Ps1WdQQvf3M0XkBbQCS2vH4hvx3mR4XIU6AeYNJ4fgFw+1soX5Z
         Pa1xM0MUFfbg6JS2S95T1SCUKSw+S8anZTC0et5KKeuEZZM6kRmGtxME3D+du+nzcvgG
         qzTaGZDic4CCJCQNQmsvjPxTw8HSPKOmRJrMlp7St/TdGbLlhdx8Vn9wPFTpNdXttF8Q
         VA64i9yGakw2MEWw1P/yGjLggzJzYv4qMjifZYLSh4iksjXsYnlNyRAbe89au2hayYpB
         yYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u26HcyQZUssNB/wvgmnc8FNLt5Bjt6C27EcCpLSHQ2I=;
        b=LR+2oCmk+b2MNn5BribT5M4pxXcbadGzDrCbhX0q4IniZRxncMCO95Y3oT5B9LQAzM
         UOxBmkEYjwWRMvPnK2fI1iLtapja8jd5IUtorDr/byM0Y/Ee3eo4m0nbuPlxaW1DKjJ3
         afVU2UFfIitj+o6JBc7hkVnkdAF2xwup3qHpgdLxdfrPegAjCcekEogMExyoj7qBIJam
         N3x6RCfi2w5Px4l0LlSQexFShQ+W1C/UJLDwlE4xZYx/4fij9jvlsgZJmFTuRXIeZP1w
         Y5aZlHOEjYTwpdA6CpL0glZ9YaRdOiLciOSRYtQPAONbRYH1kIc85RjdkZJhPPz698VN
         jsJw==
X-Gm-Message-State: AO0yUKXVFiLcoXF7r4P+3lyf8depuYUjQFBpRaI9j4S6kPaF0FCNsWqb
	K8ivnWAh4a5pb65+EvcXTmdXsdnEnbw=
X-Google-Smtp-Source: AK7set8LRdaZWnTNJXEEL+5OavvLJg+SJ7ELgpuDSzdI0PbEuUZjWdo/eOURR51UCivz1X36gI0P4ir+qmc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:114f:b0:855:fdcb:4467 with SMTP id
 p15-20020a056902114f00b00855fdcb4467mr31ybu.0.1676524732481; Wed, 15 Feb 2023
 21:18:52 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:39 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-25-surenb@google.com>
Subject: [PATCH v3 24/35] mm: introduce vma detached flag
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

Per-vma locking mechanism will search for VMA under RCU protection and
then after locking it, has to ensure it was not removed from the VMA
tree after we found it. To make this check efficient, introduce a
vma->detached flag to mark VMAs which were removed from the VMA tree.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 11 +++++++++++
 include/linux/mm_types.h |  3 +++
 mm/mmap.c                |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f4f702224ec5..3f98344f829c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -693,6 +693,14 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
 }
 
+static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
+{
+	/* When detaching vma should be write-locked */
+	if (detached)
+		vma_assert_write_locked(vma);
+	vma->detached = detached;
+}
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
@@ -701,6 +709,8 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
+static inline void vma_mark_detached(struct vm_area_struct *vma,
+				     bool detached) {}
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
@@ -712,6 +722,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
+	vma_mark_detached(vma, false);
 	vma_init_lock(vma);
 }
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e268723eaf44..939f4f5a1115 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -511,6 +511,9 @@ struct vm_area_struct {
 #ifdef CONFIG_PER_VMA_LOCK
 	int vm_lock_seq;
 	struct rw_semaphore lock;
+
+	/* Flag to indicate areas detached from the mm->mm_mt tree */
+	bool detached;
 #endif
 
 	/*
diff --git a/mm/mmap.c b/mm/mmap.c
index 801608726be8..adf40177e68f 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -593,6 +593,7 @@ static inline void vma_complete(struct vma_prepare *vp,
 
 	if (vp->remove) {
 again:
+		vma_mark_detached(vp->remove, true);
 		if (vp->file) {
 			uprobe_munmap(vp->remove, vp->remove->vm_start,
 				      vp->remove->vm_end);
@@ -2267,6 +2268,7 @@ static inline int munmap_sidetree(struct vm_area_struct *vma,
 	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
 		return -ENOMEM;
 
+	vma_mark_detached(vma, true);
 	if (vma->vm_flags & VM_LOCKED)
 		vma->vm_mm->locked_vm -= vma_pages(vma);
 
-- 
2.39.1

