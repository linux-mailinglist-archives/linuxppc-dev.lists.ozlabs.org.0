Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A235191214
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:55:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mt6V558xzDqCY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 00:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.74.227; helo=8.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 8.mo178.mail-out.ovh.net (8.mo178.mail-out.ovh.net
 [46.105.74.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48msh81l2YzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 00:35:35 +1100 (AEDT)
Received: from player792.ha.ovh.net (unknown [10.108.54.119])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id C4A3395F52
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:27:32 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id E7D8710C75CB2;
 Tue, 24 Mar 2020 13:27:12 +0000 (UTC)
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
To: Oliver O'Halloran <oohall@gmail.com>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
 <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
 <bd846a9c-0e21-1d97-0b03-e01c35ff01ae@kaod.org>
 <CAOSf1CFyERZE_am5uXVY2Y65=Vkm=afd39a_2RysKR6nkqvV0A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dfb2a4c4-bfe3-08eb-3f9e-b959170ee325@kaod.org>
Date: Tue, 24 Mar 2020 14:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CFyERZE_am5uXVY2Y65=Vkm=afd39a_2RysKR6nkqvV0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 775745037484854265
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Michael Neuling <mikey@neuling.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/24/20 3:26 AM, Oliver O'Halloran wrote:
> On Mon, Mar 23, 2020 at 8:28 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 3/23/20 10:06 AM, Cédric Le Goater wrote:
>>> On 3/19/20 7:14 AM, Haren Myneni wrote:
>>>>
>>>> Alloc IRQ and get trigger port address for each VAS instance. Kernel
>>>> register this IRQ per VAS instance and sets this port for each send
>>>> window. NX interrupts the kernel when it sees page fault.
>>>
>>> I don't understand why this is not done by the OPAL driver for each VAS
>>> of the system. Is the VAS unit very different from OpenCAPI regarding
>>> the fault ?
>>
>> I checked the previous patchsets and I see that v3 was more like I expected
>> it: one interrupt for faults allocated by the skiboot driver and exposed
>> in the DT.
>>
>> What made you change your mind ?
> 
> From init_vas_inst() in arch/powerpc/platforms/powernv/vas.c:
> 
>         if (pdev->num_resources != 4) {
>                 pr_err("Unexpected DT configuration for [%s, %d]\n",
>                                 pdev->name, vasid);
>                 return -ENODEV;
>         }
> 
> This code should never have been written, but here we are. Due to the
> above adding an interrupt in the DT makes the driver unable to bind on
> older kernels. In an older version of the patches (don't think it was
> posted) Haren was using a non-standard interrupt property and we could
> work around the problem by going back to that.

ok ... :/ I didn't know. Don't we have a rule on LinuxPPC for such 
things ? Such as, the culprit should send a croissant to everyone 
involved. 

> However, we already have the OPAL calls for allocating / freeing
> hardware interrupt numbers so why not do that? 

It's a good way to work around the problem but we are bypassing the
irqchip which does other things for the driver.

> If we ever want to take
> advantage of the job completion interrupts we'd want to have the
> ability to allocate them since the completion interrupts are
> per-window rather than per-VAS.

Yes. That's what I thought it was about to begin with. OCXL has a  
first implementation of such interrupts. 

>> This version is hijacking the lowlevel routines of the XIVE irqchip which
>> is not the best approach. OCXL is doing that because it needs to allocate
>> interrupts for the user space processes using the AFU and we should rework
>> that part.
> 
> What'd you have in mind for the reworking the oxcl interrupt allocation? 
> I didn't find it that objectionable since it's more or less the same as 
> what happens when allocating IPIs.

I think we need to work a bit more on the concepts, on the interfaces,
internal at the platform kernel level and at the user space level, and 
on the configuration, with chip affinity in mind. There are bunch of 
information on the sources that are retrieved from the firmware or 
hypervisor that we care about. An irqchip might be the best option 
for the moment. 

At the same time, it would be good to keep in mind user interrupts. 

C.

> 
>> However, the translation fault interrupt is allocated by skiboot.
>>
>> Sorry for the noise, I would like to understand more how this works. I also
>> have passthrough in mind.
>>
>> C.

