Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A476F4A112
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:46:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sns80JMqzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="n36fD+f8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Snp026l8zDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:44:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Snnt4lwTz9tyqH;
 Tue, 18 Jun 2019 14:44:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=n36fD+f8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nbcFWjQId3Oz; Tue, 18 Jun 2019 14:44:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Snnt3jXQz9tyqF;
 Tue, 18 Jun 2019 14:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560861842; bh=PPGY0wzKrjpG/skXEgA6qaUxme8C35MPyZr+/HeM9oE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=n36fD+f80hVDyGSeJHi3msRfk1FDLx2PFiNYGR9SCRR4TK+UOAJTcn8MUxK3gfFm5
 bpR37iwIxh2lzWcPYg4lUUVeos+okdbcJSv32eVdIOYxn1wQODcEiHWvace5St9lDy
 FB4IDUr/CCcRLkWPM34aXzKAIwJFAcync8a4NPuY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EFDC8B8AA;
 Tue, 18 Jun 2019 14:44:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6TmhG7-Z5gS9; Tue, 18 Jun 2019 14:44:02 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EC678B872;
 Tue, 18 Jun 2019 14:44:02 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32s: fix initial setup of segment registers on
 secondary CPU
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, erhard_f@mailbox.org
References: <be07403806abc56ec027f6d47468411876e18bb5.1560267983.git.christophe.leroy@c-s.fr>
 <b60946f5-dc70-61ce-e266-af91890cb702@c-s.fr>
 <87h88noz1d.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <81d8101a-c0b6-a316-5844-e0901300e4e4@c-s.fr>
Date: Tue, 18 Jun 2019 14:44:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <87h88noz1d.fsf@concordia.ellerman.id.au>
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



Le 18/06/2019 à 14:31, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 11/06/2019 à 17:47, Christophe Leroy a écrit :
>>> The patch referenced below moved the loading of segment registers
>>> out of load_up_mmu() in order to do it earlier in the boot sequence.
>>> However, the secondary CPU still needs it to be done when loading up
>>> the MMU.
>>>
>>> Reported-by: Erhard F. <erhard_f@mailbox.org>
>>> Fixes: 215b823707ce ("powerpc/32s: set up an early static hash table for KASAN")
>>
>> Cc: stable@vger.kernel.org
> 
> Sorry patchwork didn't pick that up and I missed it. The AUTOSEL bot
> will probably pick it up anyway though.

Don't worry, this was unneeded because we added KASAN in 5.2.
My mistake.
Christophe

> 
> cheers
> 
>>> diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
>>> index 1d5f1bd0dacd..f255e22184b4 100644
>>> --- a/arch/powerpc/kernel/head_32.S
>>> +++ b/arch/powerpc/kernel/head_32.S
>>> @@ -752,6 +752,7 @@ __secondary_start:
>>>    	stw	r0,0(r3)
>>>    
>>>    	/* load up the MMU */
>>> +	bl	load_segment_registers
>>>    	bl	load_up_mmu
>>>    
>>>    	/* ptr to phys current thread */
>>>
