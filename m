Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEEF67EF4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3TFq47Crz3fnd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JxxlO558;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3isnuywykdogceboxlqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JxxlO558;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sds5KvDz3fLN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:25 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5073cf66299so66267777b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNwo0rhG4y8C+tQG7LPM4nLJWTbIHprc8uVQsZA2GSc=;
        b=JxxlO5586M0z4sVDSxHugqEEADB1cAjEHo2xluVRFI46WqHTOUsszCaJjysGoPqCq8
         ztKkJGmntymAGuEGxdM2A7EX8Sykw/reCFrQFVsgm7kaRoHFsG9BNF/PmmjyzPElNA3A
         u2zVx465PKwxuuDkWTqvf70dFDsT4sE76+Q1i+nyNMyErq//frz9WqLOph65UMZVM1Q3
         1JnBBBOhnZpIDf2DrbbDSdhADbiUH2oov3flacw7sejkvu/YDNPNLxViqgxSV8aAiDpN
         WEe8RN23e0S32q4tATcZ7ZhVfhZ7+NOeU1bzW/fjTQ6HzW6TJlQUp4mHpwvwuOr4rhfO
         QkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNwo0rhG4y8C+tQG7LPM4nLJWTbIHprc8uVQsZA2GSc=;
        b=eB5VhuAHipYHmuW47FZRS38myqoPNNKC/VJBbFRkE9rvDPa+/Pz+yg0olGx64+VLWA
         Rtpxd0RYZYuezwYw1YogCiyWI3t7zda4Z2jfi+n8IPVvTkG5v7vSwroU2w3Ah3E83gGr
         mwh65/ppaisgZxRrEu7EnHnofKeqM2IV9NGtDK9kj1TNRWstgpe5AEK28TcUDQpjSDcG
         19If+QMpQF4fqR6cy2GIwR3c9hIEPqJj11hTmrs2s5qzmcYVr8uDcQwe4rlbBelLCDBn
         XQ44/vhGV2cVV8YEFKDyjP7Kyqu5AoEkTuKCAFpYCF48ww34xRGqEPM+TlmPGG/uAij3
         YIiA==
X-Gm-Message-State: AFqh2koMn+dG+bU7T6QQPUBNldwicdCRtsHXg1cQYLgjzHPabljSpHje
	L8Nh8k4yY0SF47bC70S/NT90tOjyDxY=
X-Google-Smtp-Source: AMrXdXv6cPUTMY06wj7LHpX7SofIKh9xmcnJ1P5+6wR9m3ToK9ikAh4HiQMQbcnL8It7MYI0W5hAcMnIURQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:5b88:0:b0:462:e278:1a08 with SMTP id
 p130-20020a815b88000000b00462e2781a08mr5361156ywb.243.1674848545116; Fri, 27
 Jan 2023 11:42:25 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:07 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-31-surenb@google.com>
Subject: [PATCH v2 30/33] arm64/mm: try VMA lock-based page fault handling first
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
index f4cb0f85ccf4..16588dda9258 100644
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
+	if (!(mm_flags & FAULT_FLAG_USER) || atomic_read(&mm->mm_users) == 1)
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

