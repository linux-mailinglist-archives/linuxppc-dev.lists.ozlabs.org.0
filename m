Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7043D75A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfkxh5P7xz3fJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJbtoAu7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FJbtoAu7; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhQC1F8yz301B;
 Thu, 28 Oct 2021 08:18:59 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id i26so5091058ljg.7;
 Wed, 27 Oct 2021 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
 b=FJbtoAu7rbq7E5RaKvepyk9plUf7jLnT+ML08UZjLgFiOZ5VaykzHp5Ff2lObAbFB8
 5GZGzZ57ZApIGsXSOF6gLQA97YsI0ZAQ/ZGu34m5aZxcCPPjtIEcQp67CojYOup39/Xv
 xsYx/9Bl6pD+/d5Egre5OsJvj19u3KKVwrkexlOW8n23RNvDolWdvTv8CSXdsnambAlA
 jmNsfq7r35M1wkX74Jgv3A3xCPTBUP4sDGuQeSw9FU1X/TxBftWhWMRe81zJ6SuXHAM8
 TvqOPVU0PykNu+1EXPWfVa52MP/IYJ4S57Q0SiUIct4v8BdbY1Ush4O+dDWBQRJUzf+C
 FQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
 b=bO9UnMCM9lZI+HrfB1YCglaadg5yvhC3CATFrzAD3qgXNJOfelXyTE8NqV1/oQ6kSu
 9rn1XRNtgMG0qMgBv80a5k6sYRJdUTPf5an+5YOPsiFv+OMI8SJLBCf+RmV9E0R5h41V
 LHRpcCG00UMWoY0B/ODre065Ut1vL++mkzj/B8ykkovMUCTGJ/afN3y6i8+Gtn9fJkuS
 kbrbjE94JGzZXBfMzkS7lhvabxDbHa+H2BeA7ecXIs3ujQbSLUpjjwue/knezj5+tCup
 QQmMcI51TRlDBItAh3WiJ2BIJqiB8+Rw6aKC1dstWYpRqWO94oCXzeVa/5EGTpCsp6RF
 6LkA==
X-Gm-Message-State: AOAM533xMXjdABvr3URDeh11c/ByvfhdYf3lFIeTIgUoQlXPp1CbJlx2
 peRYO+3Km7V7ToomEUsXDgw=
X-Google-Smtp-Source: ABdhPJwO9DbKrxmMzwfiSQzUITuZHuDXfhRgNgPDDhUghYThRMLe5cQOKy/B7VPBX8OP8l5Jmu7iAw==
X-Received: by 2002:a2e:8097:: with SMTP id i23mr314285ljg.287.1635369536096; 
 Wed, 27 Oct 2021 14:18:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 34/45] mfd: palmas: Use
 devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:04 +0300
Message-Id: <20211027211715.12671-35-digetx@gmail.com>
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
 drivers/mfd/palmas.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index f5b3fa973b13..c7d4d48d2fda 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/err.h>
 #include <linux/mfd/core.h>
@@ -420,12 +421,12 @@ static void palmas_dt_to_pdata(struct i2c_client *i2c,
 			"ti,system-power-controller");
 }
 
-static struct palmas *palmas_dev;
-static void palmas_power_off(void)
+static void palmas_power_off(void *data)
 {
 	unsigned int addr;
 	int ret, slave;
 	u8 powerhold_mask;
+	struct palmas *palmas_dev = data;
 	struct device_node *np = palmas_dev->dev->of_node;
 
 	if (of_property_read_bool(np, "ti,palmas-override-powerhold")) {
@@ -680,12 +681,16 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 	 */
 	if (node) {
 		ret = devm_of_platform_populate(&i2c->dev);
-		if (ret < 0) {
+		if (ret < 0)
+			goto err_irq;
+	}
+
+	if (pdata->pm_off) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     palmas_power_off,
+							     palmas);
+		if (ret)
 			goto err_irq;
-		} else if (pdata->pm_off && !pm_power_off) {
-			palmas_dev = palmas;
-			pm_power_off = palmas_power_off;
-		}
 	}
 
 	return ret;
@@ -712,11 +717,6 @@ static int palmas_i2c_remove(struct i2c_client *i2c)
 			i2c_unregister_device(palmas->i2c_clients[i]);
 	}
 
-	if (palmas == palmas_dev) {
-		pm_power_off = NULL;
-		palmas_dev = NULL;
-	}
-
 	return 0;
 }
 
-- 
2.33.1

