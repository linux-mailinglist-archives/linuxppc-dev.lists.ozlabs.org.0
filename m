Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5425A9E73
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT7Z5bXxz3fyl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YQqRrP1c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ku0qywykdm8dfcz8w19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YQqRrP1c;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrv2F7tz300l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:22 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id o144-20020a25d796000000b0069b523a4234so4911743ybg.17
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=TUk3GnQXnzjX+dOXwqqLb3j5iouD0aWKTRx7OYILWmo=;
        b=YQqRrP1cOBMmwt/q5otvkRLq5UlRi5nXamV0kPAgq/Llb+F9rrwouZsmTwkjFMW1zs
         mWLW2S110jPh4eYPUbnJWz9aEFHyDND9nIDA90HkjT5HQ91YMufxWCmYs0WU2ooUk8Du
         wzdtu/YDYEQeIpF7CzLVtbR6weBauuj1l4a8qgmBNwRm70UISBCLpd93jjiqNIdE0vgs
         06VcH4KM5paek23OhAbPGd46WTDb6+CqL4Pyf7E1NmlU70RTzjmiFKgXWz0xeqjkJr9W
         NG4J3tGGklDETuONG3YWLZrzk72gi/1u5qstFzrzMP1bg8GyXe5bAXne0/Fv+EFg0xsd
         ouLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=TUk3GnQXnzjX+dOXwqqLb3j5iouD0aWKTRx7OYILWmo=;
        b=f0RtK3HCx4PTok2YaLOMPaCGjm+qsITevvCKadpUNMsCsL7Vo9/6bZjhYHwy+g1ANE
         N0TVO7E4aVtiWTxdDV6IWxnMdbgIvL2VuXaOj5aBqI0UV8FzmMBq7+/Bvcr+74f4ozNM
         agZrrQ0imjV6PaCo7aEEpc+jzEJKGNJ5CDxjTs6K3/qC2tbDJiQtfMlVp9wcQAQBoKrY
         9h/ltdgAtNaS4ZSEbcb3yKR/NV1aS8KctY/3R7u1PIEFFCYkPXJ3uS9GapZSMF7B4sjB
         P829hVnFfvAw4BKXC5UDEtzwnEAKBU13i/k5CT5V6bI2kUpirg43xYLAbGQdR0Ckc++x
         o+ig==
X-Gm-Message-State: ACgBeo0AdTVjjPffrs+TvCFOx0ANFfn2FS/20/3viUwYRw5vTSSp0Kfv
	426VYBlTUt+vxV2Ef5EOAcbVT+XPITk=
X-Google-Smtp-Source: AA6agR5HFIn9x2Nfihxx+X7rvP9mQrh+0fzYESFNay7KqUAMxXqLyyvr7HgjmPtUD/1VpOxvT+Ik33q1JvQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:5f10:0:b0:6a3:7eb:762 with SMTP id
 t16-20020a255f10000000b006a307eb0762mr718810ybb.85.1662053778908; Thu, 01 Sep
 2022 10:36:18 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:10 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-23-surenb@google.com>
Subject: [RFC PATCH RESEND 22/28] x86/mm: try VMA lock-based page fault
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
2.37.2.789.g6183377224-goog

