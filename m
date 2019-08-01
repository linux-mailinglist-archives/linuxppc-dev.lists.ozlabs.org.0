Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0127DA84
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 13:43:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zpMg457lzDqwg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 21:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.63.230; helo=7.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 606 seconds by postgrey-1.36 at bilbo;
 Thu, 01 Aug 2019 21:42:01 AEST
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zpL14hJFzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 21:41:56 +1000 (AEST)
Received: from player758.ha.ovh.net (unknown [10.108.57.18])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id C367813A3CE
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 13:31:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 1E73F88D821D;
 Thu,  1 Aug 2019 11:31:36 +0000 (UTC)
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 allison@lohutok.net, tglx@linutronix.de, groug@kaod.org
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bb72af16-d775-de39-498b-5e64976d93de@kaod.org>
Date: Thu, 1 Aug 2019 13:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14817687201574521713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleejgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/08/2019 13:09, Christophe JAILLET wrote:
> 'xive_irq_bitmap_add()' can return -ENOMEM.
> In this case, we should free the memory already allocated and return
> 'false' to the caller.
> 
> Also add an error path which undoes the 'tima = ioremap(...)'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> NOT compile tested (I don't have a cross compiler and won't install one).

All distros have a packaged powerpc cross compiler. 

Then, you need to compile a kernel for a pseries machine and run a pseries
machine with it under QEMU. You can use a simple ppc initrd, a net install 
one for example.

You could also hack the device tree in QEMU to torture the XIVE sPAPR driver.
Nothing too complex, all is here : 

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/intc/spapr_xive.c;h=097f88d4608d8ba160526756a3a224e5176b6e0f;hb=HEAD#l1427


> So if some correction or improvement are needed, feel free to propose and
> commit it directly.

Yes there is I think. I would move at the end all the code that needs a 
rollback.

Thanks for taking a look, I might do that one day.

Cheers,
C.  


> ---
>  arch/powerpc/sysdev/xive/spapr.c | 36 +++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 52198131c75e..b3ae0b76c433 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -64,6 +64,17 @@ static int xive_irq_bitmap_add(int base, int count)
>  	return 0;
>  }
>  
> +static void xive_irq_bitmap_remove_all(void)
> +{
> +	struct xive_irq_bitmap *xibm, *tmp;
> +
> +	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
> +		list_del(&xibm->list);
> +		kfree(xibm->bitmap);
> +		kfree(xibm);
> +	}
> +}
> +
>  static int __xive_irq_bitmap_alloc(struct xive_irq_bitmap *xibm)
>  {
>  	int irq;
> @@ -723,7 +734,7 @@ bool __init xive_spapr_init(void)
>  	u32 val;
>  	u32 len;
>  	const __be32 *reg;
> -	int i;
> +	int i, err;
>  
>  	if (xive_spapr_disabled())
>  		return false;
> @@ -748,23 +759,26 @@ bool __init xive_spapr_init(void)
>  	}
>  
>  	if (!xive_get_max_prio(&max_prio))
> -		return false;
> +		goto err_unmap;
>  
>  	/* Feed the IRQ number allocator with the ranges given in the DT */
>  	reg = of_get_property(np, "ibm,xive-lisn-ranges", &len);
>  	if (!reg) {
>  		pr_err("Failed to read 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>  	}
>  
>  	if (len % (2 * sizeof(u32)) != 0) {
>  		pr_err("invalid 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>  	}
>  
> -	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2)
> -		xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> -				    be32_to_cpu(reg[1]));
> +	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2) {
> +		err = xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> +					  be32_to_cpu(reg[1]));
> +		if (err < 0)
> +			goto err_mem_free;
> +	}
>  
>  	/* Iterate the EQ sizes and pick one */
>  	of_property_for_each_u32(np, "ibm,xive-eq-sizes", prop, reg, val) {
> @@ -775,8 +789,14 @@ bool __init xive_spapr_init(void)
>  
>  	/* Initialize XIVE core with our backend */
>  	if (!xive_core_init(&xive_spapr_ops, tima, TM_QW1_OS, max_prio))
> -		return false;
> +		goto err_mem_free;
>  
>  	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
>  	return true;
> +
> +err_mem_free:
> +	xive_irq_bitmap_remove_all();
> +err_unmap:
> +	iounmap(tima);
> +	return false;
>  }
> 

