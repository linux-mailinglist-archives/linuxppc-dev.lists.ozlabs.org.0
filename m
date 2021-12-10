Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF0471E57
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0HJ3565z3dlj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.43; helo=mail-oo1-f43.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9f7N25Hdz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:09:34 +1100 (AEDT)
Received: by mail-oo1-f43.google.com with SMTP id
 v19-20020a4a2453000000b002bb88bfb594so2590641oov.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnSiIIEAxVbWb5ME0b4EjQTIeMlzMMlMKVBEVEKFmvo=;
 b=lrSok9ed2vgZacE1zDjTPr8Ik5+G1+FSQlIJvNrncypIT3m0zGOv8G8+TxtPNLAqcc
 CnX2bH/Z/FEr5ZLVVm9u9KAWLfbeCUeY+YKJi90qv+J4zhU+gFMnH5Ql+1U8ah0hYwVU
 7w7zPGKGJg0BZrtxj5ltKKNjuAG9OQVwECbptUiUWFHqlMvwqTdfEmfFZrcznPo/VeQj
 rceTh+P0Np7hbRpusYEysfiyIt8P8V/mPoxFw7hkMZSkK7GWyhIC2fsR3HuxGT6+H4+V
 HKk/pTlGu6M3e8ju0jZnbjgBRS7Jx0uM7n/UMV2P/cpJFsqqtNN46ZYBunaXP1YjINii
 72MQ==
X-Gm-Message-State: AOAM532N8W2VzJlPG6Afj1m3gwCavSpBAUdzzmn0ovCzqTOhFVubW1mV
 rOfOLZ/eQ0C7sTb2CQIhuFY8aW4Mi2rnLYHNFw0=
X-Google-Smtp-Source: ABdhPJylQaHxxBjvxLDdejK26dmax8gF5GO2emXKWarqrtdmHFUWV4Injg4wQQswc1tWUgMSYyPwJPfech+QMe2lThI=
X-Received: by 2002:a05:6820:388:: with SMTP id r8mr9365162ooj.0.1639159771506; 
 Fri, 10 Dec 2021 10:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-8-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:09:20 +0100
Message-ID: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linux-sh list <linux-sh@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> There is no need to annotate function prototypes with 'extern', it makes
> code less readable. Remove unnecessary annotations from <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I'm not sure that this is really useful.

Personally, I tend to respect the existing conventions like this.

Surely, this change is not required for the rest of the series to work.

> ---
>  include/linux/reboot.h | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index 7c288013a3ca..b7fa25726323 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -40,36 +40,36 @@ extern int reboot_cpu;
>  extern int reboot_force;
>
>
> -extern int register_reboot_notifier(struct notifier_block *);
> -extern int unregister_reboot_notifier(struct notifier_block *);
> +int register_reboot_notifier(struct notifier_block *);
> +int unregister_reboot_notifier(struct notifier_block *);
>
> -extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
> +int devm_register_reboot_notifier(struct device *, struct notifier_block *);
>
> -extern int register_restart_handler(struct notifier_block *);
> -extern int unregister_restart_handler(struct notifier_block *);
> -extern void do_kernel_restart(char *cmd);
> +int register_restart_handler(struct notifier_block *);
> +int unregister_restart_handler(struct notifier_block *);
> +void do_kernel_restart(char *cmd);
>
>  /*
>   * Architecture-specific implementations of sys_reboot commands.
>   */
>
> -extern void migrate_to_reboot_cpu(void);
> -extern void machine_restart(char *cmd);
> -extern void machine_halt(void);
> -extern void machine_power_off(void);
> +void migrate_to_reboot_cpu(void);
> +void machine_restart(char *cmd);
> +void machine_halt(void);
> +void machine_power_off(void);
>
> -extern void machine_shutdown(void);
> +void machine_shutdown(void);
>  struct pt_regs;
> -extern void machine_crash_shutdown(struct pt_regs *);
> +void machine_crash_shutdown(struct pt_regs *);
>
>  /*
>   * Architecture independent implementations of sys_reboot commands.
>   */
>
> -extern void kernel_restart_prepare(char *cmd);
> -extern void kernel_restart(char *cmd);
> -extern void kernel_halt(void);
> -extern void kernel_power_off(void);
> +void kernel_restart_prepare(char *cmd);
> +void kernel_restart(char *cmd);
> +void kernel_halt(void);
> +void kernel_power_off(void);
>
>  extern int C_A_D; /* for sysctl */
>  void ctrl_alt_del(void);
> @@ -77,15 +77,15 @@ void ctrl_alt_del(void);
>  #define POWEROFF_CMD_PATH_LEN  256
>  extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
>
> -extern void orderly_poweroff(bool force);
> -extern void orderly_reboot(void);
> +void orderly_poweroff(bool force);
> +void orderly_reboot(void);
>  void hw_protection_shutdown(const char *reason, int ms_until_forced);
>
>  /*
>   * Emergency restart, callable from an interrupt handler.
>   */
>
> -extern void emergency_restart(void);
> +void emergency_restart(void);
>  #include <asm/emergency-restart.h>
>
>  #endif /* _LINUX_REBOOT_H */
> --
> 2.33.1
>
