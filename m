Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB805A56D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:13:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl8H2LL5z3gBr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WI+iAkKY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=39s4nywykdkyyaxkthmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WI+iAkKY;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5M3G6Lz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:15 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id p8-20020a170902e74800b0017307429ca3so6840328plf.17
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=TAH5MnJT3oUowhISL8bra7V0NlPN+Gm7GlObU5EM5DA=;
        b=WI+iAkKYdp/dw+q+sE6vVFwD5mLSWBWMhRHboF9Ttbardy/unLndkxHVrzFVqulr1A
         yPcJLa3Ur0z+PJer1B1IamGoCGgxEpMLeAxgWf9CgasGK7cypr9FW+usqow4Tv90c3k6
         hSoUgkPn+GgzurgQcPzRD2rwA/PJHxIAlhRbX6toXLNmtMd1EOWFLhXluJKlLDk1UBbT
         O0I6rKmCm2uwsJ4JnyJZiGAk3wWQ6Qh6RctA9jkOKMvzLM+0NSmJ3ovBUaPQyVoGm6YI
         JXf6mvqPKdqWiUAL/+XE2dov1V39lipJcNcZcI/t4fYcyAX1GpBk//UErawM2Q1iWoKr
         uzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=TAH5MnJT3oUowhISL8bra7V0NlPN+Gm7GlObU5EM5DA=;
        b=ic0bc9V7L35D9EMUR0RpJC+e0qoIH+dFhyJdNcw4WSQVgJCUFefnA5yQB/3wW8JlUI
         xvsY/5ojkVQRsB1GaexZlbXC3GwVyDqdcBhSOht0lJr9uUXuxppJi7U8YCMk7JCpcpuh
         ge52kWhnZ1Sy9DyCV4MVwdQZDqk3zG9aqU81D+wgWGk9r0kpOamX5lXTG2P/qPZ5mGzs
         9u8Lv43ayo0VzCOZRJfYPhRFhI45Nzz+NtswgAZ88ns8DXz7V3JecZeinfPOBiarR48/
         PIN+7nJZ+nHZNVdori40hcn7ufVs76nIGFTFw8ZBE678eWlaU0lb4K+s/1XPxsYeSWLg
         i5jg==
X-Gm-Message-State: ACgBeo0k1Z78xY1K5YA2m6NF4Erl8t9x99knRXQGgPg16q/3w/MyCYjN
	slh1mLwdc8S0uQReE/LViYyC2SGSKkQ=
X-Google-Smtp-Source: AA6agR5aic644PZ0OuL1YK8O5lnv8GmzPsmAclgLgLZvZKPuRUB75AtHpFEjRVbtgx264YmpiRiioO9wBJc=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr21187pje.0.1661808373054; Mon, 29 Aug
 2022 14:26:13 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:24 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-22-surenb@google.com>
Subject: [RFC PATCH 21/28] mm: introduce find_and_lock_anon_vma to be used
 from arch-specific code
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
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
2.37.2.672.g94769d06f0-goog

