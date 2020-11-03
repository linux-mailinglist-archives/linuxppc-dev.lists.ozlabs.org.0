Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4A2A4F7B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:57:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQfDY3WmSzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:57:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQdFR52bNzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:13:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQdFQ1X6jz8tWB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:13:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQdFP6qqYz9sVS; Wed,  4 Nov 2020 05:13:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CQdFP1Sb3z9sVN
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 05:13:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQdFH0Hycz9v1YX;
 Tue,  3 Nov 2020 19:13:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zY2c4qTz6g5L; Tue,  3 Nov 2020 19:13:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQdFG4t0nz9v1YW;
 Tue,  3 Nov 2020 19:13:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86AFE8B7DB;
 Tue,  3 Nov 2020 19:13:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vIWlmdOnkfoT; Tue,  3 Nov 2020 19:13:24 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BBFC8B7D9;
 Tue,  3 Nov 2020 19:13:24 +0100 (CET)
Subject: Re: C vdso
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
 <877drhxeg8.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <50214d90-be25-f673-494c-840fdfb96206@csgroup.eu>
Date: Tue, 3 Nov 2020 19:13:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <877drhxeg8.fsf@mpe.ellerman.id.au>
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



Le 23/10/2020 à 15:24, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 24/09/2020 à 15:17, Christophe Leroy a écrit :
>>> Le 17/09/2020 à 14:33, Michael Ellerman a écrit :
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>
>>>>> What is the status with the generic C vdso merge ?
>>>>> In some mail, you mentionned having difficulties getting it working on
>>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>>
>>>> Yeah sorry I was hoping to get time to work on it but haven't been able
>>>> to.
>>>>
>>>> It's causing crashes on ppc64 ie. big endian.
> ...
>>>
>>> Can you tell what defconfig you are using ? I have been able to setup a full glibc PPC64 cross
>>> compilation chain and been able to test it under QEMU with success, using Nathan's vdsotest tool.
>>
>> What config are you using ?
> 
> ppc64_defconfig + guest.config
> 
> Or pseries_defconfig.
> 
> I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other toolchains too.
> 
> At a minimum we're seeing relocations in the output, which is a problem:
> 
>    $ readelf -r build\~/arch/powerpc/kernel/vdso64/vdso64.so
>    
>    Relocation section '.rela.dyn' at offset 0x12a8 contains 8 entries:
>      Offset          Info           Type           Sym. Value    Sym. Name + Addend
>    000000001368  000000000016 R_PPC64_RELATIVE                     7c0
>    000000001370  000000000016 R_PPC64_RELATIVE                     9300
>    000000001380  000000000016 R_PPC64_RELATIVE                     970
>    000000001388  000000000016 R_PPC64_RELATIVE                     9300
>    000000001398  000000000016 R_PPC64_RELATIVE                     a90
>    0000000013a0  000000000016 R_PPC64_RELATIVE                     9300
>    0000000013b0  000000000016 R_PPC64_RELATIVE                     b20
>    0000000013b8  000000000016 R_PPC64_RELATIVE                     9300

Looks like it's due to the OPD and relation between the function() and .function()

By using DOTSYM() in the 'bl' call, that's directly the dot function which is called and the OPD is 
not used anymore, it can get dropped.

Now I get .rela.dyn full of 0, don't know if we should drop it explicitely.

Christophe
