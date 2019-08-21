Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AE979C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:45:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6nr68wQzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:45:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NSp5JdDI"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jy065YzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:45 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b24so1348917pfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ngaZlZP3jj8+aTDz9smsgdZv8Tv70Acv4cyZaReGXPc=;
 b=NSp5JdDIBH5y7+lr+T2QC9vY9ycK7g5otKBU40cl7RfV39XpgcnwZyWFueCuA/Eogn
 D8BRZQ+b4V2T8aRgSXnA0XSqeH2qd98pN61JmGtgKjqk3h6IS3rYIt3EviztbgBmd9wj
 YU0ojtWBrjW5JeRe9mUombTLExQMhGcveucgvrjG+nsXrX4vpMYY6ek6q1QSFsPP3Xyp
 eIzzNqkl7U7mYKj1OP/XI/IOqHySsWSf+jetXW+/1h3xX3NniOwtt6LIMomRCVw6ezPc
 4j27YW7NkCfQqBzjRf9oyhsGDWJucWD+ji/lHFWSbTL4sgdiY1NrQrlzrq4Ndilcb1wm
 /O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngaZlZP3jj8+aTDz9smsgdZv8Tv70Acv4cyZaReGXPc=;
 b=IYUv6JWD00xns1okmwk+ippx3nvRngeXLpTtmwGllpt/EdjPyY3lZ4XNNhiNjBA1Ic
 0/eJgx/aOykIaf8lhp8e2gVV3oryxd9mmqott3w1fZOHlaNt1cG8d1KkFjxzzfVVwPr6
 bSn70ppuZh9XVOXJAyH/SNTY8vqm5SMM0t3gAaxioA1R1DTRYxKhwNeXTUH4Ly1oxQJw
 I3AmehXoWWlwhJBj6qwT/q5lq0mHf+GGxtKcCVnb3F1Glh1i1VdURAtcia/mpvu7SZw+
 XXpq/ZwsYgftxkI2AKPSaC0ArY4spA4jnJHO8XIQ5F6JK09qpSmBeBVcoTtN5XZ+p07A
 /j8w==
X-Gm-Message-State: APjAAAVvyaj1KjRF1EYsHVAppm1N7V6RZTuTp4aUC8XsuRm7emhqjkzx
 AF0RVZClUwa9LUSqvhSYs062Ybna
X-Google-Smtp-Source: APXvYqzaPOLhZx/uMaagi/bNOqMep7++dWQed8m2EJGCSfXrbN+OljxE/HgNLiLInyYGv/e0uQI39g==
X-Received: by 2002:a17:90a:974c:: with SMTP id
 i12mr5069574pjw.12.1566390223621; 
 Wed, 21 Aug 2019 05:23:43 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/10] powerpc/64s/exception: hdecrementer avoid touching the
 stack
Date: Wed, 21 Aug 2019 22:23:13 +1000
Message-Id: <20190821122315.9535-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821122315.9535-1-npiggin@gmail.com>
References: <20190821122315.9535-1-npiggin@gmail.com>
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

The hdec interrupt handler is reported to sometimes fire in Linux if
KVM leaves it pending after a guest exists. This is harmless, so there
is a no-op handler for it.

The interrupt handler currently uses the regular kernel stack. Change
this to avoid touching the stack entirely.

This should be the last place where the regular Linux stack can be
accessed with asynchronous interrupts (including PMI) soft-masked.
It might be possible to take advantage of this invariant, e.g., to
context switch the kernel stack SLB entry without clearing MSR[EE].

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h      |  1 -
 arch/powerpc/kernel/exceptions-64s.S | 25 ++++++++++++++++++++-----
 arch/powerpc/kernel/time.c           |  9 ---------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 54f4ec1f9fab..0e17c41c4f46 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -24,7 +24,6 @@ extern struct clock_event_device decrementer_clockevent;
 
 
 extern void generic_calibrate_decr(void);
-extern void hdec_interrupt(struct pt_regs *regs);
 
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a4ceb88c53c4..3f4b7dfa800b 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1505,6 +1505,8 @@ INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=EXC_HV
 	IAREA=PACA_EXGEN
+	ISTACK=0
+	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -1516,11 +1518,24 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	GEN_INT_ENTRY hdecrementer, GEN_VIRT
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 EXC_COMMON_BEGIN(hdecrementer_common)
-	GEN_COMMON hdecrementer
-	bl	save_nvgprs
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	hdec_interrupt
-	b	ret_from_except
+	__GEN_COMMON_ENTRY hdecrementer
+	/*
+	 * Hypervisor decrementer interrupts not caught by the KVM test
+	 * shouldn't occur but are sometimes left pending on exit from a KVM
+	 * guest.  We don't need to do anything to clear them, as they are
+	 * edge-triggered.
+	 *
+	 * Be careful to avoid touching the kernel stack.
+	 */
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
+	mtcrf	0x80,r9
+	ld	r9,PACA_EXGEN+EX_R9(r13)
+	ld	r10,PACA_EXGEN+EX_R10(r13)
+	ld	r11,PACA_EXGEN+EX_R11(r13)
+	ld	r12,PACA_EXGEN+EX_R12(r13)
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	HRFI_TO_KERNEL
 
 	GEN_KVM hdecrementer
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308cd5..bebc8c440289 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -663,15 +663,6 @@ void timer_broadcast_interrupt(void)
 }
 #endif
 
-/*
- * Hypervisor decrementer interrupts shouldn't occur but are sometimes
- * left pending on exit from a KVM guest.  We don't need to do anything
- * to clear them, as they are edge-triggered.
- */
-void hdec_interrupt(struct pt_regs *regs)
-{
-}
-
 #ifdef CONFIG_SUSPEND
 static void generic_suspend_disable_irqs(void)
 {
-- 
2.22.0

