Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C262832696
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 04:25:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HJmd6RyGzDqM0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 12:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="gqRwvu8i"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HJlM4BQ6zDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 12:23:59 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 015087F6B4;
 Sun,  2 Jun 2019 21:23:55 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559528636; bh=+/duAU9XL92ctEZ3sNHy++gGMbn1xWFWJV4PdCXDBhA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gqRwvu8il7GnTct/LxLSowY39wiUUMkDD7jPiEpdnuJwmcOR66zYMIiwszSDxsXIV
 MFCh1p95YTFv4nHSS1gSCkxlceCkz8y8YK084uiCVd/HT8cXmYaayjnlWee4aPGN/Y
 l33Pfb/3cuH4XSwszOcs06ShaHi7AOHnHGUy0AS6o3Kbz7CJ1hpNUWS+cHf0Oa07jL
 Kj5Iuy57TBqGzsKK+ZoQX6RqnVRvxJkC+XguKZyjemh+3lcKI/k92MvnQDEqSbU1k5
 PKGzt2goLxkMzBT0RDVWXWE39WJnwhjHbOLnnvDTzPkCS5rUcxnVi/xg1lSq8e3hcp
 N7bn9y2/NOu4g==
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver <oohall@gmail.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
 <b0a38504-24c3-77bc-b308-7b498f07760a@ozlabs.ru>
 <bccfec8f-c8a4-fac1-7e96-be84113b9a73@anastas.io>
 <3e6b9d7d-5d18-645e-5ef9-6b8a77fa62e9@ozlabs.ru>
 <985681e4-1236-fff7-e9e7-189a340487dd@anastas.io>
 <81a015ed-2c99-7ca8-c5ad-cede93aeba97@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <bdc914aa-9aab-1377-c036-cca4710ef233@anastas.io>
Date: Sun, 2 Jun 2019 21:23:54 -0500
MIME-Version: 1.0
In-Reply-To: <81a015ed-2c99-7ca8-c5ad-cede93aeba97@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/30/19 10:56 PM, Alexey Kardashevskiy wrote:
> 
> 
> On 31/05/2019 08:49, Shawn Anastasio wrote:
>> On 5/29/19 10:39 PM, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 28/05/2019 17:39, Shawn Anastasio wrote:
>>>>
>>>>
>>>> On 5/28/19 1:27 AM, Alexey Kardashevskiy wrote:
>>>>>
>>>>>
>>>>> On 28/05/2019 15:36, Oliver wrote:
>>>>>> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io>
>>>>>> wrote:
>>>>>>>
>>>>>>> Introduce a new pcibios function pcibios_ignore_alignment_request
>>>>>>> which allows the PCI core to defer to platform-specific code to
>>>>>>> determine whether or not to ignore alignment requests for PCI
>>>>>>> resources.
>>>>>>>
>>>>>>> The existing behavior is to simply ignore alignment requests when
>>>>>>> PCI_PROBE_ONLY is set. This is behavior is maintained by the
>>>>>>> default implementation of pcibios_ignore_alignment_request.
>>>>>>>
>>>>>>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
>>>>>>> ---
>>>>>>>     drivers/pci/pci.c   | 9 +++++++--
>>>>>>>     include/linux/pci.h | 1 +
>>>>>>>     2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>>>>> index 8abc843b1615..8207a09085d1 100644
>>>>>>> --- a/drivers/pci/pci.c
>>>>>>> +++ b/drivers/pci/pci.c
>>>>>>> @@ -5882,6 +5882,11 @@ resource_size_t __weak
>>>>>>> pcibios_default_alignment(void)
>>>>>>>            return 0;
>>>>>>>     }
>>>>>>>
>>>>>>> +int __weak pcibios_ignore_alignment_request(void)
>>>>>>> +{
>>>>>>> +       return pci_has_flag(PCI_PROBE_ONLY);
>>>>>>> +}
>>>>>>> +
>>>>>>>     #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>>>>>>>     static char
>>>>>>> resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>>>>>>>     static DEFINE_SPINLOCK(resource_alignment_lock);
>>>>>>> @@ -5906,9 +5911,9 @@ static resource_size_t
>>>>>>> pci_specified_resource_alignment(struct pci_dev *dev,
>>>>>>>            p = resource_alignment_param;
>>>>>>>            if (!*p && !align)
>>>>>>>                    goto out;
>>>>>>> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
>>>>>>> +       if (pcibios_ignore_alignment_request()) {
>>>>>>>                    align = 0;
>>>>>>> -               pr_info_once("PCI: Ignoring requested alignments
>>>>>>> (PCI_PROBE_ONLY)\n");
>>>>>>> +               pr_info_once("PCI: Ignoring requested alignments\n");
>>>>>>>                    goto out;
>>>>>>>            }
>>>>>>
>>>>>> I think the logic here is questionable to begin with. If the user has
>>>>>> explicitly requested re-aligning a resource via the command line then
>>>>>> we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
>>>>>> they get to keep the pieces.
>>>>>>
>>>>>> That said, the real issue here is that PCI_PROBE_ONLY probably
>>>>>> shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
>>>>>> hotplugged devices are configured by firmware before it's passed to
>>>>>> the guest and we need to keep the FW assignments otherwise things
>>>>>> break. QEMU however doesn't do any BAR assignments and relies on that
>>>>>> being handled by the guest. At boot time this is done by SLOF, but
>>>>>> Linux only keeps SLOF around until it's extracted the device-tree.
>>>>>> Once that's done SLOF gets blown away and the kernel needs to do it's
>>>>>> own BAR assignments. I'm guessing there's a hack in there to make it
>>>>>> work today, but it's a little surprising that it works at all...
>>>>>
>>>>>
>>>>> The hack is to run a modified qemu-aware "/usr/sbin/rtas_errd" in the
>>>>> guest which receives an event from qemu (RAS_EPOW from
>>>>> /proc/interrupts), fetches device tree chunks (and as I understand it -
>>>>> they come with BARs from phyp but without from qemu) and writes "1" to
>>>>> "/sys/bus/pci/rescan" which calls pci_assign_resource() eventually:
>>>>
>>>> Interesting. Does this mean that the PHYP hotplug path doesn't
>>>> call pci_assign_resource?
>>>
>>>
>>> I'd expect dlpar_add_slot() to be called under phyp and eventually
>>> pci_device_add() which (I think) may or may not trigger later
>>> reassignment.
>>>
>>>
>>>> If so it means the patch may not
>>>> break that platform after all, though it still may not be
>>>> the correct way of doing things.
>>>
>>>
>>> We should probably stop enforcing the PCI_PROBE_ONLY flag - it seems
>>> that (unless resource_alignment= is used) the pseries guest should just
>>> walk through all allocated resources and leave them unchanged.
>>
>> If we add a pcibios_default_alignment() implementation like was
>> suggested earlier, then it will behave as if the user has
>> specified resource_alignment= by default and SLOF's assignments
>> won't be honored (I think).
> 
> 
> I removed pci_add_flags(PCI_PROBE_ONLY) from pSeries_setup_arch and
> tried booting with and without pci=resource_alignment= and I can see no
> difference - BARs are still aligned to 64K as programmed in SLOF; if I
> hack SLOF to align to 4K or 32K - BARs get packed and the guest leaves
> them unchanged.
> 
> 
>> I guess it boils down to one question - is it important that we
>> observe SLOF's initial BAR assignments?
> 
> It isn't if it's SLOF but it is if it's phyp. It used to not
> allow/support BAR reassignment and even if it does not, I'd rather avoid
> touching them.

A quick update. I tried removing pci_add_flags(PCI_PROBE_ONLY) which
worked, but if I add an implementation of pcibios_default_alignment
which simply returns PAGE_SIZE, my VM fails to boot and many errors
from the virtio disk driver are printed to the console.

After some investigation, it seems that with pcibios_default_alignment
present, Linux will reallocate all resources provided by SLOF on
boot. I'm still not sure why exactly this causes the virtio driver
to fail, but it does indicate that there is a reason to keep
SLOF's initial assignments.

Anybody have an idea what's causing this?
