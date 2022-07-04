Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093135652F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc2vd2rcQz3c1x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=eVA+r2uM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=eVA+r2uM;
	dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc2v06QSNz303t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:02:04 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 22F3822175;
	Mon,  4 Jul 2022 13:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1656932510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQ6ksug+BFKh++5Gf6JtccDKmV45FwkQCtJw+Ho6+7I=;
	b=eVA+r2uMcnvEZrknZFnpGoaqFS7xi/I6Av9OEWnpK2O887FU9x7Ylu6qfgvtZWUU1Izn/T
	n+VJwLAm1ebGB7vcIenlScVEcS+yqAX0YwoHEz4fExBqOi3Vv/LztU90HwpDIwTVemU5I7
	LrVur+PGovBjzewrn5IToAoJVC5JmK0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Jul 2022 13:01:46 +0200
From: Michael Walle <michael@walle.cc>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] soc: fsl: guts: fix IS_ERR() vs NULL bug
In-Reply-To: <YsLHCE/ttyl/OeHs@kili>
References: <YsLHCE/ttyl/OeHs@kili>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9d3033f1ddaa224a792849fdf952587f@walle.cc>
X-Sender: michael@walle.cc
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
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2022-07-04 12:55, schrieb Dan Carpenter:
> The of_iomap() function returns NULL on failure, it never returns
> error pointers.
> 
> Fixes: ab4988d6a393 ("soc: fsl: guts: embed fsl_guts_get_svr() in 
> probe()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/guts.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 27035de062f8..8038c599ad83 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -195,9 +195,9 @@ static int __init fsl_guts_init(void)
>  	soc_data = match->data;
> 
>  	regs = of_iomap(np, 0);
> -	if (IS_ERR(regs)) {
> +	if (!regs) {
>  		of_node_put(np);
> -		return PTR_ERR(regs);
> +		return -ENOMEM;
>  	}
> 
>  	little_endian = of_property_read_bool(np, "little-endian");

There was already a patch for this:
https://lore.kernel.org/lkml/20220628140249.1073809-1-yangyingliang@huawei.com/

-michael
