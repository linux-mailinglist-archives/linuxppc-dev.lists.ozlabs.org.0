Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0F419046
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 09:55:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHw1R74b3z2ypg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 17:55:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 770 seconds by postgrey-1.36 at boromir;
 Mon, 27 Sep 2021 17:55:30 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHw0y2g0xz2yMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 17:55:28 +1000 (AEST)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAgMY-1mfjd50qca-00B53i for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep
 2021 09:42:35 +0200
Received: by mail-wr1-f42.google.com with SMTP id c21so19968980wrb.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 00:42:34 -0700 (PDT)
X-Gm-Message-State: AOAM532OAukQlOgwNSBC+qvYPNkV0Wfej9zPzYSjm6V40s0wyFTqXLU4
 3mxkuJ5yWDxzZjy4zCYqyvNxSCmxbTYdMj6Y4Xo=
X-Google-Smtp-Source: ABdhPJyAwJs1fMl5WROWadibQbf9i4s452vEEuGBlKBwwPRVMz4Z4aFhReOWFzEvxiKPsQdFWNyIVMvgFQmk0bW7ncQ=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr25501837wru.336.1632728553884; 
 Mon, 27 Sep 2021 00:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210926095847.38261-1-sven@svenpeter.dev>
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Sep 2021 09:42:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
Message-ID: <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add Apple M1 support to PASemi i2c driver
To: Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ttUwYTCNlmaOz7TsaNLaFXSyPrINU24oX5vqBPUmNQ+d/v+zSw6
 eBpPeVk77ZtExgDKIR74y1KoYE8kRK6AjjFz+M/8jy92Y+tTmavzAIcQza+MZP+49SE1coo
 JpLkaygROPSl5GBaM5yZrzRxSA1b3r3fdAqXFGvtJGm2+cnUcVknnd7nM3dto7t3HeSvG+F
 +foblJNn5cBCk8OalnA8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Eoc7ffC1BE=:RJvAfCqZJ0dZ3MYogKCcHr
 ejk9v/RNGOjQv9MyLC+BzhtD1yppXJGgLlzwZ5OhXO36YmVJXt11CksLAZY/FmgJb4QSBBTay
 kvOnnkNXyOtL2p8YoDzKUso1iSIGdYINhVAcsXe1Kpm7C3dJj61N9goB/oqk/ufkGFhlY2pe6
 TCy+IFMi6p4tOOTwrmJVamJx7x0a0NNN0Lvjv80ePLtQcJVsJovTrFYY80yGzYjvdLT6IjBfk
 5pNQF4y83VVnRrsC4PnzHNAsSekV5MP8AFpi5/qOPuB6E9qAOMIbjoihoWMwWP0mjBTCrMZsZ
 3TEPuYG22c/nCtifPdP/52MNbMEotKMlu/KNVzGG2IZk3X+RZDbIXOWZEsZOgHI4Yhq6I+Any
 FOA55EbsI77Bhg8bggoBY3Esfix5x5xQPUdhAHRNw76M/rtUQ2/25B2Jdo5SgfvLhH3Efrf5k
 o69z8HL9rc27+CL/h+1cobYVEw5UFrYpsV9+Qy+svvSTRdiUrTAibbhaunFKB3iN915NyKzLJ
 x46wMv8Dht7HjhO2kIu0L4NswfnbbkhGZlpUhJYsoYAQeQdxLxvpoThoK3okrUHbBWikbEBQa
 u8yjMKrZweX4dbIcKJeQeGwpVXs1r6Uqs+agH6J/pXBrHNJuhYLNhfPvzakt9CChcpct35KpR
 n5Xc2zp5Bu+bqXUArd6JH5wwAHfkXpxIqEwfFqfOZ6GKGWssZE5Bg+Hizf1Q9OG2XP7S0JHzG
 JGGVlANWeYCzaCiHsnIKtYESlHrpuDRqKdEaTw7mS154eDBVoj0FYIY3tzgsXpNsg8mEzlO3c
 /WurLInBg/FnWTHSXmdzt1ola7iPhgeVYqAtPrY18ByomotAae/WRjhiKRxO8Rli3MzQvIdDy
 9hWzI3DSMRmAOkWOL2NQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 26, 2021 at 12:00 PM Sven Peter <sven@svenpeter.dev> wrote:
>
> This series adds support for the I2C controller found on Apple Silicon Macs
> which has quite a bit of history:
>
> Apple bought P.A. Semi in 2008 and it looks like a part of its legacy continues
> to live on in the M1. This controller has actually been used since at least the
> iPhone 4S and hasn't changed much since then.
> Essentially, there are only a few differences that matter:
>
>         - The controller no longer is a PCI device
>         - Starting at some iPhone an additional bit in one register
>           must be set in order to start transmissions.
>         - The reference clock and hence the clock dividers are different
>
> In order to add support for a platform device I first replaced PCI-specific
> bits and split out the PCI driver to its own file. Then I added support
> to make the clock divider configurable and converted the driver to use
> managed device resources to make it a bit simpler.
>
> The Apple and PASemi driver will never be compiled in the same kernel
> since the Apple one will run on arm64 while the original PASemi driver
> will only be useful on powerpc.
> I've thus followed the octeon (mips)/thunderx(arm64) approach to do the
> split: I created a -core.c file which contains the shared logic and just
> compile that one for both the PASemi and the new Apple driver.

This looks all very good to me, I had one very minor comment.

Whole series

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
