Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1325A9E70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT6x1Bzdz3fw1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eEZ4BqXk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ko0qywykdm0bdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eEZ4BqXk;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrj6fQbz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:17 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-335420c7bfeso234912657b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=BJfct7EED8CP836t+WrOyNhtwjRjF3r9ZgkUbpnfoug=;
        b=eEZ4BqXkAmPCIUFHBPa2tHlcApvv3HMidc3eCYWOXuAzHrpAN0HS0lhYeZxby9RzBR
         0w6QoRpV+iKQz37VUGml6Y4ETbNA7OPStJ8QApy5HYv7GzeLDO7+EvEq5dUOIcaM6UVC
         7rLgM8Qnok81T8RLLnPTDqNW3fzyiOCIgOk9erIOBMCvX1CoI/RbBp7yoBH88B/Pqkwt
         H8ojE/1F974lnPVAUpGISzyJjuOBuorgNT9VfkfOyqVqOEVMNKxpaqT01PsyXu4rsbpt
         stRow1K+x3Cpkks4NKMTKIZbGi9T2v1db4rNZMcbp4CaDTkAzPc4JsqrDHDLe5K5oO1C
         a6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=BJfct7EED8CP836t+WrOyNhtwjRjF3r9ZgkUbpnfoug=;
        b=4Az7TNo1+PoR8s6MuhwLo/jNB1WIrddYOi25/0AM732bawG/bG9Zv9coUEYgZaxTdD
         GFWQsMvUeZmhj7o6AFUHDGjzG0vWHB05gGzyW8g8fngiBJtftWAO+4aolQpqLQAu+awK
         fjMCZRKHQeDYFkypazriKUPGaG8JPjquzSC1SJKTpy4Nhl+/H3UEu7jaftGdKlsZKgTb
         qaiPcViutapCBjrn2EsC3PAKM/ID8/acFRvQ7ykWSwgXo3JbS4ao/15Jack9lxb+D4Ez
         yXO0n9gI7yIvoNhNFfmr1bYtw0HEx28WUBaHA4Gjn2HX1uAdQVpEfdgpc68c0pITeqh+
         oC5A==
X-Gm-Message-State: ACgBeo0hHxbTOlfJgSpjLUf+4GCewUUUNkTjeTpwZhYoAKJeP+u7k6SX
	qghAm5gY6rQjcCAcpkSWAVVC/eBX0LI=
X-Google-Smtp-Source: AA6agR7n//3fxGZjvfyML08bNSpeGfau+aTgkZu5QxUJzLJc9oUWAiawZA1UWbNFrnWa2xxdQVaE06YdPF8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a05:6902:18c:b0:695:9d04:c3e with SMTP id
 t12-20020a056902018c00b006959d040c3emr19907526ybh.58.1662053776523; Thu, 01
 Sep 2022 10:36:16 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:09 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-22-surenb@google.com>
Subject: [RFC PATCH RESEND 21/28] mm: introduce find_and_lock_anon_vma to be
 used from arch-specific code
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce find_and_lock_anon_vma function to lookup and lock an anonymous
VMA during page fault handling. When VMA is not found, can't be locked
or changes after being locked, the function returns NULL. The lookup is
performed under RCU protection to prevent the found VMA from being
destroyed before the VMA lock is acquired. VMA lock statistics are
updated according to the results.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h |  3 +++
 mm/memory.c        | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7c3190eaabd7..a3cbaa7b9119 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -684,6 +684,9 @@ static inline void vma_assert_no_reader(struct vm_area_struct *vma)
 		      vma);
 }
 
+struct vm_area_struct *find_and_lock_anon_vma(struct mm_struct *mm,
+					      unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index 29d2f49f922a..bf557f7056de 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5183,6 +5183,51 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(handle_mm_fault);
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline struct vm_area_struct *find_vma_under_rcu(struct mm_struct *mm,
+							unsigned long address)
+{
+	struct vm_area_struct *vma = __find_vma(mm, address);
+
+	if (!vma || vma->vm_start > address)
+		return NULL;
+
+	if (!vma_is_anonymous(vma))
+		return NULL;
+
+	if (!vma_read_trylock(vma)) {
+		count_vm_vma_lock_event(VMA_LOCK_ABORT);
+		return NULL;
+	}
+
+	/* Check if the VMA got isolated after we found it */
+	if (RB_EMPTY_NODE(&vma->vm_rb)) {
+		vma_read_unlock(vma);
+		count_vm_vma_lock_event(VMA_LOCK_MISS);
+		return NULL;
+	}
+
+	return vma;
+}
+
+/*
+ * Lookup and lock and anonymous VMA. Returned VMA is guaranteed to be stable
+ * and not isolated. If the VMA is not found of is being modified the function
+ * returns NULL.
+ */
+struct vm_area_struct *find_and_lock_anon_vma(struct mm_struct *mm,
+					      unsigned long address)
+{
+	struct vm_area_struct *vma;
+
+	rcu_read_lock();
+	vma = find_vma_under_rcu(mm, address);
+	rcu_read_unlock();
+
+	return vma;
+}
+#endif /* CONFIG_PER_VMA_LOCK */
+
 #ifndef __PAGETABLE_P4D_FOLDED
 /*
  * Allocate p4d page table.
-- 
2.37.2.789.g6183377224-goog

