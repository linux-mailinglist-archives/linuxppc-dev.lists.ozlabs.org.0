Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F25F6901
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtZ9333nz3ds9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W2l0wjoN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W2l0wjoN;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtVG1mdHz3c7V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:04:37 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id v186so2110768pfv.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tziH0cLEDNcRYZ7eFA4Bf237cxHBVvvMNvUXtlamw9k=;
        b=W2l0wjoNpUtCzIQ+58nR/fTl49VFd4sAEC6/owLTVksGRUS3cVdS0G5AbWTzG5BM0c
         uFqMPePvWxJWdtRDiNf9jz7QOtR3m2LoW0TvWtXL5b8vu/SMiTgSf8Co7JCQ0cM17J2B
         /6meKM5JVhwXm0xpSymnaFch9fmnVTq90zAi8p5RVw8tTBG9lvYtcx1ojk2WaOzJUNop
         JJuvKDD/ve639YpuePRumR3meO///Grva9TmeA7GLyTRhYC10nIVStUveFgzfAzh2m0w
         hF9vlArrfBy4X5cgm4t5nw0sw+5+tmGm56+iTskZTVX0SfQ3tcbJlR6mHa/J3wVL1V3U
         44Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tziH0cLEDNcRYZ7eFA4Bf237cxHBVvvMNvUXtlamw9k=;
        b=knrJT/mcXbRHcZkNYHMh0EupYmIv3fF8M/Dk6LCplmyWEbmpkwR9UWMsmjSDbppJh2
         s+FcqhuBSMOnmyQOhNfDVDhKw6XOsdgIP0vPC/9boD+mUnLaOsejygGbn0Hjmq6ZooQx
         4ZtRTv1cShppSm55df6mfK0JE7eLI7Wz//8vCq4tRWmF2ChpP8Njk62I4BAmiJyajNuw
         uyuCRxLWKc8eA7SHrQw+YMr9CN9QDifTa3i9MY9Ipin+Qa8y8ftFga1dxeoSzwJAHDs2
         eS64sPxMoKpEWVT4mBm8jGSgx8PX3NL+M9kUuDDnfF27+/tPQ8l8yPYgOPp9YM2+T3Zy
         v+uw==
X-Gm-Message-State: ACrzQf2/K7NpmNB1igdrKNL3fO3UKy6fozXx4nNFwDxuAzqlpPRbjmUz
	0iVBOsHOs6T4LWpp0U3UoWTECZBjyD8=
X-Google-Smtp-Source: AMsMyM62WtC9qer0WVTMJd95Ns+Uc0h0Kyr+LRXNlmk4Zj5NQUYfQYpZAgnhzsIeMFaTJM5wk8mj3Q==
X-Received: by 2002:a63:6c01:0:b0:429:ea6e:486d with SMTP id h1-20020a636c01000000b00429ea6e486dmr62490pgc.247.1665065075673;
        Thu, 06 Oct 2022 07:04:35 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0017bf6061ee4sm4602901pls.117.2022.10.06.07.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:04:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64e/interrupt: Prevent NMI PMI causing a dangerous warning
Date: Fri,  7 Oct 2022 00:04:12 +1000
Message-Id: <20221006140413.126443-4-npiggin@gmail.com>
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

As explained in the fix for 64s, NMI PMIs should not return using
the normal interrupt_return function. If such a PMI hits in code
returning to user with the context switched to user mode, this warning
can fire. This was enough to cause crashes when reproducing on 64s,
because another perf interrupt would hit while reporting bug, and
that would cause another bug, and so on.

Work around this for now just by disabling that warning on 64e, which
improves stability. Make a note of what the cleaner fix would be.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S |  7 +++++++
 arch/powerpc/kernel/interrupt.c      | 13 ++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 930e36099015..d8bf8b94401b 100644
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
+	 * restore registers and return. There is a workaround for this for one
+	 * known problem in interrupt_exit_kernel_prepare().
+	 */
 	bl	performance_monitor_exception
 	b	interrupt_return
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f9db0a172401..299683d1f8e5 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -374,10 +374,17 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	if (regs_is_unrecoverable(regs))
 		unrecoverable_exception(regs);
 	/*
-	 * CT_WARN_ON comes here via program_check_exception,
-	 * so avoid recursion.
+	 * CT_WARN_ON comes here via program_check_exception, so avoid
+	 * recursion.
+	 *
+	 * Skip the assertion if 64e to work around a problem caused by NMI
+	 * PMIs incorrectly taking this interrupt return path, it's possible
+	 * for this to hit after interrupt exit to user switches context to
+	 * user. See also the performance monitor handler in
+	 * exceptions-64e.S
 	 */
-	if (TRAP(regs) != INTERRUPT_PROGRAM)
+	if (TRAP(regs) != INTERRUPT_PROGRAM &&
+			!(IS_ENABLED(CONFIG_PPC_BOOK3E_64)))
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
-- 
2.37.2

