Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E63A2C95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G14C93Ngxz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:12:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QQmm6PIf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QQmm6PIf; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G147z38pLz3btw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:51 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id v12so982409plo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeyS9kPcmx97lrUqGTx0Je7SbGB1d6EDJmtcigtvCHQ=;
 b=QQmm6PIfvdQwGTD2ITGtEdo9uQeepxOPXxzoPxdc/bSMIgwOto5kmLQww5tb+Np96T
 nAqipS5tB78HNIZjmqZAu6YprIj0rs+YUrTSxPwKjk6iDTsag1bE4PWtjSEQJrYGGY3m
 JR6iizvdS3xMd8fUFYGfUFY01LCwTrZFEtvUXfBuZkPkH6RpMdi41thte0jPmb5dvKr+
 hrkQSrnYbUC0zSQnm12mAxgnwJ7M2Csnv3TXoBVKGBmsSziV60uJC8LvmaVyHZRYjhQ5
 WitEy/HPBundCCfvJSVT3w0GfDByTqp6IkBabUKkwIR/NZiwEST9RZS4U4cmNE7x4aRl
 lvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TeyS9kPcmx97lrUqGTx0Je7SbGB1d6EDJmtcigtvCHQ=;
 b=OLnxyXYwKjOt3Cec8WSulzo1qRixWtRZQb4Vh4jpQ1mFdtfwVHF0ltUC2mKt9qyPEv
 xQCOb4MU9wxkx6NiZ7M5vvPtNbDBo4NlOW/VqezyQQbFODrKKum15ahMqcdLUNXqovGh
 GKHJdtPPIQORDujBMm7/S5RlMPr6D2f6oId6o1+xcc7Pq7Tp2jyfM87fLTtAUyY6tpq/
 12r9U6mWPdW5F1RvVwm9PbBJlAFHrEGhWB6C6csU10orebcAGZdt4pxvrnq78/hohwum
 RTvLepupirZEFaK7i1mJqDnYJ1Na9mlYTy+G5ooNLloFuJ5NBCa6qTM9PC1523f2pR96
 21vg==
X-Gm-Message-State: AOAM532Z/c32Qya3QU/1rovXRADz/YSyHQqIyGYEj0CTQyIaaSINZ3gT
 NuzeySfi1BJE4psSslIAVg+Xv/kBKhg=
X-Google-Smtp-Source: ABdhPJy9KnAzR7XAVDaBcaOWTn0mLHl8eqdudYFpGasrVto3x9jmAB+GMQDArI8HYzynSvTyOipUxQ==
X-Received: by 2002:a17:902:8695:b029:fd:6105:c936 with SMTP id
 g21-20020a1709028695b02900fd6105c936mr4781368plo.25.1623330587993; 
 Thu, 10 Jun 2021 06:09:47 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/11] powerpc/64s: system call avoid setting MSR[RI] until
 we set MSR[EE]
Date: Thu, 10 Jun 2021 23:09:16 +1000
Message-Id: <20210610130921.706938-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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

