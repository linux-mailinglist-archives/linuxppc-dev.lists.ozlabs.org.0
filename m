Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC65191277
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 15:08:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mtPk0VWQzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 01:08:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.51.53; helo=5.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 285 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Mar 2020 01:01:06 AEDT
Received: from 5.mo178.mail-out.ovh.net (5.mo178.mail-out.ovh.net
 [46.105.51.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mtFZ6FvwzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 01:01:05 +1100 (AEDT)
Received: from player691.ha.ovh.net (unknown [10.110.103.2])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id E322F95D8A
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:51:50 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 2685810D2C406;
 Tue, 24 Mar 2020 13:51:31 +0000 (UTC)
Subject: Re: [PATCH v8 02/14] powerpc/xive: Define
 xive_native_alloc_get_irq_info()
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598402.9256.15244.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8a8f9ba9-106a-826f-20ae-d4e4925887f3@kaod.org>
Date: Tue, 24 Mar 2020 14:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598402.9256.15244.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1186135552082021202
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On 3/19/20 7:13 AM, Haren Myneni wrote:
> 
> pnv_ocxl_alloc_xive_irq() in ocxl.c allocates IRQ and gets trigger port
> address. VAS also needs this function, but based on chip ID. So moved
> this common function to xive/native.c.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

I think we should work on a new interface for generic IPI use. 
This is a beginning.  

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

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

alignment ^

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

