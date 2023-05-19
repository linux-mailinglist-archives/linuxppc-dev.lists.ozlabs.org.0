Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0D709DED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDFL3ShCz3fGs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:23:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F0UdKqH+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F0UdKqH+;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDBh3QKfz3fBj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:20:44 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3252178a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516842; x=1687108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=;
        b=F0UdKqH+AjU+/c5u/w0OpSe1apBaDBocMcnx/dT+OQZGwKzm4Yh/f+L4AQY/pQxCaa
         b+2PUGSmX7OvnUkRsGY3c3qq61HcX6prh0T2an3zd+tZObtm8iEG4jSEsuXIyWo6kI/0
         FGrouN3ev1v5DhmMiK3SUkA3/1lt8QFGvZam4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516842; x=1687108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=;
        b=R0yTlCXTLE8zHYyzrxwgJ6mhhhEGem11GefZ9JKdLRc7f8HzkZDCHOuKV9n64o5G3D
         jJjmnrS8BVHDi0wculGd+v+eyJV0046O/WwiZ/ZSqnsXY5LtdPnETk4kEDl1Btk1xSKU
         A+Ti5bUUPeqXp88txUixxNOqJKPTzfRvUUvbMN96qdW55a98yMJMrP7VgyN7DpxaS05A
         KY2KP6Xrm6jS8JK+5JW6W94xhS2xQx+kvMw4xy8CRkKLDJSm5gV5UMCqV9JIN8GstbsW
         OrBtYWZHRtakOExB1t4zEQA5x/UtGTGRAW+Qp46INQF1iNVQ4wfivSuGsa3IY8ZpbTAc
         XVzA==
X-Gm-Message-State: AC+VfDxMpn6j20zrni4P8ao8JFkzibdliYQsBmDBqKZNsyF2UMEGp/V1
	5+Vq9zbeavWRHlTWBY6u9LUmWQ==
X-Google-Smtp-Source: ACHHUZ56xIwu+OAsmj4ap7FEJYDEFDc65SEAcDRmxfPUsg25AN6kC4stY0LeDhYT4ZvsYWBDy+bC2g==
X-Received: by 2002:a17:90b:1e49:b0:250:9aee:563c with SMTP id pi9-20020a17090b1e4900b002509aee563cmr2506737pjb.41.1684516842239;
        Fri, 19 May 2023 10:20:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:20:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 02/18] watchdog/perf: More properly prevent false positives with turbo modes
Date: Fri, 19 May 2023 10:18:26 -0700
Message-ID: <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
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

Currently, in the watchdog_overflow_callback() we first check to see
if the watchdog had been touched and _then_ we handle the workaround
for turbo mode. This order should be reversed.

Specifically, "touching" the hardlockup detector's watchdog should
avoid lockups being detected for one period that should be roughly the
same regardless of whether we're running turbo or not. That means that
we should do the extra accounting for turbo _before_ we look at (and
clear) the global indicating that we've been touched.

NOTE: this fix is made based on code inspection. I am not aware of any
reports where the old code would have generated false positives. That
being said, this order seems more correct and also makes it easier
down the line to share code with the "buddy" hardlockup detector.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- ("More properly prevent false ...") promoted to its own patch for v5.

 kernel/watchdog_hld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..1e8a49dc956e 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -114,14 +114,14 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	/* Ensure the watchdog never gets throttled */
 	event->hw.interrupts = 0;
 
+	if (!watchdog_check_timestamp())
+		return;
+
 	if (__this_cpu_read(watchdog_nmi_touch) == true) {
 		__this_cpu_write(watchdog_nmi_touch, false);
 		return;
 	}
 
-	if (!watchdog_check_timestamp())
-		return;
-
 	/* check for a hardlockup
 	 * This is done by making sure our timer interrupt
 	 * is incrementing.  The timer interrupt should have
-- 
2.40.1.698.g37aff9b760-goog

