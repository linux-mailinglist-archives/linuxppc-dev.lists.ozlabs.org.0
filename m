Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E26CEE1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrk11bZfz3frK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.48; helo=mail-oo1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrg10Jd6z3chw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:00 +1100 (AEDT)
Received: by mail-oo1-f48.google.com with SMTP id o15-20020a4ae58f000000b00538c0ec9567so2502838oov.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaKQY99G3HY+F9cltbrOFgoelmJMxNBfQJcO0sLBgas=;
        b=rmm27UaXLZlZlZBkW4j2S3mRuxLWeH+B+BXNH1xINE7asuIvXtqUx0oen8esP35KaS
         Ob3VeOxlYWbqeSDgSR8rAtxHjHowzkx+Z1wUPEhiDTdl7CaKv8DZ40amhD14ZFtrsyB/
         AiYDBPYFAVVf44khUWvIOkDxmShxcraYwH7/+dee+xDlXHoGCIk1xc2ZF/HqWMRYO1NC
         KwIr0eHjmffzAeXjFkojp+y/XsJmp2tDCUM1ipyZaobvVIMobC+8cV8k5y7AjJuxRNR4
         bIe3/g+4NgRZuWD2iN2/cns1olFfkUgTPR8c11bQoqX+bXP45zjkvkptB9rzbD3UsKoJ
         U3Cg==
X-Gm-Message-State: AO0yUKXPED7cPWXj4+eo0BHw4xZ8B6a74IF/IiesyGiUiD1x9iasz80w
	Z/RHNxHzbJR+g6XYEztUZw==
X-Google-Smtp-Source: AK7set/NHlve/5dROzrE0RjwFIfWzeZwZim5jtRZxJnjvVhB2968rp1PLl6KK6w8FucuWDAPMr2x9Q==
X-Received: by 2002:a4a:890d:0:b0:51a:6ea9:5053 with SMTP id f13-20020a4a890d000000b0051a6ea95053mr8240938ooi.9.1680105178376;
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c192-20020a4a4fc9000000b0053b88b03e24sm8091146oob.18.2023.03.29.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: (nullmailer pid 3198071 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:02 -0500
Subject: [PATCH 05/19] of: Drop unnecessary includes in headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-5-581e2605fe47@kernel.org>
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

Drop unnecessary includes in DT headers. Some simply aren't needed and
some can be replaced with forward declarations.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h          | 5 ++---
 include/linux/of_device.h   | 3 ++-
 include/linux/of_platform.h | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 1f1e847a1c13..96979c67c5fa 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -16,13 +16,10 @@
 #include <linux/errno.h>
 #include <linux/kobject.h>
 #include <linux/mod_devicetable.h>
-#include <linux/topology.h>
-#include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/list.h>
 
 #include <asm/byteorder.h>
-#include <asm/errno.h>
 
 typedef u32 phandle;
 typedef u32 ihandle;
@@ -1517,6 +1514,8 @@ enum of_reconfig_change {
 	OF_RECONFIG_CHANGE_REMOVE,
 };
 
+struct notifier_block;
+
 #ifdef CONFIG_OF_DYNAMIC
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 910951a22eb4..5cdafe19dc80 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -7,9 +7,10 @@
 #include <linux/of_platform.h> /* temporary until merge */
 
 #include <linux/of.h>
-#include <linux/mod_devicetable.h>
 
 struct device;
+struct of_device_id;
+struct kobj_uevent_env;
 
 #ifdef CONFIG_OF
 extern const struct of_device_id *of_match_device(
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 8ac5cb933dc3..d8045bcfc35e 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -6,12 +6,13 @@
  *			 <benh@kernel.crashing.org>
  */
 
-#include <linux/device.h>
 #include <linux/mod_devicetable.h>
-#include <linux/pm.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+struct device;
+struct of_device_id;
+
 /**
  * struct of_dev_auxdata - lookup table entry for device names & platform_data
  * @compatible: compatible value of node to match against node

-- 
2.39.2

