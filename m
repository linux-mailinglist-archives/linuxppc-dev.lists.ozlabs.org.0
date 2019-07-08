Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBC61C08
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:00:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hztG2lFPzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 19:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kCkonxU1"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hzrP6Q10zDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 18:58:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45hzr9568jz9txqj;
 Mon,  8 Jul 2019 10:58:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kCkonxU1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZqjmSVTnCCYU; Mon,  8 Jul 2019 10:58:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45hzr93xKRz9txqh;
 Mon,  8 Jul 2019 10:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562576297; bh=SEEbC4SVXv54ubiPmqZ/ohTZiQJHhOXXhOXl6IoW5uo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kCkonxU12IqU+OKoT05jmROmtyo56NkBiacWHjmlTOlOlpzmHasGBbSVt49awlH4a
 Ohvd50OfTyqC0MMR/Y/9hwvvVqL9oAhvHf6y1Fp0jfEBkr1KgWs5ACvOxOcuJmT6Xq
 4Vvk15dmwt8kvZk6z/25IRcXmt8UoTUKAIuyHbAQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D1998B790;
 Mon,  8 Jul 2019 10:58:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U1bNWRlSm0cg; Mon,  8 Jul 2019 10:58:22 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CA328B78C;
 Mon,  8 Jul 2019 10:58:22 +0200 (CEST)
Subject: Re: [PATCH v3 3/3] powerpc/module64: Use symbolic instructions names.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <298f344bdb21ab566271f5d18c6782ed20f072b7.1556865423.git.christophe.leroy@c-s.fr>
 <6fb61d1c9104b0324d4a9c445f431c0928c7ea25.1556865423.git.christophe.leroy@c-s.fr>
 <87bly5ibsd.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9bc00fb4-379a-e19b-4d27-32fff8f9781b@c-s.fr>
Date: Mon, 8 Jul 2019 10:58:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87bly5ibsd.fsf@concordia.ellerman.id.au>
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
Cc: Ulirch Weigand <Ulrich.Weigand@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/07/2019 à 02:56, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> To increase readability/maintainability, replace hard coded
>> instructions values by symbolic names.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>> v3: fixed warning by adding () in an 'if' around X | Y (unlike said in v2 history, this change was forgotten in v2)
>> v2: rearranged comments
>>
>>   arch/powerpc/kernel/module_64.c | 53 +++++++++++++++++++++++++++--------------
>>   1 file changed, 35 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
>> index c2e1b06253b8..b33a5d5e2d35 100644
>> --- a/arch/powerpc/kernel/module_64.c
>> +++ b/arch/powerpc/kernel/module_64.c
>> @@ -704,18 +711,21 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> ...
>>   			/*
>>   			 * If found, replace it with:
>>   			 *	addis r2, r12, (.TOC.-func)@ha
>>   			 *	addi r2, r12, (.TOC.-func)@l
>>   			 */
>> -			((uint32_t *)location)[0] = 0x3c4c0000 + PPC_HA(value);
>> -			((uint32_t *)location)[1] = 0x38420000 + PPC_LO(value);
>> +			((uint32_t *)location)[0] = PPC_INST_ADDIS | __PPC_RT(R2) |
>> +						    __PPC_RA(R12) | PPC_HA(value);
>> +			((uint32_t *)location)[1] = PPC_INST_ADDI | __PPC_RT(R2) |
>> +						    __PPC_RA(R12) | PPC_LO(value);
>>   			break;
> 
> This was crashing and it's amazing how long you can stare at a
> disassembly and not see the difference between `r2` and `r12` :)

Argh, yes. I was misleaded by the comment I guess. Sorry for that and 
thanks for fixing.

Christophe

> 
> Fixed now.
> 
> cheers
> 
