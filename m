Return-Path: <linuxppc-dev+bounces-5501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB13A1A315
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:38:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzTT5sflz3041;
	Thu, 23 Jan 2025 22:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632285;
	cv=none; b=gUYDk6VKvPOE37Uv+1CGMcs3LHnRZNfzAl2XL7MIZ2s1y7OVvK0txQnVh3tJSbMFCBSDcA0FnlzqvWI6EVkpGme13D1dB1ESGjuZsm9Rw5Ahg6SC32ezgSKVxlYlRY3Yh+RLcmEePWhtrM1HCSZnSkJmgUI/bvefLmYQ8niIZtb1ArpfRsf9Cimnd6HcazeqP1J2pdMbjpZFIzzg7PKMrPVtgZXVhhGyF9CVKED3WUpUJFcJB3r1zo9Owp1dvTt4BpYzXhKgNxNvZy9Oixy20QVhYEhu574ZZoXgQZQCr/opyHOUEo4OyM6VodbN9dtuSYdQxwsAo7F9PxLrpvktJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632285; c=relaxed/relaxed;
	bh=G5e0D4ceKro9Yb8N26UgxQagAkkEg3LLRP/2T93ftQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GdKW63SrOUIj7wOU9p02h5HgRFfGvNSoD+7U7Ug5CurM41dQGujVKVwxsVl8HJ1SAqfCz2tROf+kQjn+OTUD8EUMO1kuD7Dg5Jq3xfJNhmh2dF5IdHJALP97yJWIOwDbcTX7H8QeuS00C5r4cFGlaFDOIWl0jXCvnB5o9yZ4Lh3E/TfkBoHD5/6WzydTDHGosruj46wXE986GMQ3cQmTBvUh/NwwyZqvEcreFN5+6/2pzKNEs1q9PLq7OMVaUObhnGDkkbmY6M3p7yvtwp/1kZWJkQAQm4L6b4Uvu+OHWHcJH0UftJYabsq/KUUgzZcJrMmXKu31SPiGmq8JgLxUrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBukg8Dy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBukg8Dy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzTS5tTRz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:38:03 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2efded08c79so1225093a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 03:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632281; x=1738237081; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5e0D4ceKro9Yb8N26UgxQagAkkEg3LLRP/2T93ftQc=;
        b=NBukg8DyvvTHf9zZ+is3S28pFu158F88pGlZSRde/Rgn+VpqXmumIh+sabdDfNljar
         L+AImBC3OFahB6sDvzQJmsPoYs50EOm3nyM6cB0nLrGpV4onfxr3AT9wxy5RJZgawBP9
         ZrjNy4J+A8gXKeSEBzTIfxzQELSm8/pFjFDYIdyRS912Y6OdEBz1BUY2CtcB7sfSO3UH
         9lv9bRlLKpnnpPTvP3B2XjBUyYdwUv+pVMrpKGK3IbuUnNtDBKBSMigAZWGZnfOh3bHz
         mYVYevHB7l9hxTZCcTl+Pe5Nh+/HkHbcXhGKE7lh30mpyse4ot3C19dnb/NWf4giN8bl
         ropQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632281; x=1738237081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5e0D4ceKro9Yb8N26UgxQagAkkEg3LLRP/2T93ftQc=;
        b=Gf6x9cM9+ChnuH4In5JyZ3ZFiVr0KNgtwBbcW+jOO2rppmLTZGX7gA+N/zxXKBKumO
         TkL5e17lqlcgwTYFSzAhEAGjGMq5RzEeDKhw0VgNXfA3dBl8dQBV5BZwQl9JD0GWELPA
         cZMAhhXhAy85aAmZ9BB24UTz/bjb8fntkcmI+GOtho9+uin4PNYTfIl8MizYg6Gb1bOI
         YzTvvoLUsLNNCfy59PzkTGnY7yVFkBmqUWWNurSkqdFo+hFCA9+l3PHtCol4wKQGIJH9
         Ej82UgEsWhuFxBRYn3EKf/8oH3Xc81XgdAfdUp9eit73YAXLXqBsgx3zqL++Ynsikdwl
         jpNw==
X-Forwarded-Encrypted: i=1; AJvYcCWrXf5C+T5xGhKGCjwgXBbcFA4ugr1SuUDJwzGY6d8hYkniKUHAE7S6XCr8/NvwXDh3t4nnsV0jWjE6IeI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxn/jaPyOo9lJuPBqS6054Tp20lvoRGVCcGXqPiuSeSIuJt5FdR
	hqIsDC6ICLgB+e7R0PgUzUVqVIWFQsMX/Cnz7uWavXA5DaxmCh+IKs719sEn/2w=
X-Gm-Gg: ASbGncuT6lvSagDqIVy9z1becY4Su59On1CqanigW9YgYRxjRri+EYJETkpLK4elh+V
	gRSSvkHyeVnn4cIax0xj0clwlNYr/U/J9JEDqgsoEN3Msjwsn6M3m2c+ThkGjxYrepo9038nQbr
	fR8lckzWFgqN86QwbuiLvq6L/F3UCk5Xqlgg0qQNmNKi/32u/4+G8G09JZw/nF39xUx4qkCRavf
	BsUcJGYxUBDdwfuSxlv66K2pwY6sBxE9bfM8UwZ3UCzl4f6O1Pl6IkuCWRrlOuuKLBAajRRlbks
	YW38RP8=
X-Google-Smtp-Source: AGHT+IGtsIzzGfAcKL/PEpiuES32TcQcp9F7OLmJOeJMP9wYjML8Ng6LAzORWCaFKdsDKOmTsmrEHA==
X-Received: by 2002:a17:90b:5206:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2f782d4ed77mr37302192a91.27.1737632280204;
        Thu, 23 Jan 2025 03:38:00 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a5e2b2sm3705966a91.3.2025.01.23.03.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:37:59 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/33] cpufreq: manage common sysfs attributes from core
Date: Thu, 23 Jan 2025 17:05:36 +0530
Message-Id: <cover.1737631669.git.viresh.kumar@linaro.org>
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

Most of the drivers add available and boost frequencies related attributes. This
patch series tries to avoid duplication and simplify driver's code by managing
these from core code.

A quick search revealed that only the drivers that set the
policy->freq_table field, enable these attributes. Which makes sense as
well, since the show_available_freqs() helper works only if the
freq_table is present.

In order to simplify drivers, create the relevant sysfs files forcefully
from cpufreq core.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core-attr

--
Viresh

Viresh Kumar (33):
  cpufreq: Always create freq-table related sysfs file
  cpufreq: dt: Stop setting cpufreq_driver->attr field
  cpufreq: acpi: Stop setting common freq attributes
  cpufreq: apple: Stop setting cpufreq_driver->attr field
  cpufreq: bmips: Stop setting cpufreq_driver->attr field
  cpufreq: brcmstb: Stop setting common freq attributes
  cpufreq: davinci: Stop setting cpufreq_driver->attr field
  cpufreq: e_powersaver: Stop setting cpufreq_driver->attr field
  cpufreq: elanfreq: Stop setting cpufreq_driver->attr field
  cpufreq: imx6q: Stop setting cpufreq_driver->attr field
  cpufreq: kirkwood: Stop setting cpufreq_driver->attr field
  cpufreq: longhaul: Stop setting cpufreq_driver->attr field
  cpufreq: loongson: Stop setting cpufreq_driver->attr field
  cpufreq: mediatek: Stop setting cpufreq_driver->attr field
  cpufreq: omap: Stop setting cpufreq_driver->attr field
  cpufreq: p4: Stop setting cpufreq_driver->attr field
  cpufreq: pasemi: Stop setting cpufreq_driver->attr field
  cpufreq: pmac: Stop setting cpufreq_driver->attr field
  cpufreq: powernow: Stop setting cpufreq_driver->attr field
  cpufreq: powernv: Stop setting common freq attributes
  cpufreq: qcom: Stop setting cpufreq_driver->attr field
  cpufreq: qoriq: Stop setting cpufreq_driver->attr field
  cpufreq: sc520_freq: Stop setting cpufreq_driver->attr field
  cpufreq: scmi: Stop setting cpufreq_driver->attr field
  cpufreq: scpi: Stop setting cpufreq_driver->attr field
  cpufreq: sh: Stop setting cpufreq_driver->attr field
  cpufreq: spear: Stop setting cpufreq_driver->attr field
  cpufreq: speedstep: Stop setting cpufreq_driver->attr field
  cpufreq: tegra: Stop setting cpufreq_driver->attr field
  cpufreq: vexpress: Stop setting cpufreq_driver->attr field
  cpufreq: virtual: Stop setting cpufreq_driver->attr field
  cpufreq: Remove cpufreq_generic_attrs
  cpufreq: Stop checking for duplicate available/boost freq attributes

 drivers/cpufreq/acpi-cpufreq.c         |  1 -
 drivers/cpufreq/apple-soc-cpufreq.c    |  8 --------
 drivers/cpufreq/bmips-cpufreq.c        |  1 -
 drivers/cpufreq/brcmstb-avs-cpufreq.c  |  1 -
 drivers/cpufreq/cpufreq-dt.c           |  8 --------
 drivers/cpufreq/cpufreq.c              | 15 +++++++++++++++
 drivers/cpufreq/davinci-cpufreq.c      |  1 -
 drivers/cpufreq/e_powersaver.c         |  1 -
 drivers/cpufreq/elanfreq.c             |  1 -
 drivers/cpufreq/freq_table.c           |  8 --------
 drivers/cpufreq/imx6q-cpufreq.c        |  1 -
 drivers/cpufreq/kirkwood-cpufreq.c     |  1 -
 drivers/cpufreq/longhaul.c             |  1 -
 drivers/cpufreq/loongson2_cpufreq.c    |  1 -
 drivers/cpufreq/loongson3_cpufreq.c    |  1 -
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  1 -
 drivers/cpufreq/mediatek-cpufreq.c     |  1 -
 drivers/cpufreq/omap-cpufreq.c         |  1 -
 drivers/cpufreq/p4-clockmod.c          |  1 -
 drivers/cpufreq/pasemi-cpufreq.c       |  1 -
 drivers/cpufreq/pmac32-cpufreq.c       |  1 -
 drivers/cpufreq/pmac64-cpufreq.c       |  1 -
 drivers/cpufreq/powernow-k6.c          |  1 -
 drivers/cpufreq/powernow-k7.c          |  1 -
 drivers/cpufreq/powernow-k8.c          |  1 -
 drivers/cpufreq/powernv-cpufreq.c      |  2 --
 drivers/cpufreq/qcom-cpufreq-hw.c      |  7 -------
 drivers/cpufreq/qoriq-cpufreq.c        |  1 -
 drivers/cpufreq/sc520_freq.c           |  1 -
 drivers/cpufreq/scmi-cpufreq.c         |  8 --------
 drivers/cpufreq/scpi-cpufreq.c         |  1 -
 drivers/cpufreq/sh-cpufreq.c           |  1 -
 drivers/cpufreq/spear-cpufreq.c        |  1 -
 drivers/cpufreq/speedstep-centrino.c   |  1 -
 drivers/cpufreq/speedstep-ich.c        |  1 -
 drivers/cpufreq/speedstep-smi.c        |  1 -
 drivers/cpufreq/tegra186-cpufreq.c     |  1 -
 drivers/cpufreq/tegra194-cpufreq.c     |  1 -
 drivers/cpufreq/vexpress-spc-cpufreq.c |  1 -
 drivers/cpufreq/virtual-cpufreq.c      |  1 -
 include/linux/cpufreq.h                |  1 -
 41 files changed, 15 insertions(+), 75 deletions(-)

-- 
2.31.1.272.g89b43f80a514


