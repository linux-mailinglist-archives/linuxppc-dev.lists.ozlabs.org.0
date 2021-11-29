Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A0460D07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vjw6DjPz3dh3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eM0OX0fh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eM0OX0fh; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VfZ0pHFz3bZx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:21 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id r5so14475523pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=eM0OX0fhqrlbSHu7GQJ+MDcdfB33zgQrgrT0FktIdPq58LT545SWeTKvUKE5xxD1Ij
 o7mBVnraA/Q+qYLtH58smiISLekNsD5zzaHkIuiXuHXv2uh/OwDfoNKn0+X8YFPQx80i
 H3Mi9la2T4VxKhXWHVlstrPgGly+sf2EV1Mv0YOuKEvIVpLjCagQ2oBHouw8gSiZW/1p
 UM5J1XkFxzBoQJQv9JEwzZ2QoibD4T2gbOU3rpRY/8tN/o7mxuWPR+d7iGhfJpW+deLV
 rH4ewhSsovSf0hxun9JA5yf6w+gixhqryrMS3cv5olPQhLOHD8V37z9N3KwXeshvbGH7
 slBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKWFud3go7o/jf536uWSp+jHP8JUPhxDyRoHZkebU94=;
 b=4aMkG+w6elKmfMerCjgQFKpG+fgmJK8OjO5C13hNPz9jFrqXZ2Mnufzx6/KVKVEXtu
 HlDWlDNJf/jRrqvTckD5RnhAoxSEjofvM7mI7QO0RlDNRjYfEyGrl+RfWC9adN9Yij8X
 skcYYpGBgVMy0Bslk7WuVfVTJbAVDNeMDhHEGnNaZShGPRyTZFmF8RgO5Pa90lLI24Zb
 BmT111aCzgYGCbed+Tf1eDStex+lic+yBw95rb8WzOXtvgAPjV333tU+drGes2cqo0Kd
 kx7ST1MzaNIct8Dcky+si0J9AqiPhHD4750fCESbWom3Y4+serd14B01oxUy5iP9/46h
 u9gg==
X-Gm-Message-State: AOAM530MFnuZKDhhZ4X5vY4wrahCGxzPweF1ePfDoxtbp11Y2yMTibzp
 WcTUTRf9lpFYgBluZ1OaG0TsuccbxGs=
X-Google-Smtp-Source: ABdhPJyHofKdIL6oV4s3FEAWrBSaRt4jEp5V4Q/Vu55UhoQCUDueXyjoIiEkQUCMeCmeAE4uvuFaFQ==
X-Received: by 2002:a63:41c5:: with SMTP id
 o188mr33417294pga.206.1638155299798; 
 Sun, 28 Nov 2021 19:08:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 04/17] powerpc/64s: Move and rename do_bad_slb_fault as it
 is not hash specific
Date: Mon, 29 Nov 2021 13:07:50 +1000
Message-Id: <20211129030803.1888161-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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

