Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E96091B8671
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 14:23:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498VZ50070zDqrs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 22:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=eThJ3L6f; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498VWK0829zDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 22:20:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 498VW93dlpz9ttgG;
 Sat, 25 Apr 2020 14:20:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eThJ3L6f; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sSLizUiCbZe8; Sat, 25 Apr 2020 14:20:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 498VW915YBz9ttfw;
 Sat, 25 Apr 2020 14:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587817253; bh=xduG0f9KUHs/JAaDeRgGH/5x4mQMN6KPZKL81TT97d8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eThJ3L6fw0DV8f8IdsJRpCR/Bbc2147rkCKxNgMeDk+ozxnljyvVSRcEs0kcZxRiH
 CaX/6R36ILVLhYnQOYIzfk4ti0WgXOf0jt3Fi+zNPO1DSj2JLmcYG2gzKNrRKSNWnf
 gb5UE7dvUn7chsVll04EVgUh9I7byqrSTqm5xSpg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A6E18B776;
 Sat, 25 Apr 2020 14:20:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Dhe3uke-xWBg; Sat, 25 Apr 2020 14:20:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A59758B752;
 Sat, 25 Apr 2020 14:20:53 +0200 (CEST)
Subject: Re: New powerpc vdso calling convention
To: Nicholas Piggin <npiggin@gmail.com>, binutils@sourceware.org,
 linuxppc-dev@lists.ozlabs.org
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
Date: Sat, 25 Apr 2020 14:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587810370.tg8ym9yjpc.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com,
 Andy Lutomirski <luto@kernel.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/04/2020 à 12:56, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>>
>>
>> Le 25/04/2020 à 07:22, Nicholas Piggin a écrit :
>>> As noted in the 'scv' thread, powerpc's vdso calling convention does not
>>> match the C ELF ABI calling convention (or the proposed scv convention).
>>> I think we could implement a new ABI by basically duplicating function
>>> entry points with different names.
>>
>> I think doing this is a real good idea.
>>
>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and the
>> main pitfall has been that our vdso calling convention is not compatible
>> with C calling convention, so we have go through an ASM entry/exit.
>>
>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=171469
>>
>> We should kill this error flag return through CR[SO] and get it the
>> "modern" way like other architectectures implementing the C VDSO: return
>> 0 when successfull, return -err when failed.
> 
> Agreed.
> 
>>> The ELF v2 ABI convention would suit it well, because the caller already
>>> requires the function address for ctr, so having it in r12 will
>>> eliminate the need for address calculation, which suits the vdso data
>>> page access.
>>>
>>> Is there a need for ELF v1 specific calls as well, or could those just be
>>> deprecated and remain on existing functions or required to use the ELF
>>> v2 calls using asm wrappers?
>>
>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say
>> yes, it would be good to have it to avoid going through ASM in the middle.
> 
> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with
> their address in r12 if called at their global entry point. ELFv1 have a
> function descriptor with call address and TOC in it, caller has to load
> the TOC if it's global.
> 
> The vdso doesn't have TOC, it has one global address (the vdso data
> page) which it loads by calculating its own address.
> 
> The kernel doesn't change the vdso based on whether it's called by a v1
> or v2 userspace (it doesn't really know itself and would have to export
> different functions). glibc has a hack to create something:
> 
> # define VDSO_IFUNC_RET(value)                           \
>    ({                                                     \
>      static Elf64_FuncDesc vdso_opd = { .fd_toc = ~0x0 }; \
>      vdso_opd.fd_func = (Elf64_Addr)value;                \
>      &vdso_opd;                                           \
>    })
> 
> If we could make something which links more like any other dso with
> ELFv1, that would be good. Otherwise I think v2 is preferable so it
> doesn't have to calculate its own address.

I see the following in glibc. So looks like PPC32 is like PPC64 elfv1. 
By the way, they are talking about something not completely finished in 
the kernel. Can we finish it ?

#if (defined(__PPC64__) || defined(__powerpc64__)) && _CALL_ELF != 2
/* The correct solution is for _dl_vdso_vsym to return the address of 
the OPD
    for the kernel VDSO function.  That address would then be stored in the
    __vdso_* variables and returned as the result of the IFUNC resolver 
function.
    Yet, the kernel does not contain any OPD entries for the VDSO functions
    (incomplete implementation).  However, PLT relocations for IFUNCs 
still expect
    the address of an OPD to be returned from the IFUNC resolver 
function (since
    PLT entries on PPC64 are just copies of OPDs).  The solution for now 
is to
    create an artificial static OPD for each VDSO function returned by a 
resolver
    function.  The TOC value is set to a non-zero value to avoid 
triggering lazy
    symbol resolution via .glink0/.plt0 for a zero TOC (requires 
thread-safe PLT
    sequences) when the dynamic linker isn't prepared for it e.g. 
RTLD_NOW.  None
    of the kernel VDSO routines use the TOC or AUX values so any 
non-zero value
    will work.  Note that function pointer comparisons will not use this 
artificial
    static OPD since those are resolved via ADDR64 relocations and will 
point at
    the non-IFUNC default OPD for the symbol.  Lastly, because the IFUNC 
relocations
    are processed immediately at startup the resolver functions and this 
code need
    not be thread-safe, but if the caller writes to a PLT slot it must 
do so in a
    thread-safe manner with all the required barriers.  */
#define VDSO_IFUNC_RET(value)                            \
   ({                                                     \
     static Elf64_FuncDesc vdso_opd = { .fd_toc = ~0x0 }; \
     vdso_opd.fd_func = (Elf64_Addr)value;                \
     &vdso_opd;                                           \
   })
#else
#define VDSO_IFUNC_RET(value)  ((void *) (value))
#endif


Christophe
