Return-Path: <linuxppc-dev+bounces-9501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E8ADF6AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMtjz0PyRz3c86;
	Thu, 19 Jun 2025 05:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750274134;
	cv=none; b=NproTpjA9NfOB9pEvJMyJkbuDiYq1oXJjkDNWkljC2InZPPYa91al5sxjFrXFT5fWlqZf3r6qWWMspiAb7122+5lzx1Ommw3y/3yrzGBzdABYKmaf0yhMdQdtFwl/lgbvEJFfVOLAeEqlwbyJ50/OsHjGdK4c0KHPtRWTvvRqZc3fAKwgw2ZhC5JSkXlEjgQ3ENU8SecMZl8AGf+pXOwq2yZmA55wtu7TaTlmRQMPNYL+1XUbqgm7jb+xaa608qSsNFnbNXTe5qFQ+hkeg9PkR+7z5tCoLGmj1Zc9jKpJQG1KEGcXxWfj019ruU+4epH0GlVacX+RAtkDNIEyGZUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750274134; c=relaxed/relaxed;
	bh=JMP22bHkeKNF1428EtGkaFh19TrE8NMJiLRB2FkKSWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cq6Ky5Xhj1f6HYBeGSRirtlNeHe3Bf5JjXSQv6pgBy/VOuXeJeCHc7rjRKn/rpuZ/qlVmNfpRrZLOZQt0wtyGNawt8e8AyInU2dRgB8er9R6M769Cxc9bsu3JcwEYEbg5YWUA60RV8xExZnIswO6HRxf3OmXsbeQwC1A2A5vDTuc3oxpKBA52MvWXOSjdBUNlUdxTOA5GZ/EOi55luqqvDeiCqI2nrw6xd/owet4QHIE1ml3Jz+AkNBxnMV9cTvHKaV0CDe+X6u3bL5tyG3OcdILpcwmwL56oMi0iJdUvXaRJlyYqWfi4HQ2PDn4FFupEXPqMfBVQS/fMHLqU4OcKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBmKH3RL; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBmKH3RL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMtjy0wqvz3bwf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:15:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1363061F1F;
	Wed, 18 Jun 2025 19:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AFCC4CEE7;
	Wed, 18 Jun 2025 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750274131;
	bh=UYVy08HUm2ENzo6dO1lRm0Hr8jUddaKso3eWn0L8gWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bBmKH3RLpSiDsdGZoWslrBVQqFtW5wn1liZcQl0wgQ4Wrsw9h2EE1gifVg9SGsad3
	 XudLGzfY3mFKleZKgRJ80kTQKwAdUAmSPQ71gOf+Vog5BUbQwlnJQqivuDG1Qwiawh
	 hnth86LO1yRbxLRBaDT8m609q5A+q0o9/v23YAN2Et2s7wCwXu1UrGF+DCMjxwIzKY
	 19/DF5Et8rLtBflwG2GJXFiuPADe+DKSCcBwjHEPIqNCpI3OT79zD8eCOd11xoCNC+
	 ks+TJ7kea2Asr9gVMhaky/Xv6+vf5YGqhLl3eY5Y9VZ/PfbPyvwxXsUN6Z1aB7InTi
	 TNgbITOJ9AUEA==
Date: Wed, 18 Jun 2025 14:15:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 5/6] pci/hotplug/pnv_php: Fix surprise plug detection
 and
Message-ID: <20250618191530.GA1218109@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <317515920.1310655.1750265903281.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 11:58:23AM -0500, Timothy Pearson wrote:
>  recovery

Same weird subject/commit wrapping.

> The existing PowerNV hotplug code did not handle suprise plug events
> correctly, leading to a complete failure of the hotplug system after
> device removal and a required reboot to detect new devices.

s/suprise/surprise/ (also below)

> This comes down to two issues:
> 1.) When a device is suprise removed, oftentimes the bridge upstream
>     port will cause a PE freeze on the PHB.  If this freeze is not
>     cleared, the MSI interrupts from the bridge hotplug notification
>     logic will not be received by the kernel, stalling all plug events
>     on all slots associated with the PE.

I guess you mean the bridge *downstream* port that leads to the slot?

> 2.) When a device is removed from a slot, regardless of suprise or
>     programmatic removal, the associated PHB/PE ls left frozen.
>     If this freeze is not cleared via a fundamental reset, skiboot
>     is unable to clear the freeze and cannot retrain / rescan the
>     slot.  This also requires a reboot to clear the freeze and redetect
>     the device in the slot.
> 
> Issue the appropriate unfreeze and rescan commands on hotplug events,
> and don't oops on hotplug if pci_bus_to_OF_node() returns NULL.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/powerpc/kernel/pci-hotplug.c |  3 ++
>  drivers/pci/hotplug/pnv_php.c     | 53 ++++++++++++++++++++++++++++++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> index 9ea74973d78d..6f444d0822d8 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -141,6 +141,9 @@ void pci_hp_add_devices(struct pci_bus *bus)
>  	struct pci_controller *phb;
>  	struct device_node *dn = pci_bus_to_OF_node(bus);
>  
> +	if (!dn)
> +		return;
> +
>  	phb = pci_bus_to_host(bus);
>  
>  	mode = PCI_PROBE_NORMAL;
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index bac8af3df41a..0ceb4a2c3c79 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -10,6 +10,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/delay.h>
>  #include <linux/pci_hotplug.h>
>  #include <linux/of_fdt.h>
>  
> @@ -474,7 +475,7 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
>  	struct hotplug_slot *slot = &php_slot->slot;
>  	uint8_t presence = OPAL_PCI_SLOT_EMPTY;
>  	uint8_t power_status = OPAL_PCI_SLOT_POWER_ON;
> -	int ret;
> +	int ret, i;
>  
>  	/* Check if the slot has been configured */
>  	if (php_slot->state != PNV_PHP_STATE_REGISTERED)
> @@ -532,6 +533,27 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
>  
>  	/* Power is off, turn it on and then scan the slot */
>  	ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
> +	if (ret) {
> +		SLOT_WARN(php_slot, "PCI slot activation failed with error code %d, possible frozen PHB", ret);
> +		SLOT_WARN(php_slot, "Attempting complete PHB reset before retrying slot activation\n");
> +		for (i = 0; i < 3; i++) {
> +			/* Slot activation failed, PHB may be fenced from a prior device failure
> +			 * Use the OPAL fundamental reset call to both try a device reset and clear
> +			 * any potentially active PHB fence / freeze
> +			 */
> +			SLOT_WARN(php_slot, "Try %d...\n", i + 1);
> +			pci_set_pcie_reset_state(php_slot->pdev, pcie_warm_reset);
> +			msleep(250);

What is the source of the 250 value?  Is there a spec you can cite for
this?  Maybe add a #define if it makes sense?

> +			pci_set_pcie_reset_state(php_slot->pdev, pcie_deassert_reset);
> +
> +			ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);

Wrap the comment and non-printk lines to fit in 80 columns like the
rest of the file.  Preserve the messages as-is so grep finds them
easily.

Usual multi-line comment style is:

  /*
   * Text ...
   */

Possibly factor this warn/reset code into a helper function to
unclutter pnv_php_enable()?

> +			if (!ret)
> +				break;
> +		}
> +
> +		if (i >= 3)
> +			SLOT_WARN(php_slot, "Failed to bring slot online, aborting!\n");
> +	}
>  	if (ret)
>  		return ret;
>  
> @@ -841,12 +863,41 @@ static void pnv_php_event_handler(struct work_struct *work)
>  	struct pnv_php_event *event =
>  		container_of(work, struct pnv_php_event, work);
>  	struct pnv_php_slot *php_slot = event->php_slot;
> +	struct pci_dev *pdev = php_slot->pdev;
> +	struct eeh_dev *edev;
> +	struct eeh_pe *pe;
> +	int i, rc;
>  
>  	if (event->added)
>  		pnv_php_enable_slot(&php_slot->slot);
>  	else
>  		pnv_php_disable_slot(&php_slot->slot);
>  
> +	if (!event->added) {
> +		/* When a device is surprise removed from a downstream bridge slot, the upstream bridge port
> +		 * can still end up frozen due to related EEH events, which will in turn block the MSI interrupts
> +		 * for slot hotplug detection.  Detect and thaw any frozen upstream PE after slot deactivation...
> +		 */

Restyle and wrap comment.

s/upstream bridge port/bridge downstream port/ to avoid confusion.

> +		edev = pci_dev_to_eeh_dev(pdev);
> +		pe = edev ? edev->pe : NULL;
> +		rc = eeh_pe_get_state(pe);
> +		if ((rc == -ENODEV) || (rc == -ENOENT)) {
> +			SLOT_WARN(php_slot, "Upstream bridge PE state unknown, hotplug detect may fail\n");
> +		}
> +		else {
> +			if (pe->state & EEH_PE_ISOLATED) {
> +				SLOT_WARN(php_slot, "Upstream bridge PE %02x frozen, thawing...\n", pe->addr);
> +				for (i = 0; i < 3; i++)
> +					if (!eeh_unfreeze_pe(pe))
> +						break;
> +				if (i >= 3)
> +					SLOT_WARN(php_slot, "Unable to thaw PE %02x, hotplug detect will fail!\n", pe->addr);
> +				else
> +					SLOT_WARN(php_slot, "PE %02x thawed successfully\n", pe->addr);
> +			}
> +		}
> +	}

Possibly factor this out, too.  Then pnv_php_event_handler() could
look simpler:

  if (event->added) {
    pnv_php_enable_slot(&php_slot->slot);
  } else {
    pnv_php_disable_slot(&php_slot->slot);
    <new helper to check for surprise removal>
  }

  kfree(event);

>  	kfree(event);
>  }
>  
> -- 
> 2.39.5

