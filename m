Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E31190D64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 13:29:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mrCN6rCdzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 23:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.50.107; helo=6.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
 [46.105.50.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mr8x6YMTzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 23:26:54 +1100 (AEDT)
Received: from player691.ha.ovh.net (unknown [10.110.103.225])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 57BB589078
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:21:01 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 1E5F810D1BF1E;
 Tue, 24 Mar 2020 12:20:40 +0000 (UTC)
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
To: Haren Myneni <haren@linux.ibm.com>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
 <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
 <bd846a9c-0e21-1d97-0b03-e01c35ff01ae@kaod.org>
 <1584990135.9256.15381.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <475d136f-5b71-6c6c-c206-4a528565e6ff@kaod.org>
Date: Tue, 24 Mar 2020 13:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584990135.9256.15381.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18099122480320777209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/23/20 8:02 PM, Haren Myneni wrote:
> On Mon, 2020-03-23 at 10:27 +0100, Cédric Le Goater wrote:
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
>>
>> This version is hijacking the lowlevel routines of the XIVE irqchip which
>> is not the best approach. OCXL is doing that because it needs to allocate
>> interrupts for the user space processes using the AFU and we should rework 
>> that part. 
>>
>> However, the translation fault interrupt is allocated by skiboot.
> 
> Sorry my mistake. I should have CC you earlier. 
> 
> Each VAS instance will generate fault interrupt which is per chip. There
> won't be other job completion interrupts. 

That's a very good reason to set everything in the skiboot driver and 
advertise the interrupt number in the DT. The interrupt will be mapped
automatically by OF routines and the driver will only have to install
an interrupt handler. 

> Correct, V3 used allocating interrupts per chip in skiboot and exposed
> in DT. Since XIVE code has similar feature, exploited this approach so
> that we do not need skiboot changes. 

It's not the same. These are the low level (OPAL) interface used by the 
XIVE driver. The exception is the KVM XIVE device which needs a finer
grain. 

C.
