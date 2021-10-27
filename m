Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D119A43D722
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:04:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkmQ520Zz3ffl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 10:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y3ajD9hS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y3ajD9hS; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhPl178nz304v;
 Thu, 28 Oct 2021 08:18:35 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id bi35so8958335lfb.9;
 Wed, 27 Oct 2021 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guWA5fFZeGPtiBZOYoQcCwu2VFdVsVhLW9/JhrymZ0g=;
 b=Y3ajD9hSFiO6I4QqBgfg35JQ5CG9aR8SawQdCZ/PvBPpTrKpea4VQPEYGG2e2LlPNw
 INBF/7ltt3G3417Dh9CdQfPTHSkRg6FMpjv8P1ntJFwpZqSV1uSTE4GmrYnNoXeajbha
 R/xICM0awt4oVDfnXFmFRQIZuNOfUQCww36nBDR3iRSiJcFpUgR7ytoBp8ilJAXX1BoV
 q3WrRdzyqUShxUhnVnyU+VPDZDBm93MNtu5SNFBPibM7EM2q+6x7IVUVp7KS5HkYIUo5
 6/azutWfWLEZTqcTTzvxBwc0sMsrgJicmN8uMy0n0bR+IWtSXzppNigQSpvDusN76BYk
 OmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guWA5fFZeGPtiBZOYoQcCwu2VFdVsVhLW9/JhrymZ0g=;
 b=DdTTsRfiHDBnTj0I3r+Zv3HjkD/zyNaAYSXmNknnYW8f6DslRglvHwQpsD5whskRdv
 D8KaSrbnSa+1BHxZTzPSiAgMiDZJWw1BTljIgULbeBTnJzbq06HEmSHTUPYqWUF6Q/Ln
 JV4yLJyU2S0WUU8I5ZDbK9rL4HNW9AXpm6y0vA/qHR33U9WVJC5U4IU0gBk8gvqXKPNq
 6bDJQ+m7DX7gQ9fCFHwKElrRAyz29YZ+CanOof5Idm+RCgADwWBoVvEfNC53Mg+5Z9l2
 RKVqHgRn6e6DEV+XuLMAaudDa/noLa/KKikwvUAC0pqxewSJV/+/djv7lP8AxDsUE+yo
 dmjA==
X-Gm-Message-State: AOAM533aIarXaeROy4QSiDhnJHufMtk1HSQ9KLPd7g37ys4ZI15ae17U
 ZqmRJCNY1dpks+EEGWjE+sY=
X-Google-Smtp-Source: ABdhPJw9hBA3rUBC1cmHCV5isZVZ9pveXdrJpcvckt2xCHU4v9xkBuaEqDJVomXcVNELr8shz4+44g==
X-Received: by 2002:a05:6512:324d:: with SMTP id
 c13mr91026lfr.349.1635369512043; 
 Wed, 27 Oct 2021 14:18:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 21/45] m68k: Switch to new power-handler API
Date: Thu, 28 Oct 2021 00:16:51 +0300
Message-Id: <20211027211715.12671-22-digetx@gmail.com>
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

Kernel now supports chained power-off handlers. Use
register_power_off_handler() that registers power-off handlers and
do_kernel_power_off() that invokes chained power-off handlers. Legacy
pm_power_off() will be removed once all drivers will be converted to
the new power-off API.

Normally arch code should adopt only the do_kernel_power_off() at first,
but m68k is a special case because it uses pm_power_off() "inside out",
i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
while it's machine_power_off() that should invoke the pm_power_off(), and
thus, we can't convert platforms to the new API separately. There are only
two platforms changed here, so it's not a big deal.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/m68k/emu/natfeat.c         | 3 ++-
 arch/m68k/include/asm/machdep.h | 1 -
 arch/m68k/kernel/process.c      | 5 ++---
 arch/m68k/kernel/setup_mm.c     | 1 -
 arch/m68k/kernel/setup_no.c     | 1 -
 arch/m68k/mac/config.c          | 4 +++-
 6 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index 71b78ecee75c..b19dc00026d9 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -15,6 +15,7 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/io.h>
 #include <asm/machdep.h>
 #include <asm/natfeat.h>
@@ -90,5 +91,5 @@ void __init nf_init(void)
 	pr_info("NatFeats found (%s, %lu.%lu)\n", buf, version >> 16,
 		version & 0xffff);
 
-	mach_power_off = nf_poweroff;
+	register_platform_power_off(nf_poweroff);
 }
diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 8fd80ef1b77e..8d8c3ee2069f 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -24,7 +24,6 @@ extern int (*mach_get_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_rtc_pll)(struct rtc_pll_info *);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
-extern void (*mach_power_off)( void );
 extern unsigned long (*mach_hd_init) (unsigned long, unsigned long);
 extern void (*mach_hd_setup)(char *, int *);
 extern void (*mach_heartbeat) (int);
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index a6030dbaa089..e160a7c57bd3 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -67,12 +67,11 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (mach_power_off)
-		mach_power_off();
+	do_kernel_power_off();
 	for (;;);
 }
 
-void (*pm_power_off)(void) = machine_power_off;
+void (*pm_power_off)(void);
 EXPORT_SYMBOL(pm_power_off);
 
 void show_regs(struct pt_regs * regs)
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 4b51bfd38e5f..50f4f120a4ff 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -98,7 +98,6 @@ EXPORT_SYMBOL(mach_get_rtc_pll);
 EXPORT_SYMBOL(mach_set_rtc_pll);
 void (*mach_reset)( void );
 void (*mach_halt)( void );
-void (*mach_power_off)( void );
 #ifdef CONFIG_HEARTBEAT
 void (*mach_heartbeat) (int);
 EXPORT_SYMBOL(mach_heartbeat);
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 5e4104f07a44..00bf82258233 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -55,7 +55,6 @@ int (*mach_hwclk) (int, struct rtc_time*);
 /* machine dependent reboot functions */
 void (*mach_reset)(void);
 void (*mach_halt)(void);
-void (*mach_power_off)(void);
 
 #ifdef CONFIG_M68000
 #if defined(CONFIG_M68328)
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 5d16f9b47aa9..727320dedf08 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -12,6 +12,7 @@
 
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/tty.h>
@@ -139,7 +140,6 @@ void __init config_mac(void)
 	mach_hwclk = mac_hwclk;
 	mach_reset = mac_reset;
 	mach_halt = mac_poweroff;
-	mach_power_off = mac_poweroff;
 #if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = mac_mksound;
 #endif
@@ -159,6 +159,8 @@ void __init config_mac(void)
 
 	if (macintosh_config->ident == MAC_MODEL_IICI)
 		mach_l2_flush = via_l2_flush;
+
+	register_platform_power_off(mac_poweroff);
 }
 
 
-- 
2.33.1

