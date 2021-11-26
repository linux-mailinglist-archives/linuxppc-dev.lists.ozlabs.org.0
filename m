Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA245F676
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 22:30:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J17FB6wMBz3cll
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 08:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d2rBY2F8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d2rBY2F8; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J12d772rrz30J5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 05:02:03 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id l22so26083853lfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xS83fHvJX20ICn8zHYRDKvqQ1GY72vd2riIHxwkjweU=;
 b=d2rBY2F8FZR6fxo+AWivP8d/aANzXuwHT+cg69g6mn5w1PrR2Sa1IDulp20ge0kF/A
 cHnbxdSmlImW4wjqRz81zw3X1kevspbs+ZSvuFeqFssl7QkZMhAYxFVlnhJC7t+o5Ekh
 eNtRL2ojA7gJWr57oxbZKqm22O40Yv/rsDGA/NeWMpTdjAZIOo1PA/WaWBgnC2ALY5RA
 62bhQhoX5OCa7ZShxw0qrygSKSdJKJGDVnCPcPOzYsdIdpEoCBnHtdYY6e8ZoWq4VDFh
 N3S4qSVEELp33r/g+I5VvFht9D09Xj+u4OjF/0z+Ek8MwK4vNOYgNJskWndj6bmjKPsl
 6oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xS83fHvJX20ICn8zHYRDKvqQ1GY72vd2riIHxwkjweU=;
 b=XFbspPsMWeDDTPh6w1F/kwerkvyUlflZD5S1OX7J3FTWNvKySE1Dk5cEzi5uSXgJ6i
 /ETYpIPOr0pjOqbvHrPHFEtYcG/uvYxcFxmp35HwIDsRrhGo76hfHRwRw67hpNAQzgBj
 v3tgSdOkHgLuIRBWtUp9yTx/NZyym0KA8l4+WHyJi8K4h1V1dtF7Wz8MGvYCh8wznXgm
 FmMK7ycR8SNi/RlvaJDw59m/K15tUN+m8UaSZcyG8ZeWKZ/+R/UAfyB2zT+ZXBku4NuA
 LBFDgriUK5NUv5MhmX9AdvrPrGEKT1AgW7mj1/a2kYInlnxtLkeahGBSkpxYwcMGVdBG
 dJLw==
X-Gm-Message-State: AOAM530g3/0jFwU4ZQTlLVMBKG5wwQReGvRJ27/zZAFJmzz80ogs+PGD
 FLuiv2kf3210JOhw5/Uj1PE=
X-Google-Smtp-Source: ABdhPJyHlWHAIH2qsXkt3ruT7+BLFA3v5nYyOKPdcFWdHrRv9Oght1lKgGW/OoNNNMfJWGOCYURP8w==
X-Received: by 2002:a05:6512:32ca:: with SMTP id
 f10mr32489980lfg.364.1637949720361; 
 Fri, 26 Nov 2021 10:02:00 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:01:59 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Subject: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
Date: Fri, 26 Nov 2021 21:00:41 +0300
Message-Id: <20211126180101.27818-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 27 Nov 2021 08:26:31 +1100
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add sanity check which ensures that there are no two restart handlers
registered with the same priority. Normally it's a direct sign of a
problem if two handlers use the same priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..e6659ae329f1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,7 +182,20 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_register(&restart_handler_list, nb);
+	int ret;
+
+	ret = atomic_notifier_chain_register(&restart_handler_list, nb);
+	if (ret)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 */
+	WARN(!atomic_notifier_has_unique_priority(&restart_handler_list, nb),
+	     "restart handler must have unique priority\n");
+
+	return 0;
 }
 EXPORT_SYMBOL(register_restart_handler);
 
-- 
2.33.1

