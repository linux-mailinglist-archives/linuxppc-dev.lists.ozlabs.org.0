Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3718F139
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:51:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m7Qj3bMgzDr0p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.29; helo=11.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m7Np30dbzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:49:45 +1100 (AEDT)
Received: from player690.ha.ovh.net (unknown [10.110.115.3])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C85631B5A81
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 09:32:31 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 9DB741090224A;
 Mon, 23 Mar 2020 08:32:10 +0000 (UTC)
Subject: Re: [PATCH v8 01/14] powerpc/xive: Define
 xive_native_alloc_irq_on_chip()
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598352.9256.15242.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a0c47238-91f9-1b0c-208a-7186e331577f@kaod.org>
Date: Mon, 23 Mar 2020 09:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598352.9256.15242.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8367406635500211026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegjedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeltddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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

The pool of generic interrupt source (IPI) numbers is generally used 
by user space application which generally do not care on which chip 
the interrupt is allocated. It's used by the CXL driver and KVM for 
the guest interrupts. The CPU IPI are the exceptions.

The underlying FW call will try to allocate on the chip of the CPU 
first and then on the others. If you specify a chip id, there is no 
fallback. Is it what you want ? 

Why do you need to allocate a generic interrupt source (IPI) from
a specific chip ? Is it a VAS requirement ? 

Could you explain a bit more how it is used because there might be 
similar request. 

The code is fine.

Thanks,

C.

  
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
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

