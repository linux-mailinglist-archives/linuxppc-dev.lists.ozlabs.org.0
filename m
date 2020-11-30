Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B982C7E38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 07:29:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkwL826DfzDr7j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 17:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkwJR0FpnzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 17:27:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CkwJ64mHpz9tyfJ;
 Mon, 30 Nov 2020 07:27:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tZQorIQ8EJWZ; Mon, 30 Nov 2020 07:27:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CkwJ63kvfz9tyfH;
 Mon, 30 Nov 2020 07:27:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FFAB8B788;
 Mon, 30 Nov 2020 07:27:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8c374VPuk53l; Mon, 30 Nov 2020 07:27:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CCF88B75B;
 Mon, 30 Nov 2020 07:27:23 +0100 (CET)
Subject: Re: [PATCH] powerpc: Allow relative pointers in bug table entries
To: Jordan Niethe <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20201127030238.763-1-jniethe5@gmail.com>
 <5c997bc4-c859-0db6-f167-37ca37819059@csgroup.eu>
 <874kl7y609.fsf@mpe.ellerman.id.au>
 <CACzsE9r6GoFANSGw_6SK0R7SZGbU+U0_UvDLH9Pzj_LRBsHJQw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8036ce19-74fa-9663-91b8-edc69b0ed9f2@csgroup.eu>
Date: Mon, 30 Nov 2020 07:27:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9r6GoFANSGw_6SK0R7SZGbU+U0_UvDLH9Pzj_LRBsHJQw@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/11/2020 à 02:50, Jordan Niethe a écrit :
> On Mon, Nov 30, 2020 at 12:42 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 27/11/2020 à 04:02, Jordan Niethe a écrit :
>>>> This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
>>>> offsets are stored in the bug entries rather than 64-bit pointers.
>>>>
>>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>>> ---
>>>>    arch/powerpc/Kconfig           |  4 ++++
>>>>    arch/powerpc/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++--
>>>>    arch/powerpc/xmon/xmon.c       | 17 ++++++++++++++--
>>>>    3 files changed, 54 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index e9f13fe08492..294108e0e5c6 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -311,6 +311,10 @@ config GENERIC_BUG
>>>>       default y
>>>>       depends on BUG
>>>>
>>>> +config GENERIC_BUG_RELATIVE_POINTERS
>>>> +    def_bool y
>>>> +    depends on GENERIC_BUG
>>>> +
>>>>    config SYS_SUPPORTS_APM_EMULATION
>>>>       default y if PMAC_APM_EMU
>>>>       bool
>>>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>>>> index 338f36cd9934..d03d834042a1 100644
>>>> --- a/arch/powerpc/include/asm/bug.h
>>>> +++ b/arch/powerpc/include/asm/bug.h
>>>> @@ -12,7 +12,11 @@
>>>>    #ifdef CONFIG_DEBUG_BUGVERBOSE
>>>>    .macro EMIT_BUG_ENTRY addr,file,line,flags
>>>>        .section __bug_table,"aw"
>>>> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>>>
>>> As far as I understand, as soon as CONFIG_BUG is selected, GENERIC_BUG is automatically selected so
>>> GENERIC_BUG_RELATIVE_POINTERS is selected as well. Therefore this #ifndef is never possible.
>>
>> Yeah.
>>
>> There is one place in the generic code that has an ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>> but that's because it has to support arches that don't select it.
>>
>> In the arch code we know that it's enabled, so there should be no need
>> for any ifdefs.
> For 32bit, pointers are 4 bytes anyway so it would be pointless to
> store a displacement, so won't we need some ifdefs for that?

I'd say it the other way round:

For 32bit, pointers are 4 bytes anyway so it would be pointless to
make it different from 64bit.

We are definitely not on a performance critical path when dealing with bug entries, so I think it is 
better to keep a common code for PPC32 and PPC64.

Christophe
