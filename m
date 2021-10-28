Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F443DFE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 13:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg33s19Dlz3cSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 22:19:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg1Hq0MXFz2xB0;
 Thu, 28 Oct 2021 20:59:33 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so7801416ote.8; 
 Thu, 28 Oct 2021 02:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YApfc+rtORQHprN7aKpnZNhl8TPl/VtOJQI8beQJmCY=;
 b=8MrmBuOG93ON7qNOvv6U3K5j6+oEy7n0688i1vz9dBmNcvMJPOgUYPE035yOnwTta2
 dQ1NctqY/H0eFvqXIv0FZt8E51M/9DAxHBxhfOkgKSvCz093D4LyktGwPyRpuaCnQopI
 M5EJPaPfAWlq6LrHEal1VAy32WbubnBeAd5KdHMI65HpJMyhvAZCV3Bu80r2eFFqY7ST
 fu12FTmbp0dj01dpdHbPv1Ow52XXim+0xnamoZwWXIkqwJCQHUAnLZc5jWNZ9app9HZs
 4kBEKb2VR658c2oKrwrBklqxtCsgYVB6YtKtayW6nqk6c9FgX1nH/D9xJWD8ar3mxCqv
 JTow==
X-Gm-Message-State: AOAM531Zt4SdxAmlphYKVkhiNzWf3Vah5pJENSwMIy3vFEtmUkVLNWjE
 Ct/xLpYDP9n0YdAtb98BVgXqop2x2oCE1SQ15+E=
X-Google-Smtp-Source: ABdhPJzD4cm7tn60vkyopY5CUMxUc9huwAUhS0IgxTyGcJq7Km0Bm+8fuUNsdZomFIBYzzQsRecVralPmU+TS+34zNY=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr2427957oth.198.1635415170827; 
 Thu, 28 Oct 2021 02:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-9-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Oct 2021 11:59:18 +0200
Message-ID: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 28 Oct 2021 22:18:33 +1100
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
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linux-sh list <linux-sh@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux PM <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 27, 2021 at 11:18 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> SoC platforms often have multiple options of how to perform system's
> power-off and restart operations. Meanwhile today's kernel is limited to
> a single option. Add combined power-off+restart handler call chain API,
> which is inspired by the restart API. The new API provides both power-off
> and restart functionality.
>
> The old pm_power_off method will be kept around till all users are
> converted to the new API.
>
> Current restart API will be replaced by the new unified API since
> new API is its superset. The restart functionality of the power-handler
> API is built upon the existing restart-notifier APIs.
>
> In order to ease conversion to the new API, convenient helpers are added
> for the common use-cases. They will reduce amount of boilerplate code and
> remove global variables. These helpers preserve old behaviour for cases
> where only one power-off handler is executed, this is what existing
> drivers want, and thus, they could be easily converted to the new API.
> Users of the new API should explicitly enable power-off chaining by
> setting corresponding flag of the power_handler structure.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/reboot.h   | 176 +++++++++++-
>  kernel/power/hibernate.c |   2 +-
>  kernel/reboot.c          | 601 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 768 insertions(+), 11 deletions(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index b7fa25726323..0ec835338c27 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -8,10 +8,16 @@
>
>  struct device;
>
> -#define SYS_DOWN       0x0001  /* Notify of system down */
> -#define SYS_RESTART    SYS_DOWN
> -#define SYS_HALT       0x0002  /* Notify of system halt */
> -#define SYS_POWER_OFF  0x0003  /* Notify of system power off */
> +enum reboot_prepare_mode {
> +       SYS_DOWN = 1,           /* Notify of system down */
> +       SYS_RESTART = SYS_DOWN,
> +       SYS_HALT,               /* Notify of system halt */
> +       SYS_POWER_OFF,          /* Notify of system power off */
> +};
> +
> +#define RESTART_PRIO_RESERVED          0
> +#define RESTART_PRIO_DEFAULT           128
> +#define RESTART_PRIO_HIGH              192
>
>  enum reboot_mode {
>         REBOOT_UNDEFINED = -1,
> @@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
>  int unregister_restart_handler(struct notifier_block *);
>  void do_kernel_restart(char *cmd);
>
> +/*
> + * Unified poweroff + restart API.
> + */
> +
> +#define POWEROFF_PRIO_RESERVED         0
> +#define POWEROFF_PRIO_PLATFORM         1
> +#define POWEROFF_PRIO_DEFAULT          128
> +#define POWEROFF_PRIO_HIGH             192
> +#define POWEROFF_PRIO_FIRMWARE         224

Also I'm wondering why these particular numbers were chosen, here and above?

> +
> +enum poweroff_mode {
> +       POWEROFF_NORMAL = 0,
> +       POWEROFF_PREPARE,
> +};
> +
> +struct power_off_data {
> +       void *cb_data;
> +};
> +
> +struct power_off_prep_data {
> +       void *cb_data;
> +};
> +
> +struct restart_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_mode mode;
> +};
> +
> +struct reboot_prep_data {
> +       void *cb_data;
> +       const char *cmd;
> +       enum reboot_prepare_mode mode;
> +};
> +
> +struct power_handler_private_data {
> +       struct notifier_block reboot_prep_nb;
> +       struct notifier_block power_off_nb;
> +       struct notifier_block restart_nb;
> +       void (*trivial_power_off_cb)(void);
> +       void (*simple_power_off_cb)(void *data);
> +       void *simple_power_off_cb_data;
> +       bool registered;
> +};
> +
> +/**
> + * struct power_handler - Machine power-off + restart handler
> + *
> + * Describes power-off and restart handlers which are invoked by kernel
> + * to power off or restart this machine.  Supports prioritized chaining for
> + * both restart and power-off handlers.  Callback's priority must be unique.
> + * Intended to be used by device drivers that are responsible for restarting
> + * and powering off hardware which kernel is running on.
> + *
> + * Struct power_handler can be static.  Members of this structure must not be
> + * altered while handler is registered.
> + *
> + * Fill the structure members and pass it to register_power_handler().
> + */
> +struct power_handler {
> +       /**
> +        * @cb_data:
> +        *
> +        * User data included in callback's argument.
> +        */

And here I would document the structure fields in the main kerneldoc
comment above.

As is, it is a bit hard to grasp the whole definition.

> +       void *cb_data;
> +
> +       /**
> +        * @power_off_cb:
> +        *
> +        * Callback that should turn off machine.  Inactive if NULL.
> +        */
> +       void (*power_off_cb)(struct power_off_data *data);
> +
> +       /**
> +        * @power_off_prepare_cb:
> +        *
> +        * Power-off preparation callback.  All power-off preparation callbacks
> +        * are invoked before @restart_cb.  Inactive if NULL.
> +        */
> +       void (*power_off_prepare_cb)(struct power_off_prep_data *data);
> +
> +       /**
> +        * @power_off_priority:
> +        *
> +        * Power-off callback priority, must be unique.  Zero value is
> +        * reassigned to default priority.  Inactive if @power_off_cb is NULL.
> +        */
> +       int power_off_priority;
> +
> +       /**
> +        * @power_off_chaining_allowed:
> +        *
> +        * False if callbacks execution should stop when @power_off_cb fails
> +        * to power off machine.  True if further lower priority power-off
> +        * callback should be executed.
> +        */
> +       bool power_off_chaining_allowed;
> +
> +       /**
> +        * @restart_cb:
> +        *
> +        * Callback that should reboot machine.  Inactive if NULL.
> +        */
> +       void (*restart_cb)(struct restart_data *data);
> +
> +       /**
> +        * @restart_priority:
> +        *
> +        * Restart callback priority, must be unique.  Zero value is reassigned
> +        * to default priority.  Inactive if @restart_cb is NULL.
> +        */
> +       int restart_priority;
> +
> +       /**
> +        * @reboot_prepare_cb:
> +        *
> +        * Reboot preparation callback.  All reboot preparation callbacks are
> +        * invoked before @restart_cb.  Inactive if NULL.
> +        */
> +       void (*reboot_prepare_cb)(struct reboot_prep_data *data);
> +
> +       /**
> +        * @priv:
> +        *
> +        * Internal data.  Shouldn't be touched.
> +        */
> +       const struct power_handler_private_data priv;
> +};
