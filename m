Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4650B9D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 16:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlGf72lsfz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 00:15:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DLUPr3Mr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DLUPr3Mr; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlGdQ3vtjz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 00:15:04 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id t12so11127051pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrTV+vKHG9WRBs5wYVMFlDVclc2ptNVvzr3BSJrgrQw=;
 b=DLUPr3Mrol9s6jb3RZJTqcrKP8CqrkjBoKBR4tINnis9V4dAih4Z3ce8OiJ+Wq+Hab
 8n8POr08CCxV5W51U2pcyDX2nLfw+8ZcXlJQ5knVwCQ7FgvVTL9Y8T/R9HBpXkNMQrmA
 zlCDnzU/AOCwzkZGH0F8sFLiXPZi6b8qaBarhEdwL4E49vK4H8jdfnq2MsFRgxkJSHJF
 bDiJHAijIykxyUvXXCA5VW1aGsIQYxyNa+Rcu3tM6D8YRT7Da3hWHAhNE9DPsHTiZbRY
 e6/tPyh4HAU6BPutD2bg4ZQv8vl+bSWWyecmJw2xKfvNwydr0UzJVXHlpjIojkHPYmA+
 w7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrTV+vKHG9WRBs5wYVMFlDVclc2ptNVvzr3BSJrgrQw=;
 b=vhKw69O5dvB00fwKYoLIRQ3FCGg9MIE2p7qlYdCbRD2sZ+Ivms6SfaJkWiEjRmWz2g
 hvUxicquLIQDWctME1THvhzd1NKqEEOKKaWQrsP8wBnoQ+8Cz1ZH73BpRnkJNkuhL7lV
 U8qhx2vIsVYswqfB1ZVTYrgONUUhP6z6xxNlT79+WjOI5Tk8nu1iuWf3dPlVVbD3fZMd
 eAw7mjhKZyoEAHFIPaYVt7nRM8jd6+6I4Y733dPY4DuuVJTqxBHDQhIA9aJmplH9QOX4
 atz+Lxp/gpC9KmKOpI32F1xYzC1E2N14bPt/lFPrbPQ5C71ntKYe68NKAhUB3/aFx8z3
 kpIg==
X-Gm-Message-State: AOAM532nQrgPfTsXGHBSJlHWaTScfx3ehmtFh105yogpnv7avQMFELpa
 WG8WvY+58Cpyv8xYTdRV2YA=
X-Google-Smtp-Source: ABdhPJxbucRQpRtBfAtKgiD4p7RWXqg/vYMGxckPmzgSbfRkbwJoeF8x2zTyLe3nPyaqonO8URY1Tg==
X-Received: by 2002:a17:902:ce91:b0:15a:46bf:e629 with SMTP id
 f17-20020a170902ce9100b0015a46bfe629mr4906042plg.118.1650636900735; 
 Fri, 22 Apr 2022 07:15:00 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-116-20.tpgi.com.au.
 [193.116.116.20]) by smtp.gmail.com with ESMTPSA id
 gn8-20020a17090ac78800b001cd4989ff70sm613507pjb.55.2022.04.22.07.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 07:15:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] timers/nohz: Low-res tick handler switch to ONESHOT_STOPPED
 if tick stops
Date: Sat, 23 Apr 2022 00:14:46 +1000
Message-Id: <20220422141446.915024-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <fweisbec@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When tick_nohz_stop_tick() stops the tick, the the clock event device
is not put into ONESHOT_STOPPED mode. This can lead to spurious timer
interrupts with some clock event device drivers that don't shut down
entirely after firing.

Eliminate these by putting the device into ONESHOT_STOPPED mode at
points where it is not being reprogrammed. When there are no timers
active, then tick_program_event() with KTIME_MAX can be used to stop the
device. When there is a timer active, the device can be stopped at the
next tick (any new timer added by timers will reprogram the tick).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/time/tick-sched.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index d257721c68b8..da1a7efa45a4 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -928,6 +928,8 @@ static void tick_nohz_stop_tick(struct tick_sched *ts, int cpu)
 	if (unlikely(expires == KTIME_MAX)) {
 		if (ts->nohz_mode == NOHZ_MODE_HIGHRES)
 			hrtimer_cancel(&ts->sched_timer);
+		else
+			tick_program_event(KTIME_MAX, 1);
 		return;
 	}
 
@@ -1364,9 +1366,14 @@ static void tick_nohz_handler(struct clock_event_device *dev)
 	tick_sched_do_timer(ts, now);
 	tick_sched_handle(ts, regs);
 
-	/* No need to reprogram if we are running tickless  */
-	if (unlikely(ts->tick_stopped))
+	if (unlikely(ts->tick_stopped)) {
+		/*
+		 * If we are tickless, no need to reprogram, so change the
+		 * clock event device to ONESHOT_STOPPED.
+		 */
+		tick_program_event(KTIME_MAX, 1);
 		return;
+	}
 
 	hrtimer_forward(&ts->sched_timer, now, TICK_NSEC);
 	tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
-- 
2.35.1

