Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2081C3A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 09:07:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4538025NhMzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 17:07:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jyEpa3YI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4537yR6VfBzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 17:06:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4537yK6JFmz9v0Tg;
 Tue, 14 May 2019 09:06:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jyEpa3YI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lVfI_mUM6H_0; Tue, 14 May 2019 09:06:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4537yK5GLvz9v0Tf;
 Tue, 14 May 2019 09:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557817577; bh=QhZk5AKMvVtZH9OJVjXA274roYD38fZ5S554G+Rq67Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jyEpa3YI25rRv3puw/15KkX94xIqiUkh4mf0Rgem0bEJZCijfdjedORYirOH9kIHN
 PuBlDH1N1lVlU/hKH2oCNbspBTxEeE6AI3tmtRc4DP4+P2FQnVjQrx8C7jh/ac1sVo
 8xR1hix3THOqjHvVm9xrd92bD1onLgrha4TKPZBk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A723F8B7B5;
 Tue, 14 May 2019 09:06:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jrU4pcKLvK9E; Tue, 14 May 2019 09:06:18 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F07A8B7BB;
 Tue, 14 May 2019 09:06:18 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Fix compile issue with force DAWR
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190513071703.25243-1-mikey@neuling.org>
 <f1015de7-faf1-ae6d-d1f9-9c904f19c58b@c-s.fr>
 <4ae1ab46779c5724d129bbeb62859e288ff7dffa.camel@neuling.org>
 <2561c888-1ab5-1cd7-2fe2-509d8d71cae4@c-s.fr>
 <eae1df7b0d329f2be6da0322210026c711d38bdc.camel@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ffaecf95-76dc-3998-f699-44c50f2d5a0d@c-s.fr>
Date: Tue, 14 May 2019 09:06:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <eae1df7b0d329f2be6da0322210026c711d38bdc.camel@neuling.org>
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



Le 14/05/2019 à 08:55, Michael Neuling a écrit :
> 
[...]


> 
>>>>> +
>>>>> +static ssize_t dawr_write_file_bool(struct file *file,
>>>>> +				    const char __user *user_buf,
>>>>> +				    size_t count, loff_t *ppos)
>>>>> +{
>>>>> +	struct arch_hw_breakpoint null_brk = {0, 0, 0};
>>>>> +	size_t rc;
>>>>> +
>>>>> +	/* Send error to user if they hypervisor won't allow us to write
>>>>> DAWR */
>>>>> +	if ((!dawr_force_enable) &&
>>>>> +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
>>>>> +	    (set_dawr(&null_brk) != H_SUCCESS))
>>>>
>>>> The above is not real clear.
>>>> set_dabr() returns 0, H_SUCCESS is not used there.
>>>
>>> It pseries_set_dawr() will return a hcall number.
>>
>> Right, then it maybe means set_dawr() should be fixes ?
> 
> Sorry, I don't understand this.

I meant set_dawr() should be fixed:

As the above test hide value 0 by using H_SUCCESS for the test, in order 
to ease understanding, set_dawr() should return H_SUCCESS instead of 
return 0;

Christophe

> 
>>> This code hasn't changed. I'm just moving it.
>>
>> Right, but could be an improvment for another patch.
>> As far as I remember you are the one who wrote that code at first place,
>> arent't you ?
> 
> Yep, classic crap Mikey code :-)
> 
> Mikey
> 
