Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7B43D740
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfksR2bF2z3f6y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JvBjth71;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JvBjth71; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQ04HDLz2yHW;
 Thu, 28 Oct 2021 08:18:48 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id k13so6922070ljj.12;
 Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XVkgO3q8+3iXvnI8C7YHW1hpsebxqvqNvVwPho8vSws=;
 b=JvBjth71MhsyIm0JdpPylPRsS4KUFW6BneSIAqxDXDzbFjW9Bt93MWfm5UnDUVT+LY
 PN2DoVOg4LkGHqR46okUaH0xtknlZuN7sz1m2rXWFP+8ycrv0mDE2+lXOLhNQyopT3Vb
 C9HJqmEvn5NNTeFE+Yqt8PhYhqF5nNL7X6uD9nn3NzyyFpNh4ofur6IOki9Q5zCOptdK
 PNXfyjJD/8x2BE3QO9lZ5RaDpWCetJjHnzeJvzuWrsMKLwqp5dFqdwNw5X1p5tIb9H77
 X9gwILOKempj602Hj9wd8g1ui3+PA2eteBB91Roi8uzQIKwV7mQ4s5O8fFD8fUrtUyG6
 Kjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XVkgO3q8+3iXvnI8C7YHW1hpsebxqvqNvVwPho8vSws=;
 b=WFhCNGbzE55028OLkpFxcDbsV9dvC3ezU+EZVdT/eDi7ApFu/p2WHIA9kkD1HPo6m7
 SUu/f2XjPtiMxkSu4ANJPjcs9uxLL0fHs+9eMVsyg+xDJg6ks9T/Y0lRqxEYrHxDVxel
 5TloeT19O2BN9hLd0NaJJX/QfkBHlWBtRCX56x7dBEM5O8/IeEzmj+tKKNnqm3wrn3Px
 dhue1uw+Nt7N01oFdV0bfrRBg+6k3msBF6ZxN7PN0p8NaYmucUY7Q9vkD2fDBlvPzfQD
 LapQ+9mRpwjcD0KGE1oU7BRNEk7ELoFsWOU0s6V9GQp/F6xyivnClA/SVzRgQMch4Tit
 WTDg==
X-Gm-Message-State: AOAM530D7y94XZlRuG4ZMvzn3JNlo+geKOeN8kZqH9r6WbCiLHyCmOaB
 j5hJmHpj2Wj6G8ZplJw+r5s=
X-Google-Smtp-Source: ABdhPJyyXdjb3N9Ed9Jr705ZzPzIsFRHZUJ+KOYE2dHtjD39JQsr/OWSSeXdN0P7Zob21uOYhbWDdA==
X-Received: by 2002:a2e:9b55:: with SMTP id o21mr306486ljj.141.1635369524980; 
 Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:58 +0300
Message-Id: <20211027211715.12671-29-digetx@gmail.com>
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

Use devm_register_power_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers. It also
provides restart-handler support, i.e. all in one API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/rn5t618.c | 56 ++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 384acb459427..12d7b2339bbe 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -84,9 +84,6 @@ static const struct regmap_irq_chip rc5t619_irq_chip = {
 	.mask_invert = true,
 };
 
-static struct i2c_client *rn5t618_pm_power_off;
-static struct notifier_block rn5t618_restart_handler;
-
 static int rn5t618_irq_init(struct rn5t618 *rn5t618)
 {
 	const struct regmap_irq_chip *irq_chip = NULL;
@@ -115,7 +112,9 @@ static int rn5t618_irq_init(struct rn5t618 *rn5t618)
 	return ret;
 }
 
-static void rn5t618_trigger_poweroff_sequence(bool repower)
+static void
+rn5t618_trigger_poweroff_sequence(struct i2c_client *rn5t618_pm_power_off,
+				  bool repower)
 {
 	int ret;
 
@@ -151,25 +150,31 @@ static void rn5t618_trigger_poweroff_sequence(bool repower)
 	dev_alert(&rn5t618_pm_power_off->dev, "Failed to shutdown (err = %d)\n", ret);
 }
 
-static void rn5t618_power_off(void)
+static void rn5t618_power_off(struct power_off_data *data)
 {
-	rn5t618_trigger_poweroff_sequence(false);
+	struct i2c_client *client = data->cb_data;
+
+	rn5t618_trigger_poweroff_sequence(client, false);
 }
 
-static int rn5t618_restart(struct notifier_block *this,
-			    unsigned long mode, void *cmd)
+static void rn5t618_restart(struct restart_data *data)
 {
-	rn5t618_trigger_poweroff_sequence(true);
+	struct i2c_client *client = data->cb_data;
+
+	rn5t618_trigger_poweroff_sequence(client, true);
 
 	/*
 	 * Re-power factor detection on PMIC side is not instant. 1ms
 	 * proved to be enough time until reset takes effect.
 	 */
 	mdelay(1);
-
-	return NOTIFY_DONE;
 }
 
+static struct power_handler rn5t618_power_handler = {
+	.restart_cb = rn5t618_restart,
+	.restart_priority = RESTART_PRIO_HIGH,
+};
+
 static const struct of_device_id rn5t618_of_match[] = {
 	{ .compatible = "ricoh,rn5t567", .data = (void *)RN5T567 },
 	{ .compatible = "ricoh,rn5t618", .data = (void *)RN5T618 },
@@ -221,38 +226,20 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	rn5t618_pm_power_off = i2c;
-	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
-		if (!pm_power_off)
-			pm_power_off = rn5t618_power_off;
-		else
-			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
-	}
+	if (of_device_is_system_power_controller(i2c->dev.of_node))
+		rn5t618_power_handler.power_off_cb = rn5t618_power_off;
 
-	rn5t618_restart_handler.notifier_call = rn5t618_restart;
-	rn5t618_restart_handler.priority = 192;
+	rn5t618_power_handler.cb_data = i2c;
 
-	ret = register_restart_handler(&rn5t618_restart_handler);
+	ret = devm_register_power_handler(&i2c->dev, &rn5t618_power_handler);
 	if (ret) {
-		dev_err(&i2c->dev, "cannot register restart handler, %d\n", ret);
+		dev_err(&i2c->dev, "failed to register power handler: %d\n", ret);
 		return ret;
 	}
 
 	return rn5t618_irq_init(priv);
 }
 
-static int rn5t618_i2c_remove(struct i2c_client *i2c)
-{
-	if (i2c == rn5t618_pm_power_off) {
-		rn5t618_pm_power_off = NULL;
-		pm_power_off = NULL;
-	}
-
-	unregister_restart_handler(&rn5t618_restart_handler);
-
-	return 0;
-}
-
 static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
@@ -284,7 +271,6 @@ static struct i2c_driver rn5t618_i2c_driver = {
 		.pm = &rn5t618_i2c_dev_pm_ops,
 	},
 	.probe_new = rn5t618_i2c_probe,
-	.remove = rn5t618_i2c_remove,
 };
 
 module_i2c_driver(rn5t618_i2c_driver);
-- 
2.33.1

