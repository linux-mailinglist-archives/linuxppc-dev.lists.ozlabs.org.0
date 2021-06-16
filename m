Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE803A92E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4bDb5tk3z3cDc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j5nEWtGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j5nEWtGQ; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4bD63V3zz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:40:35 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3106818pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ZiC6GECxJ5O7fmXBJLA01PVcumFVYCjotTKUnEvqAE=;
 b=j5nEWtGQ8e7L2j8MAdL8VNhwZHW7YbvwGKNbYTpaT4fT5y/uCH8RZAswlRUWfPHxv0
 PIhxhtmJkqTRIi1h6Y6H0yudszNUn9E1DN5YYqMBKkvVvvplj1qaEAhfpmXjEjatQ0vO
 rxcP980VoLdUqrzXUTTq879c0wb8Gq4fREWaBy9oA4H0KQWfYJUGdZqoDGmSk8WQqm4y
 gTOtbVlf5Elmy4z9Jah+NVKCUlCoZdJYhdtYnfhVAN2wrrerSR3Z7ywz56ta7BYlXi+5
 Q3BaY1HbaaTR3kt7lax0f+TxATdLDTONssXYcKshT+gNyvwFt8T+tOoIfSzcU1/GpDz5
 lreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ZiC6GECxJ5O7fmXBJLA01PVcumFVYCjotTKUnEvqAE=;
 b=j8RpQN31th74GH5F8RNICK48ZfjeWkIPVjIqcRh/r02tzOJzTkIlsy7VpSVOPiknDc
 KSs4V3SoOaBua6btv5nxJja6jMykYbQ+TPi/qg5evfssb4u3znrHsOUHUmk1Vw14Q2D8
 U7r0pd5qs5FtAvFdstBdkYZiJNe6O6eCyZM4HcQrhP94ULIPHtWF/jZ/OuPQMS0U5gij
 P6UCiZ8WPwzIi5hAfqEy6zCLEP4/QCYoOI1i6ZE25aAfWy85QCHKxuAja9WgqOvuZsi2
 1iiIipkg+5KtTTKjG/reVDQXPfEb4O1yElOSHc5ngROUgNiyoAJ/bPIKkrWFRAziam5A
 K62A==
X-Gm-Message-State: AOAM532sQj3L2zHwsb4PMMGzajHWbEhMyguWu/eO87XqSOYpOZ6Hyy8v
 kY/SmDG34BTJJDahipehb7nzUg==
X-Google-Smtp-Source: ABdhPJxSyXLm1xOpMzrHEu55XT9R4v/JDtdpRRrJ7Z/jTDgNjDYRhgh55veskbKqtBCBtzm4Hx/9kw==
X-Received: by 2002:a17:90b:247:: with SMTP id
 fz7mr9072074pjb.137.1623825633079; 
 Tue, 15 Jun 2021 23:40:33 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id x36sm1069608pfu.39.2021.06.15.23.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 23:40:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Len Brown <lenb@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 0/3] cpufreq: Migrate away from ->stop_cpu() callback
Date: Wed, 16 Jun 2021 12:10:25 +0530
Message-Id: <cover.1623825358.git.viresh.kumar@linaro.org>
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
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rafael,

Sending these separately from CPPC stuff to avoid unnecessary confusion and
independent merging of these patches. These should get in nevertheless.

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

Migrate to using the exit() callback instead of stop_cpu().

The stop_cpu() callback isn't removed from core as it will be reused in
a different way in a separate patchset.

--
Viresh

Viresh Kumar (3):
  cpufreq: cppc: Migrate to ->exit() callback instead of ->stop_cpu()
  cpufreq: intel_pstate: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: powerenv: Migrate to ->exit() callback instead of
    ->stop_cpu()

 drivers/cpufreq/cppc_cpufreq.c    | 46 ++++++++++++++++---------------
 drivers/cpufreq/intel_pstate.c    |  9 +-----
 drivers/cpufreq/powernv-cpufreq.c | 23 ++++++----------
 3 files changed, 34 insertions(+), 44 deletions(-)

-- 
2.31.1.272.g89b43f80a514

