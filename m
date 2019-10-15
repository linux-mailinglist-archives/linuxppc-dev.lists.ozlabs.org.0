Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87371D7D41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 19:18:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t2FR13NSzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 04:18:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mB+ir6sP"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t2C03L6MzDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 04:16:12 +1100 (AEDT)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F4582086A;
 Tue, 15 Oct 2019 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571159769;
 bh=WAR2gwanRkglRgJ33wk2slqYTUIdiOqopLY7+jPOZzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mB+ir6sP0IpA3smBmT3xKeYTEe+9GQ8J/og8iqCS7fTiQOggWfn5N8gD+h9JG4BMG
 UJAWS4SeSuOBn9uTlv7kGaKXUmby5IZZkW3NXX+Leqx9fqy61C4z9qnHM4lzeyS3vp
 7uLj51/XBjgXCdL3TCaTR3GsHPq7U9gviwv5SX9U=
Date: Tue, 15 Oct 2019 18:58:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191015165833.GB1067208@kroah.com>
References: <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
 <1e1ec851-b5e7-8f35-a627-4c12ca9c2d3c@huawei.com>
 <20191012104001.GA2052933@kroah.com>
 <20191012104742.GA2053473@kroah.com>
 <82000bc8-6912-205b-0251-25b9cc430973@huawei.com>
 <20191014092509.GA3050088@kroah.com>
 <34450edf-2249-ee7a-fc83-f4a923f75989@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34450edf-2249-ee7a-fc83-f4a923f75989@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

On Tue, Oct 15, 2019 at 06:40:29PM +0800, Yunsheng Lin wrote:
> On 2019/10/14 17:25, Greg KH wrote:
> > On Mon, Oct 14, 2019 at 04:00:46PM +0800, Yunsheng Lin wrote:
> >> On 2019/10/12 18:47, Greg KH wrote:
> >>> On Sat, Oct 12, 2019 at 12:40:01PM +0200, Greg KH wrote:
> >>>> On Sat, Oct 12, 2019 at 05:47:56PM +0800, Yunsheng Lin wrote:
> >>>>> On 2019/10/12 15:40, Greg KH wrote:
> >>>>>> On Sat, Oct 12, 2019 at 02:17:26PM +0800, Yunsheng Lin wrote:
> >>>>>>> add pci and acpi maintainer
> >>>>>>> cc linux-pci@vger.kernel.org and linux-acpi@vger.kernel.org
> >>>>>>>
> >>>>>>> On 2019/10/11 19:15, Peter Zijlstra wrote:
> >>>>>>>> On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
> >>>>>>>>> But I failed to see why the above is related to making node_to_cpumask_map()
> >>>>>>>>> NUMA_NO_NODE aware?
> >>>>>>>>
> >>>>>>>> Your initial bug is for hns3, which is a PCI device, which really _MUST_
> >>>>>>>> have a node assigned.
> >>>>>>>>
> >>>>>>>> It not having one, is a straight up bug. We must not silently accept
> >>>>>>>> NO_NODE there, ever.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I suppose you mean reporting a lack of affinity when the node of a pcie
> >>>>>>> device is not set by "not silently accept NO_NODE".
> >>>>>>
> >>>>>> If the firmware of a pci device does not provide the node information,
> >>>>>> then yes, warn about that.
> >>>>>>
> >>>>>>> As Greg has asked about in [1]:
> >>>>>>> what is a user to do when the user sees the kernel reporting that?
> >>>>>>>
> >>>>>>> We may tell user to contact their vendor for info or updates about
> >>>>>>> that when they do not know about their system well enough, but their
> >>>>>>> vendor may get away with this by quoting ACPI spec as the spec
> >>>>>>> considering this optional. Should the user believe this is indeed a
> >>>>>>> fw bug or a misreport from the kernel?
> >>>>>>
> >>>>>> Say it is a firmware bug, if it is a firmware bug, that's simple.
> >>>>>>
> >>>>>>> If this kind of reporting is common pratice and will not cause any
> >>>>>>> misunderstanding, then maybe we can report that.
> >>>>>>
> >>>>>> Yes, please do so, that's the only way those boxes are ever going to get
> >>>>>> fixed.  And go add the test to the "firmware testing" tool that is based
> >>>>>> on Linux that Intel has somewhere, to give vendors a chance to fix this
> >>>>>> before they ship hardware.
> >>>>>>
> >>>>>> This shouldn't be a big deal, we warn of other hardware bugs all the
> >>>>>> time.
> >>>>>
> >>>>> Ok, thanks for clarifying.
> >>>>>
> >>>>> Will send a patch to catch the case when a pcie device without numa node
> >>>>> being set and warn about it.
> >>>>>
> >>>>> Maybe use dev->bus to verify if it is a pci device?
> >>>>
> >>>> No, do that in the pci bus core code itself, when creating the devices
> >>>> as that is when you know, or do not know, the numa node, right?
> >>>>
> >>>> This can't be in the driver core only, as each bus type will have a
> >>>> different way of determining what the node the device is on.  For some
> >>>> reason, I thought the PCI core code already does this, right?
> >>>
> >>> Yes, pci_irq_get_node(), which NO ONE CALLS!  I should go delete that
> >>> thing...
> >>>
> >>> Anyway, it looks like the pci core code does call set_dev_node() based
> >>> on the PCI bridge, so if that is set up properly, all should be fine.
> >>>
> >>> If not, well, you have buggy firmware and you need to warn about that at
> >>> the time you are creating the bridge.  Look at the call to
> >>> pcibus_to_node() in pci_register_host_bridge().
> >>
> >> Thanks for pointing out the specific function.
> >> Maybe we do not need to warn about the case when the device has a parent,
> >> because we must have warned about the parent if the device has a parent
> >> and the parent also has a node of NO_NODE, so do not need to warn the child
> >> device anymore? like blew:
> >>
> >> @@ -932,6 +932,10 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
> >>         list_add_tail(&bus->node, &pci_root_buses);
> >>         up_write(&pci_bus_sem);
> >>
> >> +       if (nr_node_ids > 1 && !parent &&
> > 
> > Why do you need to check this?  If you have a parent, it's your node
> > should be set, if not, that's an error, right?
> 
> If the device has parent and the parent device also has a node of
> NUMA_NO_NODE, then maybe we have warned about the parent device, so
> we do not have to warn about the child device?

But it's a PCI bridge, if it is not set properly, that needs to be fixed
otherwise the PCI devices attached to it have no hope of working
properly.

> In pci_register_host_bridge():
> 
> 	if (!parent)
> 		set_dev_node(bus->bridge, pcibus_to_node(bus));
> 
> The above only set the node of the bridge device to the node of bus if
> the bridge device does not have a parent.

Odd, what happens to devices behind another bridge today?  Are their
nodes set properly today?  Is the node supposed to be the same as the
parent bridge?

> >> +           dev_to_node(bus->bridge) == NUMA_NO_NODE)
> >> +               dev_err(bus->bridge, FW_BUG "No node assigned on NUMA capable HW. Please contact your vendor for updates.\n");
> >> +
> >>         return 0;
> > 
> > Who set that bus->bridge node to NUMA_NO_NODE?
> 
> It seems x86 and arm64 may have different implemention of
> pcibus_to_node():
> 
> For arm64:
> int pcibus_to_node(struct pci_bus *bus)
> {
> 	return dev_to_node(&bus->dev);
> }
> 
> And the node of bus is set in:
> int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
> {
> 	if (!acpi_disabled) {
> 		struct pci_config_window *cfg = bridge->bus->sysdata;
> 		struct acpi_device *adev = to_acpi_device(cfg->parent);
> 		struct device *bus_dev = &bridge->bus->dev;
> 
> 		ACPI_COMPANION_SET(&bridge->dev, adev);
> 		set_dev_node(bus_dev, acpi_get_node(acpi_device_handle(adev)));
> 	}
> 
> 	return 0;
> }
> 
> acpi_get_node() may return NUMA_NO_NODE in pcibios_root_bridge_prepare(),
> which will set the node of bus_dev to NUMA_NO_NODE
> 
> 
> x86:
> static inline int __pcibus_to_node(const struct pci_bus *bus)
> {
> 	const struct pci_sysdata *sd = bus->sysdata;
> 
> 	return sd->node;
> }
> 
> And the node of bus is set in pci_acpi_scan_root(), which uses
> pci_acpi_root_get_node() get the node of a bus. And it also may return
> NUMA_NO_NODE.

Fixing that will be good :)

> > If that is set, the firmware is broken, as you say, but you need to tell
> > the user what firmware is broken.
> 
> Maybe mentioning the BIOS in log?
> dev_err(bus->bridge, FW_BUG "No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.\n");

That's a good start.  Try running it on your machines (big and small)
and see what happens.

> > Try something like this out and see what happens on your machine that
> > had things "broken".  What does it say?
> 
> Does not have a older bios right now.
> But always returning NUMA_NO_NODE by below patch:
> 
> --- a/drivers/acpi/numa.c
> +++ b/drivers/acpi/numa.c
> @@ -484,6 +484,7 @@ int acpi_get_node(acpi_handle handle)
> 
>         pxm = acpi_get_pxm(handle);
> 
> -       return acpi_map_pxm_to_node(pxm);
> +       return -1;
> +       //return acpi_map_pxm_to_node(pxm);
> 
> it gives the blow warning in my machine:
> 
> [   16.126136]  pci0000:00: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   17.733831]  pci0000:7b: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   18.020924]  pci0000:7a: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   18.552832]  pci0000:78: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   19.514948]  pci0000:7c: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   20.652990]  pci0000:74: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   22.573200]  pci0000:80: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   23.225355]  pci0000:bb: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   23.514040]  pci0000:ba: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   24.050107]  pci0000:b8: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   25.017491]  pci0000:bc: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.
> [   25.557974]  pci0000:b4: [Firmware Bug]: No node assigned on NUMA capable HW by BIOS. Please contact your vendor for updates.

And can you fix your bios?  If you can't then why are we going to warn
about this?

:)

thanks,

greg k-h
