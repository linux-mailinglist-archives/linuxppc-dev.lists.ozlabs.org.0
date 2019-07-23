Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FE7256F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:39:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th0Q6qCbzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:39:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="GLW0xIF/"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t7V92KL1zDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 16:14:23 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so18867594pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vuhDAdrwQAvGhhF1l4sTnH2/cYgn8v3uFIkNwLOWcSI=;
 b=GLW0xIF/ikmhDxxaWkwedXQ3YAtiEnzbtfMJ9HikV4tL95rqEh2fkcB6NkefS0TByU
 +QQ1hhPN/eokT2aVxg0eTyR+90qMUvCEVt61eF45mxKmxYTxyaL9RYps9BAZTMO/3cDb
 9C4NZ3uhWr2iKuhcCIrARd0ii+fMDfM0DIeWksAUC6ORyiERFbDn1C2vq8S/hkwYbIHB
 g/xyhH2PR0cFm9DdI53v5Y67tYeflXFdxVK6L0Q8ZnqYVmdDUpOGII7k1z1MNqs5JNRA
 OPWC2yrAd7K4gFy5nbRUzC6OGpMxbNPocvSPv+RbcxEN1BWEsoCoEgPiI4t0kVS5DIyX
 10dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vuhDAdrwQAvGhhF1l4sTnH2/cYgn8v3uFIkNwLOWcSI=;
 b=N0CJrC6KF7tz6+qyBCcd8+OsyB6YCO7zQFcovMaoxG+IEOusVVuVy1Z6EZy0okRXCD
 5u94dyc09Pe7D2A+ET1+o+0+ihHT0/p0qdXkyxKmqW+F80dGe2Hg7gs1qT5vmgUK1+DP
 H5RvGcuZoo7tni04MBJ02oXEU0hQx5t8U0i6CHzyTk6CGqz+fJE+8waqkn40vaDZ1skA
 p3Hrr3/2U3F+wJQ4v42Hp5fTNmcp4vPFK/PHKNxbfkhKG1O6qNnlQA3RSjkh2369vF3q
 nBxsPHYSlIu7RZba/Kp9sv+frog4kFlPeNQYdnRZOPAaeQY22haETKlFidLyad6S9/Mq
 gGsg==
X-Gm-Message-State: APjAAAWGNCXtjEr7mRuqosBgdAyRrJYHPd0oyTIfsyj/OX6BboXxa+3Z
 0j75GUYHsOLmFGFlHQ1ciYDcyg==
X-Google-Smtp-Source: APXvYqxP6bnPVRQ1MCBwzGR7VTcX3M/ry8bfvkqazsDReUg7h0RInIBa5NIHj45OVf4NXWgl6klj/w==
X-Received: by 2002:a63:c106:: with SMTP id w6mr75584400pgf.422.1563862461180; 
 Mon, 22 Jul 2019 23:14:21 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id o95sm36186558pjb.4.2019.07.22.23.14.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 23:14:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 Erik Schmauss <erik.schmauss@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javi Merino <javi.merino@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
Date: Tue, 23 Jul 2019 11:44:00 +0530
Message-Id: <cover.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devel@acpica.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Now that cpufreq core supports taking QoS requests for min/max cpu
frequencies, lets migrate rest of the users to using them instead of the
policy notifiers.

The CPUFREQ_NOTIFY and CPUFREQ_ADJUST events of the policy notifiers are
removed as a result, but we have to add CPUFREQ_CREATE_POLICY and
CPUFREQ_REMOVE_POLICY events to it for the acpi stuff specifically,
though they are also used by arch_topology stuff now. So the policy
notifiers aren't completely removed.

Boot tested on my x86 PC and ARM hikey board.

This has already gone through build bot for a few days now.

V1->V2:
- Added Acked-by tags
- Reordered to keep cleanups at the bottom
- Rebased over 5.3-rc1

--
viresh

Viresh Kumar (10):
  cpufreq: Add policy create/remove notifiers
  thermal: cpu_cooling: Switch to QoS requests instead of cpufreq
    notifier
  powerpc: macintosh: Switch to QoS requests instead of cpufreq notifier
  cpufreq: powerpc_cbe: Switch to QoS requests instead of cpufreq
    notifier
  ACPI: cpufreq: Switch to QoS requests instead of cpufreq notifier
  arch_topology: Use CPUFREQ_CREATE_POLICY instead of CPUFREQ_NOTIFY
  video: sa1100fb: Remove cpufreq policy notifier
  video: pxafb: Remove cpufreq policy notifier
  cpufreq: Remove CPUFREQ_ADJUST and CPUFREQ_NOTIFY policy notifier
    events
  Documentation: cpufreq: Update policy notifier documentation

 Documentation/cpu-freq/core.txt            |  16 +--
 drivers/acpi/processor_driver.c            |  44 ++++++++-
 drivers/acpi/processor_perflib.c           | 106 +++++++++-----------
 drivers/acpi/processor_thermal.c           |  81 ++++++++-------
 drivers/base/arch_topology.c               |   2 +-
 drivers/cpufreq/cpufreq.c                  |  51 ++++------
 drivers/cpufreq/ppc_cbe_cpufreq.c          |  19 +++-
 drivers/cpufreq/ppc_cbe_cpufreq.h          |   8 ++
 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c      |  96 +++++++++++-------
 drivers/macintosh/windfarm_cpufreq_clamp.c |  77 ++++++++++-----
 drivers/thermal/cpu_cooling.c              | 110 +++++----------------
 drivers/video/fbdev/pxafb.c                |  21 ----
 drivers/video/fbdev/pxafb.h                |   1 -
 drivers/video/fbdev/sa1100fb.c             |  27 -----
 drivers/video/fbdev/sa1100fb.h             |   1 -
 include/acpi/processor.h                   |  22 +++--
 include/linux/cpufreq.h                    |   4 +-
 17 files changed, 327 insertions(+), 359 deletions(-)

-- 
2.21.0.rc0.269.g1a574e7a288b

