Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021A43D764
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfl1F1gGXz3dr7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:16:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TlGsLZtc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TlGsLZtc; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQN2sGSz3bXv;
 Thu, 28 Oct 2021 08:19:08 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id u5so6968007ljo.8;
 Wed, 27 Oct 2021 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
 b=TlGsLZtcrVzUb7sAOhif3p7pVw8LafC2xLy1EDPy1NIwJl5MQQvmHy2JQZYszcOE8Z
 bpdCDmyEM5D03Couzbs3VVZUIdamWSCPF0yzl5vvizBqtDssLI1790jRM+TPIcawNrlD
 8STEeq0OEOHvy2rX7OXiOWUq9V+Wbq3xZg3vhjF/dealnvdRkEuGDx5b0mmtoBXsa4Tg
 7gFUHQvvLRw3QjAUV5dCuqij4emeiEy4r7tFICkEZrQaaXXABdfN2M8h/mxrxQbImqYG
 GaGzMOCXHjG+QuAc4Dq0gK0PotuHucIYhVqvi35iVuJc+hGZhg1h00rdw0kra8k/EpLO
 luJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
 b=x/i60N2Ub75A2VthO8+wkvj3upfyxcYQu6ODflL0gD7QVFQmeFwFgK1uHBLz1nx2WH
 rZYdI2fDZq0ImfmJStBVQ+OsuJQ3xabwI648xkXEVZOtA4njvgB36gvFOy8o6R3Ej9nW
 DTStP9hQVgsRMgZMay2V7wb92CQu2tJWDR5LuVa4g3V79kl7jpW8obSJUpJmKl8mG2X6
 0quuwIB4bDvKxuVN+oHVeP4FS19ipm/tVOqnKDvIiygsZ1lr9COovw7d+oc7z9xAo+FP
 Mzn954cqehPvaqj1GWLF9k2nymlk/0ojmy+PW08G++DUpIA93l4wwfbCtFHNawWV+5n+
 mCpQ==
X-Gm-Message-State: AOAM5314lytw9+4FuSUfP25tcrj8xo+I3NElYli3zyFB/i4H9+rzDRwC
 Gp7u4Jp2QH58KrwbvTf6dFM=
X-Google-Smtp-Source: ABdhPJzDbMhKltt/cJ4cLHVC7lvSJKFFWBp4i2pL/KBXA4D8sI4Ihh3wNKVdm9xKvnEcHeY8d+ELCw==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr336408ljl.522.1635369545290;
 Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 39/45] mfd: dm355evm_msp: Use
 devm_register_trivial_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:09 +0300
Message-Id: <20211027211715.12671-40-digetx@gmail.com>
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

Use devm_register_trivial_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/dm355evm_msp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 54fb6cbd2aa0..5ee830f65589 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/err.h>
@@ -375,11 +376,10 @@ static void dm355evm_power_off(void)
 	dm355evm_command(MSP_COMMAND_POWEROFF);
 }
 
-static int dm355evm_msp_remove(struct i2c_client *client)
+static void dm355evm_msp_remove(void *data)
 {
-	pm_power_off = NULL;
+	/* FIXME remove children ... */
 	msp430 = NULL;
-	return 0;
 }
 
 static int
@@ -392,6 +392,11 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -EBUSY;
 	msp430 = client;
 
+	status = devm_add_action_or_reset(&client->dev, dm355evm_msp_remove,
+					  NULL);
+	if (status < 0)
+		goto fail;
+
 	/* display revision status; doubles as sanity check */
 	status = dm355evm_msp_read(DM355EVM_MSP_FIRMREV);
 	if (status < 0)
@@ -416,13 +421,15 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto fail;
 
 	/* PM hookup */
-	pm_power_off = dm355evm_power_off;
+	status = devm_register_trivial_power_off_handler(&client->dev,
+							 dm355evm_power_off);
+	if (status)
+		dev_err(&client->dev, "failed to register power-off handler: %d",
+			status);
 
 	return 0;
 
 fail:
-	/* FIXME remove children ... */
-	dm355evm_msp_remove(client);
 	return status;
 }
 
@@ -436,7 +443,6 @@ static struct i2c_driver dm355evm_msp_driver = {
 	.driver.name	= "dm355evm_msp",
 	.id_table	= dm355evm_msp_ids,
 	.probe		= dm355evm_msp_probe,
-	.remove		= dm355evm_msp_remove,
 };
 
 static int __init dm355evm_msp_init(void)
-- 
2.33.1

