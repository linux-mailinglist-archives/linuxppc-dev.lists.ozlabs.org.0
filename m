Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E221995D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 13:54:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s75y6qNGzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 22:54:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.12;
 helo=mailout2.w1.samsung.com; envelope-from=b.zolnierkie@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=BcjvcLxC; 
 dkim-atps=neutral
X-Greylist: delayed 423 seconds by postgrey-1.36 at bilbo;
 Tue, 31 Mar 2020 22:51:15 AEDT
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s72W19sbzDr7L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 22:51:12 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331114403euoutp0210aa151d754e464ace7df85e01b678c3~BYNxhx7Yv2185821858euoutp02m;
 Tue, 31 Mar 2020 11:44:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200331114403euoutp0210aa151d754e464ace7df85e01b678c3~BYNxhx7Yv2185821858euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585655043;
 bh=fLUaALAhJU0GPsppx99QNEL/LVVPbYb1Y86e+Ys2dEU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BcjvcLxCxjZiAgS0l2JcDE4a+/1VTtpXAljpF+BNuBk/ddxbw9AaQMqc/bx+A7uO8
 eLYS1g29m+nJM9prb9cCpQvYJDV6SZVpZvwqO50bq3xkg4Ki7KluWQKraVgIaEktEn
 HnSEjIZeroXgtE0/8kaBIsWol9YzXRDxyc1i+MNs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200331114403eucas1p2a2d75fd5ed7aa795b9dd75f82560f851~BYNxTCIpx2947329473eucas1p2i;
 Tue, 31 Mar 2020 11:44:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.03.60679.30D238E5; Tue, 31
 Mar 2020 12:44:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331114402eucas1p137fa539fd8880af609c144731c2268dd~BYNw3CN3i3094030940eucas1p1p;
 Tue, 31 Mar 2020 11:44:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331114402eusmtrp16e3bcf058264987d54e7bd63976dafb8~BYNw1rUfX0209802098eusmtrp1E;
 Tue, 31 Mar 2020 11:44:02 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-4b-5e832d03104e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.8B.07950.20D238E5; Tue, 31
 Mar 2020 12:44:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200331114400eusmtip1324ffeb3f4a193aca8ef85f592d3f465~BYNu7A0fm3131531315eusmtip1u;
 Tue, 31 Mar 2020 11:44:00 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc: Remove Xilinx PPC405/PPC440 support
To: Michal Simek <michal.simek@xilinx.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f29415e1-5a77-2f26-914a-91bb5a4428cc@samsung.com>
Date: Tue, 31 Mar 2020 13:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9c3e02ffa9812c6f046708b45932d40f33e8817a.1585575111.git.michal.simek@xilinx.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxTH89z3Niu7VgdPhGjSzRlNWpxj25ku7iVG7zeX7MOIyZhV78AN
 0LTC5pYtUMpbB1jaIVmpgoBDSKNYK1iQjmADGmIb45Cy2Axmg+1CQatEEO1WeiXj2/8853fO
 //w/PBypbGHXc0cKj4u6Qm2+ipFTPcOLPjWpLsvZdn+Uhpn2YRI8QQ8Ltc4KGjpvxCmoNTQS
 8MIyzMKphcskPDSUk1BVRkBosBKB3W+kwDx7joJmr4+GP+bnGDBPVbAwNbYPTjdZEFitDgRl
 bRcZmCjtJ6Dr7F0G/P5uFmrsBgTO+3dpOFvRTsGNuoc03OmzM7D0NE7DufHbBExNBmhw22/S
 MBerJmA2kg3XKz00hB6NUuAqGWKgwf80cZL5XwIWwwEKHN42FsoHvCw4HQmfKwNjLFx2NpCw
 1CiDe/MPqI80guOMAwlLzyxIOOP4QSg/ucAIpYEAI7g6JwihNVJCCfW31ILbFmSFFmeRYPRG
 aaHtWoQQamaMtODsqmaEWZ+PFcytg+jTDfvlHxwW848Ui7rMXQfkeaZgmDn2+4bvfP5hpgTN
 pZqQjMN8Fm7o8dMmJOeU/HmEJ9tHKKl4gvBflgApFY8Rdpp+oVZGrOVjrNToQDjYaX5ZRBG+
 5O2jl6m1vIAHJ2Lssl7Hb8UxwzixDJF8vwKfHFpMQgy/A9dXdqFlreB3YWPpWNKC4jfhykfG
 5PBrfDaOTV6nJWYNvvlrKMnI+BxsPF+fnCX5NPxnqJmQ9EbcG7Un78a8QY77A94ExCWK3Tjq
 +kSKsBb/M+JiJZ2BR601lMRfQPhFVfjlcC/CHdY4I1E78T3fM2Z5EclvwRf7MqXnj/FCuJ6S
 9qfgQHSNdEMKtvQ0ktKzAldVKCX6Tdz9WzezYmtyd5JmpLKtSmZblca2Ko3tf98WRHWhNLFI
 X5Ar6rcXit9q9NoCfVFhrubQ0QInSvyb0fjIk6uo7/nBIcRzSPWKYnKsNEdJa4v1JwqGEOZI
 1ToFs68kR6k4rD3xvag7+qWuKF/UD6F0jlKlKd5ujXyh5HO1x8VvRPGYqFvpEpxsfQnS7PR7
 3qldyJgeD7uvHvi5+ha+s33bla/UHfvTNDtux79+/fE859l90Eg0u9SpXldQ2DsgDvc3fhbO
 S5/O+LGpdXrvTPqUd89ErHlLXa/Nps6KPNj8PPXvd2ti+dT0ppRM0b0ntll2KWvje3XFr75h
 IbM/DP30+anMa/h9t2tO26RTUfo87VtbSZ1e+x/TpcUQMwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUybVRSHc9/PlqzJuwLjBt2mTSYJkc7CgEOzocZorhozE6MhTmENewOb
 lJJ+6WaiBVpgDZsFgmS1gzEgStME8w5x040hYGHi2jhtB04WGCxCZIWRIJudaEs14b/n3PN7
 7r0nOTJaKXHpsqOVZtFYqatQcUnMxMbYdBaVVVv8zMLdDFjq9tMwOD3IwympjoXe8Q0GTtW0
 UfB3s5+HTx9coGGlxkFDQy0F80P1CDxBOwOuSA8DHaMBFn5ZW+bANVvHw2zoIJz9rBlBS4sP
 QW1XHwdT1d9S4O0McxAMfslDo6cGgTQXZqGzrpuB8dMrLPz8jYeD6PoGCz03f6JgdmaShUue
 aywsr56kILJYBCP1gyzM359goN82zEFrcD32Jdc/FDxcmGTAN9rFg+PKKA+SL/bOV1dCPFyQ
 WmmItsnht7XfmefUxNfuQyT6VzMi7b4PieOTBxypnpzkSH/vFEXOL9oY0nQ9i1xyT/PknGQh
 9tF7LOm6vEiRxiU7SyTvSY5EAgGeuM4Podd3va3ebzRYzOIT5QaT+YDqkAay1ZoCUGfvK1Br
 cvLf1WbnqvYW7j8iVhy1isa9hYfV5c7pBa7q6q4PAkE/Z0PLO5xILsPCPtziCPFOlCRTCj0I
 R6bWY4Us1ngcj/VZE5lk/Cjs5BKZPxCO2ufYeCNZIHhoapWPc4qQiVdrblLxEC1MKHA0PEQn
 jDsIt/RubBqcoMVN9V4UZ4VQiO3VISbOjLAH19+3b96UKhThkYvu/zLb8bUz85sZuVCM7V80
 bZ7TQgZ+1H6DTnAa/nW+g0rwbvz1PQ/tQkr3Ft29RXFvUdxblHOI8aIU0WLSl+lN2WqTTm+y
 VJapSw16CcX2dcD/sP8ickbeGEaCDKm2KWZC1cVKVmc1HdcPIyyjVSkK7qCtWKk4ojt+QjQa
 SoyWCtE0jHJjwzXR6amlhtj2V5pLNLmafCjQ5Ofk5+SBKk3RIHz3jlIo05nF90SxSjT+71Ey
 eboN/fB0qO923o6rYwPJe07vJLPbV54cT9K+FlTNpVa8bG3oN0qO8LG170mHJrNc9fxLH7fm
 Xfepd8ofaxuo6yo9oyj68xZ+ZfHYQoH4KsXcDtx98cCd4Ju73+9u+NzbtBp4Kl17OKMk75Z0
 wzyT9eyJy5Ef3/qosyqSJn/h0IjW34iXrNtUjKlcp8mkjSbdv/JTKejFAwAA
X-CMS-MailID: 20200331114402eucas1p137fa539fd8880af609c144731c2268dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200330133235eucas1p2293a8ec8af48231bf220959d21913d55
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200330133235eucas1p2293a8ec8af48231bf220959d21913d55
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <CGME20200330133235eucas1p2293a8ec8af48231bf220959d21913d55@eucas1p2.samsung.com>
 <9c3e02ffa9812c6f046708b45932d40f33e8817a.1585575111.git.michal.simek@xilinx.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 sfr@canb.auug.org.au, Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Herring <robh+dt@kernel.org>, git@xilinx.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, monstr@monstr.eu,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/30/20 3:32 PM, Michal Simek wrote:
> The latest Xilinx design tools called ISE and EDK has been released in
> October 2013. New tool doesn't support any PPC405/PPC440 new designs.
> These platforms are no longer supported and tested.
> 
> PowerPC 405/440 port is orphan from 2013 by
> commit cdeb89943bfc ("MAINTAINERS: Fix incorrect status tag") and
> commit 19624236cce1 ("MAINTAINERS: Update Grant's email address and maintainership")
> that's why it is time to remove the support fot these platforms.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> # for fbdev

> ---
> 
> Changes in v2:
> - Based on my chat with Arnd I removed arch/powerpc/xmon/ changes done in
>   v1 to keep them the same as before. (kbuild reported some issues with it
>   too)
> 
>  Documentation/devicetree/bindings/xilinx.txt | 143 ------
>  Documentation/powerpc/bootwrapper.rst        |  28 +-
>  MAINTAINERS                                  |   6 -
>  arch/powerpc/Kconfig.debug                   |   2 +-
>  arch/powerpc/boot/Makefile                   |   7 +-
>  arch/powerpc/boot/dts/Makefile               |   1 -
>  arch/powerpc/boot/dts/virtex440-ml507.dts    | 406 ----------------
>  arch/powerpc/boot/dts/virtex440-ml510.dts    | 466 -------------------
>  arch/powerpc/boot/ops.h                      |   1 -
>  arch/powerpc/boot/serial.c                   |   5 -
>  arch/powerpc/boot/uartlite.c                 |  79 ----
>  arch/powerpc/boot/virtex.c                   |  97 ----
>  arch/powerpc/boot/virtex405-head.S           |  31 --
>  arch/powerpc/boot/wrapper                    |   8 -
>  arch/powerpc/configs/40x/virtex_defconfig    |  75 ---
>  arch/powerpc/configs/44x/virtex5_defconfig   |  74 ---
>  arch/powerpc/configs/ppc40x_defconfig        |   8 -
>  arch/powerpc/configs/ppc44x_defconfig        |   8 -
>  arch/powerpc/include/asm/xilinx_intc.h       |  16 -
>  arch/powerpc/include/asm/xilinx_pci.h        |  21 -
>  arch/powerpc/kernel/cputable.c               |  39 --
>  arch/powerpc/platforms/40x/Kconfig           |  31 --
>  arch/powerpc/platforms/40x/Makefile          |   1 -
>  arch/powerpc/platforms/40x/virtex.c          |  54 ---
>  arch/powerpc/platforms/44x/Kconfig           |  37 --
>  arch/powerpc/platforms/44x/Makefile          |   2 -
>  arch/powerpc/platforms/44x/virtex.c          |  60 ---
>  arch/powerpc/platforms/44x/virtex_ml510.c    |  30 --
>  arch/powerpc/platforms/Kconfig               |   4 -
>  arch/powerpc/sysdev/Makefile                 |   2 -
>  arch/powerpc/sysdev/xilinx_intc.c            |  88 ----
>  arch/powerpc/sysdev/xilinx_pci.c             | 132 ------
>  drivers/char/Kconfig                         |   2 +-
>  drivers/video/fbdev/Kconfig                  |   2 +-
>  34 files changed, 7 insertions(+), 1959 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
>  delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
>  delete mode 100644 arch/powerpc/boot/uartlite.c
>  delete mode 100644 arch/powerpc/boot/virtex.c
>  delete mode 100644 arch/powerpc/boot/virtex405-head.S
>  delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
>  delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
>  delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
>  delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
>  delete mode 100644 arch/powerpc/platforms/40x/virtex.c
>  delete mode 100644 arch/powerpc/platforms/44x/virtex.c
>  delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
>  delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
>  delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
