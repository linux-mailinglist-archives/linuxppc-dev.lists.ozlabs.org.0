Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E31ED31A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 17:13:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cXVF0n1nzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:13:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.230;
 helo=relay10.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVv91QSnzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 00:01:24 +1000 (AEST)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 07A2D24001B;
 Wed,  3 Jun 2020 14:01:18 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:01:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 07/10] mtd: rawnand: fsl_upm: Inherit from nand_controller
Message-ID: <20200603160117.5693606b@xps13>
In-Reply-To: <20200603134922.1352340-8-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
 <20200603134922.1352340-8-boris.brezillon@collabora.com>
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
2020 15:49:19 +0200:

> Explicitly inherit from nand_controller instead of relying on the
> nand_chip.legacy.dummy_controller field.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/mtd/nand/raw/fsl_upm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
> index 977b7aad419b..9a63e36825d8 100644
> --- a/drivers/mtd/nand/raw/fsl_upm.c
> +++ b/drivers/mtd/nand/raw/fsl_upm.c
> @@ -24,6 +24,7 @@
>  #define FSL_UPM_WAIT_WRITE_BUFFER 0x4
>  
>  struct fsl_upm_nand {
> +	struct nand_controller base;
>  	struct device *dev;
>  	struct nand_chip chip;
>  	int last_ctrl;
> @@ -167,6 +168,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	if (!fun->rnb_gpio[0])
>  		fun->chip.legacy.dev_ready = fun_chip_ready;
>  
> +	fun->chip.controller = &fun->base;
>  	mtd->dev.parent = fun->dev;
>  
>  	flash_np = of_get_next_child(upm_np, NULL);
> @@ -268,6 +270,7 @@ static int fun_probe(struct platform_device *ofdev)
>  		fun->wait_flags = FSL_UPM_WAIT_RUN_PATTERN |
>  				  FSL_UPM_WAIT_WRITE_BYTE;
>  
> +	nand_controller_init(&fun->base);
>  	fun->dev = &ofdev->dev;
>  	fun->last_ctrl = NAND_CLE;
>  

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
