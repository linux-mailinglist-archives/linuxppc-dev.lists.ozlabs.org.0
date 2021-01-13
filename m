Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B42F4597
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:57:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0CX1WZSzDrSd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JhWsql9x; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgR3VFfzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:51 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id q4so581727plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6d+6VYdDdP3oBm/yuIboyzIzyfxrGfpnAQvNu/gTJQ=;
 b=JhWsql9xgfhdUjeoERlen3gfsowUwvW9l8ZRSH8kPMXlq+d6lPgDnpDDzILpBwPDop
 EyjXVxyDk7ZdAVeZllXCd94fWNUWWINKSEQZQSZK8vyueNC6mbanpHt1kZkgcu7Hv2U9
 zC9SbytS1lZOmor5h1+26Kg902X3dPMwL8vWi7PfZQW3/lN/gsoCtrCJbyO1akT7oIKn
 U14rltKdaNgUDOBtpJwaX9CyurYIAZcYhbsZbxnRMMn/JskW1S6WfMEQcudkh7UzJGID
 iI85MQ07Yd2CoP5CywG3ft+I5Q0QDkWWPjx2XdJIZFduf8b7wxQYXEIC/iVYF8+XpwVy
 64Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6d+6VYdDdP3oBm/yuIboyzIzyfxrGfpnAQvNu/gTJQ=;
 b=U4lATByRCIuDluMx6KAjqyJ1gsxiBnnxVGz+u3/Qjblu6Uh1M27POP1dWOjwNDqgLS
 MfXvlIYjVzVNe9+GP9ZYz/PBHEZ6rxEv3XTv7gR6BElgZy0ZnRgIcsjdf/FKgliVB0P+
 cxMsjCJaSuH67DVfkP0hgkkthfIFwzF8+TqeJbKyIDa6vLd5xbr+nWKhqKtKFlzDaxZS
 XfNUiyAw5hdvBNRhsTvE6hk9w6Zc1LeT7wr95SQpxaBu6IUHYY1+Bi9Bn0wEke4rDxRf
 T3TQdg8NL5nCDtGZMMfAXH8j1BITrNg0QHTi1oHTMLvTpb7CrzTDAi1Ib+s8ls8BV+ye
 mmHg==
X-Gm-Message-State: AOAM5306hResLQjvIkoB76i7CFYS11DIt4F3v8LOVPGp5lIw6tzzKf5y
 tjBBE/b5WJFK0dzOVlapQyy7xUEEI6s=
X-Google-Smtp-Source: ABdhPJzzXV+aJTMJTS+/tuHdSxBzmW7DpThc5wqJRRUnBAS7igBWsX6yiuVCzvizUgDYyfgpy1KY6w==
X-Received: by 2002:a17:90a:5a86:: with SMTP id n6mr897089pji.65.1610523168231; 
 Tue, 12 Jan 2021 23:32:48 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/21] powerpc/64s/hash: improve context tracking of hash
 faults
Date: Wed, 13 Jan 2021 17:32:04 +1000
Message-Id: <20210113073215.516986-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
 arch/powerpc/mm/fault.c               | 29 ++++++++++++++++++++++-----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 4220789b9a97..e048c820ca02 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,6 +112,7 @@
 
 struct pt_regs;
 long do_page_fault(struct pt_regs *);
+long hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
 void __bad_page_fault(struct pt_regs *regs, int sig);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 453afb9ae9b4..801d5e94cd2b 100644
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
@@ -1563,9 +1562,11 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 		err = 0;
 
 	} else if (err) {
-		err = do_page_fault(regs);
+		err = hash__do_page_fault(regs);
 	}
 
+	exception_exit(prev_state);
+
 	return err;
 }
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index e971712c95c6..495edce9dc51 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -391,7 +391,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
  * The return value is 0 if the fault was handled, or the signal
  * number if this is a kernel fault that can't be handled here.
  */
-static int __do_page_fault(struct pt_regs *regs, unsigned long address,
+static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 			   unsigned long error_code)
 {
 	struct vm_area_struct * vma;
@@ -544,16 +544,15 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	return 0;
 }
-NOKPROBE_SYMBOL(__do_page_fault);
+NOKPROBE_SYMBOL(___do_page_fault);
 
-DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+static long __do_page_fault(struct pt_regs *regs)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned long address = regs->dar;
 	unsigned long error_code = regs->dsisr;
 	long err;
 
-	err = __do_page_fault(regs, address, error_code);
+	err = ___do_page_fault(regs, address, error_code);
 	if (unlikely(err)) {
 		const struct exception_table_entry *entry;
 
@@ -580,12 +579,32 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 	}
 #endif
 
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

