Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744D108668
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 02:38:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LqRk1XqLzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="R1fYDaTv"; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LqPV0ckgzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 12:36:12 +1100 (AEDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id xAP1ZumK005605
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 10:35:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xAP1ZumK005605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1574645757;
 bh=4zS9ONB1lX0XUDCYAcZW6UgeXuejST5UVyfhFO/g8d8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R1fYDaTvWZSIXPD0BXg/G6ZmTOZMjjFenSgrGicPFQT+3Y3g/m/ZrhOyG2ZLObk9H
 jSDKaIdbzPFBTfl1xJZMsZJ81783Qg75CmGSqzoPciMOvaYC3saanAxYYIjtyXFHC5
 XpMkLxiVblDfIwKlBHkAczgogRU8wVT/JOwppExseIgxtiiL6HSRfwU+JnROtKzXCB
 0majHYE5wni9B61LcBG+CKkDMhKnKSmaJuTncJPy2oI75R0i2izRD9kV1YGyZXqnXf
 k9MTvxkdR0dxuhxT8t1KHwfECJzy7sfW/CyqMeI3qoUrxjTmPVy291lkq65GHgy3ml
 OF0e3gT7gcnCw==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id m9so8929956vsq.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 17:35:57 -0800 (PST)
X-Gm-Message-State: APjAAAX6NaJFUG8bQuOVBa0pm1ABJfqNKyiZbE+gbSWb3ow0PewxdFFl
 v75HS3sumEkc5vkJrd3SiMlwwixd6ZIyAkdYsnk=
X-Google-Smtp-Source: APXvYqzsFOr3V5Ucu7w0+x7MvZdRFWrrwm3B2vqt1VuyZEdFouFkB+5X8be1VVTCyuUplwtsLKcFkuk0UX620+G6KNg=
X-Received: by 2002:a05:6102:726:: with SMTP id
 u6mr17181884vsg.179.1574645756005; 
 Sun, 24 Nov 2019 17:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20191113071202.11287-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191113071202.11287-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 25 Nov 2019 10:35:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSSSORFCrTt0abgiyUffnTtgFFh8XbVNvbkxZ=NbcX_A@mail.gmail.com>
Message-ID: <CAK7LNARSSSORFCrTt0abgiyUffnTtgFFh8XbVNvbkxZ=NbcX_A@mail.gmail.com>
Subject: Re: [PATCH v3] libfdt: define INT32_MAX and UINT32_MAX in libfdt_env.h
To: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
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
Cc: Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 4:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The DTC v1.5.1 added references to (U)INT32_MAX.
>
> This is no problem for user-space programs since <stdint.h> defines
> (U)INT32_MAX along with (u)int32_t.
>
> For the kernel space, libfdt_env.h needs to be adjusted before we
> pull in the changes.
>
> In the kernel, we usually use s/u32 instead of (u)int32_t for the
> fixed-width types.
>
> Accordingly, we already have S/U32_MAX for their max values.
> So, we should not add (U)INT32_MAX to <linux/limits.h> any more.
>
> Instead, add them to the in-kernel libfdt_env.h to compile the
> latest libfdt.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Please let me ping this
in case this is useful for future resync.




>
> My initial plan was to change this in a series of 3 patches
> since it is clean, and reduces the code.
>
> [1/3] https://lore.kernel.org/patchwork/patch/1147095/
> [2/3] https://lore.kernel.org/patchwork/patch/1147096/
> [3/3] https://lore.kernel.org/patchwork/patch/1147097/
>
> 1/3 is stuck in the license bikeshed.
>
> For 2/3, I have not been able to get Ack from Russell.
>
> So, I chose a straight-forward fixup.
>
>
> Changes in v3:
>  - Resend as a single patch
>
>  arch/arm/boot/compressed/libfdt_env.h | 4 +++-
>  arch/powerpc/boot/libfdt_env.h        | 2 ++
>  include/linux/libfdt_env.h            | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/compressed/libfdt_env.h b/arch/arm/boot/compressed/libfdt_env.h
> index b36c0289a308..6a0f1f524466 100644
> --- a/arch/arm/boot/compressed/libfdt_env.h
> +++ b/arch/arm/boot/compressed/libfdt_env.h
> @@ -2,11 +2,13 @@
>  #ifndef _ARM_LIBFDT_ENV_H
>  #define _ARM_LIBFDT_ENV_H
>
> +#include <linux/limits.h>
>  #include <linux/types.h>
>  #include <linux/string.h>
>  #include <asm/byteorder.h>
>
> -#define INT_MAX                        ((int)(~0U>>1))
> +#define INT32_MAX      S32_MAX
> +#define UINT32_MAX     U32_MAX
>
>  typedef __be16 fdt16_t;
>  typedef __be32 fdt32_t;
> diff --git a/arch/powerpc/boot/libfdt_env.h b/arch/powerpc/boot/libfdt_env.h
> index 2abc8e83b95e..9757d4f6331e 100644
> --- a/arch/powerpc/boot/libfdt_env.h
> +++ b/arch/powerpc/boot/libfdt_env.h
> @@ -6,6 +6,8 @@
>  #include <string.h>
>
>  #define INT_MAX                        ((int)(~0U>>1))
> +#define UINT32_MAX             ((u32)~0U)
> +#define INT32_MAX              ((s32)(UINT32_MAX >> 1))
>
>  #include "of.h"
>
> diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
> index edb0f0c30904..1adf54aad2df 100644
> --- a/include/linux/libfdt_env.h
> +++ b/include/linux/libfdt_env.h
> @@ -7,6 +7,9 @@
>
>  #include <asm/byteorder.h>
>
> +#define INT32_MAX      S32_MAX
> +#define UINT32_MAX     U32_MAX
> +
>  typedef __be16 fdt16_t;
>  typedef __be32 fdt32_t;
>  typedef __be64 fdt64_t;
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Best Regards
Masahiro Yamada
