Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0EA1FA3A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:39:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m5qV3RBlzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:39:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--qperret.bounces.google.com
 (client-ip=2607:f8b0:4864:20::f49; helo=mail-qv1-xf49.google.com;
 envelope-from=3hajnxgckdao0zo11o3qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--qperret.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BBxgUldU; dkim-atps=neutral
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lyCD3HmNzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 02:56:01 +1000 (AEST)
Received: by mail-qv1-xf49.google.com with SMTP id z7so13538622qve.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xbDm2rIeE4s6AcLj4uHfUqAXvLAtlmUfof9kDGDNf38=;
 b=BBxgUldUHKuA2KJSpz9pj8p/Z+mffn8sj+QDHWbHacoBsLGhSYybHKP/D/agragbF8
 t0vIGiE87Z/7/gsMDFaKs+dvf2nU5UQadkPgIrqXr7MdWoeLYPk9WLLqsOku1xmUO5f5
 9e2hb/bCQUmxAQ5RYnNb+YVYW45yO0wopsfEER5dDMtJ6wpvMp1SCS9QYZGQPHhUUGGo
 ZknFtQEhPJw2E5NR/21uHblPdZNsoZSlI0gdYF5tCt1fsubY2Urk4xXEundiYAenL3Ja
 224gYb6WeLgu9ln5gFQ/O9D9XPbkZtUoAJ/Dk90kE9xXRjjXD0uo0TP/bTxzZF2SYvlB
 27Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xbDm2rIeE4s6AcLj4uHfUqAXvLAtlmUfof9kDGDNf38=;
 b=bXa/hHvpODHXpGqXm/vpqapQfOtktxgv/xz3xpCVW8pzeQq3+qefVTgZcUzpNRqImT
 I03vw/2AZjru3mQrpJuiEpP5CI6qFwcI+7Tzh97kxuCskwckDBfIgRItZM40u0JeFDqZ
 a+FgZjMQBAUMV3a2R2MUCN954Q7AnIfVCriwtioIaVWMJxGR0cWhYNqiDicE2YgzHqDA
 fy719TGmVb2pts6Nm5p/B3f9McdlrfWnBjsOEf725ySGVV6E7Z0MmkspjT1af1IPFx1F
 HZu3Jb0MgMz1I5PtFcYdDkv+uPKJp6CZoacElN/hPfNmhrwzE0z6OjO0Nhdo05aJc/sB
 awJA==
X-Gm-Message-State: AOAM531hOnRxDotTuVzm9BfEZzA8lzbXQxi36KgXn24VIyO5Re+tg04m
 wQrUqH/XlkkA6HJzSPJHarYcTlIdmYwD
X-Google-Smtp-Source: ABdhPJyFXynzAao5s3Yi9KETHCllT8sCdWRGLd1bF9N/edNipexLvxfnpuJsltcL7ifNDIp1A6az2cGf2C0f
X-Received: by 2002:a0c:f494:: with SMTP id i20mr25770627qvm.179.1592240157096; 
 Mon, 15 Jun 2020 09:55:57 -0700 (PDT)
Date: Mon, 15 Jun 2020 17:55:52 +0100
Message-Id: <20200615165554.228063-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH 0/2] cpufreq: Specify the default governor on command line
From: Quentin Perret <qperret@google.com>
To: rjw@rjwysocki.net, rafael@kernel.org, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Jun 2020 08:37:34 +1000
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, qperret@google.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Feedback is very much welcome :-)

Thanks,
Quentin

Quentin Perret (2):
  cpufreq: Register governors at core_initcall
  cpufreq: Specify default governor on command line

 .../admin-guide/kernel-parameters.txt         |  5 +++
 Documentation/admin-guide/pm/cpufreq.rst      |  6 ++--
 .../platforms/cell/cpufreq_spudemand.c        | 26 ++------------
 drivers/cpufreq/cpufreq.c                     | 34 ++++++++++++++++---
 drivers/cpufreq/cpufreq_conservative.c        | 22 +++---------
 drivers/cpufreq/cpufreq_ondemand.c            | 24 ++++---------
 drivers/cpufreq/cpufreq_performance.c         | 14 ++------
 drivers/cpufreq/cpufreq_powersave.c           | 18 ++--------
 drivers/cpufreq/cpufreq_userspace.c           | 18 ++--------
 include/linux/cpufreq.h                       | 14 ++++++++
 kernel/sched/cpufreq_schedutil.c              |  6 +---
 11 files changed, 73 insertions(+), 114 deletions(-)

-- 
2.27.0.290.gba653c62da-goog

