Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548015FDED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 11:18:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KR6T4krfzDqpg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 21:18:41 +1100 (AEDT)
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
 header.s=mail header.b=lJPQAvSy; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KR590Y5CzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 21:17:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48KR534g6Dz9v083;
 Sat, 15 Feb 2020 11:17:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lJPQAvSy; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZzJgLv4krNH4; Sat, 15 Feb 2020 11:17:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48KR533PkQz9v082;
 Sat, 15 Feb 2020 11:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581761847; bh=nmPPyvS7mugZ03IF9OR5ujLrYqbMOGWsdwsS+aXnSYc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lJPQAvSy+mJFdKu8sEJPCng689HbtSSsjTwrmksW37mb8w8XHZ3VtZkjQywCjnE4H
 +KTP3kXepPxvIjVdeLjwsIK37dNi0rp3UeAQatRdC8/2vEQOmDg5IT4U7uj8MVjGS4
 ymIAzoXj5iimVp7TJM6TDOcB8933f0kwSdRSo22w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92C198B781;
 Sat, 15 Feb 2020 11:17:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cXg6Z6Js6SoI; Sat, 15 Feb 2020 11:17:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E2B928B755;
 Sat, 15 Feb 2020 11:17:27 +0100 (CET)
Subject: Re: [PATCH] powerpc/8xx: Fix clearing of bits 20-23 in ITLB miss
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <4f70c2778163affce8508a210f65d140e84524b4.1581272050.git.christophe.leroy@c-s.fr>
 <546ce4737f308a4ba99a53f550de5b44abc06444.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1d6a53ab-ea72-7452-ea5f-43dd70b223c9@c-s.fr>
Date: Sat, 15 Feb 2020 11:17:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <546ce4737f308a4ba99a53f550de5b44abc06444.camel@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/02/2020 à 07:28, Leonardo Bras a écrit :
> On Sun, 2020-02-09 at 18:14 +0000, Christophe Leroy wrote:
>> In ITLB miss handled the line supposed to clear bits 20-23 on the
>> L2 ITLB entry is buggy and does indeed nothing, leading to undefined
>> value which could allow execution when it shouldn't.
>>
>> Properly do the clearing with the relevant instruction.
>>
>> Fixes: 74fabcadfd43 ("powerpc/8xx: don't use r12/SPRN_SPRG_SCRATCH2 in TLB Miss handlers")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/head_8xx.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
>> index 9922306ae512..073a651787df 100644
>> --- a/arch/powerpc/kernel/head_8xx.S
>> +++ b/arch/powerpc/kernel/head_8xx.S
>> @@ -256,7 +256,7 @@ InstructionTLBMiss:
>>   	 * set.  All other Linux PTE bits control the behavior
>>   	 * of the MMU.
>>   	 */
>> -	rlwimi	r10, r10, 0, 0x0f00	/* Clear bits 20-23 */
>> +	rlwinm	r10, r10, 0, ~0x0f00	/* Clear bits 20-23 */
>>   	rlwimi	r10, r10, 4, 0x0400	/* Copy _PAGE_EXEC into bit 21 */
>>   	ori	r10, r10, RPN_PATTERN | 0x200 /* Set 22 and 24-27 */
>>   	mtspr	SPRN_MI_RPN, r10	/* Update TLB entry */
> 
> Looks a valid change.
> rlwimi  r10, r10, 0, 0x0f00 means:
> r10 = ((r10 << 0) & 0x0f00) | (r10 & ~0x0f00) which ends up being
> r10 = r10
> 
> On ISA, rlwinm is recommended for clearing high order bits.
> rlwinm  r10, r10, 0, ~0x0f00 means:
> r10 = (r10 << 0) & ~0x0f00
> 
> Which does exactly what the comments suggests.
> 
> FWIW:
> Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>
> 

I guess you mean

Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>
