Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529043D738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfkrk2SNRz3g2G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:08:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z3brf9Hx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z3brf9Hx; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhPy1gW1z3096;
 Thu, 28 Oct 2021 08:18:46 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id bq11so8956403lfb.10;
 Wed, 27 Oct 2021 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C0CUDQ/mpKr8nQVI8ALn1ZNGlMYg+VmEWd/lyCBC2+I=;
 b=Z3brf9Hxnc2b6ua3/QaRBg13ceKk9pypP3vq3e3axfEBPvBW41vI/qfBl8+BwawzwO
 NlHu2lL93XTrvXoS8prTqJO+oc3t3LVioKZpz1/2twqHxmO2Rep4n956JPepAb55tnvu
 Yq8u1nymmyHqcHNTOwToESfBr2ALI5JLRcu8Vew43TUipSvAyYGlhtxcdEE10JjxQ8L7
 CgvM26J/cz900816o54jCXMSmEWOFUvtpqIxxDad09smC+hGdBM0SBN82Upy8AJEypnh
 RA0SpOKKidR5e2HsVPYqqyxDECtb4bl9tRIXX4QIA46Li7tlvPD9rk0WAJDNE7RcwF/Y
 YL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C0CUDQ/mpKr8nQVI8ALn1ZNGlMYg+VmEWd/lyCBC2+I=;
 b=wSr8k4BGQnyJ4gygiz8+AGHC6L40XT22neOtOCx15AP8ZCwqKyZmfVBErTPQDLRyOs
 3gDuNgb+TN2EHY4cNWjsHb5Z63Z1WsG5dyy2+VsfL3fNDZMBgz4fpGekUj6I3K0J8myr
 SXDVq0SSwlc3WmajTCmWs3AbxDzHig0xk3ARChP0m6wwqERFuDuFdIn/5iiqc+64oaRO
 80tuLUdXlMlb0gnWD3SeG3WDsioFo0K+pd1tHdFcriztW4Q7RCge+fFJBYdyvzAkouIC
 kOoifiNemi3quuu6BIyl2CpiFZ+NMfsLzN28/D4QvQzkqSoY04BbDzFO5/7ClTDk/5YU
 70XA==
X-Gm-Message-State: AOAM531X7NqX83WRW+nncDvSIt6g13YKryPY8PxkmnEgyM3WbKlqSJKS
 bdUk5e7SbPyN6VG3C7gb2Dg=
X-Google-Smtp-Source: ABdhPJw9ag+XL4jMbHM8NK1hhlQp61Q60DmRHFpovh5w79ZSq7lT/XD7C7FFPkBUSvk0m7mbQoA/BQ==
X-Received: by 2002:a05:6512:31a:: with SMTP id
 t26mr125024lfp.280.1635369523122; 
 Wed, 27 Oct 2021 14:18:43 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:42 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:57 +0300
Message-Id: <20211027211715.12671-28-digetx@gmail.com>
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
 drivers/mfd/ntxec.c | 50 ++++++++++-----------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
index b711e73eedcb..fd6410cbe153 100644
--- a/drivers/mfd/ntxec.c
+++ b/drivers/mfd/ntxec.c
@@ -32,12 +32,11 @@
 #define NTXEC_POWERKEEP_VALUE	0x0800
 #define NTXEC_RESET_VALUE	0xff00
 
-static struct i2c_client *poweroff_restart_client;
-
-static void ntxec_poweroff(void)
+static void ntxec_poweroff(struct power_off_data *data)
 {
 	int res;
 	u8 buf[3] = { NTXEC_REG_POWEROFF };
+	struct i2c_client *poweroff_restart_client = data->cb_data;
 	struct i2c_msg msgs[] = {
 		{
 			.addr = poweroff_restart_client->addr,
@@ -62,8 +61,7 @@ static void ntxec_poweroff(void)
 	msleep(5000);
 }
 
-static int ntxec_restart(struct notifier_block *nb,
-			 unsigned long action, void *data)
+static void ntxec_restart(struct restart_data *data)
 {
 	int res;
 	u8 buf[3] = { NTXEC_REG_RESET };
@@ -72,6 +70,7 @@ static int ntxec_restart(struct notifier_block *nb,
 	 * it causes an I2C error. (The reset handler in the downstream driver
 	 * does send the full two-byte value, but doesn't check the result).
 	 */
+	struct i2c_client *poweroff_restart_client = data->cb_data;
 	struct i2c_msg msgs[] = {
 		{
 			.addr = poweroff_restart_client->addr,
@@ -87,13 +86,11 @@ static int ntxec_restart(struct notifier_block *nb,
 	if (res < 0)
 		dev_warn(&poweroff_restart_client->dev,
 			 "Failed to restart (err = %d)\n", res);
-
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block ntxec_restart_handler = {
-	.notifier_call = ntxec_restart,
-	.priority = 128,
+static struct power_handler ntxec_power_handler = {
+	.restart_cb = ntxec_restart,
+	.power_off_cb = ntxec_poweroff,
 };
 
 static int regmap_ignore_write(void *context,
@@ -208,25 +205,12 @@ static int ntxec_probe(struct i2c_client *client)
 		if (res < 0)
 			return res;
 
-		if (poweroff_restart_client)
-			/*
-			 * Another instance of the driver already took
-			 * poweroff/restart duties.
-			 */
-			dev_err(ec->dev, "poweroff_restart_client already assigned\n");
-		else
-			poweroff_restart_client = client;
-
-		if (pm_power_off)
-			/* Another driver already registered a poweroff handler. */
-			dev_err(ec->dev, "pm_power_off already assigned\n");
-		else
-			pm_power_off = ntxec_poweroff;
-
-		res = register_restart_handler(&ntxec_restart_handler);
+		ntxec_power_handler.cb_data = client;
+
+		res = devm_register_power_handler(ec->dev, &ntxec_power_handler);
 		if (res)
 			dev_err(ec->dev,
-				"Failed to register restart handler: %d\n", res);
+				"Failed to register power handler: %d\n", res);
 	}
 
 	i2c_set_clientdata(client, ec);
@@ -239,17 +223,6 @@ static int ntxec_probe(struct i2c_client *client)
 	return res;
 }
 
-static int ntxec_remove(struct i2c_client *client)
-{
-	if (client == poweroff_restart_client) {
-		poweroff_restart_client = NULL;
-		pm_power_off = NULL;
-		unregister_restart_handler(&ntxec_restart_handler);
-	}
-
-	return 0;
-}
-
 static const struct of_device_id of_ntxec_match_table[] = {
 	{ .compatible = "netronix,ntxec", },
 	{}
@@ -262,7 +235,6 @@ static struct i2c_driver ntxec_driver = {
 		.of_match_table = of_ntxec_match_table,
 	},
 	.probe_new = ntxec_probe,
-	.remove = ntxec_remove,
 };
 module_i2c_driver(ntxec_driver);
 
-- 
2.33.1

