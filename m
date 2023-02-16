Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED1698BF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNkm1hmFz3fbc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:28:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KnhAt7qu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3m7ztywykdpakmjwftyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KnhAt7qu;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWd4R7nz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:21 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k9-20020a25bec9000000b00944353b6a81so862782ybm.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nnxUMMQI6vT0M/Q5sa1IAaTl/WTbc27CfHmxL3/FviM=;
        b=KnhAt7quYBwXQRhfuSYaJDek4wttI7RDXOOACIL/F63Nz/58eVv03No3Zqh2UIwNdl
         TkKGisyfzRrXImR2jOkU2wcQekf+kt9/XxXIsRoXlqskuIeX6hOhHTNZXgdfaMplle7K
         SAATQyrMS3HXKQy7j0lc9Kc3dK3KueDsfgI8ryy5OQhnNBROeaCbU2Hmg2SLUQOwNbgt
         XwBV7zK7XX+1ClOK24Y2b0Ex8amo9ljLG0ZokYkKzEniw9mpgT07P+84GOQVR154zkPK
         4YJcp2AEGd79KcxB1dsy4RuRGjRlYt9yxaLz/0Wa2WtK7Y2fqnfOErlG1kh3RHBuBBJK
         58yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnxUMMQI6vT0M/Q5sa1IAaTl/WTbc27CfHmxL3/FviM=;
        b=0/2Pj2AIUjpITPEKUaecEpuXvvVx+BgZYsRGyXknjj/bX1cgP4JG0x3HLJ1t7WhSvM
         gAgGyiZzQSUCgPTLPUkXr6hQfMIJg6X9QGG3Mt0yeUPmUhSLflh91NG7gHQBHivzt8Bh
         WtSHhXGEwZtbukbEQxEYw1t08Bzb/lEJ2FPEoL5vYka0CR1CHcHtN6r3VrImiNduUCiy
         yS6X8z7TQFXUaoaJURwxljWW5PI9mPmHGzQsF04jxcA2crPCTg7lyRNxlGrE9UUjppRF
         UwMbSugCNQW1NZL4wFs/t0NzRvTPCy4KsxSyqWv/TCOB04ek5wyVJxpeCi2tNa11ufGh
         54kQ==
X-Gm-Message-State: AO0yUKX1LIRfsHfnu1ubeeOOBr0lceDBFllB3daQ7rFGt4vDCs5JRU3H
	Z02KEBEyjnMDQc9gJ+kMmsg0jiXIZzs=
X-Google-Smtp-Source: AK7set+tlzm8noztFtNGPsWUqf3Z7zno+mYjAZ9UmWznIF5F5gJ5LrgX6pBfJhOwGepp15lWUy19j/IuAtc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:a20c:0:b0:52e:f79e:b639 with SMTP id
 w12-20020a81a20c000000b0052ef79eb639mr389199ywg.283.1676524699450; Wed, 15
 Feb 2023 21:18:19 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:25 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-11-surenb@google.com>
Subject: [PATCH v3 10/35] mm: rcu safe VMA freeing
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
index 3fd5305dbbf9..fb4e2afad787 100644
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

