Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEFA705CA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 03:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLbhM66xjz3fBN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 11:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z+zFVCzB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z+zFVCzB;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLbgT3Q2wz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 11:51:32 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-965e4be7541so24871966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1684288286; x=1686880286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI/aj2Nd5zc3Gxf4qDX/zcld/FAkwaBlhaT36NANJPQ=;
        b=Z+zFVCzB79rUPA1Fu++yhEFTau39AM1Bi/gJfG/gbAHF+kvY1fItnFBIYVkQnYPSA/
         bSC4Hu506L9j/5XEUqowCCEgfDpJjt5eYtbUh3uQR4PkwRrpce9kB3bZLPPZu39M0Rnc
         Jj9XZSmofCP4AwK1XwJrdbOrC0QuakFNk7bt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684288286; x=1686880286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XI/aj2Nd5zc3Gxf4qDX/zcld/FAkwaBlhaT36NANJPQ=;
        b=je+NmK3Yy29XWItcuAqoF6BChmm+PrlJlQcP+VX9EqFSHu5pOtB1F1T6O/72MvkdVC
         w644unmhN106Wib99yindpLf/Y8ZsHM/bRIru1JJkNqea1n+b1JGGkmQ3LzaYx+kTRwe
         xqzqnOUpCeCjsUkrNikx8uZ/ZE09ZBwb2/1l9UmZtlVzuInnaT7aQRSBhHrE5F2kEVEH
         mPYPUtO/WxK/L6tbbofHQtoXexmE0KtxLSq4tCmr1uEAkZUsi1Kr6tRj32bWjopV5Ip6
         d0CDVdal095EIdXbqeMdJyWaHMYXxOye+AeHtfFXnM4BwI96OtrKhbfHCH2VjZLKcRGO
         M8/A==
X-Gm-Message-State: AC+VfDzbMTTXp8W60HFRxXVpWsoxgVHdlmaKmi0bKcFgpNpzs4IY3N7x
	b6yZQ6a2FB/a5ycYFKzyS6j5ALWJ6Ejb1CH9Vhw=
X-Google-Smtp-Source: ACHHUZ4POaqmgh/cyiT4ojnHvzchjIHyivgxRk0s7fhiBnIXjUfsv5qZtyn31MaIplkyd//L6sMMzs0/tKyGRbgsLmw=
X-Received: by 2002:a17:907:6e10:b0:968:1e8:a754 with SMTP id
 sd16-20020a1709076e1000b0096801e8a754mr26054180ejc.72.1684288285456; Tue, 16
 May 2023 18:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230515124731.122962-1-mpe@ellerman.id.au>
In-Reply-To: <20230515124731.122962-1-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 May 2023 01:51:13 +0000
Message-ID: <CACPK8XdNMBm6D-EQU0BGfxrtzbXLJaLeqzUXDMDb3eAe-T4Bxg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/crypto: Fix aes-gcm-p10 build when VSX=n
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, dtsen@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 May 2023 at 12:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> When VSX is disabled, eg. microwatt_defconfig, the build fails with:
>
>   In function =E2=80=98enable_kernel_vsx=E2=80=99,
>       inlined from =E2=80=98vsx_begin=E2=80=99 at arch/powerpc/crypto/aes=
-gcm-p10-glue.c:68:2,
>       inlined from =E2=80=98p10_aes_gcm_crypt.constprop=E2=80=99 at arch/=
powerpc/crypto/aes-gcm-p10-glue.c:244:2:
>   ...
>   arch/powerpc/include/asm/switch_to.h:86:9: note: in expansion of macro =
=E2=80=98BUILD_BUG=E2=80=99
>      86 |         BUILD_BUG();
>         |         ^~~~~~~~~
>
> Fix it by making the p10-aes-gcm code depend on VSX.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
> index 7113f9355165..ad1872518992 100644
> --- a/arch/powerpc/crypto/Kconfig
> +++ b/arch/powerpc/crypto/Kconfig
> @@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
>
>  config CRYPTO_AES_GCM_P10
>         tristate "Stitched AES/GCM acceleration support on P10 or later C=
PU (PPC)"
> -       depends on PPC64 && CPU_LITTLE_ENDIAN
> +       depends on PPC64 && CPU_LITTLE_ENDIAN && VSX

VSX depends on PPC_BOOK3S_64 but I guess there's no harm in keeping
the PPC64 here?

>         select CRYPTO_LIB_AES
>         select CRYPTO_ALGAPI
>         select CRYPTO_AEAD
> --
> 2.40.1
>
