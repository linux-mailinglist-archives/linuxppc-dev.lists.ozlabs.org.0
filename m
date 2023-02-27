Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D56A48C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:58:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSsC0kBLz3ffT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:58:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=M2xu6PJm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3w-r8ywykdeo463qzns00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=M2xu6PJm;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPR6cSmz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:31 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536b7eb9117so153597607b3.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRRoEkIKRwl2QQHnq1OJVyPp4L6+mQc5CWukcTSQqHI=;
        b=M2xu6PJmgtYFCFjZtLFUAhDJwsRj1PNvn9tpCCynDkmhHKgKWgNMPKAbFeMB0d7vzQ
         aKVeG6bXcHl5yxZ6JEXjbkVB2BvokKvbI4LCTQCQPJySbeEhyr0HdzjFd7UV7XC52Nqd
         IM/Y4Y2oz4P4pwkohu9Bqul5qghmRgidkrq66aJWcYZe5Ah2frrlViyJFqWif5WyIuln
         lwhBindA8HTOjteANHg0VaUlc+wXF2i0bjESG2yKoDnx3/qzuFoEw7K8TYty79uXoeAT
         DG0JzJNCfRj4E5rbsNquxz9O5F/H/zOUYZHgnCU0K2ioTwSn7zpOFzVjAn3t3qu4Rbvy
         YYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRRoEkIKRwl2QQHnq1OJVyPp4L6+mQc5CWukcTSQqHI=;
        b=ndzQP0/vLEHa+Sa/rGw7rpV1l2uYqsP0BNI2/aStOJjiDZ/icIlBQMTyGelYIpG6KC
         Jrc5KBJ/P7yfA3bWJx8ZAXdTAy3Bcb5co7osV0KHGazSdoXeJG2bzWY15JNOnVMvJFz8
         0yNgIbAU2C0QNHfB0R2m1w/yVwnTCthVfTSZjRAaUNvPGojdEKSKtv4fvlN00DYSK+zE
         QjRd7Q7D4ELtaT1opN2X+aLdtLoJdfm6QCkHmdrlIdjDxNyGjR7erW1o95epSLO2CwjA
         2ULJ5y8Y2TDz+VoCTm5dCaZVEjcB6dkoJL353BuIuyrB+N6XZsB78Qv23WVzDEvFYTQv
         lqWg==
X-Gm-Message-State: AO0yUKVBEhwztNrRuTK8rv/xkKeI/LZOp5dBuDwKz2HVbtzwniXrvv6X
	btFP0cfCQCTDYStW5QnxpPIyLfRPsNg=
X-Google-Smtp-Source: AK7set8ux+VAfJlkMlZWU+S8XCIwu1HZ1wVSlOGqhGsiL0aWWxFXwk2KW/a7dOnnyUwvPtqegO11CuQKxxM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a5b:6cf:0:b0:a03:da3f:3e65 with SMTP id
 r15-20020a5b06cf000000b00a03da3f3e65mr9154608ybq.6.1677519451327; Mon, 27 Feb
 2023 09:37:31 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:22 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-24-surenb@google.com>
Subject: [PATCH v4 23/33] mm: introduce lock_vma_under_rcu to be used from
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
index 895bb3950e8a..46d2db743b1a 100644
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
index f7f412833e42..bda4c1a991f0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5221,6 +5221,52 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
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
2.39.2.722.g9855ee24e9-goog

