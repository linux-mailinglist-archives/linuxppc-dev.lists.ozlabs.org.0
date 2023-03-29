Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D06CEE47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrq960C7z3gTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.51; helo=mail-oa1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrgR36S0z3fHC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:23 +1100 (AEDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-17683b570b8so16624593fac.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEYSgBedvEchN2q/UoiMsAU3PddmSYQdLMNjoc9MCt4=;
        b=Gbcivw84vKDgUIOqg4co8ZikCAdoRQ46oYjrQyy+poqNlu063W0i3FbOq85I6qIJTB
         bQQJcf4dYxm1x12t/OxSZNhgjY/O01AVqOW3Vu+BiCRX6fI/9AMrfu7uAm9IKnOzItAf
         p3mvwmZ7Tbu344DhDC96EnRuI5ckycbuaquOfonvPz8Zdzj3trSXOYhyxWfvCZZIgZ9V
         8YOA32FKb2McjX0RqnHKI7Nhc0KSal204RJuKTMzGnPHHwan220Sx4wgwYqinttlJf65
         Dks5xM5bzWwWOOF1+oiSwDUhGt5rU8RQ35Vk+ucqa+3BfGMwpX02yfskilJQk9ldYAUK
         312Q==
X-Gm-Message-State: AAQBX9eX7PVVgiAZIN45HF9IJgXdI9SKDTzcqCaLw9//6r1PUS61WgGR
	+VEg2JQSt+1TvmvNr8Mn5g==
X-Google-Smtp-Source: AKy350ZHXeEonGuoS+n1vAF/JTVb3n1039viPI4HO0R7pB9GB4WjtZ+1Lq53IBiwmzOIfDambYJBVQ==
X-Received: by 2002:a05:6870:972a:b0:17a:e448:3dcd with SMTP id n42-20020a056870972a00b0017ae4483dcdmr13459005oaq.59.1680105200708;
        Wed, 29 Mar 2023 08:53:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k10-20020a056830168a00b0069dd3d98ec6sm5193290otr.44.2023.03.29.08.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:20 -0700 (PDT)
Received: (nullmailer pid 3198089 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:11 -0500
Subject: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
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
include files with what was implicitly included by of_device.h (cpu.h and
of.h) and drop including of_device.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 -
 drivers/cpufreq/kirkwood-cpufreq.c   | 2 +-
 drivers/cpufreq/maple-cpufreq.c      | 2 +-
 drivers/cpufreq/pmac32-cpufreq.c     | 2 +-
 drivers/cpufreq/pmac64-cpufreq.c     | 2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c    | 4 ++--
 drivers/cpufreq/spear-cpufreq.c      | 2 +-
 drivers/cpufreq/tegra124-cpufreq.c   | 1 -
 drivers/cpufreq/tegra20-cpufreq.c    | 2 +-
 include/linux/cpufreq.h              | 1 -
 10 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index e85703651098..f9675e1a8529 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -6,7 +6,6 @@
 
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "cpufreq-dt.h"
diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index 70ad8fe1d78b..95588101efbd 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -9,7 +9,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <asm/proc-fns.h>
diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
index 28d346062166..f9306410a07f 100644
--- a/drivers/cpufreq/maple-cpufreq.c
+++ b/drivers/cpufreq/maple-cpufreq.c
@@ -23,7 +23,7 @@
 #include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/time.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #define DBG(fmt...) pr_debug(fmt)
 
diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 4b8ee2014da6..a28716d8fc54 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -23,7 +23,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/hardirq.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/irq.h>
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index ba9c31d98bd6..2cd2b06849a2 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -21,7 +21,7 @@
 #include <linux/init.h>
 #include <linux/completion.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/irq.h>
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 2f581d2d617d..df165a078d14 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -11,8 +11,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index c6fdf019dbde..78b875db6b66 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -18,7 +18,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
index 7a1ea6fdcab6..312ca5ddc6c4 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
diff --git a/drivers/cpufreq/tegra20-cpufreq.c b/drivers/cpufreq/tegra20-cpufreq.c
index ab7ac7df9e62..5d1f5f87e46d 100644
--- a/drivers/cpufreq/tegra20-cpufreq.c
+++ b/drivers/cpufreq/tegra20-cpufreq.c
@@ -12,7 +12,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/types.h>
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 65623233ab2f..3ac4a10d4651 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -15,7 +15,6 @@
 #include <linux/kobject.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_qos.h>
 #include <linux/spinlock.h>

-- 
2.39.2

