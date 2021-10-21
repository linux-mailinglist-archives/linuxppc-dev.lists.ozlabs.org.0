Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1446435997
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYbH1pQtz3ckw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M/EdvDW0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M/EdvDW0; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWt3lFcz2ypT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:34 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id m14so4702045pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4s9pmP0tnVNJToxJmcbHZ0PhUVJ8d2vdAap4hxBxZhY=;
 b=M/EdvDW0JCsEKQmXWLyr+FBqT2Gss7GV7+9mnh7inc/j3QlpK+GYoLh2Tvt6NSht9I
 fsEeUBclpPyduD8y3qsoj0WpJKSNQj5fZYFpX5H91MmcteWZf8mi/pvb/PkX3Hz04D30
 YoEour0IdRowLFhnhpJayspLfxYf9LQVNf5mfoaAiUw/aKPTl7HDGQu9BnPUv6tWYX27
 B1UC++vkYVOsk6cJv6fDHPTMLGLceLE+NlGGKpZbCu9sxFiKqqi6tEaNa5TISRDAG+1a
 LI/q4g8fs2SFLLlfDkxWlvNjd/5PE/MujQfAZWLYKucaXoAtXONc3V0YmAmcMebzFJ25
 HhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4s9pmP0tnVNJToxJmcbHZ0PhUVJ8d2vdAap4hxBxZhY=;
 b=m/fd4seVWlXixoFn8fFNUVfPHcBLe8kF3g3RUPvDFsd/kJBEmJwRCkE8slWUHD6Uht
 7jkzxoRAXLqurqU7CtGBB6pqV2CAfhEu6ue3+mFKl7iADZq+HH6/vQ23MpqQOimmyQGw
 +Tvx8D6ioeWPvPYaWT8T6sPKCzHvrbHl4icT4JP8CYBciWc6gGrcWWhLaAJq3uabN16b
 7Ni+n0oXofm2MAjkMZODjH2MePLuKWyP6t15sE5b17eo2U/Ri3oC8vWQIn//wb0RalX3
 Y/q9dbXRIQP7WvzjHTmhZGQGOilhYmcxgGglbvI3UKdUo8VkpYwX8jTK30ihlmEVf5zr
 o6QQ==
X-Gm-Message-State: AOAM533WsechYtlSD3dDp9kwKMS1n//av3tzO6IzrCkQGHOfU0G8Bgsd
 jcB2L4niy517EBdYCzdspj1Sfluu1vg=
X-Google-Smtp-Source: ABdhPJxqgER09TYXSrBcg2YwkqoN4jHYKoIzCK1MhULZvKTVeyHv3EchG13xhVAe6+w+rjqDwzeYLA==
X-Received: by 2002:a05:6a00:1c60:b0:44c:def1:a66b with SMTP id
 s32-20020a056a001c6000b0044cdef1a66bmr2913700pfw.7.1634788471809; 
 Wed, 20 Oct 2021 20:54:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/16] powerpc/64s: Move and rename do_bad_slb_fault as it
 is not hash specific
Date: Thu, 21 Oct 2021 13:54:05 +1000
Message-Id: <20211021035417.2157804-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

