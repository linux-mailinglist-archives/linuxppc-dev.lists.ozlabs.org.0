Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553252444AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 07:53:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSXgF2ZKFzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 15:53:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSXdX1WSFzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 15:52:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSXdR3zfHz9vD2y;
 Fri, 14 Aug 2020 07:52:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fa354yKAlT20; Fri, 14 Aug 2020 07:52:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSXdR2fQMz9vD2x;
 Fri, 14 Aug 2020 07:52:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E8668B775;
 Fri, 14 Aug 2020 07:52:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P3ttainyg2_X; Fri, 14 Aug 2020 07:52:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3E8B8B767;
 Fri, 14 Aug 2020 07:52:11 +0200 (CEST)
Subject: Re: [PATCH 1/5] powerpc: Remove flush_instruction_cache for book3s/32
To: Christoph Hellwig <hch@infradead.org>
References: <11a330af231af22874c006302a945388846f8112.1597313510.git.christophe.leroy@csgroup.eu>
 <20200813121308.GA16237@infradead.org> <20200813121403.GB16237@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a0f7d4a2-d2c8-0edc-bc29-47508d4d17e2@csgroup.eu>
Date: Fri, 14 Aug 2020 07:52:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813121403.GB16237@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/08/2020 à 14:14, Christoph Hellwig a écrit :
> On Thu, Aug 13, 2020 at 01:13:08PM +0100, Christoph Hellwig wrote:
>> On Thu, Aug 13, 2020 at 10:12:00AM +0000, Christophe Leroy wrote:
>>> -#ifndef CONFIG_PPC_8xx
>>> +#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC_BOOK3S_32)
>>>   _GLOBAL(flush_instruction_cache)
>>>   #if defined(CONFIG_4xx)
>>>   	lis	r3, KERNELBASE@h
>>> @@ -290,18 +289,11 @@ _GLOBAL(flush_instruction_cache)
>>>   	mfspr	r3,SPRN_L1CSR1
>>>   	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
>>>   	mtspr	SPRN_L1CSR1,r3
>>> -#elif defined(CONFIG_PPC_BOOK3S_601)
>>> -	blr			/* for 601, do nothing */
>>> -#else
>>> -	/* 603/604 processor - use invalidate-all bit in HID0 */
>>> -	mfspr	r3,SPRN_HID0
>>> -	ori	r3,r3,HID0_ICFI
>>> -	mtspr	SPRN_HID0,r3
>>>   #endif /* CONFIG_4xx */
>>>   	isync
>>>   	blr
>>>   EXPORT_SYMBOL(flush_instruction_cache)
>>> -#endif /* CONFIG_PPC_8xx */
>>> +#endif /* CONFIG_PPC_8xx || CONFIG_PPC_BOOK3S_32 */
>>
>> What about untangling this into entirely separate versions instead
>> of the ifdef mess?  Also the export does not seem to be needed at all.
> 
> Ok, I see that you do that later, sorry.
> 

In v2, I drop the untangling patch, because the series completely 
dismantles flush_instruction_cache() so there is no need for an 
ephemeral untanggled version of it.

Christophe
