Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C136982A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 19:19:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRgxk1TjTz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 03:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRgxN0fN9z2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 03:18:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FRgx91x1wz9ttRv;
 Fri, 23 Apr 2021 19:18:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ALw1zRGnK-kI; Fri, 23 Apr 2021 19:18:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FRgx916p8z9ttRt;
 Fri, 23 Apr 2021 19:18:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D15C8B886;
 Fri, 23 Apr 2021 19:18:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HOCbVO0OVlWb; Fri, 23 Apr 2021 19:18:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB56D8B765;
 Fri, 23 Apr 2021 19:18:38 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/vdso64: link vdso64 with linker
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-2-ndesaulniers@google.com>
 <87blio1ilu.fsf@mpe.ellerman.id.au>
 <CAKwvOd=ZeJU+vLUk2P7FpX35haj7AC50B9Yps4pyoGCpd7ueTw@mail.gmail.com>
 <3d837a36-a186-6789-7924-eaa97f056b68@csgroup.eu>
 <CAKwvOd=KP5CZ5wOrczC6qPAzN7DdFCJ_XvU6e=zvB3XpQrp_-g@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bfa4fa45-9887-d7d4-21a7-ac48835b10c1@csgroup.eu>
Date: Fri, 23 Apr 2021 19:18:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=KP5CZ5wOrczC6qPAzN7DdFCJ_XvU6e=zvB3XpQrp_-g@mail.gmail.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2021 à 00:44, Nick Desaulniers a écrit :
> On Wed, Sep 2, 2020 at 11:02 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 02/09/2020 à 19:41, Nick Desaulniers a écrit :
>>> On Wed, Sep 2, 2020 at 5:14 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>>
>>>> Nick Desaulniers <ndesaulniers@google.com> writes:
>>>>> Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
>>>>
>>>> I think I'll just revert that for v5.9 ?
>>>
>>> SGTM; you'll probably still want these changes with some modifications
>>> at some point; vdso32 did have at least one orphaned section, and will
>>> be important for hermetic builds.  Seeing crashes in supported
>>> versions of the tools ties our hands at the moment.
>>>
>>
>> Keeping the tool problem aside with binutils 2.26, do you have a way to
>> really link an elf32ppc object when  building vdso32 for PPC64 ?
> 
> Sorry, I'm doing a bug scrub and found
> https://github.com/ClangBuiltLinux/linux/issues/774 still open (and my
> reply to this thread still in Drafts; never sent). With my patches
> rebased:
> $ file arch/powerpc/kernel/vdso32/vdso32.so
> arch/powerpc/kernel/vdso32/vdso32.so: ELF 32-bit MSB shared object,
> PowerPC or cisco 4500, version 1 (SYSV), dynamically linked, stripped
> 
> Are you still using 2.26?
> 
> I'm not able to repro Nathan's reported issue from
> https://lore.kernel.org/lkml/20200902052123.GA2687902@ubuntu-n2-xlarge-x86/,
> so I'm curious if I should resend the rebased patches as v2?

One comment on your rebased patch:

 > diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
 > index 8542e9bbeead..0bd06ec06aaa 100644
 > --- a/arch/powerpc/include/asm/vdso.h
 > +++ b/arch/powerpc/include/asm/vdso.h
 > @@ -25,19 +25,7 @@ int vdso_getcpu_init(void);
 >
 >   #else /* __ASSEMBLY__ */
 >
 > -#ifdef __VDSO64__
 > -#define V_FUNCTION_BEGIN(name)		\
 > -	.globl name;			\
 > -	name:				\
 > -
 > -#define V_FUNCTION_END(name)		\
 > -	.size name,.-name;
 > -
 > -#define V_LOCAL_FUNC(name) (name)
 > -#endif /* __VDSO64__ */
 > -
 > -#ifdef __VDSO32__
 > -
 > +#if defined(__VDSO32__) || defined (__VDSO64__)

You always have either __VDSO32__ or __VDSO64__ so this #if is pointless

 >   #define V_FUNCTION_BEGIN(name)		\
 >   	.globl name;			\
 >   	.type name,@function; 		\
 > @@ -47,8 +35,7 @@ int vdso_getcpu_init(void);
 >   	.size name,.-name;
 >
 >   #define V_LOCAL_FUNC(name) (name)
 > -
 > -#endif /* __VDSO32__ */
 > +#endif /* __VDSO{32|64}__ */
 >
 >   #endif /* __ASSEMBLY__ */
 >


Christophe
