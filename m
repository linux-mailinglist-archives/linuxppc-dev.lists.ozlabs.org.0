Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54F3729D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZJY23YsFz2yyF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZJXb2frrz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:08:46 +1000 (AEST)
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mow4E-1lD2Ig2dby-00qVKx for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May
 2021 14:08:40 +0200
Received: by mail-wr1-f45.google.com with SMTP id z6so9151453wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 05:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM532OOMheR5gR5yFL+ZVLgaG36N9+RTxDAIbDYJhLV2nM2864BmD0
 SXsBuKUNc5MJ3G1iStmG6/2qG+dzim9jhbCPH7w=
X-Google-Smtp-Source: ABdhPJw20yUwLjuDm4O2f4JNErVjYHf0sVRY4Y7yimcYIwg2TBud2AGVYmDyXDJ9tJQqulD0dlHRWOk7iwc1IQFkZg8=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr32138876wrr.286.1620130119473; 
 Tue, 04 May 2021 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
 <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 May 2021 14:07:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ud7ql832SBGjeDwwKIPi1NU2HLz58s0mjWp+62KTJeCy9RU33qj
 X6gUXGznkuZhldu5GZ8hIYIcrNHbFYkWB0u5tKH8BHoQx2QJz8QtAt8BYHzbLew/WuwNA2S
 XCTJVczPL7Y6fyRRbJHux+0La4FiilNYmdsOQHow8YMBhfuuq/ch2s7ltJh9UFlunljczgV
 q9cpQ73Zd2mhxQwP9sBbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wjh+y+rSGls=:90elk4WytCpsxKq2Y2G4F4
 jj+JhIxhmZlYoO2h741dQ++9+BgmU83BhF85QAQQwyDk0s1B+w1i08UpxAiCnW0nySqM5OEWr
 SLT6wEwDVV9CnEH3QvcLOl8TPOxZhww4MYJgK+vwT9l4s3x8lMW1vKY9lWsgEVX4DuTk4VW//
 59wacuJh4WcpZ67N9FUryJU37v3NGKQi9DgvzA7ammAfmVS/zCMG5T8nkqe13eXf1X5fqmao6
 kn1ZyNwmrhXXG3+3G7PkpFXHQVsToPM+w6uXG7KztLydFqtgD/swxpBjK2lP/gdRh4Zrcxmws
 AcUB3eeaySe1/41AAfj8u1Iu+M4ElAJHhb2LV5Ij4YPCl52fCiDhSIcAxCrYsK/gQHN9MHrZu
 RM4WJX/rJ/dqnCA/hwcOfeC7Se/xb3139/ZTrM69Wb0zIBeVcAPS1YsKCJvzd53Nav6bgZi5C
 ZpC2XP+x9ctJP3mVEvY6rlb5ImouTGHGVMfvwhd3bIVOj17cf/oTt/1MDZcIsFL7E1mR4Os31
 jJ6Kdv2XZ2/Lq/eGXp+m5o=
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 7:31 AM Alexander Dahl <ada@thorsis.com> wrote:
> Am Mon, May 03, 2021 at 11:25:21AM +0200 schrieb Arnd Bergmann:
> > On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> > >
> > > Desktops and servers are all nice, however I just want to make you
> > > aware, there are embedded users forced to stick to older cross
> > > toolchains for different reasons as well, e.g. in industrial
> > > environment. :-)
> > >
> > > This is no show stopper for us, I just wanted to let you be aware.
> >
> > Can you be more specific about what scenarios you are thinking of,
> > what the motivations are for using an old compiler with a new kernel
> > on embedded systems, and what you think a realistic maximum
> > time would be between compiler updates?
>
> One reason might be certification. For certain industrial applications
> like support for complex field bus protocols, you need to get your
> devices tested by an external partner running extensive test suites.
> This is time consuming and expensive.
>
> Changing the toolchain of your system then, would be a massive change
> which would require recertification, while you could argue just
> updating a single component like the kernel and building everything
> again, does not require the whole testing process again.
>
> Thin ice, I know.

As Christophe said, I don't think this is a valid example. I agree that
if rebuilding everything with a new toolchain requires certification, you
shouldn't rebuild everything.

If replacing the kernel does not require recertification for your
specific system, that is fine, but that does not mean the new kernel
should be built with an outdated toolchain. If the certification
allows replacing linux-3.18 with linux-5.10 but doesn't allow building
the kernel with a different toolchain compared to the rest, then
the point of the certification is rather questionable.

Do you know specific certifications that would require you to
do this?

> One problem we actually ran into in BSPs like that (we build with
> ptxdist, however build system doesn't matter here, it could as well
> have been buildroot etc.) was things* failing to build with newer
> compilers, things we could not or did not want to fix, so staying with
> an older toolchain was the obvious choice.
>
> *Things as in bootloaders for an armv5 platform.
...
>
> What we actually did: building recent userspace and kernel with older
> toolchains, because bootloader.

It sounds like you are trying to make an argument in favour of
deprecating old toolchains *earlier* in new kernels ;-)

If we simply made it impossible to have users build kernels with
the same old toolchain that is needed for building the old bootloader
or the old user space, it sounds like more people would do the
right thing and build the updated kernels with a better tested
toolchain, or update their bootloader as well. The only downside
is that some users would choose to remain on the older kernels,
so it shouldn't be too aggressive either.

         Arnd
