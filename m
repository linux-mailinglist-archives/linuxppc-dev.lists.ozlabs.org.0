Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9355E98EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:44:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWtH0WKFz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:44:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CgxokaZV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CgxokaZV;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrR1Mwfz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:18 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id b21so5235573plz.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LPFHi8omvCILxLZbqdRE+ytSu8T6h3A1h/9IS2BZUI4=;
        b=CgxokaZVKnURLKd6aDKekFl2kBvKdeGJSDkuPkJp0Qy8HSnZf9mEm4hOlDHnnMYuKd
         sZjmFiKL0toFgyFGIuzBS6GnZZFC7D9g3zJfiG+IZQMocdY4aUcwm6tVzweygcUBvnee
         /c/9ukhD2GF++ZevRY9tME8TmEXdUO18MS1Kxce5bS6IlEW4zObunQouITLmV1i+SlX6
         T8hDyemF3Ex29AjYe4VclVq0NEP4n3FJ3pg13hB0LiMtwOuPKrZi3uaAj9AGgPDupmuB
         NqTYHJ1gBzF6yuqbxARNxVBjCWEsJQEp5Lqf1YHviP6bPSxjI8iV3sqcc55xc3LBsE4B
         7gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LPFHi8omvCILxLZbqdRE+ytSu8T6h3A1h/9IS2BZUI4=;
        b=AM8R78NY+tnaxXFsrqhF7gCwZqTCK42QDv51efgJxlT27V/G6MgoWjKTk/c8rWQPwt
         MxhUWAcK/hTTmB3sfwv9yNqaQJyeK4RXPisd876PMtrz7yv3XgfGVMN7zSF5F4oQm1Pw
         Hj3FS4WRWPeEgMXT5jvNEzIO4d6/7hTLV+yvnEE/Y5hE87mM8WUVv5x03QW9VC0Vt2gA
         eO0KV1fxnkpIAVF1snyEVS3YbXe7gyK+D3Iz+d/ggaAhfCPAk2HFKSLUFzI9IlF7YHCJ
         KhT8VRCZcMIyvs3v8aGsX5EUjUTY7yWkGi01O1VCYTNXkYFFhtMGkhQeorPxs1NNhqvB
         H0zQ==
X-Gm-Message-State: ACrzQf0DCKzRFelsmyCHji7cxKPcLSkj2d0qESxVguWMVmyU9MRvEiVp
	7WizyHoLuwbbGAWVu234RMpR1j1JCpzKvg==
X-Google-Smtp-Source: AMsMyM6YaFnqsc6HPDA3VKX1x+iyFi5KuhLpnmHqbwDbFGDCXpaYFUDjpv8GT2pE6NrMg60RtPIkeA==
X-Received: by 2002:a17:90b:4f8d:b0:203:747c:7b7e with SMTP id qe13-20020a17090b4f8d00b00203747c7b7emr22661812pjb.98.1664170996377;
        Sun, 25 Sep 2022 22:43:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/7] powerpc/64: mark irqs hard disabled in boot paca
Date: Mon, 26 Sep 2022 15:43:00 +1000
Message-Id: <20220926054305.2671436-3-npiggin@gmail.com>
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

This prevents interrupts in early boot (e.g., program check) from
enabling MSR[EE], potentially causing endian mismatch or other
crashes when reporting early boot traps.

Fixes: 4423eb5ae32ec ("powerpc/64/interrupt: make normal synchronous interrupts enable MSR[EE] if possible")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2b2d0b0fbb30..ce8fc6575eaa 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -182,8 +182,10 @@ static void __init fixup_boot_paca(void)
 	get_paca()->cpu_start = 1;
 	/* Allow percpu accesses to work until we setup percpu data */
 	get_paca()->data_offset = 0;
-	/* Mark interrupts disabled in PACA */
+	/* Mark interrupts soft and hard disabled in PACA */
 	irq_soft_mask_set(IRQS_DISABLED);
+	get_paca()->irq_happened = PACA_IRQ_HARD_DIS;
+	WARN_ON(mfmsr() & MSR_EE);
 }
 
 static void __init configure_exceptions(void)
-- 
2.37.2

