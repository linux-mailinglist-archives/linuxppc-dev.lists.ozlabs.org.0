Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4C4D6EBD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 13:47:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KG2dl1wGrz3bNy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 23:47:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oIXPRgsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oIXPRgsk; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KG2d01s95z2yhC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 23:47:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8C355CE0A68
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 12:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401BBC340FB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647089231;
 bh=H3gp8D41VexBopqf3rhNzKhC2EJfbt242g4EiN0GOBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oIXPRgskEBIl/4YKNylq9hUIA5UdRaj2Cfsq1LhhJ8KvIzcDM6CBFNxlWDeaGuY35
 bGW8CWqr9CFb1yrZmUW4WEheUVlQL1e0BM92OZJ0gkrWdpgFsq/ot356LWvUVK6SDh
 rKAAp1jIbrYXQ34u+gMY5qiESiIyVuPlyhJ1i9G0ufaX5yT0igqjfMaQTha4GYteLQ
 hNA+TnIGBwo01yfgVojpx+oXl5cVB9tOmREpLHFBuPtvTnLL4l/1KCbWDDVD8vx3u9
 CSL7CCtt1MB5CJf2rjmWTENarFDZuTTkOwZI8X1Za3Rsgrumfw0ERINFfY+ZyUgwii
 qtYfRHCpWmJFQ==
Received: by mail-vs1-f43.google.com with SMTP id h30so12285382vsq.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:47:11 -0800 (PST)
X-Gm-Message-State: AOAM530cO+UBHpC+sX6jjp85WTDHatEDVeTcIvrJIxZE4Gj0DNfRGWY2
 In1Pt8R/knbJVrhvdWsWAVK/IQGURgu9oyutAEQ=
X-Google-Smtp-Source: ABdhPJy5ZidR6+hU7oi1y4oFAyxIqylb9Be+genvWRhNZ7iOORRW8nJemtq9UEHA7jF2pE6KBHQPZVnae3YTrPKV5FM=
X-Received: by 2002:a67:fc17:0:b0:320:b039:afc0 with SMTP id
 o23-20020a67fc17000000b00320b039afc0mr7728220vsq.2.1647089230100; Sat, 12 Mar
 2022 04:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
 <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
 <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Mar 2022 20:46:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT4qT5AXcmbg+twbJn4X6NvG0XLGVC6sZc8WasrwxA9FA@mail.gmail.com>
Message-ID: <CAJF2gTT4qT5AXcmbg+twbJn4X6NvG0XLGVC6sZc8WasrwxA9FA@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 12, 2022 at 4:36 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Mar 12, 2022 at 3:13 AM Guo Ren <guoren@kernel.org> wrote:
> > On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > > On 11/03/2022 02:38, Guo Ren wrote:
> > > >> --- a/arch/riscv/kernel/process.c
> > > >> +++ b/arch/riscv/kernel/process.c
> > > >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> > > >>          }
> > > >>          regs->epc = pc;
> > > >>          regs->sp = sp;
> > > >> +
> > > > FIxup:
> > > >
> > > > + #ifdef CONFIG_COMPAT
> > > >> +       if (is_compat_task())
> > > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> > > >> +       else
> > > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > > > + #endif
> > > >
> > > > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > > > set SR_UXL at all. SR_UXL is BIT[32, 33].
> > >
> > > would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> > > than an #ifdef here?
> >
> > I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*
>
> We used to require an #ifdef check around is_compat_task(), so there are
> a lot of stale #ifdefs that could be removed. In general, 'if (IS_ENABLED())'
> is considered more readable than #ifdef inside of a function. In this case
> there are a number of better ways to write the function if you want to get
> into the details:
>
>  - firstly, you should remove the #ifdef check around the definition of
>    SR_UXL, otherwise the IS_ENABLED() check does not work.
>
>  - you can use an 'if (!IS_ENABLED(CONFIG_COMPAT)) \\ return;' ahead of the
>    assignment since that is at the end of  the function.
>
>  - you can remove the bit masking since 'regs->status' is initialized above it,
>    adding in only the one bit, shortening it to
>
>     if (IS_ENABLED(CONFIG_COMPAT))
>                regs->status |= is_compat_task()) ? SR_UXL_32 : SR_UXL_64;
>
>  - to make this more logical, I would suggest always assigning the SR_UXL
>    bits regardless of CONFIG_COMPAT, and instead make it something like
>
>   if (IS_ENABLED(CONFIG_32BIT) || is_compat_task())
>             regs->status = | SR_UXL_32;
>   else
>             regs->status = | SR_UXL_64;
When CONFIG_32BIT=y, regs->status is 32bit width but SR_UXL_32 is
34bit width. That's wrong in type. (Only CONFIG_64BIT has SR_UXL).

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
