Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E833D221
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:46:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F092Z3cKPz3dZ0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c7BZuKbq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c7BZuKbq; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08yJ69Xgz3bp8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:43:04 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so1140637pjc.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHBakQGx0PJumfnLxL5xsagbNgD0RRVQ8X2xsl8PbfU=;
 b=c7BZuKbqVX6SLsLi4SyTc4Qms7vcMW9wYDKH55owQfNgT0bBC5UybD7JJZlF7iqQDs
 UGn0uMhZ/VQOYRQILTe7nFO7ni/5MIZOAQUFuQxJkyPX8h/9eQQXDoCwHcQmZSpBwc4J
 K8JvphaSdr/X8YLmTkQc+MweMFXg4v8yHsG1jXc0+3vdEmf+ZTN01ewQtsf+Km0h/S+s
 BHz6fUHWcvqNpn3KBD41lnVN4N0wcDx02O+Kgkzzb/1TiQRcySY2l9UiEmgycZ00CSTf
 nK4aTBIh5Ru76Rwbw8r0O+DWdKRgGKw089NZ98/+LI7VADSU85f9rXQ3K2lVAo1mm+tl
 NUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHBakQGx0PJumfnLxL5xsagbNgD0RRVQ8X2xsl8PbfU=;
 b=d+lEIOWhYdImLNjWWyrGDHXxr/qYEC6GAqAZbI/pwoRwe/AGN5RScBNsCK0PBrqH9x
 xBtxmahACG/obX6EIlw0nUpPwUNB/Nq+W+zJ7lgps0qwPE/GLEpqoVu/6d5sSn28wb/Y
 Xk72nRG5XDQVfKK1gyz41CxSM/02Z+WiczOMzPlBaSDPt0Y6e0ndCP8+KA0gb44Axq8L
 2K7nHqwNBThAFP0fdZSf/yMH2jw/ymyYUVgawSuKNWiA/gJT37txlo5AtRtV7xjIEe+v
 eohFvQDhR/D0KxUe59oQucI5PIPP8JBcSE9OrDVQlSZbOX+WSdaIn/iUB9n9y22w824u
 xQvg==
X-Gm-Message-State: AOAM531FsBuPlTgy8IvhdmnVRBqfnd7/r4k0WZdfYhWmUdpXDt198qlP
 nNasUwIXb5N3qvUG/5cOMEG0wZSPf6k=
X-Google-Smtp-Source: ABdhPJwc+r+DWKtuOeKUM/7RUOSAdVZgMqfLRfyfgOd08t8S+znKIL7uGpF3EtZjIOf/KZ76SAlAIw==
X-Received: by 2002:a17:90a:c289:: with SMTP id
 f9mr4268629pjt.105.1615891382384; 
 Tue, 16 Mar 2021 03:43:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 r30sm15828489pgu.86.2021.03.16.03.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:43:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/11] powerpc: clean up do_page_fault
Date: Tue, 16 Mar 2021 20:42:03 +1000
Message-Id: <20210316104206.407354-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210316104206.407354-1-npiggin@gmail.com>
References: <20210316104206.407354-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

search_exception_tables + __bad_page_fault can be substituted with
bad_page_fault, do_page_fault no longer needs to return a value
to asm for any sub-architecture, and __bad_page_fault can be static.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  5 +----
 arch/powerpc/include/asm/interrupt.h  |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++---------
 arch/powerpc/mm/fault.c               | 27 ++++++++-------------------
 4 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index d1635ffbb179..0b2162890d8b 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,11 +111,8 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-long do_page_fault(struct pt_regs *);
-long hash__do_page_fault(struct pt_regs *);
+void hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
-void __bad_page_fault(struct pt_regs *regs, int sig);
-void do_bad_page_fault_segv(struct pt_regs *regs);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 94fd8e1ff52c..bd0bd9430f78 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -420,7 +420,7 @@ DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
 DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
 
 /* fault.c */
-DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
+DECLARE_INTERRUPT_HANDLER(do_page_fault);
 DECLARE_INTERRUPT_HANDLER(do_bad_page_fault_segv);
 
 /* process.c */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 581b20a2feaf..1c4b0a29f0f5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1572,10 +1572,11 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 {
 	unsigned long dsisr = regs->dsisr;
-	long err;
 
-	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)))
-		goto page_fault;
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT))) {
+		hash__do_page_fault(regs);
+		return 0;
+	}
 
 	/*
 	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
@@ -1595,13 +1596,10 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 		return 0;
 	}
 
-	err = __do_hash_fault(regs);
-	if (err) {
-page_fault:
-		err = hash__do_page_fault(regs);
-	}
+	if (__do_hash_fault(regs))
+		hash__do_page_fault(regs);
 
-	return err;
+	return 0;
 }
 
 #ifdef CONFIG_PPC_MM_SLICES
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 44833660b21d..2c6e9a6bb86f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -539,36 +539,25 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(___do_page_fault);
 
-static long __do_page_fault(struct pt_regs *regs)
+static __always_inline void __do_page_fault(struct pt_regs *regs)
 {
-	const struct exception_table_entry *entry;
 	long err;
 
 	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
-	if (likely(!err))
-		return err;
-
-	entry = search_exception_tables(regs->nip);
-	if (likely(entry)) {
-		instruction_pointer_set(regs, extable_fixup(entry));
-		return 0;
-	} else {
-		__bad_page_fault(regs, err);
-		return 0;
-	}
+	if (unlikely(err))
+		bad_page_fault(regs, err);
 }
-NOKPROBE_SYMBOL(__do_page_fault);
 
-DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+DEFINE_INTERRUPT_HANDLER(do_page_fault)
 {
-	return __do_page_fault(regs);
+	__do_page_fault(regs);
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
-long hash__do_page_fault(struct pt_regs *regs)
+void hash__do_page_fault(struct pt_regs *regs)
 {
-	return __do_page_fault(regs);
+	__do_page_fault(regs);
 }
 NOKPROBE_SYMBOL(hash__do_page_fault);
 #endif
@@ -578,7 +567,7 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
  * It is called from the DSI and ISI handlers in head.S and from some
  * of the procedures in traps.c.
  */
-void __bad_page_fault(struct pt_regs *regs, int sig)
+static void __bad_page_fault(struct pt_regs *regs, int sig)
 {
 	int is_write = page_fault_is_write(regs->dsisr);
 
-- 
2.23.0

