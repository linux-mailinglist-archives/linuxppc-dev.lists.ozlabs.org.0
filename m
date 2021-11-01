Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672344124D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 04:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjJ5V3LZxz305v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 14:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WTZ2r/aq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WTZ2r/aq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjGPr2Kjhz2xrq;
 Mon,  1 Nov 2021 12:57:36 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1FF3610E8;
 Mon,  1 Nov 2021 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635731852;
 bh=fuaUan8WpsO3AU0Pd876OqdiQB5S59Rz/RFmfxHCqFo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WTZ2r/aqsZBJ/SEMp/W5aRRvu0wWWG+qZmM8hZPwjrObwwMpW1TgXwf1zWnw0Qa9i
 Zv/YGYWGYxl7myNvWxfw0CIgJUc9b2/XePq2AH0H37XLuqx44GHHVjgkb3ys6UwuYH
 QFUJSlyCI2x3AldpppHi6cKlbUrpf5epTIwYkQ0LyIddZNVrNNmKUj9pq1nkh3vhav
 ePFznWLS5KXHwuBhRZexeraVkFwzXRLP/38HX/OFwy/5mrR8Hs9LdC9PbwjoOwqbNV
 ADgrJu7beLvyyJTcpsvn3lAsea5miSCymSsM2dL/H4uMyDHc1oqmdVcUWCHL7cYIF+
 w+SQ6/88DMfNA==
Received: by mail-yb1-f179.google.com with SMTP id j75so13148874ybj.6;
 Sun, 31 Oct 2021 18:57:32 -0700 (PDT)
X-Gm-Message-State: AOAM530Jui5my/rFpnYzEYKCBtDN6oW2HBXIpubAwUmzgZSWoDfCwjVY
 d1fqV2DlMnUcQKb0rEuTiF9BLqJ/k/G5PHoFTcA=
X-Google-Smtp-Source: ABdhPJwLzr48xvkbPUYNSwW4wG4jcRHULAsaxHDgvLOaeOhiDi1MY+7mZCeP1WaifSe+QfUYgjKQrdu4XIYT2pTMgvI=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr16913634uar.66.1635731841194; 
 Sun, 31 Oct 2021 18:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-13-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-13-digetx@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Nov 2021 09:57:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT+EsLt+pnYyTw_B0C8isho=E4tfOWROe9h-GZpYjET=w@mail.gmail.com>
Message-ID: <CAJF2gTT+EsLt+pnYyTw_B0C8isho=E4tfOWROe9h-GZpYjET=w@mail.gmail.com>
Subject: Re: [PATCH v2 12/45] csky: Use do_kernel_power_off()
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 01 Nov 2021 14:13:00 +1100
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
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-omap@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only for this patch, Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Oct 28, 2021 at 5:18 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/csky/kernel/power.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
> index 923ee4e381b8..86ee202906f8 100644
> --- a/arch/csky/kernel/power.c
> +++ b/arch/csky/kernel/power.c
> @@ -9,16 +9,14 @@ EXPORT_SYMBOL(pm_power_off);
>  void machine_power_off(void)
>  {
>         local_irq_disable();
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>         asm volatile ("bkpt");
>  }
>
>  void machine_halt(void)
>  {
>         local_irq_disable();
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>         asm volatile ("bkpt");
>  }
>
> --
> 2.33.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
