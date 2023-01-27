Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE667EEC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:48:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sn02zr6z3fVK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:48:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=n77zu0oR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=36yjuywykdlikmjwftyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=n77zu0oR;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scs3L2Dz3fJv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:33 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a62-20020a25ca41000000b0080b838a5199so6343375ybg.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDt1g22Fa9gYu2Kb7/F2UNWz7p2znEfhohgEMazkZAE=;
        b=n77zu0oRsJL7OvjwFNjS7T1FAOtu4hdvxpK7kq3XthnUipBv5szcKq0gW6Eh2qWZ+N
         VqA54npBtuI1r6BsRB8yCAVHYO39SuVCqNfhqCm/Ya4OMopwGqTAxzjzqXFTaLEmWefn
         G7d9A2dlsE9NEs9J39+IVmn9jXa2H7iuxd7eUv1r4SdiVN/BsV9E4rX7Fx/7SJnqIKhp
         5pljM+LwjnmUAESpDExSAXXjwcvSQjwdpBA+epV9jtEBYonrLt6ilkcmvKbIgLrFIqhL
         dWwHvu2PRt1rquBCjgEA2IpAdLCPilrM/O5s952uzrtLUUUIX7VUyMYpZs8xK3jyFgDu
         2ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDt1g22Fa9gYu2Kb7/F2UNWz7p2znEfhohgEMazkZAE=;
        b=Z0HmRj591Sa45U8N6NOdIuqMmNFsH1+ZcoBe8c+6us4EdGFtYdRikPJ1uqgrn8BN3T
         DxEeuBXmmDj8MZQf2CFacxJSAklZhuItx0sEw4fv/9hcEL6muPHwfwd1NG5j58VCdpeT
         xojIWWio6hOcWInLyvbUbvTWjuN5VJAYooj9Q3TW17CJZcr8hbUHJnTMuI0ECkRcr5Ul
         CtrJ8Xf8JavdvTxIos2uI+UiI2BaiTy4QyQuwEkh3OFv39pNA7XOaeTEtt4gYabLNJYa
         +l9zDUAom0NsG5iT8pD0dIzv1Cow1NtUqZ1YFBM57LcbGY6krLKdHqY5EPRBmLwmGjvk
         YAUA==
X-Gm-Message-State: AO0yUKWBt/piMxI+pEI1swYpa0e7C4KFXv4Tz6vu6jI7/rDkdJtoBjP6
	/2LcI8ql944q9e0KoxTzp4WWdIEPtmQ=
X-Google-Smtp-Source: AK7set9vKZUOyTcPurWe/bFPJyhfVHuV/nLiUj+ueaBvjKNu+svIA1blUVC8f6GWjxXLSfMUdNgMQcXmD6M=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:354:0:b0:80b:543d:2106 with SMTP id
 81-20020a250354000000b0080b543d2106mr1234365ybd.10.1674848491227; Fri, 27 Jan
 2023 11:41:31 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:44 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-8-surenb@google.com>
Subject: [PATCH v2 07/33] mm: Enable maple tree RCU mode by default.
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@tec
 hsingularity.net, rppt@kernel.org
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
index da983aedb741..8410c3052148 100644
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
index 9d0dadb55e9a..9efe13d36df7 100644
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

