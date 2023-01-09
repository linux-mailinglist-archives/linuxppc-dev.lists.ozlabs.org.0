Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A66632AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRfw3fDSz3fvQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:20:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T55Sv4TW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3g3-8ywykddaegdqznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T55Sv4TW;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5n63mvz3cdL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:53 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id w9-20020a05690210c900b007b20e8d0c99so10270895ybu.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UA5+XYk5SNGwY0wBqjbKeTB68Smdf1b2WfFGnAueiFI=;
        b=T55Sv4TWznVzBLEvpmky/jAR0QJoeEeCX90o+hjvZVdyHXxi4X+dLVqm78fwsxY8qM
         7mstQqJ2q4Sn5cjstBMo6qt6HReHOpVXqnm5LMKSQ635M0MCSPIfIgxAkOTHc8oB12I/
         ai6kXEsVt00A/xCygYMywSMRtpTqMTCmAJNGp6/HS0isXJekWM6FOqzBH2+trv87L4rS
         u+h7CTRZzB07Ow9ioaR2euNV+QdGF1fgPh0hG8fHh3bLFfxrE2kcC3qaflJTUkk0dQTh
         8vb62xpka2Ra5fG5NjEzQJYLTJMKCpwH3JBwVijZjrLZOBQ13qNu1ZZEA2iHn/6uZCd9
         oE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA5+XYk5SNGwY0wBqjbKeTB68Smdf1b2WfFGnAueiFI=;
        b=3MKefEwUXkQpNCgRe0Y+3u1Mhj+dEQzUjw6Jbh5AgK25EMxBUy8UVAjEpTvfqXlD8G
         xeiF4QKuy1wJTMyq1o5WaNfgJ7GJcyhTsVa4L3pSnyL87qBeCjEmCI52Hgz6JBUXTaDV
         uRCnWu0CG6J5BBVci+6zKI3s2G808Pn/UDHjBynfovzNWlBdKWNtAg04X2iVgYPXGoZ0
         4quMD1178C5W3ISfWPnKX7LIugl2KHpjQ5s4TFn2JKMHk4/YrlITKvRhsAkKtKo3CuoN
         GZZjANtdtqJfahMECsDbIhGQr32OWksfSbxCJVaNq+JvG6PomHIwXQ6Sre4iS0KCJHKG
         AE3Q==
X-Gm-Message-State: AFqh2kqr/BrnUcIk8sD4aDDZRBqMhoOLCc/7Qm3vvNOUPJMH+PyzgUZO
	CdWe/AOxhrxk3r3f7wRN57UgX/69qtk=
X-Google-Smtp-Source: AMrXdXsg8SKnvt1lG56Fk9uUJaowgWL0vbqBlxMLAmQhblw+uvVMcBKNRkD6OuTHfHWzX2ebIh14gNZU+Cs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a05:6902:920:b0:781:eeed:9abf with SMTP id
 bu32-20020a056902092000b00781eeed9abfmr7003326ybb.538.1673297691543; Mon, 09
 Jan 2023 12:54:51 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:23 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-29-surenb@google.com>
Subject: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
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
 mm/memory.c        | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c464fc8a514c..d0fddf6a1de9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -687,6 +687,9 @@ static inline void vma_assert_no_reader(struct vm_area_struct *vma)
 		      vma);
 }
 
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index 9ece18548db1..a658e26d965d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5242,6 +5242,57 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
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
+	struct vm_area_struct *vma, *validate;
+
+	rcu_read_lock();
+	vma = mas_walk(&mas);
+retry:
+	if (!vma)
+		goto inval;
+
+	/* Only anonymous vmas are supported for now */
+	if (!vma_is_anonymous(vma))
+		goto inval;
+
+	if (!vma_read_trylock(vma))
+		goto inval;
+
+	/* Check since vm_start/vm_end might change before we lock the VMA */
+	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
+		vma_read_unlock(vma);
+		goto inval;
+	}
+
+	/* Check if the VMA got isolated after we found it */
+	mas.index = address;
+	validate = mas_walk(&mas);
+	if (validate != vma) {
+		vma_read_unlock(vma);
+		count_vm_vma_lock_event(VMA_LOCK_MISS);
+		/* The area was replaced with another one. */
+		vma = validate;
+		goto retry;
+	}
+
+	rcu_read_unlock();
+	return vma;
+inval:
+	rcu_read_unlock();
+	count_vm_vma_lock_event(VMA_LOCK_ABORT);
+	return NULL;
+}
+#endif /* CONFIG_PER_VMA_LOCK */
+
 #ifndef __PAGETABLE_P4D_FOLDED
 /*
  * Allocate p4d page table.
-- 
2.39.0

