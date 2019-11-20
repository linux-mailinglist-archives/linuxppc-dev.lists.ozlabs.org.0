Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9701042C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 19:02:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J9WC3Qt4zDqvP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 05:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J9Sl3pXLzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 04:59:49 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id s71so550562oih.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 09:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBB9OsnBCrlScEEQaEUduHBYkfuZALzvxczmYt/dJsU=;
 b=B92Pf2bDtIUvVHhLQeFGHgh5OcCRBoTDJwB/UvlLshrqnvQRTuCxY/Nb8xAuIXJ1Yw
 4fDiteD2lf0dRYcfrpCJc9xY082/kd2DxprFc0SfEMRY+6GOFcFX/+7+r6JRRUYQCUrP
 i88Q7dILWLE1PpVuEimKQRwMpY11G2TflMh+LkLkT8m1dpzEMaTSXwQ4Yh0P0hxOLkm2
 RqRP4RlNip9vIUjOGwOLWwmEsDWY1d9PZfOmlVm2mT756I0XZp0lK2M/cn/eaLdZ0dQp
 hqmddNy7CbtzCvpdQHejy0mlZP73eDk8H5huaz8DVaBe11pMkhUmAQAQCqJmBfGmPLn8
 NoIQ==
X-Gm-Message-State: APjAAAWjgkf6XYpEDC7n7bCgnDYqrMUJ/6z20eqe1Aj8QvIpoa7pLSSR
 MkCBH6nUEx2KgHk+G6NMxP2W4181
X-Google-Smtp-Source: APXvYqwSNtVSKEvrO6xc0KMVueYpoGGnZn4Wh7CE4G3w5k4/7vC2L0XAr2LQZH4YnH1WPcmEYlyyVQ==
X-Received: by 2002:aca:5441:: with SMTP id i62mr3793818oib.42.1574272787182; 
 Wed, 20 Nov 2019 09:59:47 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45])
 by smtp.gmail.com with ESMTPSA id q3sm8566383oti.49.2019.11.20.09.59.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 09:59:46 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id z25so386641oti.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 09:59:46 -0800 (PST)
X-Received: by 2002:a9d:173:: with SMTP id 106mr3009123otu.205.1574272785900; 
 Wed, 20 Nov 2019 09:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
 <20191118112324.22725-14-linux@rasmusvillemoes.dk>
In-Reply-To: <20191118112324.22725-14-linux@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 20 Nov 2019 11:59:34 -0600
X-Gmail-Original-Message-ID: <CADRPPNT4+zZd6fezcDcN=0EcezR4mHqnrOBBEexqBLyrV_THXQ@mail.gmail.com>
Message-ID: <CADRPPNT4+zZd6fezcDcN=0EcezR4mHqnrOBBEexqBLyrV_THXQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/48] powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Scott Wood <oss@buserror.net>
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
Cc: Timur Tabi <timur@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 5:29 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:

Hi Scott,

What do you think of the PowerPC related changes(patch 13,14)?  Can we
have you ACK and merge the series from soc tree?

Regards,
Leo
>
> This is now exactly the same as mpc83xx_ipic_init_IRQ, so just use
> that directly.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  arch/powerpc/platforms/83xx/km83xx.c      | 2 +-
>  arch/powerpc/platforms/83xx/misc.c        | 7 -------
>  arch/powerpc/platforms/83xx/mpc832x_mds.c | 2 +-
>  arch/powerpc/platforms/83xx/mpc832x_rdb.c | 2 +-
>  arch/powerpc/platforms/83xx/mpc836x_mds.c | 2 +-
>  arch/powerpc/platforms/83xx/mpc836x_rdk.c | 2 +-
>  arch/powerpc/platforms/83xx/mpc83xx.h     | 5 -----
>  7 files changed, 5 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
> index 5c6227f7bc37..3d89569e9e71 100644
> --- a/arch/powerpc/platforms/83xx/km83xx.c
> +++ b/arch/powerpc/platforms/83xx/km83xx.c
> @@ -177,7 +177,7 @@ define_machine(mpc83xx_km) {
>         .name           = "mpc83xx-km-platform",
>         .probe          = mpc83xx_km_probe,
>         .setup_arch     = mpc83xx_km_setup_arch,
> -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
>         .get_irq        = ipic_get_irq,
>         .restart        = mpc83xx_restart,
>         .time_init      = mpc83xx_time_init,
> diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
> index 6935a5b9fbd1..1d8306eb2958 100644
> --- a/arch/powerpc/platforms/83xx/misc.c
> +++ b/arch/powerpc/platforms/83xx/misc.c
> @@ -88,13 +88,6 @@ void __init mpc83xx_ipic_init_IRQ(void)
>         ipic_set_default_priority();
>  }
>
> -#ifdef CONFIG_QUICC_ENGINE
> -void __init mpc83xx_ipic_and_qe_init_IRQ(void)
> -{
> -       mpc83xx_ipic_init_IRQ();
> -}
> -#endif /* CONFIG_QUICC_ENGINE */
> -
>  static const struct of_device_id of_bus_ids[] __initconst = {
>         { .type = "soc", },
>         { .compatible = "soc", },
> diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
> index 1c73af104d19..6fa5402ebf20 100644
> --- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
> +++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
> @@ -101,7 +101,7 @@ define_machine(mpc832x_mds) {
>         .name           = "MPC832x MDS",
>         .probe          = mpc832x_sys_probe,
>         .setup_arch     = mpc832x_sys_setup_arch,
> -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
>         .get_irq        = ipic_get_irq,
>         .restart        = mpc83xx_restart,
>         .time_init      = mpc83xx_time_init,
> diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> index 87f68ca06255..622c625d5ce4 100644
> --- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> +++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> @@ -219,7 +219,7 @@ define_machine(mpc832x_rdb) {
>         .name           = "MPC832x RDB",
>         .probe          = mpc832x_rdb_probe,
>         .setup_arch     = mpc832x_rdb_setup_arch,
> -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
>         .get_irq        = ipic_get_irq,
>         .restart        = mpc83xx_restart,
>         .time_init      = mpc83xx_time_init,
> diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
> index 5b484da9533e..219a83ab6c00 100644
> --- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
> +++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
> @@ -208,7 +208,7 @@ define_machine(mpc836x_mds) {
>         .name           = "MPC836x MDS",
>         .probe          = mpc836x_mds_probe,
>         .setup_arch     = mpc836x_mds_setup_arch,
> -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
>         .get_irq        = ipic_get_irq,
>         .restart        = mpc83xx_restart,
>         .time_init      = mpc83xx_time_init,
> diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> index b7119e443920..b4aac2cde849 100644
> --- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> +++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> @@ -41,7 +41,7 @@ define_machine(mpc836x_rdk) {
>         .name           = "MPC836x RDK",
>         .probe          = mpc836x_rdk_probe,
>         .setup_arch     = mpc836x_rdk_setup_arch,
> -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
>         .get_irq        = ipic_get_irq,
>         .restart        = mpc83xx_restart,
>         .time_init      = mpc83xx_time_init,
> diff --git a/arch/powerpc/platforms/83xx/mpc83xx.h b/arch/powerpc/platforms/83xx/mpc83xx.h
> index d343f6ce2599..f37d04332fc7 100644
> --- a/arch/powerpc/platforms/83xx/mpc83xx.h
> +++ b/arch/powerpc/platforms/83xx/mpc83xx.h
> @@ -72,11 +72,6 @@ extern int mpc837x_usb_cfg(void);
>  extern int mpc834x_usb_cfg(void);
>  extern int mpc831x_usb_cfg(void);
>  extern void mpc83xx_ipic_init_IRQ(void);
> -#ifdef CONFIG_QUICC_ENGINE
> -extern void mpc83xx_ipic_and_qe_init_IRQ(void);
> -#else
> -#define mpc83xx_ipic_and_qe_init_IRQ mpc83xx_ipic_init_IRQ
> -#endif /* CONFIG_QUICC_ENGINE */
>
>  #ifdef CONFIG_PCI
>  extern void mpc83xx_setup_pci(void);
> --
> 2.23.0
>
