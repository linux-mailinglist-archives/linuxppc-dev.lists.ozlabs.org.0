Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3225B3AA2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPJF66dbLz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gtj/v5eO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gtj/v5eO;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPJDS3bNQz309f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 00:25:10 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id v4so1705062pgi.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=r6BbS5hKD5MBA0qnr4A2qIoexZyUcM16NTS1fhIxL+4=;
        b=gtj/v5eOjKTm/8FoNhoDA/kkoAIFFJWljhyt3D9t+9pQEuHGUwYj+hpc2Ecw5VVfqg
         n7XqlN8os0lyC5xBFSzNKDb9Ly7wTf51JhO1Vzo6IAqJXaP2qvCipFsTL4LUBOIzM8CT
         7EZA0OeyyaRR3eqxKTWQ/XXbGTYppYZ4PN0xskPKsGLnXABp8xGKPzo9vwMln332LeNV
         MYCBNdDAoP6s1pkbzgbK52OnnReqEOrkJ3tgwCHcGgGf+rXKIACcGlKo+/8wVPfAdIwd
         6t9gJtVNBuayFOfHtC3z9E6Rh31oB6HHudRwRhtisf8HnRSQQ9VofU6SboAiWmGMMlqw
         PlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=r6BbS5hKD5MBA0qnr4A2qIoexZyUcM16NTS1fhIxL+4=;
        b=EICoDsuaXDijo59b0jQuXIIIuuECAKft59D6MNSA1E8tLfXQ1umD3alHUMx5FYMejg
         1h3Hwo1RzlyvE4VPfZx1xBsj5pJhpdm6qQu3AVuJ03cOpJgxEwNzgESBexcg6xeGBK89
         JhLFSgddVSqhnv0KgLrHy2iUpP21w+LfQGr9IYKs3/0y8AlRtcI9QuaAT7Ce6Kmx7HUo
         f1C2LGCIIgmMKUEikPVGMMNKEshcgRoJK/rGfoT9gYeRBsLUq857S5GTrkY5nvjjynPK
         5SlY2qrklpYLMx8hBHl92fDtS630oQ5MUf5HR1e4fd1M/Uaghjc0qQoCe4OdV9pdHKgH
         e4ng==
X-Gm-Message-State: ACgBeo0C5MhUxa+t2dL3THRTDZM3cx56B8FZMxLmnCKnb1XVvAXFkPW7
	0sm33PJz+RFrmPgRThFdQBQ9IMdQ/1QELw==
X-Google-Smtp-Source: AA6agR6FHqjTHl/K+JVp2uOGxbl+5h/vCMf4iAbuF2S/FWGTQIxO+vdJJ5SlNmwsRA3ix/P7nwqiAA==
X-Received: by 2002:a05:6a00:2290:b0:541:f19:5197 with SMTP id f16-20020a056a00229000b005410f195197mr651544pfe.42.1662733505153;
        Fri, 09 Sep 2022 07:25:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.209])
        by smtp.gmail.com with ESMTPSA id d11-20020a62f80b000000b00528c066678csm609333pfh.72.2022.09.09.07.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:25:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/time: avoid programming DEC at the start of the timer interrupt
Date: Sat, 10 Sep 2022 00:24:57 +1000
Message-Id: <20220909142457.278032-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

Setting DEC to maximum at the start of the timer interrupt is not
necessary and can be avoided for performance when MSR[EE] is not
enabled during the handler as explained in commit 0faf20a1ad16
("powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless
perf is in use"), where this change was first attempted.

The idea is that the timer interrupt runs with MSR[EE]=0, and at the end
of the interrupt DEC is programmed to the next timer interval, so there
is no need to clear the decrementer exception before then.

When the above commit was merged, that was not quite true. The low res
timer subsystem had some cases in the oneshot timer code where if the
tick was to be stopped and no timers active, the clock device would not
get the ->set_state_oneshot_stopped() call, so DEC would not get
reprogrammed, and this would hang taking continual timer interrupts.

So this was reverted in commit d2b9be1f4af5 ("powerpc/time: Always set
decrementer in timer_interrupt()"), which was a partial revert of the
above commit.

Commit 62c1256d5447 ("timers/nohz: Switch to ONESHOT_STOPPED in the
low-res handler when the tick is stopped") was later merged to fix this
missing case in the timer subsystem, so now the behaviour can be
restored.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Try this again. This boots fine with CONFIG_HIGH_RES_TIMERS=n.
Reverting 62c1256d5447 with this patch applied causes the
infinite timer hang to reappear, which confirms test is doing
something useful.

Thanks,
Nick

 arch/powerpc/kernel/time.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 587adcc12860..328129f19a2e 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -614,22 +614,23 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		return;
 	}
 
-	/*
-	 * Ensure a positive value is written to the decrementer, or
-	 * else some CPUs will continue to take decrementer exceptions.
-	 * When the PPC_WATCHDOG (decrementer based) is configured,
-	 * keep this at most 31 bits, which is about 4 seconds on most
-	 * systems, which gives the watchdog a chance of catching timer
-	 * interrupt hard lockups.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
-		set_dec(0x7fffffff);
-	else
-		set_dec(decrementer_max);
-
 	/* Conditionally hard-enable interrupts. */
-	if (should_hard_irq_enable())
+	if (should_hard_irq_enable()) {
+		/*
+		 * Ensure a positive value is written to the decrementer, or
+		 * else some CPUs will continue to take decrementer exceptions.
+		 * When the PPC_WATCHDOG (decrementer based) is configured,
+		 * keep this at most 31 bits, which is about 4 seconds on most
+		 * systems, which gives the watchdog a chance of catching timer
+		 * interrupt hard lockups.
+		 */
+		if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
+			set_dec(0x7fffffff);
+		else
+			set_dec(decrementer_max);
+
 		do_hard_irq_enable();
+	}
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 	if (atomic_read(&ppc_n_lost_interrupts) != 0)
-- 
2.37.2

