Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E2424888
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnC95XZDz3bWB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:09:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=broTUrrl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=broTUrrl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPnBT4Dtpz2yKT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 08:09:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DA8261152
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633554542;
 bh=7y2OqyGeh/YLbNHB3wW+VV17BTzd0SdtkHXCJgfSaiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=broTUrrlFiLEzw1V1KzqJl3cjITvNqn8fuEk42SbT6TOR0Idnr3Wvw0BoG0aE0XuK
 NcpZbDNChXN5OOm6Ht7gYg7ZqR5OmZTcfjSzeNJPRg5cOCMbxZr7joE/D0yEs5pSX7
 F6alwzWwl4jZJjHSLNJ16AL9sS7C3JKfDDqnlFebb4Ue/y4PFm2G7NOIciGL8rG0+j
 kKeZDu8KP9lnqWGFDFTpdF2tScH7ckPbtPihCtX8t+0miILAe0Nj8i5SmOPEIDCtkc
 6vimnh2FYEuku4Zh1t+GlHrloVdffSs/V1GeuzJwGJWGcqAOcnZovErMBgw7nd29RK
 UA/OZl+re6dPA==
Received: by mail-wr1-f41.google.com with SMTP id r18so12657255wrg.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 14:09:02 -0700 (PDT)
X-Gm-Message-State: AOAM533DazFagoksQXyLuc0MkyVXCFNkzj7Gb0wwFuq+rEy+6gL/9dED
 wOOBc9iCYqzvEYWAnz/wpqOaBTr0GX6JAjgMfQ==
X-Google-Smtp-Source: ABdhPJymkbNsN9aT73y46BJl6usZeJjKrfNWWvIOkuSTs2FD7IqIC9KCjaQE7Xpsh+yBqmdTH3WZm/Iyih4k6MZ6upc=
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr678627edw.145.1633554530546; 
 Wed, 06 Oct 2021 14:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Oct 2021 16:08:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 SH-Linux <linux-sh@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 6, 2021 at 3:44 PM Stafford Horne <shorne@gmail.com> wrote:
>
> On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> > Replace open coded parsing of CPU nodes' 'reg' property with
> > of_get_cpu_hwid().
> >
> > Cc: Jonas Bonn <jonas@southpole.se>
> > Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> > Cc: Stafford Horne <shorne@gmail.com>
> > Cc: openrisc@lists.librecores.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  arch/openrisc/kernel/smp.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> > index 415e209732a3..7d5a4f303a5a 100644
> > --- a/arch/openrisc/kernel/smp.c
> > +++ b/arch/openrisc/kernel/smp.c
> > @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
> >       u32 cpu_id;
> >
> >       for_each_of_cpu_node(cpu) {
> > -             if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> > -                     pr_warn("%s missing reg property", cpu->full_name);
> > -                     continue;
> > -             }
> > -
> > +             cpu_id = of_get_cpu_hwid(cpu);

Oops, that should be: of_get_cpu_hwid(cpu, 0);

I thought I double checked all those...

> You have defined of_get_cpu_hwid to return u64, will this create compiler
> warnings when since we are storing a u64 into a u32?

I'm counting on the caller to know the max size for their platform.

>
> It seems only if we make with W=3.
>
> I thought we usually warned on this.  Oh well, for the openrisc bits.

That's only on ptr truncation I think.

> Acked-by: Stafford Horne <shorne@gmail.com>
>
> >               if (cpu_id < NR_CPUS)
> >                       set_cpu_possible(cpu_id, true);
> >       }
> > --
> > 2.30.2
> >
