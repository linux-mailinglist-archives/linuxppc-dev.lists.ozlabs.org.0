Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D933B520
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:54:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzdFN5cxxz30BG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.77.235; helo=10.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1807 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 00:53:59 AEDT
Received: from 10.mo51.mail-out.ovh.net (10.mo51.mail-out.ovh.net
 [46.105.77.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzdF31lPrz2yRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:53:58 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id EDEAA272425;
 Mon, 15 Mar 2021 14:14:25 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 14:14:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004e18aac27-4fc7-410e-9420-f023a4655590,
 6ECECE93D947A1E75FB970C6684F7B2999F5CB5C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc: Fix missing prototype problems for
 "arch/powerpc/kernel/setup_64.c"
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "heying (H)"
 <heying24@huawei.com>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <npiggin@gmail.com>, <dja@axtens.net>,
 <akpm@linux-foundation.org>, <rppt@kernel.org>, <aneesh.kumar@linux.ibm.com>
References: <20210315120444.215905-1-heying24@huawei.com>
 <6eb1925c-a3a1-f062-29da-3a7fa946505c@csgroup.eu>
 <ddd03e30-9e54-66cd-8917-6f620557b795@huawei.com>
 <c6af9455-9a04-c93e-ac7c-3c7d6a56953a@kaod.org>
 <fe0638cc-28be-2e5c-9e94-ab3ff7666164@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <eb78b1b0-03f9-2b20-02a7-74dbeea81493@kaod.org>
Date: Mon, 15 Mar 2021 14:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fe0638cc-28be-2e5c-9e94-ab3ff7666164@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 77abf365-c64c-43ad-8d93-00f34f111c32
X-Ovh-Tracer-Id: 6751177319206915064
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/21 2:01 PM, Christophe Leroy wrote:
> 
> 
> Le 15/03/2021 à 13:57, Cédric Le Goater a écrit :
>> On 3/15/21 1:48 PM, heying (H) wrote:
>>>
>>> 在 2021/3/15 20:17, Christophe Leroy 写道:
>>>> You subject doesn't match the content of the patch.
>>> OK. I'll adapt that.
>>>>
>>>> Le 15/03/2021 à 13:04, He Ying a écrit :
>>>>> The variables 'uaccess_fulsh' and 'entry_flush' are not referenced
>>>>> outside the file. So define them as static to avoid the warnings.
>>>>>
>>>>> And add a prototype for the function 'panic_smp_self_stop' for the
>>>>> same purpose.
>>>>>
>>>>> Sparse also warns that 'rfi_flush' should be static. However, it's
>>>>> referenced outside the file.
>>>>
>>>> To clear that warning, you have to include asm/security_features.h, rfi_flush is declared there.
>>> Do you mean that I should include this header in arch/powerpc/kernel/setup_64.c?
>>
>> yes.
>>
>>>>
>>>>>
>>>>> The warnings about the file reported by sparse are as follows:
>>>>> arch/powerpc/kernel/setup_64.c:422:6: warning: symbol 'panic_smp_self_stop' was not declared. Should it be static?
>>>>> arch/powerpc/kernel/setup_64.c:951:6: warning: symbol 'rfi_flush' was not declared. Should it be static?
>>>>> arch/powerpc/kernel/setup_64.c:952:6: warning: symbol 'entry_flush' was not declared. Should it be static?
>>>>> arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush' was not declared. Should it be static?
>>>>>
>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>> Signed-off-by: He Ying <heying24@huawei.com>
>>>>> ---
>>>>>    arch/powerpc/kernel/setup_64.c | 6 ++++--
>>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>>>>> index 560ed8b975e7..603aacd8527b 100644
>>>>> --- a/arch/powerpc/kernel/setup_64.c
>>>>> +++ b/arch/powerpc/kernel/setup_64.c
>>>>> @@ -71,6 +71,8 @@
>>>>>      #include "setup.h"
>>>>>    +extern void panic_smp_self_stop(void);
>>>>> +
>>>>
>>>> For function prototypes 'extern' is unneeded and deprecated.
>>>>
>>>> And function prototypes should go in an header file.
>>>>
>>>> panic_smp_self_stop() is called from kernel/panic.c , it should be declared in one of the generic linux header files I think.
>>> Yes, you're right. But I have no idea which header it should be declared in. May I have your suggestions?
>>
>> arch/powerpc/include/asm/bug.h looks like a good place.
> 
> Why declaring it in a powerpc header ?
> 
> It's a weak function defined in core part of kernel (kernel/panic.c).
> 
> I think it should go in a common header, just like for instance arch_thaw_secondary_cpus_begin()

Indeed. include/linux/smp.h is a better place for a common routine.

C.

