Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA415E98F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWwG6nt3z3f77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:46:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MrC7/QSF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MrC7/QSF;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrZ0wvmz3bc3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:25 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id w13so5265081plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XJhviWUa1iDtZtz2IY3LCKwSVMIPPlufgF6evb/LdAI=;
        b=MrC7/QSFbkf98AhP2Lz05t1n+Z4m1U/fwMC1dlA/h8bbEjAud2wtIChY9uVFoHF7gj
         tqoTtr0xSn73DCJ0GRFoOPUKhPplFglSpWH2sqyNwhTVGOALjU1PwHLMBOYmV7SBiKb6
         546OlOzT88gLfUWDJmhhQHYCPVjcd59jGNgaytuCLpB6ACbSfTWvUnV+gS0hAHLo4fZw
         UfaPPeiLwHJEslGgFN4bz/Vrj9VK6eJRpbtpHloKPVE5AB9W87nREN3PVZ4xlA9dFjL6
         u8alyjOik33K649FA1+FqitIBrZNTW9IuyaRjRw7C1v/aBu0qVeIAxGm5PE08pn8zxYY
         fniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XJhviWUa1iDtZtz2IY3LCKwSVMIPPlufgF6evb/LdAI=;
        b=snBa91pV04+wbFnDaETD8dB9ss3qfZXgvGJh2If7GwdJ9KoWMgT1vAIa0rWK1oz+Pk
         TGpDm4cOWOCQ0iayUpvAt4a9ib8tPT7QNI1Wb/p66561reoHP9C74qmKIUOkd7pEIHxD
         nNb+fxyuhMXGkPDcg6T9N6TIZXHUJFHrWZrUPZOe11D1Pcay7/KM4ADQsq4mT7f0dOiH
         MQlFMKp9oQPQl+L1IlHnC+chvTjMhElAKY4CbUydNWQdqeM+yQRk8OEwCXj2rfvcp8d3
         jKTQjSObI0LEunBMd+YeI2zCD3YTby+7/wP4nLVhfY3w2z6ITQAo+O6NOB2421c8W6ov
         8jEQ==
X-Gm-Message-State: ACrzQf0OlZRgkoWXBqxWC8MErzma+jdiOrUiEQc9dmsGCQa29PuIcGYP
	azM/LCU0oRmTz7yhrgOZFXC0FJQIto7bCA==
X-Google-Smtp-Source: AMsMyM5WfQ47TSrJLX37GIMmm1oO/pB9A/AjJEjr6gnjPk3Cdg08TjBcY4Q6iZuc+SpDuN7JgRnlsA==
X-Received: by 2002:a17:902:ce11:b0:172:6f2c:a910 with SMTP id k17-20020a170902ce1100b001726f2ca910mr20964384plg.156.1664171003358;
        Sun, 25 Sep 2022 22:43:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/7] powerpc/64s/interrupt: masked handler debug check for previous hard disable
Date: Mon, 26 Sep 2022 15:43:03 +1000
Message-Id: <20220926054305.2671436-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
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

Prior changes eliminated cases of masked PACA_IRQ_MUST_HARD_MASK
interrupts that re-fire due to MSR[EE] being enabled while they are
pending. Add a debug check in the masked interrupt handler to catch
if this occurs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..dafa275f18bc 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2794,6 +2794,16 @@ masked_Hinterrupt:
 masked_interrupt:
 	.endif
 	stw	r9,PACA_EXGEN+EX_CCR(r13)
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	/*
+	 * Ensure there was no previous MUST_HARD_MASK interrupt or
+	 * HARD_DIS setting.
+	 */
+	lbz	r9,PACAIRQHAPPENED(r13)
+	andi.	r9,r9,(PACA_IRQ_MUST_HARD_MASK|PACA_IRQ_HARD_DIS)
+0:	tdnei	r9,0
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__,0
+#endif
 	lbz	r9,PACAIRQHAPPENED(r13)
 	or	r9,r9,r10
 	stb	r9,PACAIRQHAPPENED(r13)
-- 
2.37.2

