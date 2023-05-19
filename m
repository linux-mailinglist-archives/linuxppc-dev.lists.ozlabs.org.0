Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB8B709E45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDW151VTz3gK9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:34:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PATq2+SZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PATq2+SZ;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDCY2DF8z3fN4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:29 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ae87bdc452so4998915ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516887; x=1687108887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ8xaDz4TWJj5VUxOczM3/qedYb/4TuBRfOr+o2w8q8=;
        b=PATq2+SZhC3nVJZLQNVYmgZXAZp0EGQ62U+p/BHRYOHS5+VE3ibJLQpQYlSVjOJXCO
         wLqEn6wQAk/zqs4i4YOg0RrMuWnX6Zew4XdlM/vNbDqcZK1ppauCR6oqe4D0ha5zp+pu
         QU3dBm300YtU/XNEnjJsWyLF4alt5Q2AfL4Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516887; x=1687108887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ8xaDz4TWJj5VUxOczM3/qedYb/4TuBRfOr+o2w8q8=;
        b=lPgP/4OsiYH80GDlXPauyVjA/E/uXtuTVGC2qO3VfqvwyJ1Mfm7ZmxiSGqYvK8O3gs
         spCz54reidTZyG3Jld0MOOU785SbB6vVdWqpiIWMIkEJ90nWQdeVTLe/sFEJKfEZZIRe
         Ksr4z45C6P+IqiNJ2Pv05ZrUcMqUm23BntVunW7WOFmA8C6wO96Z4VSGciNjbPZWEdb4
         nT/lVS/TZ/jM97Cs7253d1ReJ/1PanRTW/i6crrw9BxN7uslQAs8NBlACQ7JPW+AxbVa
         IJ3taEFuLaCiQ9IDEJiBQS9Oc/HhwqCkt6FiVid52yVED1g3juzuJN0APxN+MB8Cznu5
         Ap/w==
X-Gm-Message-State: AC+VfDyOeLnhDB4S8Xb9iyJsDWxoLOg07POclWxKeSF7QuSWrQloLMLK
	XejfTtKX1UCl08PyMX3G2eD2Kg==
X-Google-Smtp-Source: ACHHUZ6Gtx0YpqXCB5KZGOLGsarZgHxkvpPbd2TpiRXaYgv4/gEwDRKkPtcKXNwMfxLde3dNLwE7uw==
X-Received: by 2002:a17:903:244a:b0:1ac:63b6:f1ca with SMTP id l10-20020a170903244a00b001ac63b6f1camr4941839pls.0.1684516887198;
        Fri, 19 May 2023 10:21:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 16/18] watchdog/perf: Adapt the watchdog_perf interface for async model
Date: Fri, 19 May 2023 10:18:40 -0700
Message-ID: <20230519101840.v5.16.If4ad5dd5d09fb1309cebf8bcead4b6a5a7758ca7@changeid>
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

From: Lecopzer Chen <lecopzer.chen@mediatek.com>

When lockup_detector_init()->watchdog_hardlockup_probe(), PMU may be
not ready yet. E.g. on arm64, PMU is not ready until
device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
with the driver model and cpuhp. Hence it is hard to push this
initialization before smp_init().

But it is easy to take an opposite approach and try to initialize
the watchdog once again later.
The delayed probe is called using workqueues. It need to allocate
memory and must be proceed in a normal context.
The delayed probe is able to use if watchdog_hardlockup_probe() returns
non-zero which means the return code returned when PMU is not ready yet.

Provide an API - lockup_detector_retry_init() for anyone who needs
to delayed init lockup detector if they had ever failed at
lockup_detector_init().

The original assumption is: nobody should use delayed probe after
lockup_detector_check() which has __init attribute.
That is, anyone uses this API must call between lockup_detector_init()
and lockup_detector_check(), and the caller must have __init attribute

Reviewed-by: Petr Mladek <pmladek@suse.com>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together.

As part of making this match with my series, I resolved a few
conflicts and did a few renames. I also fixed the kernel test robot
yell [2] by providing a dummy implementation of the retry function if
CONFIG_LOCKUP_DETECTOR wasn't defined. That led me to move the
definition of the function and sanitize the name of the function to
match others around it.

This patch makes less sense without the patches to add support for the
arm64 perf hardlockup detector. Thus, I've put it at the end of the
series.

I removed the "kernel test robot" tag since that didn't really make
sense. Presumably the robot found a problem on a previous version of
the patch, but that's not normally a reason to add the Reported-by.

[1] https://lore.kernel.org/r/20220903093415.15850-5-lecopzer.chen@mediatek.com/
[2] https://lore.kernel.org/r/202209050639.jDaWd49E-lkp@intel.com/

(no changes since v4)

Changes in v4:
- Pulled ("Adapt the watchdog_hld interface ...") into my series for v4.

 include/linux/nmi.h |  2 ++
 kernel/watchdog.c   | 67 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index eb616fc07c85..d23902a2fd49 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -13,6 +13,7 @@
 
 #ifdef CONFIG_LOCKUP_DETECTOR
 void lockup_detector_init(void);
+void lockup_detector_retry_init(void);
 void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 
@@ -34,6 +35,7 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
 
 #else /* CONFIG_LOCKUP_DETECTOR */
 static inline void lockup_detector_init(void) { }
+static inline void lockup_detector_retry_init(void) { }
 static inline void lockup_detector_soft_poweroff(void) { }
 static inline void lockup_detector_cleanup(void) { }
 #endif /* !CONFIG_LOCKUP_DETECTOR */
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 4110f7ca23a5..877d8670f26e 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -208,7 +208,13 @@ void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
 
 void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
 
-/* Return 0, if a hardlockup watchdog is available. Error code otherwise */
+/*
+ * Watchdog-detector specific API.
+ *
+ * Return 0 when hardlockup watchdog is available, negative value otherwise.
+ * Note that the negative value means that a delayed probe might
+ * succeed later.
+ */
 int __weak __init watchdog_hardlockup_probe(void)
 {
 	/*
@@ -954,6 +960,62 @@ static void __init watchdog_sysctl_init(void)
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+static void __init lockup_detector_delay_init(struct work_struct *work);
+static bool allow_lockup_detector_init_retry __initdata;
+
+static struct work_struct detector_work __initdata =
+		__WORK_INITIALIZER(detector_work, lockup_detector_delay_init);
+
+static void __init lockup_detector_delay_init(struct work_struct *work)
+{
+	int ret;
+
+	ret = watchdog_hardlockup_probe();
+	if (ret) {
+		pr_info("Delayed init of the lockup detector failed: %d\n", ret);
+		pr_info("Hard watchdog permanently disabled\n");
+		return;
+	}
+
+	allow_lockup_detector_init_retry = false;
+
+	watchdog_hardlockup_available = true;
+	lockup_detector_setup();
+}
+
+/*
+ * lockup_detector_retry_init - retry init lockup detector if possible.
+ *
+ * Retry hardlockup detector init. It is useful when it requires some
+ * functionality that has to be initialized later on a particular
+ * platform.
+ */
+void __init lockup_detector_retry_init(void)
+{
+	/* Must be called before late init calls */
+	if (!allow_lockup_detector_init_retry)
+		return;
+
+	schedule_work(&detector_work);
+}
+
+/*
+ * Ensure that optional delayed hardlockup init is proceed before
+ * the init code and memory is freed.
+ */
+static int __init lockup_detector_check(void)
+{
+	/* Prevent any later retry. */
+	allow_lockup_detector_init_retry = false;
+
+	/* Make sure no work is pending. */
+	flush_work(&detector_work);
+
+	return 0;
+
+}
+late_initcall_sync(lockup_detector_check);
+
 void __init lockup_detector_init(void)
 {
 	if (tick_nohz_full_enabled())
@@ -964,6 +1026,9 @@ void __init lockup_detector_init(void)
 
 	if (!watchdog_hardlockup_probe())
 		watchdog_hardlockup_available = true;
+	else
+		allow_lockup_detector_init_retry = true;
+
 	lockup_detector_setup();
 	watchdog_sysctl_init();
 }
-- 
2.40.1.698.g37aff9b760-goog

