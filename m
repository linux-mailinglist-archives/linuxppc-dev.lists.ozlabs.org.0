Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0C640684
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 13:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNsMQ3QK3z3bg8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 23:14:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2162 seconds by postgrey-1.36 at boromir; Fri, 02 Dec 2022 23:14:26 AEDT
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net [46.105.37.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNsLp0HnSz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 23:14:22 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A65562C917;
	Fri,  2 Dec 2022 11:38:14 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 2 Dec
 2022 12:38:14 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-95G00144eb74ec-a39a-4530-9259-7097822f44a2,
                    DD67DF67F3B0AB7776FDCC71B54CDE51ACBF4E27) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bea99ec1-ab6f-da7a-723b-68c32e5042af@kaod.org>
Date: Fri, 2 Dec 2022 12:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Crystal Wood
	<oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>,
	<linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>
References: <20221128043623.1745708-1-npiggin@gmail.com>
 <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
 <caaa2ef9-d6df-8cf4-0489-1a0dd4623244@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <caaa2ef9-d6df-8cf4-0489-1a0dd4623244@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f9de8023-e484-44a2-b2e1-c6720e7ad2d9
X-Ovh-Tracer-Id: 16403798694496275308
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtdekgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeduieegtdfggfejfeelvefhgedtkeethfegleeigeelvdfgjeethefhfeejteeinecuffhomhgrihhnpehoiihlrggsshdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpohhsshessghushgvrhhrohhrrdhnvghtpdhnphhighhgihhnsehgmhgrihhlrdgtohhmpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdgsvghnhheskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrghdplhgruhhrvghnthhiuhdrthhuughorhesnhigphdrtghomhdpshhhvghnthgvhiesghhmrghilhdrtghomh
 dpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
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
Cc: qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/2/22 12:04, Daniel Henrique Barboza wrote:
> 
> 
> On 11/30/22 17:45, Crystal Wood wrote:
>> On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:
>>> BookE KVM is in a deep maintenance state, I'm not sure how much testing
>>> it gets. I don't have a test setup, and it does not look like QEMU has
>>> any HV architecture enabled. It hasn't been too painful but there are
>>> some cases where it causes a bit of problem not being able to test, e.g.,
>>>
>>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.html
>>>
>>> Time to begin removal process, or are there still people using it? I'm
>>> happy to to keep making occasional patches to try keep it going if
>>> there are people testing upstream. Getting HV support into QEMU would
>>> help with long term support, not sure how big of a job that would be.
>>
>> Not sure what you mean about QEMU not having e500 HV support?  I don't know if
>> it's bitrotted, but it's there.
> 
> AFAIK all QEMU ppc boards, aside from pSeries and the Mac ones, are always used in
> emulated mode in an use case similar to what Bernhard described in his reply (run
> in x86 due to lack of ppc hardware).
> 
> I am not aware of e500 KVM support in QEMU since I never attempted it. But yes,
> it is present, but poorly tested - if tested at all. And the reason why there's
> no push on our side to removed it from QEMU is because its code is so entwined
> with pSeries KVM that it would take too much effort.
>
> Do not take the presence of e500 KVM support in QEMU as a blocker to disabled it in
> the kernel. As far as the current QEMU usage goes e500 KVM can be removed without
> too much drama from our side.
> 
> Cedric, do you have any opinions about it?

I can not tell how much e500 KVM is used. The last report we had
on the topic was :

   https://lore.kernel.org/all/R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it/

and the last commit mentioning e500 VMs I could find is cb3778a045,
which brings us back to QEMU 2.2 or so.

It would be nice to 'quickly' check the state of the KVM stack on
such boards and, may be, plan for more cleanups.


Thanks,

C.

> 
> 
> 
> Daniel
> 
> 
>>
>> I don't know whether anyone is still using this, but if they are, it's
>> probably e500mc and not e500v2 (which involved a bunch of hacks to get almost-
>> sorta-usable performance out of hardware not designed for virtualization).  I
>> do see that there have been a few recent patches on QEMU e500 (beyond the
>> treewide cleanup type stuff), though I don't know if they're using KVM.  CCing
>> them and the QEMU list.
>>
>> I have an e6500 I could occasionally test on, if it turns out people do still
>> care about this.  Don't count me as the use case, though. :-)
>>
>> FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to be done in
>> kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 to be "cleaner and
>> faster". :-P
>>
>> -Crystal
>>
>>

