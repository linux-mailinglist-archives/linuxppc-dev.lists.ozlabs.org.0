Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E243D74C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfktr43RFz3gCt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:10:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nj5zb43O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nj5zb43O; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQ42FMDz2yMc;
 Thu, 28 Oct 2021 08:18:52 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id bp15so9015045lfb.4;
 Wed, 27 Oct 2021 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umNH2+YT7M6ZKcjQGvjjohnKVEe/3rK29YQH+BDj6i4=;
 b=nj5zb43OqtwdizDOJ4YZ+fYZadM1gdDKmRqYZUCoy6YYJ9FK+h8NFV8Fm4J2Ku+dUO
 VD1iu0fINLYL61cuY7tNDYLtDDcpQWTMBS3LiXmrEVigOlROqEfbjJpsrnK8lw9w6k0A
 Q5RVvk+HURAmLxg4yngnt6lHHBxEc4oSlIcG3ZpIBx+R3YAOuuSSdjMf/vRVMuvqCw1Z
 E8uGSsJkZ6VWq/NOLfLD+OAnXKEDLZsNGIWjcaZrIrkicK6f30puV4871fbRXrX4aoDM
 yS04DJACEKWBr3KF/AjOj2De3JGJ2p+GHt74NSrUBKQDPvr858UletsNh5sICSkmVEWD
 3KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umNH2+YT7M6ZKcjQGvjjohnKVEe/3rK29YQH+BDj6i4=;
 b=KbzDHquHOT+KXB9LpyLrUMFQnWYKdnmsSsWC8oTSoMLtRxi6jmrAIAfjb6uf2Y1k0F
 IGUtwU2637d5mnZo0JZYHU3p5m4/2KQfD/WU4M+5AXpDJXxl+4PKnUn16iWULb/leINK
 KpRkfVx/eFZo36K/39+GKUO3rlopQE8obppEJKGceJ9U9AgxZTp5QlNqFksyILOqs5+p
 y5l9lNI0ai0O0ls6Cxh7MMXgAe0hvm6wC+w93aItkuRtPaPV4dSTHbRMw9HubhNQdMBc
 kzsMdl51v/oVL6Kq/CXRmuT6xueUmAfroWrlxzwI17gGURp0q9ehp/Y/FuOVgrCSR9YO
 gN8Q==
X-Gm-Message-State: AOAM532PkTKSfIpbmCUaJugLvvQfT3FFFaPWiCR76Qe+UHSqh1a1kc1a
 f1N5GeuvZr+ozDF5DEla+fc=
X-Google-Smtp-Source: ABdhPJyzuSZuOYHEQbprBgwtJMyx5L9tc7ERtjIIXrEKG72XHaUi8WMWlLHXLzXgCVfDIwEbrdMbVw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id
 p16mr83922lft.483.1635369528748; 
 Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 30/45] mfd: ene-kb3930: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:17:00 +0300
Message-Id: <20211027211715.12671-31-digetx@gmail.com>
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
 drivers/mfd/ene-kb3930.c | 45 ++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
index 1b73318d1f1f..6a3c5f48e5e1 100644
--- a/drivers/mfd/ene-kb3930.c
+++ b/drivers/mfd/ene-kb3930.c
@@ -31,10 +31,9 @@ struct kb3930 {
 	struct i2c_client *client;
 	struct regmap *ram_regmap;
 	struct gpio_descs *off_gpios;
+	struct power_handler power_handler;
 };
 
-static struct kb3930 *kb3930_power_off;
-
 #define EC_GPIO_WAVE		0
 #define EC_GPIO_OFF_MODE	1
 
@@ -60,21 +59,19 @@ static void kb3930_off(struct kb3930 *ddata, int off_mode)
 	}
 }
 
-static int kb3930_restart(struct notifier_block *this,
-			  unsigned long mode, void *cmd)
+static void kb3930_restart(struct restart_data *data)
 {
-	kb3930_off(kb3930_power_off, EC_OFF_MODE_REBOOT);
-	return NOTIFY_DONE;
+	struct kb3930 *ddata = data->cb_data;
+
+	kb3930_off(ddata, EC_OFF_MODE_REBOOT);
 }
 
-static void kb3930_pm_power_off(void)
+static void kb3930_power_off(struct power_off_data *data)
 {
-	kb3930_off(kb3930_power_off, EC_OFF_MODE_POWER);
-}
+	struct kb3930 *ddata = data->cb_data;
 
-static struct notifier_block kb3930_restart_nb = {
-	.notifier_call = kb3930_restart,
-};
+	kb3930_off(ddata, EC_OFF_MODE_POWER);
+}
 
 static const struct mfd_cell ariel_ec_cells[] = {
 	{ .name = "dell-wyse-ariel-led", },
@@ -131,7 +128,6 @@ static int kb3930_probe(struct i2c_client *client)
 	if (!ddata)
 		return -ENOMEM;
 
-	kb3930_power_off = ddata;
 	ddata->client = client;
 	i2c_set_clientdata(client, ddata);
 
@@ -169,24 +165,14 @@ static int kb3930_probe(struct i2c_client *client)
 	}
 
 	if (ddata->off_gpios) {
-		register_restart_handler(&kb3930_restart_nb);
-		if (!pm_power_off)
-			pm_power_off = kb3930_pm_power_off;
-	}
+		ddata->power_handler.cb_data = ddata;
+		ddata->power_handler.restart_cb = kb3930_restart;
+		ddata->power_handler.power_off_cb = kb3930_power_off;
 
-	return 0;
-}
-
-static int kb3930_remove(struct i2c_client *client)
-{
-	struct kb3930 *ddata = i2c_get_clientdata(client);
-
-	if (ddata->off_gpios) {
-		if (pm_power_off == kb3930_pm_power_off)
-			pm_power_off = NULL;
-		unregister_restart_handler(&kb3930_restart_nb);
+		ret = devm_register_power_handler(dev, &ddata->power_handler);
+		if (ret)
+			return ret;
 	}
-	kb3930_power_off = NULL;
 
 	return 0;
 }
@@ -199,7 +185,6 @@ MODULE_DEVICE_TABLE(of, kb3930_dt_ids);
 
 static struct i2c_driver kb3930_driver = {
 	.probe_new = kb3930_probe,
-	.remove = kb3930_remove,
 	.driver = {
 		.name = "ene-kb3930",
 		.of_match_table = kb3930_dt_ids,
-- 
2.33.1

