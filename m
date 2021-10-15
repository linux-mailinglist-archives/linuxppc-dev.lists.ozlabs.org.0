Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB842F750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9gm6fWRz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JAaT4UT8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JAaT4UT8; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cL1XTbz3c8T
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:42 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id j190so2223072pgd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4s9pmP0tnVNJToxJmcbHZ0PhUVJ8d2vdAap4hxBxZhY=;
 b=JAaT4UT8WgEmNTPfJ4af9K1wmwLNOoeCpmwgK3JclrERL7V6FPxdUbXL1UKAqhJHQR
 9x2OOv11oc0FieLjCVud60JKOsoRMeygeD6+MC7OyVlzXpiGaiOUt//BIErIvSoFQCj3
 t6SgONu+qUvzzjIjjmY/+rLiNac+rCRkX+VMFuQtUPAQJkjUIoQwp+tBGP8vXN0CiIgW
 TquAyOhKuuN1PcvPOMrjO3t7uLyVL/w4YxX8MXdXyAWdwSuOXcwWJpho2u5tRzg5Htkm
 X0ozJJgbBAgRzHEICg37MyCSkZ529q4MvEBQDVQzFsnYM/8SHVhYhTc5xRsUnwZYzAbR
 s+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4s9pmP0tnVNJToxJmcbHZ0PhUVJ8d2vdAap4hxBxZhY=;
 b=taij/D4HRiutxTWTFD8tJLAjgITs+S63adgOxTs0pMzxaErxMG3vljcoWUaeobyJ0V
 YtSV0CARat4FS4Tvtd3rnGPzYiPJJECFtV033xx3tk96mftGetcVH9w69gmePPE0EapY
 ENOCCYyu3tOfXAtMzLaQ/CWPWAoe5iqPuWI1W1WV4fs3l8/SGGqlHGCjzIiSPGosYXDx
 xRdgDMl/0hYhjnDA+QSNnhxg/20JmBTkBARwupmNh6OzCRN3G/mqlqeduCt5tF6lnNqc
 ztuS0AySPtt9IFirytEVzlbZsK2yZpjzJuix56SQcF1JOoomLZpfDKJOgrke6YBKiuZ3
 uaTA==
X-Gm-Message-State: AOAM5332OUNCz+RrxdLI/xZu38dgnMxiMWCBNJsUv/T0pkIgiZQ+wD8M
 BsGdG5X50ylNlGsIF5mB/Rpn/NmGj7Y=
X-Google-Smtp-Source: ABdhPJzS0RZj5nE+Qz4WOJbJqBFKY7ufhC94OWz0ebUySgolekzCXJre9nGHacqQ34rK3TSeZrJW1w==
X-Received: by 2002:a05:6a00:1354:b0:44c:eb65:8570 with SMTP id
 k20-20020a056a00135400b0044ceb658570mr12408769pfu.34.1634312800084; 
 Fri, 15 Oct 2021 08:46:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 04/11] powerpc/64s: Move and rename do_bad_slb_fault as it
 is not hash specific
Date: Sat, 16 Oct 2021 01:46:17 +1000
Message-Id: <20211015154624.922960-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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
---
 arch/powerpc/include/asm/interrupt.h |  2 +-
 arch/powerpc/kernel/exceptions-64s.S |  4 ++--
 arch/powerpc/mm/book3s64/slb.c       | 16 ----------------
 arch/powerpc/mm/fault.c              | 17 +++++++++++++++++
 4 files changed, 20 insertions(+), 19 deletions(-)

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
index a8d0ce85d39a..53ddcae0ac9e 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -35,6 +35,7 @@
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
 #include <asm/page.h>
@@ -620,4 +621,20 @@ DEFINE_INTERRUPT_HANDLER(do_bad_page_fault_segv)
 {
 	bad_page_fault(regs, SIGSEGV);
 }
+
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

