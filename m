Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67A6CEE1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:55:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmrjM6NbZz3fmK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:55:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrfw5xksz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:52:56 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id b19so11913626oib.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXYasbFGyOzjbVgkFYQhHdq2LiUoVceQJn8x4Q7U0Lg=;
        b=WodXa11b158MxAQ5Yjfxs2r1G9WTUIwZYsv4im/mKlTLHASJFrMb73+Waq5Nm2SXUv
         bNXGOwYNgtayqOhqOCIQ7tOTdg0HoCt1DQ94jpVXiHN6yHjl8IRNlQ+E+YsFrNcwZ8bz
         ZsjpYF80tOKfCEq/FqTQP2Go8hzFOrFhsLnPjUUFkSTHI9MxL7fDWE4KysTwj54tbFum
         HyEI95mt1+v/HZCz4Ib1Wp3mcQIObL5z3saTfYzPvQ+kukBQ2HmyYmRJFe3n1FpCA++O
         wUQ5aL+3hHxolhW1xXaSUXafrmUI4mww7J5FyIHn0tskqRsJxagOqjpvGNiQnoLBj3T5
         fWTA==
X-Gm-Message-State: AO0yUKWD0ygdSvPF3VqRt0FROzT0myOQ6vVIDNpkJnjBpsJWus/bMO49
	NiFdvfLaKecUPHGm35EGhg==
X-Google-Smtp-Source: AK7set9WFLmG+nDxrfFiYKr/Y1X4gukEgmYRhjOb4gvixi7TQjjzvpWDqSzTEx2qAniqrP2lpYSRIg==
X-Received: by 2002:aca:1316:0:b0:364:ebf2:735f with SMTP id e22-20020aca1316000000b00364ebf2735fmr8517999oii.24.1680105176210;
        Wed, 29 Mar 2023 08:52:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bx32-20020a0568081b2000b0038733b00a5fsm8526890oib.10.2023.03.29.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:55 -0700 (PDT)
Received: (nullmailer pid 3198093 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:13 -0500
Subject: [PATCH 16/19] cpuidle: Adjust includes to remove of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
implicitly including other includes, and is no longer needed. Adjust the
include files with what was implicitly included by of_device.h (cpu.h,
cpuhotplug.h, of.h, and of_platform.h) and drop including of_device.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/cpuidle/cpuidle-psci.c      | 1 -
 drivers/cpuidle/cpuidle-qcom-spm.c  | 3 +--
 drivers/cpuidle/cpuidle-riscv-sbi.c | 2 +-
 drivers/cpuidle/dt_idle_states.c    | 1 -
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 6de027f9f6f5..bf68920d038a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/psci.h>
 #include <linux/pm_domain.h>
diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
index c6e2e91bb4c3..1fc9968eae19 100644
--- a/drivers/cpuidle/cpuidle-qcom-spm.c
+++ b/drivers/cpuidle/cpuidle-qcom-spm.c
@@ -11,8 +11,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/cpuidle.h>
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index be383f4b6855..ae0b838a0634 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) "cpuidle-riscv-sbi: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
 #include <linux/cpu_pm.h>
@@ -15,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index 02aa0b39af9d..12fec92a85fd 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "dt_idle_states.h"
 

-- 
2.39.2

