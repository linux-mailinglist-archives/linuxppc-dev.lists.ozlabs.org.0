Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C00952E875A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:55:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MLV5NYszDqGF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j0Kuo2o9; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7LhX4sDxzDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:48 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id n25so15798612pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNB+7/aXjyaQL5dBSseeb24nSDS/gKcecaDvR4Ahzrw=;
 b=j0Kuo2o9i/Tp1XwcdS/Tkn3LrazHzlp3bBJY+qQ4HPyzrcm9c8UdsUtjnaAame50sB
 4ZN27E0SO8z6EAX/qOluHQ7QkL3qAsJEgw4OAU2utRXX5MiTOEVvm1U2haDylMMZTMQ3
 hyaWKGh+7edxD4Qj5p0/yImIfFtBVrrXC7l5kHegZfPvMJbbjWF3UJFLOK7H5zJjcf7I
 /2ex8t+i4ruhUADuI5AT4zew1w0E5Fea7BFsiRlPkUP3qivzcY+ThgJ94M1rQJthxDzF
 D7qT5Ok/kX2/uGhlf0H7WbOycXobdG4cLKy6xj0c4e3+2vuq1EgYd9bI6ZlpbqkR+sm3
 6h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNB+7/aXjyaQL5dBSseeb24nSDS/gKcecaDvR4Ahzrw=;
 b=uVPwqIqsS3AfYESX5oLIQA6jJRtzt0UVGOtdZ60nVz2rCgmtSMJWTwk8fJ7JS/h/ht
 mPFzaMDbB8Wly2YaVINyLXvW/JmffjiPi6C9CLKdmiEsPbhpbEXIcL2wg5OWqep+EUs1
 wb7BNP5c37ADUipw903jWb/I6pmBTHh98/le+smSpFpZGkY46sqW3QtISlfif0Zk5M3b
 /u3BS2OqId3CVkmcUvcK8dFVJybZTA10g2cQ5++2H+NFfZAHca5phDp73pUX2B4jEXGF
 ypXEBOOo5cBXyWEl3RFSTvm+3nazMfFO9EXsIDR8pFfF4DyQZOxS09oZiEux1OEC5jkK
 1WQQ==
X-Gm-Message-State: AOAM533dfwa2qYS6C86P7wByWJggaen3HYOgtGho9g292qXtS6Bjbl5q
 f64tcGfLzEsZO2Hi6nt7o5sLAcmVixA=
X-Google-Smtp-Source: ABdhPJz/qQpTCsHMO0mdMYpLJFJFWBj5ekFr/xOe8IweEGwk1ooRryxRuFPmkytisdwxmQCch9eeUg==
X-Received: by 2002:a62:4e4e:0:b029:19e:aaab:8be with SMTP id
 c75-20020a624e4e0000b029019eaaab08bemr58755688pfb.59.1609590346327; 
 Sat, 02 Jan 2021 04:25:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/21] powerpc/64s/hash: improve context tracking of hash
 faults
Date: Sat,  2 Jan 2021 22:24:57 +1000
Message-Id: <20210102122508.1950592-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/bug.h        | 1 +
 arch/powerpc/mm/book3s64/hash_utils.c | 7 ++++---
 arch/powerpc/mm/fault.c               | 9 +++++++++
 3 files changed, 14 insertions(+), 3 deletions(-)

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
index 81dbce473726..cc71c93cceaf 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -589,6 +589,15 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
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

