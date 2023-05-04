Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9306F78F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7Z43d1Qz3fbR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:21:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XghDg2TC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XghDg2TC;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7RD5gwrz3f70
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:15:04 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6434e263962so899293b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238502; x=1685830502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=;
        b=XghDg2TCZRLfsm0pg3t2dOS6WXD92qSyP75Giq2LPAc1TQRJUwjVc8WoFsZ9i61+Ls
         9jn+XNY0ZrUzTAUtZQy4my/7m5YjKtfMgdMdyny/AVYcTRzUKLJ/imSY9n4niC8CurRW
         pYuxkyCnGQpDj6HG+89zoS5hVZV9cKllwuSmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238502; x=1685830502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=;
        b=QRzPEbQHSRUmcaP5u4f3Vx++5kqFbopn5k7tEabasQYpGqOzQcaAOgw+/FjyYNnNQf
         SjsOODAYux71RbMxoFKV21VgVERNkcfADa4kpjEBcJBj1pldZz1UAI7ZS5hDVx45OSxY
         y4n2WxojpfAdWdLyEzO2ZqKXCnSusCePn6WNoU08hnmokK4xNxu2+HtQGxkQcSolGpG2
         sDJydwBa4cTqjGgLQ5y5Los1r24ZhYMeUKRrlQTqgiCLSP86q1FmeKeNjOxV16pjGd9v
         Vy8WyuW2p/aK99ZDk6/FITP0e0zQlhjUwt640QRAWcSnn4w7p3krFL6H5snaTBItRAwi
         HKpQ==
X-Gm-Message-State: AC+VfDzwH3mDzq8FOk1UcZ4Qk1f6tDreq98+Zh+QtEDExRX4CJ7g+e7g
	fH3BYMTtG3uAq2ZdTc6J/BuwQw==
X-Google-Smtp-Source: ACHHUZ4OEU35K3+sSCEyiMl0QxsV/WrmtTjX4ONPjO2qeVS0NTr5bhnPpyCKmHdt3oXalTjYAknA7Q==
X-Received: by 2002:a05:6a00:1881:b0:63b:8afe:a4dc with SMTP id x1-20020a056a00188100b0063b8afea4dcmr5365992pfh.30.1683238502557;
        Thu, 04 May 2023 15:15:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:15:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 06/17] watchdog/perf: Rename watchdog_hld.c to watchdog_perf.c
Date: Thu,  4 May 2023 15:13:38 -0700
Message-ID: <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
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

The code currently in "watchdog_hld.c" is for detecting hardlockups
using perf, as evidenced by the line in the Makefile that only
compiles this file if CONFIG_HARDLOCKUP_DETECTOR_PERF is
defined. Rename the file to prepare for the buddy hardlockup detector,
which doesn't use perf.

It could be argued that the new name makes it less obvious that this
is a hardlockup detector. While true, it's not hard to remember that
the "perf" detector is always a hardlockup detector and it's nice not
to have names that are too convoluted.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.

 kernel/Makefile                            | 2 +-
 kernel/{watchdog_hld.c => watchdog_perf.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename kernel/{watchdog_hld.c => watchdog_perf.c} (99%)

diff --git a/kernel/Makefile b/kernel/Makefile
index 10ef068f598d..406ccccc4dd3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -91,7 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_hld.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
 obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_perf.c
similarity index 99%
rename from kernel/watchdog_hld.c
rename to kernel/watchdog_perf.c
index 96b717205952..c3d8ceb149da 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_perf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Detect hard lockups on a system
+ * Detect hard lockups on a system using perf
  *
  * started by Don Zickus, Copyright (C) 2010 Red Hat, Inc.
  *
-- 
2.40.1.521.gf1e218fcd8-goog

