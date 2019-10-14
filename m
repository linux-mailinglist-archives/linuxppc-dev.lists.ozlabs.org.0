Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77AD5D09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 10:03:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s9zF5P4pzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 19:03:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s9wp2gd6zDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 19:00:56 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 043818491006F9A592D1;
 Mon, 14 Oct 2019 16:00:49 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 14 Oct 2019
 16:00:46 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Greg KH <gregkh@linuxfoundation.org>
References: <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
 <1e1ec851-b5e7-8f35-a627-4c12ca9c2d3c@huawei.com>
 <20191012104001.GA2052933@kroah.com> <20191012104742.GA2053473@kroah.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <82000bc8-6912-205b-0251-25b9cc430973@huawei.com>
Date: Mon, 14 Oct 2019 16:00:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20191012104742.GA2053473@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 linux-acpi@vger.kernel.org, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 linux-mips@vger.kernel.org, lenb@kernel.org, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, luto@kernel.org,
 bhelgaas@google.com, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, rafael@kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/10/12 18:47, Greg KH wrote:
> On Sat, Oct 12, 2019 at 12:40:01PM +0200, Greg KH wrote:
>> On Sat, Oct 12, 2019 at 05:47:56PM +0800, Yunsheng Lin wrote:
>>> On 2019/10/12 15:40, Greg KH wrote:
>>>> On Sat, Oct 12, 2019 at 02:17:26PM +0800, Yunsheng Lin wrote:
>>>>> add pci and acpi maintainer
>>>>> cc linux-pci@vger.kernel.org and linux-acpi@vger.kernel.org
>>>>>
>>>>> On 2019/10/11 19:15, Peter Zijlstra wrote:
>>>>>> On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
>>>>>>> But I failed to see why the above is related to making node_to_cpumask_map()
>>>>>>> NUMA_NO_NODE aware?
>>>>>>
>>>>>> Your initial bug is for hns3, which is a PCI device, which really _MUST_
>>>>>> have a node assigned.
>>>>>>
>>>>>> It not having one, is a straight up bug. We must not silently accept
>>>>>> NO_NODE there, ever.
>>>>>>
>>>>>
>>>>> I suppose you mean reporting a lack of affinity when the node of a pcie
>>>>> device is not set by "not silently accept NO_NODE".
>>>>
>>>> If the firmware of a pci device does not provide the node information,
>>>> then yes, warn about that.
>>>>
>>>>> As Greg has asked about in [1]:
>>>>> what is a user to do when the user sees the kernel reporting that?
>>>>>
>>>>> We may tell user to contact their vendor for info or updates about
>>>>> that when they do not know about their system well enough, but their
>>>>> vendor may get away with this by quoting ACPI spec as the spec
>>>>> considering this optional. Should the user believe this is indeed a
>>>>> fw bug or a misreport from the kernel?
>>>>
>>>> Say it is a firmware bug, if it is a firmware bug, that's simple.
>>>>
>>>>> If this kind of reporting is common pratice and will not cause any
>>>>> misunderstanding, then maybe we can report that.
>>>>
>>>> Yes, please do so, that's the only way those boxes are ever going to get
>>>> fixed.  And go add the test to the "firmware testing" tool that is based
>>>> on Linux that Intel has somewhere, to give vendors a chance to fix this
>>>> before they ship hardware.
>>>>
>>>> This shouldn't be a big deal, we warn of other hardware bugs all the
>>>> time.
>>>
>>> Ok, thanks for clarifying.
>>>
>>> Will send a patch to catch the case when a pcie device without numa node
>>> being set and warn about it.
>>>
>>> Maybe use dev->bus to verify if it is a pci device?
>>
>> No, do that in the pci bus core code itself, when creating the devices
>> as that is when you know, or do not know, the numa node, right?
>>
>> This can't be in the driver core only, as each bus type will have a
>> different way of determining what the node the device is on.  For some
>> reason, I thought the PCI core code already does this, right?
> 
> Yes, pci_irq_get_node(), which NO ONE CALLS!  I should go delete that
> thing...
> 
> Anyway, it looks like the pci core code does call set_dev_node() based
> on the PCI bridge, so if that is set up properly, all should be fine.
> 
> If not, well, you have buggy firmware and you need to warn about that at
> the time you are creating the bridge.  Look at the call to
> pcibus_to_node() in pci_register_host_bridge().

Thanks for pointing out the specific function.
Maybe we do not need to warn about the case when the device has a parent,
because we must have warned about the parent if the device has a parent
and the parent also has a node of NO_NODE, so do not need to warn the child
device anymore? like blew:

@@ -932,6 +932,10 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
        list_add_tail(&bus->node, &pci_root_buses);
        up_write(&pci_bus_sem);

+       if (nr_node_ids > 1 && !parent &&
+           dev_to_node(bus->bridge) == NUMA_NO_NODE)
+               dev_err(bus->bridge, FW_BUG "No node assigned on NUMA capable HW. Please contact your vendor for updates.\n");
+
        return 0;


Also, we do not need to warn about that in pci_device_add(), Right?
Because we must have warned about the pci host bridge of the pci device.

I may be wrong about above because I am not so familiar with the pci.

> 
> And yes, you need to do this all on a per-bus-type basis, as has been
> pointed out.  It's up to the bus to create the device and set this up
> properly.

Thanks.
Will do that on per-bus-type basis.

> 
> thanks,
> 
> greg k-h
> 
> .
> 

