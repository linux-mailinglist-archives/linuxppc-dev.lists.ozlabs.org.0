Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D23558F43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 05:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTjhz6cxJz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 13:46:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=efnQomoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTjhP3lNgz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 13:45:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=efnQomoy;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTjhG6JmXz4xLT;
	Fri, 24 Jun 2022 13:45:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656042352;
	bh=jsJtu4Y1FevocKQtZ83HwdxQgj/3jIDOnuOhO6d0A4M=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=efnQomoyNOVf34yD78w1/H3qBpxmMJeipKtJDM7625+CP6zoTc2kgIZUGyOkgENgF
	 0NvJgzlPYw2EoP2iYyHNZUVgG08H1hJuhK95SEit2+V07ydUnAybDeCvJTyuNnw0gq
	 US7luJgCk49BhYyV+t2kaZRQ+A0omPxe7t2+d2rLgRA2+TYJGKbuGQaRxZEBp3uJXz
	 6pcJRuKc9esYHn4X/JpfXx8Mo2VkbovKon/sAkogB4/Dmjs49RWjh4ry9DiPLz+U+n
	 a4nLYpKJiMIzEJlOYx0fY1GS12R5qoAk6D2K4jyQ7KYLll+LARldyy+uPM8W2fu2nr
	 SJ3607SLzosOQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org,
 oss@buserror.net, chzigotzky@xenosoft.de, robh@kernel.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org, Shawn Guo
 <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host
 mode.
In-Reply-To: <20220621230941.381f9791@Cyrus.lan>
References: <20220621230941.381f9791@Cyrus.lan>
Date: Fri, 24 Jun 2022 13:45:44 +1000
Message-ID: <874k0a67x3.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Darren Stevens <darren@stevens-zone.net> writes:
> In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.
>
> Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)
> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

It looks like this driver is used on some arm/arm64 boards:

  $ git grep -l fsl-usb2-dr arch/arm*/boot/dts
  arch/arm/boot/dts/ls1021a.dtsi
  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi

Which is for the "Layerscape-1012A family SoC".

Have we heard of any bug reports from users of those boards? Is it wired
up differently or otherwise immune to the problem?

I've added the Layerscape maintainers to Cc.

cheers

> diff --git a/drivers/usb/host/fsl-mph-dr-of.c
> b/drivers/usb/host/fsl-mph-dr-of.c index 44a7e58..766e4ab 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -80,8 +80,6 @@ static struct platform_device
> *fsl_usb2_device_register( const char *name, int id)
>  {
>  	struct platform_device *pdev;
> -	const struct resource *res = ofdev->resource;
> -	unsigned int num = ofdev->num_resources;
>  	int retval;
>  
>  	pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,8 @@ static struct platform_device
> *fsl_usb2_device_register( if (retval)
>  		goto error;
>  
> -	if (num) {
> -		retval = platform_device_add_resources(pdev, res, num);
> -		if (retval)
> -			goto error;
> -	}
> +	pdev->dev.of_node = ofdev->dev.of_node;
> +	pdev->dev.of_node_reused = true;
>  
>  	retval = platform_device_add(pdev);
>  	if (retval)
