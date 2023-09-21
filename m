Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2D7A9A2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 20:37:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bfb9xwk2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs3z46BvFz3cc9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 04:37:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bfb9xwk2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::622; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs3y82V5Zz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 04:36:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVO+HWLShYNGQUHhIsR1WS6wvT3mleY9fi6ynuyKjdpboJqphBKX0NvNxYriuHTKgwnl/VU8Lz3DS4lnnXn4EgTZHDIm5kOMLuFICv/4Az94hj3WsnD16E/1B/Lq2ekEHLawe4gwlUcTL39nTDbiOsCLSuvAVlhLe3pBh1XQr6xaV9CP+sEAMBphvModRtkfD9tZRWXDf5e7A3a+X2ZcGUHgkDpK+x9jK+uvbi9alFIRHASCUrfKAvdBvXgxTt7tAuuPe6YCykDQL52Z5NfIgvsGnoEeqxQFb7duycFJ0HDb5Qrt+XMQZLnm3nJanfY7F5SlDsWaRCmUdKlGeGFtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DynwwEOL73OehDW+iTf2aX1o3zuFWul6RwC0NbRtdlc=;
 b=FHe0Wm5fayx+g3l5eBP8dky9qOOkaQJW5w/DvFKWtteO1QhlQOZjR8FabpFmwaFZRsG7VSzaZ2nkPxnZfRtD6QYTstf5hQpP7eGRo/oivQkbCaNscMYLd4noTW+invVMoFCoPdIe+LYoYkmM1V/sv2yXV2O+znhFmm1WK7jqUe/paxwns87FzpgLzHI479VxiNwVNhI6TCGD2NigT3sDfvEmweOJjTl79fwWMsrL23C78saIzWEWVBKaOEwR+NnqxAqCxi5QgbDcQMLESeLKdnmAAkBUCdc2HQkXjrMoj/78NwXvaPhYxzvcf8BEQ8ORcMVwM9sBKfoghzHGEDjmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DynwwEOL73OehDW+iTf2aX1o3zuFWul6RwC0NbRtdlc=;
 b=bfb9xwk2WBQkVxFYQpI1ygcd4/48nS0qkicL42bGL6Lsnt2mHlUexbOwOSAwyNuJhHRbNuX/P1ejenDjLB0ABwq3x0H7G9N0Q99PV538X4Gywgf93xvZGmkTHFUo8aSrtc96WvPSFsEfNUtHzOvgX9VFqVGja9IwPtTiAmqpDD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 18:35:49 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 18:35:49 +0000
Date: Thu, 21 Sep 2023 14:35:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZQyM+9uxFoX5TgPa@lizhi-Precision-Tower-5810>
References: <20230921153702.3281289-1-Frank.Li@nxp.com>
 <925da248-f582-6dd5-57ab-0fadc4e84f9e@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <925da248-f582-6dd5-57ab-0fadc4e84f9e@wanadoo.fr>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e5d6fd-6923-4ddc-f0a6-08dbbad19399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tzzH++hdmy9ZuqTzKtwiAenmr4Oe0DjgKARv1LEDRHg6KQ3ci+hi3D8crowLbbai+i2fRtJct/64Lx3MdrYos/Aj2w6PSfUbDB/BeR4fm0bidI5XNKzrzWiHR2V+BqVvgfKWYNfWMyTJOJKy0YuGelR+7SgyYqeyHR8Qo7mLTVX08oYYKfh7ZjeC9teA5WnCclIXUnChdp6EnhuAHlGzsHHD0gjQ076bjSrqZfw5ipJooWUn2DHjwO8qGtUgJQgKD+NOJCHmiSkkniHgK7QSsXSLRUxGGVfYl78N93IQSBhlEeOXHrM/weiqnwXSpYFZNDZBfqJD2rt5OKcuRthISejyEy39+bkR2FBezIxjaUHjqgvnDhJ65/AWmgzUIIjiZ85cJ0yqG67EggRkz0cDYuluV8l5by56lr0yEP9DKhNKUzASqCK9DbhWSOhCIQDtKtw+vzq7vOK0hh/oktwslDfqQcKUsp8lMQ68iXda5zt9uU7RgqrwIU2QcuIPSOPp4nQX1BqhTvwh3u5ajs+gvTui6q2J/3cXlzONm6Uh3jYLmTTEX3HgpPBGvQdx18MALgMxmsyQ6lI9kjW2xmn+gnHONu5OFplFAjBPjyaB4yJEWUWCOctu8OM83Fd2oNKc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(1800799009)(186009)(451199024)(52116002)(9686003)(6506007)(6512007)(38350700002)(38100700002)(66946007)(86362001)(478600001)(6666004)(966005)(6486002)(66574015)(26005)(66476007)(66556008)(5660300002)(4326008)(7416002)(8676002)(6916009)(316002)(8936002)(54906003)(41300700001)(2906002)(33716001)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?2mIjHa/uWwnNH2AUKMw3i0uNej2NWFJwg5K+MFybI9rQfGAD7miDyraLMl?=
 =?iso-8859-1?Q?1rNIqwYZzb1ot1ezDHmxxC9RK7la7csyuSgImDP51zNO2jUUQyTEha5Noq?=
 =?iso-8859-1?Q?iARtVhQ2vy0YKcnUkJnH+qTKj7uHYYsAy/EJCA5C0/XD0bdRyD3Y9gKndG?=
 =?iso-8859-1?Q?OdsJlX32iAn9pHAbRZoLLvxUc9vbjOt713TuMeGkMLYHXubU15oWl3+OQA?=
 =?iso-8859-1?Q?IsmF7vWO3wFsqWE5diwlB1dSZf83xQcM7olGSAyXZs4sflmx4KUxCzUnTX?=
 =?iso-8859-1?Q?awsXInO8CZ7Yd8GnJYR4ax8zOkA9FnMfrDSyvx1E3EkD5LFU9FdCBktWi8?=
 =?iso-8859-1?Q?l6WTPn/ripsNCDYIyAdzu6HmbO8871moQgrZ9OEyxrdFlL9TvqEf6q2Aej?=
 =?iso-8859-1?Q?AxvpwfggzMl3Bqr8vGiPhEXkkrG2NND2xNPfubVihc/mjG9pz2QK6JHRJW?=
 =?iso-8859-1?Q?mLdKygPoSgJRP8UdFG3xJmUbz5ThvpGHQKQLLPbtxWcUiw/o4qcQgDNI9+?=
 =?iso-8859-1?Q?9h/9vP5mzgPYSLZAe6goSbHnVggXp43dSqcwKt+WsymbnrHUAKJA2r3+hE?=
 =?iso-8859-1?Q?SiuzeNVKknLWtJS8vuvyOl7d153q0AnViyyQGLr5Bs+GOQBhvA+AR3HYO+?=
 =?iso-8859-1?Q?1HXqDHYWfV0jg0QDPvOco4fkHGPv7cDfdp/L9EtNnpym3EDJYOwpCLVBU8?=
 =?iso-8859-1?Q?FtF+VyehkipWBXHva0OV94fCvfzkI0WJPPQ+k6CShQH6XazBedM/S/j9a5?=
 =?iso-8859-1?Q?ornqYNVa0A4jXUrgNxzfFI+mt5Hnb6b+nMzSbrZn4nT+GPBWN+UdEnKHQ/?=
 =?iso-8859-1?Q?ZUG5xqRhpwejlFki8g49rHXH0OnldDaekLP+lXpUDQYlwZJnpUoec8W/on?=
 =?iso-8859-1?Q?vC4krC+LQNAqJc79/2ERovowwBBQQzn+w9DKOU5Obne31nXDUVS8lfdh3M?=
 =?iso-8859-1?Q?AioOhYLUdsC3L1bo9XwhSjWxfL92/JK527vS4ics+RmeL0ZQ1ATCcZItNL?=
 =?iso-8859-1?Q?0ULe6y253FC8X7bSxJ86VbWax0SxsLJ4pJMBmbD3Alki7558qed5VxbZsT?=
 =?iso-8859-1?Q?+wf5RLQ0UAR088hhv3MJr+VmF7FBH/ZPSLfwBOItL6MzkAQuvApdTSEMwq?=
 =?iso-8859-1?Q?QtKUnzN9EVMxRQLBVrw/RpCVnexdMwh1q0K5PAefYllPBHMphCpO1jX5yY?=
 =?iso-8859-1?Q?X5CnmxCWGuYs9QvzVtW81Pv9bfKBj/vUrrJfGMmefN8IB0XZ2tz7u0JDPI?=
 =?iso-8859-1?Q?4MblQf2IZeESPqdTgGbtr1Jv4KETabFp3IpbQ1m1s1dNKyYNkQWevVF8mT?=
 =?iso-8859-1?Q?5bdv5xyppNvzXtPyVKnbBPGSdZjivqOLl2nUvR0FqYmUjzhUzDUekM7NlY?=
 =?iso-8859-1?Q?yN+DUNejYrYI48kcdcDy/M1FylcaJmMjkARMlb8cweOBPLok8jba9r8Odx?=
 =?iso-8859-1?Q?6l9epuiRzauxtXqNfd7UbT1Nrg+uq5MT9K7WyjyK1dTZ5CApBUR27l7w0j?=
 =?iso-8859-1?Q?3S9mTHSPDOO4BVK1NiFErK9x/A/wDcCASkrUgGM+v0/u4YeGUtoGE9rK2K?=
 =?iso-8859-1?Q?N8oTjcNMHkjqI+FQ/y0IqNOSYGI0IHnRC2r8NKOoGcXB8D92EVj7iM7yVT?=
 =?iso-8859-1?Q?BZ5q6sdQUxCxQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e5d6fd-6923-4ddc-f0a6-08dbbad19399
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 18:35:49.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72YoimipLbMh5m7f5rP2i/CtGopX03zF7XlporivROQ22Qi6qFCWvDU2ybzPaXdjWoxIT9ZxXmRwoQhoEP1Yjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 07:59:51PM +0200, Christophe JAILLET wrote:
> Le 21/09/2023 à 17:37, Frank Li a écrit :
> > From: Guanhua Gao <guanhua.gao@nxp.com>
> > 
> > Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> > 
> > Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > index de4c1758a6c33..6fd0dea38a32c 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >   	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
> > +	/* set 64-bit DMA mask and coherent DMA mask */
> > +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> > +		if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32)))
> 
> As stated in [1], dma_set_mask() with a 64-bit mask will never
> fail if dev->dma_mask is non-NULL.
> 
> So, if it fails, the 32 bits case will also fail for the same reason.
> There is no need for the 2nd test.
> 
> 
> See [1] for Christoph Hellwig comment about it.

I don't think it is true. the below is dma_set_mask()'s implementation

int dma_set_mask(struct device *dev, u64 mask)
{
	/*
	 * Truncate the mask to the actually supported dma_addr_t width to
	 * avoid generating unsupportable addresses.
	 */
	mask = (dma_addr_t)mask;

	if (!dev->dma_mask || !dma_supported(dev, mask))
				^^^^^^^
		return -EIO;

	arch_dma_set_mask(dev, mask);
	*dev->dma_mask = mask;
	return 0;
}

dma_supported() may return failiure.

static int dma_supported(struct device *dev, u64 mask)
{
	const struct dma_map_ops *ops = get_dma_ops(dev);

	/*
	 * ->dma_supported sets the bypass flag, so we must always call
	 * into the method here unless the device is truly direct mapped.
	 */
	if (!ops)
		return dma_direct_supported(dev, mask);
	if (!ops->dma_supported)
		return 1;
	return ops->dma_supported(dev, mask);
                    ^^^^^^
			DMA driver or IOMMU driver may return failure.
}

 
Frank

> 
> CJ
> 
> 
> [1]: https://lkml.org/lkml/2021/6/7/398
> 
> > +			return -EIO;
> > +
> >   	platform_set_drvdata(pdev, pcie);
> >   	ret = dw_pcie_ep_init(&pci->ep);
> 
