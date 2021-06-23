Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B293B12E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 06:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8qtv2Svwz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yk45k7i+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yk45k7i+; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8qtM3BbRz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 14:24:59 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id t32so1318008pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 21:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gou6rZ1fClnIKlq6Cu8N3kM3E3lWreX0Ru3iix00OOg=;
 b=Yk45k7i+nKXIrumvirg4IqL1aBpbj1sB2EW5lDMY7mla0i7rjMxwlcIgPNXjinslmj
 ugsDMLwLFfREcqd7ii8nvlAUoJvREVNKSVh1AdcoWC3XjARJ7QGoL9L7mB7R/EcJPanP
 W9/yIzNUW6VQgSEzPWFHTBxz7MKxgYyL8bbqJpm35IFk8OxSLo9/AHb6xtU5GX9Am81D
 kIBVuANU47QyJrAInAEDdBC+4WkY5GHvqInPMMhyEdXtuuHnVx9LNJ/l4/hiCW3OdFbX
 NUlecpupFDfgH0hEqZTYsNc5I20FzYcLRquq99SDTmzJC5nyajkqAreMfq4JvA0JmfXS
 hIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gou6rZ1fClnIKlq6Cu8N3kM3E3lWreX0Ru3iix00OOg=;
 b=riWWUslu/kwxztXr5NMV5krbEETamU/V3DjiGHb8OBIaBZjSqpVVP3IP4KwTpHR+FX
 pDbbdhUR4ISkEH3dHGZgcYcqn9tk4gQnZkbcPJQVePEXmmkJ+4R+cabQiYjUmD/YHUeo
 1MXkYpmLIsM5e8c/fp8z2BTJZGpLYd9OLMuNqgtq4+KBj/ciS0LE7piJwGWT9krv4Wwz
 Vr0YjtzDLiEdy+8A4MLhnIw+EcHwSGxx082Q+P9RQ/OiBbprty2+CWxHlNVT43eZT/bc
 EWcA08phToadIkilu6+qWNJfnZavaSVYgShB3H6HrpPh1vMG4qQUTgckiGFRDq1vl+b5
 pZSQ==
X-Gm-Message-State: AOAM5303luDiqmv/jcSF4dYWXmyVQ0NvzdRjut788adTGvWSxcazk/SV
 tEtBBaFf9yA2fUfBJsOEe4B3TQ==
X-Google-Smtp-Source: ABdhPJyy710LA90MinM5iDdivfKD7aD592/AhCFzZHQnDhskdAN8PTcQO74w1Zq6FFRznhQXkhmmsA==
X-Received: by 2002:aa7:8d86:0:b029:2ec:82d2:5805 with SMTP id
 i6-20020aa78d860000b02902ec82d25805mr54120pfr.11.1624422295255; 
 Tue, 22 Jun 2021 21:24:55 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id u21sm779531pfh.163.2021.06.22.21.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 21:24:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Alex Shi <alexs@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V4 0/4] cpufreq: Migrate away from ->stop_cpu() callback
Date: Wed, 23 Jun 2021 09:54:38 +0530
Message-Id: <cover.1624421816.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-doc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dirk Brandewie <dirk.brandewie@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rafael,

These are based on your patch [1] now.

commit 367dc4aa932b ("cpufreq: Add stop CPU callback to cpufreq_driver
interface") added the stop_cpu() callback to allow the drivers to do
clean up before the CPU is completely down and its state can't be
modified.

At that time the CPU hotplug framework used to call the cpufreq core's
registered notifier for different events like CPU_DOWN_PREPARE and
CPU_POST_DEAD. The stop_cpu() callback was called during the
CPU_DOWN_PREPARE event.

This is no longer the case, cpuhp_cpufreq_offline() is called only once
by the CPU hotplug core now and we don't really need two separate
callbacks for cpufreq drivers, i.e. stop_cpu() and exit(), as everything
can be done from the exit() callback itself.

Migrate to using the offline() or exit() callback instead of stop_cpu().

V3->V4:
- Based on a cleanup patch [1] from Rafael, apart from 5.13-rc7.
- No need to update exit() for intel pstate anymore.
- Remove the stop_cpu() callback completely.

--
Viresh

[1] https://lore.kernel.org/linux-pm/5490292.DvuYhMxLoT@kreacher/

Viresh Kumar (4):
  cpufreq: cppc: Migrate to ->exit() callback instead of ->stop_cpu()
  cpufreq: intel_pstate: Migrate to ->offline() instead of ->stop_cpu()
  cpufreq: powerenv: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: Remove stop_cpu() callback

 Documentation/cpu-freq/cpu-drivers.rst        |  3 --
 .../zh_CN/cpu-freq/cpu-drivers.rst            |  3 --
 drivers/cpufreq/cppc_cpufreq.c                | 46 ++++++++++---------
 drivers/cpufreq/cpufreq.c                     |  3 --
 drivers/cpufreq/intel_pstate.c                | 10 +---
 drivers/cpufreq/powernv-cpufreq.c             | 23 ++++------
 include/linux/cpufreq.h                       |  1 -
 7 files changed, 35 insertions(+), 54 deletions(-)

-- 
2.31.1.272.g89b43f80a514

