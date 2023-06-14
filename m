Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CAB7308E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 22:00:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Z3Kv/Cn6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhGWS1xTMz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 06:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Z3Kv/Cn6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::614; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhGVV3YrSz30P7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 06:00:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvalseU25Sv2hULHSOE2o5UcktVRFxV2QQo9+mB8oQrPVnunuimI6wCiEJ+Sjm21BU5/JXM45m8NExWOeln1TIesD38vJWsXyGQw2zPkaButZCU/29uj21wyfsqj2NL6759TNnMFwpjCxA7b7wjRcTqYo3122V078iRE9FaITU9kOQKXIzXTETh4T2hkPcI3ma0H5tRtvT14sT07KawjJAF0wyC4uv0kWjLiR/qp0RYx89a1uucHPEan+Kn9wa7JzGMoMnUH4C4AQKlaGWJGlgKHuwCPdWZ6nEhnwnhajaYOjCjufTvCtkEAtrxh6eHQyq4mar+b2pitq1GbadGpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFC0K0wpsDVH2e+Q2JJzF79DZUD85zMAoA86MbRC+sk=;
 b=jwRNOnhUQOthzC1tu/NaTLAw2FF2CRgAQlX5X8OX8DlO8B/zHyYOtonIraYbz5ZXHxsm+LHMFlS3P0DWMLlLoyPSDqDth1CRhbCUpSxWBf9KYwugL4AfYW3ZxDI6pI5Keppz4ZNIApiC3rKkjPqEFQ511OfK3Q4y98sZeqgVjU+CNUH7bTKhRS3aIyAAChrsPC20dAZJzkhrCDJzaPAe7bQPkJfE8s7FVfsTqJ1ejgcEVho4bRdfaJZfB8zEKHVcA9wT4NxniAzYAvpDmb3V5NWb4rynzQJywRX/O5i+JoQsQZS7SgZltHsUCoU3C0lHotgfcoVNSqOsRMFk/nUB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFC0K0wpsDVH2e+Q2JJzF79DZUD85zMAoA86MbRC+sk=;
 b=Z3Kv/Cn684YOyDJxyh7BtoSiUaCY8ed7NnrIMdO/2ZVAXf1PkmkO1n8ryanN1RLBZ2OzQNHumFIcd6/AMJr4wiRdmgjJ6LbgGnwnDcgGMbUOnaOPLiE0B1yQrpw1ypk14RF33Hs8AFj4LXotJ3gCWzC6H5jZ7EEX9rwV/T2PKbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 19:59:36 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6477.035; Wed, 14 Jun 2023
 19:59:36 +0000
Date: Wed, 14 Jun 2023 15:59:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: manivannan.sadhasivam@linaro.org, Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] PCI: layerscape: Add the endpoint linkup notifier
 support
Message-ID: <ZIocGZfj2T4Wvpeq@lizhi-Precision-Tower-5810>
References: <20230515151049.2797105-1-Frank.Li@nxp.com>
 <ZIdEBXH5AztZ/jz5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIdEBXH5AztZ/jz5@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d076545-7c42-4801-c575-08db6d11e124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Aaqyi7Dr1ZJfRoj1p+9Q8m/qQb9ZdNnbXqqXf2v2JOkrg0SwQsNXfMSasNVYOsu6/yHGX2VpzlaffF4rvRs6NS7YW+Lc8VUJD6LryQoc18n0G5cIoFWVgWiJsQEOjE6x+78W7cBRSWUlUfJqyuEPFgF6TCRqAlur0CinGXmXbgXWb15FS064wiOE6ISK+hVRE8cB3XJUvh4RLw9JlohiwxQyFLBe+eJpsos4DZrc0J3Li+vPnc2sjZupfiYnqjGVKJjeGKh8X+C8tGH7nc+2YiHyfor/yKY9tXD1QRsYiBDk//2aYPwn5wqc4EBf+AIbnxo1zRfuFf41oi/O9Dre9axDYTRING2kfe7zsVG0boRRMa3Hmx1yysSMyDzgRGlpzC9vIPaSXzvq/snIGHns5v5ydWXFZK6FA5dtcM2IjM3/1BnzB3vbjIu4xeJUii+Y9LGW8Cqdi8MkbdmQvedm93MvlgpZM670LN1vkVOSa94piETpwHDQG94WczpiEFtiOmioYxVKYR2vjAV3PulFHPySt+qdiOs5woQ0jdK/Dj99NjvoP/5E6Y2VqAOcWFDvgR14TYlr5k3VbOVC++r4ShayDxNgPetA9j1aQTju3V9tQkJBH6PiE4Gc4gGPh+rM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(52116002)(6486002)(6666004)(478600001)(186003)(9686003)(26005)(6512007)(66476007)(8676002)(8936002)(6506007)(41300700001)(4326008)(316002)(5660300002)(66946007)(110136005)(7416002)(66556008)(921005)(38100700002)(38350700002)(2906002)(86362001)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bNVkvlcFsPy9+1Ul804pnS2hcsxQ83wJYuBs3bBeDHgjNEmCAb7jnT94Gjdi?=
 =?us-ascii?Q?Ir2Hocp8aio5Ymq3wZWYRAZobHWIXWstj2JLbN5ydZrrrCMRTRGrWotvBb9p?=
 =?us-ascii?Q?uXWyAWId9IIEBxIvD1b9GP4GmgdezJ2xj37fpwqFoGwXHdBJe1xa5t+SgP4v?=
 =?us-ascii?Q?cLiSFrPej+cuEXqmK7qhvRm+xygnmkIcVC+mjKzMSAsaXW9j64nNWsCYgJBm?=
 =?us-ascii?Q?DHhh6EFaqShtB4OWMfBDMOdpxhT4xXbb13M57DGFv2EW1n3sMLx6zhX4KcbJ?=
 =?us-ascii?Q?s8HG3Hn7+erKyQkWDVirWAI5WTz45qHO6SWyl0DfRZgvDKCgO2ABlN34ig/f?=
 =?us-ascii?Q?RnPAAMR+FmD3GEHWpoKCJsUS1waoeSI4bUJcipm8/8ox0o3GrwtEeLuCGaKy?=
 =?us-ascii?Q?kwR+NIDZBjsJwz0BnPs6bQ28QIpfPN6u4RyXYIGdOFoPSOot+PzP4cg12x77?=
 =?us-ascii?Q?SSbQ4AfreFxC8+R9c/JrfUqdg5YVS8rb4hmZnrlRlfrA/y6/OEGaZoeRuy+a?=
 =?us-ascii?Q?hAYAmXZbqEJ1BR1y50mJ2emeMDN9I/ugLaeJ+i/CA2/tLeOX2UABOBAWwL3z?=
 =?us-ascii?Q?1Z7GsIjDPiblclWFmsGo9qD8rNoBqYTrS10D3SMJBlvDGDTvKM+JUnW9a0gz?=
 =?us-ascii?Q?oLszcapp5kzRhhqnWYtc4hgsIEcdunUvno3S1Phhebzej8ExaBHey1Ig4boN?=
 =?us-ascii?Q?se/JpcM4n5x8DL+6Bfp4WIb4MVuTz9o5drJq2NNQUkdhIbslRx/IojZTVJ8V?=
 =?us-ascii?Q?e/nWbMzLG5IoX/xXwmPmWyHCB1aP+gf3Mj3pejwjTavKMkk9YVRIy0DC4tuq?=
 =?us-ascii?Q?Az/to/KmY8I3f6Wny8/di5VJ7ZCubvqHxvbveG9+bk6/H7usrxnhhGpSuKuO?=
 =?us-ascii?Q?/m4H5ATepM2yCC5IngwbyL3FOVvEuseq3FCSoGHY0wYdD8QCRwavLp5FLVaM?=
 =?us-ascii?Q?pON2nIf359ee3yVhvNS++hl3oZ6pQOnPF9PPn74z6v13jfR6/rAWwc+a8JaO?=
 =?us-ascii?Q?8w4t9ch1MIaZx0L7sEwVCxp1R5aW4lr69ruOeKZ9VcOZyRxyRpsP9/G8VG44?=
 =?us-ascii?Q?HGKdaQDdO9S3hHeoQRNZrt3ev37FJ3Koaut3RQ7h8h83HY+xMnjRlGdAwPMT?=
 =?us-ascii?Q?c60i3zEds/7/uZlJ2RAmwBoqobFC5QoExP8oAsXIT8dZrfXMPdve4nYpYRcw?=
 =?us-ascii?Q?2viGBd2GAtt3ZWbnZPChH08LikfZbNxWoxShC7stBYAM2YaVyDJBJMDyH+jH?=
 =?us-ascii?Q?hTF4JtBW8QNbX5M067pNZ0/AOhdCdBkmieCj+6yC9L5Jq1cITtHqN1lVzuPf?=
 =?us-ascii?Q?fqKfXp50egTZJrMmso4xq4NFn/l+d/JRiymkV/6+DoLPZdaud+cmqUC4Jzet?=
 =?us-ascii?Q?5KqrQy/PlRF5qy0SLeVEkudcINlJW8LG9jDRR1WEigQZeoFLVIeYNMqz6FDv?=
 =?us-ascii?Q?kT9QWwsPG6p0UvDPkf4WU32DsCAWW2DstSQ7IvTBmJlrJY4FqdHGZ6Oisupw?=
 =?us-ascii?Q?6LHvySxNxYrZJDoWaie88LDF6YweIj0JMgqNUCYENzls2S+EJacrfOeCf6wK?=
 =?us-ascii?Q?5MI1cC3JwWYeEpJYg5Z6abniwvHJeL3op/wBJ5ts?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d076545-7c42-4801-c575-08db6d11e124
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 19:59:36.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fu0mYgWAbwQEtezru0eGQRwNJZn8hPFmpK8yWXLuqd+TrlVKeuZnQJH1tMrTDhQZJ0MeNU1R2bWzL5WTvDUm5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794
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

On Mon, Jun 12, 2023 at 12:12:53PM -0400, Frank Li wrote:
> On Mon, May 15, 2023 at 11:10:49AM -0400, Frank Li wrote:
> > Layerscape has PME interrupt, which can be used as linkup notifier.
> > Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
> > when linkup detected.
> > 
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Ping, not comments almost over 1 months.

@lorenzo and @Bjorn

Could you please pick this patch? This just added a linkup notification for
layerscape platform and there are not futher comments over 1 months.

Frank

> 
> > Change from v3 to v4
> >  - swap irq and big_endian
> > Change from v2 to v3
> >  - align 80 column
> >  - clear irq firstly
> >  - dev_info to dev_dbg
> >  - remove double space
> >  - update commit message
> > 
> > Change from v1 to v2
> > - pme -> PME
> > - irq -> IRQ
> > - update dev_info message according to Bjorn's suggestion
> > 
> >  .../pci/controller/dwc/pci-layerscape-ep.c    | 102 +++++++++++++++++-
> >  1 file changed, 101 insertions(+), 1 deletion(-)
> > 
> > 
