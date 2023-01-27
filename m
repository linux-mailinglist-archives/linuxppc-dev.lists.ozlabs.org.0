Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D967EEC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sq118HXz3fMw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:50:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oFyOjlhE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=37yjuywykdlyoqnajxckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oFyOjlhE;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scy1lcsz3fHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:38 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso6355041yba.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu9/mdu38G6WtBjXb6Do7xpUyt6CdrDbmAUDhoyp47k=;
        b=oFyOjlhEa6jPD1d+pKzu8xqMu9sShcBJM0zkcdXAO9bWZHfs5hDegJ8sEKWFr4AQNl
         iGPCIH7iC8aR5RiIjRoH9W2KUncZPWl0b5vsJXQEB2UE60mYiP5ldYuNlEW3dM96CgJp
         +2KdvoCyVN7G6APzAMKWAfXHTUhAA+JaJZhJgfnGwlr68Zr0GLZrYj2YnOQkKo96sWGj
         Ng0DOWnRANnP+XQns5edhVeWyYl+9EdfDgkHbYKOkVF++Ku/0IaWanDTI7HqCQuL/w5R
         edw8ZGqmSQJCCmVgs5lV30HhGrOZqx2K3qMJgNbHCqjkT1CdH2dJNnKk0QEKLZZ9jCPS
         y7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu9/mdu38G6WtBjXb6Do7xpUyt6CdrDbmAUDhoyp47k=;
        b=zWSEFPkfGKjr8b55byTWKWml9e/WrF4ewjPTUGh6PJItyUJHFIcvwgbuy2z9+FoDv3
         7MjGE6w74eVsMQgZWOKcQQTjivcXvs+9Lxwrg+a6GXSwiE/zIElaqMeEUInbgoVSSM5H
         t/NuO13XYffXY+dirB6JU0liLIzNB5Uvw/igmYoC87T4/iHI/iXpAqXG3oXp2u2VJJRi
         vlW/P3i3KjAhfSsl7XYT+YiXL33Ejeta1Sh3AUwj/1d07dMz3Z2/46Y1xLkwhRNgUukk
         n12qGF/JagOgJLxZcTvFVKBHCo/NNHtyFxo1Xnm5nkAEsSUpsJwp5kUna898efngPZnd
         MmfA==
X-Gm-Message-State: AFqh2krTJBwNFM7OLaIcttZcOqQe9ueEzkHBjnaZbh8DdcLkw9s9YMQq
	Yq2ZL5bjcW4wFwNJOssoXL75+TMnAHE=
X-Google-Smtp-Source: AMrXdXtMMT5r56SGjlxKGvDbQirEmfUIu1ilIQcv1/3wi/4TSk/ascWeVtYTcuwkoFwuriGWfFUnQoKWHlg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:cdc7:0:b0:4df:f712:5d57 with SMTP id
 p190-20020a0dcdc7000000b004dff7125d57mr3818080ywd.303.1674848495850; Fri, 27
 Jan 2023 11:41:35 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:46 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-10-surenb@google.com>
Subject: [PATCH v2 09/33] mm: rcu safe VMA freeing
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

From: Michel Lespinasse <michel@lespinasse.org>

This prepares for page faults handling under VMA lock, looking up VMAs
under protection of an rcu read lock, instead of the usual mmap read lock.

Signed-off-by: Michel Lespinasse <michel@lespinasse.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 13 ++++++++++---
 kernel/fork.c            | 20 +++++++++++++++++++-
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 8410c3052148..62e413f84011 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -480,9 +480,16 @@ struct anon_vma_name {
 struct vm_area_struct {
 	/* The first cache line has the info for VMA tree walking. */
 
-	unsigned long vm_start;		/* Our start address within vm_mm. */
-	unsigned long vm_end;		/* The first byte after our end address
-					   within vm_mm. */
+	union {
+		struct {
+			/* VMA covers [vm_start; vm_end) addresses within mm */
+			unsigned long vm_start;
+			unsigned long vm_end;
+		};
+#ifdef CONFIG_PER_VMA_LOCK
+		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
+#endif
+	};
 
 	struct mm_struct *vm_mm;	/* The address space we belong to. */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 5f23d5e03362..314d51eb91da 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -479,12 +479,30 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
-void vm_area_free(struct vm_area_struct *vma)
+static void __vm_area_free(struct vm_area_struct *vma)
 {
 	free_anon_vma_name(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static void vm_area_free_rcu_cb(struct rcu_head *head)
+{
+	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
+						  vm_rcu);
+	__vm_area_free(vma);
+}
+#endif
+
+void vm_area_free(struct vm_area_struct *vma)
+{
+#ifdef CONFIG_PER_VMA_LOCK
+	call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
+#else
+	__vm_area_free(vma);
+#endif
+}
+
 static void account_kernel_stack(struct task_struct *tsk, int account)
 {
 	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
-- 
2.39.1

