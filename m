Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AB5FE746
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 05:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpWYj3S7tz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 14:08:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j/614PaH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j/614PaH;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpWXh6QC2z3bj8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 14:07:48 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id c24so3576527plo.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 20:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Py/OynLN1dc8/m6hIl6sKvHR1UkBmJQ1rYnYYoA5U=;
        b=j/614PaHkXRd3CET+x2nqVS9ejGjQy8Gc2cbJtaW+7hZJAwpRZH53tcFxwyaYS359X
         WD7hOm8MplhAYJAZ6Vfi7K9a8R8oWF8L+kLgG+BPkXTtf8hBw6JMVGTxp1p6f2n/uo1g
         LGdqAoPOlzkAeSTmTIngn81jxngB/EFNHx2qIpC92peZkqjmy/jK+Ti2NZAovbj4XAVT
         jFUDUC6gNvB97cOvYSmLM3dTYd3GBYnxSfCdboe7TEyDy/b9+Hz+Y10Qz+C9JRjRbnZu
         Xum7IRROXu/s2ub3w4moU/6N2c9QtzJ1ReuciNxKcx8TvpuNLTGduo6BI3x/h1lHHly5
         WlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+Py/OynLN1dc8/m6hIl6sKvHR1UkBmJQ1rYnYYoA5U=;
        b=s0DOCGynEbdWizKOf+0M7dgxA1gSczGQEvOZ1c+qipGgvws1heh/rDQwEYT7ciY1GK
         M+hlktMnlZASaxsIMoN98IQZt6EMiDG8gwkSPB6zEgCO6WpsUD8qE/UdaMOKsLjBjG7d
         v/hdqjwG98HtssNDjtTwYPu9nVEnLN5d+WhmM11KtB2Hhn6PZ1MWXgDnnGh2NJ3T6uwD
         LHAAM/BM2FKmRTEAQKJQIP1Axz/40p0s2G+85ws6YXqeqb14e5iigPyUGGF0OzeWwLH5
         xYnqJZMVFfClYtBo4eGwYYlr01SdE0Xt2RONT66Hd7zoM6VnwqB86XVRTVVaxotABPY0
         4lqA==
X-Gm-Message-State: ACrzQf3Q8HKCFAb/BLi/j13BiD4xJHtcNMMXxAo1yL+t3E+SEsluOP4f
	Mn38LNHg49nrN7n/7JSTMghrtubhnyc=
X-Google-Smtp-Source: AMsMyM6GHplyGin/d1ZaoRUEiASfYqmtXAJkCSAxlw/0oCKBWPN9VJhR+uVTRw9EHAwdTviR85Af1g==
X-Received: by 2002:a17:903:1105:b0:178:ae31:aad with SMTP id n5-20020a170903110500b00178ae310aadmr3068687plh.3.1665716866263;
        Thu, 13 Oct 2022 20:07:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.146.77.96])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b0017f8edd3d8asm523443plb.177.2022.10.13.20.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 20:07:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64/interrupt: Prevent NMI PMI causing a dangerous warning
Date: Fri, 14 Oct 2022 13:07:29 +1000
Message-Id: <20221014030729.2077151-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221014030729.2077151-1-npiggin@gmail.com>
References: <20221014030729.2077151-1-npiggin@gmail.com>
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

NMI PMIs really should not return using the normal interrupt_return
function. If such a PMI hits in code returning to user with the context
switched to user mode, this warning can fire. This was enough to cause
crashes when reproducing on 64s, because another perf interrupt would
hit while reporting bug, and that would cause another bug, and so on
until smashing the stack.

Work around that particular crash for now by just disabling that context
warning for PMIs. This is a hack and not a complete fix, there could be
other such problems lurking in corners. But it does fix the known crash.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S |  7 +++++++
 arch/powerpc/kernel/exceptions-64s.S |  7 +++++++
 arch/powerpc/kernel/interrupt.c      | 12 +++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 930e36099015..2f68fb2ee4fc 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -813,6 +813,13 @@ kernel_dbg_exc:
 	EXCEPTION_COMMON(0x260)
 	CHECK_NAPPING()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+	/*
+	 * XXX: Returning from performance_monitor_exception taken as a
+	 * soft-NMI (Linux irqs disabled) may be risky to use interrupt_return
+	 * and could cause bugs in return or elsewhere. That case should just
+	 * restore registers and return. There is a workaround for one known
+	 * problem in interrupt_exit_kernel_prepare().
+	 */
 	bl	performance_monitor_exception
 	b	interrupt_return
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5381a43e50fe..7ca55ac7bb87 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2357,6 +2357,13 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+	/*
+	 * XXX: Returning from performance_monitor_exception taken as a
+	 * soft-NMI (Linux irqs disabled) may be risky to use interrupt_return
+	 * and could cause bugs in return or elsewhere. That case should just
+	 * restore registers and return. There is a workaround for one known
+	 * problem in interrupt_exit_kernel_prepare().
+	 */
 	bl	performance_monitor_exception
 	b	interrupt_return_srr
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f9db0a172401..7bc93367de68 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -374,10 +374,16 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	if (regs_is_unrecoverable(regs))
 		unrecoverable_exception(regs);
 	/*
-	 * CT_WARN_ON comes here via program_check_exception,
-	 * so avoid recursion.
+	 * CT_WARN_ON comes here via program_check_exception, so avoid
+	 * recursion.
+	 *
+	 * Skip the assertion on PMIs to work around a problem caused by NMI
+	 * PMIs incorrectly taking this interrupt return path, it's possible
+	 * for this to hit after interrupt exit to user switches context to
+	 * user. See also the comment in the performance monitor handler in
+	 * exceptions-64e/s.S
 	 */
-	if (TRAP(regs) != INTERRUPT_PROGRAM)
+	if (TRAP(regs) != INTERRUPT_PROGRAM && TRAP(regs) != INTERRUPT_PERFMON)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
-- 
2.37.2

