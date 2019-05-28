Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 680762C07A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 09:41:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cm4g52mJzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 17:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="CtfTaOVZ"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cm2n4dvWzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 17:40:00 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id A8ABB7F8B3;
 Tue, 28 May 2019 02:39:27 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559029168; bh=Fm8E27RwCKRyHB6GdS6/KE0o9MjZxtwM69TG8X6NpW4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CtfTaOVZZ02Qzyf/bWNa7yYkn4XyPb4Qjiv1+rmJTRtEEq4lJ+BJ5pm+LhMAaEaC7
 z4DSLgmo/U7gnoLbd/+3N9co1N6Li32npAS4gO35czQv0SNHgVel7BL+0LhxXVWz+r
 VvcELTVjAfGP0d4GrqTcxvf7mNrQfQ36xMiqucHjdqGDyE5jPBNpk98PS917753lMC
 B9gEvfZwFQZCyM6GDk40UEPmd0SXkdJqulNlzXWIUHaPb0/btm0QJkYct9Sz5xDOwc
 bL0LS1g1ySXSkFwv5mJXMcjay6gJUg+iD+2ITnQHdSL5VO+yTWorVcaMAV1mRs644a
 pyyYznCb+O8yw==
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver <oohall@gmail.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
 <b0a38504-24c3-77bc-b308-7b498f07760a@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <bccfec8f-c8a4-fac1-7e96-be84113b9a73@anastas.io>
Date: Tue, 28 May 2019 02:39:24 -0500
MIME-Version: 1.0
In-Reply-To: <b0a38504-24c3-77bc-b308-7b498f07760a@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/28/19 1:27 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 28/05/2019 15:36, Oliver wrote:
>> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io> wrote:
>>>
>>> Introduce a new pcibios function pcibios_ignore_alignment_request
>>> which allows the PCI core to defer to platform-specific code to
>>> determine whether or not to ignore alignment requests for PCI resources.
>>>
>>> The existing behavior is to simply ignore alignment requests when
>>> PCI_PROBE_ONLY is set. This is behavior is maintained by the
>>> default implementation of pcibios_ignore_alignment_request.
>>>
>>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
>>> ---
>>>   drivers/pci/pci.c   | 9 +++++++--
>>>   include/linux/pci.h | 1 +
>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>> index 8abc843b1615..8207a09085d1 100644
>>> --- a/drivers/pci/pci.c
>>> +++ b/drivers/pci/pci.c
>>> @@ -5882,6 +5882,11 @@ resource_size_t __weak pcibios_default_alignment(void)
>>>          return 0;
>>>   }
>>>
>>> +int __weak pcibios_ignore_alignment_request(void)
>>> +{
>>> +       return pci_has_flag(PCI_PROBE_ONLY);
>>> +}
>>> +
>>>   #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>>>   static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>>>   static DEFINE_SPINLOCK(resource_alignment_lock);
>>> @@ -5906,9 +5911,9 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>>>          p = resource_alignment_param;
>>>          if (!*p && !align)
>>>                  goto out;
>>> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
>>> +       if (pcibios_ignore_alignment_request()) {
>>>                  align = 0;
>>> -               pr_info_once("PCI: Ignoring requested alignments (PCI_PROBE_ONLY)\n");
>>> +               pr_info_once("PCI: Ignoring requested alignments\n");
>>>                  goto out;
>>>          }
>>
>> I think the logic here is questionable to begin with. If the user has
>> explicitly requested re-aligning a resource via the command line then
>> we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
>> they get to keep the pieces.
>>
>> That said, the real issue here is that PCI_PROBE_ONLY probably
>> shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
>> hotplugged devices are configured by firmware before it's passed to
>> the guest and we need to keep the FW assignments otherwise things
>> break. QEMU however doesn't do any BAR assignments and relies on that
>> being handled by the guest. At boot time this is done by SLOF, but
>> Linux only keeps SLOF around until it's extracted the device-tree.
>> Once that's done SLOF gets blown away and the kernel needs to do it's
>> own BAR assignments. I'm guessing there's a hack in there to make it
>> work today, but it's a little surprising that it works at all...
> 
> 
> The hack is to run a modified qemu-aware "/usr/sbin/rtas_errd" in the
> guest which receives an event from qemu (RAS_EPOW from
> /proc/interrupts), fetches device tree chunks (and as I understand it -
> they come with BARs from phyp but without from qemu) and writes "1" to
> "/sys/bus/pci/rescan" which calls pci_assign_resource() eventually:

Interesting. Does this mean that the PHYP hotplug path doesn't
call pci_assign_resource? If so it means the patch may not
break that platform after all, though it still may not be
the correct way of doing things.

> 
> [c000000006e6f960] [c0000000005f62d4] pci_assign_resource+0x44/0x360
> 
> [c000000006e6fa10] [c0000000005f8b54]
> assign_requested_resources_sorted+0x84/0x110
> [c000000006e6fa60] [c0000000005f9540] __assign_resources_sorted+0xd0/0x750
> [c000000006e6fb40] [c0000000005fb2e0]
> __pci_bus_assign_resources+0x80/0x280
> [c000000006e6fc00] [c0000000005fb95c]
> pci_assign_unassigned_bus_resources+0xbc/0x100
> [c000000006e6fc60] [c0000000005e3d74] pci_rescan_bus+0x34/0x60
> 
> [c000000006e6fc90] [c0000000005f1ef4] rescan_store+0x84/0xc0
> 
> [c000000006e6fcd0] [c00000000068060c] bus_attr_store+0x3c/0x60
> 
> [c000000006e6fcf0] [c00000000037853c] sysfs_kf_write+0x5c/0x80
> 
> 
> 
> 
> 
>>
>> IIRC Sam Bobroff was looking at hotplug under pseries recently so he
>> might have something to add. He's sick at the moment, but I'll ask him
>> to take a look at this once he's back among the living
>>
>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>> index 4a5a84d7bdd4..47471dcdbaf9 100644
>>> --- a/include/linux/pci.h
>>> +++ b/include/linux/pci.h
>>> @@ -1990,6 +1990,7 @@ static inline void pcibios_penalize_isa_irq(int irq, int active) {}
>>>   int pcibios_alloc_irq(struct pci_dev *dev);
>>>   void pcibios_free_irq(struct pci_dev *dev);
>>>   resource_size_t pcibios_default_alignment(void);
>>> +int pcibios_ignore_alignment_request(void);
>>>
>>>   #ifdef CONFIG_HIBERNATE_CALLBACKS
>>>   extern struct dev_pm_ops pcibios_pm_ops;
>>> --
>>> 2.20.1
>>>
> 
