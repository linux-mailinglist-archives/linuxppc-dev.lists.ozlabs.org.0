Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6432AF0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 10:36:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HT182r44zDqSg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 18:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="ZDk7+gmJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HSzh4ttmzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 18:35:10 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v11so7863999pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=okS24NKM4SOwDBsijVZE5KrPp3D2gi1EWBeK0BWEwYs=;
 b=ZDk7+gmJO4fl3En/WOBcoBATfP041az6V8CZ9QycqiGhl4x7GrZNkTbsvGAAWIoEJp
 AO401P5UHPir1D6pv3w/lR3M+Lepx81g55lDZjDYkLIdJ0rkUO5ePC1AgitpUurAySxx
 eYkspvFI7jgW6GSRBGw3mmB96LeIIqltoD8TO9JZm8MGQmr4bYMkD1q3S6fqfraUuGNq
 XRGZfNyPUyX4C1uxiJGZDMUPS7jQcLQ/dF5xIf6+EIJq5T4tNWm6ybWNIeu/rdzigOnT
 7c4j17dxwndn5o+MzODtf4e9X77LqL4K6yJ22pX8JZcFTWHATjXKu4BThL2IDAGEug0t
 DKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=okS24NKM4SOwDBsijVZE5KrPp3D2gi1EWBeK0BWEwYs=;
 b=B9CyJZa3FKLvXGYmlfvUutTmwFWkqQg2FFJPatjFuiiiqYqZyzwTCwxO8c5GQnONBt
 M6LMJ57vCOTo1ljAz6SKUg46AnBhcXURsJjSQPkhBQLKaheeTQ28IwWwbVEut3zIZQvD
 fpq0RDH9yZWVNAVrtvnK/Skh7koKf5MfJxsOryRvJ7ijrNFW9oGzDl0l/xsBS++Jw2tB
 C3PpfjKS0PBqdYE5H8UQAAaQxJQwqOYo+NoDjcJUguDVeHvD/LA+E0gzF64w4YD7mtqQ
 +O0isORMZqrmIJsw0D42rx4eQRzQx9KcO9yh5zjk1id0XGAZhzmtnjFVK6zrADVbf06x
 tI2w==
X-Gm-Message-State: APjAAAXdg7TjcwTZOlj4bTaQVmK6T4xVoF7uVQWU/zC5GfrDSu1OWyV/
 BPTuLTfkpiNmXmYgDwu+/yVd9D7cUaM=
X-Google-Smtp-Source: APXvYqzUroJQF7BCHc4KdHmZpV1wf8b66q5uktEkDXZgzQmU+Na8WqYrdwoyCHMY/KLkA2MZ833Mpw==
X-Received: by 2002:a62:1a0f:: with SMTP id a15mr30421281pfa.111.1559550907472; 
 Mon, 03 Jun 2019 01:35:07 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c129sm9920518pfa.106.2019.06.03.01.35.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 01:35:06 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Shawn Anastasio <shawn@anastas.io>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
 <b0a38504-24c3-77bc-b308-7b498f07760a@ozlabs.ru>
 <bccfec8f-c8a4-fac1-7e96-be84113b9a73@anastas.io>
 <3e6b9d7d-5d18-645e-5ef9-6b8a77fa62e9@ozlabs.ru>
 <985681e4-1236-fff7-e9e7-189a340487dd@anastas.io>
 <81a015ed-2c99-7ca8-c5ad-cede93aeba97@ozlabs.ru>
 <bdc914aa-9aab-1377-c036-cca4710ef233@anastas.io>
 <2f4185ac-d19f-6668-7b3e-a300ce3b9e00@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <bab59b8e-f1fc-f92a-36bb-4ff471e6da24@ozlabs.ru>
Date: Mon, 3 Jun 2019 18:35:01 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2f4185ac-d19f-6668-7b3e-a300ce3b9e00@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Oliver <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>, xyjxie@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/06/2019 15:02, Alexey Kardashevskiy wrote:
> 
> 
> On 03/06/2019 12:23, Shawn Anastasio wrote:
>>
>>
>> On 5/30/19 10:56 PM, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 31/05/2019 08:49, Shawn Anastasio wrote:
>>>> On 5/29/19 10:39 PM, Alexey Kardashevskiy wrote:
>>>>>
>>>>>
>>>>> On 28/05/2019 17:39, Shawn Anastasio wrote:
>>>>>>
>>>>>>
>>>>>> On 5/28/19 1:27 AM, Alexey Kardashevskiy wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 28/05/2019 15:36, Oliver wrote:
>>>>>>>> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> Introduce a new pcibios function pcibios_ignore_alignment_request
>>>>>>>>> which allows the PCI core to defer to platform-specific code to
>>>>>>>>> determine whether or not to ignore alignment requests for PCI
>>>>>>>>> resources.
>>>>>>>>>
>>>>>>>>> The existing behavior is to simply ignore alignment requests when
>>>>>>>>> PCI_PROBE_ONLY is set. This is behavior is maintained by the
>>>>>>>>> default implementation of pcibios_ignore_alignment_request.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
>>>>>>>>> ---
>>>>>>>>>     drivers/pci/pci.c   | 9 +++++++--
>>>>>>>>>     include/linux/pci.h | 1 +
>>>>>>>>>     2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>>>>>>> index 8abc843b1615..8207a09085d1 100644
>>>>>>>>> --- a/drivers/pci/pci.c
>>>>>>>>> +++ b/drivers/pci/pci.c
>>>>>>>>> @@ -5882,6 +5882,11 @@ resource_size_t __weak
>>>>>>>>> pcibios_default_alignment(void)
>>>>>>>>>            return 0;
>>>>>>>>>     }
>>>>>>>>>
>>>>>>>>> +int __weak pcibios_ignore_alignment_request(void)
>>>>>>>>> +{
>>>>>>>>> +       return pci_has_flag(PCI_PROBE_ONLY);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>     #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>>>>>>>>>     static char
>>>>>>>>> resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>>>>>>>>>     static DEFINE_SPINLOCK(resource_alignment_lock);
>>>>>>>>> @@ -5906,9 +5911,9 @@ static resource_size_t
>>>>>>>>> pci_specified_resource_alignment(struct pci_dev *dev,
>>>>>>>>>            p = resource_alignment_param;
>>>>>>>>>            if (!*p && !align)
>>>>>>>>>                    goto out;
>>>>>>>>> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
>>>>>>>>> +       if (pcibios_ignore_alignment_request()) {
>>>>>>>>>                    align = 0;
>>>>>>>>> -               pr_info_once("PCI: Ignoring requested alignments
>>>>>>>>> (PCI_PROBE_ONLY)\n");
>>>>>>>>> +               pr_info_once("PCI: Ignoring requested
>>>>>>>>> alignments\n");
>>>>>>>>>                    goto out;
>>>>>>>>>            }
>>>>>>>>
>>>>>>>> I think the logic here is questionable to begin with. If the user
>>>>>>>> has
>>>>>>>> explicitly requested re-aligning a resource via the command line
>>>>>>>> then
>>>>>>>> we should probably do it even if PCI_PROBE_ONLY is set. When it
>>>>>>>> breaks
>>>>>>>> they get to keep the pieces.
>>>>>>>>
>>>>>>>> That said, the real issue here is that PCI_PROBE_ONLY probably
>>>>>>>> shouldn't be set under qemu/kvm. Under the other hypervisor
>>>>>>>> (PowerVM)
>>>>>>>> hotplugged devices are configured by firmware before it's passed to
>>>>>>>> the guest and we need to keep the FW assignments otherwise things
>>>>>>>> break. QEMU however doesn't do any BAR assignments and relies on
>>>>>>>> that
>>>>>>>> being handled by the guest. At boot time this is done by SLOF, but
>>>>>>>> Linux only keeps SLOF around until it's extracted the device-tree.
>>>>>>>> Once that's done SLOF gets blown away and the kernel needs to do
>>>>>>>> it's
>>>>>>>> own BAR assignments. I'm guessing there's a hack in there to make it
>>>>>>>> work today, but it's a little surprising that it works at all...
>>>>>>>
>>>>>>>
>>>>>>> The hack is to run a modified qemu-aware "/usr/sbin/rtas_errd" in the
>>>>>>> guest which receives an event from qemu (RAS_EPOW from
>>>>>>> /proc/interrupts), fetches device tree chunks (and as I understand
>>>>>>> it -
>>>>>>> they come with BARs from phyp but without from qemu) and writes
>>>>>>> "1" to
>>>>>>> "/sys/bus/pci/rescan" which calls pci_assign_resource() eventually:
>>>>>>
>>>>>> Interesting. Does this mean that the PHYP hotplug path doesn't
>>>>>> call pci_assign_resource?
>>>>>
>>>>>
>>>>> I'd expect dlpar_add_slot() to be called under phyp and eventually
>>>>> pci_device_add() which (I think) may or may not trigger later
>>>>> reassignment.
>>>>>
>>>>>
>>>>>> If so it means the patch may not
>>>>>> break that platform after all, though it still may not be
>>>>>> the correct way of doing things.
>>>>>
>>>>>
>>>>> We should probably stop enforcing the PCI_PROBE_ONLY flag - it seems
>>>>> that (unless resource_alignment= is used) the pseries guest should just
>>>>> walk through all allocated resources and leave them unchanged.
>>>>
>>>> If we add a pcibios_default_alignment() implementation like was
>>>> suggested earlier, then it will behave as if the user has
>>>> specified resource_alignment= by default and SLOF's assignments
>>>> won't be honored (I think).
>>>
>>>
>>> I removed pci_add_flags(PCI_PROBE_ONLY) from pSeries_setup_arch and
>>> tried booting with and without pci=resource_alignment= and I can see no
>>> difference - BARs are still aligned to 64K as programmed in SLOF; if I
>>> hack SLOF to align to 4K or 32K - BARs get packed and the guest leaves
>>> them unchanged.
>>>
>>>
>>>> I guess it boils down to one question - is it important that we
>>>> observe SLOF's initial BAR assignments?
>>>
>>> It isn't if it's SLOF but it is if it's phyp. It used to not
>>> allow/support BAR reassignment and even if it does not, I'd rather avoid
>>> touching them.
>>
>> A quick update. I tried removing pci_add_flags(PCI_PROBE_ONLY) which
>> worked, but if I add an implementation of pcibios_default_alignment
>> which simply returns PAGE_SIZE, my VM fails to boot and many errors
>> from the virtio disk driver are printed to the console.
>>
>> After some investigation, it seems that with pcibios_default_alignment
>> present, Linux will reallocate all resources provided by SLOF on
>> boot. I'm still not sure why exactly this causes the virtio driver
>> to fail, but it does indicate that there is a reason to keep
>> SLOF's initial assignments.
>>
>> Anybody have an idea what's causing this?
> 
> With your changes the guest feels the urge to reassign bars (no idea why
> but ok), when it does so, it puts both BARs (one is prefetchable) into
> the 32bit non-prefetchable window of the PHB (SLOF puts the prefetchable
> bar to a 64bit prefetchable window, I have no idea why the guest does it
> different either but this must still work) and then qemu does not
> emulate something properly - unassigned_mem_accepts() is triggered on
> the bar access - no idea why - I am debugging it right now.


Sooo the problem is that resouce::flags has 2 bits to describe 64bit
BARs - PCI_BASE_ADDRESS_MEM_TYPE_64 and IORESOURCE_MEM_64 - and we don't
set IORESOURCE_MEM_64 for 64bit BARs when parsing the fdt.

So the BAR reallocator moves the BAR to 32bit window (which is not
desirable but permitted, I still have to chase it) and then
pci_std_update_resource() writes BAR back but since now it is 32bit BAR,
it does not write to the upper 32bits so that half remains 0x2100, QEMU
does not move BAR to the right window and the MMIO stops working.

Try this in the guest kernel, it seems to keep bars where they were
after slof.


diff --git a/arch/powerpc/kernel/pci_of_scan.c
b/arch/powerpc/kernel/pci_of_scan.c
index 24191ea2d9a7..64ad92016b63 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -45,6 +45,8 @@ unsigned int pci_parse_of_flags(u32 addr0, int bridge)
        if (addr0 & 0x02000000) {
                flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
                flags |= (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
+               if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
+                       flags |= IORESOURCE_MEM_64;
                flags |= (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
                if (addr0 & 0x40000000)





-- 
Alexey
