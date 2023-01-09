Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECACE663299
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:18:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRct63btz3fgV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k/y/f651;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3fn-8ywykdcszbyluinvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k/y/f651;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5j4rpYz3chQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:49 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id s2-20020a056a00178200b005810f057e7cso4003506pfg.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7MiPLggwHMt078/i5i4Bbk0h7mxL/B1TX4Loq0bJkA=;
        b=k/y/f651ouIVm5VYXSBuN3WGA3r0siHAwbforN7cl7XldyaXSobuMoKnfRbHsUp2Zw
         mT4Fy24gz9zLv4V1qPdlGMDZmt4uQYDL7SMguN64hvgl+OPwnYaemI3hYYgdYfqYy2ZE
         RZpsDEbxomOp03K+XTMpAlOj5/FuHalix+oD7gvliXvyOvoSifjWwtoSfq337yDgZBWx
         NsM/wn5sH1zgbh2ZxdX6VDsXj4dH/jKa39D017jsbV+IQ14YXnxgSRRt8KTb8ppwgMfm
         uVAI77HN37Vy1v+4HMEL/4fAI+3c+Ki/ub6d+F+N4Xj5NK0ZJDRKlJXLfRFrsnczSTJ7
         ObUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7MiPLggwHMt078/i5i4Bbk0h7mxL/B1TX4Loq0bJkA=;
        b=tB/LqCba9q/HFnK6juvNtDfuk2Onj8ZnShuF8fRV0Ijd12XxIUqYOdZS/c8wrM6yVs
         AYk66gNFydBb+1u8yJiF/sFOZHeA/R1KC5C+voMQsAioKGhyHmKtx9F1iCZlyi/OByl7
         hy8/883B6k1WpfJImQcmboCLZU8Uu7GCGKOpVmc6rcqIQxlnX1b/y/jQBZQvQqh0nHIe
         +A5ekkKVnNh1ZDDhyCIQjch5KB2QaCjT+93ffUs15sZVXob1FTySHLvv9P82q1a4rrkK
         6vEF3qmlmtJymzMgPRBtB1rUbXjhgNyUVWyhmDAo0wuVSJ9ZembrSbbmKCekIADDxU/v
         ltdw==
X-Gm-Message-State: AFqh2koujZdhRzXMAf4HfEtSFU0/tq6qgIf+C9NRpNjZvT4NDX3TljzH
	UIPpDGyHlu4ZwmoZ7eECU9v4QEJi0zo=
X-Google-Smtp-Source: AMrXdXscxn+TZfW1mPWgpj2/8Haqh4tY58OgT8gYBU0unalxDUYH6+O0E4BOyMrkarY33KKQg8fQ3JxSbTo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:902:8e88:b0:190:becc:7e76 with SMTP id
 bg8-20020a1709028e8800b00190becc7e76mr6134633plb.1.1673297686693; Mon, 09 Jan
 2023 12:54:46 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:21 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-27-surenb@google.com>
Subject: [PATCH 26/41] kernel/fork: assert no VMA readers during its destruction
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Assert there are no holders of VMA lock for reading when it is about to be
destroyed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 8 ++++++++
 kernel/fork.c      | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 594e835bad9c..c464fc8a514c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -680,6 +680,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
 }
 
+static inline void vma_assert_no_reader(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
+		      vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
+		      vma);
+}
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
@@ -688,6 +695,7 @@ static inline bool vma_read_trylock(struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_read_unlock(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
+static inline void vma_assert_no_reader(struct vm_area_struct *vma) {}
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 1591dd8a0745..6d9f14e55ecf 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -485,6 +485,8 @@ static void __vm_area_free(struct rcu_head *head)
 {
 	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
 						  vm_rcu);
+	/* The vma should either have no lock holders or be write-locked. */
+	vma_assert_no_reader(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 #endif
-- 
2.39.0

