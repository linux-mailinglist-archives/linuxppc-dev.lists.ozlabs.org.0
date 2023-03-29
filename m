Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B796CED92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrgs1qk8z3fZ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:53:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrfr4X9vz3cLF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:52:52 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id b19so11913331oib.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UL9zh/S00J+cmPfrAtv4vflOTxQVISfijtGfdl2R3L0=;
        b=nG0mCMvzjt5fK3OTvxhRLJGIgaBgWs5acqhiG5gH9xpUMHd+m+FnDwg73RRw82btP7
         W7gwKPt+V5IIAIFWoTwZno0GlTF5Wx5UG13IUCC8RxpFJrd5B0DIoBg4N4IiH0dAKt1a
         +7xMXDGI4s2dy3jaTZh29Dq7w/5krby0qhjW5gPkgMobWPcEwsw2E6oLUhWETKky3Wsc
         TuIF0RJVYTWIun2tlRK97Z2FbCCo/lp2QVUVS/CY/NV0qlzQYxkzfH+/rX1FIq27/Bsd
         to4UFyHW0SqaFPxuE+d6JQoI/f8LS3XQVzPsE8Y4nHAiGO62bJMk8XtK+3VVT0FBxx5Q
         3DhQ==
X-Gm-Message-State: AAQBX9cSxduTTRBZ6K7BzehVFZQxqEeWTdeBhbwmy2f7Wdi1BN1Sh53w
	8UyMO+Vk2OjaDTBggYhmqA==
X-Google-Smtp-Source: AKy350YWPg6naXojJ+dh5QDGD5h6eaepx41Bc/m1xdmR3LQVsEP9dglulW7uPvOZ4q19z4rMeJNnvA==
X-Received: by 2002:a05:6808:4da:b0:386:9883:ca9d with SMTP id a26-20020a05680804da00b003869883ca9dmr1291968oie.2.1680105169571;
        Wed, 29 Mar 2023 08:52:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v184-20020acadec1000000b003871471f894sm10161090oig.27.2023.03.29.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:49 -0700 (PDT)
Received: (nullmailer pid 3198065 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:51:59 -0500
Subject: [PATCH 02/19] of: Move of_device_(add|register|unregister) to
 of_platform.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-2-581e2605fe47@kernel.org>
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

As of_device_(add|register|unregister) functions work on struct
platform_device, they should be declared in of_platform.h instead.

This move is transparent for now as both headers include each other.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of_device.h   | 4 ----
 include/linux/of_platform.h | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index f4b57614979d..e4aa61cb2bd0 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,10 +26,6 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern int of_device_add(struct platform_device *pdev);
-extern int of_device_register(struct platform_device *ofdev);
-extern void of_device_unregister(struct platform_device *ofdev);
-
 extern const void *of_device_get_match_data(const struct device *dev);
 
 extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index d15b6cd5e1c3..8ac5cb933dc3 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -52,6 +52,11 @@ extern const struct of_device_id of_default_bus_match_table[];
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
 					 struct device *parent);
+
+extern int of_device_add(struct platform_device *pdev);
+extern int of_device_register(struct platform_device *ofdev);
+extern void of_device_unregister(struct platform_device *ofdev);
+
 #ifdef CONFIG_OF
 extern struct platform_device *of_find_device_by_node(struct device_node *np);
 #else

-- 
2.39.2

