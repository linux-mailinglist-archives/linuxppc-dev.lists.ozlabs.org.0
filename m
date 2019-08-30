Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D0A3164
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 09:43:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KWgg60wHzF0TM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 17:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="gVny2wTn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KWcw0SlYzDrgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 17:41:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KWcn5Kyhz9vBmW;
 Fri, 30 Aug 2019 09:41:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gVny2wTn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 14Tt15Z7pa5g; Fri, 30 Aug 2019 09:41:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KWcn4H8Dz9vBmK;
 Fri, 30 Aug 2019 09:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567150873; bh=Z3bd6wODPz5wA7uTANAowrL/V9jIt/k9bKsgaQKc7cY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gVny2wTndz/RHEcUKBQ8YjZjNNOj9ulkkSXsovq+Rg2W6RWn7fycH3f2mjz71nXKK
 qEsOJItpmlghns5c65IYr5NutqFw6o0Rhkq8o6ON2T1TooQW5VBxanrx2ZIMICXcpb
 y4AQoEAkaNf39a6nGn5tHIC7XqHvPE4RrkThtK4s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DA558B8E8;
 Fri, 30 Aug 2019 09:41:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WDKejOP-RFqE; Fri, 30 Aug 2019 09:41:14 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E1218B8E3;
 Fri, 30 Aug 2019 09:41:14 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: tell if a bad page fault on data is read or
 write.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <4f88d7e6fda53b5f80a71040ab400242f6c8cb93.1566400889.git.christophe.leroy@c-s.fr>
 <87o908tbgx.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <79e4ebad-7fef-7f9b-69f4-f9065b0dbde4@c-s.fr>
Date: Fri, 30 Aug 2019 09:41:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87o908tbgx.fsf@mpe.ellerman.id.au>
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



Le 29/08/2019 à 14:14, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> DSISR has a bit to tell if the fault is due to a read or a write.
> 
> Except some CPUs don't have a DSISR?
> 
> Which is why we have page_fault_is_write() that's used in
> __do_page_fault().


And that's why I'm also using page_fault_is_write() in my patch.

> 
> Or is that old cruft?
> 
> I see eg. in head_40x.S we pass r5=0 for error code, and we don't set
> regs->dsisr anywhere AFAICS. So it might just contain some junk.


We pass r5=0 in ISI but r5=SPRN_ESR in DSI.
And r5 is also saved into _ESR(r11)

And in asm-offset.c, we have:

	STACK_PT_REGS_OFFSET(_ESR, dsisr);

So regs->dsisr has the expected content.

Christophe


> 
> cheers
> 
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 8432c281de92..b5047f9b5dec 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -645,6 +645,7 @@ NOKPROBE_SYMBOL(do_page_fault);
>>   void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>>   {
>>   	const struct exception_table_entry *entry;
>> +	int is_write = page_fault_is_write(regs->dsisr);
>>   
>>   	/* Are we prepared to handle this fault?  */
>>   	if ((entry = search_exception_tables(regs->nip)) != NULL) {
>> @@ -658,9 +659,10 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>>   	case 0x300:
>>   	case 0x380:
>>   	case 0xe00:
>> -		pr_alert("BUG: %s at 0x%08lx\n",
>> +		pr_alert("BUG: %s on %s at 0x%08lx\n",
>>   			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
>> -			 "Unable to handle kernel data access", regs->dar);
>> +			 "Unable to handle kernel data access",
>> +			 is_write ? "write" : "read", regs->dar);
> 
>>   		break;
>>   	case 0x400:
>>   	case 0x480:
>> -- 
>> 2.13.3
