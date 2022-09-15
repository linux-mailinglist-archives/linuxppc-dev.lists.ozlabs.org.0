Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA15B9A89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx0X2G5pz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbDVDyck;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbDVDyck;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzG3w1Zz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:22 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id b23so17834941pfp.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LPFHi8omvCILxLZbqdRE+ytSu8T6h3A1h/9IS2BZUI4=;
        b=EbDVDyckJxpjUq8l5cxdnXLZHnPQlOPjcT6sioaMtQ4UHOfj3iIw7nWXbiJkLYMj12
         I//OqqUlmeSfuZap68jVENFSKcaxgjLam6cGirnkwK6UMnkoh4QfjJ6ROntvGmooxvbl
         iqqC7wnHNBYtDWvmoNbpJ7VMvewKiFODzCdYOChPa7vQZa3IZeb/oyKvsmNeSfeq5K6h
         j66wKzuPWxoOUKO3/MaIIqplOOzN1XIBEnvPfSFc7e8GVxlewDyeWAaCEvAOgdwWZU1n
         9RrH2FiNAp17FClDsEXxRK1cNqCQnSQ9xglSVjXvPV1GFLsdkNsMn5boKnCxINdzBdAE
         qDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LPFHi8omvCILxLZbqdRE+ytSu8T6h3A1h/9IS2BZUI4=;
        b=XinbMjgaaehmrXRc80nI3FFVN7+NFXgdbg1UwSo7Gckxe8gl7WLxfT3QkxGjHIkN3W
         bXtMxuvXTO85SgM6LN6DROvOT7Q0MNeXL1hHQ86VO3Grwd9ks/xe3Xv1uDUdrPfrYTgL
         ufOTrZEAIbA8lqzxwPtUTHMeEDHzZu0Xk210lq3axuRNX+BcNiY3n7XvuDsc/PqdJ/eA
         fthOboVLB55+JuTIaf0QZwUUu6GdEBB/R90WYTO36wOzsGifVhdaq2SSCPoAwVyUNEJU
         7M7XvH0QL+dR3RMjwUV1vgzZ1epafNpK3hgxMjRMvVvZgEOVNhYrLZX3qzVOoaJoI53j
         w/dw==
X-Gm-Message-State: ACgBeo3QpQJQxTOcSVKxxPqwIwa7YoJqhw3LEO7bsdhVBOLR4uBTeKw5
	tm6A/yfXg4OL2I/3AYwxTIlz/iZhiIE=
X-Google-Smtp-Source: AA6agR5/srRa3CfhuSTzvDWRQjrituKKQZw72FILYJOjd+yKkAQIGVplrroQl5bozMDfKa8dAoM7kg==
X-Received: by 2002:a05:6a00:b49:b0:545:8bf9:be6e with SMTP id p9-20020a056a000b4900b005458bf9be6emr15059171pfo.2.1663243879138;
        Thu, 15 Sep 2022 05:11:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64: mark irqs hard disabled in boot paca
Date: Thu, 15 Sep 2022 22:10:53 +1000
Message-Id: <20220915121058.2288916-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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

