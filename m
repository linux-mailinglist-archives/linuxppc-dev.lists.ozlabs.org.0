Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B303471E61
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Mf2x0gz3dhC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fjD5tHhz3bhj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:35:27 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id be32so14336865oib.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cmWwBA8Prvw8yKg8YllQ7/9D+dqLH//9VzjE/Uy0t0I=;
 b=bTeXJYK59xVOW1L6vrmdhdi71lmOQ/NmRDuN2QxqbyivtE2bd/j9zO4jbihId+5Kym
 1PBewMm7P0h7k8TqK6IB5z2UDu8G+gYB1igMkww8uZf16RuXkg5bZbwR5nxj8o/a3RJs
 9b2x5Grl4G1lUCiDdDcgEBz2oYQGd2f++wFJlFjD/gX5GMh+dugzEfR4zsWT6DUn896c
 GX8l3o7GCQ8pReD4fUb288vduts6/1FEUJwelmvl9KF+Vb7uD4GXnYNmlgoL7eD7ZzqT
 SCWhEKRPxIHVM5JJw6jXpZ4/VOoEmHfZPhAyDaT4Djm3YinpklB6dr7i7jR/JJj5XX4L
 239g==
X-Gm-Message-State: AOAM5338IZd3Uhg4DAv9TygXd3xzjHJvz9YwdeP+17eHzzOofGPsUFE3
 gQV/V5jky/eD/9VQ6KMa3vKwz5l1JSvj5rEv6VI=
X-Google-Smtp-Source: ABdhPJy55tGpIDxF+0NXDym/GuLq/jPswo3lW9bQPH3JZ5naSMZQfeBVB0yUiflqPmuJ6rchV13JR6onKlnNSicDR4M=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14005588oih.51.1639161324582; 
 Fri, 10 Dec 2021 10:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
 <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
In-Reply-To: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:35:13 +0100
Message-ID: <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 10, 2021 at 7:16 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:09, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> There is no need to annotate function prototypes with 'extern', it mak=
es
> >> code less readable. Remove unnecessary annotations from <reboot.h>.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > I'm not sure that this is really useful.
> >
> > Personally, I tend to respect the existing conventions like this.
> >
> > Surely, this change is not required for the rest of the series to work.
>
> Problem that such things start to spread all over the kernel with a
> copy-paste approach if there is nobody to clean up the code.
>
> This is not a common convention and sometimes it's getting corrected [1].
>
> [1] https://git.kernel.org/linus/6d7434931

In separate patches outside of series adding new features, if one is
so inclined.
