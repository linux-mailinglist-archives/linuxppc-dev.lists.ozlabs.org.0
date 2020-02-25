Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F116EE03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:30:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnY81skYzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:30:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HoZOSTkf; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRk6zPdzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:34 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id a14so6828772pgb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciEQcrxqeNFY+Q/j7p2tLwlvlAZd93LiIAV8loA+Gdk=;
 b=HoZOSTkfFtuywx9fcZAlhmrh+3yrvbW6WwQUrTrvZ5YFQwOuif8XzRpBbKVcJHiPeJ
 /ZjJys64E6sjpiuaWPEOFjGGZGHR+RU5Qw98K1sYkvxSZqDh1tL5hM+8Py7WH2XpOyLk
 //feXq4fHaVyB4qo3/NlxyOFa6grdnwnMMYyk2sddeuRj9LBLrylVJkQT2labyE8j1LO
 lLPj2cTwJ96LDHoV5BvonVUSShW76+u6f+8JhF52/KnQ0jJYfT2VGoODMzafpJEAfWEX
 Y9svDQnLlgp5hNDNYDQkyFt4A7JjjXrVgSMBHYEvbEfoyW75zyAqxwJ9LqyAw8Rjdm9Y
 t3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciEQcrxqeNFY+Q/j7p2tLwlvlAZd93LiIAV8loA+Gdk=;
 b=fXTOdeyJLAJpcAnJTfiuTLD6/Ubh2KuHOqEKb+9Arn0vkjymuMbdhvnxkNT27q1T92
 QSpdASiHmASWxGbubQ8dA3ju7pm+SbcYerFSY9TdM7huIgRhTOzHH9l/Ghgr8mUuBnUt
 Vp3gniKng+BrgJzhKvMVhZegvKNkz2C1NsmR47sIbl+pXiQdRIktsJ13ggOKJAGGiPmr
 pxoU5CpMKYYRKVcd05i5dqTp0Z9MpvcuPHlxRKYbWFDdqcxQKcjByTP399aOzdZnhiYD
 rtrC8+c13CDqFq4MJVodcOBuCjCiLPVHVK2SOnGdOgC9qkcGvEHUrG2GzOzBRquc7XBM
 /fbw==
X-Gm-Message-State: APjAAAU5BzpgpquwxMJt2Sp6agjjPCjzzYwagyaLajA4D3NjDYnQlJki
 nG7/7oodLvDs8aWwXK5AXABP4OCp
X-Google-Smtp-Source: APXvYqw71EYLjxZAqDnwxqc3M87Wx0n4GENyG3wIKbMiuoBp2X5DouNm+N5wRkc0K2zkuQ/rCXLMzQ==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr57279187pfq.66.1582652430003; 
 Tue, 25 Feb 2020 09:40:30 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/32] powerpc/64s/exception: hdecrementer avoid touching
 the stack
Date: Wed, 26 Feb 2020 03:35:25 +1000
Message-Id: <20200225173541.1549955-17-npiggin@gmail.com>
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
index 08dbe3e6831c..e0107495c4de 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -24,7 +24,6 @@ extern struct clock_event_device decrementer_clockevent;
 
 
 extern void generic_calibrate_decr(void);
-extern void hdec_interrupt(struct pt_regs *regs);
 
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 7e056488d42a..f87dc4bf937d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1491,6 +1491,8 @@ EXC_COMMON_BEGIN(decrementer_common)
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=EXC_HV
+	ISTACK=0
+	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -1502,11 +1504,24 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	GEN_INT_ENTRY hdecrementer, virt=1
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
index 1168e8b37e30..bda9cb4a0a5f 100644
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
2.23.0

