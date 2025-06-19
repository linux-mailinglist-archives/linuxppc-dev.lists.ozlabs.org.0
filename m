Return-Path: <linuxppc-dev+bounces-9570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D53AE0DE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVrC4pGzz2yPd;
	Fri, 20 Jun 2025 05:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360987;
	cv=none; b=jbYo27gSq63PSIXe96uFytY9qX/jTyD1HPJLGFfIkGsNvunWYCf212vci4ntOBn/eJVammApiCXscImRRZ73R5QiCZWWt3Jan/H80l3GtzDLMrlNugu+veOlgNsMVxdMk/LltCDZ5iv/wIq9AKw+fQ5q26pp6Cs06FcnHb+Uh2I8+g72NnSRw5jfZp4NadTwj5wyDLDEvUYynNQMtFbS6OzeICLAEb2SomIsT19jpzl5DLTZIYZZPI764oi/lPbRDOezyZajQNq78Ko8nnmb+yGOL9FJoS+n4udKX2lqqv9af4ALU2/2okTibF0ibQU5RQqDTyZ+DwZyTgfRd8qY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360987; c=relaxed/relaxed;
	bh=qNxPNWYqbb+jXf/iAO953gQYbUx7jsGfjskPN+KhghU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EX9m4vi23048nr1n0nPdNVbmHobltOX+7rR7Ccfr/uDIIaLBlqwns6eLckmZhEwFceCmwDwmGEOPs6ooq1UIba65VJXHzrOYiFCzenh7QcGiSiAMCIQCgNxpe2Onz3C3QDwIUBNlh42p0FaiTSaJG8S3ZvmPPwkHzF09txHnp/2I01CpBa/lzSLUQAsuRcUUTbgonZfVOSiTXg00f9M7/tdV5NVe79WU2IB8h5Z/5F4G676+6xguEJYnaPvnoTIf2aomo2tzVu5ULrMhANVxQ+meovemq0E6pLcsZ0jy8Y2bbwrRkG9B2ZS9ou/Ke3ldu04WrukNhTHjACXhz+th2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=I9qkUJ7D; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=I9qkUJ7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVr85WkPz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:23:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EF828828818E;
	Thu, 19 Jun 2025 14:23:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gNmk7lzoMzVq; Thu, 19 Jun 2025 14:22:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 96BD68288789;
	Thu, 19 Jun 2025 14:22:59 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 96BD68288789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750360979; bh=qNxPNWYqbb+jXf/iAO953gQYbUx7jsGfjskPN+KhghU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=I9qkUJ7DOEs3Wb9rxVFKyOCLB7xvM89YRoh+cik654FSQNSHsRZciqfL6ZZoCRh6l
	 da4XtxCy3xEM0Aofe07LjU9QC1vYJCh7uqdpzoKGpNpkv1H1XgarDMJGGQamC6O4tD
	 WK/BAfZ6D752HtPH2orH6pW+6LKWqoVwuW2YWGNc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l8vlh_JxzcFN; Thu, 19 Jun 2025 14:22:59 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5184E828818E;
	Thu, 19 Jun 2025 14:22:59 -0500 (CDT)
Date: Thu, 19 Jun 2025 14:22:56 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <518523485.1313620.1750360976352.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250618191530.GA1218109@bhelgaas>
References: <20250618191530.GA1218109@bhelgaas>
Subject: Re: [PATCH v2 5/6] pci/hotplug/pnv_php: Fix surprise plug detection
 and
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Fix surprise plug detection and
Thread-Index: 5L5iP5Vg8cTYPISRTmSBwe4YSu25hg==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Bjorn Helgaas" <helgaas@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Wednesday, June 18, 2025 2:15:30 PM
> Subject: Re: [PATCH v2 5/6] pci/hotplug/pnv_php: Fix surprise plug detection and

> On Wed, Jun 18, 2025 at 11:58:23AM -0500, Timothy Pearson wrote:
>>  recovery
> 
> Same weird subject/commit wrapping.
> 
>> The existing PowerNV hotplug code did not handle suprise plug events
>> correctly, leading to a complete failure of the hotplug system after
>> device removal and a required reboot to detect new devices.
> 
> s/suprise/surprise/ (also below)
> 
>> This comes down to two issues:
>> 1.) When a device is suprise removed, oftentimes the bridge upstream
>>     port will cause a PE freeze on the PHB.  If this freeze is not
>>     cleared, the MSI interrupts from the bridge hotplug notification
>>     logic will not be received by the kernel, stalling all plug events
>>     on all slots associated with the PE.
> 
> I guess you mean the bridge *downstream* port that leads to the slot?

No, the upstream port leading to the PHB.  If it was just the downstream port, we'd still be receiving MSI interrupts from the bridge; the upstream PE also ends up frozen.  My best guess is that the downstream error is propagated upward by the PHB, and the hardware freezes the PE to avoid data corruption until the software (in this case the hotplug driver) can analyze the fault, see that it is expected, and thaw the PE.

>> 2.) When a device is removed from a slot, regardless of suprise or
>>     programmatic removal, the associated PHB/PE ls left frozen.
>>     If this freeze is not cleared via a fundamental reset, skiboot
>>     is unable to clear the freeze and cannot retrain / rescan the
>>     slot.  This also requires a reboot to clear the freeze and redetect
>>     the device in the slot.
>> 
>> Issue the appropriate unfreeze and rescan commands on hotplug events,
>> and don't oops on hotplug if pci_bus_to_OF_node() returns NULL.
>> 
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>  arch/powerpc/kernel/pci-hotplug.c |  3 ++
>>  drivers/pci/hotplug/pnv_php.c     | 53 ++++++++++++++++++++++++++++++-
>>  2 files changed, 55 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/kernel/pci-hotplug.c
>> b/arch/powerpc/kernel/pci-hotplug.c
>> index 9ea74973d78d..6f444d0822d8 100644
>> --- a/arch/powerpc/kernel/pci-hotplug.c
>> +++ b/arch/powerpc/kernel/pci-hotplug.c
>> @@ -141,6 +141,9 @@ void pci_hp_add_devices(struct pci_bus *bus)
>>  	struct pci_controller *phb;
>>  	struct device_node *dn = pci_bus_to_OF_node(bus);
>>  
>> +	if (!dn)
>> +		return;
>> +
>>  	phb = pci_bus_to_host(bus);
>>  
>>  	mode = PCI_PROBE_NORMAL;
>> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
>> index bac8af3df41a..0ceb4a2c3c79 100644
>> --- a/drivers/pci/hotplug/pnv_php.c
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/libfdt.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/delay.h>
>>  #include <linux/pci_hotplug.h>
>>  #include <linux/of_fdt.h>
>>  
>> @@ -474,7 +475,7 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot,
>> bool rescan)
>>  	struct hotplug_slot *slot = &php_slot->slot;
>>  	uint8_t presence = OPAL_PCI_SLOT_EMPTY;
>>  	uint8_t power_status = OPAL_PCI_SLOT_POWER_ON;
>> -	int ret;
>> +	int ret, i;
>>  
>>  	/* Check if the slot has been configured */
>>  	if (php_slot->state != PNV_PHP_STATE_REGISTERED)
>> @@ -532,6 +533,27 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot,
>> bool rescan)
>>  
>>  	/* Power is off, turn it on and then scan the slot */
>>  	ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
>> +	if (ret) {
>> +		SLOT_WARN(php_slot, "PCI slot activation failed with error code %d, possible
>> frozen PHB", ret);
>> +		SLOT_WARN(php_slot, "Attempting complete PHB reset before retrying slot
>> activation\n");
>> +		for (i = 0; i < 3; i++) {
>> +			/* Slot activation failed, PHB may be fenced from a prior device failure
>> +			 * Use the OPAL fundamental reset call to both try a device reset and clear
>> +			 * any potentially active PHB fence / freeze
>> +			 */
>> +			SLOT_WARN(php_slot, "Try %d...\n", i + 1);
>> +			pci_set_pcie_reset_state(php_slot->pdev, pcie_warm_reset);
>> +			msleep(250);
> 
> What is the source of the 250 value?  Is there a spec you can cite for
> this?  Maybe add a #define if it makes sense?

It's a magic number used elsewhere in the tree, specifically by the EEH driver which also issues fundamental resets as part of its logic.  Unfortunately I don't know the origin of the magic number, and from my understanding of the PCIe specification it's probably non-critical -- long enough to be reasonably sure that the PCIe device has seen the reset strobe, but short enough not to stall the operation for an obnoxiously long interval.

>> +			pci_set_pcie_reset_state(php_slot->pdev, pcie_deassert_reset);
>> +
>> +			ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
> 
> Wrap the comment and non-printk lines to fit in 80 columns like the
> rest of the file.  Preserve the messages as-is so grep finds them
> easily.
> 
> Usual multi-line comment style is:
> 
>  /*
>   * Text ...
>   */

Will do.

> Possibly factor this warn/reset code into a helper function to
> unclutter pnv_php_enable()?

Sure, will do.

>> +			if (!ret)
>> +				break;
>> +		}
>> +
>> +		if (i >= 3)
>> +			SLOT_WARN(php_slot, "Failed to bring slot online, aborting!\n");
>> +	}
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -841,12 +863,41 @@ static void pnv_php_event_handler(struct work_struct
>> *work)
>>  	struct pnv_php_event *event =
>>  		container_of(work, struct pnv_php_event, work);
>>  	struct pnv_php_slot *php_slot = event->php_slot;
>> +	struct pci_dev *pdev = php_slot->pdev;
>> +	struct eeh_dev *edev;
>> +	struct eeh_pe *pe;
>> +	int i, rc;
>>  
>>  	if (event->added)
>>  		pnv_php_enable_slot(&php_slot->slot);
>>  	else
>>  		pnv_php_disable_slot(&php_slot->slot);
>>  
>> +	if (!event->added) {
>> +		/* When a device is surprise removed from a downstream bridge slot, the
>> upstream bridge port
>> +		 * can still end up frozen due to related EEH events, which will in turn
>> block the MSI interrupts
>> +		 * for slot hotplug detection.  Detect and thaw any frozen upstream PE after
>> slot deactivation...
>> +		 */
> 
> Restyle and wrap comment.
> 
> s/upstream bridge port/bridge downstream port/ to avoid confusion.

It's the upstream port of the bridge (downstream slot of the PHB itself) that ends up as the frozen PE.

>> +		edev = pci_dev_to_eeh_dev(pdev);
>> +		pe = edev ? edev->pe : NULL;
>> +		rc = eeh_pe_get_state(pe);
>> +		if ((rc == -ENODEV) || (rc == -ENOENT)) {
>> +			SLOT_WARN(php_slot, "Upstream bridge PE state unknown, hotplug detect may
>> fail\n");
>> +		}
>> +		else {
>> +			if (pe->state & EEH_PE_ISOLATED) {
>> +				SLOT_WARN(php_slot, "Upstream bridge PE %02x frozen, thawing...\n",
>> pe->addr);
>> +				for (i = 0; i < 3; i++)
>> +					if (!eeh_unfreeze_pe(pe))
>> +						break;
>> +				if (i >= 3)
>> +					SLOT_WARN(php_slot, "Unable to thaw PE %02x, hotplug detect will fail!\n",
>> pe->addr);
>> +				else
>> +					SLOT_WARN(php_slot, "PE %02x thawed successfully\n", pe->addr);
>> +			}
>> +		}
>> +	}
> 
> Possibly factor this out, too.  Then pnv_php_event_handler() could
> look simpler:
> 
>  if (event->added) {
>    pnv_php_enable_slot(&php_slot->slot);
>  } else {
>    pnv_php_disable_slot(&php_slot->slot);
>    <new helper to check for surprise removal>
>  }

Fair enough, will do.

>  kfree(event);
> 
>>  	kfree(event);
>>  }
>>  
>> --
> > 2.39.5

