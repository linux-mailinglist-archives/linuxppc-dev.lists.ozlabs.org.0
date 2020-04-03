Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA67D19D052
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:39:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tqzJ0Pf9zDqHp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:39:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.33.112; helo=8.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2375 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 17:36:14 AEDT
Received: from 8.mo4.mail-out.ovh.net (8.mo4.mail-out.ovh.net [188.165.33.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tqvf38hTzDrgp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:36:13 +1100 (AEDT)
Received: from player799.ha.ovh.net (unknown [10.108.57.43])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id E880522C9F9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 07:56:33 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 0337C1115E0CE;
 Fri,  3 Apr 2020 05:56:25 +0000 (UTC)
Subject: Re: [PATCH 4/4] ocxl: Remove custom service to allocate interrupts
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 christophe_lombard@fr.ibm.com, ajd@linux.ibm.com, ukrishn@linux.ibm.com,
 mrochs@linux.ibm.com
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-5-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0554665d-f3c5-dd77-c726-2180cdf7d3ad@kaod.org>
Date: Fri, 3 Apr 2020 07:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402154352.586166-5-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14992764634737249177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: haren@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/2/20 5:43 PM, Frederic Barrat wrote:
> We now allocate interrupts through xive directly.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/powerpc/include/asm/pnv-ocxl.h   |  3 ---
>  arch/powerpc/platforms/powernv/ocxl.c | 30 ---------------------------
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
> 

