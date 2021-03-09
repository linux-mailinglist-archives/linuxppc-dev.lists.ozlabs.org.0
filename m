Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB4332367
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 11:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvsYy5H72z3cTc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 21:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.181;
 helo=mail-vk1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvsYg06D1z30N8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 21:55:17 +1100 (AEDT)
Received: by mail-vk1-f181.google.com with SMTP id y67so1823659vka.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 02:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oX7AxwHbI6o3a5Bi4c9f3W+YD88gdE1RWPCa5CVMxh4=;
 b=S+ge0gUQm0dAnmLsteMvWz9IEyEdUxzRVHHtjnhz8oE9+oY32xB3WFTPuQ99HQe990
 z78usGHX1aAYV1sEMW82eLFGYSPsgkCuNedvkwYRqh7Z7thdQ6iNkdGk+7Ap+0BAsk6i
 xYj1+mUDveOjwFyg96yXe3mp9SH+S5i0X0mBDaeMnu4hNpc5M+YS2BilZpju9Ez2DvdS
 KgU1Vcd97B6nYbcE/n1d8bK5xi1sae1DyCEmuoRhfreGZMC1s2ALp81V5SrJBOthdKnU
 TmgagBOyPzy1g5RhUJ6y4FLQ/gaeZFSYHb2PN18cN1MXyO+808v721IxxfJIkbfzllJi
 tzxA==
X-Gm-Message-State: AOAM532RRnZlVkdSBSxXbgQgpeTQOU24dBEQaXs2iIyty98Smb8Fwvwp
 kEBK7AwynbDkxzbamRIOjFFAaxbezh0cKBlR2WU=
X-Google-Smtp-Source: ABdhPJwveE/U9SAwH7PSfNB+ROkadaF3IBN/Y7JnqtqYAHB2l2g3/7Wr7l7W359+lNpN6E+AIE0VV7DgzraTAMlMtWs=
X-Received: by 2002:a1f:1a51:: with SMTP id a78mr15741334vka.2.1615287315138; 
 Tue, 09 Mar 2021 02:55:15 -0800 (PST)
MIME-Version: 1.0
References: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
 <CAMuHMdW0Cn1So8ckvhsT+N+p2hiPiksmCS32jzM0xCUYU4UAdQ@mail.gmail.com>
 <b12f9128-790b-7d8b-5f3c-e0912f5bec0a@csgroup.eu>
 <CAMuHMdXM0qg23UN6VBqbb0Vm2bg3tRSM=OCD5r7U2K1brpnJAg@mail.gmail.com>
 <b64111a3-df3f-bf59-20ce-0af57715ad53@csgroup.eu>
In-Reply-To: <b64111a3-df3f-bf59-20ce-0af57715ad53@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Mar 2021 11:55:03 +0100
Message-ID: <CAMuHMdUQcE7+O9NWH4Xxxv+r7ZFnTGqtHuteOMiSPY_gK5xkZw@mail.gmail.com>
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

On Tue, Mar 9, 2021 at 10:58 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 09/03/2021 =C3=A0 10:16, Geert Uytterhoeven a =C3=A9crit :
> > On Tue, Mar 9, 2021 at 9:52 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 09/03/2021 =C3=A0 09:45, Geert Uytterhoeven a =C3=A9crit :
> >>> On Tue, Mar 9, 2021 at 9:39 AM Christophe Leroy
> >>> <christophe.leroy@csgroup.eu> wrote:
> >>>> Add stub instances of enable_kernel_vsx() and disable_kernel_vsx()
> >>>> when CONFIG_VSX is not set, to avoid following build failure.
> >>>>
> >>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs=
.o
> >>>> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_=
services_types.h:29,
> >>>>                    from ./drivers/gpu/drm/amd/amdgpu/../display/dc/d=
m_services.h:37,
> >>>>                    from drivers/gpu/drm/amd/amdgpu/../display/dc/cal=
cs/dcn_calcs.c:27:
> >>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In funct=
ion 'dcn_bw_apply_registry_override':
> >>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: i=
mplicit declaration of function 'enable_kernel_vsx'; did you mean 'enable_k=
ernel_fp'? [-Werror=3Dimplicit-function-declaration]
> >>>>      64 |   enable_kernel_vsx(); \
> >>>>         |   ^~~~~~~~~~~~~~~~~
> >>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: no=
te: in expansion of macro 'DC_FP_START'
> >>>>     640 |  DC_FP_START();
> >>>>         |  ^~~~~~~~~~~
> >>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: i=
mplicit declaration of function 'disable_kernel_vsx'; did you mean 'disable=
_kernel_fp'? [-Werror=3Dimplicit-function-declaration]
> >>>>      75 |   disable_kernel_vsx(); \
> >>>>         |   ^~~~~~~~~~~~~~~~~~
> >>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: no=
te: in expansion of macro 'DC_FP_END'
> >>>>     676 |  DC_FP_END();
> >>>>         |  ^~~~~~~~~
> >>>> cc1: some warnings being treated as errors
> >>>> make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_cal=
cs.o] Error 1
> >>>>
> >>>> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/arch/powerpc/include/asm/switch_to.h
> >>>> +++ b/arch/powerpc/include/asm/switch_to.h
> >>>> @@ -71,6 +71,16 @@ static inline void disable_kernel_vsx(void)
> >>>>    {
> >>>>           msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
> >>>>    }
> >>>> +#else
> >>>> +static inline void enable_kernel_vsx(void)
> >>>> +{
> >>>> +       BUILD_BUG();
> >>>> +}
> >>>> +
> >>>> +static inline void disable_kernel_vsx(void)
> >>>> +{
> >>>> +       BUILD_BUG();
> >>>> +}
> >>>>    #endif
> >>>
> >>> I'm wondering how this is any better than the current situation: usin=
g
> >>> BUILD_BUG() will still cause a build failure?
> >>
> >> No it won't cause a failure. In drivers/gpu/drm/amd/display/dc/os_type=
s.h you have:
> >>
> >> #define DC_FP_START() { \
> >>          if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
> >>                  preempt_disable(); \
> >>                  enable_kernel_vsx(); \
> >>          } else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
> >>                  preempt_disable(); \
> >>                  enable_kernel_altivec(); \
> >>          } else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
> >>                  preempt_disable(); \
> >>                  enable_kernel_fp(); \
> >>          } \
> >>
> >> When CONFIG_VSX is not selected, cpu_has_feature(CPU_FTR_VSX_COMP) con=
stant folds to 'false' so the
> >> call to enable_kernel_vsx() is discarded and the build succeeds.
> >
> > IC. So you might as well have an empty (dummy) function instead?
> >
>
> But with an empty function, you take the risk that one day, someone calls=
 it without checking that
> CONFIG_VSX is selected. Here if someone does that, build will fail.

OK, convinced.

> Another solution is to declare a non static prototype of it, like __put_u=
ser_bad() for instance. In
> that case, the link will fail.
>
> I prefer the BUILD_BUG() approach as I find it cleaner and more explicit,=
 and also because it breaks
> the build at compile time, you don't have to wait link time to catch the =
error.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
