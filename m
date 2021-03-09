Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D34B3321C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvqN73NByz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:16:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.49; helo=mail-ua1-f49.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvqMp6LbZz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:16:37 +1100 (AEDT)
Received: by mail-ua1-f49.google.com with SMTP id h26so2690241uax.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 01:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DxSUjQGZz4/YjWnn3wACv5aSRYiuKXpXdqRpRz0A8i4=;
 b=EuKF8tOWW4KqPMe4+DrfH2sz9WsGyTe3HvWEsJk7aESYImawlSuheWCQwfmGO8fBWF
 p7hB3RnL4iuCZGYwvPi4Alic5aGcd+Zj1/0Vt8HkMV5JxWuZYMiOtEvodg+f7blK8nCN
 hfHpR1j4XzOEjrztwUIoKQTJGb5SDomGUKgzzAx0B/0y1vFGGBArKpOM6PXsT5uNKsKa
 X8FNmkCC673SKAZx8nYo7+89gc0vXXPT3SWrDeNYOTuVwJKo3VwOHVr5MZ0JyzZz6NEh
 TVm39E0ZvBeZ2Zc14gcrmR9ScSKJHLrA3TCZZhTwmOiUzVLH9pjt1rHd0MugYYMrbpfj
 C5OA==
X-Gm-Message-State: AOAM533lPNkRr5LTn8+u7oFXN064DjlGOczwiB1VEmrngADeIocmg/nL
 4ZDWnsWRtlMaD8WKbxzCNRA+cmXQU9uhzRGwgS8=
X-Google-Smtp-Source: ABdhPJww7xH7Oe5Pjr4n5IpImR4mF9lUTXCXGNF+o1r811zxaElWbHX29Xxb/k0BiTXqUy738t90tdAg9Vt/0gLMISg=
X-Received: by 2002:a9f:35a1:: with SMTP id t30mr14845428uad.106.1615281395334; 
 Tue, 09 Mar 2021 01:16:35 -0800 (PST)
MIME-Version: 1.0
References: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
 <CAMuHMdW0Cn1So8ckvhsT+N+p2hiPiksmCS32jzM0xCUYU4UAdQ@mail.gmail.com>
 <b12f9128-790b-7d8b-5f3c-e0912f5bec0a@csgroup.eu>
In-Reply-To: <b12f9128-790b-7d8b-5f3c-e0912f5bec0a@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Mar 2021 10:16:24 +0100
Message-ID: <CAMuHMdXM0qg23UN6VBqbb0Vm2bg3tRSM=OCD5r7U2K1brpnJAg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix missing declaration of
 [en/dis]able_kernel_vsx()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Alex Deucher <alexdeucher@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Tue, Mar 9, 2021 at 9:52 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 09/03/2021 =C3=A0 09:45, Geert Uytterhoeven a =C3=A9crit :
> > On Tue, Mar 9, 2021 at 9:39 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Add stub instances of enable_kernel_vsx() and disable_kernel_vsx()
> >> when CONFIG_VSX is not set, to avoid following build failure.
> >>
> >>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o
> >> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_se=
rvices_types.h:29,
> >>                   from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_s=
ervices.h:37,
> >>                   from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/=
dcn_calcs.c:27:
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In functio=
n 'dcn_bw_apply_registry_override':
> >> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: imp=
licit declaration of function 'enable_kernel_vsx'; did you mean 'enable_ker=
nel_fp'? [-Werror=3Dimplicit-function-declaration]
> >>     64 |   enable_kernel_vsx(); \
> >>        |   ^~~~~~~~~~~~~~~~~
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: note=
: in expansion of macro 'DC_FP_START'
> >>    640 |  DC_FP_START();
> >>        |  ^~~~~~~~~~~
> >> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: imp=
licit declaration of function 'disable_kernel_vsx'; did you mean 'disable_k=
ernel_fp'? [-Werror=3Dimplicit-function-declaration]
> >>     75 |   disable_kernel_vsx(); \
> >>        |   ^~~~~~~~~~~~~~~~~~
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: note=
: in expansion of macro 'DC_FP_END'
> >>    676 |  DC_FP_END();
> >>        |  ^~~~~~~~~
> >> cc1: some warnings being treated as errors
> >> make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs=
.o] Error 1
> >>
> >> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/powerpc/include/asm/switch_to.h
> >> +++ b/arch/powerpc/include/asm/switch_to.h
> >> @@ -71,6 +71,16 @@ static inline void disable_kernel_vsx(void)
> >>   {
> >>          msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
> >>   }
> >> +#else
> >> +static inline void enable_kernel_vsx(void)
> >> +{
> >> +       BUILD_BUG();
> >> +}
> >> +
> >> +static inline void disable_kernel_vsx(void)
> >> +{
> >> +       BUILD_BUG();
> >> +}
> >>   #endif
> >
> > I'm wondering how this is any better than the current situation: using
> > BUILD_BUG() will still cause a build failure?
>
> No it won't cause a failure. In drivers/gpu/drm/amd/display/dc/os_types.h=
 you have:
>
> #define DC_FP_START() { \
>         if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
>                 preempt_disable(); \
>                 enable_kernel_vsx(); \
>         } else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
>                 preempt_disable(); \
>                 enable_kernel_altivec(); \
>         } else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
>                 preempt_disable(); \
>                 enable_kernel_fp(); \
>         } \
>
> When CONFIG_VSX is not selected, cpu_has_feature(CPU_FTR_VSX_COMP) consta=
nt folds to 'false' so the
> call to enable_kernel_vsx() is discarded and the build succeeds.

IC. So you might as well have an empty (dummy) function instead?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
