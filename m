Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418AE43D74D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkvY0kJ2z3fD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RZvyurGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RZvyurGZ; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQ54g92z2yxm;
 Thu, 28 Oct 2021 08:18:53 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id j2so9016444lfg.3;
 Wed, 27 Oct 2021 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
 b=RZvyurGZNweTiQS39Ean2OjgLccYrK032pC/dpD5TIetEdWActoZDZ0pbxUwZ65EB3
 f6HHqHOjaIJRkLRbNXFH+a9dD2g5xu+MxS8srOD+UoT89FXGbOpnIpBzsogwI4SrHnvI
 Xp4OXB4rFx2UJNCOe+1ontZRmKhqDl18fc0h55fLU7qhbVovqyZfQtN1oE2ZBblN4A6p
 LG+FlNBhlZ+ejJ/tR/o9Ca2I3+iU/ni7hPa9YCzdcCgi2bkMHewfSz0zfMDsoGnOZiG5
 WYH0N8y7+ABYK8jopd3eQsXttqeRRQN+xpWJ5QIjK2cUfd8tbZPE8negDAsL0a+gaJ2V
 fJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
 b=twNpGcd3IH3RbByh7Giy5qSi7v+FkOIC7k/Tbs2VLGYlzmv+bLGirF9S/jMiWRiKxw
 nR6Y4Hy/aOZhZBqB8+8WhWHsknMpmAte9Bz7OGZ9saRL/rxznp6wIYP+ATVuGHSzd6ey
 UmhkjrBITIrbSpNs5USLI7zq2u+67/hhJwa77vvnoO02PSArmg7c3EmkWTEAcaVVXDq3
 G7SF4LKrlf9FvUlAdyz0+W8oAIFe7cyngXf34D7BPMje+2za8t9kHdbBVIvo5Bm/oSku
 syOBvDEGITjy2Q/9KTyIv8fnrjGGN2+6jWv3jSj0XsAuFFU69ciBFxiHa8LHcd51VULr
 dEQA==
X-Gm-Message-State: AOAM533NVyqEHoerkUy50TGIyCp+cFs3adM3absUu6fNwZPyxl3OgkA+
 3+/8V1id9oAb5sPu+qF8BJw=
X-Google-Smtp-Source: ABdhPJyooWx5IN/z+hq1uWs5thGA811Cpi77JA6dUlt/XGnE5KIxJDhql9o1FzopBJlB1UrwswiMLg==
X-Received: by 2002:a05:6512:3f04:: with SMTP id
 y4mr131405lfa.180.1635369530580; 
 Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 31/45] mfd: axp20x: Use register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:01 +0300
Message-Id: <20211027211715.12671-32-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:51:48 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use register_simple_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/axp20x.c       | 22 +++++++++++-----------
 include/linux/mfd/axp20x.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8161a5dc68e8..db31fdb169e4 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -823,9 +824,10 @@ static const struct mfd_cell axp813_cells[] = {
 	},
 };
 
-static struct axp20x_dev *axp20x_pm_power_off;
-static void axp20x_power_off(void)
+static void axp20x_power_off(void *data)
 {
+	struct axp20x_dev *axp20x_pm_power_off = data;
+
 	if (axp20x_pm_power_off->variant == AXP288_ID)
 		return;
 
@@ -1000,10 +1002,12 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
 		return ret;
 	}
 
-	if (!pm_power_off) {
-		axp20x_pm_power_off = axp20x;
-		pm_power_off = axp20x_power_off;
-	}
+	axp20x->power_handler =
+		register_simple_power_off_handler(axp20x_power_off, axp20x);
+
+	if (IS_ERR(axp20x->power_handler))
+		dev_err(axp20x->dev, "failed to register power-off handler: %pe",
+			axp20x->power_handler);
 
 	dev_info(axp20x->dev, "AXP20X driver loaded\n");
 
@@ -1013,11 +1017,7 @@ EXPORT_SYMBOL(axp20x_device_probe);
 
 void axp20x_device_remove(struct axp20x_dev *axp20x)
 {
-	if (axp20x == axp20x_pm_power_off) {
-		axp20x_pm_power_off = NULL;
-		pm_power_off = NULL;
-	}
-
+	unregister_simple_power_off_handler(axp20x->power_handler);
 	mfd_remove_devices(axp20x->dev);
 	regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
 }
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 9ab0e2fca7ea..49319a0ac369 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -643,6 +643,7 @@ struct axp20x_dev {
 	const struct mfd_cell           *cells;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct power_handler		*power_handler;
 };
 
 /* generic helper function for reading 9-16 bit wide regs */
-- 
2.33.1

