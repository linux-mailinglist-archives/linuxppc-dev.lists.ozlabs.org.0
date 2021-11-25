Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCA45DA76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Hqs4Wxsz3ddB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:53:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nZrgtw8S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nZrgtw8S; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0HmS2fWYz3051
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:50:48 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id g18so5843085pfk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=nZrgtw8SbQ+jkHq+NlomXkNqV8HuSw7SVcklIdX2Ux7IqQvLHOOdN8TjPh0cSzjo2h
 VQWXvjkFbkpnhUNKiWVntgoiJXLkD5vSHqnJbdL6+DO2yEJIAHcFldvCcbIZQCgwhGTn
 FHA/kPNG5c2D8tAu9EAyMjZMMM2H1yU8i57GOBrneQPU1ccE9sAlZGAOwAhZPl0/s4+F
 ELD6oCCwxl8EtDXiLW/XHupR9Vp+EO8QP7S3wRcnIsPGDJ7p/ZcZkTcwpvBpPLPSgcbM
 hbwMr9FVZkM8RKIq5CGLW7kwunXJ2/rMojGNA1NmDy9S89zqzo42uEJZyRrwH5b+oPZR
 fArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=K6N4NebCgMw6VGt+UdV7Qb9Zif3i9jfabw8aWJwgsYGTD8SXPy+ECmjuaAYtZ6oDMy
 Mr0w2tGD8a7ho+vQWlq/Qgx6Fw/yTZFsEzsNiCfjeMm8Q+zyg8IkC0MvPvaAYfApdQH0
 6VJONx9sXN1UoQDqBIHHp46LM+7NipJjSEAqym4YdrWc3COhf+gZ48RzDgkgLE6qA/bH
 WVLiXacdsFBm3N9IELBMqcq98RqWR4gKXZocfRw9uPjPGlOEhzrjNh43Ktx6mQimBK0o
 dPgk2zzumbIe7xe6lpvWoUR0/FPNHae5QGcz/UtlvN533SrsYxpC+zL27fMDSRAvmDd1
 BymQ==
X-Gm-Message-State: AOAM530dWLckTmqbu5Ao1hbZ29IC2nZx1CSuakaX6GQEA21RqOdsIvVF
 d2PnzsFirm12iHYfF7WkLweqFacX8uY=
X-Google-Smtp-Source: ABdhPJyRoJdNM4ueMhMfMXFSx2jQvPzRelSiIEHl7qQ+7s8D2CzFCRu2E8so0iNDNkOTZavUC3su1A==
X-Received: by 2002:a05:6a00:ad0:b0:4a3:1056:e2ae with SMTP id
 c16-20020a056a000ad000b004a31056e2aemr14087273pfl.2.1637844646001; 
 Thu, 25 Nov 2021 04:50:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/17] powerpc/64s: Move and rename do_bad_slb_fault as it
 is not hash specific
Date: Thu, 25 Nov 2021 22:50:12 +1000
Message-Id: <20211125125025.1472060-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

slb.c is hash-specific SLB management, but do_bad_slb_fault deals with
segment interrupts that occur with radix MMU as well.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  2 +-
 arch/powerpc/kernel/exceptions-64s.S |  4 ++--
 arch/powerpc/mm/book3s64/slb.c       | 16 ----------------
 arch/powerpc/mm/fault.c              | 24 ++++++++++++++++++++++++
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a1d238255f07..3487aab12229 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -564,7 +564,7 @@ DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
 
 /* slb.c */
 DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
-DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
+DECLARE_INTERRUPT_HANDLER(do_bad_segment_interrupt);
 
 /* hash_utils.c */
 DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index eaf1f72131a1..046c99e31d01 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1430,7 +1430,7 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_bad_slb_fault
+	bl	do_bad_segment_interrupt
 	b	interrupt_return_srr
 
 
@@ -1510,7 +1510,7 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_bad_slb_fault
+	bl	do_bad_segment_interrupt
 	b	interrupt_return_srr
 
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index f0037bcc47a0..31f4cef3adac 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -868,19 +868,3 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 		return err;
 	}
 }
-
-DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
-{
-	int err = regs->result;
-
-	if (err == -EFAULT) {
-		if (user_mode(regs))
-			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
-		else
-			bad_page_fault(regs, SIGSEGV);
-	} else if (err == -EINVAL) {
-		unrecoverable_exception(regs);
-	} else {
-		BUG();
-	}
-}
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index a8d0ce85d39a..2d4a411c7c85 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -35,6 +35,7 @@
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
 #include <asm/page.h>
@@ -620,4 +621,27 @@ DEFINE_INTERRUPT_HANDLER(do_bad_page_fault_segv)
 {
 	bad_page_fault(regs, SIGSEGV);
 }
+
+/*
+ * In radix, segment interrupts indicate the EA is not addressable by the
+ * page table geometry, so they are always sent here.
+ *
+ * In hash, this is called if do_slb_fault returns error. Typically it is
+ * because the EA was outside the region allowed by software.
+ */
+DEFINE_INTERRUPT_HANDLER(do_bad_segment_interrupt)
+{
+	int err = regs->result;
+
+	if (err == -EFAULT) {
+		if (user_mode(regs))
+			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
+		else
+			bad_page_fault(regs, SIGSEGV);
+	} else if (err == -EINVAL) {
+		unrecoverable_exception(regs);
+	} else {
+		BUG();
+	}
+}
 #endif
-- 
2.23.0

