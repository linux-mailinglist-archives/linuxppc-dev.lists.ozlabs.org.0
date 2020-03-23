Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2018F3F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:58:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mCZt6QmHzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:58:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.56.136; helo=1.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8401 seconds by postgrey-1.36 at bilbo;
 Mon, 23 Mar 2020 22:56:53 AEDT
Received: from 1.mo6.mail-out.ovh.net (1.mo6.mail-out.ovh.net [46.105.56.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mCXj1PvjzDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:56:49 +1100 (AEDT)
Received: from player690.ha.ovh.net (unknown [10.110.115.188])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 39BF1205EAF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 10:28:16 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id CB2881090FDEB;
 Mon, 23 Mar 2020 09:27:55 +0000 (UTC)
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
 <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
Message-ID: <bd846a9c-0e21-1d97-0b03-e01c35ff01ae@kaod.org>
Date: Mon, 23 Mar 2020 10:27:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9308940430136937465
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegkedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On 3/23/20 10:06 AM, Cédric Le Goater wrote:
> On 3/19/20 7:14 AM, Haren Myneni wrote:
>>
>> Alloc IRQ and get trigger port address for each VAS instance. Kernel
>> register this IRQ per VAS instance and sets this port for each send
>> window. NX interrupts the kernel when it sees page fault.
> 
> I don't understand why this is not done by the OPAL driver for each VAS 
> of the system. Is the VAS unit very different from OpenCAPI regarding
> the fault ? 

I checked the previous patchsets and I see that v3 was more like I expected
it: one interrupt for faults allocated by the skiboot driver and exposed  
in the DT.

What made you change your mind ? 

This version is hijacking the lowlevel routines of the XIVE irqchip which
is not the best approach. OCXL is doing that because it needs to allocate
interrupts for the user space processes using the AFU and we should rework 
that part. 

However, the translation fault interrupt is allocated by skiboot.

Sorry for the noise, I would like to understand more how this works. I also
have passthrough in mind.

C.

