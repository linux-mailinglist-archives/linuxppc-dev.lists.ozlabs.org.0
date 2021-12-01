Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2646504A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J421q4Przz3dht
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nYoPZQfD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nYoPZQfD; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yK2qQXz3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:17 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 137so16762861pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=nYoPZQfD849e9WvjMbAu6H0d1Fcj3+Za8NBjlQELBlTHiaRavhiU2TvIXDNmOhpYre
 AvA++gUjD6fFld3vX6Dv99EwyPv/TF2OdKrk2+zzsR15iKRkz34q3GcmgFQNRCvfbiLG
 g1lnXjK34+CSx/tjY5oCPIuYkGlrICHHr6lQdoo/JOutiDJ0Pub8F9nXj33cmkz/VpZO
 TvqshfeaKjAAt434aqbXFoRwInStk1pnJoaWdUYBSBJaktE/kVQqXE/fdlwjy0jQfXMy
 4ABSmbVGhV0yRFT8DtKwYs3MlVfph8j/0bj75H8RN0ihBgQOVDSilxdEREtfDcqramQI
 5cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=SnSiK+Lcg0IAtyRUpGXvKBqn4nTk/lJC8Nhsp8TdC2X3CuYiKyo27wq/cGFlLOQCVy
 mC/pyymHtL17yku8lp8A6h2b9eVHzXMFp0euKWan63GVTMwaXJyyAcGcPPka2jnSIGYZ
 2iPR4DyeU000iyc/lyeM1+Hdfn9+4OmpGZk/ZaUvEyXmLQDVa/wv8KIWqRmPCJ4eeWwO
 mUVPTIwl+uqMnIwxckMzlQ8l/x6dYrBwc0YQSpClF9WmayPbxXtUZHR0b2YjqYyl3eZD
 +1shIr9g//UHjSLpN6okV3Vsn/i7XP3AvRqiviF9QZxSpiJ34VarBSh9V62KJzQpCkud
 nFzg==
X-Gm-Message-State: AOAM532Ug0Vib7mE+h0iD/yL1xnIhb/PmF+XON9NkhtN5E4Q1A2TowRv
 /23wcXDiFm4AuV+a0DoSfJ5m1KSHt0k=
X-Google-Smtp-Source: ABdhPJw8SXlb0FPOTa5nWFa3n8OOP4L/9SQ01iN+rK+mBj08/20kZ6vfqxlsNQOn54gHeBh51xSUKg==
X-Received: by 2002:a63:31ce:: with SMTP id x197mr4964452pgx.14.1638369735101; 
 Wed, 01 Dec 2021 06:42:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 04/18] powerpc/64s: Move and rename do_bad_slb_fault as it
 is not hash specific
Date: Thu,  2 Dec 2021 00:41:39 +1000
Message-Id: <20211201144153.2456614-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

