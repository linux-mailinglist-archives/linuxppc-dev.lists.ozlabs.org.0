Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3DC5A9E77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT8s2HtYz3g5W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VLuZCO0l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3mo0qywykdnujli5e27ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VLuZCO0l;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrw4Djpz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:32 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id f3-20020a056902038300b00696588a0e87so3564308ybs.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=2BdbpYN+cfrtXte3gt5P0NOm/DHEryE/xIPhm7Rz1xg=;
        b=VLuZCO0l2heZzbazUktWTHDEraaU4YdHq4KUbShg6HpER9jaDaB5f4y1Bzq/1FTL0k
         Hef4re0Ge4vhRYArZVPVcwZDWlez9FLwBw1PsG7bcW/Kbgpuv9Pp9OJGNf6JnrGh3HSa
         qO0dYIzHK0WtoIREDnu1aZZK8mbeTv1bHWQjDQ3XJuqrg6Mb+eT6a9R2PACl9oYgExkp
         BYTnrJsd86ZN2nyjWVo4xWQ85kSe7EiDolkrvd8eM4uZtObKMsI19IUrWn7JY9Y8YYi6
         3keq2T13Rmwv4h2gxcKkEIlsATye3QMfjNN6OckMSJWRV6GvnHlPAwoTd+EEwFOjiqHw
         hSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=2BdbpYN+cfrtXte3gt5P0NOm/DHEryE/xIPhm7Rz1xg=;
        b=QZ9jJUrB13NFij8cZCZqIAeIw4kFv4iay/qovexY5Lbewk4NNzNX8zKj1gfT4FKkSe
         5NgDZzNkP2/NJPuMZjhfy/xrdPad0UbMiG/NYDjIdCa/R02Myc2Zd3y9DOavzy+a8C+D
         CPB9RzLuUciQ4ttBhUZHlgMYif1Ppn6BG9x1JcX1C2rC4NuR0r8lvX8Zmq8P2kxx1lAt
         2J4oyQiUMBrdItKjOA0iEHZRIk2oQPCy8Q8Uw71njBCanTSdrvKt3Q6tNEgHmhC4wU+b
         3mz1VIBD1IyQOUjcv524fJm0HvRvZnEh1unWWlU8LHNQWBUCCj27e5W25sdA51W2pnJ2
         dluw==
X-Gm-Message-State: ACgBeo0o9YmlcNPeOOs8S5kiWcOVpB/H8d5DRxet6fb/yoylQfub/eXO
	KEB9hUbuEKkEYvFmrsHoSXAK2pYB3tk=
X-Google-Smtp-Source: AA6agR4CvVkCfuV2stbCR2feIvgwEhmkbLBkcVFIjpWyBvtco7HBu4vzJWRMfUlZ+fh/HitarNYnWQuKjvQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a81:5a56:0:b0:33b:52a8:c360 with SMTP id
 o83-20020a815a56000000b0033b52a8c360mr22687651ywb.329.1662053784110; Thu, 01
 Sep 2022 10:36:24 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:12 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-25-surenb@google.com>
Subject: [RFC PATCH RESEND 24/28] arm64/mm: try VMA lock-based page fault
 handling first
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
2.37.2.789.g6183377224-goog

