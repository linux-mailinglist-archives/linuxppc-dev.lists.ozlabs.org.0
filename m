Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8462C5B3449
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPB0Y6yccz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:44:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWmld3IT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWmld3IT;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP9zX4bvHz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:43:36 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-333a4a5d495so12492707b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7ZB/vFj1LBEvoFTPtCpwJzQSMMS3bz1eErTDvpmrofs=;
        b=BWmld3ITX+giHZRWkJWwbcDCiOUpMOxQyqf6WsoI7BqlMauyRaz/ygBKpHYYcBNO+X
         tUxzbx0oJP2PdXRc4UssH4YzjbKa/tcZH7uuybjb+cmvR5GjcY7cZ/Xsbyy+i1O+eVY/
         5/eT+SZULnxNPSVsQc5sDf7lQCC7IoTjd1fArydNSxtxWzw2iE/Fln6qxNRm4kefwf37
         4M6EC6OUSjfjZqTc+UWWlYsyNA3Oed/L+1/CNdtZ3ENyEEc/cmVDMI1zpmkJNfkxuGYp
         yxVvAV/1WQPtYBsUTCvuAEcN+S8yvFEBQZDSt5Fkb86VT+ZJwOTRpUJOP8tNS5jFDDd2
         qt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7ZB/vFj1LBEvoFTPtCpwJzQSMMS3bz1eErTDvpmrofs=;
        b=njoUP+dKrxz5E7b9hxKT4ePLllM1Oiy+VZsaePeIXYx6qTgOLNfOfSGBF+st9uM9jx
         NNzcb3VJpfo1Z3W8MktHQkjmP48OMLfNF832BQmbs6pbKr6GVimGaJ+UL+tZjBxRCkD2
         nqZ/wxOvFQAwel6rfXVzMj2dFB1S3nMowdgqr5IEuO9dfsjfFSQyfOeG6wWPGo61lsDu
         T72CwLokBY0fo/XiWupTfSxsg0EPJ3INJ2sDNJ2iowuvCMt1Z26/zpC6lLvliooZgl64
         W8MGWWK88iNpITqnUFxHuswFpQiD41VqFFm6EZ9ARHfiFSlkFO9tFajESK5RgNlxp5u0
         t2zA==
X-Gm-Message-State: ACgBeo34iM6rjmh8bwQ891S+YOiYI2NH8zRb/qIjIfatlFDv2lNdqWOy
	ypQeJU4wNQhh4spJdnlSYyBfgxEhaZmW7+uQzWA=
X-Google-Smtp-Source: AA6agR5jda4a3EcM5GDvNbwnprqfr/4CFDLarXT4mFEldLG0qPusFNe2TD+NpCjCIUQz5j77+wo6CNsqhSjzPuzhyYc=
X-Received: by 2002:a81:7702:0:b0:328:297a:fdcb with SMTP id
 s2-20020a817702000000b00328297afdcbmr11117970ywc.335.1662716613820; Fri, 09
 Sep 2022 02:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com> <20220909090343.21886-2-lukas.bulwahn@gmail.com>
In-Reply-To: <20220909090343.21886-2-lukas.bulwahn@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 9 Sep 2022 11:43:23 +0200
Message-ID: <CAKXUXMyDON2ys_bxNi07h_BOYkjd1Gidi6qTHXQ-=L5Vsu9kxA@mail.gmail.com>
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

On Fri, Sep 9, 2022 at 11:04 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
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
