Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DA38C5FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:47:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlGX2Hhhz3ccb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RtWwnSvH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RtWwnSvH; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlC44qcTz3090
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:48 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso7010773pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeyS9kPcmx97lrUqGTx0Je7SbGB1d6EDJmtcigtvCHQ=;
 b=RtWwnSvHtoioNrGf7w4cBZDsQJN9qh0A/O1uWjDVIj/7UXdGWl9/4PpxpsbM2xfY4A
 W2t677lt3tMhlU0/Yx6LcSkB9wzh4bogtbsFoO8WTnhgn53GjSwuCOFv2fimWPPty1aY
 obCa5arYD+k7bJEZTGi07jpjMg6LdH05mkOdQcl5p/kCym0EyzgG8rvvCcacSw1u99gp
 tpleBWY3S/9T5bl00Dnz1sNB3OBmSdtWU7YK86Smt+xNcikfHSll2Jf9VRN7zxT4ymaU
 bVTtvABdzUyg/7+OHNb/6Xm+RUAZOwLa2WIfq8xyyUlf+iCe2E1ucHZKvttFWZrEMtpl
 kAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TeyS9kPcmx97lrUqGTx0Je7SbGB1d6EDJmtcigtvCHQ=;
 b=gxLTce4r1PDz1T1HfOLRWJB6CWZ+oYSY1Q7murTT9gsV8d+/5pOrUhTLpVk1cVgTL1
 CMG76/4UHqY0Omjj3ugLKWsB1MsS7/8PO3apAsh9c5IxFbsGQfpBgICsttYedHVvNqwh
 269Z9BjQpOdgGgEr/XOYDpMtKlIMUpyKqOMYNXx7UOJxIRd9gqoW0xGAPAaaFYyCOA4g
 /jKFI1o4P+t+LerqKXmuufz9hgqY4NyKuVd/08w4qfS4gpv1mgoleTvZU6WExjFCliag
 M3NRTtcs6Lpxaip4exkm4y8bqnwT79p+ylOisb9kZBOPnv/Ij2d3QbKhZ4lBECk6+g+Y
 SqnQ==
X-Gm-Message-State: AOAM532L51rTyW88NvtWa1DmNp/oDkRH4H3OojE9Mi1sR1LVe3z3Voeu
 Vw3MCKdrJ3kxX5doMDAqjnmzKNq1IMw=
X-Google-Smtp-Source: ABdhPJzml+0PbYr2uVNxCrBmm4ihovo7zdazUXEUd5EMce8MoXD8bqjHg+RgUmslDch0jLx3AO94Yg==
X-Received: by 2002:a17:90a:cc05:: with SMTP id
 b5mr10450387pju.6.1621597486162; 
 Fri, 21 May 2021 04:44:46 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/11] powerpc/64s: system call avoid setting MSR[RI] until
 we set MSR[EE]
Date: Fri, 21 May 2021 21:44:17 +1000
Message-Id: <20210521114422.3179350-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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

This extends the MSR[RI]=0 window a little further into the system
call in order to pair RI and EE enabling with a single mtmsrd.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 arch/powerpc/kernel/interrupt_64.S   | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a2ae14d0600e..b6e1c46c97d0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1942,8 +1942,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	mtctr	r10
 	bctr
 	.else
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 83826775d239..3038c831fc5f 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -284,9 +284,9 @@ END_BTB_FLUSH_SECTION
 	 * trace_hardirqs_off().
 	 */
 	li	r11,IRQS_ALL_DISABLED
-	li	r12,PACA_IRQ_HARD_DIS
+	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	stb	r11,PACAIRQSOFTMASK(r13)
-	stb	r12,PACAIRQHAPPENED(r13)
+	mtmsrd	r12,1
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
-- 
2.23.0

