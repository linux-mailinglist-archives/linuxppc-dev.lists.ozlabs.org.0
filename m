Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A169B2DBC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:01:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCKB4tyzzF4pN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TnF9CEkZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcB19PfzF5r7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:14 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q10so20295358pfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zuRdx++Tzg0MwINxFg2gGFU09nGrbbv3sD03eYlGH+M=;
 b=TnF9CEkZrH8/Rl3iX0reTt20ilF9QbBpckMT3uwMgOlvcnLRD57i85vX7CoE//XCg4
 rCGhvY10D9elhSfEkfbQwIeKSHuAFp4EJxypHuDsa2g+8o0FanGtagrGBmkmRIgVR64z
 kjWQa0WjsmVhqauT11KpFDlx8sIVPu4iDBvyjc5pQ3KhDMGg2k+GwoWoA2+NAhP8ZEwa
 T7r+M0x/1Q6VYc1oiVR7ptI6Qa8gNcHY8I5CtsKH/xZdAbJyf9KC1EDaB94cycqe6xMH
 YiofD0R+oNXbIjdSYvpSDLZO+spRvDU/SXqTO1GrCUXn1urHJWnzsIhseZbgLW5j7fGD
 byTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zuRdx++Tzg0MwINxFg2gGFU09nGrbbv3sD03eYlGH+M=;
 b=qPhZloiB+zkbLiZo4BUJgscXigG1DiODk8Cv0gk4hprVtl6cg9sQzcbCaDydp/h/t2
 RC63wmIzBXlgwoy53wzk1S2G9olkkw2u75EKWcxqgjzkL9uaf+FS75q3BelaFKcfVwLi
 m5uYwUqLxXhp2DZ+KPvMteHsbBOSjGOz3azwhI0Y8jXnCGvgqRNqbGBi7coWNwAlDVqS
 uy+qgw/b/7iFf8tfQPHSNxNYpCEljWQtUTkhqwBo3ukLpfEYdEkICxTns3rJ1S2DGUai
 cct1myErateoAxaV3dt0BfTFgY1oRZ8Fu2AWoFm5jzqE6sz2q4tQmebAaBJhipawuo3m
 QNwQ==
X-Gm-Message-State: APjAAAUEXfa9UHLooOJQPkaMiMaZY1AtYMNTsDhFzyo+PXUyWyo6a05Q
 qnPE1eNA4JiHPP/neFoTwmPO5WUq
X-Google-Smtp-Source: APXvYqx+7JWmheIS05kJ4mwu1sdsQ7Ml3qqZ45d6P4ndms3jPYhyQqJNmgGKS09ntjB9SGKLS7t4hg==
X-Received: by 2002:a17:90a:ac18:: with SMTP id
 o24mr13670602pjq.142.1568510950943; 
 Sat, 14 Sep 2019 18:29:10 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 16/27] powerpc/64s/exception: hdecrementer avoid touching
 the stack
Date: Sun, 15 Sep 2019 11:28:02 +1000
Message-Id: <20190915012813.29317-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index 9fa71d51ecf4..7a234e6d7bf5 100644
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
2.23.0

