Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20216CED8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmrgM1bjVz3fJk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.43; helo=mail-oa1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrfq1NXfz3cLF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:52:50 +1100 (AEDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17997ccf711so16696391fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myNahkzgyzJXsmSpdQrVTovV/3CgUWg7sSEu7RQwjG0=;
        b=vckGBVePqs2Wska1Tc+6ZjmjbH8F/YCWotKtgMEa65Y6DGUNJkFwbKfSaiH63cWj6g
         OEf0xmWFJ3I396d6iu3UFEHjnNhH0bMN5hlNbl0S3+RapI+uvKXcWoltx9i1o056PGyn
         u+sp+DWk+2R1COzdUtfW7lBpVIIfDgVpkmN3Ng2Gu31e5mCUcX+QFNqMRv2B6T8FQ8l/
         PyWWTEkgRnrylOJtdrH1VYHbJqDOwsL+R0Vi7u2+rgzGyfrX3OnjfdiiRYFQaVI/M2f5
         8xr5o4KEEdlvBTffeUOaR8b2d2DrvevmeE7vMKNt0WkREJXMbQLuX7315602rxachEj/
         OUpQ==
X-Gm-Message-State: AAQBX9c0MW37t5/MwcI4mjJCH6OVqpgLti6KDFVwPXyrKJOPzezaislG
	CtgYnZISlwhOAnRTtidJRg==
X-Google-Smtp-Source: AK7set9u04Mn8XGtckt02xXgvmDdYPAodmqaRmO7QbQsn4pMne9ZnJvBTvxw9bjwWx1vNoyCfeyKQg==
X-Received: by 2002:a05:6870:eca0:b0:177:baf4:5b10 with SMTP id eo32-20020a056870eca000b00177baf45b10mr12821109oab.31.1680105167283;
        Wed, 29 Mar 2023 08:52:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hv12-20020a056870f98c00b00176209a6d6asm11896178oab.10.2023.03.29.08.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:46 -0700 (PDT)
Received: (nullmailer pid 3198060 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 00/19] DT header disentangling, part 1
Date: Wed, 29 Mar 2023 10:51:57 -0500
Message-Id: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1eJGQC/x2NywoCMQwAf2XJ2UBtER+/Ih7SNNpCqaWxi7Dsv
 xs8zsAwG6iMIgq3ZYMha9HybgbHwwKcqb0ESzIG73xwwV8xfZD7xCyUZCBXoTa7Ip+jpAu7GE4
 eLI6kgnFQ42x5m7Wa7EOe5fu/3R/7/gPTb5swfQAAAA==
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

This is the first of a series of clean-ups to disentangle the DT 
includes. There's a decade plus old comment in of_device.h:

 #include <linux/of_platform.h> /* temporary until merge */

Who's this Grant person that wrote this? ;)

It gets better. of_device.h also pulls in of.h, and of_platform.h 
includes of_device.h. So naturally, drivers include all combinations of 
those 3 headers and sometimes they actually need them. 

I started on fixing this years ago, but just dropping the circular 
includes and fixing all the fallout was massive and didn't sit well. 
Pulling in of_device.h in all the drivers that happen to call only
of_device_get_match_data/of_match_device didn't seem great when the rest 
of of_device.h would never be needed. of_device.h being everything that 
works on a struct device is not a great split because several types of 
users deal with struct device. The better split seems to be by user 
(subsys driver vs. consumer) which several subsystems now do. For 
of_device.h, the users can primarily be split between bus 
implementations and device drivers. Device drivers also typically need 
of.h to read properties. So let's move of_device.h towards just bus 
related functions and move device driver related functions to of.h.

This series is just the first step. It makes a couple of clean-ups to 
replace some includes with forward declarations. It moves 
of_device_get_match_data() and of_cpu_device_node_get() to of.h. The 
former move is transparent for now and preparation for the next series.
The last part of the series updates drivers using 
of_cpu_device_node_get() and/or relying on the implicit cpu.h include 
which is removed in the last patch.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (19):
      of: Make devtree_lock declaration private
      of: Move of_device_(add|register|unregister) to of_platform.h
      of: Move of_device_get_match_data() declaration
      of: Move CPU node related functions to their own file
      of: Drop unnecessary includes in headers
      ARM: sunxi: Drop of_device.h include
      ARM: cpuidle: Drop of_device.h include
      riscv: Add explicit include for cpu.h
      riscv: cacheinfo: Adjust includes to remove of_device.h
      cacheinfo: Adjust includes to remove of_device.h
      clocksource: ingenic: Add explicit include for cpuhotplug.h
      thermal: cpuidle_cooling: Adjust includes to remove of_device.h
      soc: mediatek: mtk-svs: Add explicit include for cpu.h
      cpufreq: Adjust includes to remove of_device.h
      cpufreq: sun50i: Add explicit include for cpu.h
      cpuidle: Adjust includes to remove of_device.h
      irqchip: loongson-eiointc: Add explicit include for cpuhotplug.h
      OPP: Adjust includes to remove of_device.h
      of: Drop cpu.h include from of_device.h

 arch/arm/kernel/cpuidle.c              |   1 -
 arch/arm/mach-sunxi/mc_smp.c           |   1 -
 arch/riscv/kernel/cacheinfo.c          |   1 -
 arch/riscv/kernel/setup.c              |   2 +-
 arch/sparc/include/asm/prom.h          |   3 +
 drivers/base/cacheinfo.c               |   2 +-
 drivers/clocksource/ingenic-timer.c    |   3 +-
 drivers/cpufreq/cpufreq-dt-platdev.c   |   1 -
 drivers/cpufreq/kirkwood-cpufreq.c     |   2 +-
 drivers/cpufreq/maple-cpufreq.c        |   2 +-
 drivers/cpufreq/pmac32-cpufreq.c       |   2 +-
 drivers/cpufreq/pmac64-cpufreq.c       |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |   4 +-
 drivers/cpufreq/spear-cpufreq.c        |   2 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c |   3 +-
 drivers/cpufreq/tegra124-cpufreq.c     |   1 -
 drivers/cpufreq/tegra20-cpufreq.c      |   2 +-
 drivers/cpuidle/cpuidle-psci.c         |   1 -
 drivers/cpuidle/cpuidle-qcom-spm.c     |   3 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c    |   2 +-
 drivers/cpuidle/dt_idle_states.c       |   1 -
 drivers/irqchip/irq-loongson-eiointc.c |   5 +-
 drivers/of/Makefile                    |   2 +-
 drivers/of/base.c                      | 187 -----------------------------
 drivers/of/cpu.c                       | 210 +++++++++++++++++++++++++++++++++
 drivers/of/of_private.h                |   1 +
 drivers/opp/of.c                       |   2 +-
 drivers/soc/mediatek/mtk-svs.c         |   1 +
 drivers/thermal/cpuidle_cooling.c      |   3 +-
 include/linux/cpufreq.h                |   1 -
 include/linux/of.h                     |  28 +++--
 include/linux/of_device.h              |  24 +---
 include/linux/of_platform.h            |  10 +-
 33 files changed, 261 insertions(+), 254 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230329-dt-cpu-header-cleanups-c7bed8c0b352

Best regards,
-- 
Rob Herring <robh@kernel.org>

