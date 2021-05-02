Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1D370F43
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 23:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYJmN3D0Lz302p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 07:15:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YBiD6aB1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=YBiD6aB1; 
 dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYJls3XtFz2ydH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 07:15:02 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a4so5015149ejk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
 b=YBiD6aB1h/sCqYhKTphH+dg0wIZGGo6mw2O+h2UbBPaKs2j+amxCQcnTb6T4EcSFDi
 569RK7dsnKNOuJGN1Zq3Sl1+5gAq1k0k2Eo073vJURqtQ79ulv+UTiBKQN1QHx0TnXJL
 8kMigLRMuOZq6Z9mW4YA2S0oPDLTJFBkJG6AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
 b=Ula9cdoSCb8ggF/A6JinBGmo0IJbRqFjpg3/RLIbqdzktw1kKq9R3SI4lpz50McWY5
 if4fv8J4Gm5Tn4QBLleFXQFHsJBt4nuEUlJSA5AWsrop1i/UGuX0oyEQ6HDh5vo9CpT8
 4Cfv7q/Pc1M7UBXbAaC1AqnGBYZT9NnwsWS2jL8VcjNHRoHBAxPTqbCtQEJJk08HdcFp
 OXAT+uWUVfknv243PRrcNByViEK9RC9pdgcjjhDB96FGxorRS+tuTfU2fToZuMe2Vv6Y
 OCDxJssNGVLpRW8wfuHt3Pz47ENwxWmLWj3XfsKyLaixNRtaJWjnrq/phg4GEQJldGjv
 an/w==
X-Gm-Message-State: AOAM532BoIzzFQ2ngzTzSIbvYeHvQwveU9/6mW7DZ9wOeC+jd4+dYU5w
 lrRImHw/3Oq4s6Yk7yrVqp0Vs+R/B0KBWaG5Clk=
X-Google-Smtp-Source: ABdhPJwGC7DM+8bB8oEWRSHI2rVSEiBpDXzL7DTAhnaQ8m7e0VRiSi3oN+P4LWOxL8xXe3LY7IuH7g==
X-Received: by 2002:a17:906:170a:: with SMTP id
 c10mr13466628eje.493.1619990097010; 
 Sun, 02 May 2021 14:14:57 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44])
 by smtp.gmail.com with ESMTPSA id d25sm4611897ejd.59.2021.05.02.14.14.56
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 14:14:56 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id t4so5045156ejo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 14:14:56 -0700 (PDT)
X-Received: by 2002:a2e:330f:: with SMTP id d15mr11126850ljc.251.1619989727157; 
 Sun, 02 May 2021 14:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 May 2021 14:08:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Segher Boessenkool <segher@kernel.crashing.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 2, 2021 at 1:38 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> The point is, you inconvenience users if you require a compiler version
> they do not already have.  Five years might be fine, but three years is
> not.

So this should be our main issue - not how old a compiler is, but how
our compiler version limitations end up possibly making it harder for
users to upgrade.

Of course, one issue there is whether said users would have upgraded
regardless - if you have a very old distribution, how likely are you
to upgrade the kernel at all?

But we do very much want to encourage people to upgrade their kernels,
even if they might be running otherwise fairly old user space. If for
no other reason than that it's good for our kernel coverage testing -
the more different distributions people test a new kernel with, the
better. And some of the less common architectures have their own
issues, with distros possibly not even supporting them any more (if
they ever did - considering all the odd ad-hoc cross-compiler builds
people have had..)

This is why "our clang support requires a very recent version of
clang" is not relevant - distributions won't have old versions of
clang anyway, and even if they do, such distributions will be
gcc-based, so "build the kernel with clang" for that situation is
perhaps an exercise for some intrepid person who is willing to do odd
and unusual things, and might as well build their own clang version
too.

So I really wish people didn't get hung about some "three years ago"
or similar. It's not relevant.

What is relevant is what version of gcc various distributions actually
have reasonably easily available, and how old and relevant the
distributions are. We did decide that (just as an example) RHEL 7 was
too old to worry about when we updated the gcc version requirement
last time.

Last year, Arnd and Kirill (maybe others were involved too) made a
list of distros and older gcc versions. But I don't think anybody
actually _maintains_ such a list. It would be perhaps interesting to
have some way to check what compiler versions are being offered by
different distros.

           Linus
