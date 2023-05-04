Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E36F78E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7TD4hsTz3fKG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:16:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nIjoIkW3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nIjoIkW3;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7Qy0yRrz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:14:49 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-51f597c975fso936896a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238486; x=1685830486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=;
        b=nIjoIkW3p03FUu+3GxCcNYkSzcj/lDeOENMDPI4fWfUDdG7bT08Sb+dJlzfLePSU5E
         mVGDvKwII6sScPmLx8Iom+7xMBMbGZTte6pLYZwgEDCl0uBaz3UERsDasZ//5a7Rt8ID
         KeoANLYDUm1QrguA2OgwX0v7dqA356HU4O/WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238486; x=1685830486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=;
        b=CGyJAhorPtioAIJ2Nzcgc+IOUtS+cmeXAMA797sKLi/WX0PQyV8Ihm51TWNOI/Ryjv
         Ge6oM+xJNKKV2L9UWuhreJ+0Y4yl27oSlCrJqRoyaVMlbm0RlalwlpPGWzLnMxNLf66d
         /NbKS96IMAAFpQ7olxMfnD5gKazUncfykxDJKDfmtnR/ihNpqI6EGF/HOQsKQuPjqgWX
         bFZe+VAExy1E2ijl66pCbzdq7HwTQ/ZsH+wpfCbmSIfNenCO6HdPovgXP8f66A+rnABd
         woLO+gPrjaO3H8aAv+X9ADubFnWXQBdCNEpOvySsvkTEX1XNSQOT46/s8+Ira4gOn3Y5
         YCSw==
X-Gm-Message-State: AC+VfDyeHP5jQcUkbq810wdO+L3sSrjbheObQwllliAPEwAusqNwf4Lr
	Dw5TrZHHizJGE0ydWLMiHipraQ==
X-Google-Smtp-Source: ACHHUZ6srX3RLh0nySv1vg2bjN5I3jzdANZ2xcZbCkodBOlfCv7QBn4Vf3SuhK63bPEngQxlNTdd2A==
X-Received: by 2002:a05:6a20:7f8f:b0:f8:ac26:b899 with SMTP id d15-20020a056a207f8f00b000f8ac26b899mr4830221pzj.0.1683238486722;
        Thu, 04 May 2023 15:14:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:14:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 01/17] watchdog/perf: Define dummy watchdog_update_hrtimer_threshold() on correct config
Date: Thu,  4 May 2023 15:13:33 -0700
Message-ID: <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
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

The real watchdog_update_hrtimer_threshold() is defined in
watchdog_hardlockup_perf.c. That file is included if
CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.

The dummy version of the function in "nmi.h" didn't get that quite
right. While this doesn't appear to be a huge deal, it's nice to make
it consistent.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Define dummy watchdog_update_hrtimer_threshold() ...") new for v4.

 include/linux/nmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 048c0b9aa623..771d77b62bc1 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -197,7 +197,7 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
-    defined(CONFIG_HARDLOCKUP_DETECTOR)
+    defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 void watchdog_update_hrtimer_threshold(u64 period);
 #else
 static inline void watchdog_update_hrtimer_threshold(u64 period) { }
-- 
2.40.1.521.gf1e218fcd8-goog

