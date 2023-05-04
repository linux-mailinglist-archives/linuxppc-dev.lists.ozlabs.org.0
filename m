Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F96F78EF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7XB67HFz3fWn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NQpIfbqE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NQpIfbqE;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7R62mR8z3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:14:58 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b5465fc13so895805b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238496; x=1685830496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=;
        b=NQpIfbqEUQKnsAkyEYKExasyztEP9wJ8o+4IEiw9BxrvOoB0l00+ORgkpCBLFkfl+F
         PivQOONxkj4PAVC2WcZaYn5EMh53GyKpOpu34BApx4vjHnolGOvX4v2oyvAKoW8Y73KU
         w1j4yU/Hk37qgrXBksSm+ZQ5W6g5IzmgjL538=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238496; x=1685830496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=;
        b=mEPoOUjlfbEj1Vg7OQSSS1SGL8vH4Bhz2vwwTwPsRBaPjQcmQJsoFHhF4HPZuu/LdI
         I9w6bDc4woJXFMrBlehOKXmZrYxv+RjIkVZiAWJrQeL8TAsMpues56i1nftH8xoQMEmW
         nd+bQ8bmnc9VYnU3snygyJ7QHsSY5cz2me6dQeRLF/YKzHCzMRfvee8g0qbQsFPTTZgS
         AAVazFzf3DDDU3C+lMSwRDc3UTzJokA89KohP0H7SwbT/0B8Vnvs/1k8uMOfYLTH1YNq
         AFSgLnXH3aDUwiRCzgsX8EWvcecuJTtc5DV+gH4gTnBKHfo39SRNT7a0wrWTCh36ilUM
         1sQg==
X-Gm-Message-State: AC+VfDwrt9Gy1wCWYcGa4/tVdl6QjgzjxIUtu1ACHPe27GS3A40BbXNu
	ovalFRUGlS9POnXBNsSP5QZOPQ==
X-Google-Smtp-Source: ACHHUZ6RrkuuKPBgTlGYVBYmU7JHppwAnr7B5nmjdOCKHM4QBI81WKafubaC+FF4dnrAufHF9KP6jQ==
X-Received: by 2002:a05:6a00:2e06:b0:62d:8376:3712 with SMTP id fc6-20020a056a002e0600b0062d83763712mr4427628pfb.28.1683238496089;
        Thu, 04 May 2023 15:14:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:14:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 04/17] watchdog/perf: Ensure CPU-bound context when creating hardlockup detector event
Date: Thu,  4 May 2023 15:13:36 -0700
Message-ID: <20230504151100.v4.4.I654063e53782b11d53e736a8ad4897ffd207406a@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <kernelfans@gmail.com>

hardlockup_detector_event_create() should create perf_event on the
current CPU. Preemption could not get disabled because
perf_event_create_kernel_counter() allocates memory. Instead,
the CPU locality is achieved by processing the code in a per-CPU
bound kthread.

Add a check to prevent mistakes when calling the code in another
code path.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together. This is a nice cleanup and could land together
with the rest of my series if that makes sense.

I changed the patch prefix to match others in my series.

[1] https://lore.kernel.org/r/20220903093415.15850-4-lecopzer.chen@mediatek.com/

Changes in v4:
- Pulled ("Ensure CPU-bound context when creating ...") into my series for v4.

 kernel/watchdog_hld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..96b717205952 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -165,10 +165,16 @@ static void watchdog_overflow_callback(struct perf_event *event,
 
 static int hardlockup_detector_event_create(void)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu;
 	struct perf_event_attr *wd_attr;
 	struct perf_event *evt;
 
+	/*
+	 * Preemption is not disabled because memory will be allocated.
+	 * Ensure CPU-locality by calling this in per-CPU kthread.
+	 */
+	WARN_ON(!is_percpu_thread());
+	cpu = raw_smp_processor_id();
 	wd_attr = &wd_hw_attr;
 	wd_attr->sample_period = hw_nmi_get_sample_period(watchdog_thresh);
 
-- 
2.40.1.521.gf1e218fcd8-goog

