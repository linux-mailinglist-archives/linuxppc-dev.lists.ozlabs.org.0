Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0142A4F75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:56:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQfBn63SWzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQdBk4rNBzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQdBj5tLYz8tWB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:11:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQdBj5T6bz9sVN; Wed,  4 Nov 2020 05:11:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CQdBg2wlxz9sVK
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 05:11:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQdBY61ZJz9v1mr;
 Tue,  3 Nov 2020 19:11:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hH_M8vkh2aQq; Tue,  3 Nov 2020 19:11:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQdBY5DrWz9v1mk;
 Tue,  3 Nov 2020 19:11:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A2DF8B7DB;
 Tue,  3 Nov 2020 19:11:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wJwWUaoqKYD6; Tue,  3 Nov 2020 19:11:03 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CB358B7D9;
 Tue,  3 Nov 2020 19:11:03 +0100 (CET)
Subject: Re: C vdso
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au> <874kmkx7gi.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a27bde01-5498-4527-042a-44d2146b92d3@csgroup.eu>
Date: Tue, 3 Nov 2020 19:11:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <874kmkx7gi.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/10/2020 à 12:07, Michael Ellerman a écrit :
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 24/09/2020 à 15:17, Christophe Leroy a écrit :
>>>> Le 17/09/2020 à 14:33, Michael Ellerman a écrit :
>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>
>>>>>> What is the status with the generic C vdso merge ?
>>>>>> In some mail, you mentionned having difficulties getting it working on
>>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>>
>>>>> Yeah sorry I was hoping to get time to work on it but haven't been able
>>>>> to.
>>>>>
>>>>> It's causing crashes on ppc64 ie. big endian.
>> ...
>>>>
>>>> Can you tell what defconfig you are using ? I have been able to setup a full glibc PPC64 cross
>>>> compilation chain and been able to test it under QEMU with success, using Nathan's vdsotest tool.
>>>
>>> What config are you using ?
>>
>> ppc64_defconfig + guest.config
>>
>> Or pseries_defconfig.
>>
>> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other toolchains too.
> 
> I'm also seeing warnings because of the feature fixups:
> 

[...]

> 
> That's happening because the 32-bit VDSO is built with CONFIG_PPC32=y,
> due to config-fake32.h, and that causes the feature fixup entries to be
> the wrong size.
> 
> See the logic in feature-fixup.h:
> 
>    #if defined(CONFIG_PPC64) && !defined(__powerpc64__)
>    /* 64 bits kernel, 32 bits code (ie. vdso32) */
>    #define FTR_ENTRY_LONG		.8byte
>    #define FTR_ENTRY_OFFSET	.long 0xffffffff; .long
>    #elif defined(CONFIG_PPC64)
>    #define FTR_ENTRY_LONG		.8byte
>    #define FTR_ENTRY_OFFSET	.8byte
>    #else
>    #define FTR_ENTRY_LONG		.long
>    #define FTR_ENTRY_OFFSET	.long
>    #endif
> 
> 
> We expect the fixup entries to still use 64-bit values, even for the
> 32-bit VDSO in a 64-bit kernel.
> 
> TBH I'm not sure how config-fake32.h can work long term, it's so fragile
> to be defining/redefining a handful of CONFIG symbols like that.
> 
> The generic VDSO code is fairly careful to only include uapi and vdso
> headers, not linux ones. So I think we need to better split our headers
> so that we can build the VDSO code with few or no linux headers, and so
> avoid the need to define any (or most) CONFIG symbols.
> 

Finally, it was easy to do, just had to change a couple of __powerpc64__ into CONFIG_PPC64 in 
asm/cputable.h, and move asm/time.h functions playing with timebase into asm/timebase.h

Christophe
