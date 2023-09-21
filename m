Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443A7A98FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 20:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=R/GMDO51;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs3Ky0Jm5z3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 04:08:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=R/GMDO51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.15; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs3K10bFHz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 04:07:30 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id jNxxqrngYWkeLjNxxqqZsH; Thu, 21 Sep 2023 19:59:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1695319197;
	bh=Jy4yrl1sGF1TARfomG4wY5m/s9IFzHDGcTcBivxyLOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R/GMDO51rXJCXspAXvO6D8ktPA7l4Cx6HvaJdkZ8Jib3GXRDdbTES4LcpDgC1K7Gy
	 iVPWNtSbjmHKqo27fko5suLlO8XEsvvqR8vaHgFl1siAMZXjb9QQoN8SrACQCN+Uka
	 06feaIThbzixPjiv5gEQRKcrFxrB2KKFpsHzVwLuknGXDvGzlM5QOV4MMEUqXpv+Ix
	 pqPRGgCm+XTHqccjHWC1VD7YP3EMA+C9eIudi8SxwJTcm4tg/XUDvFhFLqPmM5hzxV
	 Z4pT92e+AY0LLgp0kFM3cmzinTsjrtqbsVTq9WpXRMnJS9d540YGM62kakloKgds/A
	 3oaNWLWsLoWFQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 21 Sep 2023 19:59:57 +0200
X-ME-IP: 86.243.2.178
Message-ID: <925da248-f582-6dd5-57ab-0fadc4e84f9e@wanadoo.fr>
Date: Thu, 21 Sep 2023 19:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] PCI: layerscape-ep: set 64-bit DMA mask
To: Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
 "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230921153702.3281289-1-Frank.Li@nxp.com>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230921153702.3281289-1-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/09/2023 à 17:37, Frank Li a écrit :
> From: Guanhua Gao <guanhua.gao@nxp.com>
> 
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> 
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index de4c1758a6c33..6fd0dea38a32c 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>   
>   	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>   
> +	/* set 64-bit DMA mask and coherent DMA mask */
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> +		if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32)))

As stated in [1], dma_set_mask() with a 64-bit mask will never
fail if dev->dma_mask is non-NULL.

So, if it fails, the 32 bits case will also fail for the same reason.
There is no need for the 2nd test.


See [1] for Christoph Hellwig comment about it.

CJ


[1]: https://lkml.org/lkml/2021/6/7/398

> +			return -EIO;
> +
>   	platform_set_drvdata(pdev, pcie);
>   
>   	ret = dw_pcie_ep_init(&pci->ep);

