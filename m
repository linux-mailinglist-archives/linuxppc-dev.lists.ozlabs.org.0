Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4D11781F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 22:14:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WwtW1sKFzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 08:14:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="wTf08lNe"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wwrf6n7bzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 08:12:50 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id q127so7729770pga.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 13:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=reyZZJheLd9yHQxDntXi/qlyLtQlfdLU5vTmTSU2J4w=;
 b=wTf08lNeP17+SN7FmdBXOMHbX47zfgrkLvREVS5gXOgqNTkW7U9Cch1XQfVdtEc2gg
 aA15kTWlGED0Hum556nKwbzPSZ5EaE4X6MGEueaj7Fi6Qf2Kl1yQtEOaa7LRyKmcV8gs
 BoFFOpT0JRzbBNq7FVQNPow/WgjFEiCVdYwIFQbWXYeI7iLuTtQs4HzlzkTrJ0fB26iv
 HaCAtSASApe9u958UOkUL/qCoc9ebU/VQmMKcH+gECZA2newVCGxrAi5qjtPLCV8WyXX
 blp+7DgHmrwGR2Oht2SHVZ8shW+/F7czJteB5NgIYPKJ+elPO390ybYmu8eTbz2MgtAs
 jQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=reyZZJheLd9yHQxDntXi/qlyLtQlfdLU5vTmTSU2J4w=;
 b=V8gtun7i1HWO7zEDnsDgmIpbXWOMni5ilqkl8vQ/0E5OGaqPIcJxDdg+l8m5Q5S6Hk
 m5DBeWyvKGPDvNqMMH2qafeKJ/Nl7MWGfP5ef9FuPunQ4BcQH5v3VXwPQk7nL69GOxHn
 y3SNyeEMBESZmGBMz8vdFW9mqq4qsceZFpvSl44pF8I6m8k0P8Gdrob49BeL8JN5kSIk
 DdfFgXj8FReJzTEAVCjMWZ9+8gO7pC11YLVgeMxhaToKUJs4pLAPjcONg0yKGc3LXzT6
 GT+CoCPwZvmf7/GAkkc5qDTJBBKOA4073i+404NcydhWZfAC9zj7UIEMTVNaUwTzl5nW
 pXtw==
X-Gm-Message-State: APjAAAUJTvBYDCX4KjICpuHRF5pUAlSKka4UjMMdO/k+Zl/l4Vf4Ru6F
 PE7S3mmzHgsZgx52CnMOobGhtLebTDRdIEB7qQ29QA==
X-Google-Smtp-Source: APXvYqwLGMPwEIVk+sSMIlstyIzR4bv6rsf8nn9gwB56VsbsfzQTut0FeK9yEhGwUb5Py3QiR4RBRkiRmZBRsJWcnXg=
X-Received: by 2002:a65:590f:: with SMTP id f15mr20500805pgu.381.1575925966701; 
 Mon, 09 Dec 2019 13:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20191209200338.12546-1-natechancellor@gmail.com>
In-Reply-To: <20191209200338.12546-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Dec 2019 13:12:35 -0800
Message-ID: <CAKwvOdkWYqYD-036putggpCyq44xuLVsN9krzC98pmHoKe_0uw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/44x: Adjust indentation in
 ibm4xx_denali_fixup_memsize
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 9, 2019 at 12:04 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../arch/powerpc/boot/4xx.c:231:3: warning: misleading indentation;
> statement is not part of the previous 'else' [-Wmisleading-indentation]
>         val = SDRAM0_READ(DDR0_42);
>         ^
> ../arch/powerpc/boot/4xx.c:227:2: note: previous statement is here
>         else
>         ^
>
> This is because there is a space at the beginning of this line; remove
> it so that the indentation is consistent according to the Linux kernel
> coding style and clang no longer warns.
>
> Fixes: d23f5099297c ("[POWERPC] 4xx: Adds decoding of 440SPE memory size to boot wrapper library")

ah, can even see it in the diff. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Link: https://github.com/ClangBuiltLinux/linux/issues/780
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/boot/4xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/4xx.c b/arch/powerpc/boot/4xx.c
> index 1699e9531552..00c4d843a023 100644
> --- a/arch/powerpc/boot/4xx.c
> +++ b/arch/powerpc/boot/4xx.c
> @@ -228,7 +228,7 @@ void ibm4xx_denali_fixup_memsize(void)
>                 dpath = 8; /* 64 bits */
>
>         /* get address pins (rows) */
> -       val = SDRAM0_READ(DDR0_42);
> +       val = SDRAM0_READ(DDR0_42);
>
>         row = DDR_GET_VAL(val, DDR_APIN, DDR_APIN_SHIFT);
>         if (row > max_row)
> --
> 2.24.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191209200338.12546-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
