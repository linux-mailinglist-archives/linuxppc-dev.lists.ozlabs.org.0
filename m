Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F696286DC6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 06:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6JP72XTnzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 15:38:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6JMb6LYTzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 15:37:12 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3FB4569D7289;
 Thu,  8 Oct 2020 06:37:03 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 8 Oct 2020
 06:37:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00109f5673c-ab6b-4e8f-a576-265daca88b5f,
 B62477DDF3291A3D82A50BEDF84162C512859302) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] powerpc/pci: Fix PHB removal/rescan on PowerNV
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200925092258.525079-1-clg@kaod.org>
 <CAOSf1CGW7ocYm2BXFiy9Nmi+G+xwVcqQzTqPo_nss_tmpG_V=w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <06bf1b7b-e9b4-44b0-1aad-60b938f8e924@kaod.org>
Date: Thu, 8 Oct 2020 06:37:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CGW7ocYm2BXFiy9Nmi+G+xwVcqQzTqPo_nss_tmpG_V=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e8ea91ac-b18a-4a3a-8e39-5e1bee2158f7
X-Ovh-Tracer-Id: 10911658948260891555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrgeejgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehoohhhrghllhesghhmrghilhdrtghomh
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-pci <linux-pci@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/8/20 4:23 AM, Oliver O'Halloran wrote:
> On Fri, Sep 25, 2020 at 7:23 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> To fix an issue with PHB hotplug on pSeries machine (HPT/XIVE), commit
>> 3a3181e16fbd introduced a PPC specific pcibios_remove_bus() routine to
>> clear all interrupt mappings when the bus is removed. This routine
>> frees an array allocated in pcibios_scan_phb().
>>
>> This broke PHB hotplug on PowerNV because, when a PHB is removed and
>> re-scanned through sysfs, the PCI layer un-assigns and re-assigns
>> resources to the PHB but does not destroy and recreate the PCI
>> controller structure. Since pcibios_remove_bus() does not clear the
>> 'irq_map' array pointer, a second removal of the PHB will try to free
>> the array a second time and corrupt memory.
> 
> "PHB hotplug" and "hot-plugging devices under a PHB" are different
> things. What you're saying here doesn't make a whole lot of sense to
> me unless you're conflating the two. The distinction is important
> since on pseries we can use DLPAR to add and remove actual PHBs (i.e.
> the pci_controller) at runtime, but there's no corresponding mechanism
> on PowerNV.

And it's even different on QEMU. 

>> Free the 'irq_map' array in pcibios_free_controller() to fix
>> corruption and clear interrupt mapping after it has been
>> disposed. This to avoid filling up the array with successive
>> remove/rescan of a bus.
> 
> Even with this patch I think we're still broken. With this patch
> applied the init path is something like:
> 
> per-phb init:
>     allocate phb->irq_map array
> per-bus init:
>     nothing
> per-device init:
>     pcibios_bus_add_device()
>        pci_read_irq_line()
>             pci_irq_map_register(pci_dev, virq)
>                *record the device's interrupt in phb->irq_map*
> 
> And the teardown path:
> 
> per-device teardown:
>     nothing
> per-bus teardown:
>     pcibios_remove_bus()
>         pci_irq_map_dispose()
>             *walk phb->irq_map and dispose of each mapped interrupt*
> per-phb teardown:
>     free(phb->irq_map)
> 
> There's a lot of asymmetry here, which is a problem in itself, but the
> real issue is that when removing *any* pci_bus under a PHB we dispose
> of the LSI\ for *every* device under that PHB. Not good.
> 
> Ideally we should be fixing this by having the per-device teardown
> handle disposing the mapping. Unfortunately, there's no pcibios hook
> that's called when removing a pci_dev. However, we can register a bus
> notifier which will be called when the pci_dev is removed from its bus
> and we already do that for the per-device EEH teardown and to handle
> IOMMU TCE invalidation when the device is removed.

I lack the knowledge here and I think some else should take over,
as I am not doing a good job. 

Michael, can you drop the initial patch again :/ It is better not
to merge anything.

Thanks,

C. 


