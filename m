Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328144299C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 01:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSvvy3hGZz2yyj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 10:22:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cWQWbnf5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cWQWbnf5; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSvvH4bP5z2xr3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 10:21:45 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id i1so16762052qtr.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LwU5By0Gzei8sVThx0In3OGporfMt9E0ai5ng3WmKEA=;
 b=cWQWbnf55Oue5k2YJvqAYcGepYyUY93Ql/ZUhxPocuggxAQlTNtXb2lYPXowxh7ao7
 t3j7lgO0vkAPC2f70TZLDUKZ07ApZ3xUiSMR+x+SxSNiWQS9AJ80oopFoHKV9He8x0a5
 LREa079JiNRS7Kl23f2MJ4grMbDZhLiIwkQio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LwU5By0Gzei8sVThx0In3OGporfMt9E0ai5ng3WmKEA=;
 b=NmUnyZr8plhyKdbQIAPQOI4xtAMaCt7V+DRNAcLoG04Lz8T/SfjxaOmChmwB9sKYMi
 wEBPYNxzPYB3+M38uXenVgAaLEyKf1dUhmqeJ/TK6k9hoBoVKwloqEIh3mspGwau3LIv
 8m3Jm3pdL4WkcwLgJAy/bg1mvKOEe+yy3PY0IUuxwgXun+Yzy225mEaKTjUVK6BKwrVa
 78iS9I6Py49BPiw1/k4zfEBG/uPV4/r+HDaf9muXkcW4IDxJiBpuz9GVkhXjqPsPW5PV
 da/cqm5/xpLJ6ZwJLWx9wSvXPA/qB5xoHedIVz1BVl1+TR4zRi/VvHWHDr4q2g49G7gF
 uvrg==
X-Gm-Message-State: AOAM5302G16ApbLvP+/Ups7QgaEBRpJXqKHghE6TN4s9/M083FKPtc/J
 HkIT68VfODGpFjJWH3601Fh6lqiGqzlhfEePnwS3DohJ
X-Google-Smtp-Source: ABdhPJz8kck099ftO2MD01RmuZga2UNKj/zXoGxQ4VBitiI4vFvwwm/4QQFaDyKJ8XiVDdwm5pYyPCe2EvkY45auzFw=
X-Received: by 2002:a05:622a:1451:: with SMTP id
 v17mr4038899qtx.25.1633994502918; 
 Mon, 11 Oct 2021 16:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211011070356.99952-1-clg@kaod.org>
In-Reply-To: <20211011070356.99952-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Oct 2021 23:21:30 +0000
Message-ID: <CACPK8Xe_fTSHNF6gkhohv3LH3aHWVBsWNKy=cCpBXFnETmou4A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use CONFIG_PPC_POWERNV to compile OPAL
 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Oct 2021 at 07:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> CONFIG_PPC64_BOOT_WRAPPER is selected by CPU_LITTLE_ENDIAN which is
> used to compile support for other platforms such as Microwatt. There
> is no need for OPAL calls on these.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/boot/serial.c | 2 +-
>  arch/powerpc/boot/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
> index 9a19e5905485..54d2522be485 100644
> --- a/arch/powerpc/boot/serial.c
> +++ b/arch/powerpc/boot/serial.c
> @@ -132,7 +132,7 @@ int serial_console_init(void)
>         else if (dt_is_compatible(devp, "fsl,mpc5200-psc-uart"))
>                 rc =3D mpc5200_psc_console_init(devp, &serial_cd);
>  #endif
> -#ifdef CONFIG_PPC64_BOOT_WRAPPER
> +#ifdef CONFIG_PPC_POWERNV
>         else if (dt_is_compatible(devp, "ibm,opal-console-raw"))
>                 rc =3D opal_console_init(devp, &serial_cd);
>  #endif
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 089ee3ea55c8..9993c6256ad2 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -123,7 +123,7 @@ src-wlib-y :=3D string.S crt0.S stdio.c decompress.c =
main.c \
>                 oflib.c ofconsole.c cuboot.c
>
>  src-wlib-$(CONFIG_PPC_MPC52xx) +=3D mpc52xx-psc.c
> -src-wlib-$(CONFIG_PPC64_BOOT_WRAPPER) +=3D opal-calls.S opal.c
> +src-wlib-$(CONFIG_PPC_POWERNV) +=3D opal-calls.S opal.c
>  ifndef CONFIG_PPC64_BOOT_WRAPPER
>  src-wlib-y +=3D crtsavres.S
>  endif
> --
> 2.31.1
>
