Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139654F8D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPgkG44ZNz3bkS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 00:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPgjr4f0nz3bbs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 00:03:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA0712FC;
	Fri, 17 Jun 2022 07:02:36 -0700 (PDT)
Received: from [10.57.84.65] (unknown [10.57.84.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40BA13F7D8;
	Fri, 17 Jun 2022 07:02:33 -0700 (PDT)
Message-ID: <f5085d38-c596-61d4-befc-9b9f8bb8c11e@arm.com>
Date: Fri, 17 Jun 2022 15:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-3-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220617125750.728590-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, iommu@lists.linux-foundation.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, linux-m68k@lists.linux-m68k.org, Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, linuxppc-dev@lists.ozlabs.org, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-06-17 13:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The BusLogic driver is the last remaining driver that relies on the
> deprecated bus_to_virt() function, which in turn only works on a few
> architectures, and is incompatible with both swiotlb and iommu support.
> 
> Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
> the driver had a dependency on x86-32, presumably because of this
> problem. However, the change introduced another bug that made it still
> impossible to use the driver on any 64-bit machine.
> 
> This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> 64-bit system enumeration error for Buslogic"), 8 years later, which
> shows that there are not a lot of users.
> 
> Maciej is still using the driver on 32-bit hardware, and Khalid mentioned
> that the driver works with the device emulation used in VirtualBox
> and VMware. Both of those only emulate it for Windows 2000 and older
> operating systems that did not ship with the better LSI logic driver.
> 
> Do a minimum fix that searches through the list of descriptors to find
> one that matches the bus address. This is clearly as inefficient as
> was indicated in the code comment about the lack of a bus_to_virt()
> replacement. A better fix would likely involve changing out the entire
> descriptor allocation for a simpler one, but that would be much
> more invasive.

FWIW, if efficiency *is* a practical concern, even under the current 
allocation scheme it looks like there are only 4 actual DMA allocations 
to search through. From a quick scan (since it's too hot here not to get 
distracted...), if I wanted to optimise this in future I'd probably 
remove the semi-redundant allocgrp_* fields from struct blogic_ccb and 
hang a dedicated list of the block allocations off the adapter - at that 
point the lookup could likely already be more efficient than a 
theoretical dma_to_virt() interface would be if it had to go off and 
walk an IOMMU pagetable. Then the next question would be whether it's 
viable to make a single 32KB allocation rather 4*8KB, so it's no longer 
even a list.

For now, though, I agree with the simple change that's clear and easy to 
reason about:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> Cc: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: Matt Wang <wwentao@vmware.com>
> Cc: Khalid Aziz <khalid@gonehiking.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/scsi/BusLogic.c | 27 ++++++++++++++++-----------
>   drivers/scsi/Kconfig    |  2 +-
>   2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> index a897c8f914cf..d057abfcdd5c 100644
> --- a/drivers/scsi/BusLogic.c
> +++ b/drivers/scsi/BusLogic.c
> @@ -2515,12 +2515,26 @@ static int blogic_resultcode(struct blogic_adapter *adapter,
>   	return (hoststatus << 16) | tgt_status;
>   }
>   
> +/*
> + * turn the dma address from an inbox into a ccb pointer
> + * This is rather inefficient.
> + */
> +static struct blogic_ccb *
> +blogic_inbox_to_ccb(struct blogic_adapter *adapter, struct blogic_inbox *inbox)
> +{
> +	struct blogic_ccb *ccb;
> +
> +	for (ccb = adapter->all_ccbs; ccb; ccb = ccb->next_all)
> +		if (inbox->ccb == ccb->dma_handle)
> +			break;
> +
> +	return ccb;
> +}
>   
>   /*
>     blogic_scan_inbox scans the Incoming Mailboxes saving any
>     Incoming Mailbox entries for completion processing.
>   */
> -
>   static void blogic_scan_inbox(struct blogic_adapter *adapter)
>   {
>   	/*
> @@ -2540,16 +2554,7 @@ static void blogic_scan_inbox(struct blogic_adapter *adapter)
>   	enum blogic_cmplt_code comp_code;
>   
>   	while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
> -		/*
> -		   We are only allowed to do this because we limit our
> -		   architectures we run on to machines where bus_to_virt(
> -		   actually works.  There *needs* to be a dma_addr_to_virt()
> -		   in the new PCI DMA mapping interface to replace
> -		   bus_to_virt() or else this code is going to become very
> -		   innefficient.
> -		 */
> -		struct blogic_ccb *ccb =
> -			(struct blogic_ccb *) bus_to_virt(next_inbox->ccb);
> +		struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter, adapter->next_inbox);
>   		if (comp_code != BLOGIC_CMD_NOTFOUND) {
>   			if (ccb->status == BLOGIC_CCB_ACTIVE ||
>   					ccb->status == BLOGIC_CCB_RESET) {
> diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
> index cf75588a2587..56bdc08d0b77 100644
> --- a/drivers/scsi/Kconfig
> +++ b/drivers/scsi/Kconfig
> @@ -513,7 +513,7 @@ config SCSI_HPTIOP
>   
>   config SCSI_BUSLOGIC
>   	tristate "BusLogic SCSI support"
> -	depends on PCI && SCSI && VIRT_TO_BUS
> +	depends on PCI && SCSI
>   	help
>   	  This is support for BusLogic MultiMaster and FlashPoint SCSI Host
>   	  Adapters. Consult the SCSI-HOWTO, available from
