Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E60698C3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:41:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP2W2FtNz3fps
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:41:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hu+sMS9o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3v7ztywykdbyegd09x2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hu+sMS9o;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXK0pXzz3f3c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:57 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a4-20020a5b0004000000b006fdc6aaec4fso844051ybp.20
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rll6a/VW4pEw1AhNBjbFoMRbi+XwYRGQoRwSBUD0bh4=;
        b=hu+sMS9oSFHR1r7khxhf1UbXFcs2Z++5UsWdyoPEf98HLaKpCA/5NqLhTjKtFbNcAI
         bq4IC94z3LeKr+N8fZ27HaBeoB9eV7FJUK2PbLxLqtWEgkZI6C3sySZgRKxnS+2i/7yz
         RFGxaAOIl8opKirVI8bfAZAj2T7sVtyi7tZlmgl6KCk8dFxbKL8va87izUWyHNnCWm+i
         wFd5WvNjbROGmsVfKcufeNfiLR4xBKkikebAtyhw//UrLzCCkecCcI/c1WZAFUB1nZ5g
         ONtU8uW/bb5j1wyQf5MWCYTwREIrfwMyez4h+y24cgMUk3OrfInLJF7DZne80Aw4Hh2T
         oQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rll6a/VW4pEw1AhNBjbFoMRbi+XwYRGQoRwSBUD0bh4=;
        b=oEz8MVXfWCCxgJIDGsLyUReVVX8/SNn6WtxnQfMaR2Ui3OlGGIWXsqJSmVUzeHvRM5
         WJ6buMjMovbuRpsjKaEMilPNoQSm4Buj62TKg0ej5nIPFVVQf8iS80NwcY9EHcDoyY+w
         /yl3nn/jtW7ajPFlf8pUnQjDBdk4fY2TtxJxKFzcd+a87Vi4JzEnpuXlSgisUYjNJRPp
         jyFSqQWAm5ZDgV5PXND7lGvjmFe3UyuJ0q3Lvn9WvfSPFS4+Q/gtBbrqqv0fwZssKfw2
         sOQuIhUP0NYQZ651MNWjI3wFBto273Su7g3lBBlWzefdP14u/8fzeGftfSyR1gniAcwH
         6N2Q==
X-Gm-Message-State: AO0yUKUX9o7ZJSQH9jCbd3UlZVOflSS2HaOSzIJi7shuBxnq6/C6UHx1
	JKrKdnYcMIiD54MFM+PqwbbMpCLsuOg=
X-Google-Smtp-Source: AK7set/t52sA7P5kGXoASmYABiID5pIEjMuKzn7Z6yq6NOdnfI/iNhk3E99tS5Gm4PH95uk7/Rdn/fKqkhY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a25:9012:0:b0:874:380b:887e with SMTP id
 s18-20020a259012000000b00874380b887emr545965ybl.239.1676524735071; Wed, 15
 Feb 2023 21:18:55 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:40 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-26-surenb@google.com>
Subject: [PATCH v3 25/35] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
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

Introduce lock_vma_under_rcu function to lookup and lock a VMA during
page fault handling. When VMA is not found, can't be locked or changes
after being locked, the function returns NULL. The lookup is performed
under RCU protection to prevent the found VMA from being destroyed before
the VMA lock is acquired. VMA lock statistics are updated according to
the results.
For now only anonymous VMAs can be searched this way. In other cases the
function returns NULL.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h |  3 +++
 mm/memory.c        | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3f98344f829c..36172bb38e6b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -701,6 +701,9 @@ static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
 	vma->detached = detached;
 }
 
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index 8177c59ffd2d..5e1c124552a1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5220,6 +5220,52 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(handle_mm_fault);
 
+#ifdef CONFIG_PER_VMA_LOCK
+/*
+ * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
+ * stable and not isolated. If the VMA is not found or is being modified the
+ * function returns NULL.
+ */
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address)
+{
+	MA_STATE(mas, &mm->mm_mt, address, address);
+	struct vm_area_struct *vma;
+
+	rcu_read_lock();
+retry:
+	vma = mas_walk(&mas);
+	if (!vma)
+		goto inval;
+
+	/* Only anonymous vmas are supported for now */
+	if (!vma_is_anonymous(vma))
+		goto inval;
+
+	if (!vma_start_read(vma))
+		goto inval;
+
+	/* Check since vm_start/vm_end might change before we lock the VMA */
+	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
+		vma_end_read(vma);
+		goto inval;
+	}
+
+	/* Check if the VMA got isolated after we found it */
+	if (vma->detached) {
+		vma_end_read(vma);
+		/* The area was replaced with another one */
+		goto retry;
+	}
+
+	rcu_read_unlock();
+	return vma;
+inval:
+	rcu_read_unlock();
+	return NULL;
+}
+#endif /* CONFIG_PER_VMA_LOCK */
+
 #ifndef __PAGETABLE_P4D_FOLDED
 /*
  * Allocate p4d page table.
-- 
2.39.1

