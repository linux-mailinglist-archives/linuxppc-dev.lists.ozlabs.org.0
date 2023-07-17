Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C13756C66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 20:46:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Qp4pQSql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4WJs1K45z307K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:46:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Qp4pQSql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::62e; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4WHv4FbKz2yGh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 04:46:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZcfMfv+HIa2StMLkGgZxT6d3LBMq5UDkV7cCuBnzT1gLUaKZfOyvPPSedqIraEE1Gge2ntzi1aU+DbFqoLcH314j1ctrY6t2Jqp5J+96iVQTQHowqSTHHMGCtoUAQgQchOHApBXhsOsm4mdRRT/cTLHfb81RAXySx2F+3Mp8/PtpPEJbFiLXn6gtP7Mo4DEcWZC3cIyhSgmTt8FIcsWiT0FmIySgYpXxY8/PrInWLEjaWx8I+I/ykusyYYYi1dkf0f3Zo31l0GeisTi8Dh5n7DBgW6hSZ8emQUrV4xLBNPhNQepuSqiSLv9tTaJhknQTe0xCNn9j+7JcZspwjA2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzV82os0Ve9QreV93psXcJNANQuhHbK+lp9nF/edWG8=;
 b=FMwaWg84PLg9nFqRU4JRdFa+9yz81DY63aaVpk1ZMfo63fKG2YpoVqSi6wNbCFCrR6F2zDeznSzWhKyLF/IxupoET/n5vWdHX3id2m6duRKhdYzz5jzxtXb5sga4OgErwCg6yK+r7dlnvox+sw7q70eIehefZppiIkRYJL58/3O71H22wHGfIKnZoA1J8LD+BSvSiRZZUDVunZXRZKAMCzwKDSj72VXtEGBWrWN++RH/OG6xc3uiBDzsSihZSMob1OSVqL/7c94haxJXOfIA4aUhy1DNWTgZyKcBTSICOO2HuzRzqEE2CvQ79aQ9btRXKGfGm4jz9yfPHi4B60EMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzV82os0Ve9QreV93psXcJNANQuhHbK+lp9nF/edWG8=;
 b=Qp4pQSqlWvsXU7nucwGY/FSMlu+/m4J2U0+4wj7Uf4bXM4wJkMjYW/ai1EBJKr/4AZBjHjDuXECHawoX7Emlb7YDcSEGt4o3sAxdwplccsiBSyHSBTtl4zF8I/zBi7wWuatdAlFJxByFKw5gdd8RvSfHsYtSWOszy5vG79tppMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 18:45:38 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 18:45:38 +0000
Date: Mon, 17 Jul 2023 14:45:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Message-ID: <ZLWMQ0w/QDdsL7yF@lizhi-Precision-Tower-5810>
References: <20230615164113.2270698-1-Frank.Li@nxp.com>
 <20230615164113.2270698-2-Frank.Li@nxp.com>
 <20230717155910.GB35455@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717155910.GB35455@thinkpad>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ca8425-829f-4f3f-bd51-08db86f6036a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1wwohpI6F6o53jhPe2Z/BAJdal/5w14SnhVPnxmZ69fIS1w5129gJ38ZMV65cxlzW96RZfjm8XknMSf+EQtWS6By/5k7PAPAZHXt/4dHbCu8D0E/vInysgQoEw05k4tKojEucJe8UTs3bF0Xfc4w8sA4PX2/Q4MXOrvywsuXW1w6pnezp2aqK+LeddpP+M87Ur9WPMRP30eUcjkpESDzaSv7LFoYV90guEWpybvxkmMfKx1FXpwNZewSz2SsiuD329pZlLOoXEwhSme13QkM4mLn4N337QnxT87p7SrIsDwDQjGyJEV0il79i1owyrmaDIroZPBUxqAIElMSJV/trQH8TbuG/5MgjaDV+d5t3+hGPZhKN8oGkKkApaPwO0sRxmLxiVrDIdvkcTLHJS5lJHNp0cuxYuTeK3YGhP4iUNGrftt1N/Kmoq0cEOlBXR8LRtkDv3+fOLyyX4+u5dGyJLdWWfmt/QZld/4BUHFdnE4RR7sRQ5c3ib9DMdfE+Y6QOl3WcUqF6AR9m0bblAEWznKisE4Mv4BRvRo7eTOlnKkqSV6Zl92K71M6emFnSZ/ldTt1FUQWpHMd54xHr28Os6f+Sywv8j8Z+DswpffvCBi8W3X7HIY9cyIyBEz0aF/X
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(478600001)(6486002)(52116002)(54906003)(6666004)(186003)(6506007)(26005)(9686003)(6512007)(2906002)(33716001)(66476007)(66946007)(41300700001)(4326008)(6916009)(66556008)(5660300002)(7416002)(8676002)(8936002)(316002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?R2xMYXhXZGdIU09GaXdPUGQ4YXJ4T1hyZFRYMFdLODdVS0FnMWtNV0Mvclpw?=
 =?utf-8?B?OFZtd0NZaHBxZXNnQlZjVlErUTYvNmpVRFUzK0JhU3BRcGNYY3NQMGREVFA0?=
 =?utf-8?B?TWtKVU91NzdOY01zZHJJc2xSTDhsa0lsSDdJaWFhYi9xMkg2dllqeTN3dTR2?=
 =?utf-8?B?U1ppSDd2Ykt1QmZJWFc4Wmg4Ukt6VC9iSjhobEd3SHpxb2tpeG1nYXFvV0dy?=
 =?utf-8?B?U3BGREJ4ZnRyQkxUNHlMMXBBUytNVVN1NGtRbTVmOHpMOWVSTHgzMXl1QlRk?=
 =?utf-8?B?RTIwQjFieUljQndkaU4xZCtOSTlobEl4VHVuM2NKWk1RRFdlWUN4djdtSWRL?=
 =?utf-8?B?WjFLMlBVcGhaMXNXWnFST2ZNdDkzc05PcTNnd3h2YmNONFJFU2xSVXRzYno5?=
 =?utf-8?B?azYzVW1VL3NlM0hXeUFoMDVMeUY3MnB1RmxyWFZ0V2NkUk9vZkZwVklqR25y?=
 =?utf-8?B?K1p4NW5idFhPZklkZERsZllmVnBNYTY1L1lKS083ajJ5emc3NnMxTGtFSEl6?=
 =?utf-8?B?SExlMWRvV2VRVWU0ZTlGMjZTTDd1LzBBc0JoYVpWUDVYNzhxcnNkLy9qaWZ6?=
 =?utf-8?B?ajc3NjFIK29vMStXSUk4L2NrVmRxNmlyVXpZZWNJa2hIU29oUkcvSlBlaENl?=
 =?utf-8?B?MUIzMGlkRlZua2JnYXNyRFhkZm9jTmh6TDQ1dnpVb0VtU21sOGNHWDZTT2xu?=
 =?utf-8?B?NFl0N0lzVFVXUGtabDM2L2lGbFBPVDQ5Y3BPWjlMWjQzdFU5MXl2SmphNTdR?=
 =?utf-8?B?T08xQnZ4cHozZmFWM3EzcWNGTDV4aU9qdWZFem03UjZUMm94UFQ4d3Y2N2pV?=
 =?utf-8?B?VkJxeVN6TEJUbFRZZnZBVGI5bFFobEhva2J3YS9BVHFnaDVqUWdObWVrMXhp?=
 =?utf-8?B?RkI1WmZ6bFlybUM2aFlvQVU5dUMwS3BwOXVDREZFcjVRSi9FMit3MUl0eFpT?=
 =?utf-8?B?UFNURmxZVThaaklLMlBNTjUwKzlZMStmc1VzS0thdVI4U25MbENSWWh3bUkw?=
 =?utf-8?B?SjJOYVlxZDlJdUNzM2tFNC9mRVhWdFNIeGQySUVDYW1kcDRPWGdMTEVmNXlZ?=
 =?utf-8?B?U2VxdWtENWdYam1MMm5qY0pONXFXQUU2UFpSZHF3RWVDMVZ5emhqOUZKNklY?=
 =?utf-8?B?TUpwTHVPWlo1UFlrbk5SMW9wODRLK1BRdDBSdW5NdzBwU1NFRWV2aDRwejUr?=
 =?utf-8?B?WU1ZQUZDbk80NE1DMzQvcUNiN0UzcWYzY0NBSjE2R3RockVSazJPUkdIWmpq?=
 =?utf-8?B?bFVsTFNFWEZVcEgyd3FYMkNpaGptdUxybER5cy9aU0EvRzlzWWdmUkhHaUo0?=
 =?utf-8?B?aTV3dEJEbGhKa2VqeTd1UGJtSUxKRXFVWTl3OTVWSXh1RURJSU54b09YNHM5?=
 =?utf-8?B?L0d5NmxLK1RWRGhJYmtkM0lialVpc2RFd3BrKzg1cWtNV3dzSkc5emRRSHJo?=
 =?utf-8?B?OUg0Umx2WHZXL3MyWlJUZFcwTEVMZGk5WC9zbG1XaUJFUHZFK3dzK2FBYitI?=
 =?utf-8?B?UFZaV1N4U1JhUEQxTlRFL0g2WExaVXdzb2JkaFZkMU5FSEdLZVNZcmVTZ1lU?=
 =?utf-8?B?eWthaFdxcU91MEVxZTdtaWo0UVlUWStDMnFYSmhwNWg4K0JyMG1KTjZsM1c4?=
 =?utf-8?B?Tk03aGl1QXRjSjVEZFFUNEhIYW5KNTUxTWtUS0g4VGdoYXVFUVh4am41ejg5?=
 =?utf-8?B?RnZQR2dWRk9zOGNobnlBY0Ewd0hoNUZjVDdVcXNYNjNpL2kzNHJ6cEtpVTBX?=
 =?utf-8?B?NzY3Ylc5S00raDc3UTFWR1hvZ2FvL2FEWHNnQWpYOThjWnZiRDN5UitZOWRh?=
 =?utf-8?B?WGRMclNBMkVBN0NYRDRtQmRqRC81WlVRTWNKeERaUVJRQkRzYmRHSUh3M2Fs?=
 =?utf-8?B?MnVaeWZOKzVxQ1ZueWJRbXhiaUt5TVRXNFpUMEpmcDd0R0YwaEM2N1JTaGVv?=
 =?utf-8?B?YXlrS1JmZ21JOGFxS0huRk82a1h4S3VWVWt0YVBGMHFTU25hRFE0citBR2Qy?=
 =?utf-8?B?ZDl0em04VTJ3TC95bElJNVdod0xaS3hST2lOVmJ6bVl5ZWpXakY3TDVPQWJJ?=
 =?utf-8?B?TFpjNEFoaFBhQ1MyakNCbndnNkV3VnFMVUwvWmxVa0F1QmdlUkZFc2VYRHNv?=
 =?utf-8?Q?EyGE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ca8425-829f-4f3f-bd51-08db86f6036a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 18:45:38.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeoNdLYij41geyarJU2vT9SwbsQsShCCwl4OlO/MSO6evNHj7O2ZDs6D72Yr9bZB1YTerXqcc3mhscGi9aLGGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832
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

On Mon, Jul 17, 2023 at 09:29:10PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jun 15, 2023 at 12:41:12PM -0400, Frank Li wrote:
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> > 
> > A workaround for the issue where the PCI Express Endpoint (EP) controller
> > loses the values of the Maximum Link Width and Supported Link Speed from
> > the Link Capabilities Register, which initially configured by the Reset
> > Configuration Word (RCW) during a link-down or hot reset event.
> > 
> 
> If this fixes an issue, then there should be a Fixes tag.

It is not fixed a exist software issue, just workaround a hardwre errata.

> 
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
> >  	struct pci_epc_features		*ls_epc;
> >  	const struct ls_pcie_ep_drvdata *drvdata;
> >  	int				irq;
> > +	u32				lnkcap;
> >  	bool				big_endian;
> >  };
> >  
> > @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> >  	struct ls_pcie_ep *pcie = dev_id;
> >  	struct dw_pcie *pci = pcie->pci;
> >  	u32 val, cfg;
> > +	u8 offset;
> >  
> >  	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> >  	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> > @@ -81,6 +83,13 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> >  		return IRQ_NONE;
> >  
> >  	if (val & PEX_PF0_PME_MES_DR_LUD) {
> > +
> 
> Please add a comment on why the LNKCAP is being restored here.
> 
> > +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +
> > +		dw_pcie_dbi_ro_wr_en(pci);
> > +		dw_pcie_writew_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
> 
> lnkcap is a 32-bit variable, so you should use dw_pcie_writel_dbi().
> 
> - Mani
> 
> > +		dw_pcie_dbi_ro_wr_dis(pci);
> > +
> >  		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
> >  		cfg |= PEX_PF0_CFG_READY;
> >  		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> > @@ -216,6 +225,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >  	struct ls_pcie_ep *pcie;
> >  	struct pci_epc_features *ls_epc;
> >  	struct resource *dbi_base;
> > +	u8 offset;
> >  	int ret;
> >  
> >  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > @@ -252,6 +262,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, pcie);
> >  
> > +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> > +
> >  	ret = dw_pcie_ep_init(&pci->ep);
> >  	if (ret)
> >  		return ret;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
