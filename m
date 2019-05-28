Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D342BEBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 07:52:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cjf82Ny0zDqJC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 15:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="W23Eone+"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cjcr3SZfzDq9F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:50:52 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 808087F8B3;
 Tue, 28 May 2019 00:50:48 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559022649; bh=kL/TTp+wvSTQYMc5ilHPVhU/bVIfUaWs3a6MCYZSbRo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W23Eone+2RbqJg5PzjzRs7f8909yGP0PPC4J8zD3CgSL0msBAKnhk0Nc2t82L+8x2
 h1EZRXe9kyc7EoJCKzA14vlmKmZTkx7GiTxuvgFIugSVZnAPQhlLIzbJ9rQi11ComQ
 /+BTqZfgmu1ggfahSu8m7GA/Or4iWDsmPS686ntaVKFIDTRIRGfCTb4CNnc1FawQ8V
 cHZtgqOlApaxZOtelXn7HP+FUfrbbp8ZIcXWhjz1RMiab/4foFnfgcnNFVBfHFayzA
 EikqnQi5NAORVgU+1WviZdI8FcQyfg93C9fP0V6ICedaiRr4ejQhtbpK7mCDVRx2Cy
 GMjKjzMmAYp3Q==
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
To: Oliver <oohall@gmail.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <a5966412-e853-3f74-2459-d68597629fc1@anastas.io>
Date: Tue, 28 May 2019 00:50:47 -0500
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
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



On 5/28/19 12:36 AM, Oliver wrote:
> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io> wrote:
>>
>> Introduce a new pcibios function pcibios_ignore_alignment_request
>> which allows the PCI core to defer to platform-specific code to
>> determine whether or not to ignore alignment requests for PCI resources.
>>
>> The existing behavior is to simply ignore alignment requests when
>> PCI_PROBE_ONLY is set. This is behavior is maintained by the
>> default implementation of pcibios_ignore_alignment_request.
>>
>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
>> ---
>>   drivers/pci/pci.c   | 9 +++++++--
>>   include/linux/pci.h | 1 +
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 8abc843b1615..8207a09085d1 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -5882,6 +5882,11 @@ resource_size_t __weak pcibios_default_alignment(void)
>>          return 0;
>>   }
>>
>> +int __weak pcibios_ignore_alignment_request(void)
>> +{
>> +       return pci_has_flag(PCI_PROBE_ONLY);
>> +}
>> +
>>   #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>>   static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>>   static DEFINE_SPINLOCK(resource_alignment_lock);
>> @@ -5906,9 +5911,9 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>>          p = resource_alignment_param;
>>          if (!*p && !align)
>>                  goto out;
>> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
>> +       if (pcibios_ignore_alignment_request()) {
>>                  align = 0;
>> -               pr_info_once("PCI: Ignoring requested alignments (PCI_PROBE_ONLY)\n");
>> +               pr_info_once("PCI: Ignoring requested alignments\n");
>>                  goto out;
>>          }
> 
> I think the logic here is questionable to begin with. If the user has
> explicitly requested re-aligning a resource via the command line then
> we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
> they get to keep the pieces.
> 
> That said, the real issue here is that PCI_PROBE_ONLY probably
> shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
> hotplugged devices are configured by firmware before it's passed to
> the guest and we need to keep the FW assignments otherwise things
> break. QEMU however doesn't do any BAR assignments and relies on that
> being handled by the guest. At boot time this is done by SLOF, but
> Linux only keeps SLOF around until it's extracted the device-tree.
> Once that's done SLOF gets blown away and the kernel needs to do it's
> own BAR assignments. I'm guessing there's a hack in there to make it
> work today, but it's a little surprising that it works at all...
Interesting, I wasn't aware that hotplugged devices are configured
by the hypervisor on PowerVM. That at least means that this patch is
wrong as-is since it won't handle that properly. Definitely seems like
there will need to be different behavior here depending on the hypervisor.

That being said, wouldn't PCI_PROBE_ONLY still be set on pseries/kvm
(at least for initial boot) to observe SLOF's original BAR assignments?
Perhaps it should be un-set after initial PCI init?

> 
> IIRC Sam Bobroff was looking at hotplug under pseries recently so he
> might have something to add. He's sick at the moment, but I'll ask him
> to take a look at this once he's back among the living

Good to know. I'll await his comments before continuing here.

>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 4a5a84d7bdd4..47471dcdbaf9 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -1990,6 +1990,7 @@ static inline void pcibios_penalize_isa_irq(int irq, int active) {}
>>   int pcibios_alloc_irq(struct pci_dev *dev);
>>   void pcibios_free_irq(struct pci_dev *dev);
>>   resource_size_t pcibios_default_alignment(void);
>> +int pcibios_ignore_alignment_request(void);
>>
>>   #ifdef CONFIG_HIBERNATE_CALLBACKS
>>   extern struct dev_pm_ops pcibios_pm_ops;
>> --
>> 2.20.1
>>
