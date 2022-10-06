Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3365F68DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtY80BlLz3c6g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:07:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XlsSVomq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XlsSVomq;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtVC5xC4z3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:04:35 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id b15so1855877pje.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8LvpQvcpcFN1tsqIY/Uy4lSuvckbcO6NzLuJ8RGjMpM=;
        b=XlsSVomq9W6BTm6R/QCGnHRuHONO8cvh5v7k5LyTjPCrQlzaUmsK6trNUVMqNuV0G5
         moRpIeyoI4EnE7g5V0uF5txGG7YuL8zGCd1MM/StAgEp6X4Bbv1UgNV39TDznf4UL9F/
         kywcHOTo3MAlrpPyTD8gSR01NdIF9e1k2/ZUSbnTQFjE8XeLBe3sZaxcI20StpsVpQlc
         wOReFHu1+/w+Vp7mNrUlwD9dG47G5/5c+oY+Vat7bbNAuwMbTU5Dh08M6Up7f6CvnbZM
         Sx71ttpZsLiQVb5wkobNQAvFOx+E/gMQCFRHrDWRPwNApQxJ1Dl1YWVD1YOmgM84z9JQ
         TySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8LvpQvcpcFN1tsqIY/Uy4lSuvckbcO6NzLuJ8RGjMpM=;
        b=wj5/aTeduc+J/WSUpXToCzBjrUWCGEO6fWoVheZzyFH9smzFXkG19e2pgmwSv6IJ9s
         lnCHryZYbOCTb51TI1HyGXzFfgv1AKKBZDY+4A3WW4RmRdqMC+ZC9eGR3xr1aF4Iy7xo
         yLR6s6flkk9kGYMMwo32tGoHZyUZW/8M4MJn6uMvRpxCwT9oaTkrLD+QePKUnEftai+8
         7itcUq51evxbm5CdbGoGrynib9wordpEZmEqs+1caf2EaWhm+HsN6Kk9rCZxpmmZephP
         hTazaiXE4El0jiHXAZYQeB8Yd61lkR9Vt99MEuVu1FOv7EGue7fN3yruH68bflQuHKtU
         i/eQ==
X-Gm-Message-State: ACrzQf1NPj58VaJFfp00IyZxE2dWVBfGuNM57ky9oMuF5NQB9tedg/Qb
	4yi1fyIJdRqFulHijl7IWJyQjGz5JLc=
X-Google-Smtp-Source: AMsMyM7C1iW42JwTbXdxWWsMY+TDYC7smbCN2Zb72RntKS5kfjakhRxKiTLmd7GezQA/k4DQP+JowQ==
X-Received: by 2002:a17:902:b942:b0:178:be25:203f with SMTP id h2-20020a170902b94200b00178be25203fmr77182pls.101.1665065073059;
        Thu, 06 Oct 2022 07:04:33 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0017bf6061ee4sm4602901pls.117.2022.10.06.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:04:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s/interrupt: Perf NMI should not take normal exit path
Date: Fri,  7 Oct 2022 00:04:11 +1000
Message-Id: <20221006140413.126443-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006140413.126443-1-npiggin@gmail.com>
References: <20221006140413.126443-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NMI interrupts should exit with EXCEPTION_RESTORE_REGS not with
interrupt_return_srr, which is what the perf NMI handler currently does.
This breaks if a PMI hits after interrupt_exit_user_prepare_main() has
switched the context tracking to user mode, then the CT_WARN_ON() in
interrupt_exit_kernel_prepare() fires because it returns to kernel with
context set to user.

This could possibly be solved by soft-disabling PMIs in the exit path,
but that reduces our ability to profile that code. The warning could be
removed, but it's potentially useful.

All other NMIs and soft-NMIs return using EXCEPTION_RESTORE_REGS, so
this makes perf interrupts consistent with that and seems like the best
fix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 +++++++++++++-
 arch/powerpc/kernel/traps.c          |  2 --
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5381a43e50fe..651c36b056bd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2357,9 +2357,21 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	performance_monitor_exception
+	lbz	r4,PACAIRQSOFTMASK(r13)
+	cmpdi	r4,IRQS_ENABLED
+	bne	1f
+	bl	performance_monitor_exception_async
 	b	interrupt_return_srr
+1:
+	bl	performance_monitor_exception_nmi
+	/* Clear MSR_RI before setting SRR0 and SRR1. */
+	li	r9,0
+	mtmsrd	r9,1
 
+	kuap_kernel_restore r9, r10
+
+	EXCEPTION_RESTORE_REGS hsrr=0
+	RFI_TO_KERNEL
 
 /**
  * Interrupt 0xf20 - Vector Unavailable Interrupt.
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9bdd79aa51cf..6138ee22d06c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1899,7 +1899,6 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 #ifdef CONFIG_PPC64
-DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
 DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 {
 	__this_cpu_inc(irq_stat.pmu_irqs);
@@ -1910,7 +1909,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 }
 #endif
 
-DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
 DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async)
 {
 	__this_cpu_inc(irq_stat.pmu_irqs);
-- 
2.37.2

