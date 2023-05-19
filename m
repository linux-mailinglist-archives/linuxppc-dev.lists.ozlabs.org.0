Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D3709DD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDCW5CW0z3fJG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:21:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cYOAMW20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cYOAMW20;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDBd61xmz3fBp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:20:41 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2538183fb87so837780a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516839; x=1687108839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=;
        b=cYOAMW20yqCRPJAKXfPRAxxzdvsUVRoPpDVId2KBi/Ya8K8Kzoy918R2VyfOmmQpLH
         xI8S564KyK4m2N6iZQ7O4LLhfVTYWT/aktRMPSq7TkIBY5JsyjBlMimDAhUrZaP8Upp7
         paWPEeT7J9fW6zw1WbJPkrytYOeDwTF4USR20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516839; x=1687108839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=;
        b=iwyA6Fv6XDfFy3nYQF2C/Py/tmAq/RTRbymtJfIpX1/WAnT2rv/VQbTYA1g5/Pa0M0
         4EJeoxJY8L0yLiuKCaOI/89H+duRNptGzF0Eb7tWNu1RP09+VfcB4me+1lLdnKMq1FMQ
         YGqaiFshfp2m7BBR+l3bKbqKxVr2xVRngZeV8RzSzWI0AciG4F6FP6PliOuZRB6HQDjR
         4xydUaMm1Ctz8Hqq6S2AfWlfIZd5MpK5crrQwUyJlDFOjVTLnFQS0hwcFr/zm3BpSLCA
         LqOFgGhFocaiX4R5D/DlKCEnw3LcxWHAJzYqqgtjtbaMCYvFTE6vl/G2UVivkBb2wci9
         BOCg==
X-Gm-Message-State: AC+VfDwxXln4BH9+i+A1I1B+oP7WoJESVulIEZNpjrIlJSiwX3AaVD9r
	7xO+h1/zu5tXXTsCTdrPyKBzLQ==
X-Google-Smtp-Source: ACHHUZ4VewjZvf6tgnnmMrLmNUmoTIX2MqjaMcwoqjHE7Ok2xZz+MKgk8d92NT7mvLQB9l1ZhiFZDg==
X-Received: by 2002:a17:90b:4b46:b0:253:6713:c7c2 with SMTP id mi6-20020a17090b4b4600b002536713c7c2mr2717286pjb.43.1684516839149;
        Fri, 19 May 2023 10:20:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:20:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 01/18] watchdog/perf: Define dummy watchdog_update_hrtimer_threshold() on correct config
Date: Fri, 19 May 2023 10:18:25 -0700
Message-ID: <20230519101840.v5.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
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

The real watchdog_update_hrtimer_threshold() is defined in
kernel/watchdog_hld.c. That file is included if
CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.

The dummy version of the function in "nmi.h" didn't get that quite
right. While this doesn't appear to be a huge deal, it's nice to make
it consistent.

It doesn't break builds because CHECK_TIMESTAMP is only defined by
x86 so others don't get a double definition, and x86 uses perf lockup
detector, so it gets the out of line version.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Add Nicholas's explanation of why this didn't break builds.
- watchdog_hardlockup_perf.c => kernel/watchdog_hld.c in description.

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
2.40.1.698.g37aff9b760-goog

