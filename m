Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF241304D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 00:34:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FMpJ0kCjzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 08:34:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="M+lxrRvM"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FMn02w31zDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 08:33:40 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 72F8B7F8BF;
 Thu, 30 May 2019 17:33:07 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559255588; bh=3ZOWYrFYbkF4GORGQ+Tfp7UoyviSixFiW9Lo/7bz6do=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M+lxrRvMT6PV/3q7mqKTyEQq6Y/Bq0qvZpo8+0gEZ8xNqXCwiXB4vzvl6XfoXL0im
 KtCT7SK67s8LIKoPP/0gbjLJE7dIj8tWfyhbVgiCsajhsMNxZtP20aDvHRz3RhTekW
 uIeqYh6LZakkKsWQKGrO4YtmAZcKttqsVfePLHEo5G41dXiaVGkUf0Ng43ltcuY2tU
 jr3JFJWd6xmJCJAyl5WYiPaJhVtnNo0ULrVVUxFxbOUm3u74KpqUrM9LT5bHQXpZAt
 5+EKsu9zGSOViXVcgGKlsdkYpzlGprPWwmKJ2PyhRhtY9XvnI41EVATsr4Fi+N0E8i
 RS29W2UNAkjBg==
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] PCI: Introduce
 pcibios_ignore_alignment_request
To: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver <oohall@gmail.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
 <20190530065556.GA29428@tungsten.ozlabs.ibm.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <8785226a-b2eb-8157-e724-d575c66b7bef@anastas.io>
Date: Thu, 30 May 2019 17:33:05 -0500
MIME-Version: 1.0
In-Reply-To: <20190530065556.GA29428@tungsten.ozlabs.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 xyjxie@linux.vnet.ibm.com, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/30/19 1:55 AM, Sam Bobroff wrote:
> On Tue, May 28, 2019 at 03:36:34PM +1000, Oliver wrote:
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
>>
>> IIRC Sam Bobroff was looking at hotplug under pseries recently so he
>> might have something to add. He's sick at the moment, but I'll ask him
>> to take a look at this once he's back among the living
> 
> There seems to be some code already in the kernel that will disable
> PCI_PROBE_ONLY based on a device tree property, so I did a quick test
> today and it seems to work. Only a trivial tweak is needed in QEMU to
> do it (have spapr_dt_chosen() add a node called "linux,pci-probe-only"
> with a value of 0), and that would allow us to set it only for QEMU (and
> not PowerVM) if that's what we want to do. Is that useful?
> 
> (I haven't done any real testing yet but the guest booted up OK.)

It was my understanding that PCI_PROBE_ONLY should actually be set
initially so that Linux uses SLOF's BAR assignments. The issue here
is that PCI_PROBE_ONLY shouldn't be honored after initial bringup
on KVM so that hotplugged PCI devices can have custom BAR alignments.

Of course, if there's no need to honor SLOF's initial assignments,
I assume disabling PCI_PROBE_ONLY would work fine. In fact, I'm
not entirely sure why it's done in the first place. Does anybody
know?

If there is actually a valid reason for preserving SLOF's initial
assignments, then it seems like the correct solution is to disable
PCI_PROBE_ONLY after initial PCI bringup or ignore it in
pci_specified_resource_alignment() like I do in this patch set.

Bjorn Helgaas also suggested marking individual resources provided
by SLOF/PHYP with IORESOURCE_PCI_FIXED which would remove the need
to use PCI_PROBE_ONLY altogether.

Any thoughts?

- Shawn
