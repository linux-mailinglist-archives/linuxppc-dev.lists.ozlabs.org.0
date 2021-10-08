Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461942729C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 22:49:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR0gR0pkjz3bjW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:49:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5aYWkO1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20210112.gappssmtp.com
 header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5aYWkO1/; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR0fn263gz2xKS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 07:49:21 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so8726274pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a9TiIjRscGsypMhkU3F5Luwnaj1KEJJFH5jSCl+q5Ag=;
 b=5aYWkO1/pER1U5USV1nEzyfxkbQO2mlcDkvrtX6sMaZlASzY45T8jVHT1yvAxYPWEB
 EwS3cXT17cKvL/uUwqyF5aUu0nfLax8wNDE7eBZ1rXm/Z87sWBH2V0kjJG4aw5PDVdku
 sywmFFwo7yQ2Eej3VeweCP5KSbkvcmYtqVKxeRp2tW5oAEsBnQPvQn/5th4E+7rEAjaJ
 RZBbWZ1DuY+xf3V5rQiwoftIG2wSM0u4ay+xVYcPNg1KcFEbh2rIDAX3NpgdCVqtxD4V
 HclRMV4uqx91lL3UL88OlDgphWkDFbWhPzQiRA5PeyDWYAlQH8Zu1AxxfW7BWLe0oO6R
 pLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a9TiIjRscGsypMhkU3F5Luwnaj1KEJJFH5jSCl+q5Ag=;
 b=IgZth4pWOouoVBrWGFN6OpsZBy5J05JIdaAkpW4N2CZwOUP7UbpZDGMArjpCd6M2DN
 QeLzNTTWYLYr5UTQLCzxxnnTWS98uZOP9/LpqJ94C64Us03H/hqIe6f8x040/3axs+HL
 X5o2SbSJq2KpW2gJij+aLZWMw8/vubVZRSOlZXixuiia/iG0r2tM2ZFPqUi9BiE+0tNt
 s3tlDKrN4RwwD3VUzu9aeAFX5g8UG+KXHgdiM6js0YzpySxrFcj77pb6srBzGrKIobCP
 wvB3/dD0V55CP+c7QZQGHeyxOg+K3RLm1O62qcrbo854V4sD/WPwobG4kRnWo4lTX3Eu
 fUIw==
X-Gm-Message-State: AOAM531AQSF6XkGlbHXzAgNZkUS/EPEnGX+fkibJTqUMvw7q6La4Y8NP
 sjRYCAx/q5hWjAhRGt368rNL5cu4kzayiBzcZ0ayBw==
X-Google-Smtp-Source: ABdhPJxMnEH2xoi24RNEnru2y/0LaOJW4Sqmk5pa8/ErFS/VB9m9afA2AKxUjRr9u00R1TH2nvvEVqnmYTqcMO6JgUs=
X-Received: by 2002:a17:90a:7301:: with SMTP id
 m1mr14090869pjk.34.1633726157928; 
 Fri, 08 Oct 2021 13:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211008163532.75569-1-sven@svenpeter.dev>
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 8 Oct 2021 13:49:06 -0700
Message-ID: <CAOesGMgm-8c9ADbFSGRascCEE+ADEsK0v04tVCdd+wC_=GieCw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
To: Sven Peter <sven@svenpeter.dev>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Oct 8, 2021 at 9:36 AM Sven Peter <sven@svenpeter.dev> wrote:
>
> Hi,
>
> v1: https://lore.kernel.org/linux-i2c/20210926095847.38261-1-sven@svenpeter.dev/
>
> Changes for v2:
>  - Added reviewed-by/acks
>  - Switched from ioport_map to pci_iomap as suggested by Arnd Bergmann
>  - Renamed i2c-pasemi-apple.c to i2c-pasemi-platform.c as suggested by
>    Wolfram Sang
>  - Replaced the ioport number in the adapter name with dev_name to be
>    able to identify separate busses in e.g. i2cdetect.
>
> I still don't have access to any old PASemi hardware but the changes from
> v1 are pretty small and I expect them to still work. Would still be nice
> if someone with access to such hardware could give this a quick test.
>
>
> And for those who didn't see v1 the (almost) unchanged original cover letter:
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

Series:

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
