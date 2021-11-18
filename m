Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2336455F72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 16:26:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw3YT4ZBGz2ymt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 02:26:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw3Xy3MqBz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 02:26:10 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 17B56CC6774A;
 Thu, 18 Nov 2021 16:26:05 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 16:26:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00185230fa0-a63f-47c9-a378-026865b9ccb6,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <22e0571f-a1d0-b980-8989-57815dcbe267@kaod.org>
Date: Thu, 18 Nov 2021 16:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 11/11] powerpc/smp: Add a doorbell=off kernel parameter
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-12-clg@kaod.org> <87fss3m0sp.fsf@mpe.ellerman.id.au>
 <7341ab0d-c12b-6d5f-76d3-5927a2734f02@kaod.org>
 <87sfvtlstb.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87sfvtlstb.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2b9e3a3f-a957-4d6f-984f-29ac195eff8d
X-Ovh-Tracer-Id: 8109857031525403613
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/18/21 10:24, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
>> On 11/11/21 11:41, Michael Ellerman wrote:
>>> Cédric Le Goater <clg@kaod.org> writes:
>>>> On processors with a XIVE interrupt controller (POWER9 and above), the
>>>> kernel can use either doorbells or XIVE to generate CPU IPIs. Sending
>>>> doorbell is generally preferred to using the XIVE IC because it is
>>>> faster. There are cases where we want to avoid doorbells and use XIVE
>>>> only, for debug or performance. Only useful on POWER9 and above.
>>>
>>> How much do we want this?
>>
>> Yes. Thanks for asking. It is a recent need.
>>
>> Here is some background I should have added in the first place. May be
>> for a v2.
>>
>> We have different ways of doing IPIs on POWER9 and above processors,
>> depending on the platform and the underlying hypervisor.
>>
>> - PowerNV uses global doorbells
>>
>> - pSeries/KVM uses XIVE only because local doorbells are not
>>     efficient, as there are emulated in the KVM hypervisor
>>
>> - pSeries/PowerVM uses XIVE for remote cores and local doorbells for
>>     threads on same core (SMT4 or 8)
>>
>> This recent commit 5b06d1679f2f ("powerpc/pseries: Use doorbells even
>> if XIVE is available") introduced the optimization for PowerVM and
>> commit 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell
>> restrictions") restricted the optimization.
>>
>> We would like a way to turn off the optimization.
> 
> Just for test/debug though?

Yes. For now, this is the main target.

>>> Kernel command line args are a bit of a pain, they tend to be poorly
>>> tested, because someone has to explicitly enable them at boot time,
>>> and then reboot to test the other case.
>>
>> True. The "xive=off" parameter was poorly tested initially.
>>
>>> When would we want to enable this?
>>
>> For bring-up, for debug, for tests. I have been using a similar switch
>> to compare the XIVE interrupt controller performance with doorbells on
>> POWER9 and P0WER10.
>>
>> A new need arises with PowerVM, some configurations will behave as KVM
>> (local doorbell are unsupported) and the doorbell=off parameter is a
>> simple way to handle this case today.
> 
> That's the first I've heard of that, what PowerVM configurations have
> non-working doorbells?

It's not released yet.

>>> Can we make the kernel smarter about when to use doorbells and make
>>> it automated?
>>
>> I don't think we want to probe all IPI methods to detect how well
>> local doorbells are supported on the platform. Do we ?
> 
> We don't *want to*, but sounds like we might have to if they are not
> working in some configurations as you mentioned above.

Yeah. This is too early. I will keep that patch for internal use
until we have clarified.

Thanks,

C.
