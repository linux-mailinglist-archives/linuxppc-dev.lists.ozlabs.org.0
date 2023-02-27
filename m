Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF146A4878
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSbn6w7tz3fcT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:46:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jX0E/sUV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3per8ywykdcwaczmvjowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jX0E/sUV;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNs4KQ7z3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:01 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536d63d17dbso154499037b3.22
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=29YuznebDbhH7LJ7uqA8Selv98qAa02JmRVPnHaqVO4=;
        b=jX0E/sUVT2RKYWg5Tqa21wWzSsitbAZllQiaBV4eWJXbUNmmhHROoBx1qNz1dBdUuE
         WfwseHSvUNs7qQdK+oiHVNrKDTVUoZgUvG4zzPJtFXGpgjghqMQHZP4+pvFGIZY9K8t8
         yTb/HpAgn0jfVzcS4IzWrxVVhGHhJpK4EoMdSwUP/MFG5D0Q4nJDsYGVVLA1YMlIDxWr
         /VFBixWLHZCmRtwCrTiJJEDxVSpInKYA+7RDdnLaY6ZEJ31POIP0qLghcCdmVf5ptWUG
         sRbVaoL3AhiMndAmHz8lepZWlnznP3Urg+vUr3DV+pv2Gj3JIWJnnqJV/02ALHT1NaZc
         S6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29YuznebDbhH7LJ7uqA8Selv98qAa02JmRVPnHaqVO4=;
        b=Ak5P3xi3/Gm+Zq0qczjpSQL5wk2nR0c3GzwoGyJgjd+dwnJ2YBNnHfs3Sarg92MLdA
         4WZBdtKxXKTYZFKQoCLeG7eFn9qCXxE3CHZGlCd+YrJuHpBeOeF26gG3NEcg5fq5teIo
         kbvxWkgpnr6mdTMda3KkVV7O00pfTAoCvpIneJ9i6iGwVBGVbE34UPRgYJp9MicBFmer
         QbJJ/LoVgOgLLEgGhlfcn0lZ74Q5887qN6mhmgQpz/1v95GtUFiMJ7HmDQDlT9do125k
         Qcw6DODEuGE9TU4A2CNQechKZcrWBWY8mmYwzOhBA9FNeorVOKpE2tsCugzhof6INsuE
         8yxg==
X-Gm-Message-State: AO0yUKU12FFtwhe71e3ft/UYG9W8/6WVQcNcIPdjCYcDzBFoXiswP3YO
	LMwuAHiaI7vqCp95ZhxwehUYbHjPS5o=
X-Google-Smtp-Source: AK7set+1Pq3oRMVl5cZH8khR0Bvwd8LGMD5WFRsqtwPODZNGlHBw37TZClpeLubRs3LjGXy9DC4x47Xc4Uo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a25:9390:0:b0:a53:5825:f25b with SMTP id
 a16-20020a259390000000b00a535825f25bmr6018468ybm.0.1677519421007; Mon, 27 Feb
 2023 09:37:01 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:09 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-11-surenb@google.com>
Subject: [PATCH v4 10/33] mm: rcu safe VMA freeing
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
index 22b2ac82bffd..64a6b3f6b74f 100644
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
index abfcf95734c7..a63b739aeca9 100644
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
2.39.2.722.g9855ee24e9-goog

