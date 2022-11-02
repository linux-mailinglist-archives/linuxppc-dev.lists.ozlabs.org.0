Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9D6160AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 11:14:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2N6G3Hdkz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 21:14:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2N5k4Ttzz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 21:14:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4N2N5b0zpLz9smM;
	Wed,  2 Nov 2022 11:13:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8u_c8IGUmnQ; Wed,  2 Nov 2022 11:13:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4N2N5b0FzPz9smK;
	Wed,  2 Nov 2022 11:13:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EEC228B79E;
	Wed,  2 Nov 2022 11:13:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4mbkkeTk3y58; Wed,  2 Nov 2022 11:13:54 +0100 (CET)
Received: from [192.168.234.147] (unknown [192.168.234.147])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9379A8B78D;
	Wed,  2 Nov 2022 11:13:54 +0100 (CET)
Message-ID: <20a4382b-089a-442a-ad05-af893823c9dc@csgroup.eu>
Date: Wed, 2 Nov 2022 11:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 4/7] powerpc/code-patching: Verify instruction patch
 succeeded
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-5-bgray@linux.ibm.com>
 <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
In-Reply-To: <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/11/2022 à 10:43, Christophe Leroy a écrit :
> 
> 
> Le 25/10/2022 à 06:44, Benjamin Gray a écrit :
>> Verifies that if the instruction patching did not return an error then
>> the value stored at the given address to patch is now equal to the
>> instruction we patched it to.
> 
> Why do we need that verification ? Until now it wasn't necessary, can 
> you describe a failure that occurs because we don't have this 
> verification ? Or is that until now it was reliable but the new method 
> you are adding will not be as reliable as before ?
> 
> What worries me with that new verification is that you are reading a 
> memory address with is mostly only used for code execution. That means:
> - You will almost always take a DATA TLB Miss, hence performance impact.
> - If one day we want Exec-only text mappings, it will become problematic.
> 
> So really the question is, is that patch really required ?
> 
>>
>> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>> ---
>>   arch/powerpc/lib/code-patching.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/lib/code-patching.c 
>> b/arch/powerpc/lib/code-patching.c
>> index 3b3b09d5d2e1..b0a12b2d5a9b 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -192,6 +192,8 @@ static int do_patch_instruction(u32 *addr, 
>> ppc_inst_t instr)
>>       err = __do_patch_instruction(addr, instr);
>>       local_irq_restore(flags);
>> +    WARN_ON(!err && !ppc_inst_equal(instr, ppc_inst_read(addr)));
>> +

Another point: you are doing the check outside of IRQ disabled section, 
is that correct ? What if an interrupt changed it in-between ?

Or insn't that possible ? In that case what's the real purpose of 
disabling IRQs here ?

>>       return err;
>>   }
>>   #else /* !CONFIG_STRICT_KERNEL_RWX */
