Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60C67EF12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T5c0shXz3fFW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kp92vFUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3esnuywykdngmol8h5aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kp92vFUO;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sdh4YR2z3fK2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:12 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso6361627ybr.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PvsAEkfbXSvdKN+lTJ9M9+vqfLQVBlihpxSKUw/t/s=;
        b=kp92vFUO2N4rCYUenom2PgB/dU7qqaylHAcH6HVVMYT5QMpL/oqQ/DdOm4bVNlYLNw
         9rNSkse+dfgOJKwj09yKdpzV2qc7upA8mjHmEpxt3RKsaa3pDRks1QGh3Nb2hG4bp/jU
         3eSArvNsdqtxNb6zpVi6gl2vf0iZr8y+PtaslVXMeV9Pu9xS/EmrXvCiajKJa9iCZe4S
         LpK/JO6vbmew4JxbSzbZQyffZL4sOt9sBlPWbT9WmPY7+pp+Ff0i+9BT7l4WdUaIrrgA
         btwhF2XkX8IUP7VpoyJ9OAYm06ddrZftAFhV0gBzofVRmYYEJ8dT0O9gMwk7XMh0b2Ct
         qw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PvsAEkfbXSvdKN+lTJ9M9+vqfLQVBlihpxSKUw/t/s=;
        b=GrZjN9j9YEscGFwqkK/kG94Re2JNIRiz8rlfEL84fiWv72jzv13xekcuFsES75+UPw
         irg0LQ/D+Mqo6Eb7Hy2PzIoZOxaxNP/JVBqn6CKtCH/8YWOlinlJkrKfs6R9xq+Sbsre
         dU0ZavOCU+B6nmJnfPgcbtuCpyiXfisFcUMa4WIWuTx2gTPuSoPImjX4we5u60VBk0qh
         Roheu+cfqk/sXsIE15DyRTZ+l3sYuvJRxcHRkqmHbVAXFFVrK5l6SVh77C8m69vMEIfA
         AZuBEb+IX9KP8cvEG1gOKWng+zNvpM/CJUQPBDbGgTonyytBHakzRaZpTzWyL9X23TJb
         6UMw==
X-Gm-Message-State: AO0yUKXM59d8u3PzcM3YM26TR7rBe9BSCCyTuB1CsYFxRw92/hPS0tlT
	p24qEkdYRtojpqvwt/hMNqKSOg9Q214=
X-Google-Smtp-Source: AK7set8zsvT5wkP/7moSYA7dIHSCpHQad2RzXlV5c0Wh0zEZrq5yaOQZsQ7iykW9DnqHdXZz8PLHMfkZLc8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:6d2:0:b0:50e:e91d:f47 with SMTP id
 201-20020a8106d2000000b0050ee91d0f47mr27189ywg.61.1674848529047; Fri, 27 Jan
 2023 11:42:09 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:00 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-24-surenb@google.com>
Subject: [PATCH v2 23/33] mm: introduce lock_vma_under_rcu to be used from
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
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
index 66dca140695e..fa2b9d6e665e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -687,6 +687,9 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
 }
 
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index d48c76e9fa57..5568fcb0a46b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5222,6 +5222,57 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
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
+	mas.index = address;
+	validate = mas_walk(&mas);
+	if (validate != vma) {
+		vma_end_read(vma);
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
2.39.1

