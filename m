Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD64698BE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:26:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNhk1tKPz3fh1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:26:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xo1jDDVi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lrztywykdosfheraotbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xo1jDDVi;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWY1LvDz3chs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:17 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4bdeb1bbeafso8691857b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4opi4a+4wBSqIsfjyFGdOCf+RfFv13YZtxtXh5ocOUM=;
        b=Xo1jDDViHSHN/alioaTDnw+zuoNPKrF9ZLXUf3ea0NE3bXPLl0z7WkGrQUW7AOG0Nr
         J8SsODBneQSeaMKO7nEqhtXELAqyVVzyHag3dRajS0MNlWpB1lyOtsy0oB8MM0CrQEnP
         Moe4iuqLi8ffYInMsJBu3lDYUcEPw1W16t68/pqdVg/PM7yHOfl4JRIe/AAV288dZ063
         0OmpnGUH5/0w4iEIelRXBTS4gWduVmNFBkN/5ItORK5tiSjU8ab3rw3adCz9oFddo8Er
         mGSeo2MZqEM7cxpZTU0mXlOgRPyGjhgPgDiiUmvS//v9NEkdkZgUTyYfpCAeqd0avQoQ
         0u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4opi4a+4wBSqIsfjyFGdOCf+RfFv13YZtxtXh5ocOUM=;
        b=zsjWaRoDnVO7GddJbsxDOdDOlpmXbgg/EFE6CRCly63DAcB0VZH51i6fbyFyaL9y9o
         9Dcm3884oaTaKsdGtS7DuNWKXn5qaZ0eY9Pxsnkiv4M/HUeKbY6oosKR6tyx9+DPuP2L
         ueRsQHkiVXlbJOJICNCy5/N9OjIYXX5zC8J5fL7tZNv3mDirTqRQrr1/z+4cpLxcWFcg
         EvfjdWdLZPbywaRX5qfAxNzLadMab5TVu0dEjO8kvUs5etRP9tGcDXbTpGGc5lBEtDW5
         UT9IFVZkx8lriGoJWI+bYeg0HLlwJq1HGNQZY4cBSwFj96agJw/Wo7gM9Q+zIKRGdQDn
         +Vbg==
X-Gm-Message-State: AO0yUKVtmBiyqdB+YdBzMWP135p3nBAzgIzzq288P1D5z+nil1XDSDh7
	JsSixp0TDIkGGHiXWPDWA0sG0Heefr0=
X-Google-Smtp-Source: AK7set+/DgIBDY3hKjRHmWHVe7yByHJ3rZUqgnqz5mohiI9GciRP+9xmqTdnoEyOpn2/QPX/HT0hsnAfle8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:ca:b0:8f2:9e6:47a4 with SMTP id
 i10-20020a05690200ca00b008f209e647a4mr3ybs.7.1676524694561; Wed, 15 Feb 2023
 21:18:14 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:23 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-9-surenb@google.com>
Subject: [PATCH v3 08/35] mm: Enable maple tree RCU mode by default.
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-ker
 nel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

Use the maple tree in RCU mode for VMA tracking.  This is necessary for
the use of per-VMA locking.  RCU mode is enabled by default but disabled
when exiting an mm and for the new tree during a fork.

Also enable RCU for the tree used in munmap operations to ensure the
nodes remain valid for readers.

Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 3 ++-
 kernel/fork.c            | 3 +++
 mm/mmap.c                | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3cd60243c625..3fd5305dbbf9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -768,7 +768,8 @@ struct mm_struct {
 	unsigned long cpu_bitmap[];
 };
 
-#define MM_MT_FLAGS	(MT_FLAGS_ALLOC_RANGE | MT_FLAGS_LOCK_EXTERN)
+#define MM_MT_FLAGS	(MT_FLAGS_ALLOC_RANGE | MT_FLAGS_LOCK_EXTERN | \
+			 MT_FLAGS_USE_RCU)
 extern struct mm_struct init_mm;
 
 /* Pointer magic because the dynamic array size confuses some compilers. */
diff --git a/kernel/fork.c b/kernel/fork.c
index 5e3029ea8e1e..5f23d5e03362 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -617,6 +617,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 	if (retval)
 		goto out;
 
+	mt_clear_in_rcu(vmi.mas.tree);
 	for_each_vma(old_vmi, mpnt) {
 		struct file *file;
 
@@ -700,6 +701,8 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 	retval = arch_dup_mmap(oldmm, mm);
 loop_out:
 	vma_iter_free(&vmi);
+	if (!retval)
+		mt_set_in_rcu(vmi.mas.tree);
 out:
 	mmap_write_unlock(mm);
 	flush_tlb_mm(oldmm);
diff --git a/mm/mmap.c b/mm/mmap.c
index 20f21f0949dd..06c0f6686de8 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2277,7 +2277,8 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	int count = 0;
 	int error = -ENOMEM;
 	MA_STATE(mas_detach, &mt_detach, 0, 0);
-	mt_init_flags(&mt_detach, MT_FLAGS_LOCK_EXTERN);
+	mt_init_flags(&mt_detach, vmi->mas.tree->ma_flags &
+		      (MT_FLAGS_LOCK_MASK | MT_FLAGS_USE_RCU));
 	mt_set_external_lock(&mt_detach, &mm->mmap_lock);
 
 	/*
@@ -3042,6 +3043,7 @@ void exit_mmap(struct mm_struct *mm)
 	 */
 	set_bit(MMF_OOM_SKIP, &mm->flags);
 	mmap_write_lock(mm);
+	mt_clear_in_rcu(&mm->mm_mt);
 	free_pgtables(&tlb, &mm->mm_mt, vma, FIRST_USER_ADDRESS,
 		      USER_PGTABLES_CEILING);
 	tlb_finish_mmu(&tlb);
-- 
2.39.1

