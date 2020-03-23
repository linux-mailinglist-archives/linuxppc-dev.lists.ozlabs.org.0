Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2004F18F14D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:55:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m7WB2sCZzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:55:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.172.162; helo=18.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 18.mo3.mail-out.ovh.net (18.mo3.mail-out.ovh.net
 [87.98.172.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m7SZ516KzDqx5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:53:01 +1100 (AEDT)
Received: from player711.ha.ovh.net (unknown [10.110.208.83])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 8D80E23DED9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 09:52:56 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 0556C108C31B4;
 Mon, 23 Mar 2020 08:52:29 +0000 (UTC)
Subject: Re: [PATCH v8 02/14] powerpc/xive: Define
 xive_native_alloc_get_irq_info()
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598402.9256.15244.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bf312ad2-cfca-86cd-24d8-10da52bff3d8@kaod.org>
Date: Mon, 23 Mar 2020 09:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598402.9256.15244.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8712213482220719097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegjedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 7:13 AM, Haren Myneni wrote:
> 
> pnv_ocxl_alloc_xive_irq() in ocxl.c allocates IRQ and gets trigger port
> address. VAS also needs this function, but based on chip ID. So moved
> this common function to xive/native.c.

We now have two drivers using the lowlevel routines of the machine 
irqchip driver. I am not sure OCXL is doing the right thing by calling
opal_xive_get_irq_info() and not xive_native_populate_irq_data().


C.

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/xive.h       |  2 ++
>  arch/powerpc/platforms/powernv/ocxl.c | 20 ++------------------
>  arch/powerpc/sysdev/xive/native.c     | 23 +++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
> index d08ea11..fd337da 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -139,6 +139,8 @@ int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
>  int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
>  bool xive_native_has_queue_state_support(void);
>  extern u32 xive_native_alloc_irq_on_chip(u32 chip_id);
> +extern int xive_native_alloc_get_irq_info(u32 chip_id, u32 *irq,
> +					u64 *trigger_addr);
>  
>  static inline u32 xive_native_alloc_irq(void)
>  {
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 8c65aac..fb8f99a 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -487,24 +487,8 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>  
>  int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr)
>  {
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
> +	return xive_native_alloc_get_irq_info(OPAL_XIVE_ANY_CHIP, irq,
> +						trigger_addr);
>  }
>  EXPORT_SYMBOL_GPL(pnv_ocxl_alloc_xive_irq);
>  
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
> index 14d4406..abdd892 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -295,6 +295,29 @@ u32 xive_native_alloc_irq_on_chip(u32 chip_id)
>  }
>  EXPORT_SYMBOL_GPL(xive_native_alloc_irq_on_chip);
>  
> +int xive_native_alloc_get_irq_info(u32 chip_id, u32 *irq, u64 *trigger_addr)
> +{
> +	__be64 flags, trigger_page;
> +	u32 hwirq;
> +	s64 rc;
> +
> +	hwirq = xive_native_alloc_irq_on_chip(chip_id);
> +	if (!hwirq)
> +		return -ENOENT;
> +
> +	rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page, NULL,
> +				NULL);
> +	if (rc || !trigger_page) {
> +		xive_native_free_irq(hwirq);
> +		return -ENOENT;
> +	}
> +	*irq = hwirq;
> +	*trigger_addr = be64_to_cpu(trigger_page);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(xive_native_alloc_get_irq_info);
> +
>  void xive_native_free_irq(u32 irq)
>  {
>  	for (;;) {
> 

