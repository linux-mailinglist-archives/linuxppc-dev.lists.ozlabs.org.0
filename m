Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF205B3440
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP9zw33SJz30Ck
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:43:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wdb6x0hG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wdb6x0hG;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP9zD5zpYz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:43:19 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3454e58fe53so12847837b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CjOr/xVdCatVWvrfBKrHvrf5/qwfqa22a/dV5JbB6Ns=;
        b=Wdb6x0hGfcz3f+ab9h93qPN15RUgQQOKVi2aFt+pDNe0fL0DvMs6qxRm/afiQ0zHms
         GuHo+QHZDfWCwP3x5Nhw2KtErCDmCFGD+Ev7WiFgzoU/lsin2IQViX0UW9n5lMSDAwxy
         Cc/xODhSz68S8kGpdq8vfRyxiYl+0hmK36cqqJt4K+oPIrs7/7flOmqVlzaq4x0fOeOR
         2ZiFyzHdxqeYxvn/Lspa9cikJuXK91RfxdLAnT9+cFw5YJkBN3ApsZyCxfNct7Tto7/d
         q3dFPx4BWvjN1uF+rGiWafmwO26m1yV7vi02ykBoH6Ox9jwdr+mW2/A+VZz3/WP7PmHj
         BwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CjOr/xVdCatVWvrfBKrHvrf5/qwfqa22a/dV5JbB6Ns=;
        b=jEal948l/64DC3FcmFj49de2GHswGMBqIkeNu2pdfZfq9dWUN2Ki7Rx0OH5U0v7is8
         LA/0w+wEFPotdhLHsP5/tS7mH3g8dlZBhMt7A6sX/1HsGxOq5Gs0mZkKJWMPfH3o7sDh
         qu0losU1yWvSkKYBoLdfcZz1aFoy8+W38UHuKrZAjT7ewKCPRx4FXs1MYY9WgwUCDqwN
         csRgXkiqIRYFz24+nVSyL5HOQmASsM8mHO5vJmW6VSZB4Evnf8NkaLEtcHT7zFKCM766
         AwGyJa6+RkPB8EhHnizQnlJt7ESKOzd+UkaKDAr++qO1P8jfTJHOIh1MveKSv8viHmzH
         RIPQ==
X-Gm-Message-State: ACgBeo2S8GMo/BrQVlz9xZYd0I3+wFTLBa+pLEObBAM7Aa9gQ5x+Onr3
	I6UAhlFyjFzSqEij1JDUgfn66h/5gIBNtwgR6eY=
X-Google-Smtp-Source: AA6agR6rVJh6TPlfqtSjbFfxwPrDCj6n15t/wcCkrItZvLKXf3DDre4zvFAl//4/COVWHFsukMwmkRQPTc4zgSco0pI=
X-Received: by 2002:a0d:f701:0:b0:32a:17d3:d189 with SMTP id
 h1-20020a0df701000000b0032a17d3d189mr11100556ywf.401.1662716594449; Fri, 09
 Sep 2022 02:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220909085505.15536-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220909085505.15536-1-lukas.bulwahn@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 9 Sep 2022 11:43:03 +0200
Message-ID: <CAKXUXMzuwzE4bSmq7okPo3Y2h6q_83NeERm8P9yQ1i393vyNBg@mail.gmail.com>
Subject: Re: [PATCH] ppc: select HAVE_PATA_PLATFORM in PPC instead of creating
 a PPC dependency
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-ide@vger.kernel.org
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 10:55 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit cc18e0fea790 ("LIBATA: Add HAVE_PATA_PLATFORM to select
> PATA_PLATFORM driver") introduces config HAVE_PATA_PLATFORM, and expects
> that all architectures simply select this config when the architecture
> supports using the PATA_PLATFORM driver.
>
> This is properly implemented already for all architectures except for the
> powerpc architecture. Implement this for powerpc now.
>
> Adjust the config of the powerpc architecture to use the config
> HAVE_PATA_PLATFORM and simplify the config PATA_PLATFORM to not mention
> any specific architecture anymore.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Please ignore this patch and pick:

https://lore.kernel.org/linuxppc-dev/20220909090343.21886-1-lukas.bulwahn@gmail.com/

Lukas

> ---
>  arch/powerpc/Kconfig | 1 +
>  drivers/ata/Kconfig  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 39d71d7701bd..2575e21b6e6b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -237,6 +237,7 @@ config PPC
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI                         if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>         select HAVE_OPTPROBES
> +       select HAVE_PATA_PLATFORM
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_EVENTS_NMI             if PPC64
>         select HAVE_PERF_REGS
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index 1c9f4fb2595d..ed3547165528 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -1103,7 +1103,7 @@ config PATA_PCMCIA
>
>  config PATA_PLATFORM
>         tristate "Generic platform device PATA support"
> -       depends on EXPERT || PPC || HAVE_PATA_PLATFORM
> +       depends on EXPERT || HAVE_PATA_PLATFORM
>         help
>           This option enables support for generic directly connected ATA
>           devices commonly found on embedded systems.
> --
> 2.17.1
>
