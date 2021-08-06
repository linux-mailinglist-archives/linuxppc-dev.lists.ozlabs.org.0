Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B23E242C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 09:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgxzL5K2Kz3clX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 17:33:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggxyw46Mpz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 17:32:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ggxyn4TjKz9sVr;
 Fri,  6 Aug 2021 09:32:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbRH5ufXxLP3; Fri,  6 Aug 2021 09:32:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ggxyn31dfz9sVl;
 Fri,  6 Aug 2021 09:32:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4554C8B80D;
 Fri,  6 Aug 2021 09:32:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ul3L8Rnr0BtW; Fri,  6 Aug 2021 09:32:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D19948B7FD;
 Fri,  6 Aug 2021 09:32:47 +0200 (CEST)
Subject: Re: [RFC PATCH 1/4] powerpc: Optimize register usage for esr register
To: Xiongwei Song <sxwjean@gmail.com>
References: <20210726143053.532839-1-sxwjean@me.com>
 <5e2336aa-90bf-b820-b5e4-e9a63088930f@csgroup.eu>
 <CAEVVKH-rht+xpwTUL=ny6qENe2Fb0n=3e7DEmc5qzpSq2_1gTA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <26814448-c30a-1de1-bad4-79e2bffc3054@csgroup.eu>
Date: Fri, 6 Aug 2021 09:32:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAEVVKH-rht+xpwTUL=ny6qENe2Fb0n=3e7DEmc5qzpSq2_1gTA@mail.gmail.com>
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@me.com>,
 oleg@redhat.com, npiggin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, efremov@linux.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 peterx@redhat.com, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 akpm@linux-foundation.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/08/2021 à 05:16, Xiongwei Song a écrit :
> On Thu, Aug 5, 2021 at 6:06 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 26/07/2021 à 16:30, sxwjean@me.com a écrit :
>>> From: Xiongwei Song <sxwjean@gmail.com>
>>>
>>> Create an anonymous union for dsisr and esr regsiters, we can reference
>>> esr to get the exception detail when CONFIG_4xx=y or CONFIG_BOOKE=y.
>>> Otherwise, reference dsisr. This makes code more clear.
>>
>> I'm not sure it is worth doing that.
> Why don't we use "esr" as reference manauls mentioned?
> 
>>
>> What is the point in doing the following when you know that regs->esr and regs->dsisr are exactly
>> the same:
>>
>>   > -    err = ___do_page_fault(regs, regs->dar, regs->dsisr);
>>   > +    if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
>>   > +            err = ___do_page_fault(regs, regs->dar, regs->esr);
>>   > +    else
>>   > +            err = ___do_page_fault(regs, regs->dar, regs->dsisr);
>>   > +
> Yes, we can drop this. But it's a bit vague.
> 
>> Or even
>>
>>   > -    int is_write = page_fault_is_write(regs->dsisr);
>>   > +    unsigned long err_reg;
>>   > +    int is_write;
>>   > +
>>   > +    if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
>>   > +            err_reg = regs->esr;
>>   > +    else
>>   > +            err_reg = regs->dsisr;
>>   > +
>>   > +    is_write = page_fault_is_write(err_reg);
>>
>>
>> Artificially growing the code for that makes no sense to me.
> 
> We can drop this too.
>>
>>
>> To avoid anbiguity, maybe the best would be to rename regs->dsisr to something like regs->sr , so
>> that we know it represents the status register, which is DSISR or ESR depending on the platform.
> 
> If so, this would make other people more confused. My consideration is
> to follow what the reference
> manuals represent.

Maybe then we could rename the fields as regs->dsisr_esr and regs->dar_dear

That would be more explicit for everyone.

The UAPI header however should remain as is because anonymous unions are not supported by old 
compilers as mentioned by Michael.

But nevertheless, there are also situations where was is stored in regs->dsisr is not what we have 
in DSISR register. For instance on an ISI exception, we store a subset of the content of SRR1 
register into regs->dsisr.

Christophe
