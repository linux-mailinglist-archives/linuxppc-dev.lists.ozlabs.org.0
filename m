Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99866CEE21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmrlW4NTPz3fgc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.178; helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrg80GP6z3f4k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:07 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id f17so11895625oiw.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4/7KPsNb+9xFZnBvWPuvHxFUZ+0wY+oqrqhzOTeb8U=;
        b=nNMd6q8SMzsnn4i0k9xUQKiPw+MFrMFf1Bnwr1NcxugEvP97K4kmMiXI2YIaWvzDb8
         gbmhMzcP4fHj6qG9jg1kyCycvr8iLuFxHMsiOHrrw/7z0Lnbb1uyZhDZf4+QONcfJyrg
         OJvhORNUsyzLVvKqlW2JgDMBN1GI1U/QLZQNSGVd2a3Ramb5injTT6Yums/vJhEObrIr
         s2ciyBO7CR4NROaVP36WToeTOZQkyG3bZAWWaPEZ2t/ZLI1+/3IxNjF8nyC4dMVTvsxx
         mtvsdPxT/vTOKuLgGtE2dvNx2rAjteypqLZoUDhjJha3xfv6ZBCDAM/3SThRL175mRGa
         Atag==
X-Gm-Message-State: AO0yUKXJynoG4Kd6vcfLF2rTfSOjP8IKh4OALCirW/3yx6ob7LOsTYU5
	pu8w654crIWKceb9YR8V/g==
X-Google-Smtp-Source: AK7set+4b8TVt2XSxmpWLVvJqTy6ovjjoLfneQ9RKzw6pkGeQwoKn8nerPqu8oZLFPwkmZXWaUmfeA==
X-Received: by 2002:a05:6808:2995:b0:37f:7770:4c01 with SMTP id ex21-20020a056808299500b0037f77704c01mr7467612oib.28.1680105185402;
        Wed, 29 Mar 2023 08:53:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y184-20020aca32c1000000b0037841fb9a65sm13730637oiy.5.2023.03.29.08.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:04 -0700 (PDT)
Received: (nullmailer pid 3198077 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:05 -0500
Subject: [PATCH 08/19] riscv: Add explicit include for cpu.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
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
of_platform.h) causes an error in setup.c:

arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')

The of_platform.h header is not necessary either, so it can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..dcfa4b6fa4b1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -8,6 +8,7 @@
  *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
+#include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
@@ -15,7 +16,6 @@
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
 #include <linux/sched/task.h>
 #include <linux/smp.h>
 #include <linux/efi.h>

-- 
2.39.2

