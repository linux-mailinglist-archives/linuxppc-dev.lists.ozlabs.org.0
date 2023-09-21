Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C77A9ED1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 22:12:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=VycdaZQ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs65g2brNz3ccB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 06:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=VycdaZQ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.16; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs64n4SRXz3cKc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 06:12:06 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id jPuaqsc4hWkeLjPuaqqtyH; Thu, 21 Sep 2023 22:04:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1695326674;
	bh=pgVovfgULLuIhHghHoiORjK2SMAEHL0Uj/DD3vZku1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VycdaZQ+0TA5bG9VG8uVWgoDY5dWp3W3qbrI62siiyl3WzJ/IKbczu2rVGt82EpBD
	 8Bfc7RkJQB5nZKYY2kJDkqjhG1sEjfcTxKjpv4+ei1yeRaK0D3dbiIeIt1ZiJqCGF7
	 dAyXxtK02y1SFHlgx7tqV0AKykLGPo7tdc+fPcGyhop1kOEU7837rN3UjXjyB4QPmm
	 E7vfhv1T7y9azS+yHgvTHnb11jY1esCHDK798pxwRoUjs5RNsSbkQfxS+Puc3cRfjy
	 r2lTWgCTF8ysgh8MxiqwjQG8nR0aF9V9wENah4iyLRXsP43db8WWpz3kS0YLLid20P
	 5dB93JYy3cRRg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 21 Sep 2023 22:04:34 +0200
X-ME-IP: 86.243.2.178
Message-ID: <c6f07289-2e69-fab4-32dc-46fe5e5713e7@wanadoo.fr>
Date: Thu, 21 Sep 2023 22:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Content-Language: fr
To: Frank Li <Frank.li@nxp.com>
References: <20230921153702.3281289-1-Frank.Li@nxp.com>
 <925da248-f582-6dd5-57ab-0fadc4e84f9e@wanadoo.fr>
 <ZQyM+9uxFoX5TgPa@lizhi-Precision-Tower-5810>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZQyM+9uxFoX5TgPa@lizhi-Precision-Tower-5810>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, imx@lists.linux.dev, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/09/2023 à 20:35, Frank Li a écrit :
> On Thu, Sep 21, 2023 at 07:59:51PM +0200, Christophe JAILLET wrote:
>> Le 21/09/2023 à 17:37, Frank Li a écrit :
>>> From: Guanhua Gao <guanhua.gao@nxp.com>
>>>
>>> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
>>>
>>> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
>>> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> index de4c1758a6c33..6fd0dea38a32c 100644
>>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>>> @@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>>>    	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>>> +	/* set 64-bit DMA mask and coherent DMA mask */
>>> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
>>> +		if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32)))
>>
>> As stated in [1], dma_set_mask() with a 64-bit mask will never
>> fail if dev->dma_mask is non-NULL.
>>
>> So, if it fails, the 32 bits case will also fail for the same reason.
>> There is no need for the 2nd test.
>>
>>
>> See [1] for Christoph Hellwig comment about it.
> 
> I don't think it is true. the below is dma_set_mask()'s implementation

I'll try to recollect a more detailled explanation from Christoph.

I also checked all paths some times ago, and the conclusion was that if 
dma_set_mask(64) failed, dma_set_mask(32) would fail for the exact same 
reasons.

I'll try to find the corresponding mail and come back to you.

I don't thing that implementation details have changed since that times, 
so the conclusion should still be valid.

Adding Christoph in cc, if he wants to give another look at it, or if he 
beats me finding the 1 or 2 years old mails.

CJ

> 
> int dma_set_mask(struct device *dev, u64 mask)
> {
> 	/*
> 	 * Truncate the mask to the actually supported dma_addr_t width to
> 	 * avoid generating unsupportable addresses.
> 	 */
> 	mask = (dma_addr_t)mask;
> 
> 	if (!dev->dma_mask || !dma_supported(dev, mask))
> 				^^^^^^^
> 		return -EIO;
> 
> 	arch_dma_set_mask(dev, mask);
> 	*dev->dma_mask = mask;
> 	return 0;
> }
> 
> dma_supported() may return failiure.
> 
> static int dma_supported(struct device *dev, u64 mask)
> {
> 	const struct dma_map_ops *ops = get_dma_ops(dev);
> 
> 	/*
> 	 * ->dma_supported sets the bypass flag, so we must always call
> 	 * into the method here unless the device is truly direct mapped.
> 	 */
> 	if (!ops)
> 		return dma_direct_supported(dev, mask);
> 	if (!ops->dma_supported)
> 		return 1;
> 	return ops->dma_supported(dev, mask);
>                      ^^^^^^
> 			DMA driver or IOMMU driver may return failure.
> }
> 
>   
> Frank
> 
>>
>> CJ
>>
>>
>> [1]: https://lkml.org/lkml/2021/6/7/398
>>
>>> +			return -EIO;
>>> +
>>>    	platform_set_drvdata(pdev, pcie);
>>>    	ret = dw_pcie_ep_init(&pci->ep);
>>
> 

