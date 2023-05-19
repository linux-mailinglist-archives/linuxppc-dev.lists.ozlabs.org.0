Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F7709E43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDV52f5bz3fmY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Pht+hrXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Pht+hrXl;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDCT6Xljz3fM1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:25 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ae3ed1b08eso35359315ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516884; x=1687108884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL6x11AHUdbqwPOBex8MH92mOu6poqhjfJN8Bz63N4s=;
        b=Pht+hrXlamhoKc3Sfk+JnwTbwmcG4p0AC6wXT9KK+YLT5G/A8PMg/Kgierf2mtzawr
         ClBv70BUaPRNqYHKjGkk7QBTOalxnZ8r6RtmZDQddTP1/P2XptlY4Z2wVzZmyx2mgkUl
         BcimCZ+ntm13VOGd+9TV47CPKcYCQWDP2CsA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516884; x=1687108884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL6x11AHUdbqwPOBex8MH92mOu6poqhjfJN8Bz63N4s=;
        b=dYKehMHgsRCOohfCzvW+gVtSFxYEKseTCiNQyWToJjyE0G43jMQ9lh0gub1aormjYv
         VnXIGhdi04iXY534/tVU5bi0EKCk9AtDrITsx0AwfzzfsfRBNaTVhoR5NNEZwe84AboU
         TH+J3eRx8qOZJ3/CnSDCrJO8szq5YLSgIIDw0oNVOVthOC47DD9GCK0iMhl0KNkUKR3T
         IvCmfyQdBQTFPJyolz8R5YzIaFZNeU1gy4nabFUH0QECrodrojAgaJCOI/UZBnYgxMes
         9yWHruqfJ0Ze8Kvi1C8TlT3Nj0ftg3272KO/v9io2y0OicqcUJMyvSHUmGa7Y1rG+lyb
         Xo/g==
X-Gm-Message-State: AC+VfDyXHs8FbP2UYqoru27sWMZbBc6fFXFF6Zab4U+RN+JnIS5l4PkB
	bYFRZrZmWjnv5xh7lLfbWw38aw==
X-Google-Smtp-Source: ACHHUZ42iEc62iH4hoBzId667tClAxoJ0OHdYYIBvBIVMKi1bhk7AD73MYNJ7aE36NwledCLjmXG2w==
X-Received: by 2002:a17:902:e80b:b0:1a1:f5dd:2dce with SMTP id u11-20020a170902e80b00b001a1f5dd2dcemr3490112plg.6.1684516883784;
        Fri, 19 May 2023 10:21:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 15/18] watchdog/perf: Add a weak function for an arch to detect if perf can use NMIs
Date: Fri, 19 May 2023 10:18:39 -0700
Message-ID: <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
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

On arm64, NMI support needs to be detected at runtime. Add a weak
function to the perf hardlockup detector so that an architecture can
implement it to detect whether NMIs are available.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
While I won't object to this patch landing, I consider it part of the
arm64 perf hardlockup effort. I would be OK with the earlier patches
in the series landing and then not landing ${SUBJECT} patch nor
anything else later.

I'll also note that, as an alternative to this, it would be nice if we
could figure out how to make perf_event_create_kernel_counter() fail
on arm64 if NMIs aren't available. Maybe we could add a "must_use_nmi"
element to "struct perf_event_attr"?

(no changes since v4)

Changes in v4:
- ("Add a weak function for an arch to detect ...") new for v4.

 include/linux/nmi.h    |  1 +
 kernel/watchdog_perf.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 47db14e7da52..eb616fc07c85 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -210,6 +210,7 @@ static inline bool trigger_single_cpu_backtrace(int cpu)
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
 u64 hw_nmi_get_sample_period(int watchdog_thresh);
+bool arch_perf_nmi_is_available(void);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 349fcd4d2abc..8ea00c4a24b2 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -234,12 +234,22 @@ void __init hardlockup_detector_perf_restart(void)
 	}
 }
 
+bool __weak __init arch_perf_nmi_is_available(void)
+{
+	return true;
+}
+
 /**
  * watchdog_hardlockup_probe - Probe whether NMI event is available at all
  */
 int __init watchdog_hardlockup_probe(void)
 {
-	int ret = hardlockup_detector_event_create();
+	int ret;
+
+	if (!arch_perf_nmi_is_available())
+		return -ENODEV;
+
+	ret = hardlockup_detector_event_create();
 
 	if (ret) {
 		pr_info("Perf NMI watchdog permanently disabled\n");
-- 
2.40.1.698.g37aff9b760-goog

