Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A9498287
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 15:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjCM266Flz3bTT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 01:40:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNRYuhHJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YNRYuhHJ; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjCLN5hTtz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 01:39:38 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id pf13so16706685pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEmuMQlrY9DfxLeNF4WP/5Py7qqcPlKWwDwFkAmbfpY=;
 b=YNRYuhHJKHbPIhv24T7B0PISB+NJGt0IHCDMqiOzXPodq3nZhy2w4+29/mnkm9UBMH
 tiEVHmzjpfIVt1C+2qk1B53M8k6vl5UJqEDzEw2FjcG04ejYeepJ5TtnKS2LNBNpwNjO
 JMiDX3uvYd6xd/isybjEfuWdjPBOEXWWIxnttywQ9HfaxrC/GIdcFiC8216fXaazsF2v
 wF/oyMYrCr/lBI6kzz5HxYbu7gJbt8Nrhk4vnXjCykDNHkYvcKyAQt/7/X+FyZ0x436j
 Xi8qTyV3IgLYLSQ0lZof1eZYEuXzlnCRjqT5JlkfIQyuCtLk0HYZrLAnyPvgVwy62icX
 KvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEmuMQlrY9DfxLeNF4WP/5Py7qqcPlKWwDwFkAmbfpY=;
 b=r9RoH+rEeGKZyZHviU+SVjpXD8POK5W1ppheBq9gtGleRL+/Ifn6nT6LmTXL/VCWrf
 FvuWfJ1vc3EmlLPGvhSqLFnWOJn+Xi0+7yIYIEDmFbokhzAWYAs8PfQgo5KumMVk0N4f
 DEuuKtX31YmbPrSvzJheQ0eREBNZHpBQZQDJQlC1lelvrAy/aDXKMEbXlh84y9qnj6aL
 J4AWvkaKyqvtRvjFZtLh2fTfFALlUI1yD7A08YforHCx/DnV+GP1LWctG94xBmSnLjJs
 AIcCA0RpFPo7Ve90KU9pkOdv3Jb6VcFKnK7K6HIhibq6UUO2AdvDXIRS9+vtLvmB1Jit
 tHTA==
X-Gm-Message-State: AOAM5338d8vdqi+E9ljlPaTWeBinMm9EaUkB1FlPFpy5ja8qLRyynRRM
 TqpYSD10u0tXzDNW/SQ9M3G4knAT2is=
X-Google-Smtp-Source: ABdhPJwOHirAdFZ/Jnw0LxMeNalucCRnXx1yMP1Z7Dgy/wcFwhP18/mW4klks3f+ToT+1Udsc6g4mA==
X-Received: by 2002:a17:902:ab12:b0:149:c5a5:5323 with SMTP id
 ik18-20020a170902ab1200b00149c5a55323mr14741801plb.97.1643035176542; 
 Mon, 24 Jan 2022 06:39:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id k16sm12748001pgm.26.2022.01.24.06.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 06:39:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s/interrupt: Fix decrementer storm
Date: Tue, 25 Jan 2022 00:39:28 +1000
Message-Id: <20220124143930.3923442-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The decrementer exception can fail to be cleared when the interrupt
returns in the case where the decrementer wraps with the next timer
still beyond decrementer_max. This results in a decrementer interrupt
storm. This is triggerable with small decrementer system with hard
and soft watchdogs disabled.

Fix this by always programming the decrementer if there was no timer.

Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless perf is in use")
Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/time.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 62361cc7281c..cd0b8b71ecdd 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -649,8 +649,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		__this_cpu_inc(irq_stat.timer_irqs_event);
 	} else {
 		now = *next_tb - now;
-		if (now <= decrementer_max)
-			set_dec_or_work(now);
+		if (now > decrementer_max)
+			now = decrementer_max;
+		set_dec_or_work(now);
 		__this_cpu_inc(irq_stat.timer_irqs_others);
 	}
 
-- 
2.23.0

