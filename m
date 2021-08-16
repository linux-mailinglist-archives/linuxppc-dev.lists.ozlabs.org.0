Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54D3EDFAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 00:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpSsL4Bdxz3cGg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:05:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=edCdElco;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=edCdElco; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpSrh2CWsz2xvM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 08:05:05 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id h11so29502789ljo.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e31P/2GOTWbuV4ckMdMmZ6I8R+PPJnAJhAHl1ZjYZ8Y=;
 b=edCdElcoohq5GytpdhwlPhshLDfbAh2jQXYj6et58GR+T01k1EgZoToCc2jeM3lMVd
 ycx3Io8gwiap261C2Y425b4a3KTRN4VfoqLxoQH4KG1qXQ0ILBUL/pQUZwlhjz2HLMkd
 HFHumSLdIGBYYGlKRnKqqfC/Fp4JWsKkWSw0B0iCtxRXhd56ecNT5HJZl0uW5mRHPp77
 mdHGgZMfiXShNgRy/kU/7N9MDTbLwJGS850Wa6HiXN8BEQs+q0SLdMgboC3JQ2xg6AGX
 LNrOD/8aQVxZg5KtZO3FoAIBh+U7nQ6fHNMAe7dVhGnFMI8s1FEOYl9Pz1boylAkGo8t
 yG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e31P/2GOTWbuV4ckMdMmZ6I8R+PPJnAJhAHl1ZjYZ8Y=;
 b=mHThVXvnyyhZ/JciDf464T+LK6fI8qHX/UNLkUeN+sBjr15FS9IWYMQcHeYuZREPz7
 +lXTXLrcxvoKOKZuSYfIiX6dG1fYdk0ZF8Zfu4Mnmm7ddPLvW7teTLiTltVjrb19XHKH
 djNUojuUsyvu/PJBxPh9Y1eLc/N6luJIZ34JB5w1NG7jqMwVUdIPZYmzp2MVRW1z8jDl
 ys46eVn6l5NyEhOOUZbpC49m9YVSgc4Df/a9um0lvZcMV655cG7z38fgqkHr4hdDIj+K
 766O4uXvykBYb2tZfUU+T0VBthcL1pZBq7JpxgzUVs1zC7rNxoA27fwV4TS0eJfFaSOj
 UUFQ==
X-Gm-Message-State: AOAM531TpGfH/5qcPH8zijfeJ7CxCNm76CaMqJ3w7yP29F9CBRPeMs90
 CxkrnJaax/mVXfxrcwrGIbMkn8ayTy/W8dFXOQ3hgA==
X-Google-Smtp-Source: ABdhPJwxox6PXnfkmEMOrVyFZontRVeS9j/tsjqaDmcNw1hGPr+mKuthyVG+b+ZoQf9FyySDg4k5it5Il/2XusHAYTE=
X-Received: by 2002:a05:651c:83:: with SMTP id 3mr301012ljq.341.1629151498062; 
 Mon, 16 Aug 2021 15:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816185711.21563-1-nathan@kernel.org>
In-Reply-To: <20210816185711.21563-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Aug 2021 15:04:46 -0700
Message-ID: <CAKwvOdkOCraDC0QccntgWD-ZkW8c2+RG8WeOD7aQH3BHZM2BHw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/xive: Do not mark xive_request_ipi() as __init
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 16, 2021 at 12:06 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Compiling ppc64le_defconfig with clang-14 shows a modpost warning:
>
> WARNING: modpost: vmlinux.o(.text+0xa74e0): Section mismatch in
> reference from the function xive_setup_cpu_ipi() to the function
> .init.text:xive_request_ipi()
> The function xive_setup_cpu_ipi() references
> the function __init xive_request_ipi().
> This is often because xive_setup_cpu_ipi lacks a __init
> annotation or the annotation of xive_request_ipi is wrong.
>
> xive_request_ipi() is called from xive_setup_cpu_ipi(), which is not
> __init, so xive_request_ipi() should not be marked __init. Remove the
> attribute so there is no more warning.
>
> Fixes: cbc06f051c52 ("powerpc/xive: Do not skip CPU-less nodes when creating the IPIs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/sysdev/xive/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 943fd30095af..8183ca343675 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1170,7 +1170,7 @@ static int __init xive_init_ipis(void)
>         return ret;
>  }
>
> -static int __init xive_request_ipi(unsigned int cpu)
> +static int xive_request_ipi(unsigned int cpu)
>  {
>         struct xive_ipi_desc *xid = &xive_ipis[early_cpu_to_node(cpu)];
>         int ret;
>
> base-commit: a2824f19e6065a0d3735acd9fe7155b104e7edf5
> --
> 2.33.0.rc2
>


-- 
Thanks,
~Nick Desaulniers
