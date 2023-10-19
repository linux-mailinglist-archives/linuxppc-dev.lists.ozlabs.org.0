Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B06E7CED60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 03:17:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ny8MUdWr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9qZ82LZZz3dL4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 12:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ny8MUdWr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9qYJ4KDSz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 12:16:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697678180;
	bh=WTKHc8k9e1k6oAAPlUBGsSr/qDu6nL0+e9yR3HjsIXg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ny8MUdWrEpt3TzloqlcGQqFJYCMsZ4sf0+wb6FT6ZSNOiyOm4g2stVOaUGv5kOHVX
	 92Rq1E1i/BHe8Sxu5IW58UUUa8AUzvhLIXp1SMrBpNdrnf8UueVkh3sqovpG+KmROQ
	 IkGfQEeZIHn6VpeGAW41aiyZt+Babb9/fsj1T2WKXg0FI9Oe+0xlV548QbuyTphxKK
	 qhADApyQs+K5LuznQnTIdQCdqkFWFh7dnptAXppmIeuQUg9P6B1ary1lmHWejIkFh2
	 MT2eBMBvUEyoKDwuJDEv2teZMFTqO4MMZcGha0lMacLiwco9hPCP7ctYzJqFeyOpfx
	 rEd4K9jxJJM1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9qYF6B7Hz4xZm;
	Thu, 19 Oct 2023 12:16:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yi Yang <yiyang13@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, u.kleine-koenig@pengutronix.de,
 tudor.ambarus@linaro.org, robh@kernel.org
Subject: Re: [PATCH] mtd: powernv_flash: check return value of devm_kasprintf()
In-Reply-To: <20231018092728.315071-1-yiyang13@huawei.com>
References: <20231018092728.315071-1-yiyang13@huawei.com>
Date: Thu, 19 Oct 2023 12:16:17 +1100
Message-ID: <874jin76ou.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yi Yang <yiyang13@huawei.com> writes:
> The devm_kasprintf() returns a pointer to dynamically allocated memory.
> that will return NULL when allocate failed.
> Fix it by check return value of devm_kasprintf().
>
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index 66044f4f5bad..b305e555ddbf 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
>  	 * get them
>  	 */
>  	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
> +	if (mtd->name) {

That seems like the wrong check?

cheers

> +		dev_err(dev, "failed to allocate mtd->name\n");
> +		return -ENOMEM;
> +	}
>  	mtd->type = MTD_NORFLASH;
>  	mtd->flags = MTD_WRITEABLE;
>  	mtd->size = size;
> -- 
> 2.25.1
