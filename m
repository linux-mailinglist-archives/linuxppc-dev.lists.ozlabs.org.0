Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B266E8AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMnK37gbz3bZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.13; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 5405 seconds by postgrey-1.36 at boromir; Wed, 18 Jan 2023 08:42:14 AEDT
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMmk6nSLz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:42:12 +1100 (AEDT)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id HsC1pqrhhBIxsHsC1p8tQz; Tue, 17 Jan 2023 21:04:29 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 17 Jan 2023 21:04:29 +0100
X-ME-IP: 86.243.2.178
Message-ID: <463d23fe-8fac-408c-febc-6714df59beaf@wanadoo.fr>
Date: Tue, 17 Jan 2023 21:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH linux-next] powerpc/cell/axon_msi: Use
 dma_zalloc_coherent()
Content-Language: fr
To: ye.xingchen@zte.com.cn, arnd@arndb.de
References: <202301171706300144532@zte.com.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <202301171706300144532@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 17/01/2023 à 10:06, ye.xingchen@zte.com.cn a écrit :
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Instead of using dma_alloc_coherent() and memset() directly use
> dma_zalloc_coherent().
> 

Hi,

dma_zalloc_coherent() has been removed at the very beginning of 2019 in 
commit dfd32cad146e.

It is not existing since v5.0-rc2.

\o/

CJ


> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>   arch/powerpc/platforms/cell/axon_msi.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
> index 0c11aad896c7..8a4c522c8e67 100644
> --- a/arch/powerpc/platforms/cell/axon_msi.c
> +++ b/arch/powerpc/platforms/cell/axon_msi.c
> @@ -358,8 +358,8 @@ static int axon_msi_probe(struct platform_device *device)
>   		goto out_free_msic;
>   	}
> 
> -	msic->fifo_virt = dma_alloc_coherent(&device->dev, MSIC_FIFO_SIZE_BYTES,
> -					     &msic->fifo_phys, GFP_KERNEL);
> +	msic->fifo_virt = dma_zalloc_coherent(&device->dev, MSIC_FIFO_SIZE_BYTES,
> +					      &msic->fifo_phys, GFP_KERNEL);
>   	if (!msic->fifo_virt) {
>   		printk(KERN_ERR "axon_msi: couldn't allocate fifo for %pOF\n",
>   		       dn);
> @@ -372,7 +372,6 @@ static int axon_msi_probe(struct platform_device *device)
>   		       dn);
>   		goto out_free_fifo;
>   	}
> -	memset(msic->fifo_virt, 0xff, MSIC_FIFO_SIZE_BYTES);
> 
>   	/* We rely on being able to stash a virq in a u16, so limit irqs to < 65536 */
>   	msic->irq_domain = irq_domain_add_nomap(dn, 65536, &msic_host_ops, msic);

