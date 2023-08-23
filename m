Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E7785CBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 17:56:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ud3omr+f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW9mt45hqz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 01:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ud3omr+f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::61c; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW9lx1BkQz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:55:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n//EGD7fIrms0L95Z3hjfzwxHbrivsHVNdVTkFTfXhvdegMdMU0097DvE7eqgv4u6sp9x4bWclJRKqsEs9xPb796DRiqIn7pXkNUtBo8DZw1E48lp9eXp6VgTMbKdX1IiCLSVc9fxOKHEEE3uImh56QwioR6sijM7hbG3bF2q985omv2T+VqiWfc3sXk9WMriMqJXBSojUWNF4vIN/DERnIxZYWbXwAcCcDwiWAjE2VAJ+EA0UDXx/drq4N+4lO3pXUGzo8omMSmfv/d99osTU1t/+C1r92TDxgUurRiW4ZOeQYqmhc23CEhaFRysS6jCzO6RiwYtQI4ftHpjCVvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7cqALBoNOCAC0Pki1wWYxrdiNMkFeprv5j0EuLtgA0=;
 b=EeGA4ARxhD3I30oxrHxOfpXfx4xvMNPsJpP89EthFoSexH1xgX5jGhQ/CRib5LkjxIoIRxHOhvsh24R/gDWhLozqmk9SXwhsP1omN8nrJINuYbgT+kQTqkI/sHvQepb0FlaUAbc0BGP1w3Y+NUOje1F5/En4hvBXfxfxQNvvw9qweW3mjmCG+ATFYK8IERtmehSr0jkEJ60uLtX05QTAjjmLz/L7KQuyJ2bvrTobZiHjuyrFcLte8aSxe2SBvIPGIyypcGuZs3eujw8l1wA2NY+brt6PSPNS/+tnZ4dkMBa/EAcDsaCAY3M9AFp0eYyCzDrFBJ5DGS7hFIvniyvZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7cqALBoNOCAC0Pki1wWYxrdiNMkFeprv5j0EuLtgA0=;
 b=Ud3omr+foB6eNTogHEU0GLVQ9d3XhAiccd13n5AScGjWMR2VLc50aCO8fzK4zVWqhsvoDu61+iDObxbsH8dhkyKBy+lf24+YKY4hozIBd04YE9s09js256hrc2lNRn+V4BY6IdsWRbfbQYeO27CmvomvkK+GU5/xINu6cVJsa6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7585.eurprd04.prod.outlook.com (2603:10a6:20b:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 15:55:00 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::a680:2943:82d1:6aa8]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::a680:2943:82d1:6aa8%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 15:54:59 +0000
Date: Wed, 23 Aug 2023 11:54:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: lpieralisi@kernel.org
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down
 notification
Message-ID: <ZOYrxLKZohhGIMUC@lizhi-Precision-Tower-5810>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
 <ZMfN9w6ixBFBmof7@lizhi-Precision-Tower-5810>
 <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 298f9590-ce5e-4881-e317-08dba3f14de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	a6ISXdcNp8DS6OPBMSPb53X+o+7MM8qSNADf2GYLy58q1r/dAI9f4I2bhc1jj4orXJziW7nkpVcc1/s3/l7bdz54otRArVdsU64A3NH1azqSMucPgu66rEMdVBI44SFSIyBytXc85LyrCjSIn1xh8106ymtVo/eR1UquNqlSLG8U54+hfXNFafP+pF149qyQaHT90qq+X/Z0wzPNR0b75GFuc/Hw1tpebYbVNkIn/m9q2QYDlGjHa7vbkKd+dfMyHqVrV9jdepLd/oUeUGHXeFk86oYX2HsA2tCaI1eiar/flZTaFUZ4Hlmh+b/rpWEqUTeVWSfAGnvEgE3wXr4kOP9zBi/cQW8aCELZ38/oRN3KUTThJfINy8wgxSi/RGOtreXLGIQ446nqiWg2VOaLae9unnpTN0/eewoCHi1tIIsGGUM2S/orh+grnHcz0CDt0Bx1GIZ2jMX9j0EKK0A6A0VsJlPNqe7jN83uZOWtYPiReCtfBVUnp0TUuHiVLIWc72fD/EdAhrVBu8nZRHF22tMbv5vmkKv2533d11CpAFT22K9yF72+MZvj1XRI6cOQWrjow4799IVbmTw8QtsxkM1EgtFFNljpLIVBViBmlscZwXwBv9R/xUNmTWudTclu
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(396003)(376002)(346002)(366004)(186009)(451199024)(1800799009)(6486002)(6506007)(316002)(6916009)(52116002)(4326008)(8936002)(8676002)(66946007)(66476007)(66556008)(41300700001)(9686003)(6512007)(26005)(7416002)(5660300002)(6666004)(478600001)(83380400001)(15650500001)(33716001)(86362001)(2906002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?aS4qXx6okHM58k4+Bmg3O+FN6xI5nBdn76WCTwsUUc7D4I7cLZAu+SzAQM3i?=
 =?us-ascii?Q?qy+eoKBjSnOSFbd7uP1U/qGVcHaYUvO9kC1N0e8IKQ4kT1prrmXT9AYa82PX?=
 =?us-ascii?Q?LwAfz/6fC+/8B5DNC24ki7PxtXvk5PT6nFMLPeGlWLGGrl9F6ofmgJylXxMk?=
 =?us-ascii?Q?S8WkFj69znpQ3Kr3K6EVyj2BaK191ZLBO9FikMXnWhfkPnMJnHUsvCiNz4TQ?=
 =?us-ascii?Q?3DWOHla4gxLABPrqU4sdVX75XwXGXyLRHTMLsj/mI2B651ha6Fs6UOXKgNEC?=
 =?us-ascii?Q?uLvqlFqz6mK51ykEibeaXWAKs//vjPUH+/zWHZ7naxv6vpZ3ztDnWiVsGqEy?=
 =?us-ascii?Q?bwkw9AQyz7uzzubgCSDLGGiGA1bcnpFxDBLBJN7HAHU78r8l70+x1YGcxvr1?=
 =?us-ascii?Q?16QjZTIrQXqXALG47cvLQQRXDp9g1SsxbzIiEPUXs/M8vTvsEzuXwFaYQLVY?=
 =?us-ascii?Q?9J/UPyi0OFLI5ObIEoocHW9xvUhUHnmTsU0JdFA/b+SocjmkOik9esuh2PtS?=
 =?us-ascii?Q?/Ou+7QxESMpgC1Q9S0ZZVtDE9hvMZ7QJtaNCxliZJyTWeqrvhugfpYY2b5Ae?=
 =?us-ascii?Q?y5IK+HOV1JK2VaJktDnfemBP1oc3l8KW0//ro2N4W0U8H2ZZGmaSPVkGrH7h?=
 =?us-ascii?Q?o/Vd+huwZqw5cUlBbbYg6zZZ7uWv88Wr7qBCxWkG1xJmzrZDSlmhpEeRymW/?=
 =?us-ascii?Q?8XuO3kGxdeAHoJE624A/taM3dpFEHt9ZLpL76KzzMNQTYLQhLPVldQOA/1Pc?=
 =?us-ascii?Q?eTuUJGeWvy80dSecyVy2NfqT892dK876kHwvVe+UDa8RbkAk4ciMJmAyc/M9?=
 =?us-ascii?Q?YEWgR5cal9mPABiQkZbV+aATDA9UGoISgPrVUIT8mlumLX8sRnLLufoiTTfD?=
 =?us-ascii?Q?FozFGU7TuMtdBlfpJyoP1quNB/PS4EMBihGchCrBhmyo3FTEjanWHuilzm9J?=
 =?us-ascii?Q?5AAJjJ6eA94D+q3dnuQzb17NYShT1TldAxksZ7qt6Yn35N9TPXFwTP5N8+Bk?=
 =?us-ascii?Q?ffUObb4byLFLhkGe2Al1YCDukJpzSYwRClmrCPxhkWgbLiA8pxQgm0GpEF5S?=
 =?us-ascii?Q?LyBfGpLRoFdqHK06nBe6lMbA3nh58dWptxu1GOmMAXhC9CpAJB8d1dU1h7O3?=
 =?us-ascii?Q?EXbaGmLhYvXcgGurJhx7BAxP1D0sp9Dz6T0B5zjb9L7qg0uJRjmUGOxTZopI?=
 =?us-ascii?Q?9T0HMeHtohbIUwQKCgraZLWfLmHicFRR9jFPOn/YAk9AmG1Xb6ZpL79/B35G?=
 =?us-ascii?Q?vIl+O8Lo2EQtajrPykco4EubZNHs87WzTyTOCxLcgcDlebRezxnuhkbe/LQs?=
 =?us-ascii?Q?j2PaL6awcjE3211fJc1Bk6ngpltXJ8iKGVEaf/FoJMg9n1X28EiVQ0f2dotp?=
 =?us-ascii?Q?rzyF2Fkjy+gQaG9UMtiSH1uBsM+ItjSgFo71D0J9yZYF8/aV7JXV6314CxTW?=
 =?us-ascii?Q?kR6hZKb6CwmZ2WFyqos9/EwRRSDCL7u12T5k3RUTGN0/oXMSuewy3SDJx+5t?=
 =?us-ascii?Q?6RcC9cJgXv4ZYAERs7EigaKcoqAOKvV4sp/AegG7mEF0whQP0VR5QDMc272Y?=
 =?us-ascii?Q?Phj7r2GvPwyX+373cNY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298f9590-ce5e-4881-e317-08dba3f14de0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:54:59.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJUvnMxTLg0zcCHTd23nhJDyx2WLeIt3cHEXXrhwRJr3ZI7I5BbqLnhuH+U793IW9XH0ajwA3Eb5M17zNdHowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7585
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, markus.elfring@web.de, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 16, 2023 at 11:53:16AM -0400, Frank Li wrote:
> On Mon, Jul 31, 2023 at 11:06:31AM -0400, Frank Li wrote:
> > On Thu, Jul 20, 2023 at 09:58:33AM -0400, Frank Li wrote:
> > > Add support to pass Link down notification to Endpoint function driver
> > > so that the LINK_DOWN event can be processed by the function.
> > > 
> > > Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > @Lorenzo
> > 
> > Could you please consider pick both patches?
> > Manivannan already reviewed and only impact layerscape.
> 
> @lorenzo:
> 	ping
> 
> > 
> > Frank

@lorenzo
	ping

Frank

> > 
> > > Change from v2 to v4
> > >  - none
> > > Change from v1 to v2
> > > 
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index de4c1758a6c3..e0969ff2ddf7 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> > >  		dev_dbg(pci->dev, "Link up\n");
> > >  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
> > >  		dev_dbg(pci->dev, "Link down\n");
> > > +		pci_epc_linkdown(pci->ep.epc);
> > >  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
> > >  		dev_dbg(pci->dev, "Hot reset\n");
> > >  	}
> > > -- 
> > > 2.34.1
> > > 
