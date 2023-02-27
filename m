Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D96A48B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:57:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSr310SYz3fdP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FEvdPkue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3wer8ywykdeg241oxlqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FEvdPkue;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPP4vF8z3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:29 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536a5a0b6e3so155617917b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=arZZ82aLoZGzTODI4V3Ds+XnXRSv5CvpGtFg8O7kSHU=;
        b=FEvdPkuedKMzzGsmheGWPizHKb0nGjYHVNnx+9kAk6JWaGUBiX99d1Bv/O2GM6XSSl
         gB8+ecHQ4IjEhzwJPfml0bM5L6LYZ2SwUORgwjGkuiwqlRjsYJT4KPxwzw1UlC60m4aZ
         A90w9fKe9n+yvmErALp7FrbdpDMG/bmb9rYVdsVvHwUyt0atMOUCv41ig6x8R+tdHGZS
         c/nc1AnKLbHyXNdSxCybAre4lyR5J1UNPqZOtvyqt/5yJckeBvBSk6OPvMXjo6UK2C1R
         s7BFEuIEED1IHyyqkGYjy7EtZvl+QTa1y4yJouRGAzmHG8rSxuivFT0pWoYd4Spinq1k
         BQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=arZZ82aLoZGzTODI4V3Ds+XnXRSv5CvpGtFg8O7kSHU=;
        b=j69kT3RKhI7CCe30Q/PLMdcNZopD5GZ95wfFUgLELoacHaXHkY2r/XLWTfX2S3jQwr
         l7o45xTlMR5ydfl6Hp2Bw6KXl64RvgjZZ2oi+pdWCdT9m8HQWcY36jpUZ/JafDM2lToL
         Na743Zps6/2DtqVi9IrwUAXJT1YmRrovbH7jzofZUh7K3glNl0VpYP/hKFHP0wUi68W1
         22SIb7YginyW3h0BqNZwhLZ/JSwvjwGz3NEUq0TKOwuVD223jbRh1i0Dl4thx36I+WeP
         IM38FLTBP2Pnb0dnBh0QJik8KjKn9hRV1rGuSphrkDrBn8zFZjRNNeprDG6tYbm0Fdsq
         je2Q==
X-Gm-Message-State: AO0yUKUDwNtuOlIgG65iaUdSaYCHRL5LBcMoj8Ut1cGC4dVbXZ7aIgZz
	smWf4IIMv68zgdcXvQDI6bxU8itZXF0=
X-Google-Smtp-Source: AK7set/UVPuqJo669/ldHphDhViQWe/utENdYlZ/T7NeJi51KLkDK1GElSVGwaBDs6B97rQ0tmz39GqO0ZQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a81:ac68:0:b0:535:18be:4126 with SMTP id
 z40-20020a81ac68000000b0053518be4126mr10693031ywj.6.1677519449031; Mon, 27
 Feb 2023 09:37:29 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:21 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-23-surenb@google.com>
Subject: [PATCH v4 22/33] mm: introduce vma detached flag
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
index 3d5e8666892d..895bb3950e8a 100644
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
index a4e7493bacd7..45a219d33c6b 100644
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
index b947d82e8522..df13c33498db 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -600,6 +600,7 @@ static inline void vma_complete(struct vma_prepare *vp,
 
 	if (vp->remove) {
 again:
+		vma_mark_detached(vp->remove, true);
 		if (vp->file) {
 			uprobe_munmap(vp->remove, vp->remove->vm_start,
 				      vp->remove->vm_end);
@@ -2261,6 +2262,7 @@ static inline int munmap_sidetree(struct vm_area_struct *vma,
 	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
 		return -ENOMEM;
 
+	vma_mark_detached(vma, true);
 	if (vma->vm_flags & VM_LOCKED)
 		vma->vm_mm->locked_vm -= vma_pages(vma);
 
-- 
2.39.2.722.g9855ee24e9-goog

