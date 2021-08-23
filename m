Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB213F46AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 10:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtQYM17tbz2xb8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 18:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtQXx5h0qz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 18:35:12 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 65A08BA8214F;
 Mon, 23 Aug 2021 10:35:10 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 23 Aug
 2021 10:35:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021070a8b7-d4da-4b00-a984-2c3dd9893ddc,
 6C3DA580BFD2A03B9CD9C7EDF86CA127720438B1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 5/6] audit: Declare ppc32_classify_syscall()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-6-clg@kaod.org>
 <d268f141-4ec3-eb1d-a6c1-4cd5f535ea49@csgroup.eu>
 <e1acf07a-772d-101d-2f28-24965f630248@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6f040090-4d9e-8f1a-1916-2da7625766af@kaod.org>
Date: Mon, 23 Aug 2021 10:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e1acf07a-772d-101d-2f28-24965f630248@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 422a32c3-dd53-43ee-83c8-19242777aad8
X-Ovh-Tracer-Id: 6754836494901611488
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeehtdeviefhgfeugfevjeeiveefvedtvdehhfejleduveejieefhfeffeetfeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/23/21 10:28 AM, Christophe Leroy wrote:
> 
> 
> Le 19/08/2021 à 16:56, Christophe Leroy a écrit :
>>
>>
>> Le 19/08/2021 à 14:56, Cédric Le Goater a écrit :
>>> This fixes a compile error with W=1.
>>>
>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>
>>>   I don't think this is correct. Which file could we use ?
>>
>> I think you can completely remove ppc32_classify_syscall(), and instead add the following in the default case in audit_classify_syscall():
>>
>>       default:
>> +        if (IS_ENABLED(CONFIG_PPC64) && abi == AUDIT_ARCH_PPC)
>> +            return 1;
>>           return 0;
>>
> 
> Forget that comment, it was crazy, because PPC32 and PPC64 use different syscall numbers.
> 
> By the way, I have submitted a patch to completely remove this stuff, see https://patchwork.ozlabs.org/project/linuxppc-dev/patch/dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu/

Nice ! Let's merge that instead.

Thanks,

C. 


> 
>>
>>>
>>>   arch/powerpc/include/asm/unistd.h | 3 +++
>>>   arch/powerpc/kernel/audit.c       | 1 -
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
>>> index b541c690a31c..d9025a7e973c 100644
>>> --- a/arch/powerpc/include/asm/unistd.h
>>> +++ b/arch/powerpc/include/asm/unistd.h
>>> @@ -47,6 +47,9 @@
>>>   #define __ARCH_WANT_SYS_UTIME
>>>   #define __ARCH_WANT_SYS_NEWFSTATAT
>>>   #define __ARCH_WANT_COMPAT_SYS_SENDFILE
>>> +#ifdef CONFIG_AUDIT
>>> +extern int ppc32_classify_syscall(unsigned int syscall);
>>> +#endif
>>>   #endif
>>>   #define __ARCH_WANT_SYS_FORK
>>>   #define __ARCH_WANT_SYS_VFORK
>>> diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
>>> index a2dddd7f3d09..c3c6c6a1069b 100644
>>> --- a/arch/powerpc/kernel/audit.c
>>> +++ b/arch/powerpc/kernel/audit.c
>>> @@ -41,7 +41,6 @@ int audit_classify_arch(int arch)
>>>   int audit_classify_syscall(int abi, unsigned syscall)
>>>   {
>>>   #ifdef CONFIG_PPC64
>>> -    extern int ppc32_classify_syscall(unsigned);
>>>       if (abi == AUDIT_ARCH_PPC)
>>>           return ppc32_classify_syscall(syscall);
>>>   #endif
>>>

