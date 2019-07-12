Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C119766DF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:35:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lXT24yHSzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 22:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XevcYNHO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lXFP6k2czDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 22:25:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45lXFH0vgWz9v6nj;
 Fri, 12 Jul 2019 14:25:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XevcYNHO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xppzq7TgHMzO; Fri, 12 Jul 2019 14:25:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45lXFG6zD3z9v6nd;
 Fri, 12 Jul 2019 14:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562934323; bh=MrZShueQeQrb9VRsPEo/O23+InffJJz8RMSExRW4vT8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XevcYNHO5ZdPcxbfS2De6+nYgaztUh4Ok9v+qB1/gvaad838MTwzGmESbdrKlWfps
 k31i3dhuaKzcRUijpJP0WIXUI3ybESm70tM2jwozZQp+l2vTb10Ca2GGahAC6vnPJk
 sIVnkaxEhroTG8x0hp/5bpRzhMk/ibEQjKq418jU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 53A6E8B89E;
 Fri, 12 Jul 2019 14:25:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TuerkKGLXlBk; Fri, 12 Jul 2019 14:25:24 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FE2E8B89C;
 Fri, 12 Jul 2019 14:25:24 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/book3s/mm: Update Oops message to print the
 correct translation in use
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
References: <20190711145814.17970-1-aneesh.kumar@linux.ibm.com>
 <8736jbg46p.fsf@concordia.ellerman.id.au>
 <a9efab7b-0c61-5224-f936-82db1039d159@c-s.fr>
 <87r26ve93k.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bcd0355c-6729-3ff6-8ecc-12104d3c51cf@c-s.fr>
Date: Fri, 12 Jul 2019 14:25:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87r26ve93k.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/07/2019 à 14:22, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 12/07/2019 à 08:25, Michael Ellerman a écrit :
>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> ...
>>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>>> index 11caa0291254..b181d6860f28 100644
>>>> --- a/arch/powerpc/kernel/traps.c
>>>> +++ b/arch/powerpc/kernel/traps.c
>>>> @@ -250,15 +250,22 @@ static void oops_end(unsigned long flags, struct pt_regs *regs,
>>>>    }
>>>>    NOKPROBE_SYMBOL(oops_end);
>>>>    
>>>> +static char *get_mmu_str(void)
>>>> +{
>>>> +	if (early_radix_enabled())
>>>> +		return " MMU=Radix";
>>>> +	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
>>>> +		return " MMU=Hash";
>>>> +	return "";
>>>> +}
>>>
>>> We don't change MMU once we're up, so just do this logic once and stash
>>> it into a static string, rather than rechecking on every oops.
>>
>> Do we really have oops so often that we have to worry about that ?
> 
> Sometimes :)
> 
> But no I don't mean it's a performance issue, it just seems simpler to
> compute the value once and store it. In fact for most platforms it can
> just be a static string at compile time, it's only 64-bit Book3S that
> needs to do anything at runtime.

Right, but I'm sure GCC will take care of that since the function is 
static and called only once.

Christophe
> 
> cheers
> 
