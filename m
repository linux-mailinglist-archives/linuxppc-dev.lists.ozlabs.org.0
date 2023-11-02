Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC307DF9BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 19:16:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bZTq8UF2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLsWT6FZKz3dBg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 05:16:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bZTq8UF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::603; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLsVY16fcz3cYV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 05:15:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5Eeu4ifD1zKHxikBf2r919c13odGxW/oeHc3YIfvQNE5RdBRIY0zVHFtYrNkBMsF2l/RKGwsMXF+x+43U8nwckgY0CltVfiVr8/QVGO2QxaAK9AuVI1fgg/rPiOUOXYAhP0gJvThEwt99V3jWoaoE8GJAuylc9xhp9vOfgq1Va7IDXYtc9AunfOKtpqXaJ3ueoq0xYoiogFdAa+M0PL279NJExRxlG0oAejs75lzxmyXJMMRPMbrkEC6PgdwL81+bx5Lna/QdcKn1I802vr4ULQRVhRE0YWs7+pR1zchJ8NztWCu+BYwBQ8wxF45vTC2fHo4JCoyVuoXzy2ZC4ApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj3eqkyrfvtNKeY9X9X8e63pGuPhlpLF6NXTGQCggig=;
 b=eZPiCLEhE7RTuqReCqb8UUh22t9wr7KSyZlhC/gvrP84lcIuBqLwVYWuZa+xES4or2XUlgHBd96zy7nAme+MTyNGUUkypYtJLA9RhQQFkfRKGXfLpc2TQvJlWGrnSmqL7kSrx3BL4ZfMTIWHEkb4WXPQSGIyJbiEXy2W3+1y2tJ06Q45Itpx5cxbOsGA3ojjkSYpACdvcZZ0B77os5RSZ+aZrriCEWguUHSy/PIkkuKcA0lngpRwc0fcHKfV0krgNJzNam3Tv6X1alpSvH2ji749b5LHOvzVMH9BCHbvIaPuWbmXh5gPXM9YIUWrjDk+dpku1h6wHj2AZjErV4cT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj3eqkyrfvtNKeY9X9X8e63pGuPhlpLF6NXTGQCggig=;
 b=bZTq8UF2fcxbo1i/PjMWCULWzQOPY6fKl3P8QJ8qtTQeRTnlPPs/dk4+716CH1bc6jcdhqy/Lbuq4uhYekCWiAaaywoiZvDmTKalzm5MFuwslYbyJKutxvfms8Rwa6EFa+Klh+AN1B3tiYA8NLjjgNl2N3tZ/SN38uIW9WO/CAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB8219.eurprd04.prod.outlook.com (2603:10a6:10:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 18:14:54 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098%7]) with mapi id 15.20.6954.017; Thu, 2 Nov 2023
 18:14:54 +0000
Date: Thu, 2 Nov 2023 14:14:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Message-ID: <ZUPmqAa6B4nU/F9V@lizhi-Precision-Tower-5810>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-3-Frank.Li@nxp.com>
 <20231102172809.GD20943@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102172809.GD20943@thinkpad>
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB9PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 201601a6-c990-429c-db07-08dbdbcf9d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SkxLFFR+tePeED/DJcdMXHuKVn9sRmNCJvEClKfIeZ/wiIseEjWfolGTt21qVkIr6/Bjo0EplEF09d5bCzOhJcIyw/EzEEqDmAsqSTmk+I2VNZEqCWTQacETNtpNGwiMGUpqQK0X5y1hJdKDF2m7WvKIphSd4x8WVXJaNs4PEQIKSP2tDZHjfSa9RdUJqi29smV/oTuM5xPPxz8TcFJVntagN754sGxeQR1as7+WX8teV4S71equW/eU+nbrXsknrP8PCb7nKFLYoGoGvQigKSHqhF0a/DifU/k+qO7xSQ5s2Wdsb5D+YYl/fqoRNF0nrqpZh3seOBa+5NP5b68iW0c6dKVSvxVOFpy/QgOjmMXL/gx0lMJ49F0QNwPbZ8QDNeKpLKU270hvbrPx22QhuoPIBAKgMdodCGK6rU8N0A0QEBXsUY+Yuc5LHsS/jPuzNSJev7LCLstPGcwQvBuTVB1lhAOtjDNtlBw1TIrYxkFjfuDN0LfNJC+HB3cxCJSfxbqQKVdmH2+BpylQsEIhdKum5Jpj+zgefQbzele1k4zFG49TLE1zSfeVjXry98uZg9m8ntLfQoK4Vy5xAu4wsIZ24PAtC2ZaJuzxAxoyw/0kTQYlWFIOBUXiKg6fe2e9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(33716001)(6666004)(8936002)(8676002)(4326008)(26005)(5660300002)(41300700001)(66946007)(7416002)(316002)(66476007)(66556008)(6506007)(2906002)(86362001)(15650500001)(478600001)(38100700002)(38350700005)(83380400001)(52116002)(6512007)(9686003)(6916009)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZFVzRnRwSE1DVFpoaGhvaTQ3QU5VMDZxbTlQRklMeEVkc21PN0xRN0prRFh0?=
 =?utf-8?B?ajNmdUMrYklMWlhtT2pLMkwvdFBnc3NmTlpONnBsRnNqc1paMno4bzZCSlBs?=
 =?utf-8?B?OVNMdElHNjJzUnl4SXBXU051SlhVclV3WkN4NkxMVXNmK1ZkZW1jNE5aU0tn?=
 =?utf-8?B?clN0d0hOR000bGtndjc2dUhlSHg2aysrcGt0SjNWdW4rcU00dUdxODRqRWtY?=
 =?utf-8?B?ZXNmMkxFcTR5bDlER1Q0SCtBTmlIV292a1c5U2ZNMCtPaXJqUENTNVh5VC9X?=
 =?utf-8?B?TlFkbVFnM2ptMXI4LzlYaWM4YzBsdjRrNkd6cXgrZFZvTmlVbjc3VzVCMm9p?=
 =?utf-8?B?TXd6ZjhRQk9nYmNxY0hWK1o5Y2IvODlsOHE1dWZpczc0ZTZvSldHVUtZMkQ2?=
 =?utf-8?B?SXIzRnhxTVlvN1NSYnNaQmRvQWg1UlVLSk56L2dHK1p6NjFuN0FTQldvOFdI?=
 =?utf-8?B?OWFLRXY1V1gzeEI3Q1BoQmNBbVREUitBQmNocitWQUlMTk10RkxrcmFaeWg3?=
 =?utf-8?B?aWxON3Q5N3l4b213NktJaHpqdWRHNU9hbTVXZjhqOEx5cW0xbzZrVkRBZ0xJ?=
 =?utf-8?B?NmtsN1cza1lXaVdyb1NYUlhkV2loYnZFMllpZGtObUFtbmU3YTZkTE1KeURy?=
 =?utf-8?B?Y1c3SGVVUG1xWWIwcEk3djY3OGpSZGlhdXBUR0NNTnNuZldWczYzMXA3VXpC?=
 =?utf-8?B?OUhnTHB4VElmMGxmL3BTWE1nUHRsOC83L3A0YWpESzhSVUpkZ3ZGeTVPLzlS?=
 =?utf-8?B?M28xbkNlTndHemFjM1NFdDZEUHNoTlhKS1pqUEowcnpuMnpQUVZkOEgvdWd2?=
 =?utf-8?B?ZCtYSVVxK1BiSHJtelFEYlp4enZKRWVNR0I0N2dGYUZudDd4SHl5UkFKN3I0?=
 =?utf-8?B?UGFwVUJhNjRoVTZKWXpWVUViT1Y0M0lja2FLOEFjL3h6REtvcGtoWFA1NzEw?=
 =?utf-8?B?bFJkV0VLT1M3bGdIS09TeVlocHF4dHhXL0NJcGZVcHJ2VWs5RHdqZS9UOU1i?=
 =?utf-8?B?TXhod284cllkTHRnWnNMNWpqWU9ZYURXWnFaa25CODdyamZTaW5YaTJ4WnNU?=
 =?utf-8?B?dXlsUmVZVU13TGloTWx3c1pZMjhxd3FXY0RKOHZDU2xQRElDSTRKQkhZclRp?=
 =?utf-8?B?U1dTbXZ4Nk1xMWUxY3JSR2gva0JpYUhvaysrcXIzS2NuNDg5N2tibHJyZjBj?=
 =?utf-8?B?VXhtcTVrYVA2aVdVUDdFSG9aUlpPdFNoZHJxc3ZUeU9wR2t4Mm1rVFJsVk9i?=
 =?utf-8?B?UXlGVHo0QUZKeVpkdW56cE1Bd1ZVZllzMUJqQ0FiSVEzdXhmWEpaUk1GTTdD?=
 =?utf-8?B?eFU1U0F0dnFldHdHZ1Ezb1ltYS9pSXd2U3RFcjkrQlg0aTZwY2JuVWhSRmlF?=
 =?utf-8?B?UkJEbjkwdWIzcC9TRXQ5TmpnTTZGVnVWU2hINE0zS2FrSXJTK2pHUU84U0g2?=
 =?utf-8?B?cVRXQW1UZlhWckoreloxaTNTY1dzdFB1OGVxakdQQzl6dXV3SkFjbk51L25y?=
 =?utf-8?B?cUNMUEVZY2pVQWpSOVFLeU1GbGZSL0h1cDB1RXd1aXpMQ1V3Y0VQdGhoc0k2?=
 =?utf-8?B?dWpTMDZEN2Q5SFcwMkxkNHlpRjdLM0Z3N0lrVVhIRlRUTGRiT2JvbjlXK1Fz?=
 =?utf-8?B?UCtobnpIK05admhzK2ppaml0SkxDd0ZiSTZrUDQ2aUxJaDIrSVdjcDA5NVl1?=
 =?utf-8?B?d3M3SUJjYU5nN2FIeitUK3JqQlg3Y3ovcFJGWm5ONVp4OEcwSndnVy9CRENV?=
 =?utf-8?B?TW11b3g0cWs2VU11S0J5WE1vazdxWmlBUDVkckNaSEVjYy9XQnlXcDByckxJ?=
 =?utf-8?B?OUNDcTFiSjJoY3N0ODd3L3lvTDR5b2sybHhid0hZZDZUQ3dMUFpmelB4cGdy?=
 =?utf-8?B?TWgzMTRIR2U3WWpEcERKOUlyR3BmZzJ6UXFmNFBFOUxmaExUb0pVcFRWY2lk?=
 =?utf-8?B?SXlQQlZLbUhvMkF2c1JhUFBhbHc1NnJ1enZsU2JEaTZDOXNRL0JxWE9NcWVG?=
 =?utf-8?B?cDZvU29xYURnNkE1U3o2eEdPd3BXK0VCdWFmaHF0WlhZVXNYaVFSVXVGNVl2?=
 =?utf-8?B?eHY4TU1YM0syeTJMNmdFL1k2T2cxK3ZjcG1mZElJQndjRnAxVDF6dmtkVjd1?=
 =?utf-8?Q?+BH/mNakm/49iUxpcWH2DpYAM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201601a6-c990-429c-db07-08dbdbcf9d28
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 18:14:54.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF0DfGbX+LABTMtPc1C5P+o1UfcnP9De/WRX7BP/hJ34GPl/jqkihUHvLquIP12AGtlCDCHf/A2QweSWpjbg9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023 at 10:58:09PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 17, 2023 at 03:31:43PM -0400, Frank Li wrote:
> > ls1021a add suspend/resume support.
> > 
> > Implement callback ls1021a_pcie_send_turnoff_msg(), which write scfg's
> > SCFG_PEXPMWRCR to issue PME_Turn_off message.
> > 
> > Implement ls1021a_pcie_exit_from_l2() to let controller exit L2 state.
> > 
> 
> I'd like to reword it to better reflect what the patch does:
> 
> "In the suspend path, PME_Turn_Off message is sent to the endpoint to transition
> the link to L2/L3_Ready state. In this SoC, there is no way to check if the
> controller has received the PME_To_Ack from the endpoint or not. So to be on the
> safer side, the driver just waits for PCIE_PME_TO_L2_TIMEOUT_US before asserting
> the SoC specific PMXMTTURNOFF bit to complete the PME_Turn_Off handshake. This
> link would then enter L2/L3 state depending on the VAUX supply.
> 
> In the resume path, the link is brought back from L2 to L0 by doing a software
> reset."
> 
> Although I do have questions on the resume behavior below.
> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > 
> > Notes:
> >     Change from v2 to v3
> >     - update according to mani's feedback
> >     change from v1 to v2
> >     - change subject 'a' to 'A'
> > 
> >  drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
> >  1 file changed, 85 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index aea89926bcc4f..6f47cfe146c44 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -35,11 +35,21 @@
> >  #define PF_MCR_PTOMR		BIT(0)
> >  #define PF_MCR_EXL2S		BIT(1)
> >  
> > +/* LS1021A PEXn PM Write Control Register */
> > +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> > +#define PMXMTTURNOFF		BIT(31)
> > +#define SCFG_PEXSFTRSTCR	0x190
> > +#define PEXSR(idx)		BIT(idx)
> > +
> >  #define PCIE_IATU_NUM		6
> >  
> > +#define LS_PCIE_DRV_SCFG	BIT(0)
> > +
> >  struct ls_pcie_drvdata {
> >  	const u32 pf_off;
> > +	const struct dw_pcie_host_ops *ops;
> >  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
> > +	int flags;
> 
> Why not "bool scfg_support"?

It will be easy to add new flag if need in future.

> 
> >  	bool pm_support;
> >  };
> >  
> > @@ -47,6 +57,8 @@ struct ls_pcie {
> >  	struct dw_pcie *pci;
> >  	const struct ls_pcie_drvdata *drvdata;
> >  	void __iomem *pf_base;
> > +	struct regmap *scfg;
> > +	int index;
> >  	bool big_endian;
> >  };
> >  
> > @@ -171,13 +183,65 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> >  	return 0;
> >  }
> >  
> > +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	/* Send PME_Turn_Off message */
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val |= PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +
> > +	/*
> > +	 * There is no specific register to check for PME_To_Ack from endpoint.
> > +	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
> > +	 */
> > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > +
> > +	/*
> > +	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
> > +	 * to complete the PME_Turn_Off handshake.
> > +	 */
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val &= ~PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +}
> > +
> > +static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	/* Only way exit from l2 is that do software reset */
> 
> So, what does exactly "software reset" mean? Are you resetting the endpoint or
> some specific registers/blocks in the controlleri?

No, it is PCIe controller reset. Not touch endpoint.

> 
> Also, what if the link goes to L3 in the case of no VAUX?

I am not exactly sure. it should be related with board design. I supposed
not big difference!

We can improve it when we met it.

> 
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val |= PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val &= ~PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> >  	.host_init = ls_pcie_host_init,
> >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> >  };
> >  
> > +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> > +	.host_init = ls_pcie_host_init,
> > +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> > +};
> > +
> >  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > -	.pm_support = false,
> > +	.pm_support = true,
> > +	.ops = &ls1021a_pcie_host_ops,
> > +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> > +	.flags = LS_PCIE_DRV_SCFG,
> >  };
> >  
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > @@ -205,6 +269,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
> >  	struct dw_pcie *pci;
> >  	struct ls_pcie *pcie;
> >  	struct resource *dbi_base;
> > +	u32 index[2];
> > +	int ret;
> >  
> >  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> >  	if (!pcie)
> > @@ -220,6 +286,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
> >  	pci->pp.ops = &ls_pcie_host_ops;
> >  
> >  	pcie->pci = pci;
> > +	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
> >  
> >  	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> >  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > @@ -230,6 +297,23 @@ static int ls_pcie_probe(struct platform_device *pdev)
> >  
> >  	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> >  
> > +	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
> > +
> 
> Remove extra newline.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
