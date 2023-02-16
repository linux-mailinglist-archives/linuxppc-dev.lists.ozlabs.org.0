Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204B698C50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:48:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP9y0Q88z3fvj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:48:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aft7yDPM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3z7ztywykdcyuwtgpdiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aft7yDPM;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXf1SpBz3f7Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:14 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-527501b56ffso8401857b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=REPTBg+i2LhaxaiXpF8lrF3nvI6zBhAH5JQxrJ1l/Gg=;
        b=aft7yDPM8GMTHB06MFPSYtKh6oWhZ8a8LMFo6PcEI9pnNLntVOlXFNQs/1Yvf52/5v
         q7Mb9j3IbqGydOQagHUnsSeX/sfiJUssC8Nuv1RApw1dHW5T8YzKas/LnJ1orI0tqnNj
         0nSP5pSWAhACQCuzYc7axzYrfhmKcyRBbpYSaW4sNEVU5J76PVU7lF/u3PAFDwnMoS0w
         449nI+g12YKzlYuLkXvI0hBRvnRJV+xrScZAqKlTKhgGwG9sA/5/r9CeoVq4yrFt/yH+
         v8L5/t9gLYQIZy7UnUIKS96KONHOM4/bkOuXUpcfaqGPz0nskdK5CUeyDODt2k3AI1C9
         6jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REPTBg+i2LhaxaiXpF8lrF3nvI6zBhAH5JQxrJ1l/Gg=;
        b=1jXNzQDAY8Ls4jN/nB3nnUorbpaPHpKtOp9Fs3UkX7SyQb61Jlmvt6z8MqK1BCofeL
         XPcuX4grX4jttV/XHx9Ofr4ksSZiJTPaQMAKXBYUZtbHOOyXnm9PD7MHBvnps81fZJ93
         q5Ho6kx7fEgCaQNAg7EsbZRaouY5RrHaqFQ94L1PhDGCbCJ4QibkChltY0ooEA1cl/kv
         Z5l88F6OjpFJfR7i91rJ1bOEkuCLtzRAQ4CMn2+iLWw+0CJzViLf84/NvRdWK3b4tyFO
         VwgYOLm1BvyfQtJEZ4OG/ZqDl8uR+dWq09szQ/1Rymt+wzNR6U8CniNXUMNPJvB245Lq
         5F6A==
X-Gm-Message-State: AO0yUKVO9jr8XRmi5ju3OcqRDgu5Sr64mXw2snffEMxCyhKVg+YGzfPP
	TAga7DFJzoTytha1iitUdaUjF2CDyvE=
X-Google-Smtp-Source: AK7set+v0FR2W9n0VmO9fC7d0HyR1AW4QGVl+/6/uhiM7Ww0w+Lt/AynlEHt7RfffNYQztU45jTBm0A6vi0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:d49:0:b0:90e:37e9:1e01 with SMTP id
 f9-20020a5b0d49000000b0090e37e91e01mr1ybr.1.1676524751194; Wed, 15 Feb 2023
 21:19:11 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:47 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-33-surenb@google.com>
Subject: [PATCH v3 32/35] arm64/mm: try VMA lock-based page fault handling first
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

Attempt VMA lock-based page fault handling first, and fall back to the
existing mmap_lock-based handling if that fails.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/Kconfig    |  1 +
 arch/arm64/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c5ccca26a408..9f2c0e352da3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -95,6 +95,7 @@ config ARM64
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index f4cb0f85ccf4..9e0db5c387e3 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -535,6 +535,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	unsigned long vm_flags;
 	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
 	unsigned long addr = untagged_addr(far);
+#ifdef CONFIG_PER_VMA_LOCK
+	struct vm_area_struct *vma;
+#endif
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -585,6 +588,36 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+#ifdef CONFIG_PER_VMA_LOCK
+	if (!(mm_flags & FAULT_FLAG_USER))
+		goto lock_mmap;
+
+	vma = lock_vma_under_rcu(mm, addr);
+	if (!vma)
+		goto lock_mmap;
+
+	if (!(vma->vm_flags & vm_flags)) {
+		vma_end_read(vma);
+		goto lock_mmap;
+	}
+	fault = handle_mm_fault(vma, addr & PAGE_MASK,
+				mm_flags | FAULT_FLAG_VMA_LOCK, regs);
+	vma_end_read(vma);
+
+	if (!(fault & VM_FAULT_RETRY)) {
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		goto done;
+	}
+	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+
+	/* Quick path to respond to signals */
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
+		return 0;
+	}
+lock_mmap:
+#endif /* CONFIG_PER_VMA_LOCK */
 	/*
 	 * As per x86, we may deadlock here. However, since the kernel only
 	 * validly references user space from well defined areas of the code,
@@ -628,6 +661,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	}
 	mmap_read_unlock(mm);
 
+#ifdef CONFIG_PER_VMA_LOCK
+done:
+#endif
 	/*
 	 * Handle the "normal" (no error) case first.
 	 */
-- 
2.39.1

