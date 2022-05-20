Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569252EC3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 14:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4R773J3tz3cKp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 22:36:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Fri, 20 May 2022 22:36:25 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4R6d5kslz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 22:36:25 +1000 (AEST)
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3lgL-1nrCZQ1Bit-000ukx for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May
 2022 14:31:11 +0200
Received: by mail-yb1-f174.google.com with SMTP id p139so13905237ybc.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 05:31:10 -0700 (PDT)
X-Gm-Message-State: AOAM531KNPcgMWBDO5OU2eecDETMwuAJkiWosh8+qh0o949d5ExvdNRl
 jWuth0ku/UDztaAOUhSq+hH+WnSrzzV8ZBsN38w=
X-Google-Smtp-Source: ABdhPJzM0/g+q1PRwguziGorhB8SDUsN9iEFZbR/3vnqE9X6zeZuqHYx8uEJ7JXjS9vB4zG423aFir2s+dxjeU1ONqo=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr9208955ybx.472.1653049869839; Fri, 20
 May 2022 05:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220519031345.2134401-1-kuba@kernel.org>
In-Reply-To: <20220519031345.2134401-1-kuba@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 May 2022 13:30:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_4fNQV51V0-QUnuTr4dK0-S_ffeFzfA8vG1uGh8vyhg@mail.gmail.com>
Message-ID: <CAK8P3a3_4fNQV51V0-QUnuTr4dK0-S_ffeFzfA8vG1uGh8vyhg@mail.gmail.com>
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip &
 DIGITAL EtherWORKS PCI/EISA
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4DNiUpEaC+69SL5KQkB95/4DmjZDb5zG8tN3FFoD9Rww+rlO6rW
 Q9mdL1jaJMOG5sIkd1HluvJZ1FZ877yVvVZZTm6ZPekug2d7gK4nxwgi8G3cZcFU7vCClhH
 LqjkU0ZFbocxzuuTpO7Gn0kYT0d/3gDHjScaqu7U+bT8sxXWIicFi64ZmkAn/MSCcmlIaC1
 Bz0N2b64xP9d3Sa8v8KRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZUB5bkq4gTM=:naH8uxo6tlnXfHAsabs/Pr
 X6PWReRh6Uopty1u8yc9LZsYhXAd3sp3LJBsF57sE9pTgv2o6UZ2hQ/Kse8qErOq7kd+XDmlX
 F/42aLj/bE8IYyx898Z+4hlYjjqZWvXvMXzxzCp2quhhgtLIWPPvkVamK7gVq9pCr6pHGLkrD
 Lw290rrgwLO3vxhbNpfthd+yT2ReZhNO9SorB9aU8jcG5Uw2SX0/wAr3HNUTZY7gXZm9DDFDG
 Yrph5ZnpAlTAQoBtfuJIiF8Xdke9ljeDmTUxDRhjxcz/FbHelAvcUH2q7AY0WcG+rQ3Ng+baG
 45rS9r1zymVjRNl0Dz1QJmjkbi04yJ20VO2xt0R2x4D/G+KhG1BK82BudcAOyvlJyZrTUp3LW
 JPinZLil5VjAhZDAzhqWwHtHa/uOGphaficfakX2KkfFbXIsgQOt9gXwGMeYSVgggSuwgsvqT
 UWEOYTNcjl181VMXiG4BgOelxqsJl9LmFrW6OA+/T16ueVR1RJ/iGnpd3lDS+iyWFq/UIyRr+
 Rfu+8qZ0LMSypWf1vKFXsU3Zo29OSisr4/91VzCCiPDxj7g0X1lRPLRn+PWstl2Y3lZrLSP0O
 8+M9VPQRePT6RAiyMa+9lUjZLwCubNf7w6eky0gZWifaByUZJbhGyd5If4CThARa8pClkntOT
 skVcU9QBTFSW8c0oGxkPiDKe9suTtoMrrqxJNlHEAHDA9jAzeVEgmOoDKWYaquxk/fJVk2m3E
 y+0OjKd38+caoLjpUB7JN5e8aAgO2Bg1jyWZQ3ZfPPE+o2B3IuqwwavpPfUyekuGFtBADa8sp
 AFdd8an9nynbwSwiTf7Zrb4mGIEK6XDp4a2DPNcTat1rtwwuuTCCOTsjSsvLblRaeoCRkVeOW
 4ou+Ut4MXDI8nAH925Iw==
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, arnd@arndb.de,
 corbet@lwn.net, netdev@vger.kernel.org, sburla@marvell.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edumazet@google.com, paulus@samba.org,
 vburru@marvell.com, zhangyue1@kylinos.cn, pabeni@redhat.com,
 aayarekar@marvell.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 4:13 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Looks like almost all changes to this driver had been tree-wide
> refactoring since git era begun. There is one commit from Al
> 15 years ago which could potentially be fixing a real bug.
>
> The driver is using virt_to_bus() and is a real magnet for pointless
> cleanups. It seems unlikely to have real users. Let's try to shed
> this maintenance burden.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: tsbogend@alpha.franken.de
> CC: mpe@ellerman.id.au
> CC: benh@kernel.crashing.org
> CC: paulus@samba.org
> CC: sburla@marvell.com
> CC: vburru@marvell.com
> CC: aayarekar@marvell.com
> CC: arnd@arndb.de

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  .../device_drivers/ethernet/dec/de4x5.rst     |  189 -
>  .../device_drivers/ethernet/index.rst         |    1 -
>  arch/mips/configs/mtx1_defconfig              |    1 -
>  arch/powerpc/configs/chrp32_defconfig         |    1 -
>  arch/powerpc/configs/ppc6xx_defconfig         |    1 -
>  drivers/net/ethernet/dec/tulip/Kconfig        |   15 -
>  drivers/net/ethernet/dec/tulip/Makefile       |    1 -
>  drivers/net/ethernet/dec/tulip/de4x5.c        | 5591 -----------------
>  drivers/net/ethernet/dec/tulip/de4x5.h        | 1017 ---


I checked the defconfig files to make sure we are not removing the
last ethernet driver from
one of them. mtx1 has built-in networking and no PCI slot, so this is
definitely fine.
the ppc32 configs are for machines with PCI slots and also enable
multiple drivers but I saw
nothing specifically needing this card.

       Arnd
