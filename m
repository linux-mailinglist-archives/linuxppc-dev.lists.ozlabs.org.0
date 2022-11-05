Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CEC61DDB1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 20:29:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4SH20wpFz3dts
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 06:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4SGS2Tr3z2ywD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Nov 2022 06:28:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4N4SGD6gXnz9sfH;
	Sat,  5 Nov 2022 20:28:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5Xaurpgzo3o; Sat,  5 Nov 2022 20:28:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4N4SGD5czrz9sfD;
	Sat,  5 Nov 2022 20:28:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AC16C8B76C;
	Sat,  5 Nov 2022 20:28:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0QtASGCCfdWc; Sat,  5 Nov 2022 20:28:36 +0100 (CET)
Received: from [192.168.235.6] (unknown [192.168.235.6])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63C3C8B763;
	Sat,  5 Nov 2022 20:28:36 +0100 (CET)
Message-ID: <d224142a-cdbf-9eca-b357-1f9862b22cae@csgroup.eu>
Date: Sat, 5 Nov 2022 20:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 2/6] powerpc/64s: Helpers to switch between linear and
 vmapped stack pointers
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-3-ajd@linux.ibm.com>
 <20c79a09-0b95-bb52-2495-999d2365308d@csgroup.eu>
In-Reply-To: <20c79a09-0b95-bb52-2495-999d2365308d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nick Piggin <npiggin@gmail.com>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/11/2022 à 09:00, Christophe Leroy a écrit :
> 
> 
> Le 04/11/2022 à 18:27, Andrew Donnellan a écrit :
>> powerpc unfortunately has too many places where we run stuff in real mode.
>>
>> With CONFIG_VMAP_STACK enabled, this means we need to be able to swap the
>> stack pointer to use the linear mapping when we enter a real mode section,
>> and back afterwards.
>>
>> Store the top bits of the stack pointer in both the linear map and the
>> vmalloc space in the PACA, and add some helper macros/functions to swap
>> between them.
> 
> That may work when pagesize is 64k because stack is on a single page,
> but I doubt is works with 4k pages, because vmalloc may allocate non
> contiguous pages.
> 

[snip]

> 
>> +
>> +#else // __ASSEMBLY__
>> +
>> +#include <asm/paca.h>
>> +#include <asm/reg.h>
>> +#include <linux/mm.h>
>> +
>> +#define stack_pa(ptr) (is_vmalloc_addr((ptr)) ? (void *)vmalloc_to_phys((void *)(ptr)) : (void *)ptr)
>> +
>> +static __always_inline void swap_stack_linear(void)
>> +{
>> +	current_stack_pointer = get_paca()->kstack_linear_base |	\
>> +		(current_stack_pointer & (THREAD_SIZE - 1));
> 
> That looks hacky. I think you can't just change current_stack_pointer on
> the fly. You have to provide something similar to call_do_softirq() or
> call_do_irq()
> 

Maybe you can have a look at Nic's RFC for calling functions in real 
mode : 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210212012041.392566-1-npiggin@gmail.com/

Christophe
