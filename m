Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7F43D734
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfkr05VHrz3fy0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:08:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cr3OoRz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cr3OoRz9; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhPw2rBQz3096;
 Thu, 28 Oct 2021 08:18:44 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id j2so9015880lfg.3;
 Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcl172dtfGlkf1TcslUPgwMlkZWwlYhkCJ06Bxg/bBU=;
 b=cr3OoRz90WYilQxW+1X5mebi5NSQ3xkQzRtxCrXFmhmNlKVd4Mk6BghlahMCy7Iyto
 a4UuDalJ4f78KLT3HAaBh5614BnSWOH/t9zbr0YPxrmg6/JuWnf5dAnKZsc2b4GAIVeJ
 9uKqX2hlny1afoYheoedvOJbugyMQlznsmVrZlOSaKsdu2draZ6B8WFqE5e4JBYGYqhC
 KXF/Z/WyDDccTQoDfFgyc6FoM2LFPomJZ3hRr6/JbV3znQY16GvUC7Q6Zprq2NGBD3P+
 O43c0LmvrM3DBmK/z7V4e9Zq9h2WiaNFgKFrXs2jyu8jI7tMHdmmNyPNNNQGazHFhhOk
 f27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcl172dtfGlkf1TcslUPgwMlkZWwlYhkCJ06Bxg/bBU=;
 b=cGcaQ0/XnQyekbjOYUDvuZKgesCU7WNhvFIXJZRrny6hAJ7GEIWdHpACGHXVPtxsF6
 +ONAwX0frQca6x6IpTuglLqiMRvBqWQeslTf5QfOJaqrYdwbiKasuBUOcdinrIW3dZtJ
 C9LFd/OlnPXwNmMUzRATaWasbea85GXEemXw5qT7v6JtcIGXG5ro1WtUlRQv8+V3vdY2
 duOou6B9WIEpJU02Y8rfUZAK2otnDr95JKT18AEJ4bVjpudX3rJ0pjX81HdYixYxWXnG
 rjivDa9H/nlDoclvxgeyuujb8cv9jWb8DovAbupy3+GGy6hqbcMiQOYPM/UNk/P8ekiH
 uSaQ==
X-Gm-Message-State: AOAM5333XW5lbs0mSXEgZZsyzkIeLkITlP0+cwY76rXYvKocK1+Y+Sj7
 vn+guavVz3CLnslhefxlakA=
X-Google-Smtp-Source: ABdhPJwc0gXcQNbXi4wauxJdUJOzB/R/HFQ4KaA94+CkBW5unEGwAKJM6qsNc2djNTohX6NYEK5drA==
X-Received: by 2002:a05:6512:3ca3:: with SMTP id
 h35mr145327lfv.128.1635369521305; 
 Wed, 27 Oct 2021 14:18:41 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 26/45] soc/tegra: pmc: Utilize power-handler API to power
 off Nexus 7 properly
Date: Thu, 28 Oct 2021 00:16:56 +0300
Message-Id: <20211027211715.12671-27-digetx@gmail.com>
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

Nexus 7 Android tablet can be turned off using a special bootloader
command which is conveyed to bootloader by putting magic value into
specific scratch register and then rebooting normally. This power-off
method should be invoked if USB cable is connected. Bootloader then will
display battery status and power off the device. This behaviour is
borrowed from downstream kernel and matches user expectations, otherwise
it looks like device got hung during power-off and it may wake up on
USB disconnect.

Switch PMC driver to power-handler API, which provides drivers with
combined power-off+restart call chains functionality, replacing the
restart-only call chain API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 54 +++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 575d6d5b4294..a01330099e1a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -39,6 +39,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
+#include <linux/power_supply.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -107,6 +108,7 @@
 #define PMC_USB_DEBOUNCE_DEL		0xec
 #define PMC_USB_AO			0xf0
 
+#define PMC_SCRATCH37			0x130
 #define PMC_SCRATCH41			0x140
 
 #define PMC_WAKE2_MASK			0x160
@@ -1064,10 +1066,8 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 	return tegra_powergate_remove_clamping(id);
 }
 
-static int tegra_pmc_restart_notify(struct notifier_block *this,
-				    unsigned long action, void *data)
+static void tegra_pmc_restart(const char *cmd)
 {
-	const char *cmd = data;
 	u32 value;
 
 	value = tegra_pmc_scratch_readl(pmc, pmc->soc->regs->scratch0);
@@ -1090,13 +1090,33 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_MAIN_RST;
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+}
 
-	return NOTIFY_DONE;
+static void tegra_pmc_restart_handler(struct restart_data *data)
+{
+	tegra_pmc_restart(data->cmd);
 }
 
-static struct notifier_block tegra_pmc_restart_handler = {
-	.notifier_call = tegra_pmc_restart_notify,
-	.priority = 128,
+static void tegra_pmc_power_off_handler(struct power_off_data *data)
+{
+	/*
+	 * Reboot Nexus 7 into special bootloader mode if USB cable is
+	 * connected in order to display battery status and power off.
+	 */
+	if (of_machine_is_compatible("asus,grouper") &&
+	    power_supply_is_system_supplied()) {
+		const u32 go_to_charger_mode = 0xa5a55a5a;
+
+		tegra_pmc_writel(pmc, go_to_charger_mode, PMC_SCRATCH37);
+		tegra_pmc_restart(NULL);
+	}
+}
+
+static struct power_handler tegra_pmc_power_handler = {
+	.restart_cb = tegra_pmc_restart_handler,
+	.power_off_cb = tegra_pmc_power_off_handler,
+	.power_off_priority = POWEROFF_PRIO_FIRMWARE,
+	.power_off_chaining_allowed = true,
 };
 
 static int powergate_show(struct seq_file *s, void *data)
@@ -2859,6 +2879,13 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		pmc->clk = NULL;
 	}
 
+	err = devm_register_power_handler(&pdev->dev, &tegra_pmc_power_handler);
+	if (err) {
+		dev_err(&pdev->dev, "unable to register power handler, %d\n",
+			err);
+		return err;
+	}
+
 	/*
 	 * PCLK clock rate can't be retrieved using CLK API because it
 	 * causes lockup if CPU enters LP2 idle state from some other
@@ -2890,20 +2917,13 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 			goto cleanup_sysfs;
 	}
 
-	err = register_restart_handler(&tegra_pmc_restart_handler);
-	if (err) {
-		dev_err(&pdev->dev, "unable to register restart handler, %d\n",
-			err);
-		goto cleanup_debugfs;
-	}
-
 	err = tegra_pmc_pinctrl_init(pmc);
 	if (err)
-		goto cleanup_restart_handler;
+		goto cleanup_debugfs;
 
 	err = tegra_pmc_regmap_init(pmc);
 	if (err < 0)
-		goto cleanup_restart_handler;
+		goto cleanup_debugfs;
 
 	err = tegra_powergate_init(pmc, pdev->dev.of_node);
 	if (err < 0)
@@ -2926,8 +2946,6 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 cleanup_powergates:
 	tegra_powergate_remove_all(pdev->dev.of_node);
-cleanup_restart_handler:
-	unregister_restart_handler(&tegra_pmc_restart_handler);
 cleanup_debugfs:
 	debugfs_remove(pmc->debugfs);
 cleanup_sysfs:
-- 
2.33.1

