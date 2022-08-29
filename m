Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD95A56DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl8w021Wz3gGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:14:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O7Fq7HWZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=39i4nywykdkczbyluinvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O7Fq7HWZ;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5N4LGLz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:16 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id h12-20020a170902f54c00b0016f8858ce9bso6764273plf.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=plnLK4otWaGxR+W8sd3fBxFm06LW87+WFj6YX7JmKJI=;
        b=O7Fq7HWZ7z8n2j/HcxIFYSMFkVCbPksq++2+VIS66vXRQwbI7dU8JTklRI8MPiby2e
         edzsUySG6IImo6mrh8ENCQ2+wxA6BfMFPfkVn5AwXOsZupGcnzhGGSKXttVqFe7CqMCi
         1h3acQOuI10/ig3PP8xkKsm4NtzNbHGpaQpLwoGjKN2BSoc/HFLvkEbHUIkKXG5J3g9z
         9q6Jpb0Ph5QlVq/4hF27NyIuM3/V2/KAkuHoouSJodEv2dWsfVfE58VeJPPY/+QOUQfz
         r+QwUf2vpfx2TV1s2fbWWB8eIKopRLMSEdWWEDiBiVoTpxt/dnwqSCw7tnlmHUsJj3fT
         5A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=plnLK4otWaGxR+W8sd3fBxFm06LW87+WFj6YX7JmKJI=;
        b=wzBUoV+lu2ZZtLhYCqHSjIV/82S0C+zuuOgv7RyAvxXGHw/bV95DL8i5GHrtJOebcH
         35mK+CeQhJCAOwHwmyLht2oiuSBEGwAKGgfz6SPJcMgGVugP6ASRhTxtLiRxnDIqZUQj
         b6gasje3L0029+NM+od9gn6ngz0yhqhbpKatAh7V2u4F9cnIFqHLngnhDe8lvehFI/gE
         yQcOwruV5bhaFefExwKYeQsJSC1awqR4zR++RM+QKeUKg2JIXqefWGqqgO7brdm+TtEj
         o6KQ7uh5bCdjdIcIYNhFUMTXw1bbKbp13Ky2LcBZ0OYWxmwYQPdlWGRXAYF13Y+YURv0
         nlEg==
X-Gm-Message-State: ACgBeo24jTQrWuUdXeWEuXq4/vpbYYVZ2EkUSx0r4bZ/BnefEdSQp9fQ
	T4x4hVOwYGakPuesvu7RuxIVrSJc/lE=
X-Google-Smtp-Source: AA6agR6koDuvaTUSC7OU/WlAja75jS99jSayBh5syt6ErVM0PHA+biyxUvs5Ar838YXdhWnvkXm6gonES4M=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a05:6a00:14c7:b0:52e:efb7:bd05 with SMTP id
 w7-20020a056a0014c700b0052eefb7bd05mr17908102pfu.24.1661808374985; Mon, 29
 Aug 2022 14:26:14 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:25 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-23-surenb@google.com>
Subject: [RFC PATCH 22/28] x86/mm: try VMA lock-based page fault handling first
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
 arch/x86/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index fa71a5d12e87..35e74e3dc2c1 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -19,6 +19,7 @@
 #include <linux/uaccess.h>		/* faulthandler_disabled()	*/
 #include <linux/efi.h>			/* efi_crash_gracefully_on_page_fault()*/
 #include <linux/mm_types.h>
+#include <linux/mm.h>			/* find_and_lock_vma() */
 
 #include <asm/cpufeature.h>		/* boot_cpu_has, ...		*/
 #include <asm/traps.h>			/* dotraplinkage, ...		*/
@@ -1323,6 +1324,38 @@ void do_user_addr_fault(struct pt_regs *regs,
 	}
 #endif
 
+#ifdef CONFIG_PER_VMA_LOCK
+	if (!(flags & FAULT_FLAG_USER) || atomic_read(&mm->mm_users) == 1)
+		goto lock_mmap;
+
+	vma = find_and_lock_anon_vma(mm, address);
+	if (!vma)
+		goto lock_mmap;
+
+	if (unlikely(access_error(error_code, vma))) {
+		vma_read_unlock(vma);
+		goto lock_mmap;
+	}
+	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
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
+			kernelmode_fixup_or_oops(regs, error_code, address,
+						 SIGBUS, BUS_ADRERR,
+						 ARCH_DEFAULT_PKEY);
+		return;
+	}
+lock_mmap:
+#endif /* CONFIG_PER_VMA_LOCK */
+
 	/*
 	 * Kernel-mode access to the user address space should only occur
 	 * on well-defined single instructions listed in the exception
@@ -1423,6 +1456,9 @@ void do_user_addr_fault(struct pt_regs *regs,
 	}
 
 	mmap_read_unlock(mm);
+#ifdef CONFIG_PER_VMA_LOCK
+done:
+#endif
 	if (likely(!(fault & VM_FAULT_ERROR)))
 		return;
 
-- 
2.37.2.672.g94769d06f0-goog

