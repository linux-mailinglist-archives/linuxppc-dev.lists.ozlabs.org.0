Return-Path: <linuxppc-dev+bounces-5541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1578A1B211
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 09:58:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfWv01kSrz30NP;
	Fri, 24 Jan 2025 19:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737709116;
	cv=none; b=NNwHJAFVGf5crpupSoMkM4ntmlxIz2TAfcoHEUupi7m9UNoP7vz5nmAPKwiJaB70nXx36JSQO0FOKWpqz1Vh3b20Rl2lTAWxubbPNgehE1R6w+gAynhF7BQeR4fNcr7n5f2fxDgIsvcB+8BWYW56yTR791zm2aMlzJC79mQRnqLMYd/jeZAfWim4jJhdEKOUPGHOh/QnpLap0YDWzIEZUIuofNwd39RPb4IwHUzxJkT55kpJK5yxYEIZLdA8a11E93z407mLSnQeKYei0oIb+7ZJxcYPDgZoYypWO1+cDZup8M9j3Jp5SeXZCqzaXO/kuZvyELjz2zuA7pA+Gl6lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737709116; c=relaxed/relaxed;
	bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E+KRlQCpGyXFbjVBgO/ch1g97IvqrcLiYZih4pWiknKSdhGhRYP4NQDGALGDisjaTTnrtyy1KXfHLeD2qqXq3nVHWj1sx8pVDhKbniPWJCvCxJJrcPmIRqCVWyz49a/aDNy7JKtYJlazlFhO1niovidseVXT9iau7mOYtsudJoeAqb1JdLa7NdT8n45+5DTSw2664Bjjm6H6+Udeo+Bsz/qaiiDzekXiZ5asbS7bpNNY9knbrNPQXfzurBm4ofL2e3jA9s7adQJLEi6QRXs0uMsUF9dtCGIpeL3mvS441MHmpnF7sN0opQ4v7HYQ1eJCBdnfscNTVgSVHdJS5cCNFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i3THtBDS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i3THtBDS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfWty4lpGz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 19:58:33 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2164b662090so35949285ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 00:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709110; x=1738313910; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=i3THtBDSae0sS9jtotPs0PbTcsWmkqQfsM7TY89jBaHgmlH2PDVe1t3oOUz1pp68Tc
         JPzutEFK8da3ZETehskrYsSpYkwWce3wq8i3HhMdNU4GKkDAwtbwJsh/24Lb1AGTMo7P
         cV7na4NHXYm84fIJjR4XdlYeE02GyReyIMyMRN7Ce/e5JmI/sM+rzakApaVqdsoX7KkT
         LIdqJ87/I+pPdVtA0YeIPhYEev6WF0eozOfvYaeoeZmNVuP5Q4QWvaEXSxDNQVZRMlOi
         zrJJSW2DmjyX6yL2Qy2xCLdvuMaQqSLjxDb9gnoEnBAIPewVT1r5IpEB+r6u56/sBmV6
         uAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709110; x=1738313910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=w4dCpEn0ICjqHuNWh5J5HN+ZawxyNP2z9UWZFSqaT/0v0cs71axXZjIdiJcR+wnuSt
         tPVGZdwQjsAF5e9oyUvZqZJnKe1dPq/mmoSbXW0oZ2mzl7vwXLUAMIOfxJrFvlajUp2+
         DV8GOvUb/pJKfA4MSNm3/z1arQreoLRYPmUixqvdG+Ddabq29ORDDoRRjQOWi4HXCGTd
         FAmN9RKS8ghtZN59+UM4tHKUZIvaL0vp/RA2nJFe7mg9lcW6KRxWUfGDlgK8OzvKPLVG
         F+Y81VIQcCNieumE4OJbdvsf/C5Scl0Mb3xHaiwL+ELMEiaUYtftfLeQ6v6wdC8yBRoT
         YK2g==
X-Forwarded-Encrypted: i=1; AJvYcCXAZpzcoEUAIw5tPGiuCMxwgF8CenTo6Ue4r8/C6Zj2CAk9dcFNrWOh1M0g1msq/on+5ILwhIGKxrMdbPU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUUy6BpTDzAGgGhelJz2ghCwsrnxkAWU0FeACovE/ltlqFJfVq
	1bW13H50AS5V8IU+N+reJY/CvEVa/YCbstCSkHwS11rdABEdnMF4KW5vAi6JH9M=
X-Gm-Gg: ASbGncsfRp8kvY/AThInbzUOoF44VepP1kkwXLaDO8YkQxRSzhIrPsbLX+Zpc9LYxI/
	FqeIx3lOm0x1brMu9MhrG0bUrORGXtXX8R6GneZhXwaoxmYYykEucvRENzeN93psc/kd0LPlhl9
	+jaPnqrMAySeD2P4RwS+ALW8gKvBWqBsm0VOwyMjvJpfb5waeU5LexxEafFYhsgbVOOsjVwqgeX
	Qm9nD2Wa9C7tg0+ftiGySvfRZSsO1kUTjbr6v6X2MovWKXyGDTsZ94jHt02xm4fgSBiZBtrWGfo
	JWLihok=
X-Google-Smtp-Source: AGHT+IGaLv3P86dnfhfsz8clY+KvPxRH7m/1Pd0NzNkAaLxjGYIDOwn76y4qMRrSSuP3v13w1OIdqA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr480084755ad.22.1737709110054;
        Fri, 24 Jan 2025 00:58:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e1b2sm11621015ad.17.2025.01.24.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/15] cpufreq: simplify boost handling
Date: Fri, 24 Jan 2025 14:28:04 +0530
Message-Id: <cover.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently most of the drivers enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets called
for each policy and then there is online/offline path too where this gets done
unnecessarily.

Also it is possible to have a scenario where not all cpufreq policies support
boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
feature for that policy isn't correct.

Simplify and cleanup handling of boost to solve these issues.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost

Rebased over few dependencies from PM tree, will push to the arm-cpufreq tree
after merge window is closed.

Viresh Kumar (15):
  cpufreq: staticize cpufreq_boost_trigger_state()
  cpufreq: Export cpufreq_boost_set_sw()
  cpufreq: Introduce policy->boost_supported flag
  cpufreq: acpi: Set policy->boost_supported
  cpufreq: amd: Set policy->boost_supported
  cpufreq: cppc: Set policy->boost_supported
  cpufreq: Restrict enabling boost on policies with no boost frequencies
  cpufreq: apple: Set .set_boost directly
  cpufreq: loongson: Set .set_boost directly
  cpufreq: powernv: Set .set_boost directly
  cpufreq: scmi: Set .set_boost directly
  cpufreq: dt: Set .set_boost directly
  cpufreq: qcom: Set .set_boost directly
  cpufreq: staticize policy_has_boost_freq()
  cpufreq: Remove cpufreq_enable_boost_support()

 drivers/cpufreq/acpi-cpufreq.c      |  3 +++
 drivers/cpufreq/amd-pstate.c        |  4 ++--
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
 drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
 drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
 drivers/cpufreq/freq_table.c        |  7 +++++--
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 drivers/cpufreq/powernv-cpufreq.c   |  5 +----
 drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
 drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
 include/linux/cpufreq.h             | 20 ++++++-------------
 12 files changed, 35 insertions(+), 95 deletions(-)

-- 
2.31.1.272.g89b43f80a514


