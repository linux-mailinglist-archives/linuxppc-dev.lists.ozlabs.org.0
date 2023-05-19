Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E39709E0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDN45G6Mz3fKc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C0Isk5Lo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C0Isk5Lo;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDC62mSTz3fH3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:06 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-24e16918323so2552071a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516864; x=1687108864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=;
        b=C0Isk5LoVOO5xBj08Ka29F5mSazn4+608Fj8hSVomCBNII30To6zGAh3uqBhclp5Po
         RoR0m/F8OkPL1Fg6XrRCGAvftgsjt8zKTnlHd3XnlQKPdWI9/upIWnc354omRRekG/Vd
         4TzsQ4hKHmtS5GROcyT9kz7nfPJTE6eYw3FL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516864; x=1687108864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=;
        b=Cfd2pYwJbe1Ge5jx4m2l91au1RHENuMx4fjSf48HBJzDTul3R2IJ4PQzKK0Tkk/7Ac
         4JXNDnx3SGnSr3HXnpmBZlm5oQTqL+0F5AqpZF4WKwL9GyZGTf3XIDvo1p+gKfR5ATXX
         uUYtV5bfBGNHMxO7srBSPlIgY5mY9K1dTUjcCMdB3bhCs1A4eqo3zShyKBnZvwYr8kqM
         R3hTk98nTIsZrf7EU7c4bdOF9FGvHoIKDKuTTFQJkHclOv7qaBOjjEZctMEHj5LHRpB7
         Pacdx3k4GAGP46j3XzNqGr0pts8tdk1uprxTKEgvQ2TrxS7IIYWHusFTDpMeO35kllIu
         f9Yg==
X-Gm-Message-State: AC+VfDygyDjf2xXeGywcNp+djmTuqMSxC2Uoe66bkaq28K80Tmau1c8S
	zwGaFNh7ERzIjxuk7vLpHWqGyQ==
X-Google-Smtp-Source: ACHHUZ4TDRDg+n16F9FgO6fjA4fEHipyKz1sAvTzlrch+J4I3oFlt6TdHTXq6tF/PHzC+ANYmNfBhw==
X-Received: by 2002:a17:90a:f3c7:b0:249:748b:a232 with SMTP id ha7-20020a17090af3c700b00249748ba232mr2835727pjb.25.1684516864714;
        Fri, 19 May 2023 10:21:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 09/18] watchdog/hardlockup: Style changes to watchdog_hardlockup_check() / is_hardlockup()
Date: Fri, 19 May 2023 10:18:33 -0700
Message-ID: <20230519101840.v5.9.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozla
 bs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are tiny style changes:
- Add a blank line before a "return".
- Renames two globals to use the "watchdog_hardlockup" prefix.
- Store processor id in "unsigned int" rather than "int".
- Minor comment rewording.
- Use "else" rather than extra returns since it seemed more symmetric.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- watchdog_hardlockup_dumped_stacks => watchdog_hardlockup_all_cpu_dumped
- watchdog_hardlockup_processed => watchdog_hardlockup_warned

Changes in v4:
- ("Style changes to watchdog_hardlockup_check ...") new for v4.

 kernel/watchdog.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 12ce37d76e7d..169e5dffbc00 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -89,8 +89,8 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
-static DEFINE_PER_CPU(bool, hard_watchdog_warn);
-static unsigned long hardlockup_allcpu_dumped;
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
+static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
 static bool is_hardlockup(void)
 {
@@ -100,6 +100,7 @@ static bool is_hardlockup(void)
 		return true;
 
 	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+
 	return false;
 }
 
@@ -110,21 +111,20 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(struct pt_regs *regs)
 {
-	/* check for a hardlockup
-	 * This is done by making sure our timer interrupt
-	 * is incrementing.  The timer interrupt should have
-	 * fired multiple times before we overflow'd.  If it hasn't
+	/*
+	 * Check for a hardlockup by making sure the CPU's timer
+	 * interrupt is incrementing. The timer interrupt should have
+	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
 	if (is_hardlockup()) {
-		int this_cpu = smp_processor_id();
+		unsigned int this_cpu = smp_processor_id();
 
-		/* only print hardlockups once */
-		if (__this_cpu_read(hard_watchdog_warn) == true)
+		/* Only print hardlockups once. */
+		if (__this_cpu_read(watchdog_hardlockup_warned))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
-			 this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
 		print_modules();
 		print_irqtrace_events(current);
 		if (regs)
@@ -137,18 +137,16 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 		 * generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
-				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
+		    !test_and_set_bit(0, &watchdog_hardlockup_all_cpu_dumped))
 			trigger_allbutself_cpu_backtrace();
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(hard_watchdog_warn, true);
-		return;
+		__this_cpu_write(watchdog_hardlockup_warned, true);
+	} else {
+		__this_cpu_write(watchdog_hardlockup_warned, false);
 	}
-
-	__this_cpu_write(hard_watchdog_warn, false);
-	return;
 }
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
-- 
2.40.1.698.g37aff9b760-goog

