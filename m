Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7643D748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfkt81YLCz3f8G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:09:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IWwdEP2z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IWwdEP2z; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQ16lFJz2yHW;
 Thu, 28 Oct 2021 08:18:49 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id u11so9041843lfs.1;
 Wed, 27 Oct 2021 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VpMTaQaJ0cjNLgvNqh3di7liIGTew7KcJqDZRitT+Gs=;
 b=IWwdEP2zbLaLlU4mCU5s8PpqrkaIWlck+oA3xnCuAzsOirLY91m5COquObIzRO/SOa
 ZZIFcDLGTP22p0/7Hcw3xr55ftJZWhQ4nU6sBNGCfWjV2gTeJrHUPc9jLo/fr5xO0l0l
 0SNS1n6R63fMlbNJFT3gbKkQCc0Ia7/EAvKfYLtASP95KzfXrWNNTSb1yRqxn8x5d6xD
 hciHreIyBYgx6dcdUlzTSBb07ys9RFpq3Y5/l5Vd2vvkqxnAXOO/WD9ek4xsO4aDTsfM
 H41ne9Olkj2NqvJkNPysdfnoteByPeCFY3T52VBJFYJ9FKDG6+cEspYVw2UY7y4ppIDD
 pOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpMTaQaJ0cjNLgvNqh3di7liIGTew7KcJqDZRitT+Gs=;
 b=QtFHDBkSHYl89FcfErk7tR4OfMveW3LubeP5vzU+AGokqQfuSJPK/NX0S8JiSFcTyV
 xqTcQtZzNY0K0uy/vB+U3zKqpq0mkekCXv2Duuh/D8a8Rd+V1k1LFn8sXpPyNtZhY12T
 9cbX9q24/0CqW3IeMxg81nr7q5SEMEXQqPsjkCIMnc3p9rXhTw+iPvnAp4zhQzrOuTB9
 n8kCB0ueuLHtEqwl+8aZeanYXppE9JyT7MvhP8nK9AXZysP+aAa+M8jSU8Uw+KjDorXX
 YnsaQ2lm4toYdWMNsDqARe+tZtd99oz8I66UOF8pOazKYuqK5O3xMU5Ujjjg0W+a9OvG
 uXfQ==
X-Gm-Message-State: AOAM5330fZKnh+ieCckVIjjyOE5Qxsg9upPsH4tQyItN2ELlfXx6MSyX
 KwUdnfBvNicHTEbxmaxyXTe0rK+vRmQ=
X-Google-Smtp-Source: ABdhPJys0u/+wFsWDr/9j4b/C5x8WEos0EuABuOI0MYqETh3mbRQO/mjL91g1gnGx/4TO6/Fje2n8g==
X-Received: by 2002:ac2:4c9a:: with SMTP id d26mr128014lfl.344.1635369526848; 
 Wed, 27 Oct 2021 14:18:46 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 29/45] mfd: acer-a500: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:59 +0300
Message-Id: <20211027211715.12671-30-digetx@gmail.com>
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
 drivers/mfd/acer-ec-a500.c | 52 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/acer-ec-a500.c b/drivers/mfd/acer-ec-a500.c
index 80c2fdd14fc4..fc864abc0049 100644
--- a/drivers/mfd/acer-ec-a500.c
+++ b/drivers/mfd/acer-ec-a500.c
@@ -31,8 +31,6 @@ enum {
 	REG_COLD_REBOOT = 0x55,
 };
 
-static struct i2c_client *a500_ec_client_pm_off;
-
 static int a500_ec_read(void *context, const void *reg_buf, size_t reg_size,
 			void *val_buf, size_t val_sizel)
 {
@@ -104,32 +102,35 @@ static const struct regmap_bus a500_ec_regmap_bus = {
 	.max_raw_read = 2,
 };
 
-static void a500_ec_poweroff(void)
+static void a500_ec_power_off_handler(struct power_off_data *data)
 {
-	i2c_smbus_write_word_data(a500_ec_client_pm_off,
-				  REG_SHUTDOWN, CMD_SHUTDOWN);
+	struct i2c_client *client = data->cb_data;
+
+	i2c_smbus_write_word_data(client, REG_SHUTDOWN, CMD_SHUTDOWN);
 
 	mdelay(A500_EC_POWER_CMD_TIMEOUT);
 }
 
-static int a500_ec_restart_notify(struct notifier_block *this,
-				  unsigned long reboot_mode, void *data)
+static void a500_ec_restart_handler(struct restart_data *data)
 {
-	if (reboot_mode == REBOOT_WARM)
-		i2c_smbus_write_word_data(a500_ec_client_pm_off,
+	struct i2c_client *client = data->cb_data;
+
+	if (data->mode == REBOOT_WARM)
+		i2c_smbus_write_word_data(client,
 					  REG_WARM_REBOOT, CMD_WARM_REBOOT);
 	else
-		i2c_smbus_write_word_data(a500_ec_client_pm_off,
+		i2c_smbus_write_word_data(client,
 					  REG_COLD_REBOOT, CMD_COLD_REBOOT);
 
 	mdelay(A500_EC_POWER_CMD_TIMEOUT);
-
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block a500_ec_restart_handler = {
-	.notifier_call = a500_ec_restart_notify,
-	.priority = 200,
+static struct power_handler a500_ec_power_handler = {
+	.restart_cb = a500_ec_restart_handler,
+	.restart_priority = RESTART_PRIO_HIGH,
+
+	.power_off_cb = a500_ec_power_off_handler,
+	.power_off_priority = POWEROFF_PRIO_HIGH,
 };
 
 static const struct mfd_cell a500_ec_cells[] = {
@@ -156,26 +157,12 @@ static int a500_ec_probe(struct i2c_client *client)
 	}
 
 	if (of_device_is_system_power_controller(client->dev.of_node)) {
-		a500_ec_client_pm_off = client;
+		a500_ec_power_handler.cb_data = client;
 
-		err = register_restart_handler(&a500_ec_restart_handler);
+		err = devm_register_power_handler(&client->dev,
+						  &a500_ec_power_handler);
 		if (err)
 			return err;
-
-		if (!pm_power_off)
-			pm_power_off = a500_ec_poweroff;
-	}
-
-	return 0;
-}
-
-static int a500_ec_remove(struct i2c_client *client)
-{
-	if (of_device_is_system_power_controller(client->dev.of_node)) {
-		if (pm_power_off == a500_ec_poweroff)
-			pm_power_off = NULL;
-
-		unregister_restart_handler(&a500_ec_restart_handler);
 	}
 
 	return 0;
@@ -193,7 +180,6 @@ static struct i2c_driver a500_ec_driver = {
 		.of_match_table = a500_ec_match,
 	},
 	.probe_new = a500_ec_probe,
-	.remove = a500_ec_remove,
 };
 module_i2c_driver(a500_ec_driver);
 
-- 
2.33.1

