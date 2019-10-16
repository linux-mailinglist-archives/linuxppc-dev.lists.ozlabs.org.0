Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18AD95FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 17:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tcHz2XgzzDr43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 02:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="sBlEc1m1"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tcFq0WqNzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 02:50:38 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3F1D042F15;
 Wed, 16 Oct 2019 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1571241032; x=1573055433; bh=vlw
 ynJutyyWJCfkxMQEapDvJD8fWDPeUDayzqTdFerc=; b=sBlEc1m1L2ugmu8RdJ0
 ST1e+hdikSs56X48a3WhRpFYIUSMvo27X5s6DbkrIw5tLuDvUggx5v+hXkw6Japp
 oR9CKYsWvcsBeVWMsJUIU2OZS2SeG9SyshVMeA77nVvHgKzrMHyZnTV/ERC3fGi+
 R1xWr1gpV+pl4g+MbkMV5j1k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN192pO61-xl; Wed, 16 Oct 2019 18:50:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8386542F12;
 Wed, 16 Oct 2019 18:50:31 +0300 (MSK)
Received: from [172.17.15.136] (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 16
 Oct 2019 18:50:31 +0300
Subject: Re: [PATCH v5 03/23] PCI: hotplug: Add a flag for the movable BARs
 feature
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20191015221449.GA181069@google.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Message-ID: <63c6c630-fbfb-175c-2a1a-c9a1f732498a@yadro.com>
Date: Wed, 16 Oct 2019 18:50:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015221449.GA181069@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.136]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux@yadro.com, Lukas Wunner <lukas@wunner.de>,
 Oliver O'Halloran <oohall@gmail.com>, Rajat Jain <rajatja@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/16/19 1:14 AM, Bjorn Helgaas wrote:
> On Mon, Sep 30, 2019 at 03:59:25PM +0300, Sergey Miroshnichenko wrote:
>> Hello Bjorn,
>>
>> On 9/28/19 1:02 AM, Bjorn Helgaas wrote:
>>> On Fri, Aug 16, 2019 at 07:50:41PM +0300, Sergey Miroshnichenko wrote:
>>>> When hot-adding a device, the bridge may have windows not big enough (or
>>>> fragmented too much) for newly requested BARs to fit in. And expanding
>>>> these bridge windows may be impossible because blocked by "neighboring"
>>>> BARs and bridge windows.
>>>>
>>>> Still, it may be possible to allocate a memory region for new BARs with the
>>>> following procedure:
>>>>
>>>> 1) notify all the drivers which support movable BARs to pause and release
>>>>      the BARs; the rest of the drivers are guaranteed that their devices will
>>>>      not get BARs moved;
>>>>
>>>> 2) release all the bridge windows except of root bridges;
>>>>
>>>> 3) try to recalculate new bridge windows that will fit all the BAR types:
>>>>      - fixed;
>>>>      - immovable;
>>>>      - movable;
>>>>      - newly requested by hot-added devices;
>>>>
>>>> 4) if the previous step fails, disable BARs for one of the hot-added
>>>>      devices and retry from step 3;
>>>>
>>>> 5) notify the drivers, so they remap BARs and resume.
>>>
>>> You don't do the actual recalculation in *this* patch, but since you
>>> mention the procedure here, are we confident that we never make things
>>> worse?
>>>
>>> It's possible that a hot-add will trigger this attempt to move things
>>> around, and it's possible that we won't find space for the new device
>>> even if we move things around.  But are we certain that every device
>>> that worked *before* the hot-add will still work *afterwards*?
>>>
>>> Much of the assignment was probably done by the BIOS using different
>>> algorithms than Linux has, so I think there's some chance that the
>>> BIOS did a better job and if we lose that BIOS assignment, we might
>>> not be able to recreate it.
>>
>> If a hardware has some special constraints on BAR assignment that the
>> kernel is not aware of yet, the movable BARs may break things after a
>> hotplug event. So the feature must be disabled there (manually) until
>> the kernel get support for that special needs.
> 
> I'm not talking about special constraints on BAR assignment.  (I'm not
> sure what those constraints would be -- AFAIK the constraints for a
> spec-compliant device are all discoverable via the BAR size and type
> (or the Enhanced Allocation capability)).
> 
> What I'm concerned about is the case where we boot with a working
> assignment, we hot-add a device, we move things around to try to
> accommodate the new device, and not only do we fail to find resources
> for the new device, we also fail to find a working assignment for the
> devices that were present at boot.  We've moved things around from
> what BIOS did, and since we use a different algorithm than the BIOS,
> there's no guarantee that we'll be able to find the assignment BIOS
> did.
> 

If BAR assignment fails with a hot-added device, these patches will
disable BARs for this device and retry, falling back to the situation
where number of BARs and their size are the same as they were before
the hotplug event.

If all the BARs are immovable - they will just remain on their
positions. Nothing to break here I guess.

If almost all the BARs are immovable and there is one movable BAR,
after releasing the bridge windows there will be a free gap - right
where this movable BAR was. These patches are keeping the size of
released BARs, not requesting the size from the devices again - so the
device can't ask for a larger BAR. The space reserving is disabled by
this patchset, so the kernel will request the same size for the bridge
window containing this movable BAR. So there always will be a gap for
this BAR - in the same location it was before.

Based on these considerations I assume that the kernel is always able
to arrange BARs from scratch if a BIOS was able to make it before.

But! There is an implicit speculation that there will be the same
amount of BARs after the fallback (which is equivalent to a PCI rescan
triggered on unchanged topology). And two week ago I've found that
this is not always true!

I was testing on a "new" x86_64 PC, where BIOS doesn't reserve a space
for SR-IOV BARs (of a network adapter). On the boot, the kernel wasn't
arranging BARs itself - it took values written by the BIOS. And the
bridge window was "jammed" between immovable BARs, so it can't expand.
BARs of this device are also immovable, so the bridge window can't be
moved away. During the PCI rescan, the kernel tried to allocate both
"regular" and SR-IOV BARs - and failed. Even without changes in the
PCI topology.

So in the next version of this series there will be one more patch,
that allows the kernel to ignore BIOS's setting for the "safe" (non-IO
and non-VGA) BARs, so these BARs will be arranged kernel-way - and
also those forgotten by the BIOS.

>>> I'm not sure why the PCI_CLASS_DISPLAY_VGA special case is there; can
>>> you add a comment about why that's needed?  Obviously we can't move
>>> the 0xa0000 legacy frame buffer because I think devices are allowed to
>>> claim that region even if no BAR describes it.  But I would think
>>> *other* BARs of VGA devices could be movable.
>>
>> Sure, I'll add a comment to the code.
>>
>> The issue that we are avoiding by that is the "nomodeset" command line
>> argument, which prevents a video driver from being bound, so the BARs
>> are seems to be used, but can't be moved, otherwise machines just hang
>> after hotplug events. That was the only special ugly case we've
>> spotted during testing. I'll check if it will be enough just to work
>> around the 0xa0000.
> 
> "nomodeset" is not really documented and is a funny way to say "don't
> bind video drivers that know about it", but OK.  Thanks for checking
> on the other BARs.
> 

After modifying the code as you advised, it became possible to mark
only some BARs of the device as immovable. So the code is less ugly
now, and it also works for drivers/video/fbdev/efifb.c , which uses
the BAR in a weird way (dev->driver is NULL, but not the res->child):

   static bool pci_dev_movable(struct pci_dev *dev,
                               bool res_has_children)
   {
     if (!pci_can_move_bars)
       return false;

     if (dev->driver && dev->driver->rescan_prepare)
       return true;

     if (!dev->driver && !res_has_children)
       return true;

     return false;
   }

   bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res)
   {
     if (res->flags & IORESOURCE_PCI_FIXED)
       return false;

     #ifdef CONFIG_X86
     /* Workaround for the legacy VGA memory 0xa0000-0xbffff */
     if (res->start == 0xa0000)
       return false;
     #endif

     return pci_dev_movable(dev, res->child);
   }

>>>> +bool pci_movable_bars_enabled(void);
>>>
>>> I would really like it if this were simply
>>>
>>>     extern bool pci_no_movable_bars;
>>>
>>> in drivers/pci/pci.h.  It would default to false since it's
>>> uninitialized, and "pci=no_movable_bars" would set it to true.
>>
>> I have a premonition of platforms that will not support the feature.
>> Wouldn't be better to put this variable-flag to include/linux/pci.h ,
>> so code in arch/* can set it, so they could work by default, without
>> the command line argument?
> 
> In general I don't see why a platform wouldn't support this since
> there really isn't anything platform-specific here.  But if a platform
> does need to disable it, having arch code set this flag sounds
> reasonable.  We shouldn't make it globally visible until we actually
> need that, though.
> 

On powerpc the Extended Error Handling hardware facility doesn't allow
to shuffle the BARs (without notifying the platform code), otherwise
it reports errors.

I'm working on adding support for powerpc/powernv, but powerpc/pseries
also has EEH, and I don't have a hardware to test there.

So the arch/powerpc/platforms/pseries/setup.c will be modified as
follows in the next version of this patchset:

@@ -920,6 +920,8 @@ static void __init pseries_init(void)
  {
  	pr_debug(" -> pseries_init()\n");

+	pci_can_move_bars = false;
+


Best regards,
Serge
