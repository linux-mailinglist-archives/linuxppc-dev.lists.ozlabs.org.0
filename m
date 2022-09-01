Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61015A9E22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSsr4ZWrz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LbkT/AkX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3xu0qywykdjsnpm9i6bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LbkT/AkX;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqj3f18z2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:29 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id j11-20020a05690212cb00b006454988d225so4965920ybu.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=p6utfGSGU2ZWrUa6c0eUAGSz6ILgySPKVkHsaiIDl8M=;
        b=LbkT/AkX1WcT/2fyJlqSXegH2trsBNyd6QrbYfZ/YY10o0bOfV+Ix+uJLegE6lSF35
         ne85BxCuyx7lBpnSiZ42TY86RYtZR3AAc5vYrFsx4gBxgTwamIONmdTxtR/0iKqdUJEh
         gCGpqjCaOQV7LzbqDjbUJKDXfAR5/j45YmmGmhxu+HXk+Hwd00xyXauy+PEzZWtLyw4U
         rqIn+41hVfJNUiIovZy6pL0FSV03X1G3rIrczW6PRcfgw8lXvG9gGaQmr8gUZrra+vXa
         CCuSzq9IAYSPtY4Wqdt70146omIRNbSeU/rl39Xw+3e0A38BgKuGXtDi12EMKnqTbGy3
         VnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=p6utfGSGU2ZWrUa6c0eUAGSz6ILgySPKVkHsaiIDl8M=;
        b=T/x59zjYEsdeh9AFvl+otMo+LxG3q5Ncn5E3sbK4+z+uYE3zgruRNZvBcfEyo8NlRW
         wkdxda0WeypyT8Fn6e44rX4lbo25f9GmvaVFzZOfG7aB9dR6kB7ZgHqs/VSajtxMn+11
         9brKeG+n4690aeBtd5ErS6UBrmARdACDil/k56LvLliWWLI0Fz+jsrOd0WLDJMm2TBqf
         FNV0kMRkm+nvTr0DxKjX422pM96zq8uv4W/EepOkgCMk7A5Vj9+jIyov1L/pBvDYWwYS
         K9yE1j31vzOuxLLGF4bOkcPBwG5OWKzZwqSuf7vVv/KF1yBZ+TPtj/xdmqpVkw9xlBa4
         5rYw==
X-Gm-Message-State: ACgBeo065HhtNbGjvzidzfwkLk1DGbUtcmjjr77dXgenx1MTp6oZRW/N
	g8sQFHUZedfmUUNvAk5RF9DN08n7u/YmuCKSVCvQdThn5mE+UAKsuxMimuytKOq9qFRv0EpRFmS
	SDsw2MoYTOGMFbXD35wWTdg==
X-Google-Smtp-Source: AA6agR4JzlVLX4tUxHHNIbaNOZW1dz2wXadaTbKwNizSq+Zw9LDNKeWUkMtSnrbieYwXe2AgTTBR2su3VSU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a81:5cc4:0:b0:327:59f2:d673 with SMTP id
 q187-20020a815cc4000000b0032759f2d673mr22886370ywb.272.1662053726626; Thu, 01
 Sep 2022 10:35:26 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:50 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-3-surenb@google.com>
Subject: [RFC PATCH RESEND 02/28] mm: rcu safe VMA freeing
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-ccpol: medium
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michel Lespinasse <michel@lespinasse.org>

This prepares for page faults handling under VMA lock, looking up VMAs
under protection of an rcu read lock, instead of the usual mmap read lock.

Signed-off-by: Michel Lespinasse <michel@lespinasse.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 16 +++++++++++-----
 kernel/fork.c            | 13 +++++++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index cf97f3884fda..bed25ef7c994 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -403,12 +403,18 @@ struct anon_vma_name {
 struct vm_area_struct {
 	/* The first cache line has the info for VMA tree walking. */
 
-	unsigned long vm_start;		/* Our start address within vm_mm. */
-	unsigned long vm_end;		/* The first byte after our end address
-					   within vm_mm. */
+	union {
+		struct {
+			/* VMA covers [vm_start; vm_end) addresses within mm */
+			unsigned long vm_start, vm_end;
 
-	/* linked list of VM areas per task, sorted by address */
-	struct vm_area_struct *vm_next, *vm_prev;
+			/* linked list of VMAs per task, sorted by address */
+			struct vm_area_struct *vm_next, *vm_prev;
+		};
+#ifdef CONFIG_PER_VMA_LOCK
+		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
+#endif
+	};
 
 	struct rb_node vm_rb;
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 90c85b17bf69..614872438393 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -481,10 +481,23 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
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
2.37.2.789.g6183377224-goog

