Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA619D473
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:54:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twJd6fkdzDsRY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.36.149; helo=4.mo179.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo179.mail-out.ovh.net (4.mo179.mail-out.ovh.net
 [46.105.36.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tw4R2bvyzDrVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:44:06 +1100 (AEDT)
Received: from player737.ha.ovh.net (unknown [10.108.57.226])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id D799B163100
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:27:56 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 4D6A279FEE0D;
 Fri,  3 Apr 2020 09:27:47 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:27:45 +0200
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 4/4] ocxl: Remove custom service to allocate interrupts
Message-ID: <20200403112745.6d6d40d2@bahia.lan>
In-Reply-To: <20200402154352.586166-5-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-5-fbarrat@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 115967692144023909
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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

On Thu,  2 Apr 2020 17:43:52 +0200
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

> We now allocate interrupts through xive directly.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/pnv-ocxl.h   |  3 ---
>  arch/powerpc/platforms/powernv/ocxl.c | 30 ---------------------------

Nice diffstat :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  2 files changed, 33 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 7de82647e761..e90650328c9c 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -30,7 +30,4 @@ extern int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
>  extern void pnv_ocxl_spa_release(void *platform_data);
>  extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
>  
> -extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> -extern void pnv_ocxl_free_xive_irq(u32 irq);
> -
>  #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 8c65aacda9c8..ecdad219d704 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -2,7 +2,6 @@
>  // Copyright 2017 IBM Corp.
>  #include <asm/pnv-ocxl.h>
>  #include <asm/opal.h>
> -#include <asm/xive.h>
>  #include <misc/ocxl-config.h>
>  #include "pci.h"
>  
> @@ -484,32 +483,3 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>  	return rc;
>  }
>  EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
> -
> -int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr)
> -{
> -	__be64 flags, trigger_page;
> -	s64 rc;
> -	u32 hwirq;
> -
> -	hwirq = xive_native_alloc_irq();
> -	if (!hwirq)
> -		return -ENOENT;
> -
> -	rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page, NULL,
> -				NULL);
> -	if (rc || !trigger_page) {
> -		xive_native_free_irq(hwirq);
> -		return -ENOENT;
> -	}
> -	*irq = hwirq;
> -	*trigger_addr = be64_to_cpu(trigger_page);
> -	return 0;
> -
> -}
> -EXPORT_SYMBOL_GPL(pnv_ocxl_alloc_xive_irq);
> -
> -void pnv_ocxl_free_xive_irq(u32 irq)
> -{
> -	xive_native_free_irq(irq);
> -}
> -EXPORT_SYMBOL_GPL(pnv_ocxl_free_xive_irq);

