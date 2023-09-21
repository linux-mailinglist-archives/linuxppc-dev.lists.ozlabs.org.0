Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BC7AA45E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=QJmJXdMW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs8dR3yFqz3btq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=QJmJXdMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::61f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs8cW6PRsz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:06:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeYm0Xm1PNWKWzxEzGeo1jVSY1K8GTVuZaxvwOni4Na4WS206QZ/KVtoaPcHkcw283ovW5K8S5uGyBGKzOgr/JMtIS92hgv3c3+KvuSbkYQAMFG/lBZCABfalqDweTvOvT/nI8Da4AwZPYSS6ljlxRoatWyj+392N9d//JMhKf0cAM4592okjtGUjkKtVBe9eGAlo9NXXPz0CVG3502spyQk/aYbKow0E1ik2DHloHpxUj8pRsJyXYspfAZRWkiO6KHI0RLAb82kyKxhUSkHSxV1x48LJwGrZXXQ0Bw+27c3TJ+zNjl/1mkJKOUq42Zudx42atDmoy6z9lhSvCVaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLgIsHXv7kHX58g0x7DAvnY9dv97IrMJaCgdiBqHV94=;
 b=U+LSn34YGnso3eUUroARwxDZ05V0IKHqHIehGt9E9s7KIHg2wZJxlB8R4BtvdhDqVSp2Hgk4ZobhbyFIYNDj70sLetTRk6t4cfn6oG/2bCb9kHC5lPQruN3+YhNu7Qxuw2yB68UoTvqWJldjPMI1cJYnq7RJCisEqJgtFyhyQsla1rcRcda1Tt5AMAFK9w3bn4/uwGLMzfqyB8y8I2gzgFXtacNTwv+/kc3RsPdI+SqP0EIrcQnbjiwsNpyQZgcjrToTrMAQXWMHmAsU5HFXoplX/nsbR/hLgXFPXbc84KNF0E+5jbePXIXuoKqCmq+VAKdsEzz6IF5E4HQ+c3pRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLgIsHXv7kHX58g0x7DAvnY9dv97IrMJaCgdiBqHV94=;
 b=QJmJXdMWaMaZROJdASK/0jypDBeNkLliYYY3c521f6z2ypJjY0H2L6Xq58Umt17twHglLqIzY4H8QjrhMGfA0UNqit/mzpFadOwznhN9riLTJS5Tr5nCRVNobwfVdKX9/2jgl/aRMWUr/HjAuZhvfX6ttcaPEuNWk+2Qtx9Y4pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 22:05:55 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 22:05:55 +0000
Date: Thu, 21 Sep 2023 18:05:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZQy+ORjAR3nhUpQB@lizhi-Precision-Tower-5810>
References: <20230921153702.3281289-1-Frank.Li@nxp.com>
 <925da248-f582-6dd5-57ab-0fadc4e84f9e@wanadoo.fr>
 <ZQyM+9uxFoX5TgPa@lizhi-Precision-Tower-5810>
 <c6f07289-2e69-fab4-32dc-46fe5e5713e7@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6f07289-2e69-fab4-32dc-46fe5e5713e7@wanadoo.fr>
X-ClientProxiedBy: PH8PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::6) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 915de401-b5a8-482e-ce6e-08dbbaeeed5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yStd1Fqy5Mot/4LZneeidFaQCShHWGGXW/0A3iO20kLR1hm8GHZwXPkDt9MhwXS7AyfSnoGA8TFfWQoK4hP1qnrFUIwKT9tHoEFsm7hb4bKmEOyiDqMQeVQl2cRIWI8dDhW3Qd8S1fw4SR5fkdcqV9KQpVNo60yX/q2HD1l/VJDQDKV0ux+tmL0O9Inba73v+mTwE4geReZ0bwSiUV9IP12APNymcq702z3SwL/kdhbCWLWwFFbM2hFVjaZ0Dhz0NKZBgpk2AU0TfrIFwT5eOrqZZq7IgKoqzD7XfR/CwXMyXAC9Fnq5L+7AHPxkIgmyogeQm6uS/DZiUloOfYy3Kn6WvBd7xCpkB5AssbpWjyUZG0p6fpxNTcMUigtAMO5JlZ+y3EVsIOd1STrb3uWjtd415YjJyk2UwbiCyreEK/YFFN3KZlQbY97XUaWLc1W3oTAywfTUfiBKZYkS5w823G1rKn2Lv/MrnmYyGT5vb0b85mQVbAFXsWKLJFsnQSHLESbrvYZiuP43MP7tehgYdgqs8VUq+1H6+EarixNZGtz+PypxIrSp6+kqJiQvfAxZ5wYIDYyCHR+dP4RD4JNssXacuQdlhI5xS4DnQ/5ebe5GuqjZxcC30G+/wsaz2Zy+
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(39860400002)(376002)(346002)(366004)(186009)(1800799009)(451199024)(966005)(52116002)(6486002)(6506007)(6666004)(478600001)(9686003)(7416002)(38350700002)(83380400001)(66574015)(26005)(4326008)(2906002)(8676002)(54906003)(41300700001)(66946007)(33716001)(6512007)(5660300002)(316002)(6916009)(8936002)(66556008)(66476007)(86362001)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?rklgurMOdg8Yuk5kbQ9EGb54oDo8orRwIFbA09XyVhXemG/Xqm1dSEikCF?=
 =?iso-8859-1?Q?5/RRESIEN86+OLq98X7oZm5jx5VxdLWsfTGJh6b6rjkiTg+SfYJA9vAB24?=
 =?iso-8859-1?Q?QBmIMcPOmGQ6ilxPGR3qzT7FC3zX+y2efl6q5SVuwxt6moCUN5AkpWbaQb?=
 =?iso-8859-1?Q?JlESrcSg/7sFC7XtqaY+9jljbaPpq14PbZwWZ83rEuxY2glftrAQt6ZEBB?=
 =?iso-8859-1?Q?1OTrT+SPQLFCCHJBxvTyfwTMvMjVloeL2d8YXUF8iZAm4X6iR7KiSCIIrb?=
 =?iso-8859-1?Q?wNQWTAmhhjLE/5AZzRxBjj3tJ+xbSXV/sCCcZmu0Hx4Qj9oFYyuoZ2Iq49?=
 =?iso-8859-1?Q?Oh456eFOimsqWL4Qs2arRSMnoPY0V9Bio6weZIlaH3Fk4it3IWvCw2Yv1j?=
 =?iso-8859-1?Q?P5ankc+ZoY7UOoPQeFoD5Sg6c4lQmuWc6svsS6RXqQiGcVRKBOPkJHW/rW?=
 =?iso-8859-1?Q?yiQPs9+PS9hxX0U03AsY5HBwrNFc0hZTj0TwAthKilYvhMfHWmVh/AVxBy?=
 =?iso-8859-1?Q?ZhOgjVhOTplYjWqOgRXLUrrwDR8YW1YYHH6f7nLRrl0i8mTi7pEeazykSO?=
 =?iso-8859-1?Q?aNRHMIWZ2+q0SuYgJqNbOL0K610BQnNIupE/DC9BZzbI1/H+ThWQB4nWGu?=
 =?iso-8859-1?Q?gl9LNhrqDCtkMNZnVPAeDRXMAC+JiEWd7vaKcRP1//rx7c/mVymoVVwwYj?=
 =?iso-8859-1?Q?U9wq19twxqoAt3va8ohNA3/Nxo7BHmJwmyckBh5L0M0UT2OyyHWdFb+kwJ?=
 =?iso-8859-1?Q?7ycusl7szPwKtj2CbYF4X8V3Zpri8fHallMf23XUA9VfkANq6QZPB8I3UD?=
 =?iso-8859-1?Q?b1Buy7VZtYQNEaNDB9ucKQF+yea07BZXQbtKD/klcjin8AwL8V6nl/KZFc?=
 =?iso-8859-1?Q?T4nTYoFivte69QsG9Q03gzBD1AQDnlw9S7Yxw3toHjOcKrvmm71H3c+kID?=
 =?iso-8859-1?Q?nygWyP/4UZ7dc5j2TpuZq14vOBcJg44hOzOZ7YY2U2nvR1B0rNMsMh3btH?=
 =?iso-8859-1?Q?wRyAL5g1nCvW1CJl27mt91ac4MJsuWBjmmWTuIFVGrx8i1eG3CJjRemA4x?=
 =?iso-8859-1?Q?RXgZfoCBOJmuF/DJR+30OK/NNyuJzZ7jaaPWCEvTb/3pz4lt0QaGydZ//z?=
 =?iso-8859-1?Q?oY44RPGDUpUFuJafw6A5pkR+3tGY5Y69ch1ZsIP8MHrANU9+HfHC6XHNba?=
 =?iso-8859-1?Q?hNFJFMqXfUZ0brS4czNKB4klZx/Tpgqo0XFf5zex8wk/Vnr8B67U7ys1Gf?=
 =?iso-8859-1?Q?N2A1+xLrypmhddH/At+a8GXHmiVzON8RffqwhsutbxePooffRl8SIGY1j3?=
 =?iso-8859-1?Q?VDFiIbrgn2HFXYqVYBW4jb2qfAdEKaB5bgaSrJNwdyponyyF7BgbX8Mppp?=
 =?iso-8859-1?Q?xePLZEGH3sabYu0zgZNIh3VZlsVo8YKxYCzkPpOfptJvURkWxfOuB/gt/1?=
 =?iso-8859-1?Q?HAtbF9zumOLp3GhoCh4AnHnd6ZWuTSswnEAXAbUAH69CE9YIPlIwQcq62m?=
 =?iso-8859-1?Q?xZ6yHtvsfrYsxB4SXevPwP+Ut8iD6eq1+iDoQ14aUnlJTAVhWRiYy5BnYn?=
 =?iso-8859-1?Q?bpjqBJFR1jWZvvqPLSYy9wgY/e08reofj2Co2B5PrWjUj8fm8KFno7Xm4p?=
 =?iso-8859-1?Q?B8aMdr4oZkv6QQsyO18SQf7toOGKzO9Shw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915de401-b5a8-482e-ce6e-08dbbaeeed5d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 22:05:55.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKZRyF4hpTTepdgOxcixJGHZm0I2sezsTJcoBgBD00YrNjkKzV6DfC7gmS2nCl/sgEhPRoSII5FYDbwNNLMP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, imx@lists.linux.dev, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 10:04:31PM +0200, Christophe JAILLET wrote:
> Le 21/09/2023 à 20:35, Frank Li a écrit :
> > On Thu, Sep 21, 2023 at 07:59:51PM +0200, Christophe JAILLET wrote:
> > > Le 21/09/2023 à 17:37, Frank Li a écrit :
> > > > From: Guanhua Gao <guanhua.gao@nxp.com>
> > > > 
> > > > Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> > > > 
> > > > Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> > > > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >    drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
> > > >    1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > index de4c1758a6c33..6fd0dea38a32c 100644
> > > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > @@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> > > >    	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
> > > > +	/* set 64-bit DMA mask and coherent DMA mask */
> > > > +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> > > > +		if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32)))
> > > 
> > > As stated in [1], dma_set_mask() with a 64-bit mask will never
> > > fail if dev->dma_mask is non-NULL.
> > > 
> > > So, if it fails, the 32 bits case will also fail for the same reason.
> > > There is no need for the 2nd test.
> > > 
> > > 
> > > See [1] for Christoph Hellwig comment about it.
> > 
> > I don't think it is true. the below is dma_set_mask()'s implementation
> 
> I'll try to recollect a more detailled explanation from Christoph.
> 
> I also checked all paths some times ago, and the conclusion was that if
> dma_set_mask(64) failed, dma_set_mask(32) would fail for the exact same
> reasons.
> 
> I'll try to find the corresponding mail and come back to you.

I go through iommu driver and code carefully. You are right.
The dma_supported() actual means iommu require minimized dma capatiblity.

It is quite miss leading. There are many codes in driver like these pattern. 

A example: 
static int sba_dma_supported( struct device *dev, u64 mask)()
{
	...
	 * check if mask is >= than the current max IO Virt Address                                 
         * The max IO Virt address will *always* < 30 bits.                                         
         */                                                                                         
        return((int)(mask >= (ioc->ibase - 1 +                                                      
                        (ioc->pdir_size / sizeof(u64) * IOVP_SIZE) )));
	...
}

1 means supported. 0 means unsupported. 

So dma_set_mask(64) is enough. Let me send new patch.

Frank


> 
> I don't thing that implementation details have changed since that times, so
> the conclusion should still be valid.
> 
> Adding Christoph in cc, if he wants to give another look at it, or if he
> beats me finding the 1 or 2 years old mails.
> 
> CJ
> 
> > 
> > int dma_set_mask(struct device *dev, u64 mask)
> > {
> > 	/*
> > 	 * Truncate the mask to the actually supported dma_addr_t width to
> > 	 * avoid generating unsupportable addresses.
> > 	 */
> > 	mask = (dma_addr_t)mask;
> > 
> > 	if (!dev->dma_mask || !dma_supported(dev, mask))
> > 				^^^^^^^
> > 		return -EIO;
> > 
> > 	arch_dma_set_mask(dev, mask);
> > 	*dev->dma_mask = mask;
> > 	return 0;
> > }
> > 
> > dma_supported() may return failiure.
> > 
> > static int dma_supported(struct device *dev, u64 mask)
> > {
> > 	const struct dma_map_ops *ops = get_dma_ops(dev);
> > 
> > 	/*
> > 	 * ->dma_supported sets the bypass flag, so we must always call
> > 	 * into the method here unless the device is truly direct mapped.
> > 	 */
> > 	if (!ops)
> > 		return dma_direct_supported(dev, mask);
> > 	if (!ops->dma_supported)
> > 		return 1;
> > 	return ops->dma_supported(dev, mask);
> >                      ^^^^^^
> > 			DMA driver or IOMMU driver may return failure.
> > }
> > 
> > Frank
> > 
> > > 
> > > CJ
> > > 
> > > 
> > > [1]: https://lkml.org/lkml/2021/6/7/398
> > > 
> > > > +			return -EIO;
> > > > +
> > > >    	platform_set_drvdata(pdev, pcie);
> > > >    	ret = dw_pcie_ep_init(&pci->ep);
> > > 
> > 
> 
