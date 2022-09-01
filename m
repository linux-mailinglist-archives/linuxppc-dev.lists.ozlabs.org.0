Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7695A9E78
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:50:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT9V6rzJz3g9n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kyDYAAaj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ne0qywykdnooqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kyDYAAaj;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrw5VVTz3c16
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:32 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id d8-20020a25bc48000000b00680651cf051so4960241ybk.23
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=GxTYNSy2f61J0vFNTG2PuheznwcSGYj4QW8UtE2cKCs=;
        b=kyDYAAajD8Ict5/thoW7CTIWmHJF9O2tLJRCa3mFAvG6icZFINT6cR9wp1PVCpk34d
         ZW6ubLRV3shjslvaFAJXlbBGTzPKjvgVDQeukMqdqtwYsjBpj2zHvD901sTZUMPhJtXT
         2ltqU4ShN/OuGiFl+1aMyLRwy+OC1Eq/JzpPgbsdEFfqg/fH8TS912PoVzzOgyXwQY4c
         Neb0lZJutieMXKVcpmbRLxmWRs14AnetVBjrLGSATrWD8Sx1+eyAMSMAZjNqX2Pwkr4/
         vSA7Eawe2WnSKfYYTXdrBr34gwdU8C4wAuI9C4koFQPreF/LzpOWpEs87ZTSq2ciWD6Q
         PcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=GxTYNSy2f61J0vFNTG2PuheznwcSGYj4QW8UtE2cKCs=;
        b=61SmbUMMnGHQq2J3dGeXv8jM1+tXbM8/XzhdjNwyLVFyiexnDp18xGOQ5w6feRymZ/
         dmSu8OF8iBQ198YYHw34wLdxq4j8p2mHxcpjWD75Ah3WdNrz2nNAzvoNxx5lxPzxfSbb
         lRn7PqxOCki7WEs0hgzkfFMv932xiAU2MLFNDnMdD8syzIEvJlN+Wl/yX5QOWWBYA+O6
         sw6NtaeXrFvZwZAfZpWJ7mazf+TsYWk/pRpLkYrTrHEPDUuL1u3Cxl4EwRi8l0MzRN3O
         +XTcX3ObvIl3l/BVJ55oVwZgxAUmFAynWeLy1uZSXDmffJdjBe4ylXjnzc+L30zJaJXE
         zMJg==
X-Gm-Message-State: ACgBeo3nm9epIOv5xRTrSPRNABC+ZHTBKSZwy86dvYwVwqM46LB9MBsR
	LCoM4RLbrzShsT+yZij3id3j2h0MbNc=
X-Google-Smtp-Source: AA6agR7h/HXbYJenfJy6WhKZaSvOltpWgwSfG3A/YQRl84q3AZw84By7flMTVszUCEhzYjvcGJ4xQ/dizwg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a81:650a:0:b0:33c:f030:7e9f with SMTP id
 z10-20020a81650a000000b0033cf0307e9fmr23813234ywb.16.1662053789340; Thu, 01
 Sep 2022 10:36:29 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:14 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-27-surenb@google.com>
Subject: [RFC PATCH RESEND 26/28] powerc/mm: try VMA lock-based page fault
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

From: Laurent Dufour <ldufour@linux.ibm.com>

Attempt VMA lock-based page fault handling first, and fall back to the
existing mmap_lock-based handling if that fails.
Copied from "x86/mm: try VMA lock-based page fault handling first"

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/powerpc/mm/fault.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 014005428687..c92bdfcd1796 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -450,6 +450,44 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (is_exec)
 		flags |= FAULT_FLAG_INSTRUCTION;
 
+#ifdef CONFIG_PER_VMA_LOCK
+	if (!(flags & FAULT_FLAG_USER) || atomic_read(&mm->mm_users) == 1)
+		goto lock_mmap;
+
+	vma = find_and_lock_anon_vma(mm, address);
+	if (!vma)
+		goto lock_mmap;
+
+	if (unlikely(access_pkey_error(is_write, is_exec,
+				       (error_code & DSISR_KEYFAULT), vma))) {
+		int rc = bad_access_pkey(regs, address, vma);
+
+		vma_read_unlock(vma);
+		return rc;
+	}
+
+	if (unlikely(access_error(is_write, is_exec, vma))) {
+		int rc = bad_access(regs, address);
+
+		vma_read_unlock(vma);
+		return rc;
+	}
+
+	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
+	vma_read_unlock(vma);
+
+	if (!(fault & VM_FAULT_RETRY)) {
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		goto done;
+	}
+	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+
+	if (fault_signal_pending(fault, regs))
+		return user_mode(regs) ? 0 : SIGBUS;
+
+lock_mmap:
+#endif /* CONFIG_PER_VMA_LOCK */
+
 	/* When running in the kernel we expect faults to occur only to
 	 * addresses in user space.  All other faults represent errors in the
 	 * kernel and should generate an OOPS.  Unfortunately, in the case of an
@@ -526,6 +564,9 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	mmap_read_unlock(current->mm);
 
+#ifdef CONFIG_PER_VMA_LOCK
+done:
+#endif
 	if (unlikely(fault & VM_FAULT_ERROR))
 		return mm_fault_error(regs, address, fault);
 
-- 
2.37.2.789.g6183377224-goog

