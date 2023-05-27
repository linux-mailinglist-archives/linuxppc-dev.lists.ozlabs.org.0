Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632A7131B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:43:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl250Xt0z3fNj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:43:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k5hflWz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k5hflWz1;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0F5kzdz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:20 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d24136685so1081201b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151738; x=1687743738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=;
        b=k5hflWz1ojXxjFKRiwHgsk5p/ZbmXIIfYfK4EdK0UtXLo2Tbb74nHxOJ8I17Sf9sxy
         7MD+TcUADQQ+iohHT+1kqBlvhx1hOCsgxOD4ajd121XAcoVe7I9JgK6CPn4SYzCJm/ol
         YM9N2ByDO4u3BG+dWzNDW3yTIS6cbMGQWCxnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151738; x=1687743738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=;
        b=O4mt926qXhKFFMk/KPGJ//FGzaCzg4GDMH7AEaa9f5LqqEOA5chkigt+Ee+iNBapux
         UqWGyb1L+ujxqyHwHBiuUGx0EvGjzNpTR5tFaUoQA7H/kNN0wuEeos/aDzCcAr/fSsKD
         CpxeSGE6tCIGDFf4HpvzpVWzXY19UaGkCuOQ8FEgSTnvQlMyDHk1VgtEfrTxL+WQ8+I6
         PYIJfc62nm4jAQjoqhM06Dr7LGI7Estcigu0+eqk4qWQRT+Gg5IpKN0xQEYgb2SjoNfr
         VSh17jzxS0QSH3qCuog6mVL1xydVtF05Zpl7+uvWkDhrrdmHZWSr7fOo118PJ3ijhbBg
         GcPg==
X-Gm-Message-State: AC+VfDwzy3xTIcwHfOtl/kLtINRCWosnTNoyaRMTsHYtbwVRvXLSQnnJ
	d+5Fr4D1naeTD9y6Dcjjero4Dw==
X-Google-Smtp-Source: ACHHUZ7tQKomhZw+AyOO+6VKcS+sY1Y2WDAS5xt3xizvvLTbv73yPg/Ctnx4geaFhMkCoPBSd4R4lw==
X-Received: by 2002:a05:6a00:1586:b0:648:a518:4ac6 with SMTP id u6-20020a056a00158600b00648a5184ac6mr1023104pfk.14.1685151738030;
        Fri, 26 May 2023 18:42:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/10] watchdog/hardlockup: Keep kernel.nmi_watchdog sysctl as 0444 if probe fails
Date: Fri, 26 May 2023 18:41:31 -0700
Message-ID: <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
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

The permissions for the kernel.nmi_watchdog sysctl have always been
set at compile time despite the fact that a watchdog can fail to
probe. Let's fix this and set the permissions based on whether the
hardlockup detector actually probed.

Fixes: a994a3147e4c ("watchdog/hardlockup/perf: Implement init time detection of perf")
Reported-by: Petr Mladek <pmladek@suse.com>
Closes: https://lore.kernel.org/r/ZHCn4hNxFpY5-9Ki@alley
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h |  6 ------
 kernel/watchdog.c   | 30 ++++++++++++++++++++----------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 333465e235e1..3a27169ec383 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -95,12 +95,6 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
-#if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
-# define NMI_WATCHDOG_SYSCTL_PERM	0644
-#else
-# define NMI_WATCHDOG_SYSCTL_PERM	0444
-#endif
-
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 237990e8d345..4b9e31edb47f 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -880,15 +880,6 @@ static struct ctl_table watchdog_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= (void *)&sixty,
 	},
-	{
-		.procname       = "nmi_watchdog",
-		.data		= &watchdog_hardlockup_user_enabled,
-		.maxlen		= sizeof(int),
-		.mode		= NMI_WATCHDOG_SYSCTL_PERM,
-		.proc_handler   = proc_nmi_watchdog,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
-	},
 	{
 		.procname	= "watchdog_cpumask",
 		.data		= &watchdog_cpumask_bits,
@@ -952,10 +943,28 @@ static struct ctl_table watchdog_sysctls[] = {
 	{}
 };
 
+static struct ctl_table watchdog_hardlockup_sysctl[] = {
+	{
+		.procname       = "nmi_watchdog",
+		.data		= &watchdog_hardlockup_user_enabled,
+		.maxlen		= sizeof(int),
+		.mode		= 0444,
+		.proc_handler   = proc_nmi_watchdog,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+	{}
+};
+
 static void __init watchdog_sysctl_init(void)
 {
 	register_sysctl_init("kernel", watchdog_sysctls);
+
+	if (watchdog_hardlockup_available)
+		watchdog_hardlockup_sysctl[0].mode = 0644;
+	register_sysctl_init("kernel", watchdog_hardlockup_sysctl);
 }
+
 #else
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
@@ -1011,6 +1020,8 @@ static int __init lockup_detector_check(void)
 	/* Make sure no work is pending. */
 	flush_work(&detector_work);
 
+	watchdog_sysctl_init();
+
 	return 0;
 
 }
@@ -1030,5 +1041,4 @@ void __init lockup_detector_init(void)
 		allow_lockup_detector_init_retry = true;
 
 	lockup_detector_setup();
-	watchdog_sysctl_init();
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog

