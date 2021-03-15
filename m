Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48433A9F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:21:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzMC46CLVz3dFn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:21:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dDUb4Os4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dDUb4Os4; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM741VG9z3cKp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:52 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id s7so14587424plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcobSX5bz5XP8QBk+eoQVYyQyURsF9Lc4lF6CyHqxMc=;
 b=dDUb4Os4PAlFDwT1wv3PHCbojndQuGwrbtyOaorITnVf6LgHVkEASdelEfR3avfoD6
 0CiQc4/XtaLavVeHl2BVvUydTWkgVzLg2shgfiWwJMmQFwVvNuEmcbPZHgp/IiV8OaRr
 BZuHl8OBTN61PDwB8BpGbvT3nJSIYgKw2ApZuRA5attOP6Eh0SIro5guBSZmPofVM1+7
 RbNPmUW5GZ0nVseJUReO0LhzCd3H4pbJRVRFxK/zXQbK+JcF3Sa0q4Z0o7DNjIBIfKmR
 hz174qVE6LnXskdx++PUdluOVnDO0qrcqrS+qrVjSZXjzdc0EEMHggh7O0c20h+KtuAm
 8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcobSX5bz5XP8QBk+eoQVYyQyURsF9Lc4lF6CyHqxMc=;
 b=BjFeRIjSC+U9zrVy5GZF2ztVy79r2Chz5/Oo3Db4jcmBpAJMjvsQ5hzxSOQpAuJvdZ
 /uSJnC1t8HeE4JGROeCPOZeijSTGms09NJKbOY+Lr+maXTMrNklipNpMzRm6jlKvPpFh
 ycvAV+x7G8NtDxD190tUt6H5yQuzy++GRUb8PWNAAMnMwhZRhi2vqrEeE/x5aNLWAEYC
 wyJ0Ac4JLEi/GV2AdfaXH6pZxXadJuQbvYk9LFVuZJSgZXenKhI2ucLhVrMQubKagmfD
 H/UaHKqSzT7T4a9hdjBwkbE3KbQ4wGuCAZwa8VGIfLHNx2EVDFHKBU10G862aw3D/+IB
 nRxg==
X-Gm-Message-State: AOAM532LCoTFDzMBWt0N51lmoV4WByQ8mVF6C/xe/DHvmqGejtxW/uoq
 BfLJRG8pQUeXpQxIP4WewZyV176qcyQ=
X-Google-Smtp-Source: ABdhPJwF+QXvAh1TKumwG+gd1ElTGwX5CRUKLj2d6IxhYmQSKyT665ulbfeJ4YzoJ6zYINDJbYgUfg==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id
 d17mr10342304pjw.21.1615778269370; 
 Sun, 14 Mar 2021 20:17:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/10] powerpc: clean up do_page_fault
Date: Mon, 15 Mar 2021 13:17:14 +1000
Message-Id: <20210315031716.3940350-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
bad_page_fault, and do_page_fault no longer needs to return a value
to asm for any sub-architecture, so some cleanups can be made there.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  4 +---
 arch/powerpc/include/asm/interrupt.h  |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++---------
 arch/powerpc/mm/fault.c               | 25 +++++++------------------
 4 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index d1635ffbb179..d02c93e30d4a 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,11 +111,9 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-long do_page_fault(struct pt_regs *);
-long hash__do_page_fault(struct pt_regs *);
+void hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
 void __bad_page_fault(struct pt_regs *regs, int sig);
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
index 44833660b21d..d4e66ec78189 100644
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
-- 
2.23.0

