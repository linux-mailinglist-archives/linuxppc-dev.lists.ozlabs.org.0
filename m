Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0043D761
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfkzr02W1z3gdv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EBSN3i6p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EBSN3i6p; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQJ529nz3051;
 Thu, 28 Oct 2021 08:19:04 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id u21so8959530lff.8;
 Wed, 27 Oct 2021 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkN5RxNvfWU6udxIv0HqPwHPsreqVVHZYAiW4uOSdQE=;
 b=EBSN3i6pBzJ/QX6b7hWJ61FbfkEkrcOrflTwto+4KX4or46ACVz9Tr/1pugxTtiHmi
 G7CMVOoidyYK0g+Vg4pJnm/bKfolm8lIe6sk0vITgUl/0On7GAe1avC+nPdsUhal8n/2
 2LfBGzyZF4kisF1H8Fy3oqJJlA7mP+5FCx9jGZBePen+YJxCg52jU7glSS7bDwelermJ
 QOk39GQqnkcumTBHd2mHERoDOJXwlx4KsuyCu/MObr6DT96WNWvs0v/iyAkBnjjhRCxD
 gw7GTseQp5qiH+atTqu6Rg9n+NmY0IzLKdyAE4sSGNY6W234A5z05GeGyvCsr57AR1H6
 zVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkN5RxNvfWU6udxIv0HqPwHPsreqVVHZYAiW4uOSdQE=;
 b=BCogQMYftUqqKJgI8aJEJHx/AcaTwYF9C8luYsWjtXZI5ueWhngUZiOizHXBWEHdYJ
 bQqmSsT5UJ0heB3/JE4JBgQt4FNV53q6Woo5oKCpYwjcy5fehMjZEbGeqOOcGahSjU5+
 BLa36NkikFaLl/RlGkqVsD3ykde3zKnxetIoCN8eiQXOnnAVIJxa6QoWGlrVWGv2Au9X
 /WU2Uq+ukFxnQ3x9eG5qO4hq4tLRWgPn0xQrt3fQUxrr4UyDCYBu0Zqa3lEQv+nsbBHW
 OIXadXWffd6ZFhED4PLgxG9rxB4XwjMP4G/xbT2ELbbPB4vPgbeNXRSKWDa4giAnNdBl
 mvxA==
X-Gm-Message-State: AOAM530use5/XeQyWVCg0dMCtFJ/N43WBZ8w7E/I4F5+xJ4OTHyy8+H0
 u0Ib3LVDckBR8huqBZaRFJ8=
X-Google-Smtp-Source: ABdhPJxsr/pRUcPc/yvXJw9vQsQsBRCfPMRUucvUkltufw5utcaA8e0PD5R7U1W5XHhl0HmaGsY5xg==
X-Received: by 2002:a05:6512:aca:: with SMTP id
 n10mr150724lfu.66.1635369541621; 
 Wed, 27 Oct 2021 14:19:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 37/45] mfd: tps65910: Use
 devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:07 +0300
Message-Id: <20211027211715.12671-38-digetx@gmail.com>
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

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps65910.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6e105cca27d4..8fab30dc84e5 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -16,6 +16,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/mfd/core.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/of.h>
@@ -429,9 +430,9 @@ struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
 }
 #endif
 
-static struct i2c_client *tps65910_i2c_client;
-static void tps65910_power_off(void)
+static void tps65910_power_off(void *data)
 {
+	struct i2c_client *tps65910_i2c_client = data;
 	struct tps65910 *tps65910;
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
@@ -503,9 +504,15 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 	tps65910_ck32k_init(tps65910, pmic_plat_data);
 	tps65910_sleepinit(tps65910, pmic_plat_data);
 
-	if (pmic_plat_data->pm_off && !pm_power_off) {
-		tps65910_i2c_client = i2c;
-		pm_power_off = tps65910_power_off;
+	if (pmic_plat_data->pm_off) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     tps65910_power_off,
+							     i2c);
+		if (ret) {
+			dev_err(&i2c->dev,
+				"failed to register power-off handler: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.33.1

