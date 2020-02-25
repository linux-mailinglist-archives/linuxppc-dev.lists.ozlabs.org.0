Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013016EE6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:55:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rp5s3qc6zDqHY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:55:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ptFWbvsw; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSS6D7zzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:12 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id d5so1568854pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDQ0qwTwP3IIhGf/Q1dUeM9VWkRP0b28DAl8kXSHU+A=;
 b=ptFWbvsw2+i6CUlrrJN5VIPP4PNQJoaczYe/wY5Uk/ni8zgvNn4Yu8W77/L6gCEyWe
 do/RWfkeVrklvzBQkXR9Mk7EbzV2SidwuZ04qzECGvGsZPyAoC4/MdhydmCzj1ksK85r
 m+qovsCA8/gl1FKNz9HGALJsBW/y06ijIATE2VEhwNa3s4XbBQ51d6pR9+PyLB0h8Ioy
 r+ivwKrmTzuSxSS4P9l7A3ra9oFB+ETOBoB4bG6dwYQJFg28dXOUZOI7suwMe5oxSFz6
 ImJmltVhPmm4fCiR88oW6CSS4FU6LZVkNZIBS6PgsC5u5nMBmtpjX0T2XCNd87EAouui
 EP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDQ0qwTwP3IIhGf/Q1dUeM9VWkRP0b28DAl8kXSHU+A=;
 b=QpBbCT+eoYZYezSvjL/4Bq4CPjXuJTt5UjjAvadFcrZEL/y7AgkporbpY9JJu3Y4Cw
 GwDVF67hW4RkEhnN8gTpturOati7FpypMAGJMEtO6UjcfsQwj1oxjPHgwzTKt/g7L8Ve
 Bk/wpQNNnFQnB9mxvSAKjnyaccXMlWRK8YEH+vmyYW42J2wBVpQL09GoE02B04mC14RP
 NbkYGDGQKKYREEboEgxsoURzB72vmNL2f3bsJ+LvKzCKwXasqnUCJ6RnB++6+3khEEH4
 HwvDRXaDDoSA9YanRYegVg1P7pey2rFPFxI0L54++mtw4nMngDrmFDnaRPoV9+ARA42d
 NW1A==
X-Gm-Message-State: APjAAAXkUEQlkeLYpD6eTg/pvWU/bsURAV42p6ldyEN/jgY1KdSLz79T
 b9aGZTBCAyJLdgUkr0fCZfYu6PJ7
X-Google-Smtp-Source: APXvYqwDhhHskDpIeM8QpcVe8wAOe63zfYe+Gq0jY/GmR7UcS6Tz0tq5FPmTUDSUq5pNRL1KHs136g==
X-Received: by 2002:a17:902:45:: with SMTP id
 63mr57157137pla.109.1582652467717; 
 Tue, 25 Feb 2020 09:41:07 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 29/32] powerpc/64s/exception: remove lite interrupt return
Date: Wed, 26 Feb 2020 03:35:38 +1000
Message-Id: <20200225173541.1549955-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The difference between lite and regular returns is that the lite case
restores all NVGPRs, whereas lite skips that. This is quite clumsy
though, most interrupts want the NVGPRs saved for debugging, not to
modify in the caller, so the NVGPRs restore is not necessary most of
the time. Restore NVGPRs explicitly for one case that requires it,
and move everything else over to avoiding the restore unless the
interrupt return demands it (e.g., handling a signal).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v3:
- Add a copule of missing restore cases for instruction emulation

 arch/powerpc/kernel/entry_64.S       |  6 ------
 arch/powerpc/kernel/exceptions-64s.S | 24 ++++++++++++++----------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index e13eac968dfc..6d5464f83c05 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -471,12 +471,6 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	.globl interrupt_return
 interrupt_return:
 _ASM_NOKPROBE_SYMBOL(interrupt_return)
-	REST_NVGPRS(r1)
-
-	.balign IFETCH_ALIGN_BYTES
-	.globl interrupt_return_lite
-interrupt_return_lite:
-_ASM_NOKPROBE_SYMBOL(interrupt_return_lite)
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	beq	.Lkernel_interrupt_return
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d635fd4e40ea..b53e452cbca0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1513,7 +1513,7 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM hardware_interrupt
 
@@ -1541,6 +1541,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
+	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
 	GEN_KVM alignment
@@ -1604,6 +1605,7 @@ EXC_COMMON_BEGIN(program_check_common)
 3:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
+	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
 	GEN_KVM program_check
@@ -1700,7 +1702,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM decrementer
 
@@ -1791,7 +1793,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM doorbell_super
 
@@ -2060,6 +2062,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
+	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
 	GEN_KVM emulation_assist
@@ -2176,7 +2179,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_doorbell
 
@@ -2206,7 +2209,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_virt_irq
 
@@ -2253,7 +2256,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM performance_monitor
 
@@ -2650,6 +2653,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
+	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 #else
 	bl	unknown_exception
 #endif
@@ -3038,7 +3042,7 @@ do_hash_page:
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
 	/* Success */
-	beq	interrupt_return_lite	/* Return from exception on success */
+	beq	interrupt_return	/* Return from exception on success */
 
 	/* Error */
 	blt-	13f
@@ -3055,7 +3059,7 @@ handle_page_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
-	beq+	interrupt_return_lite
+	beq+	interrupt_return
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
@@ -3070,9 +3074,9 @@ handle_dabr_fault:
 	bl      do_break
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values. Don't use
-	 * interrupt_return_lite here.
+	 * If so, we need to restore them with their updated values.
 	 */
+	REST_NVGPRS(r1)
 	b       interrupt_return
 
 
-- 
2.23.0

