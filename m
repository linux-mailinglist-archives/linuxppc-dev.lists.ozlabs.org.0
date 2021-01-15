Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C62F815E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 17:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHS7Q5ZnmzDqBX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 03:58:42 +1100 (AEDT)
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
 header.s=20161025 header.b=V6+pjLWF; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRy01CWwzDsgt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:32 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id q7so6357906pgm.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=urwJAA8tSck3fcCwGbZlLSb/aJxTZkh9sbovhbvuZ38=;
 b=V6+pjLWFdpZfPZZ67Kbmg6ismohFuYo4PMWej0L9/TtWaFIbRe2G0dIGRp6FcOH9Go
 KB4RoPx2k6r870UNnjbYcb9EoMGufzXt0P9jL6N1KHdgcZgQG7+RjDPP9s9YEUsv/TAY
 N3tzVMjgQ6zNPttEm3XI8+qQzvWtZx7a54TyCIJRgEIqHwXXlKrDWJ0kiK/pUJhqb+HO
 Jky43B67lxTLkgifVSk5WjPU2t/5vMeujOWUrfzTkTDp6sdol4R963rVyvZGjnUowH7b
 AJ9Id/+16ADgU81F3TNcWM9nJk8dlKk4UmIswuPv65fzDOTEj0wUIPlbLyFwFlS2OTVe
 eKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=urwJAA8tSck3fcCwGbZlLSb/aJxTZkh9sbovhbvuZ38=;
 b=pfkLFv2kkQhTXpunEL/5vIAVilklchYjjZfwGSyUsCQr0L9HVhkwWrjM/cNvYnIR7V
 Qx+TnK/mfr990PjqU/rXGZ8rAAJljEDUJPGe+S9cTMy3CPFNzD4ucpx92/YotfkYbAml
 BupGluHlNaeDztE3FnKa76j2/wZ312HcNLDWs6VErLQ/4b5z9aRAqPnu2v+tshAG5Eko
 cA5f76MMI2NcfKitw4+Q9ykeGV5iU7ReFf+VoCeVxsFHoweeq78NmyQjM5hq+dTuojRb
 HfVLvFlPgQVVejzvdRXrBAOtb1XKjPmsiXxQqj9W+Y+6xZR/pYkMBrJcVTvkQzvfHJYK
 EzCg==
X-Gm-Message-State: AOAM532nAuIc5bdIvONFoz+0u+Sk3E574T5+OzFS2VDZyZEshPIWsejM
 Oz8f/22xRFrpHor0JcEU355W5gro0dM=
X-Google-Smtp-Source: ABdhPJw0fGNmVqrgL8Nckv+v1YBA2oc1zG1LV09y2iVxEFvm6xtICLAi7WAhey/mz3dvgw6fss1GDQ==
X-Received: by 2002:aa7:810a:0:b029:1a6:501b:19ed with SMTP id
 b10-20020aa7810a0000b02901a6501b19edmr13677471pfi.17.1610729429294; 
 Fri, 15 Jan 2021 08:50:29 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 03/39] powerpc/64s: move DABR match out of handle_page_fault
Date: Sat, 16 Jan 2021 02:49:36 +1000
Message-Id: <20210115165012.1260253-4-npiggin@gmail.com>
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

Similar to the 32/s change, move the test and call to the do_break
handler to the DSI.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 34 +++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6e53f7638737..a6333b986a57 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1439,6 +1439,8 @@ EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	andis.	r0,r5,DSISR_DABRMATCH@h
+	bne-	1f
 BEGIN_MMU_FTR_SECTION
 	ld	r6,_MSR(r1)
 	li	r3,0x300
@@ -1447,6 +1449,18 @@ MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
+1:	/* We have a data breakpoint exception - handle it */
+	ld      r4,_DAR(r1)
+	ld      r5,_DSISR(r1)
+	addi    r3,r1,STACK_FRAME_OVERHEAD
+	bl      do_break
+	/*
+	 * do_break() may have changed the NV GPRS while handling a breakpoint.
+	 * If so, we need to restore them with their updated values.
+	 */
+	REST_NVGPRS(r1)
+	b       interrupt_return
+
 	GEN_KVM data_access
 
 
@@ -3228,7 +3242,7 @@ disable_machine_check:
 	.balign	IFETCH_ALIGN_BYTES
 do_hash_page:
 #ifdef CONFIG_PPC_BOOK3S_64
-	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
+	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)@h
 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
 	and.	r0,r5,r0		/* weird error? */
 	bne-	handle_page_fault	/* if not, try to insert a HPTE */
@@ -3262,15 +3276,13 @@ do_hash_page:
 	/* Error */
 	blt-	13f
 
-	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
+	/* Reload DAR/DSISR into r4/r5 for handle_page_fault */
 	ld	r4,_DAR(r1)
 	ld      r5,_DSISR(r1)
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 /* Here we have a page fault that hash_page can't handle. */
 handle_page_fault:
-11:	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
@@ -3281,20 +3293,6 @@ handle_page_fault:
 	bl	__bad_page_fault
 	b	interrupt_return
 
-/* We have a data breakpoint exception - handle it */
-handle_dabr_fault:
-	ld      r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      do_break
-	/*
-	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values.
-	 */
-	REST_NVGPRS(r1)
-	b       interrupt_return
-
-
 #ifdef CONFIG_PPC_BOOK3S_64
 /* We have a page fault that hash_page could handle but HV refused
  * the PTE insertion
-- 
2.23.0

