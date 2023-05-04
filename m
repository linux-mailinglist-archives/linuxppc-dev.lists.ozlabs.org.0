Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716C6F78E4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:16:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7SJ2pS5z3bh8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:16:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l1rtFKpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l1rtFKpL;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7Qy0Gbvz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:14:47 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115e652eeso15800391b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238484; x=1685830484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vD4bvIvOh45mQL2EmEIxy5cxC2wkD1Nakyo16A6M3Ak=;
        b=l1rtFKpLxtVfUQGlsCKE7wWd2pgn00+Crden2BVpN+Z+uL9l5f8hOkv8ab3zktXz0x
         pAcEkOk3rAUFKaTGqOY5QceR6Y/70XrO1ZfhlQWt4/08gk5s4z81EM0wh45OSfS9u76P
         huCwWSjkqpRg6EDKEdNrNN3LZAvmj8/qzy2Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238484; x=1685830484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vD4bvIvOh45mQL2EmEIxy5cxC2wkD1Nakyo16A6M3Ak=;
        b=aS42VFhPmynMjwvp7/i9ygwJ1YMmSuW62vIKkDuH7nRXlYvQEy4RU8a8WgObjGfnEL
         YQyc/ztkJhV/1P4S+11UlMbGSDhyXrj28fjorFOOAIPNnajqFFKrse3HYEqqvRXxpBRp
         zxxx271NHX1X6NWsAMi/iuV3QOc9EfV9QSQ7nwNZNK6f5GR4Af/yoV1gkWEStebqchhY
         HPeuc/enjdZh+H5xxKiWMoLtTOZdQTYCVTFZz7wCOV9LkIv49Y2e+a59RjWnM+4UWVB7
         6rYpzSP4XZ9/JDSCiq1HUWWy6rFA88myMRYdDys0GdHMpGZNfEP4WNkGFOXN8+YBtS38
         HKBA==
X-Gm-Message-State: AC+VfDxwcdD92XnVvDHtciDdzSJb58H2mI/rt+Vg8R9aOeGh4cO1Cf8U
	/u+i/usrP5e5qICDbWcfe1fZdw==
X-Google-Smtp-Source: ACHHUZ7APdUihveMdpfm3eEVk6bRDMsTJcYFsjX+MPsTlla4z2IzYm9zOOfkxJX9arU9AhobNf/4uQ==
X-Received: by 2002:a05:6a20:1594:b0:f5:68c9:6fa6 with SMTP id h20-20020a056a20159400b000f568c96fa6mr4168059pzj.17.1683238483824;
        Thu, 04 May 2023 15:14:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:14:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 00/17] watchdog/hardlockup: Add the buddy hardlockup detector
Date: Thu,  4 May 2023 15:13:32 -0700
Message-ID: <20230504221349.1535669-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
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

This patch series adds the "buddy" hardlockup detector. In brief, the
buddy hardlockup detector can detect hardlockups without arch-level
support by having CPUs checkup on a "buddy" CPU periodically. All the
details are in the patch ("watchdog/hardlockup: detect hard lockups
using secondary (buddy) CPUs") and I encourage folks to reply to that
patch for general comments about this approach.

Note that in v3, this was a single patch [1]. It's now exploded into a
much larger series. The much larger series does a bunch of cleanup
that Petr requested in response to v3 [2] [3]. This new series ends up
sharing a lot more code with the perf lockup detector. It also tries
to bring a little sanity to some of the naming we had.

The fact that this series now touches across the whole lockup detector
codebase also caused conflicts with the series trying to add a arm64
perf-based hardlockup detector. That was a bit incovenient for me
since I was testing on arm64 and wanted to make sure that the perf
and buddy hardlockup detectors both compiled and worked. Because of
this, I've pulled the latest arm64 perf-based lockup detector patches
into my series. Specifically:
- Patches #1 - #3 of the arm64 perf-based lockup detector patches were
  generic cleanups. I added them early in my series. IMO these should
  just land.
- Patches #4 - #6 of the arm64 perf-based lockup detector patches were
  less generic but still caused conflict with my series. I tacked them
  to the end of my series after adapting them to my changes. However,
  I don't really consider them part of this series and I'd be OK if
  the series landed without them. For use cases I'm aware of the buddy
  system is sufficient and I see no urgent need to land the arm64 perf
  hardlockup support, though I also don't have any strong objections
  to the patches.

I will note that this patch series currently has no conflicts with the
other patch series I posed recently adding support for pseudo-NMI
based backtraces [5] and the two patches series are meant to work
together.

Given the new design of this patch series, testing all combinations is
fairly difficult. I've attempted to make sure that all combinations of
CONFIG_ options are good, but it wouldn't surprise me if I missed
something. I apologize in advance and I'll do my best to fix any
problems that are found.

I'll also note that the CC list is pretty giant. Some of this is based
on get_maintainers and some of this is people I thought might be
interested. Now that this series is touching so many files, I've
stopped auto-CCing everyone that get_maintainers suggests. I'll reply
to v3 and point at this patch to make sure folks are aware of it, but
if I stopped CCing you and you want back on then please yell.

As far as I can tell, there's no true MAINTAINER listed for the
existing watchdog code. Assuming people don't hate this, maybe it
would go through Andrew Morton's tree? There is now some arch-specific
code for sparc and powerpc, but it's all still watchdog code so
hopefully that would still be fine to go through the same tree.

[1] https://lore.kernel.org/r/20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid
[2] https://lore.kernel.org/r/ZFEqynvf5nqkzEvQ@alley
[3] https://lore.kernel.org/r/ZFErmshcrcikrSU1@alley
[4] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/
[5] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.org

Changes in v4:
- ("Add a "cpu" param to watchdog_hardlockup_check()") new for v4.
- ("Add a weak function for an arch to detect ...") new for v4.
- ("Define dummy watchdog_update_hrtimer_threshold() ...") new for v4.
- ("Have the perf hardlockup use __weak ...") new for v4.
- ("Move perf hardlockup checking/panic ...") new for v4.
- ("Move perf hardlockup watchdog petting to watchdog.c") new for v4.
- ("Rename some "NMI watchdog" constants/function ...") new for v4.
- ("Rename touch_nmi_watchdog() to ...") new for v4.
- ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.
- ("Style changes to watchdog_hardlockup_check ...") new for v4.
- Pulled ("Adapt the watchdog_hld interface ...") into my series for v4.
- Pulled ("Enable perf events based hard ...") into my series for v4.
- Pulled ("Ensure CPU-bound context when creating ...") into my series for v4.
- Pulled ("add hw_nmi_get_sample_period for ...") into my series for v4.
- Pulled ("change watchdog_nmi_enable() to void") into my series for v4.
- Pulled ("remove WATCHDOG_DEFAULT") into my series for v4.
- Reworked atop a whole pile of cleanups, as suggested by Petr.

Changes in v3:
- Added a note in commit message about the effect on idle.
- Cleaned up commit message pros/cons to be complete sentences.
- More cpu => CPU (in Kconfig and comments).
- No code changes other than comments.

Changes in v2:
- No code changes.
- Reworked description and Kconfig based on v1 discussion.
- cpu => CPU (in commit message).

Colin Cross (1):
  watchdog/hardlockup: detect hard lockups using secondary (buddy) CPUs

Douglas Anderson (11):
  watchdog/perf: Define dummy watchdog_update_hrtimer_threshold() on
    correct config
  watchdog/hardlockup: Rename touch_nmi_watchdog() to
    touch_hardlockup_watchdog()
  watchdog/perf: Rename watchdog_hld.c to watchdog_perf.c
  watchdog/hardlockup: Move perf hardlockup checking/panic to common
    watchdog.c
  watchdog/hardlockup: Style changes to watchdog_hardlockup_check() /
    ..._is_lockedup()
  watchdog/hardlockup: Add a "cpu" param to watchdog_hardlockup_check()
  watchdog/hardlockup: Move perf hardlockup watchdog petting to
    watchdog.c
  watchdog/hardlockup: Rename some "NMI watchdog" constants/function
  watchdog/hardlockup: Have the perf hardlockup use __weak functions
    more cleanly
  watchdog/perf: Add a weak function for an arch to detect if perf can
    use NMIs
  arm64: Enable perf events based hard lockup detector

Lecopzer Chen (4):
  watchdog: remove WATCHDOG_DEFAULT
  watchdog/hardlockup: change watchdog_nmi_enable() to void
  watchdog/perf: Adapt the watchdog_perf interface for async model
  arm64: add hw_nmi_get_sample_period for preparation of lockup detector

Pingfan Liu (1):
  watchdog/perf: Ensure CPU-bound context when creating hardlockup
    detector event

 arch/arm64/Kconfig                         |   2 +
 arch/arm64/kernel/Makefile                 |   1 +
 arch/arm64/kernel/perf_event.c             |  12 +-
 arch/arm64/kernel/watchdog_hld.c           |  36 +++
 arch/powerpc/include/asm/nmi.h             |   4 +-
 arch/powerpc/kernel/watchdog.c             |  12 +-
 arch/powerpc/platforms/pseries/mobility.c  |   4 +-
 arch/sparc/kernel/nmi.c                    |  10 +-
 drivers/perf/arm_pmu.c                     |   5 +
 include/linux/nmi.h                        |  73 +++--
 include/linux/perf/arm_pmu.h               |   2 +
 kernel/Makefile                            |   3 +-
 kernel/watchdog.c                          | 293 ++++++++++++++++-----
 kernel/watchdog_buddy.c                    |  93 +++++++
 kernel/{watchdog_hld.c => watchdog_perf.c} | 105 +++-----
 lib/Kconfig.debug                          |  52 +++-
 16 files changed, 527 insertions(+), 180 deletions(-)
 create mode 100644 arch/arm64/kernel/watchdog_hld.c
 create mode 100644 kernel/watchdog_buddy.c
 rename kernel/{watchdog_hld.c => watchdog_perf.c} (72%)

-- 
2.40.1.521.gf1e218fcd8-goog

