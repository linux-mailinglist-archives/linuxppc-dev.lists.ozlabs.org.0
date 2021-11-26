Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A451B45F678
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 22:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J17Gg3cVWz3dcH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 08:31:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hNDiDyK0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hNDiDyK0; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J12dD11jcz307l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 05:02:08 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 13so20179552ljj.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 10:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=hNDiDyK0mXFGn4DxizRDTh848JRSUoRpy2BGku+puCZb4ybkLBVQYxsigPgsX8oTYo
 6uGIJxTr27Sr/5uMIfvDrPYcj5JZCK4JVm0hmsmagDb+4g/16Qb2Lml6lDE5kEYxSTqN
 1cZzQ5YrCG/5jHmOAHWFPzd6RK6Nxwzyc+2hsTlnygT/PBOMYmYfgTBreyJX/cM8e8Ri
 XH/uWJcEe4LPCRWWl546Fte/fnOxNdqhmyH7lhZm2kP9gpSFr43Ku3Kops2TSD2lJLii
 3tQMh9H3YmdwyreB+CGFvAehWfGPKgIyfGRW4a8rgOWMZfouUk4VEJQah1A9TCWCHZqH
 suDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=jtsTIYj6rCzBJHrE/Ux6hOa4dlE0QJ4VPNOjEDhp1A177ps2Jdu0UUA5Ojip9mJNuJ
 qP2aqgVx7hwQEN4W21YcnWnmwi38jQ2ebqF8zm0gA+tpGI2netHWit0nUzDCvOt5WjeE
 jSAwrqlkkWyjVqQlYlT0BWTADUwSKti5eDksnF60gpHlDnhOcfPVTn8S/DkVGHrKN9hi
 LFVyKUfIdkabVLwuBzQi1V2nEs5j4MhaKY/xe/R2Mcu63yh1wCJjKPQxk1Qm3RcgxLzw
 WjiAs+b7FfTRpd861RoJ7ghSBw7RNuc2QoXMElAjG2X72JzveRMDjlFOEJNvMX21N9tH
 vq0w==
X-Gm-Message-State: AOAM532FBMf1g9dZYtGAybWe1rr1JYrh+Lrc2KtvOAVFyMwuuAwyYnM0
 OndB4eYmq1RH4lFEYqmIszs=
X-Google-Smtp-Source: ABdhPJyb8kz1UEvDCKCp+BiDo+e8J/+zE/2jFszIocFNHpuea9i2+EEWlZYq05sNitfJ0uIdOtFxwg==
X-Received: by 2002:a05:651c:b12:: with SMTP id
 b18mr33869925ljr.306.1637949724600; 
 Fri, 26 Nov 2021 10:02:04 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:04 -0800 (PST)
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
Subject: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
Date: Fri, 26 Nov 2021 21:00:43 +0300
Message-Id: <20211126180101.27818-8-digetx@gmail.com>
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

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 7c288013a3ca..b7fa25726323 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -40,36 +40,36 @@ extern int reboot_cpu;
 extern int reboot_force;
 
 
-extern int register_reboot_notifier(struct notifier_block *);
-extern int unregister_reboot_notifier(struct notifier_block *);
+int register_reboot_notifier(struct notifier_block *);
+int unregister_reboot_notifier(struct notifier_block *);
 
-extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
+int devm_register_reboot_notifier(struct device *, struct notifier_block *);
 
-extern int register_restart_handler(struct notifier_block *);
-extern int unregister_restart_handler(struct notifier_block *);
-extern void do_kernel_restart(char *cmd);
+int register_restart_handler(struct notifier_block *);
+int unregister_restart_handler(struct notifier_block *);
+void do_kernel_restart(char *cmd);
 
 /*
  * Architecture-specific implementations of sys_reboot commands.
  */
 
-extern void migrate_to_reboot_cpu(void);
-extern void machine_restart(char *cmd);
-extern void machine_halt(void);
-extern void machine_power_off(void);
+void migrate_to_reboot_cpu(void);
+void machine_restart(char *cmd);
+void machine_halt(void);
+void machine_power_off(void);
 
-extern void machine_shutdown(void);
+void machine_shutdown(void);
 struct pt_regs;
-extern void machine_crash_shutdown(struct pt_regs *);
+void machine_crash_shutdown(struct pt_regs *);
 
 /*
  * Architecture independent implementations of sys_reboot commands.
  */
 
-extern void kernel_restart_prepare(char *cmd);
-extern void kernel_restart(char *cmd);
-extern void kernel_halt(void);
-extern void kernel_power_off(void);
+void kernel_restart_prepare(char *cmd);
+void kernel_restart(char *cmd);
+void kernel_halt(void);
+void kernel_power_off(void);
 
 extern int C_A_D; /* for sysctl */
 void ctrl_alt_del(void);
@@ -77,15 +77,15 @@ void ctrl_alt_del(void);
 #define POWEROFF_CMD_PATH_LEN	256
 extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
 
-extern void orderly_poweroff(bool force);
-extern void orderly_reboot(void);
+void orderly_poweroff(bool force);
+void orderly_reboot(void);
 void hw_protection_shutdown(const char *reason, int ms_until_forced);
 
 /*
  * Emergency restart, callable from an interrupt handler.
  */
 
-extern void emergency_restart(void);
+void emergency_restart(void);
 #include <asm/emergency-restart.h>
 
 #endif /* _LINUX_REBOOT_H */
-- 
2.33.1

