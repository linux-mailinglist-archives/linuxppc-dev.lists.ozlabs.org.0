Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09D2FE3C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 08:19:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLv0f2fLxzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:19:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QwVlgg8H; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLtyb4TlGzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 18:17:59 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id u17so2154033iow.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 23:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FvUB6aKTOzb1ncLTrU4MC8B0a/Xf0eV3JbdY7KR8XWI=;
 b=QwVlgg8H6YaIXQT8K3QbhZQTqbg+fz1+f8csutbYeK0afl43h35YReYeN7eW0fK7uM
 cKKo4VHjgH0wfjQJ/0bHJqJR5ZLU1zmy1t8aS2f4SnwCza3+QJKLdP3IrUq9Ds9BdDia
 bwXPDY26PwIHrJu6ccb3XvEV9wkek0iOJl5R5N/ptYEnf8h1AkmMMPVavUTSzJ4VIbyY
 hf87LxPVQv4SBjrFWEV8s3T6sipvBuG6jj5fp63VzQbBlg/ZQPLVUrVgDf9NeCD3U2mT
 5kwSHK1LHp8cwvAQ+ENR2VJbtAyElHXd2rWyliC0FoH7HHagDNOdfCKwh2zP6rl1MEf7
 B/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FvUB6aKTOzb1ncLTrU4MC8B0a/Xf0eV3JbdY7KR8XWI=;
 b=Ql2bxsOmP0BD5rRhWMfVohwqeSUZ1ee90gMorKXbKjHFv5I9Su8Rix00HTt8Uiub2w
 dNxdRNOodxxutzzgkZVobiU9w9w2EQ8iX6DQTHWjPCU+3H+w9zDM1O+6AooqEXoUzJOy
 TqMwKE+S6fLqor9A4qlQLp9n5XE2wsOKUVxLJBvFWjBNdTK6NfK2SfpYFYaKMV1Jtkl2
 dZKOQAEs5ZZqVcP3FAgpM2oDoByw/iP8WL+RVomx0IlU1r/DZB7onCA25dFnnzQRob4q
 YLOOpisH5haNoQN+KRSfCKX3d9g4Y4wN0Ax9619Mu0FmqxWIUTyTfod7VYXAIfckF49q
 3dtQ==
X-Gm-Message-State: AOAM532h1iMD+KF3LLMAN9ZgXjIm4S1udqPQy8MsXU26Z4LtPjTabOXJ
 YAR3C76uOHTjdMkKZFLIZYdXl1kKDzhq4btn3NE=
X-Google-Smtp-Source: ABdhPJwgRob+ZjxdJAWZNxtHrVKFw7ZkLEMIbc6KQ7HYWxcfM4fkRI2BTyyG9XtnH6owVm+gjLQlUk2Q+xSGkAr+Odw=
X-Received: by 2002:a6b:d804:: with SMTP id y4mr9243979iob.141.1611213475934; 
 Wed, 20 Jan 2021 23:17:55 -0800 (PST)
MIME-Version: 1.0
References: <CAAH8bW8-6Dp29fe6rrnA4eL1vo+mu0HuAVJ-5yjbwxDSvaHdeQ@mail.gmail.com>
 <6c442012-3bef-321b-bbc3-09c54608661f@infradead.org>
In-Reply-To: <6c442012-3bef-321b-bbc3-09c54608661f@infradead.org>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 20 Jan 2021 23:17:45 -0800
Message-ID: <CAAH8bW-az-WSnbHshwmFuu=oANiZyVKCZ+dHoN119Cy-5KftMA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix AKEBONO build failures
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 10:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/20/21 1:29 PM, Yury Norov wrote:
> > Hi all,
> >
> > I found the power pc build broken on today's
> > linux-next (647060f3b592).
>
> Darn, I was building linux-5.11-rc4.
>
> I'll try linux-next after I send this.
>
> ---
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fulfill AKEBONO Kconfig requirements.
>
> Fixes these Kconfig warnings (and more) and fixes the subsequent
> build errors:
>
> WARNING: unmet direct dependencies detected for NETDEVICES
>   Depends on [n]: NET [=n]
>   Selected by [y]:
>   - AKEBONO [=y] && PPC_47x [=y]
>
> WARNING: unmet direct dependencies detected for MMC_SDHCI
>   Depends on [n]: MMC [=n] && HAS_DMA [=y]
>   Selected by [y]:
>   - AKEBONO [=y] && PPC_47x [=y]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/powerpc/platforms/44x/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- lnx-511-rc4.orig/arch/powerpc/platforms/44x/Kconfig
> +++ lnx-511-rc4/arch/powerpc/platforms/44x/Kconfig
> @@ -206,6 +206,7 @@ config AKEBONO
>         select PPC4xx_HSTA_MSI
>         select I2C
>         select I2C_IBM_IIC
> +       select NET
>         select NETDEVICES
>         select ETHERNET
>         select NET_VENDOR_IBM
> @@ -213,6 +214,7 @@ config AKEBONO
>         select USB if USB_SUPPORT
>         select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
>         select USB_EHCI_HCD_PLATFORM if USB_EHCI_HCD
> +       select MMC
>         select MMC_SDHCI
>         select MMC_SDHCI_PLTFM
>         select ATA

Looks working, thanks.

Tested-by: Yury Norov <yury.norov@gmail.com>
