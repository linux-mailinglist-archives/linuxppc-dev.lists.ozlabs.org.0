Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C445F69B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 22:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J17VR078Xz3f4d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 08:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hM1s4tUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hM1s4tUF; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J12dv0pKPz3bjJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 05:02:43 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id c32so26154653lfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfpn4GjmPLTNTnhqDUdqufcuPWBAqiXi1zu9JyEbhbk=;
 b=hM1s4tUFR2RGbsehgNeqtlhz2+IbxDI+2lgWQ8ES3LNgRGz/xAjj/h4Ls78EguPH/x
 sj7Z21CprUcfG5nn8EoF76kwSSviG4smz0l8jFTC5BNvXZgtHgEQdplwK2Fxu0Rqh/E1
 V8FZwbMQTWONCOdG4xwI7vqVS53GtktaEtL51GQTXOjqVVA61Zv3O3fJazEkmisty4dp
 3Gk1E0pE7TsZG89FhO0GxGmj2ZIqTcqAQ5mRcksE+hdRm8RCAhjGC808RLqeD5UK/BGQ
 4LaXFxReB71FMum+f5Mzo+W8EYR67BV8ZDbCd6lIgSah1PfOKwknzP5/AHemBn7NftRd
 E7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfpn4GjmPLTNTnhqDUdqufcuPWBAqiXi1zu9JyEbhbk=;
 b=1iw/1txqbA7wQoDBeNAOFbrgqtESTGg5csi5KZHLFJFhSh20ZZ/6aZQgayAUF6mNe4
 kYT/f23f4hs+j017821NGsrGMf5vgHR2ovNAbiFCbW9+P5g336dUFCkuDpKDEcq+d7dq
 ArFr7AmYqiGWTmWuZeXoB/2RC63jHf/+1V3IrvC3iuaDMSM6wLs5c7xwkk6B2a3oT0Lw
 0QSS4x172rVilb6jVcOwkPg0qEG5V8x4fFtO3a2U+/YWzhSpbZm7nz72tmNeCGttlyr+
 r3nZQf899GFdLnIT373wAO/rWTtQtoXihXnS2HjbWD49JYBrY6m8RK66MNBPYhB9hO7X
 hWWA==
X-Gm-Message-State: AOAM531q2brATP7ZWFA89SeduGPtD7X9kdjlpb+IlDGnFpo13UVdR4EY
 mhO4WzS9w3yzfUeb9ahY/CU=
X-Google-Smtp-Source: ABdhPJw1NC54RekxTj6U8kHZQHuUa8jaXts7kQjnorzXxbujNyJ8o0PtYTEAbdf23H0ZlL8y0CUSiA==
X-Received: by 2002:a05:6512:22d3:: with SMTP id
 g19mr30076146lfu.404.1637949759926; 
 Fri, 26 Nov 2021 10:02:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:39 -0800 (PST)
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
Subject: [PATCH v4 23/25] ACPI: power: Switch to sys-off handler API
Date: Fri, 26 Nov 2021 21:00:59 +0300
Message-Id: <20211126180101.27818-24-digetx@gmail.com>
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

Switch to sys-off API that replaces legacy pm_power_off callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/acpi/sleep.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index eaa47753b758..2e613fddd614 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -47,19 +47,11 @@ static void acpi_sleep_tts_switch(u32 acpi_state)
 	}
 }
 
-static int tts_notify_reboot(struct notifier_block *this,
-			unsigned long code, void *x)
+static void tts_reboot_prepare(struct reboot_prep_data *data)
 {
 	acpi_sleep_tts_switch(ACPI_STATE_S5);
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block tts_notifier = {
-	.notifier_call	= tts_notify_reboot,
-	.next		= NULL,
-	.priority	= 0,
-};
-
 static int acpi_sleep_prepare(u32 acpi_state)
 {
 #ifdef CONFIG_ACPI_SLEEP
@@ -1020,7 +1012,7 @@ static void acpi_sleep_hibernate_setup(void)
 static inline void acpi_sleep_hibernate_setup(void) {}
 #endif /* !CONFIG_HIBERNATION */
 
-static void acpi_power_off_prepare(void)
+static void acpi_power_off_prepare(struct power_off_prep_data *data)
 {
 	/* Prepare to power off the system */
 	acpi_sleep_prepare(ACPI_STATE_S5);
@@ -1028,7 +1020,7 @@ static void acpi_power_off_prepare(void)
 	acpi_os_wait_events_complete();
 }
 
-static void acpi_power_off(void)
+static void acpi_power_off(struct power_off_data *data)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
 	pr_debug("%s called\n", __func__);
@@ -1036,6 +1028,11 @@ static void acpi_power_off(void)
 	acpi_enter_sleep_state(ACPI_STATE_S5);
 }
 
+static struct sys_off_handler acpi_sys_off_handler = {
+	.power_off_priority = POWEROFF_PRIO_FIRMWARE,
+	.reboot_prepare_cb = tts_reboot_prepare,
+};
+
 int __init acpi_sleep_init(void)
 {
 	char supported[ACPI_S_STATE_COUNT * 3 + 1];
@@ -1052,8 +1049,8 @@ int __init acpi_sleep_init(void)
 
 	if (acpi_sleep_state_supported(ACPI_STATE_S5)) {
 		sleep_states[ACPI_STATE_S5] = 1;
-		pm_power_off_prepare = acpi_power_off_prepare;
-		pm_power_off = acpi_power_off;
+		acpi_sys_off_handler.power_off_cb = acpi_power_off;
+		acpi_sys_off_handler.power_off_prepare_cb = acpi_power_off_prepare;
 	} else {
 		acpi_no_s5 = true;
 	}
@@ -1069,6 +1066,6 @@ int __init acpi_sleep_init(void)
 	 * Register the tts_notifier to reboot notifier list so that the _TTS
 	 * object can also be evaluated when the system enters S5.
 	 */
-	register_reboot_notifier(&tts_notifier);
+	register_sys_off_handler(&acpi_sys_off_handler);
 	return 0;
 }
-- 
2.33.1

