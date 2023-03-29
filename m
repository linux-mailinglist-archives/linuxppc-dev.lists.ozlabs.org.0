Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D46CEE38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:59:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrp93xV6z3gMF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:59:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrgM1p3zz3fGQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:18 +1100 (AEDT)
Received: by mail-ot1-f50.google.com with SMTP id o25-20020a9d4119000000b006a11eb19f8eso7247573ote.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWmtLeCB2PTcAHpGNr0ZZYDBf99xMHUdOSjMIZXheFk=;
        b=QONdAJRZu7JyY3pVVPkeQf6XF7p/KbJNEks8W8kJ8Ar7B/G+YvNo6wOnLSjyUdww1t
         e+Rx76clOJdVLec9Qe60PQ+kj+Yx1FAlH5ukSeq0mcQUh4HvddktiR62rzaGV1eGytPF
         wNBpN6Ha0WywVdmlz7q0VcJcEVthrBQ3+aDcANUzVQfarYfKHKM+kjwZD12pulywG4rJ
         2dgQnfN2YpnKJYQqcgk3V5obssWIMtO7AStByX5oCo3bSssrlPMVSG7nTn9gv0asdEvC
         QPaAkVM3jA73AdAhrDpWQWUoU1aVPvVGvvKGXIATSjgFrNH0J/741LyCBniRBSk/kYWI
         /8lA==
X-Gm-Message-State: AO0yUKXW5D0py1LoUKSzkmpGq7yXRBPzToiEG44c32L+spSxtjWZQtJp
	Afe8qAsiVuN4+Nd/5waPYg==
X-Google-Smtp-Source: AKy350by63hvThVx+G6CTPOFFLOe4lmhMruBxp6akfw7h8ZCmJHsyJFTMVn+Dn/8by4Bc4xtRU8hFQ==
X-Received: by 2002:a05:6830:1695:b0:694:3972:dbae with SMTP id k21-20020a056830169500b006943972dbaemr9305044otr.2.1680105196435;
        Wed, 29 Mar 2023 08:53:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q4-20020a9d4b04000000b0069f509ad088sm5047619otf.65.2023.03.29.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:16 -0700 (PDT)
Received: (nullmailer pid 3198067 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:00 -0500
Subject: [PATCH 03/19] of: Move of_device_get_match_data() declaration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-3-581e2605fe47@kernel.org>
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

of_device.h mostly defines functions for bus drivers whereas
of_device_get_match_data() is used by drivers. Let's move it to of.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h        | 2 ++
 include/linux/of_device.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 36cf94596eba..b7118d68c73a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -416,6 +416,8 @@ extern int of_detach_node(struct device_node *);
 
 #define of_match_ptr(_ptr)	(_ptr)
 
+extern const void *of_device_get_match_data(const struct device *dev);
+
 /*
  * struct property *prop;
  * const __be32 *p;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index e4aa61cb2bd0..6af4c3acd502 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,8 +26,6 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern const void *of_device_get_match_data(const struct device *dev);
-
 extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
 extern int of_device_request_module(struct device *dev);
 

-- 
2.39.2

