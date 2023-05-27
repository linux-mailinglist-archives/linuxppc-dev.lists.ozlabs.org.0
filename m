Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C933D7131B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl31592Cz3fWr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jVupxr9t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jVupxr9t;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0F5mj6z3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:19 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d3491609fso1197289b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151736; x=1687743736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=;
        b=jVupxr9tkpNoY2DPpNO8ve9RV3dt+XdDWaO2WoRtWo7O726zDUiL2HAAxcH6LHl3N4
         zg+XiJ3Z3hMClz9oQWCKKIy9P9nGkLhMbC/8iyvrxOUDtLp+WDuMwpTv3zKUdQXrfkDP
         KJUkxWt47+5T+11hbTnQ8sD/sndKaFgdvy0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151736; x=1687743736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=;
        b=RmGdWeWcbvY4oXnxYDR5asp/y5CVqxQxUbq3JUGGV1nO56YTE2jgeV1j06OZl8V1HQ
         ndANNDyCYxcvAz/F/65TOjNtaRuJ9Eol6TFYoheOPI/b5xM8rVo6vqr5iOyoLsm1zgbd
         K4l737KA1ORQok7syLmbCNtdoo8l8ANG5ABYRz5TAx4rU6oi157F6OWVPh4mO4ixqRr6
         z+KXItQM3lwenyOSSlf7IEs7LHHed+reh9XFT4XfbTwaoHH7kl3zyiolkx86D7kNLXqf
         p1zGW3ypT2Y3xVDcmoY/tiO2bQSorJdfAq0ccgUhqEaGxBqbXfEE2hvWsiRR1TmHBpZj
         owPA==
X-Gm-Message-State: AC+VfDyvlXtqc/GXizUCG6S3PSZkYLmJJnHG6fzoW6dtjlS4MdVg/Zpb
	n2jdNozvotnXshbZuaFc7JGYCw==
X-Google-Smtp-Source: ACHHUZ4GAy/oEImCC0hpOXpTjNUo0Dhy+rQj32IqoVkt1EVytgp7ZHhTjG/XebwId5tT/CXJZBdMDQ==
X-Received: by 2002:a05:6a00:190e:b0:63b:8afe:a4dc with SMTP id y14-20020a056a00190e00b0063b8afea4dcmr5524785pfi.30.1685151736256;
        Fri, 26 May 2023 18:42:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/10] watchdog: Cleanup / fixes after buddy series v5 reviews
Date: Fri, 26 May 2023 18:41:30 -0700
Message-ID: <20230527014153.2793931-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
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


This patch series attempts to finish resolving the feedback received
from Petr Mladek on the v5 series I posted. Andrew has already landed
v5 so I'm posting this as additional patches.

Probably the only thing that wasn't fully as clean as Petr requested
was the Kconfig stuff. I couldn't find a better way to express it
without a more major overhaul. In the very least, I renamed "NON_ARCH"
to "PERF_OR_BUDDY" in the hopes that will make it marginally better.

Nothing in this series is terribly critical and even the bugfixes are
small. However, it does cleanup a few things that were pointed out in
review.


Douglas Anderson (10):
  watchdog/hardlockup: Keep kernel.nmi_watchdog sysctl as 0444 if probe
    fails
  watchdog/hardlockup: HAVE_NMI_WATCHDOG must implement
    watchdog_hardlockup_probe()
  watchdog/hardlockup: Don't use raw_cpu_ptr() in
    watchdog_hardlockup_kick()
  watchdog/hardlockup: In watchdog_hardlockup_check() use cpumask_copy()
  watchdog/hardlockup: remove softlockup comment in touch_nmi_watchdog()
  watchdog/buddy: Cleanup how watchdog_buddy_check_hardlockup() is
    called
  watchdog/buddy: Don't copy the cpumask in watchdog_next_cpu()
  watchdog/buddy: Simplify the dependency for
    HARDLOCKUP_DETECTOR_PREFER_BUDDY
  watchdog/hardlockup: Move SMP barriers from common code to buddy code
  watchdog/hardlockup: Rename HAVE_HARDLOCKUP_DETECTOR_NON_ARCH to
    ..._PERF_OR_BUDDY

 arch/Kconfig            |  3 +-
 arch/sparc/kernel/nmi.c |  5 +++
 include/linux/nmi.h     | 14 ++-------
 kernel/watchdog.c       | 68 ++++++++++++++++++-----------------------
 kernel/watchdog_buddy.c | 28 ++++++++++++++---
 lib/Kconfig.debug       | 14 ++++-----
 6 files changed, 70 insertions(+), 62 deletions(-)

-- 
2.41.0.rc0.172.g3f132b7071-goog

