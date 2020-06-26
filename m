Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D220AAFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 05:53:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tNKV1gSZzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 13:53:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FrOalOYS; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tNHH2nK7zDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 13:51:53 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ev7so3627680pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bN1uZrTrlYe7+hbOLOxin5wT6ZnXt4+ox32w8sL7Hc=;
 b=FrOalOYSHarf0XoChv3NrRBqbQ9p5VWA6f832QKG0SInAh154BXvlKEgwC7obvI2vX
 7kX+40HAcARrqUPtcQWUBdObgGt0OWnCUZyqIIZUJ6DWbTcyfQ/DfPU4U/E1uTJmdREy
 wFbf8x9TOckfDIqN3oUmguJLxibXTcl4NAtqH5l9OslDU4ff/kK7wJkVtbOjda30fKI9
 oG6K7yY8/3KtSfDsa/Vu85lYcBAvZsBxSW75ooXamgKyFsYPsFKhgEU7eKpU7V8WlHsT
 36wgUHu0VhqQccdu9tD396DLlUYUvtfvzYfQgA3NRgxQw1hJ4f2aguN7PLlX42dZrUGG
 ripA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bN1uZrTrlYe7+hbOLOxin5wT6ZnXt4+ox32w8sL7Hc=;
 b=RTVDG5bZIfUzZzeA/TPv5wxE2eCiWg0LVlOYobOLkv9Exlz3kKD/ulk3UFk1o35F4+
 dbfgv389mjuoTiOIcn74vXKNQ1rLHPIFuIioFhGSBFYnU1ihXniTRlEgA9elyuHvEoFW
 N5OX3pF6iS9r5XZS9NQ8l6f/wfPgwU1JgikzvmUJLei3bKG9Y4OadIMlX0gerSFG5XTr
 ncjwwptsHNAABvGsAUUv9YR2wROr0MQQKYONBpSB5JUapw1Ng1xgMPUJrCM4j5J5olTo
 FfLV8KJ+IDfbHrISVa6AL/B8B4PTKcWZBtR/ehjVfrkZI9a6oWyfXD7spfLf7hX0MWwc
 qX6w==
X-Gm-Message-State: AOAM531nWNxXApSUStuYDV5LoWg1aObg4InGZ/pn/EwaZHD2+4vBH5o5
 FkxdypB22XMv6tRUMRX5z0us6g==
X-Google-Smtp-Source: ABdhPJxMTAmTM5qxQmboEyQh780zfG4EvDvMqOf9pXytg/TYG0YYGsrLP0EM+wrQTSlA3WSMtfjUnQ==
X-Received: by 2002:a17:902:b78a:: with SMTP id
 e10mr985267pls.194.1593143509854; 
 Thu, 25 Jun 2020 20:51:49 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id iq19sm9466929pjb.48.2020.06.25.20.51.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 20:51:49 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>,
 Ben Segall <bsegall@google.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 0/3] cpufreq: Allow default governor on cmdline and fix
 locking issues
Date: Fri, 26 Jun 2020 09:21:41 +0530
Message-Id: <cover.1593143118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
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
Cc: linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 adharmap@codeaurora.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>,
 kernel-team@android.com, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I have picked Quentin's series over my patch, modified both and tested.

V2->V3:
- default_governor is a string now and we don't set it on governor
  registration or unregistration anymore.
- Fixed locking issues in cpufreq_init_policy().

--
Viresh

Original cover letter fro Quentin:

This series enables users of prebuilt kernels (e.g. distro kernels) to
specify their CPUfreq governor of choice using the kernel command line,
instead of having to wait for the system to fully boot to userspace to
switch using the sysfs interface. This is helpful for 2 reasons:
  1. users get to choose the governor that runs during the actual boot;
  2. it simplifies the userspace boot procedure a bit (one less thing to
     worry about).

To enable this, the first patch moves all governor init calls to
core_initcall, to make sure they are registered by the time the drivers
probe. This should be relatively low impact as registering a governor
is a simple procedure (it gets added to a llist), and all governors
already load at core_initcall anyway when they're set as the default
in Kconfig. This also allows to clean-up the governors' init/exit code,
and reduces boilerplate.

The second patch introduces the new command line parameter, inspired by
its cpuidle counterpart. More details can be found in the respective
patch headers.

Changes in v2:
 - added Viresh's ack to patch 01
 - moved the assignment of 'default_governor' in patch 02 to the governor
   registration path instead of the driver registration (Viresh)

Quentin Perret (2):
  cpufreq: Register governors at core_initcall
  cpufreq: Specify default governor on command line

Viresh Kumar (1):
  cpufreq: Fix locking issues with governors

 .../admin-guide/kernel-parameters.txt         |  5 +
 Documentation/admin-guide/pm/cpufreq.rst      |  6 +-
 .../platforms/cell/cpufreq_spudemand.c        | 26 +-----
 drivers/cpufreq/cpufreq.c                     | 93 ++++++++++++-------
 drivers/cpufreq/cpufreq_conservative.c        | 22 +----
 drivers/cpufreq/cpufreq_ondemand.c            | 24 ++---
 drivers/cpufreq/cpufreq_performance.c         | 14 +--
 drivers/cpufreq/cpufreq_powersave.c           | 18 +---
 drivers/cpufreq/cpufreq_userspace.c           | 18 +---
 include/linux/cpufreq.h                       | 14 +++
 kernel/sched/cpufreq_schedutil.c              |  6 +-
 11 files changed, 106 insertions(+), 140 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

