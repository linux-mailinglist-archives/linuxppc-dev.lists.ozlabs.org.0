Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 698902F833A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:03:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTZM3XJXzDsq8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gIoznfEK; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzj3tVczDsj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:01 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n25so6376809pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfuW3OBNVxOx5+3Je2D6nQzqKLC31D4CltGbRaKLEio=;
 b=gIoznfEK1UPu7jV4xGTCU5MCTy6lLQPDGy24bcU+R661tIxYfGWlkssT7zk5vBCCXn
 u43v9GUoCl3A+dZwKeujO9AS0SNz457uE1YohR8oOAFllCHG2nRcV2JMG3vq7gchcJMM
 JMj2/nvBV/8I7YQR//aP5uxY4RTZvCbF8HigPYiHiqI+dwNAiRGR0dr4oNXFz3jwb4PD
 lKxXYmjLDfJTCioe6u3wTW6ZITxzHJCyZwtrPRs/KBV3ktsdPOGCO/1+8ETjlTaXdy8y
 Py/wSozLCbu7BFeafnGZqG2M+fY80pBSu+gd7QGS+wjr2eZktWfFznLuBoboQTy7SDUR
 ox3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfuW3OBNVxOx5+3Je2D6nQzqKLC31D4CltGbRaKLEio=;
 b=g3rb45YseQyOgAfGRaAdvTAXAKBx2LFUFdgPCL11gc/Q2KKN7l0u1g/DZmXnI8yNz/
 k4eMskkIIwkd/3DwF3yGl+hFC6uH9EVibbB5nUDWioubi1l8o2RQY3pbDN21XXyNK4Pi
 0bWGZ4mbn9aF8j8DdK5AfVbvYtj69f8xoYr2OkoHI4tOFt1D0SS3zqto3pcPGkZjXM36
 5x0zFBe7U2D/EdN6CXrgQcMSnUzuJ/vfQ7tF+GItxByifwv+qOPMj9iHWiyAz+iFu+yd
 p5lStNygW20GyRvxoPeqShynMNnHwhNaL8kES1/w1mf18L6h2AtCcZXa4wKGxvbjaK1m
 jcGw==
X-Gm-Message-State: AOAM530A1SygIGMYJsigZGh1Ygvy7fK3JoHS+CZuyO9TRb4evefSt/p4
 L5UDdBvyD7czSOlu2hV0A5AYVG73uUw=
X-Google-Smtp-Source: ABdhPJygeqZVszvaQ8+8TjqMwGhq09iRuCzyDbL6RRilWSzb2I3Eglk4EUY+jGD15P91a/dlvQ9RXw==
X-Received: by 2002:a63:574c:: with SMTP id h12mr13480271pgm.79.1610729519491; 
 Fri, 15 Jan 2021 08:51:59 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 28/39] powerpc/64s/hash: improve context tracking of hash
 faults
Date: Sat, 16 Jan 2021 02:50:01 +1000
Message-Id: <20210115165012.1260253-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the 64s/hash context tracking from hash_page_mm() to
__do_hash_fault(), so it's no longer called by OCXL / SPU
accelerators, which was certainly the wrong thing to be doing,
because those callers are not low level interrupt handlers, so
should have entered a kernel context tracking already.

Then remain in kernel context for the duration of the fault,
rather than enter/exit for the hash fault then enter/exit for
the page fault, which is pointless.

Even still, calling exception_enter/exit in __do_hash_fault seems
questionable because that's touching per-cpu variables, tracing,
etc., which might have been interrupted by this hash fault or
themselves cause hash faults. But maybe I miss something because
hash_page_mm very deliberately calls trace_hash_fault too, for
example. So for now go with it, it's no worse than before, in this
regard.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  1 +
 arch/powerpc/mm/book3s64/hash_utils.c |  7 ++++---
 arch/powerpc/mm/fault.c               | 30 +++++++++++++++++++++------
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index c10ae0a9bbaf..d1635ffbb179 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,6 +112,7 @@
 
 struct pt_regs;
 long do_page_fault(struct pt_regs *);
+long hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
 void __bad_page_fault(struct pt_regs *regs, int sig);
 void do_bad_page_fault_segv(struct pt_regs *regs);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 824fcb2627e4..b7b78aeea3eb 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1289,7 +1289,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		 unsigned long flags)
 {
 	bool is_thp;
-	enum ctx_state prev_state = exception_enter();
 	pgd_t *pgdir;
 	unsigned long vsid;
 	pte_t *ptep;
@@ -1491,7 +1490,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 	DBG_LOW(" -> rc=%d\n", rc);
 
 bail:
-	exception_exit(prev_state);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(hash_page_mm);
@@ -1515,6 +1513,7 @@ EXPORT_SYMBOL_GPL(hash_page);
 
 DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 {
+	enum ctx_state prev_state = exception_enter();
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
@@ -1563,6 +1562,8 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 		err = 0;
 	}
 
+	exception_exit(prev_state);
+
 	return err;
 }
 
@@ -1599,7 +1600,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 	err = __do_hash_fault(regs);
 	if (err) {
 page_fault:
-		err = do_page_fault(regs);
+		err = hash__do_page_fault(regs);
 	}
 
 	return err;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index eef7281507f9..620ff623b2c6 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -387,7 +387,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
  * The return value is 0 if the fault was handled, or the signal
  * number if this is a kernel fault that can't be handled here.
  */
-static int __do_page_fault(struct pt_regs *regs, unsigned long address,
+static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 			   unsigned long error_code)
 {
 	struct vm_area_struct * vma;
@@ -537,15 +537,13 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	return 0;
 }
-NOKPROBE_SYMBOL(__do_page_fault);
+NOKPROBE_SYMBOL(___do_page_fault);
 
-DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+static long __do_page_fault(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
 	long err;
 
-	prev_state = exception_enter();
-	err = __do_page_fault(regs, regs->dar, regs->dsisr);
+	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
 	if (unlikely(err)) {
 		const struct exception_table_entry *entry;
 
@@ -560,12 +558,32 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 		}
 	}
 
+	return err;
+}
+NOKPROBE_SYMBOL(__do_page_fault);
+
+DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+{
+	enum ctx_state prev_state = exception_enter();
+	long err;
+
+	err = __do_page_fault(regs);
+
 	exception_exit(prev_state);
 
 	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
+long hash__do_page_fault(struct pt_regs *regs)
+{
+	return __do_page_fault(regs);
+}
+NOKPROBE_SYMBOL(hash__do_page_fault);
+#endif
+
 /*
  * bad_page_fault is called when we have a bad access from the kernel.
  * It is called from the DSI and ISI handlers in head.S and from some
-- 
2.23.0

