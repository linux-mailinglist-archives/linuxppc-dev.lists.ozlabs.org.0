Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93192332267
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvrJ14K8qz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvrHh2x0Vz30HX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:58:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvrHW3Jcrz9txfL;
 Tue,  9 Mar 2021 10:57:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J6axhznGM18g; Tue,  9 Mar 2021 10:57:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvrHW1tYWz9txfN;
 Tue,  9 Mar 2021 10:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DDA68B7E7;
 Tue,  9 Mar 2021 10:58:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ES4Klg5zpPJo; Tue,  9 Mar 2021 10:58:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C48CB8B7DC;
 Tue,  9 Mar 2021 10:57:59 +0100 (CET)
Subject: Re: [PATCH] powerpc: Fix missing declaration of
 [en/dis]able_kernel_vsx()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <8d7d285a027e9d21f5ff7f850fa71a2655b0c4af.1615279170.git.christophe.leroy@csgroup.eu>
 <CAMuHMdW0Cn1So8ckvhsT+N+p2hiPiksmCS32jzM0xCUYU4UAdQ@mail.gmail.com>
 <b12f9128-790b-7d8b-5f3c-e0912f5bec0a@csgroup.eu>
 <CAMuHMdXM0qg23UN6VBqbb0Vm2bg3tRSM=OCD5r7U2K1brpnJAg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b64111a3-df3f-bf59-20ce-0af57715ad53@csgroup.eu>
Date: Tue, 9 Mar 2021 10:57:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXM0qg23UN6VBqbb0Vm2bg3tRSM=OCD5r7U2K1brpnJAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2021 à 10:16, Geert Uytterhoeven a écrit :
> Hi Christophe,
> 
> On Tue, Mar 9, 2021 at 9:52 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 09/03/2021 à 09:45, Geert Uytterhoeven a écrit :
>>> On Tue, Mar 9, 2021 at 9:39 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>> Add stub instances of enable_kernel_vsx() and disable_kernel_vsx()
>>>> when CONFIG_VSX is not set, to avoid following build failure.
>>>>
>>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o
>>>> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
>>>>                    from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
>>>>                    from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:27:
>>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In function 'dcn_bw_apply_registry_override':
>>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: implicit declaration of function 'enable_kernel_vsx'; did you mean 'enable_kernel_fp'? [-Werror=implicit-function-declaration]
>>>>      64 |   enable_kernel_vsx(); \
>>>>         |   ^~~~~~~~~~~~~~~~~
>>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: note: in expansion of macro 'DC_FP_START'
>>>>     640 |  DC_FP_START();
>>>>         |  ^~~~~~~~~~~
>>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: implicit declaration of function 'disable_kernel_vsx'; did you mean 'disable_kernel_fp'? [-Werror=implicit-function-declaration]
>>>>      75 |   disable_kernel_vsx(); \
>>>>         |   ^~~~~~~~~~~~~~~~~~
>>>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: note: in expansion of macro 'DC_FP_END'
>>>>     676 |  DC_FP_END();
>>>>         |  ^~~~~~~~~
>>>> cc1: some warnings being treated as errors
>>>> make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o] Error 1
>>>>
>>>> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/powerpc/include/asm/switch_to.h
>>>> +++ b/arch/powerpc/include/asm/switch_to.h
>>>> @@ -71,6 +71,16 @@ static inline void disable_kernel_vsx(void)
>>>>    {
>>>>           msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
>>>>    }
>>>> +#else
>>>> +static inline void enable_kernel_vsx(void)
>>>> +{
>>>> +       BUILD_BUG();
>>>> +}
>>>> +
>>>> +static inline void disable_kernel_vsx(void)
>>>> +{
>>>> +       BUILD_BUG();
>>>> +}
>>>>    #endif
>>>
>>> I'm wondering how this is any better than the current situation: using
>>> BUILD_BUG() will still cause a build failure?
>>
>> No it won't cause a failure. In drivers/gpu/drm/amd/display/dc/os_types.h you have:
>>
>> #define DC_FP_START() { \
>>          if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
>>                  preempt_disable(); \
>>                  enable_kernel_vsx(); \
>>          } else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
>>                  preempt_disable(); \
>>                  enable_kernel_altivec(); \
>>          } else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
>>                  preempt_disable(); \
>>                  enable_kernel_fp(); \
>>          } \
>>
>> When CONFIG_VSX is not selected, cpu_has_feature(CPU_FTR_VSX_COMP) constant folds to 'false' so the
>> call to enable_kernel_vsx() is discarded and the build succeeds.
> 
> IC. So you might as well have an empty (dummy) function instead?
> 

But with an empty function, you take the risk that one day, someone calls it without checking that 
CONFIG_VSX is selected. Here if someone does that, build will fail.

Another solution is to declare a non static prototype of it, like __put_user_bad() for instance. In 
that case, the link will fail.

I prefer the BUILD_BUG() approach as I find it cleaner and more explicit, and also because it breaks 
the build at compile time, you don't have to wait link time to catch the error.

Christophe
