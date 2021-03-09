Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE23320F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 09:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvphK3HP1z3cFy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 19:45:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.49; helo=mail-vs1-f49.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvph112p8z2yhw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 19:45:36 +1100 (AEDT)
Received: by mail-vs1-f49.google.com with SMTP id b189so6395253vsd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 00:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lmndnbPQCr8AXP1pY/aZuEbMdRzjbk8ym+KsHGcxBc=;
 b=UMmWPZXNilPFNtFhTTVpdhEQu/1oqo4Fnmam9AbDyGtrBUQ6MUux+IPQ72c+DXt9yS
 vepNfZXwECBb1typKmtjx0mdkVpl/OZlcxl8E45bW/a5VVSD0rBVvhITdRHuL3QpOEYt
 UNpC3OKCX/VFtkUqci4KIvfbi49Ck0XfkzNRcBTcnyy7R5fckvIwrRi+XCZAo40kKQix
 tLPXtOCwXRezPiPppaQbaP/cvD8Nx3EzwOkjnHV35RvjkvfNvnUXO8MkpDdNeg5fdR+E
 dS+SPl4Hc/5N1E3Rp2q3vvYWIjzGtx41caqB8XvxuAuzRRkDbuoGhBK+7A82UAM7I7yo
 AD4g==
X-Gm-Message-State: AOAM533BtRiWAjX7h1Yc/j2VTw2+qT1l2zJblUFmp5RKiI4p/RgyXsAY
 Z0crW7DvfxmJj/OUKJZDYlVEytDfhrIlBSaRzo4=
X-Google-Smtp-Source: ABdhPJy4eZcopEWPCDQNfxdWr+R5xrYzx0ZKx+VvIgjy2lopCK6Zmh5Qq7qdK7rD5P4ilSTOPk+7P0s2HbgXZZnnOwE=
X-Received: by 2002:a67:f7c6:: with SMTP id a6mr16056565vsp.42.1615279531653; 
 Tue, 09 Mar 2021 00:45:31 -0800 (PST)
MIME-Version: 1.0
References: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Mar 2021 09:45:20 +0100
Message-ID: <CAMuHMdW0Cn1So8ckvhsT+N+p2hiPiksmCS32jzM0xCUYU4UAdQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix missing declaration of
 [en/dis]able_kernel_vsx()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Alex Deucher <alexdeucher@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Tue, Mar 9, 2021 at 9:39 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Add stub instances of enable_kernel_vsx() and disable_kernel_vsx()
> when CONFIG_VSX is not set, to avoid following build failure.
>
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o
> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In function 'dcn_bw_apply_registry_override':
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: implicit declaration of function 'enable_kernel_vsx'; did you mean 'enable_kernel_fp'? [-Werror=implicit-function-declaration]
>    64 |   enable_kernel_vsx(); \
>       |   ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: note: in expansion of macro 'DC_FP_START'
>   640 |  DC_FP_START();
>       |  ^~~~~~~~~~~
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: implicit declaration of function 'disable_kernel_vsx'; did you mean 'disable_kernel_fp'? [-Werror=implicit-function-declaration]
>    75 |   disable_kernel_vsx(); \
>       |   ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: note: in expansion of macro 'DC_FP_END'
>   676 |  DC_FP_END();
>       |  ^~~~~~~~~
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o] Error 1
>
> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for your patch!

> --- a/arch/powerpc/include/asm/switch_to.h
> +++ b/arch/powerpc/include/asm/switch_to.h
> @@ -71,6 +71,16 @@ static inline void disable_kernel_vsx(void)
>  {
>         msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
>  }
> +#else
> +static inline void enable_kernel_vsx(void)
> +{
> +       BUILD_BUG();
> +}
> +
> +static inline void disable_kernel_vsx(void)
> +{
> +       BUILD_BUG();
> +}
>  #endif

I'm wondering how this is any better than the current situation: using
BUILD_BUG() will still cause a build failure?

What about adding "depends on !POWERPC || VSX" instead, to prevent
the issue from happening in the first place?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
