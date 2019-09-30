Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC9C2115
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 15:01:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hjGC5cNxzDqM1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="vbyhADUe"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hjCn5lGbzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 22:59:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 75CF343145;
 Mon, 30 Sep 2019 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1569848367; x=1571662768; bh=Kca
 fZNwZj+UFFvppP0S80xYam4mZtJCOzGOau5yTPlI=; b=vbyhADUeh80E2+h2keK
 QKnJhpNsFo8yiv+MCAwN1K8VYdyRB40DNduz1nLsiPg/Bd35qd7ELGLxfD0OcSf0
 2tDPjcSAZuHI+ARK8v5wgRCmHPWvgH0lFrX79DDDCuKHMbbquMJcxRMw8LOuDZd7
 UGnR51lzkxWLu+BjcasGroec=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxKTZ8yxhYIu; Mon, 30 Sep 2019 15:59:27 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 53D1142A6D;
 Mon, 30 Sep 2019 15:59:26 +0300 (MSK)
Received: from [172.17.15.60] (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Sep 2019 15:59:25 +0300
Subject: Re: [PATCH v5 03/23] PCI: hotplug: Add a flag for the movable BARs
 feature
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20190927220219.GA57201@google.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Message-ID: <92cf42bf-5044-329d-f1be-53b48801865f@yadro.com>
Date: Mon, 30 Sep 2019 15:59:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927220219.GA57201@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.60]
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

Hello Bjorn,

On 9/28/19 1:02 AM, Bjorn Helgaas wrote:
> On Fri, Aug 16, 2019 at 07:50:41PM +0300, Sergey Miroshnichenko wrote:
>> When hot-adding a device, the bridge may have windows not big enough (or
>> fragmented too much) for newly requested BARs to fit in. And expanding
>> these bridge windows may be impossible because blocked by "neighboring"
>> BARs and bridge windows.
>>
>> Still, it may be possible to allocate a memory region for new BARs with the
>> following procedure:
>>
>> 1) notify all the drivers which support movable BARs to pause and release
>>     the BARs; the rest of the drivers are guaranteed that their devices will
>>     not get BARs moved;
>>
>> 2) release all the bridge windows except of root bridges;
>>
>> 3) try to recalculate new bridge windows that will fit all the BAR types:
>>     - fixed;
>>     - immovable;
>>     - movable;
>>     - newly requested by hot-added devices;
>>
>> 4) if the previous step fails, disable BARs for one of the hot-added
>>     devices and retry from step 3;
>>
>> 5) notify the drivers, so they remap BARs and resume.
> 
> You don't do the actual recalculation in *this* patch, but since you
> mention the procedure here, are we confident that we never make things
> worse?
> 
> It's possible that a hot-add will trigger this attempt to move things
> around, and it's possible that we won't find space for the new device
> even if we move things around.  But are we certain that every device
> that worked *before* the hot-add will still work *afterwards*?
> 
> Much of the assignment was probably done by the BIOS using different
> algorithms than Linux has, so I think there's some chance that the
> BIOS did a better job and if we lose that BIOS assignment, we might
> not be able to recreate it.
> 

If a hardware has some special constraints on BAR assignment that the
kernel is not aware of yet, the movable BARs may break things after a
hotplug event. So the feature must be disabled there (manually) until
the kernel get support for that special needs.

On x86 we had no choice - most of the machines we used just can't boot
with even an "empty" 16-port switch connected. So we hot-add it after
the boot, then trigger a rescan via 'echo 1 > /sys/bus/pci/rescan'.
And reserved bridge windows wasn't enough, and they can't expand
because are blocked by the next device.

>> This makes the prior reservation of memory by BIOS/bootloader/firmware not
>> required anymore for the PCI hotplug.
>>
>> Drivers indicate their support of movable BARs by implementing the new
>> .rescan_prepare() and .rescan_done() hooks in the struct pci_driver. All
>> device's activity must be paused during a rescan, and iounmap()+ioremap()
>> must be applied to every used BAR.
>>
>> The platform also may need to prepare to BAR movement, so new hooks added:
>> pcibios_rescan_prepare(pci_dev) and pcibios_rescan_prepare(pci_dev).
>>
>> This patch is a preparation for future patches with actual implementation,
>> and for now it just does the following:
>>   - declares the feature;
>>   - defines pci_movable_bars_enabled(), pci_dev_movable_bars_supported(dev);
>>   - invokes the .rescan_prepare() and .rescan_done() driver notifiers;
>>   - declares and invokes the pcibios_rescan_prepare()/_done() hooks;
>>   - adds the PCI_IMMOVABLE_BARS flag.
>>
>> The feature is disabled by default (via PCI_IMMOVABLE_BARS) until the final
>> patch of the series. It can be overridden per-arch using this flag or by
>> the following command line option:
>>
>>      pcie_movable_bars={ off | force }
>>
>> CC: Sam Bobroff <sbobroff@linux.ibm.com>
>> CC: Rajat Jain <rajatja@google.com>
>> CC: Lukas Wunner <lukas@wunner.de>
>> CC: Oliver O'Halloran <oohall@gmail.com>
>> CC: David Laight <David.Laight@ACULAB.COM>
>> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  7 ++
>>   drivers/pci/pci-driver.c                      |  2 +
>>   drivers/pci/pci.c                             | 24 ++++++
>>   drivers/pci/pci.h                             |  2 +
>>   drivers/pci/probe.c                           | 86 ++++++++++++++++++-
>>   include/linux/pci.h                           |  7 ++
>>   6 files changed, 126 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 47d981a86e2f..e2274ee87a35 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3526,6 +3526,13 @@
>>   		nomsi	Do not use MSI for native PCIe PME signaling (this makes
>>   			all PCIe root ports use INTx for all services).
>>   
>> +	pcie_movable_bars=[PCIE]
> 
> This isn't a PCIe-specific feature, it's just a function of whether
> drivers are smart enough, so we shouldn't tie it specifically to PCIe.
> We could eventually do this for conventional PCI as well.
> 
>> +			Override the movable BARs support detection:
>> +		off
>> +			Disable even if supported by the platform
>> +		force
>> +			Enable even if not explicitly declared as supported
> 
> What's the need for "force"?  If it's possible, I think we should
> enable this functionality all the time and just have a disable switch
> in case we trip over cases where it doesn't work, e.g., something
> like:
> 
>    pci=no_movable_bars
> 

Thanks, I'll simplify that, replace the pci_movable_bars_enabled()
with a bool variable, and remove the flag as you advice.

>>   	pcmv=		[HW,PCMCIA] BadgePAD 4
>>   
>>   	pd_ignore_unused
>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>> index a8124e47bf6e..d11909e79263 100644
>> --- a/drivers/pci/pci-driver.c
>> +++ b/drivers/pci/pci-driver.c
>> @@ -1688,6 +1688,8 @@ static int __init pci_driver_init(void)
>>   {
>>   	int ret;
>>   
>> +	pci_add_flags(PCI_IMMOVABLE_BARS);
>> +
>>   	ret = bus_register(&pci_bus_type);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 61d951766087..3a504f58ac60 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -139,6 +139,30 @@ static int __init pcie_port_pm_setup(char *str)
>>   }
>>   __setup("pcie_port_pm=", pcie_port_pm_setup);
>>   
>> +static bool pcie_movable_bars_off;
>> +static bool pcie_movable_bars_force;
>> +static int __init pcie_movable_bars_setup(char *str)
>> +{
>> +	if (!strcmp(str, "off"))
>> +		pcie_movable_bars_off = true;
>> +	else if (!strcmp(str, "force"))
>> +		pcie_movable_bars_force = true;
>> +	return 1;
>> +}
>> +__setup("pcie_movable_bars=", pcie_movable_bars_setup);
>> +
>> +bool pci_movable_bars_enabled(void)
>> +{
>> +	if (pcie_movable_bars_off)
>> +		return false;
>> +
>> +	if (pcie_movable_bars_force)
>> +		return true;
>> +
>> +	return !pci_has_flag(PCI_IMMOVABLE_BARS);
>> +}
>> +EXPORT_SYMBOL(pci_movable_bars_enabled);
> 
> I don't think this needs to be exported, since the only references I
> see are from the PCI core.
> 

Thanks for catching that, this export slipped from older patches, when
the function was used in arch/*

>>   /* Time to wait after a reset for device to become responsive */
>>   #define PCIE_RESET_READY_POLL_MS 60000
>>   
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index d22d1b807701..be7acc477c64 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -257,6 +257,8 @@ bool pci_bus_clip_resource(struct pci_dev *dev, int idx);
>>   void pci_reassigndev_resource_alignment(struct pci_dev *dev);
>>   void pci_disable_bridge_window(struct pci_dev *dev);
>>   
>> +bool pci_dev_movable_bars_supported(struct pci_dev *dev);
>> +
>>   /* PCIe link information */
>>   #define PCIE_SPEED2STR(speed) \
>>   	((speed) == PCIE_SPEED_16_0GT ? "16 GT/s" : \
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 2e58ece820e8..60e3b48d2251 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -3406,6 +3406,74 @@ unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge)
>>   	return max;
>>   }
>>   
>> +bool pci_dev_movable_bars_supported(struct pci_dev *dev)
> 
> This name suggests that movable BARs is a property of the device, but
> it's mostly a property of the *driver*.  Most uses are in conjuction
> with checking IORESOURCE_PCI_FIXED for some resource, so I think this
> might read more naturally and simplify the callers slightly:
> 
>    bool pci_dev_movable(struct pci_dev *dev)
>    {
>      if (dev->driver && dev->driver->rescan_prepare)
>        return true;
> 
>      if ((dev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>        return false;
> 
>      if (!dev->driver)
>        return true;
> 
>      return false;
>    }
> 
>    bool pci_dev_bar_movable(struct pci_dev *dev, struct resource *res)
>    {
>      if (res->flags & IORESOURCE_PCI_FIXED)
>        return false;
> 
>      return pci_dev_movable(dev);
>    }
> 

Nice, I'll do that, thanks.

Theoretically, there may be a number of identical devices in the
system, some of them are bound to an "immovable" driver, and the rest
is not, which makes them movable. Also modprobe+rmmod may affect
device's BARs mobility. But I agree, the "_supported" suffix was
confusing.

> I'm not sure why the PCI_CLASS_DISPLAY_VGA special case is there; can
> you add a comment about why that's needed?  Obviously we can't move
> the 0xa0000 legacy frame buffer because I think devices are allowed to
> claim that region even if no BAR describes it.  But I would think
> *other* BARs of VGA devices could be movable.
> 

Sure, I'll add a comment to the code.

The issue that we are avoiding by that is the "nomodeset" command line
argument, which prevents a video driver from being bound, so the BARs
are seems to be used, but can't be moved, otherwise machines just hang
after hotplug events. That was the only special ugly case we've
spotted during testing. I'll check if it will be enough just to work
around the 0xa0000.

>> +{
>> +	if (!dev)
>> +		return false;
>> +
>> +	if (dev->driver && dev->driver->rescan_prepare)
>> +		return true;
>> +
>> +	if ((dev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>> +		return false;
>> +
>> +	return !dev->driver;
>> +}
>> +
>> +void __weak pcibios_rescan_prepare(struct pci_dev *dev)
>> +{
>> +}
>> +
>> +void __weak pcibios_rescan_done(struct pci_dev *dev)
>> +{
>> +}
> 
> Can you add the pcibios_rescan_prepare() and pcibios_rescan_done()
> stubs at the point where they're needed, i.e., where you add the
> powerpc implementations?  We can't see the need for them at this point
> in the series.
> 

Sure.

>> +static void pci_bus_rescan_prepare(struct pci_bus *bus)
>> +{
>> +	struct pci_dev *dev;
>> +
>> +	if (bus->self)
>> +		pci_config_pm_runtime_get(bus->self);
>> +
>> +	list_for_each_entry(dev, &bus->devices, bus_list) {
>> +		struct pci_bus *child = dev->subordinate;
>> +
>> +		if (child)
>> +			pci_bus_rescan_prepare(child);
>> +
>> +		if (dev->driver &&
>> +		    dev->driver->rescan_prepare) {
>> +			dev->driver->rescan_prepare(dev);
>> +			pcibios_rescan_prepare(dev);
>> +		} else if (pci_dev_movable_bars_supported(dev)) {
> 
> The connection between these two conditions is pretty complicated to
> figure out.  Can you explain why you need both?
> 

Yeah, this is what was meant, if would be written clearer:

	if (pci_dev_movable_bars_supported(dev)) {
		if (dev->driver &&
		    dev->driver->rescan_prepare)
			dev->driver->rescan_prepare(dev);

		pcibios_rescan_prepare(dev);
	}

But anyway the pcibios_rescan_prepare(dev) was for PowerNV, and after
consulting with Oliver it was decided to make that a single call for
the whole domain instead of per-device.

>> +			pcibios_rescan_prepare(dev);
>> +		}
>> +	}
>> +}
>> +
>> +static void pci_bus_rescan_done(struct pci_bus *bus)
>> +{
>> +	struct pci_dev *dev;
>> +
>> +	list_for_each_entry(dev, &bus->devices, bus_list) {
>> +		struct pci_bus *child = dev->subordinate;
>> +
>> +		if (dev->driver &&
>> +		    dev->driver->rescan_done) {
>> +			pcibios_rescan_done(dev);
>> +			dev->driver->rescan_done(dev);
>> +		} else if (pci_dev_movable_bars_supported(dev)) {
>> +			pcibios_rescan_done(dev);
>> +		}
>> +
>> +		if (child)
>> +			pci_bus_rescan_done(child);
>> +	}
>> +
>> +	if (bus->self)
>> +		pci_config_pm_runtime_put(bus->self);
>> +}
>> +
>>   /**
>>    * pci_rescan_bus - Scan a PCI bus for devices
>>    * @bus: PCI bus to scan
>> @@ -3418,9 +3486,23 @@ unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge)
>>   unsigned int pci_rescan_bus(struct pci_bus *bus)
>>   {
>>   	unsigned int max;
>> +	struct pci_bus *root = bus;
>> +
>> +	while (!pci_is_root_bus(root))
>> +		root = root->parent;
>> +
>> +	if (pci_movable_bars_enabled()) {
>> +		pci_bus_rescan_prepare(root);
>> +
>> +		max = pci_scan_child_bus(root);
>> +		pci_assign_unassigned_root_bus_resources(root);
>> +
>> +		pci_bus_rescan_done(root);
>> +	} else {
>> +		max = pci_scan_child_bus(bus);
>> +		pci_assign_unassigned_bus_resources(bus);
>> +	}
>>   
>> -	max = pci_scan_child_bus(bus);
>> -	pci_assign_unassigned_bus_resources(bus);
>>   	pci_bus_add_devices(bus);
>>   
>>   	return max;
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index d3a72159722d..e5b5eff05744 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -838,6 +838,8 @@ struct pci_driver {
>>   	int  (*resume)(struct pci_dev *dev);	/* Device woken up */
>>   	void (*shutdown)(struct pci_dev *dev);
>>   	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
>> +	void (*rescan_prepare)(struct pci_dev *dev);
>> +	void (*rescan_done)(struct pci_dev *dev);
>>   	const struct pci_error_handlers *err_handler;
>>   	const struct attribute_group **groups;
>>   	struct device_driver	driver;
>> @@ -924,6 +926,7 @@ enum {
>>   	PCI_ENABLE_PROC_DOMAINS	= 0x00000010,	/* Enable domains in /proc */
>>   	PCI_COMPAT_DOMAIN_0	= 0x00000020,	/* ... except domain 0 */
>>   	PCI_SCAN_ALL_PCIE_DEVS	= 0x00000040,	/* Scan all, not just dev 0 */
>> +	PCI_IMMOVABLE_BARS	= 0x00000080,	/* Disable runtime BAR reassign */
> 
> There are no uses of PCI_IMMOVABLE_BARS left at the end of the series,
> so I'd rather not add it if we can avoid it.
> 
>>   };
>>   
>>   /* These external functions are only available when PCI support is enabled */
>> @@ -1266,6 +1269,9 @@ unsigned int pci_rescan_bus(struct pci_bus *bus);
>>   void pci_lock_rescan_remove(void);
>>   void pci_unlock_rescan_remove(void);
>>   
>> +void pcibios_rescan_prepare(struct pci_dev *dev);
>> +void pcibios_rescan_done(struct pci_dev *dev);
>> +
>>   /* Vital Product Data routines */
>>   ssize_t pci_read_vpd(struct pci_dev *dev, loff_t pos, size_t count, void *buf);
>>   ssize_t pci_write_vpd(struct pci_dev *dev, loff_t pos, size_t count, const void *buf);
>> @@ -1402,6 +1408,7 @@ unsigned char pci_bus_max_busnr(struct pci_bus *bus);
>>   void pci_setup_bridge(struct pci_bus *bus);
>>   resource_size_t pcibios_window_alignment(struct pci_bus *bus,
>>   					 unsigned long type);
>> +bool pci_movable_bars_enabled(void);
> 
> I would really like it if this were simply
> 
>    extern bool pci_no_movable_bars;
> 
> in drivers/pci/pci.h.  It would default to false since it's
> uninitialized, and "pci=no_movable_bars" would set it to true.
> 

I have a premonition of platforms that will not support the feature.
Wouldn't be better to put this variable-flag to include/linux/pci.h ,
so code in arch/* can set it, so they could work by default, without
the command line argument?

Serge

> We have similar "=off" and "=force" parameters for ASPM and other
> things, and it makes the code really hard to analyze.
> 
>>   #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
>>   #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
>> -- 
>> 2.21.0
>>
