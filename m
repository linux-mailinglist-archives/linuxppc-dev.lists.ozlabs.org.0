Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5B6CEE60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrqr5gVwz3ft9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:00:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.49; helo=mail-ot1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrgT4B4Gz3fFY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:25 +1100 (AEDT)
Received: by mail-ot1-f49.google.com with SMTP id 61-20020a9d02c3000000b0069fe8de3139so8451455otl.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcRNyMomlVIyDJBO4v13lmumWoZCHsVn17zoo+wPdkk=;
        b=Eim/y7hWtOSaUWHC46Xerebnv00bQ329BJ9HvRyqfos1qC3z1UlI/AY5lNwvtJ3R6Z
         2X0CU1wYRPC6Bw1rfVLZhQhqpAPveB569Z1b+tCoTEm6oUJM7RpUuOcJEuugr7zB5XS6
         zQYK9SoHC3numbvIXXJvdysePZaJ4qVt+TxyXrXnAgPPwJPaRIoeHlGlVmK+NeLfQPYo
         dPWQAuXGcxJBMeDNPO9SKjHYfhpOpshsx2AI/3MzyBlXRsND5rV1yvWyNF3m7QnpxX//
         J386FXLDkSsIUS1l7eIzNXpDsJuUMKNByuIKKJrp1yKTA7AjqyzsjJZkwFQ5cLyLGD32
         cDJw==
X-Gm-Message-State: AO0yUKXW+v1WRg+kKDtL7oMlQtUfzBVBVVptL6HDToU1Buos5fSm+pgB
	4LEXRx7XDaqtW+JUUHFMRA==
X-Google-Smtp-Source: AK7set+G4RUI7e7LVlBDXGQ8p8x17CahM2R0t8c+RybdcRc83FcjeXtVKZHsxX3oO+Yqeus+IJNu+w==
X-Received: by 2002:a05:6830:124e:b0:68e:da51:2cb2 with SMTP id s14-20020a056830124e00b0068eda512cb2mr10233310otp.37.1680105202916;
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y26-20020a056830209a00b006a06e7972ebsm6242943otq.38.2023.03.29.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: (nullmailer pid 3198087 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:10 -0500
Subject: [PATCH 13/19] soc: mediatek: mtk-svs: Add explicit include for
 cpu.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-13-581e2605fe47@kernel.org>
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

Removing the include of cpu.h from of_device.h (included by
of_platform.h) causes an error:

drivers/soc/mediatek/mtk-svs.c:2134:41: error: implicit declaration of function 'get_cpu_device'; did you mean 'get_swap_device'? [-Werror=implicit-function-declaration]

of_platform.h is still needed for of_find_device_by_node().

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f26eb2f637d5..1b7579a5bec6 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/cpu.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>

-- 
2.39.2

