Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB41E3F9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 13:12:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X7Tf6jMyzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 21:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.44.50; helo=5.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4192 seconds by postgrey-1.36 at bilbo;
 Wed, 27 May 2020 21:11:16 AEST
Received: from 5.mo4.mail-out.ovh.net (5.mo4.mail-out.ovh.net [188.165.44.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X7S45hFczDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 21:11:16 +1000 (AEST)
Received: from player758.ha.ovh.net (unknown [10.110.103.200])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 9B4B223AEE4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 09:32:03 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 5AA9412C5EB77;
 Wed, 27 May 2020 07:32:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021a9589e4-78d8-4ce5-a760-883eaa017604,A19C442F5A36D79893466B97850BD964E95F9B50)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
 <CAOSf1CHZ4+vEHotKzPDu2czVDBBM_oerxcCRS5QOFxsMbSknKQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <afa1d2e8-d85a-0ff9-bd38-8289cfe39142@kaod.org>
Date: Wed, 27 May 2020 09:31:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHZ4+vEHotKzPDu2czVDBBM_oerxcCRS5QOFxsMbSknKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1689412813270584253
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvfedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/20 2:57 AM, Oliver O'Halloran wrote:
> On Wed, Apr 29, 2020 at 5:51 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> When a passthrough IO adapter is removed from a pseries machine using
>> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
>> expects the guest OS to have cleared all page table entries related to
>> the adapter. If some are still present, the RTAS call which isolates
>> the PCI slot returns error 9001 "valid outstanding translations" and
>> the removal of the IO adapter fails.
>>
>> INTx interrupt numbers need special care because Linux maps the
>> interrupts automatically in the Linux interrupt number space if they
>> are presented in the device tree node describing the IO adapter. These
>> interrupts are not un-mapped automatically and in case of an hot-plug
>> adapter, the PCI hot-plug layer needs to handle the cleanup to make
>> sure that all the page table entries of the XIVE ESB pages are
>> cleared.
>>
>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/kernel/pci-hotplug.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
>> index bf83f76563a3..9e9c6befd7ea 100644
>> --- a/arch/powerpc/kernel/pci-hotplug.c
>> +++ b/arch/powerpc/kernel/pci-hotplug.c
>> @@ -57,6 +57,8 @@ void pcibios_release_device(struct pci_dev *dev)
>>         struct pci_controller *phb = pci_bus_to_host(dev->bus);
>>         struct pci_dn *pdn = pci_get_pdn(dev);
>>
>> +       irq_dispose_mapping(dev->irq);
> 
> What does the original mapping? Powerpc arch code or the PCI core?

Powerpc. In pci_read_irq_line() when a device is added.

> Tearing down the mapping in pcibios_release_device() seems a bit fishy
> to me since the PCI core has already torn down the device state at
> that point. If the release is delayed it's possible that another
> pci_dev has mapped the IRQ before we get here, but maybe that's ok.

Which scenario would that be ? multiple devices mapping the same INTx
interrupt because all are used already ? 

Where should we drop the mapping ?

Thanks,

C.

>> +
>>         eeh_remove_device(dev);
>>
>>         if (phb->controller_ops.release_device)
>> --
>> 2.25.4
>>

