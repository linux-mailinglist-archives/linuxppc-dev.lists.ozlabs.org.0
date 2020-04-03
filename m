Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B719D467
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:53:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twGn5bB6zDrTG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:53:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.63.230; helo=7.mo68.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 20:43:34 AEDT
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tw3p240xzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:43:31 +1100 (AEDT)
Received: from player794.ha.ovh.net (unknown [10.110.208.115])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1DB54160684
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:25:50 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 5A93FE11ACD2;
 Fri,  3 Apr 2020 09:25:43 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:25:39 +0200
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 3/4] ocxl: Don't return trigger page when allocating an
 interrupt
Message-ID: <20200403112539.1768fa1e@bahia.lan>
In-Reply-To: <20200402154352.586166-4-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-4-fbarrat@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 80501843921443173
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: ukrishn@linux.ibm.com, ajd@linux.ibm.com, haren@linux.ibm.com, clg@kaod.org,
 linuxppc-dev@lists.ozlabs.org, christophe_lombard@fr.ibm.com,
 mrochs@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  2 Apr 2020 17:43:51 +0200
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

> Existing users of ocxl_link_irq_alloc() have been converted to obtain
> the trigger page of an interrupt through xive directly, we therefore
> have no need to return the trigger page when allocating an interrupt.
> 
> It also allows ocxl to use the xive native interface to allocate
> interrupts, instead of its custom service.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  drivers/misc/ocxl/Kconfig       |  2 +-
>  drivers/misc/ocxl/afu_irq.c     |  4 +---
>  drivers/misc/ocxl/link.c        | 15 +++++++--------
>  drivers/scsi/cxlflash/ocxl_hw.c |  3 +--
>  include/misc/ocxl.h             | 10 ++--------
>  5 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
> index 2d2266c1439e..e65773f5cf59 100644
> --- a/drivers/misc/ocxl/Kconfig
> +++ b/drivers/misc/ocxl/Kconfig
> @@ -9,7 +9,7 @@ config OCXL_BASE
>  
>  config OCXL
>  	tristate "OpenCAPI coherent accelerator support"
> -	depends on PPC_POWERNV && PCI && EEH
> +	depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
>  	select OCXL_BASE
>  	select HOTPLUG_PCI_POWERNV
>  	default m
> diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
> index b30ec0ef7be7..ecdcfae025b7 100644
> --- a/drivers/misc/ocxl/afu_irq.c
> +++ b/drivers/misc/ocxl/afu_irq.c
> @@ -11,7 +11,6 @@ struct afu_irq {
>  	int hw_irq;
>  	unsigned int virq;
>  	char *name;
> -	u64 trigger_page;
>  	irqreturn_t (*handler)(void *private);
>  	void (*free_private)(void *private);
>  	void *private;
> @@ -125,8 +124,7 @@ int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id)
>  		goto err_unlock;
>  	}
>  
> -	rc = ocxl_link_irq_alloc(ctx->afu->fn->link, &irq->hw_irq,
> -				&irq->trigger_page);
> +	rc = ocxl_link_irq_alloc(ctx->afu->fn->link, &irq->hw_irq);
>  	if (rc)
>  		goto err_idr;
>  
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 58d111afd9f6..fd73d3bc0eb6 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -6,6 +6,7 @@
>  #include <linux/mmu_context.h>
>  #include <asm/copro.h>
>  #include <asm/pnv-ocxl.h>
> +#include <asm/xive.h>
>  #include <misc/ocxl.h>
>  #include "ocxl_internal.h"
>  #include "trace.h"
> @@ -682,23 +683,21 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>  }
>  EXPORT_SYMBOL_GPL(ocxl_link_remove_pe);
>  
> -int ocxl_link_irq_alloc(void *link_handle, int *hw_irq, u64 *trigger_addr)
> +int ocxl_link_irq_alloc(void *link_handle, int *hw_irq)
>  {
>  	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> -	int rc, irq;
> -	u64 addr;
> +	int irq;
>  
>  	if (atomic_dec_if_positive(&link->irq_available) < 0)
>  		return -ENOSPC;
>  
> -	rc = pnv_ocxl_alloc_xive_irq(&irq, &addr);
> -	if (rc) {
> +	irq = xive_native_alloc_irq();
> +	if (!irq) {
>  		atomic_inc(&link->irq_available);
> -		return rc;
> +		return -ENXIO;
>  	}
>  
>  	*hw_irq = irq;
> -	*trigger_addr = addr;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ocxl_link_irq_alloc);
> @@ -707,7 +706,7 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
>  {
>  	struct ocxl_link *link = (struct ocxl_link *) link_handle;
>  
> -	pnv_ocxl_free_xive_irq(hw_irq);
> +	xive_native_free_irq(hw_irq);
>  	atomic_inc(&link->irq_available);
>  }
>  EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
> index 59452850f71c..03bff0cae658 100644
> --- a/drivers/scsi/cxlflash/ocxl_hw.c
> +++ b/drivers/scsi/cxlflash/ocxl_hw.c
> @@ -613,7 +613,6 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
>  	struct ocxl_hw_afu *afu = ctx->hw_afu;
>  	struct device *dev = afu->dev;
>  	struct ocxlflash_irqs *irqs;
> -	u64 addr;
>  	int rc = 0;
>  	int hwirq;
>  	int i;
> @@ -638,7 +637,7 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
>  	}
>  
>  	for (i = 0; i < num; i++) {
> -		rc = ocxl_link_irq_alloc(afu->link_token, &hwirq, &addr);
> +		rc = ocxl_link_irq_alloc(afu->link_token, &hwirq);
>  		if (unlikely(rc)) {
>  			dev_err(dev, "%s: ocxl_link_irq_alloc failed rc=%d\n",
>  				__func__, rc);
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..a2868adec22f 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -480,14 +480,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid);
>   * Allocate an AFU interrupt associated to the link.
>   *
>   * 'hw_irq' is the hardware interrupt number
> - * 'obj_handle' is the 64-bit object handle to be passed to the AFU to
> - * trigger the interrupt.
> - * On P9, 'obj_handle' is an address, which, if written, triggers the
> - * interrupt. It is an MMIO address which needs to be remapped (one
> - * page).
> - */
> -int ocxl_link_irq_alloc(void *link_handle, int *hw_irq,
> -			u64 *obj_handle);
> + */
> +int ocxl_link_irq_alloc(void *link_handle, int *hw_irq);
>  
>  /*
>   * Free a previously allocated AFU interrupt

