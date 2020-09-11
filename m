Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0806265907
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 08:01:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnlWg3hLLzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 16:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnlTb1TX4zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 16:00:01 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.221])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CD8056057665;
 Fri, 11 Sep 2020 07:59:55 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 11 Sep
 2020 07:59:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012738d6c7-9b91-488f-9790-6ca26ea15ca7,
 A1694100663AAA22525CBAD2033D2796A0BDBC13) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 3/7] powerpc/sstep: Fix W=1 compile warning
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-4-clg@kaod.org>
 <8a71335b-12b8-4d17-9b98-ff1eb0a39b84@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <47310980-9989-c9c0-61a9-ec033ac18197@kaod.org>
Date: Fri, 11 Sep 2020 07:59:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8a71335b-12b8-4d17-9b98-ff1eb0a39b84@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5964688f-4470-477f-86cc-bc2730a209a1
X-Ovh-Tracer-Id: 1322650916637477856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/11/20 7:38 AM, Christophe Leroy wrote:
> 
> 
> Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
>> ../arch/powerpc/lib/sstep.c: In function ‘mlsd_8lsd_ea’:
>> ../arch/powerpc/lib/sstep.c:225:3: error: suggest braces around empty body in an ‘if’ statement [-Werror=empty-body]
>>     ; /* Invalid form. Should already be checked for by caller! */
>>     ^
> 
> A small sentence explaining how this is fixed would be welcome, so that you don't need to read the code the know what the commit does to fix the warning. Also the subject should be more explicit.
> 
> 
> 
>>
>> Cc: Jordan Niethe <jniethe5@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/lib/sstep.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index caee8cc77e19..14572af16e55 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -221,8 +221,9 @@ static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
>>           ; /* Leave ea as is */
>>       else if (prefix_r && !ra)
>>           ea += regs->nip;
>> -    else if (prefix_r && ra)
>> +    else if (prefix_r && ra) {
>>           ; /* Invalid form. Should already be checked for by caller! */
>> +    }
> 
> You can't do that. Now checkpatch will complain that you don't have braces on all legs of the if/else dance.

Should we fix checkpatch ?

> I think the last 'else if' should simply be removed entirely as it does nothing. Eventually, just leave the comment, something like:
> 
>     /* (prefix_r && ra) is Invalid form. Should already be checked for by caller! */
> 
> And if (prefix_r && ra) is not possible, then the previous if should just be 'if (prefx_r)'

Indeed. I will rework that one.

Thanks,

C. 


> Christophe
> 
> 
>>         return ea;
>>   }
>>

