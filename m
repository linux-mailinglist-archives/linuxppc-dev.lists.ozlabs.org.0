Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888B3ECEE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 08:57:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp4hp6n35z3cVf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 16:56:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp4hN65Sdz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 16:56:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp4hD19RRz9sTx;
 Mon, 16 Aug 2021 08:56:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNNXTaRtFlXs; Mon, 16 Aug 2021 08:56:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp4hD09zGz9sTd;
 Mon, 16 Aug 2021 08:56:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFDEF8B778;
 Mon, 16 Aug 2021 08:56:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m4dfxgS2IyOI; Mon, 16 Aug 2021 08:56:27 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3068B763;
 Mon, 16 Aug 2021 08:56:27 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
To: kajoljain <kjain@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
 <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
 <871r6wmc16.fsf@mpe.ellerman.id.au>
 <0068dbc4-fa4b-ce98-9e89-3f02f939720d@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3a34c79d-b800-1a11-7a4b-1fb3babb9df1@csgroup.eu>
Date: Mon, 16 Aug 2021 08:56:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0068dbc4-fa4b-ce98-9e89-3f02f939720d@linux.ibm.com>
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
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/08/2021 à 08:44, kajoljain a écrit :
> 
> 
> On 8/14/21 6:14 PM, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 13/08/2021 à 10:24, Kajol Jain a écrit :
>>>> Incase of random sampling, there can be scenarios where SIAR is not
>>>> latching sample address and results in 0 value. Since current code
>>>> directly returning the siar value, we could see multiple instruction
>>>> pointer values as 0 in perf report.
>>
>> Can you please give more detail on that? What scenarios? On what CPUs?
>>
> 
> Hi Michael,
>      Sure I will update these details in my next patch-set.
> 
>>>> Patch resolves this issue by adding a ternary condition to return
>>>> regs->nip incase SIAR is 0.
>>>
>>> Your description seems rather similar to
>>> https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bccacd7f46c
>>>
>>> Does it mean that the problem occurs on more than the power10 DD1 ?
>>>
>>> In that case, can the solution be common instead of doing something for power10 DD1 and something
>>> for others ?
>>
>> Agreed.
>>
>> This change would seem to make that P10 DD1 logic superfluous.
>>
>> Also we already have a fallback to regs->nip in the else case of the if,
>> so we should just use that rather than adding a ternary condition.
>>
>> eg.
>>
>> 	if (use_siar && siar_valid(regs) && siar)
>> 		return siar + perf_ip_adjust(regs);
>> 	else if (use_siar)
>> 		return 0;		// no valid instruction pointer
>> 	else
>> 		return regs->nip;
>>
>>
>> I'm also not sure why we have that return 0 case, I can't think of why
>> we'd ever want to do that rather than using nip. So maybe we should do
>> another patch to drop that case.
> 
> Yeah make sense. I will remove return 0 case in my next version.
> 

This was added by commit 
https://github.com/linuxppc/linux/commit/e6878835ac4794f25385522d29c634b7bbb7cca9

Are we sure it was an error to add it and it can be removed ?

Christophe
