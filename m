Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9247131C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl9X67M2z3ffG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lWWP/2wc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lWWP/2wc;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0S4YCqz3fFh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:32 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso1233769b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151752; x=1687743752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=;
        b=lWWP/2wciP5Lcnvzvjsar/98gic2UMLjL7shy/u4jcBVbG5MnQbC3jVJH8wV32l4xR
         /nrvT+VbnmoHL7WUx9Zoh+UT6oazi8OyVzo4oafQGAwcJbnMk2/Hi1w+wVB/DP/r1xpp
         TGm6jAwztGOFKItK9wAegBPuXnpdHRPuC12Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151752; x=1687743752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=;
        b=X3y3DJTzgCvG82Y4kXbCBD9sIS0/8OJS1bQxuSWFat0/hI8XOZPOOqJm7Jmo2uEq6l
         oHmUjB5ZCIID4Ivi+PZqijdGjAwDjmkZfDNPqoyDjKzcD27S0VpjaNlEucq98qnXamkQ
         j32I8V9r8Gv9isjqmWxO3WOuqhESXfOQu1UjLna2D1Dn9lVTyh5KJOivjfzXXtcdjDbx
         5nZDMUVaCJ1DM4kx7cU/OXXBD+bWQhP+FkfZsUzTKV1WIiu7x9VtezT7ziIflnkkazaX
         nLb6BF3qR1K0we2qRa4XKxzhB8ks27cxCjhBsicphZo1b9LSXn+ETv7vChDS0D90O9yd
         1DRQ==
X-Gm-Message-State: AC+VfDzg3s59pSMwt8fwTZ8V/5Lo5df3anIY7GTR2Laj4ih/8JSgEC0J
	euWiLaTtBp1Rzw9w/XQD4QJ+Hg==
X-Google-Smtp-Source: ACHHUZ6DB7hFCO3S8IN2pb5iImgPKyxBk6jrI7pr6oeNwgGoZm+rSryxNvvUZrHJqd9sGrPZ5NEogQ==
X-Received: by 2002:a05:6a20:2d2a:b0:10c:7c72:bdd6 with SMTP id g42-20020a056a202d2a00b0010c7c72bdd6mr1357189pzl.59.1685151752164;
        Fri, 26 May 2023 18:42:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/10] watchdog/hardlockup: Move SMP barriers from common code to buddy code
Date: Fri, 26 May 2023 18:41:39 -0700
Message-ID: <20230526184139.9.I5ab0a0eeb0bd52fb23f901d298c72fa5c396e22b@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's been suggested that since the SMP barriers are only potentially
useful for the buddy hardlockup detector, not the perf hardlockup
detector, that the barriers belong in the buddy code. Let's move them
and add clearer comments about why they're needed.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c       |  6 ------
 kernel/watchdog_buddy.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 6cc46b8e3d07..a351ab0c35eb 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -109,9 +109,6 @@ EXPORT_SYMBOL(arch_touch_nmi_watchdog);
 void watchdog_hardlockup_touch_cpu(unsigned int cpu)
 {
 	per_cpu(watchdog_hardlockup_touched, cpu) = true;
-
-	/* Match with smp_rmb() in watchdog_hardlockup_check() */
-	smp_wmb();
 }
 
 static bool is_hardlockup(unsigned int cpu)
@@ -141,9 +138,6 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
-	/* Match with smp_wmb() in watchdog_hardlockup_touch_cpu() */
-	smp_rmb();
-
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
 		return;
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index 2ef88722c5e7..34dbfe091f4b 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -51,6 +51,13 @@ void watchdog_hardlockup_enable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on this CPU before
+	 * other CPUs could see it in watchdog_cpus. The counter
+	 * part is in watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_set_cpu(cpu, &watchdog_cpus);
 }
 
@@ -68,6 +75,13 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on the next CPU before
+	 * this CPU disappear in watchdog_cpus. The counter part is in
+	 * watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_clear_cpu(cpu, &watchdog_cpus);
 }
 
@@ -88,5 +102,12 @@ void watchdog_buddy_check_hardlockup(int hrtimer_interrupts)
 	if (next_cpu >= nr_cpu_ids)
 		return;
 
+	/*
+	 * Make sure that the watchdog was touched on next CPU when
+	 * watchdog_next_cpu() returned another one because of
+	 * a change in watchdog_hardlockup_enable()/disable().
+	 */
+	smp_rmb();
+
 	watchdog_hardlockup_check(next_cpu, NULL);
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog

