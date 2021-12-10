Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68C471E60
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0MB0rBcz3dfP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ff055Ywz3bVs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:32:40 +1100 (AEDT)
Received: by mail-ot1-f44.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso10473810ots.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYFeMefDtygzQHG6cGasFJft83PyhMCvIHgML7JQ1W8=;
 b=umPBEhUY7W/lK4ZnYNsUcDI29uZ/eBMBGvpXHzSqv90rVH2+7aIz0CMs8I5XCvduyR
 8uoVLOlW7vGGnxuTnVU15Fi12ZN2o0TTRwyoNePsBt+NSzM4LG5POrdbZVqymfH4A+b6
 Y2QxvfEd/HWfD0zovdYmY34CZtM0mxjCkwXDh9Zcd/Eh7W5iHenIIqluK0EvqH6QQY0A
 nJ5wskN3mWChY+eKcCcv021JLWELO2PX3QpJpcXj3Soau/eYK/Ft8iNT/Jy2ZLVPrcn+
 IaPh6d20VTxf7vE9Xra+KyZIswMtvuli7om86uSAK+QI31jHHFuMN42kEb7U8BevTP0B
 WOFw==
X-Gm-Message-State: AOAM533YeQY8n4GekBoohJ7w5pMmPcQenlAzm7vIDTaM2t+DSol+xtsm
 FIHW/MCrrftd8goRASDjdkq+OiDuC3hG7aZfUjk=
X-Google-Smtp-Source: ABdhPJy/ApH2I9ley83OfAtDiEoSWuJBoE9Gqun3QKF0IviB+39TRacgd3bR+5yVv4MXsqS5F4aemy99lcaDR84MB0I=
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr12642134otu.254.1639161158278; 
 Fri, 10 Dec 2021 10:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-7-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-7-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:32:27 +0100
Message-ID: <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
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
> Emit warning if unregister_restart_handler() fails since it never should
> fail. This will ease further API development by catching mistakes early.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  kernel/reboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index e6659ae329f1..f0e7b9c13f6b 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
>   */
>  int unregister_restart_handler(struct notifier_block *nb)
>  {
> -       return atomic_notifier_chain_unregister(&restart_handler_list, nb);
> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));

The only reason why it can fail is if the object pointed to by nb is
not in the chain.  Why WARN() about this?  And what about systems with
panic_on_warn set?

>  }
>  EXPORT_SYMBOL(unregister_restart_handler);
>
> --
> 2.33.1
>
