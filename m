Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE317566F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 16:59:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UMeMQkIC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4QG14ZW1z2ynD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UMeMQkIC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::617; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4QF76zQjz2yGJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 00:58:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1MicFwIW9zJA+bZHjiUXZ3ne09+M4N/XAfqKybttlgLYgNEYny0YNSDPieGTaHg6Za4UdLrykzTvX4ngPH0ZdnBRqIGD3tXK51L9ZAiNnwIMHReHYnzusNvIFNsG46gFQLoxJRHMPNJDhi4aZPjG9MzfSBsBwdpBVXzODDYynXUAFX3nErlGY7nL75fm17Jhac4drxSwFEqvh9ZbgiuRcAAvt4RM4npLgf8Jtlt9ebs5WOUC/UFQIZdPvKE2Sh9D0yKo5p7HogCMWa1LfxO2bVaEAKl074zzknGmEAbGSTNKK5RLZK7pyynwAOqx0p8BIDlRDXDQy1lmxRygI5G3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9LEHGFTwmRLbQqqsyHdq9bnzJ1Q3Hu4ZC5s9tBIlB4=;
 b=IZfi95kTuQKf5dp5fqTy/Iej7kABHBwWFyCpNlmo2b/HNh3OPflYXwECe9w6P+DUXsNiuvMDcHJaBeqbMdLxFRghehObMzaMday6GpPeAHCDMFtY0XkvtRgDOY3HgHx+2hBYP77EKNvRO/sWlKvkUJKv6Vn8yh9jznIC8uKeXfXI8psd+LDume9+9Pi+5kJC+Y2RV0Q3wBhxTPv1w9zl66QJHjkElFwuRU9yaqTMxsurLwbSXalAjF6GDbNCFf9ZVsORpY9YuBBd+hoTs8uIIxLQuYKMo+fKoX4BgRXHVw+WV5jmX/Ps18aFEWK25SCd3CCJhi1oY/Ho4bQQ/IkIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9LEHGFTwmRLbQqqsyHdq9bnzJ1Q3Hu4ZC5s9tBIlB4=;
 b=UMeMQkICxVVQ2/tJ+WLCFdmPhWiLr90tsBS5IIp4rKRCwcQ8pC9JPHVP1eSMSvGcITMVehtd+L5U3PLk0LZkNta0GQvdq+HSMNb+3Z3AxE1Aw0ZThHMyGjiSMPn0WX2WxDsnPa3QxVQuCQ/t2EKibVqXZQEevihOcDUJRwZPzz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 14:57:57 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:57:57 +0000
Date: Mon, 17 Jul 2023 10:57:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Message-ID: <ZLVW6OotFdesx+wG@lizhi-Precision-Tower-5810>
References: <20230615164113.2270698-1-Frank.Li@nxp.com>
 <20230615164113.2270698-2-Frank.Li@nxp.com>
 <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7ac133-a5ef-496c-d9ab-08db86d634d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0jW9lJRc6Kiga/xlXOy4qDSVQxuNwhdRGOdaavfvAdaDGaPEQ40vGK01XOvOiMLYYsIDCpgf/py9L6BO8+Ue3VhakChpMq8VQOFpvlvJ7zwQeku5j+4q2HhrVlBBYeibir8xqm1aSdLRQT+8NmrXivm3EK27gCtC9pdIfKiH6QXkZTudneQpFw4CDuxTAKYQ484hpQqM4BapdlnDLv1eIe6lVh4Lp29H59ou9+N4fb0L685bz0QPh+SQGu5rCGFR6CIQAwuQN2PjMaPlCDaZxSWMEQQcHA5hL1HDz+waZwbzbELe93SWBfvaJo0I08X4R/jzqyqPKyQZUCrmWJIRvNBJK/Gu1Clqip8p0aiYcM+zNCkaPrDBBPLhCxdGOZg0DGXS+bdrkEG0tideOXR68v3Nd44lTTLbjHVZ+PnA2NrnoZ7Vds7SvV9D6n1h+aPgkfT/Lsf4XXHJ/CAt1rTNaucB0OmCO2kL7yjb/S3e3kqX1yS6cjlSk8gM2STbxQA8r6fwcPbREx1h292fQaT2oHXzrw2pOm0eCdkhmKughirYCQxVoW/B2F4KzFJm8/GzCZgq3sJD9HiyyBKeAqrUrbif6CRVQd8vZ1TGOsMxP0zG9jxzrtxHcyJYzpfBk0Gb2aB6cgfmRyBmcWGw2oaW4A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(478600001)(6486002)(52116002)(6666004)(54906003)(6506007)(53546011)(186003)(2906002)(9686003)(6512007)(26005)(33716001)(316002)(41300700001)(4326008)(6916009)(66946007)(7416002)(8676002)(5660300002)(8936002)(66476007)(38350700002)(38100700002)(66556008)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dEtmUWwwOGhNcmJXYUpneTFHRlowSmJlSEJoOHZ6alZld2JJM0xtRE5jT1pU?=
 =?utf-8?B?RHBBaHAxQ2dYUU5QUThMc2lrUWZwbDlqWGFzZGxOR1k5K3lMcXVYNkp3bEdk?=
 =?utf-8?B?VGNPQk5jdnRCQVluR0dHWTZhNzQ2dUlPUUpsVVpSK2tQNDFNaWp1eitZb3JR?=
 =?utf-8?B?NEx6RndqY1o3TFlFSEJaTTlrSDl2N1o0dTBZaWpWK0tMclV4OHhQdkM5bXhn?=
 =?utf-8?B?bW5nR1ZwaUFPY1N0TWNwQlJuZGhBc2tDcFNPck1nNEY4TEcyb1pYVmRzcTR3?=
 =?utf-8?B?Nk1WWEZ4NEVkYjFDdDdDdUNtQ1FDRktFa1lVM2U1dFlUQUhMcTFXaVdnSWdJ?=
 =?utf-8?B?dFFKVTR0ZTlDK05KbXE4U2NYZFlBUitXV0NvcEswOTIwZllncVYrMW1wTTlT?=
 =?utf-8?B?czl1M2F5T014VDFVQzJxOWF4MVFVNlBoZmp5UlVDVVMrd1N0MWttbDBsb1JK?=
 =?utf-8?B?SlhKT1ZNOWR1ZXFQM05EU01JcHduZ0ZlK0tuSnBaU241NUROWVhrRi9xRWlG?=
 =?utf-8?B?SHZOYTRxcU5SY2NSVlR3eko5aGhOeTg3WExKRkw0cnhlY3FPSS9hVk4xak5v?=
 =?utf-8?B?eTN6RFNSb3VtYXhPSitIdEU2Tm90WjJleFdGbUFmZVhMTGpDMGxwUEJWYlVx?=
 =?utf-8?B?QmVPcHRIMHlJdWxySCtDT1RscVFzd2E1YVhRVUo1dE9kMVFrZUFNOFQ0TGxa?=
 =?utf-8?B?dTlzT3BURGJ3WEQ3TmI2WUg2UklZVzRGZkE3SENoMGc5cWpVMUFHMGlQYmpF?=
 =?utf-8?B?SzRYUmoyNkVCeEZmR0JXclc4bTE5R2Y2K09BS3k4Q3ZxR3BCWWNVNGdNMWx6?=
 =?utf-8?B?ZTJYSjlPNnJrNkEvb2ozUFQ5RnE4dXU4MlY5b3NEVXFDbFpTbU1TRUFIek1K?=
 =?utf-8?B?M1crOWFmQzEzMkhab0F1aURoTkdWcDNhek5KSVJEd0NJVHUxWmYxRy9CdDIr?=
 =?utf-8?B?VitiTEQxQ0FCeHJRL1V1MVNZUlQzcWZGbWNnbWVuMEltQnhvRGRjWk1CcitF?=
 =?utf-8?B?K1dXNGxhd2xNSnpjeXJTdWNJUnJqWFM4OWovZ21obXZxSy9FcVVsR3BWY3VC?=
 =?utf-8?B?Z1NOOWVZR2FjbGRnVlAvbkR4dTlZQzdUN202WTBtWjkyai9kczljZTQwdHNV?=
 =?utf-8?B?c2RNbGVXVmMzV1JicVBlUlZUN3R2OE1GU0RoKzNVTENzai9Mc2dLU3FIUkwx?=
 =?utf-8?B?Vm43eS9YZUJXSjd1UVZCVUQvSVlZek9sTExweVJsMTRUVFVFNXpNZ2h1UGhj?=
 =?utf-8?B?MXpRUVlDcDFLWEZ0SmlIdUZZR3NqZTl1ZVpQKzJyYWZoZTBSTGtTRDJBR3Qx?=
 =?utf-8?B?SjZ6TWlrTThvc00rcEQzWjZCRFNvdGhhTzYwdlhTN0tZRnBUZThWM3duM2Rk?=
 =?utf-8?B?WFNic1NjUTQ3bHBQdUVrQzRHR2FId1JlVjczd1Zvb1NFdkExMGd2QlhXdVNL?=
 =?utf-8?B?bEhnSWlFQUpaOW1aSFIybXRpQXdacE1yOVk1anlybTBzTzF5TTZ6Y2RRb0Fw?=
 =?utf-8?B?SEhwWlY1dUxmY1FyZENlVmgrcWZ3L2xHSG5QeFY0ZUxaMzlac3lqcjJISDFz?=
 =?utf-8?B?OERnUitYaFZ3eHNqTkRYSFZYSit4Z3dLT2FzRUdUbWlrMWpzQjhnN2g1VzBG?=
 =?utf-8?B?eHpvVHR6ZEtkSmN1ZFdEWElvVUJDMUZvYUxHMmZQaUFmdFZpS1ZpZWZ2blJm?=
 =?utf-8?B?bTNHR3ZyNUtENE1obmtQMjE5SlZHSDlIeDJmeE5JaEhicWRrSmpHRytvMUND?=
 =?utf-8?B?cEN6czg3a20vUXZ0Z1hvUVh0OSt3dXFsZERDNnhHOE5vZTluUHRmU3JvMExT?=
 =?utf-8?B?MVplZmFoRVFTQ1hGK28vM3dKMHFxQnpHaDliTS9ic3NMYXBJNmtsc0JrQmRk?=
 =?utf-8?B?VUdyRE9DSnFSWTBwUks5WXpqTUlOdFBtaHFYSFk2bmhuTzdRdXRZZVdKd1hM?=
 =?utf-8?B?YnRwck5QWnROQVVDbXdUWU5jd3FDeVVMUWpqaTNpaTVlcENDeFhnZ0Y0c3RQ?=
 =?utf-8?B?QVdWMGFzRHdaVThiYzU0aFgwcDhiMmFReUtMMWVGamxuZUhWK1JOcllMNlJR?=
 =?utf-8?B?NkhRRStWQzJQQ0tDa2FNTkx2ZHY4NUVrVmdhU0htd1Awdm5Obk5ydVkzNFht?=
 =?utf-8?Q?ZWbsY4KDMgjY05sWSKwzNoYc0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7ac133-a5ef-496c-d9ab-08db86d634d7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:57:57.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dmh2nLw6VQerQnU/sVmx+jZA0kR/7ijRypNJrAty/JV7PqzOohMSlXciiFAaAxOjW6k29pz+RHdFhUiTN3zI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Roy Zang <roy.zang@nxp.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, mani@kernel.org, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 08:45:14AM -0600, Rob Herring wrote:
> On Thu, Jun 15, 2023 at 10:41 AM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> >
> > A workaround for the issue where the PCI Express Endpoint (EP) controller
> > loses the values of the Maximum Link Width and Supported Link Speed from
> > the Link Capabilities Register, which initially configured by the Reset
> > Configuration Word (RCW) during a link-down or hot reset event.
> 
> What makes this Layerscape specific? Seems like something internal to DWC.

layerscape designed behavor is that LINK speed and width controled by RCW.
But design have been 'defect' when switch to dwc controller, may not
correct connect some wire. So provide an errata, ask software recover such
information when link up/down to align design spec.

For example, RCW config max link is 2lan, after link down/up, DWC reset
to max link to 4lan. So host side get a report, max link is 4 lan. 

It will not impact function, just information miss matched.

Frank

> 
> >
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > index 4e4fdd1dfea7..2ef02d827eeb 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -45,6 +45,7 @@ struct ls_pcie_ep {
> >         struct pci_epc_features         *ls_epc;
> >         const struct ls_pcie_ep_drvdata *drvdata;
> >         int                             irq;
> > +       u32                             lnkcap;
> >         bool                            big_endian;
> >  };
> >
> > @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> >         struct ls_pcie_ep *pcie = dev_id;
> >         struct dw_pcie *pci = pcie->pci;
> >         u32 val, cfg;
> > +       u8 offset;
> >
> >         val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> >         ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> > @@ -81,6 +83,13 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> >                 return IRQ_NONE;
> >
> >         if (val & PEX_PF0_PME_MES_DR_LUD) {
> > +
> > +               offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +
> > +               dw_pcie_dbi_ro_wr_en(pci);
> > +               dw_pcie_writew_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
> > +               dw_pcie_dbi_ro_wr_dis(pci);
> > +
> >                 cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
> >                 cfg |= PEX_PF0_CFG_READY;
> >                 ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> > @@ -216,6 +225,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >         struct ls_pcie_ep *pcie;
> >         struct pci_epc_features *ls_epc;
> >         struct resource *dbi_base;
> > +       u8 offset;
> >         int ret;
> >
> >         pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > @@ -252,6 +262,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >
> >         platform_set_drvdata(pdev, pcie);
> >
> > +       offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +       pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> > +
> >         ret = dw_pcie_ep_init(&pci->ep);
> >         if (ret)
> >                 return ret;
> > --
> > 2.34.1
> >
