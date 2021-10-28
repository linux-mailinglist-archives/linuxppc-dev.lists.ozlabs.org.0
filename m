Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381043DFE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 13:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg33N1xK3z3c95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 22:18:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg18v2gcnz2xsm;
 Thu, 28 Oct 2021 20:53:35 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso7821640otp.5; 
 Thu, 28 Oct 2021 02:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uz31be5RzrXoa4uAxe1xyKZoIQd0wtsVVy1gZjyOGeo=;
 b=8CTWfOMjyticC6TV9KEBDU0ipU61Evh13UFCRbMCRayjM1jl+AdYN79qBm8Cg7qrCv
 CTy1QvZHh2FxgGuX23zRWyPLExiZ+sMEUK0h4d5QTIgRpWx0Kk1rBBQKXRhZY73DYeK0
 pMYhFLgzljXa/YZd183WGNXN2iq/5uSOZwXLaERgRkxtUveJG8r5wMHU2jhmo/6yyCqw
 y6iJJbSSu6VzKMbHmX6zh9FjYHVbOke7V9+v3SpxGRIWoC+V3TyUEO+V3hENstFnMl1f
 CXMegNKrNzcXmFT5NCPB7KbZa7lx/YSsdXxPbEAfE+haaJDTLj81gv6aSV9TDAP2PiLb
 my7Q==
X-Gm-Message-State: AOAM530COCxapY82Zg2f6+Ydv355JiH0Xxsvj+tRoX8T/TZ6CeripZRx
 o6oYbf8cSiBB5LqDyyfBwQd52cpFNE66K6e57OI=
X-Google-Smtp-Source: ABdhPJzOhFRTFEQQ+n5tEP/bBwTFb0889hJMVw20FWNyFAcerxAE3whFQ+5AhX1ip3T9ogNIhdu7wA8+/uN9VNCEoX8=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr2411564oth.198.1635414812552; 
 Thu, 28 Oct 2021 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-9-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Oct 2021 11:53:20 +0200
Message-ID: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
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
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linux PM <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
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

The name of this structure is too generic IMV.  There are many things
that it might apply to in principle.

What about calling power_off_handler or sys_off_handler as it need not
be about power at all?
