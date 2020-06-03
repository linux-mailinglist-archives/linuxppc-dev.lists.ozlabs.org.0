Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD01ED19B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:00:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cVsn2JRhzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
X-Greylist: delayed 101 seconds by postgrey-1.36 at bilbo;
 Wed, 03 Jun 2020 23:52:45 AEST
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVj90HzWzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:52:42 +1000 (AEST)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3A7D9C0012;
 Wed,  3 Jun 2020 13:52:35 +0000 (UTC)
Date: Wed, 3 Jun 2020 15:52:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 03/10] mtd: rawnand: fsl_upm: Allocate the fsl_upm_nand
 object using devm_kzalloc()
Message-ID: <20200603155234.4594f501@xps13>
In-Reply-To: <20200603134922.1352340-4-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
 <20200603134922.1352340-4-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Anton Vorontsov <anton@enomsg.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed,  3 Jun
2020 15:49:15 +0200:

> This simplifies the init error patch and remove function.

                                 path?

Otherwise:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/mtd/nand/raw/fsl_upm.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
> index 6eba2f4a2f5a..9cf79c62ef22 100644
> --- a/drivers/mtd/nand/raw/fsl_upm.c
> +++ b/drivers/mtd/nand/raw/fsl_upm.c
> @@ -205,36 +205,34 @@ static int fun_probe(struct platform_device *ofdev)
>  	int size;
>  	int i;
>  
> -	fun = kzalloc(sizeof(*fun), GFP_KERNEL);
> +	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
>  	if (!fun)
>  		return -ENOMEM;
>  
>  	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
>  	if (ret) {
>  		dev_err(&ofdev->dev, "can't get IO base\n");
> -		goto err1;
> +		return ret;
>  	}
>  
>  	ret = fsl_upm_find(io_res.start, &fun->upm);
>  	if (ret) {
>  		dev_err(&ofdev->dev, "can't find UPM\n");
> -		goto err1;
> +		return ret;
>  	}
>  
>  	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-addr-offset",
>  			       &size);
>  	if (!prop || size != sizeof(uint32_t)) {
>  		dev_err(&ofdev->dev, "can't get UPM address offset\n");
> -		ret = -EINVAL;
> -		goto err1;
> +		return -EINVAL;
>  	}
>  	fun->upm_addr_offset = *prop;
>  
>  	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-cmd-offset", &size);
>  	if (!prop || size != sizeof(uint32_t)) {
>  		dev_err(&ofdev->dev, "can't get UPM command offset\n");
> -		ret = -EINVAL;
> -		goto err1;
> +		return -EINVAL;
>  	}
>  	fun->upm_cmd_offset = *prop;
>  
> @@ -244,7 +242,7 @@ static int fun_probe(struct platform_device *ofdev)
>  		fun->mchip_count = size / sizeof(uint32_t);
>  		if (fun->mchip_count >= NAND_MAX_CHIPS) {
>  			dev_err(&ofdev->dev, "too much multiple chips\n");
> -			goto err1;
> +			return -EINVAL;
>  		}
>  		for (i = 0; i < fun->mchip_count; i++)
>  			fun->mchip_offsets[i] = be32_to_cpu(prop[i]);
> @@ -306,8 +304,6 @@ static int fun_probe(struct platform_device *ofdev)
>  			break;
>  		gpio_free(fun->rnb_gpio[i]);
>  	}
> -err1:
> -	kfree(fun);
>  
>  	return ret;
>  }
> @@ -330,8 +326,6 @@ static int fun_remove(struct platform_device *ofdev)
>  		gpio_free(fun->rnb_gpio[i]);
>  	}
>  
> -	kfree(fun);
> -
>  	return 0;
>  }
>  
