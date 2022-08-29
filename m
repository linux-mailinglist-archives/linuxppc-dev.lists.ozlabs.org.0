Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A762A5A56E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGlBC3k0Kz3gKM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WuXmy7sp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3-s4nywykdkoceboxlqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WuXmy7sp;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5R3Z7Wz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:19 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id q193-20020a632aca000000b0041d95d7ee81so4543649pgq.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=3FeDd/uESQnEyJqRWNnPK+iT++ObIkcBX2+m7Yxyetk=;
        b=WuXmy7spYby6FKlYZxVkneAX6CYLeedEW25AaCdm5U/xwDtXPaTsukbnW+BREr3wmK
         Yp+DdB6epKs/SB7JvycD5yPQfOWs3SBJlayjVM1bzBPF4xDdscUUlmQ491HoasCmixWz
         EDQApyvlKJ0m9j6IZ5Bl5eAvYAMUvQ5PzTt+MmJPi2OMUuj7wlttfCVr1jtd4buEfno/
         mHPpjk9OptKM0QuTB8OPa5JPYvPxCHU8q8PlG/PC9yFoVmLZ3eeWZBp1XntU6iG84/rA
         BgcQG1UC8Z471LrYLx/b3SNnNzdfHV9f4k2uE0RZvNOL2F/Wod5mOLtISQc7G5F1GR1Y
         7dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=3FeDd/uESQnEyJqRWNnPK+iT++ObIkcBX2+m7Yxyetk=;
        b=Rk+E0QeRExQtWVqis+K1yJWcLwDEKH+y+bsy9mHQSiXztkl8OmRl7K/sGpj7MIB4jK
         lQB52XZ82tTpbYmlhIYxYfgzqjWmBPTF3lfO8JKg5al+L+0NKrauw5eqj/r6EJ6bFoHS
         BEPA2Pboyt/TG7w4jkreqsU0FpRUBtWxFCkDKMWZ06RxWdlYiMuhiPeyB0wLv/z23p7s
         2I/A38I2RWl0PV9vCVS6qxNhk4ahuMXDcKuGV96Z7v94j5ChKAgzuaNTIx/DiSW2wa10
         R3zguXCbu2BX4cjO1JwPY5o4tVrVF0TkugWClcI+FQhS9KUK/xVXxulTaDVbhaGYjyCH
         U6pQ==
X-Gm-Message-State: ACgBeo0G4FH3DfQbzZpgJdoKBxv61BH2LqxgFwJIlZQF7T2A8sBErPKO
	E7iw5DLzCUUnQupD01O1vY9bLOb4dcI=
X-Google-Smtp-Source: AA6agR65SMIHezE5eUhR7FLJy4sKjKwDRErJ8crUMropZEJrhJg/maBEVhsE6eunhKdLtoV+/pEsLbtUb5g=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a62:b519:0:b0:537:9723:5cf2 with SMTP id
 y25-20020a62b519000000b0053797235cf2mr18436343pfe.15.1661808377917; Mon, 29
 Aug 2022 14:26:17 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:27 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-25-surenb@google.com>
Subject: [RFC PATCH 24/28] arm64/mm: try VMA lock-based page fault handling first
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

Attempt VMA lock-based page fault handling first, and fall back to the
existing mmap_lock-based handling if that fails.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index c33f1fad2745..f05ce40ff32b 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -525,6 +525,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	unsigned long vm_flags;
 	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
 	unsigned long addr = untagged_addr(far);
+#ifdef CONFIG_PER_VMA_LOCK
+	struct vm_area_struct *vma;
+#endif
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -575,6 +578,36 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+#ifdef CONFIG_PER_VMA_LOCK
+	if (!(mm_flags & FAULT_FLAG_USER) || atomic_read(&mm->mm_users) == 1)
+		goto lock_mmap;
+
+	vma = find_and_lock_anon_vma(mm, addr);
+	if (!vma)
+		goto lock_mmap;
+
+	if (!(vma->vm_flags & vm_flags)) {
+		vma_read_unlock(vma);
+		goto lock_mmap;
+	}
+	fault = handle_mm_fault(vma, addr & PAGE_MASK,
+				mm_flags | FAULT_FLAG_VMA_LOCK, regs);
+	vma_read_unlock(vma);
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
@@ -618,6 +651,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	}
 	mmap_read_unlock(mm);
 
+#ifdef CONFIG_PER_VMA_LOCK
+done:
+#endif
 	/*
 	 * Handle the "normal" (no error) case first.
 	 */
-- 
2.37.2.672.g94769d06f0-goog

