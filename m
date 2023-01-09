Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE4663222
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRDr1w2yz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:01:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Czdnd0b+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=35n68ywykdpktvsfochpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Czdnd0b+;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4m6P7hz3cFJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:00 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso2256055ybr.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TT+2XsH00KwTX585kTrU5AriHJozMAXcs0iFxeAd0aM=;
        b=Czdnd0b+5bkyGxVk+9aViJOW1TJ5m6k5XpyXdj4R+Q3dGGEBK2eP5deQvySgSh0iz/
         GZ1iYooFrZ5CipGLrqMEQsrY/Zn4kUyQA8m4xIFN7mfEerPKCDkU1AubZLdIfDfth4hu
         d8dG+6QDcTUs7A9Y052NxeL9TA5a3QdfxlEt4CBoSlbUsLAUBEORkFyS1sdo7qsKHieD
         EXHjCZRBRMhYEWoMQiXcySJyrWxVf33iALFZt6xsCbFcNo15dZaOnJt+J48Z17ETAj7O
         45DKwd6DY6kCK0yPohqOb3E3TN0P5VYKNR4qSRkuKInUqGltfhkGbi1MmOGm2N8pUB+H
         +TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TT+2XsH00KwTX585kTrU5AriHJozMAXcs0iFxeAd0aM=;
        b=kHvsvGoKI/xg4+TbhOH8WFJabW9AobON8R83Qg9n58Ei3BnrWJcwYqA1rHm6F2AE0J
         uvKmIudrkw8X11BN9NIT4LGWNW9wucFZN309xE8RYyRd3QqhFgR3X1Zr6jNQf2SQvHp6
         OMTKZeZ/YJtKdW8zg0bb1C+F8sCPK0hCyAICo15dhmIWh12Y84ug/PbHAwVZWtdlej9D
         xZL4CR0upPGCHuTyrkmi0C2UyFJO/yCmUREws0pKTalr0D9Q+1rzLDcmTHF88x0fwobS
         rTK6Lilvpn62WLGtujz+DAKYm70ois/0A+OIThvlp9R83hH9893c7MoSdINHcTGITxk2
         WMTw==
X-Gm-Message-State: AFqh2kojP0seEJMtLlJLo64nvDlNKpaFgXpG6Y2VhDEgULh2VxUz199q
	9J8CYaVE9YLItaBNcuLS+36DwSfQOTw=
X-Google-Smtp-Source: AMrXdXtUN3SiDpbjRFPvhoNJBXB5uM1KkpI6Zcz0Naqt9m0yZDl1B9u4vz5wIeviZulbrZU/bcJYjep5MGE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:abea:0:b0:762:b86:e82e with SMTP id
 v97-20020a25abea000000b007620b86e82emr7288109ybi.407.1673297638462; Mon, 09
 Jan 2023 12:53:58 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:02 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-8-surenb@google.com>
Subject: [PATCH 07/41] mm: Enable maple tree RCU mode by default.
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.co
 m, mgorman@techsingularity.net
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
index 3b8475007734..4b6bce73fbb4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -810,7 +810,8 @@ struct mm_struct {
 	unsigned long cpu_bitmap[];
 };
 
-#define MM_MT_FLAGS	(MT_FLAGS_ALLOC_RANGE | MT_FLAGS_LOCK_EXTERN)
+#define MM_MT_FLAGS	(MT_FLAGS_ALLOC_RANGE | MT_FLAGS_LOCK_EXTERN | \
+			 MT_FLAGS_USE_RCU)
 extern struct mm_struct init_mm;
 
 /* Pointer magic because the dynamic array size confuses some compilers. */
diff --git a/kernel/fork.c b/kernel/fork.c
index 9f7fe3541897..58aab6c889a4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -617,6 +617,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 	if (retval)
 		goto out;
 
+	mt_clear_in_rcu(mas.tree);
 	mas_for_each(&old_mas, mpnt, ULONG_MAX) {
 		struct file *file;
 
@@ -703,6 +704,8 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 	retval = arch_dup_mmap(oldmm, mm);
 loop_out:
 	mas_destroy(&mas);
+	if (!retval)
+		mt_set_in_rcu(mas.tree);
 out:
 	mmap_write_unlock(mm);
 	flush_tlb_mm(oldmm);
diff --git a/mm/mmap.c b/mm/mmap.c
index 87d929316d57..9db37adfc00a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2304,7 +2304,8 @@ do_mas_align_munmap(struct ma_state *mas, struct vm_area_struct *vma,
 	int count = 0;
 	int error = -ENOMEM;
 	MA_STATE(mas_detach, &mt_detach, 0, 0);
-	mt_init_flags(&mt_detach, MT_FLAGS_LOCK_EXTERN);
+	mt_init_flags(&mt_detach, mas->tree->ma_flags &
+		      (MT_FLAGS_LOCK_MASK | MT_FLAGS_USE_RCU));
 	mt_set_external_lock(&mt_detach, &mm->mmap_lock);
 
 	if (mas_preallocate(mas, vma, GFP_KERNEL))
@@ -3091,6 +3092,7 @@ void exit_mmap(struct mm_struct *mm)
 	 */
 	set_bit(MMF_OOM_SKIP, &mm->flags);
 	mmap_write_lock(mm);
+	mt_clear_in_rcu(&mm->mm_mt);
 	free_pgtables(&tlb, &mm->mm_mt, vma, FIRST_USER_ADDRESS,
 		      USER_PGTABLES_CEILING);
 	tlb_finish_mmu(&tlb);
-- 
2.39.0

