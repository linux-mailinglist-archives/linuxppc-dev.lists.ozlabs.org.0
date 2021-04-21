Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7BA36676C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 10:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQDxm6rx6z30FK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 18:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KspKrNpo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KspKrNpo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQDxK0mtHz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 18:58:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3F5961446
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618995518;
 bh=64KJf6xIhQSnl3PhQoQ0a9YdaBe+gMwA8Np6LwW1+/4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KspKrNpocGC+THW2FQf8l/RTxYj9VsuAMN9o6fRqaCIHROlddiUnVoGVbSJevcK8P
 t9Ih4ay4gNZRHVDqglHOGunFJvorx346JxWj8TRSdxkGT0Mx+bIg6kSOy9/tw6wrli
 AyoCGd/Aj4lwDeEU4D5FwKzcgcMb/8X46RKGEXUG2g1sE3gyPvvaBF9LVNzp8ElJtH
 nxpWNiCTcCzxZsHmOA3b5MzE1AlJaFRQLBbGl79XxBJRzbOZ0HNJnsSBV2Azw6FIoW
 hMQ03qhaDP19GOcFUHxal2wg+Dsk2MwLLe7C5x4sfsipcA0LcpO/cD4GZh1Ilzc8Wj
 Fofb7CfADu1kg==
Received: by mail-wm1-f47.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so818756wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 01:58:38 -0700 (PDT)
X-Gm-Message-State: AOAM531/run1IafwyVdgjuTOz15dGhXE8cRIVE/Kyf0VGiIKrqgWQnFc
 uU1Vl2IyKFzGAbsPuToJOy4BDNQwruiI2sdEHKw=
X-Google-Smtp-Source: ABdhPJzfODrhPhGfivkqeugtVvYFeuZiRdEx50xM7G3CMPJPgDkMCFmpfx3SbcIBA3tmKParqz5KGFeTEwP9bSV2emc=
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr8921317wmf.84.1618995517297; 
 Wed, 21 Apr 2021 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
 <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
 <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
In-Reply-To: <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Apr 2021 10:58:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2GN9HVwSjfsXaYVO29zeUNB1hQENRw1K0DXCLdt-M-qA@mail.gmail.com>
Message-ID: <CAK8P3a2GN9HVwSjfsXaYVO29zeUNB1hQENRw1K0DXCLdt-M-qA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: David Laight <David.Laight@aculab.com>
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
Cc: "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 21, 2021 at 10:43 AM David Laight <David.Laight@aculab.com> wrote:
> From: Arnd Bergmann Sent: 20 April 2021 22:20
> > On Tue, Apr 20, 2021 at 11:14 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> > > On 4/20/21 12:07 AM, Arnd Bergmann wrote:
> >
> > > >
> > > > which means that half the 32-bit architectures do this. This may
> > > > cause more problems when arc and/or microblaze want to support
> > > > 64-bit kernels and compat mode in the future on their latest hardware,
> > > > as that means duplicating the x86 specific hacks we have for compat.
> > > >
> > > > What is alignof(u64) on 64-bit arc?
> > >
> > > $ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc -
> > > -Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
> > > 8
> >
> > Ok, good.
>
> That test doesn't prove anything.
> Try running on x86:
> $ echo 'int a = __alignof__(long long);' | gcc -xc - -Wall -S -o - -m32
> a:
>         .long   8

Right, I had wondered about that one after I sent the email.

> Using '__alignof__(struct {long long x;})' does give the expected 4.
>
> __alignof__() returns the preferred alignment, not the enforced
> alignmnet - go figure.

I checked the others as well now, and i386 is the only one that
changed here: m68k still has '2', while arc/csky/h8300/microblaze/
nios2/or1k/sh/i386 all have '4' and the rest have '8'.

     Arnd
