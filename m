Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C45318A07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 13:03:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbwJk00pFzDwmZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:03:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UWUJO+bs; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbw3r21qTzDvX9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 22:52:39 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D7EC64ED6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613044356;
 bh=PBeGwLjGEVNJ7GvWXwV/HotbITgDYxhkIawMCH+Lrbs=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=UWUJO+bsvWVj78WCD0fvipRTLnOXddNZEaQduxHnMCUXe77oubK0cIAs9RDYceIvG
 cooHtk01MuGnQsKy5R9I0hwrTPTpmTc3bOU2jsOakaZzwz9PZ14g9XY92xu9EroeDz
 86Pae8VNn9oqBg72oBPh8UzbLdSaaxXvC8WA9721EJmHmJZiXOdTQ6tHGSRgN5jKYt
 m/56TcdYnvel4dhiyjVJPnxd8M4BKBTKfKZgm6O6+UHTj7f5GJ/Hcu5DiT2+oSNbmS
 6LITPe3qmLaQFJQD13hmuw8tozlRoV0LRNo56kNCkMlu25moBI2ycn0Waxp8Mk4RsU
 BMoejHV7l3gCA==
Received: by mail-oi1-f169.google.com with SMTP id k204so5750705oih.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 03:52:36 -0800 (PST)
X-Gm-Message-State: AOAM532JEsDJdiKpAo9b34eZuWO2U3o4eHIP04TW34EXQOaOm5QqNT+y
 N5Y6w36PYA5r4HBmEPS37stOpTg8GJXjQL7oMoQ=
X-Google-Smtp-Source: ABdhPJzGRc5cUize8GW1KygKY5QB0/6HYJu2d/5NJ6GASLOCiQXtKEwJmHvgaTx+l4EO/iyAwaQnn0uo6oHda0i+L3M=
X-Received: by 2002:aca:e103:: with SMTP id y3mr2307802oig.11.1613044355483;
 Thu, 11 Feb 2021 03:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
In-Reply-To: <20210210190506.1923684-1-anders.roxell@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Feb 2021 12:52:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To: Anders Roxell <anders.roxell@linaro.org>
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 virtualization@lists.linux-foundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, SoC Team <soc@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 10, 2021 at 8:05 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Since patch ("virtio-pci: introduce modern device module") got added it
> is not possible to boot a defconfig kernel in qemu with a virtio pci
> device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
> to boot.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig         | 1 +
>  arch/arm64/configs/defconfig                | 1 +

Acked-by: Arnd Bergmann <arnd@arndb.de>

Michael, can you pick this up in the vhost tree that introduces the regression?

         Arnd
