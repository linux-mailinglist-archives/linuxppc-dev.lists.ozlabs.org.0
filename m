Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A96547131C1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl6m49z8z3fc9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:48:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJPM8uBH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJPM8uBH;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0P1dKBz3fF8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:29 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d5b4c400fso1812559b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151747; x=1687743747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=;
        b=MJPM8uBHWtcGykg6NBnTXOlp/wt/zisapv2LqVrNAXkdImxD++McjkPouYYjhNBMZ/
         FtnMFxUfnwDPpZ8d3KsgOQlpZlNtaUXpmKC4q99ybOisJ5hfu5QhtX1wrIemYl3fq166
         Chku98BUooqaBLPGzQqvfd2wrHxDC0QaznFMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151747; x=1687743747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=;
        b=OGy2xQtJ2pnGU5M5idGUqjuW/Pi2S1Ucja7SikJOxR3ZaPTvFl5JPloDOybQCxSH66
         NuloGmv1gqtvwIYiWiFUmaffiv+uZiqWuDM9NkgqyAdDv15ezAXsV4aJMV2XXuH8j4w+
         7ysizUVhJeEhXQgo4yBwJn93f7zM3YrCU6KvUDTCAiB/kl2cp79EGMaxPVmd8EO1RSUE
         r744yoihSd7MyofD0rqsV6J9pizLF3+BzSXwrQGic+otKFJUncdV5GDr38C17XlG7obz
         4xPbFITTfuagpbAJ5+Ejj4YWurWSJfe9z6x2hn5J5wjgK0O/F5AjZwCdevfs5Cs+td6G
         LgbQ==
X-Gm-Message-State: AC+VfDw0TNWtBf00bGMEU+DBrEr6vvBnZI5NuLbKRPOIpKPReU3mM9+x
	AkSv/dcesF4BcFOlabrtHwMAhA==
X-Google-Smtp-Source: ACHHUZ49rllat2/JyQzbGZ3WjkseglfJC0pbWMXitDuVE2AIZugbceGuvm9VVDVfo56QxxDU2q8Bew==
X-Received: by 2002:aa7:888e:0:b0:63b:8eeb:77b8 with SMTP id z14-20020aa7888e000000b0063b8eeb77b8mr6362327pfe.13.1685151746880;
        Fri, 26 May 2023 18:42:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/10] watchdog/buddy: Cleanup how watchdog_buddy_check_hardlockup() is called
Date: Fri, 26 May 2023 18:41:36 -0700
Message-ID: <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
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

In the patch ("watchdog/hardlockup: detect hard lockups using
secondary (buddy) CPUs"), we added a call from the common watchdog.c
file into the buddy. That call could be done more cleanly.
Specifically:
1. If we move the call into watchdog_hardlockup_kick() then it keeps
   watchdog_timer_fn() simpler.
2. We don't need to pass an "unsigned long" to the buddy for the timer
   count. In the patch ("watchdog/hardlockup: add a "cpu" param to
   watchdog_hardlockup_check()") the count was changed to "atomic_t"
   which is backed by an int, so we should match types.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h     |  4 ++--
 kernel/watchdog.c       | 15 +++++++--------
 kernel/watchdog_buddy.c |  2 +-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 6c6a5ce77c66..43893e5f858a 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -114,9 +114,9 @@ void watchdog_hardlockup_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
-void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts);
+void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
 #else
-static inline void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts) {}
+static inline void watchdog_buddy_check_hardlockup(int hrtimer_interrupts) {}
 #endif
 
 /**
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 85f4839b6faf..6cc46b8e3d07 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -131,9 +131,12 @@ static bool is_hardlockup(unsigned int cpu)
 	return false;
 }
 
-static unsigned long watchdog_hardlockup_kick(void)
+static void watchdog_hardlockup_kick(void)
 {
-	return atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
+	int new_interrupts;
+
+	new_interrupts = atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
+	watchdog_buddy_check_hardlockup(new_interrupts);
 }
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
@@ -195,7 +198,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
-static inline unsigned long watchdog_hardlockup_kick(void) { return 0; }
+static inline void watchdog_hardlockup_kick(void) { }
 
 #endif /* !CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
@@ -449,15 +452,11 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	struct pt_regs *regs = get_irq_regs();
 	int duration;
 	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
-	unsigned long hrtimer_interrupts;
 
 	if (!watchdog_enabled)
 		return HRTIMER_NORESTART;
 
-	hrtimer_interrupts = watchdog_hardlockup_kick();
-
-	/* test for hardlockups */
-	watchdog_buddy_check_hardlockup(hrtimer_interrupts);
+	watchdog_hardlockup_kick();
 
 	/* kick the softlockup detector */
 	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index fee45af2e5bd..3ffc5f2ede5a 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -72,7 +72,7 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &watchdog_cpus);
 }
 
-void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts)
+void watchdog_buddy_check_hardlockup(int hrtimer_interrupts)
 {
 	unsigned int next_cpu;
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

