Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B45372AEF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZLFc52K6z30CK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:25:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sTsLRdnn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sTsLRdnn; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZLF74c3Fz2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:25:29 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id d29so6091197pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Usua23eG7jeiBMRqPk961Vu0oHy/tcPvUmAPfGsd3M=;
 b=sTsLRdnna2sWw8Z9FaRNxSMft/pBwo/y8kKHX5A/bs3GC09QaDMsRY3ukXdyuzno5K
 TTskFLmfiBewHvymg8gVK4V/TVKfQ23eP/Tu218+y4OC9ZktHTTfkJaMdWa7vEwWHVHf
 VxYQ8k02YYjFMfqJEehpLYDZNE6BW1NlQEESuSmZ810jAvl03Y3YtDZxi0VRPLFBXUYJ
 uFkEjyscASDsMyBzUlSN2YID8zDZop12wU5y2YkeCcPz8pkVx3zQ8M+7EstrM8ejVLtl
 +UOwsKs2q6eecp6bytsFx6j4sQe81qn14UFJkgvj+14FZVfWqRencBKKh1p/ACnYmBNR
 rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Usua23eG7jeiBMRqPk961Vu0oHy/tcPvUmAPfGsd3M=;
 b=XZB6mIbK1QkV/d89XOhJWT3Rx//v5GFojpvnbFAlJCZy1Kh3P5zXTqoPmwdk06AOpc
 Vex9FJXIziuO0TkjmcRfqDwgbxFAvB98YY8rCoFDRzNoeB5DOBRi1dGl0Wn3ylJqBJFL
 W6cbsqd2c2tU5F0eyb4oAN02P9lkwomkt6iUMzPLPVo+VEFJfwiOF3cErKBG5qPw5bh5
 EP++KmrQkbkty9RDZA5ZWVeFqcHvqyt6fAmK6DVIpNs/IqGOlhu2kAGRW7Gj9D4dSwkT
 2OqUOKt9YFQ/vy2Z0+yn79z1akePwe7jQaOoDEiQTNdLOXiZ8MODU2A397LT6ybD06nI
 MWig==
X-Gm-Message-State: AOAM530hzZtcCNMRA3ohMyAfXu7ZsoRnhKW4bMInL+Nd63qyaO7Gft0d
 WvFiN1aQYSk3PYpFdS+2YpWmvqUj7Y0/rZGUDA5cnjhhoio=
X-Google-Smtp-Source: ABdhPJzvGspK5lFxakG5qrtBG+U2cTV9ewqHbVPwR6w2Q0rRyLr2DmXQST3reCaT/EdEu09iSl/HelPXit3utm0fpRE=
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr5218252pjv.129.1620134725780; 
 Tue, 04 May 2021 06:25:25 -0700 (PDT)
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
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 16:25:09 +0300
Message-ID: <CAHp75VdE9h9=CpzX094iJ52HR6Sz+f-qGfCt6YHfSPpG2Lb4-w@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 12:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> >
> > Desktops and servers are all nice, however I just want to make you
> > aware, there are embedded users forced to stick to older cross
> > toolchains for different reasons as well, e.g. in industrial
> > environment. :-)
> >
> > This is no show stopper for us, I just wanted to let you be aware.
>
> Can you be more specific about what scenarios you are thinking of,
> what the motivations are for using an old compiler with a new kernel
> on embedded systems, and what you think a realistic maximum
> time would be between compiler updates?
>
> One scenario that I've seen previously is where user space and
> kernel are built together as a source based distribution (OE, buildroot,
> openwrt, ...), and the compiler is picked to match the original sources
> of the user space because that is best tested, but the same compiler
> then gets used to build the kernel as well because that is the default
> in the build environment.
>
> There are two problems I see with this logic:
>
> - Running the latest kernel to avoid security problems is of course
>   a good idea, but if one runs that with ten year old user space that
>   is never updated, the system is likely to end up just as insecure.
>   Not all bugs are in the kernel.
>
> - The same logic that applies to ancient user space staying with
>   an ancient compiler (it's better tested in this combination) also
>   applies to the kernel: running the latest kernel on an old compiler
>   is something that few people test, and tends to run into more bugs
>   than using the compiler that other developers used to test that
>   kernel.

I understand that you are talking about embedded, but it you stuck
with a distro (esp. LTS one, like CentOS 7.x), you have gcc 4.8.5
there for everything, but they have got security updates. Seems if you
are with a distro you have to stick with its kernel with all pros and
cons of such an approach.


-- 
With Best Regards,
Andy Shevchenko
