Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E419133C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 15:31:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mtwh4wdgzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 01:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.107.143;
 helo=1.mo177.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo177.mail-out.ovh.net (1.mo177.mail-out.ovh.net
 [178.33.107.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mtpk6F9gzDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 01:26:21 +1100 (AEDT)
Received: from player763.ha.ovh.net (unknown [10.108.54.38])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 1E1C2128174
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:48:54 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 5D7E210BA8FD9;
 Tue, 24 Mar 2020 13:48:33 +0000 (UTC)
Subject: Re: [PATCH v8 01/14] powerpc/xive: Define
 xive_native_alloc_irq_on_chip()
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598352.9256.15242.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <802e7661-b575-5adf-b56f-4684d3f668f3@kaod.org>
Date: Tue, 24 Mar 2020 14:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598352.9256.15242.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1136595957639777106
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejieefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 7:12 AM, Haren Myneni wrote:
> 
> This function allocates IRQ on a specific chip. VAS needs per chip
> IRQ allocation and will have IRQ handler per VAS instance.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  arch/powerpc/include/asm/xive.h   | 9 ++++++++-
>  arch/powerpc/sysdev/xive/native.c | 6 +++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
> index 93f982db..d08ea11 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -5,6 +5,8 @@
>  #ifndef _ASM_POWERPC_XIVE_H
>  #define _ASM_POWERPC_XIVE_H
>  
> +#include <asm/opal-api.h>
> +
>  #define XIVE_INVALID_VP	0xffffffff
>  
>  #ifdef CONFIG_PPC_XIVE
> @@ -108,7 +110,6 @@ struct xive_q {
>  int xive_native_populate_irq_data(u32 hw_irq,
>  				  struct xive_irq_data *data);
>  void xive_cleanup_irq_data(struct xive_irq_data *xd);
> -u32 xive_native_alloc_irq(void);
>  void xive_native_free_irq(u32 irq);
>  int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
>  
> @@ -137,6 +138,12 @@ int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
>  				u32 qindex);
>  int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
>  bool xive_native_has_queue_state_support(void);
> +extern u32 xive_native_alloc_irq_on_chip(u32 chip_id);
> +
> +static inline u32 xive_native_alloc_irq(void)
> +{
> +	return xive_native_alloc_irq_on_chip(OPAL_XIVE_ANY_CHIP);
> +}
>  
>  #else
>  
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
> index 0ff6b73..14d4406 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -279,12 +279,12 @@ static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
>  }
>  #endif /* CONFIG_SMP */
>  
> -u32 xive_native_alloc_irq(void)
> +u32 xive_native_alloc_irq_on_chip(u32 chip_id)
>  {
>  	s64 rc;
>  
>  	for (;;) {
> -		rc = opal_xive_allocate_irq(OPAL_XIVE_ANY_CHIP);
> +		rc = opal_xive_allocate_irq(chip_id);
>  		if (rc != OPAL_BUSY)
>  			break;
>  		msleep(OPAL_BUSY_DELAY_MS);
> @@ -293,7 +293,7 @@ u32 xive_native_alloc_irq(void)
>  		return 0;
>  	return rc;
>  }
> -EXPORT_SYMBOL_GPL(xive_native_alloc_irq);
> +EXPORT_SYMBOL_GPL(xive_native_alloc_irq_on_chip);
>  
>  void xive_native_free_irq(u32 irq)
>  {
> 

