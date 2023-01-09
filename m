Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CC663228
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRH10qzhz3fQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=plHU/zWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::249; helo=mail-oi1-x249.google.com; envelope-from=36368ywykdp4y0xkthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=plHU/zWr;
	dkim-atps=neutral
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com [IPv6:2607:f8b0:4864:20::249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4t4P7jz3cHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:06 +1100 (AEDT)
Received: by mail-oi1-x249.google.com with SMTP id es24-20020a056808279800b003630973475fso3014791oib.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1pZqRdf8jzuIQZRLrMCJmLqIEvbyFYNYfXzudRZz6Y=;
        b=plHU/zWrfFxaQ0yt/JPDRB18eEsMPdd+ZJ4E4yT8T5NRkdKBZYZu2kA11sksr3NXzt
         jDgkb12AloyToG1qepTp/9j3c1S/nL9/sMLfiUGj3EbCeKSxNDyG2Qbnp2R8KUfjKQNu
         1hUjiCYEdhUY2xqldYVyznhCdRudSDrsopmij1IaAdQfZY5giCy+PasuJa7G7ZNci7e/
         L6oXIEMKihljCOjvvq+Mko/UGqlkYlK33Q2p9mFgU8soW7h5CIdjJbM9Bn0dub4CcI+s
         5hJtucAeeWPqjUkI2FPiSFxFnJ3u2uppPiS920i95ViALBCSjuucJs6UET/oQp6p8GLF
         Q6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1pZqRdf8jzuIQZRLrMCJmLqIEvbyFYNYfXzudRZz6Y=;
        b=2NLX3+LbZRR61h0MjkkyPCNmBK3aBy7zSWNbFpy99ygplo2Wz3MEid6CFwi6cGeelR
         53es93ShX4Z9e1wcYQ6USnEnuw7Y8/jS9q/vJdtfIICrrKNL6eO45l1swhQATaKsG09Q
         RrMTCebcowtb1xCoc0SlJ68EikapD07HKcNZ8D/dnPOWqL1VWMKm+haSMkFT8jlgVB98
         +MYyY83tL0vnrdeUZduiM+Dobf2KEF3jVyiR8MzzJkweTfEtcR2oyQVLWe6PQny2+Cq6
         UPrsNzevTHxFoBtnj4t7rbUIjSSZq0aFM4rlX9I63g6whsUF9gt+0uqh1Nl8Zkc4ski4
         puxg==
X-Gm-Message-State: AFqh2kppv66lHmxx0PZp9zVKiVp9j43Z5xRV8Zf2KRI47dIzNQjDsq7N
	yMz8mvHa+c2YIU9MXOX5aCehVRmLFK8=
X-Google-Smtp-Source: AMrXdXv95OTi9We7BklH2FBX3pkox2UVBRMtva8Mm7ne7fTGkQBBnTiOs3huBoDZBy+tfDGkNugi4GYzEh4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a05:6870:649e:b0:143:509f:17f0 with SMTP id
 cz30-20020a056870649e00b00143509f17f0mr4940900oab.211.1673297643629; Mon, 09
 Jan 2023 12:54:03 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:04 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-10-surenb@google.com>
Subject: [PATCH 09/41] mm: rcu safe VMA freeing
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

From: Michel Lespinasse <michel@lespinasse.org>

This prepares for page faults handling under VMA lock, looking up VMAs
under protection of an rcu read lock, instead of the usual mmap read lock.

Signed-off-by: Michel Lespinasse <michel@lespinasse.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 13 ++++++++++---
 kernel/fork.c            | 13 +++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 4b6bce73fbb4..d5cdec1314fe 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -535,9 +535,16 @@ struct anon_vma_name {
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
index 58aab6c889a4..5986817f393c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -479,10 +479,23 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static void __vm_area_free(struct rcu_head *head)
+{
+	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
+						  vm_rcu);
+	kmem_cache_free(vm_area_cachep, vma);
+}
+#endif
+
 void vm_area_free(struct vm_area_struct *vma)
 {
 	free_anon_vma_name(vma);
+#ifdef CONFIG_PER_VMA_LOCK
+	call_rcu(&vma->vm_rcu, __vm_area_free);
+#else
 	kmem_cache_free(vm_area_cachep, vma);
+#endif
 }
 
 static void account_kernel_stack(struct task_struct *tsk, int account)
-- 
2.39.0

