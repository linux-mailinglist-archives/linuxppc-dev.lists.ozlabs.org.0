Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A127CB485
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 22:20:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IoHXFGqP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8T4H2DHsz3cc7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 07:19:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IoHXFGqP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe12::611; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8T3L56Cbz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 07:19:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HghhJqvOjSqJNNNJ+yu3hawHNSUBsPXviAYGtyxTg2kdq9+LsijWjNkwQ6MmM0Q0L5XDZ1zOin32f9+BIWpNbS5reXduDww026cpItIGsDPegVUxPu/Lr5ITHnVrf+cJ27NbFF4DO03rY8S1Gh84YaCHldhb4ugGoj3/osq6g07+pa/jmi+LviXrtPVLuiVWxH1nircoUH8IbrL7pILvjZ3KymRJnqqKNt6/U4iWD6K1JNw1/odvT9HilO6bRAjtu3FeqRCpqxMLUbuOi+jNTdlIikI1sgDr5Z8anuqhTrLmOGQuBUIYwhprsuCr6krTkZNIF9QvSTh40+0iionmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay/wBSmKJuR/TeU+5ZOz5Bl35X/5H7r1ZgGUadm391I=;
 b=Y+XOBsLbCe+qW2Li/Qr+3Qui/zxC9BFqqaxn/B7E6EVD+xlNEBH2nZs+H789AfGxzKBUZEANPVTOFKGAib2qepVLTTnnUh5APuDe0IYfMpbRdAbMJOfL62jPeBgoXJ+cC2P3SJhtLHrvSWSoHPJmcf+vthy8CeIBhN6LX26enwfANn6O0xTQLPgJAdnvUkjjDHf2cJDHM7/GhFibvylQX/CXJVF7ckA84VBpfrPr8hujtubPj67426j4ReL7XboUEIws7K44FJkwmivIbeFtRX4dbSXG43ddURe+hSqciMVflt4QqC+E4kafA+hcUKRLaqjSwjQ7Z/9rsM+s/S0/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay/wBSmKJuR/TeU+5ZOz5Bl35X/5H7r1ZgGUadm391I=;
 b=IoHXFGqPHh3BgF4XxaI3ClafAwdrjTlsKoAL5rZGZn0ZTF2cEBPXN3Kt7NvkP9T/ltDmFYTyJj8MzmO03pJOnam1zKT5JLjI5Rmqjqu307ZQFLiDmz/G0iKcDQggOs1OFizqKSOE9inv+Kxg8mJSPyTjjT7ZhXhEaoSOvsjVEvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB9389.eurprd04.prod.outlook.com (2603:10a6:102:2a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 20:18:44 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 20:18:44 +0000
Date: Mon, 16 Oct 2023 16:18:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZS2anCpWakttzaAu@lizhi-Precision-Tower-5810>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
 <20231016165824.GF39962@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016165824.GF39962@thinkpad>
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 2609b533-3902-40b9-2edf-08dbce8518ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pS4UPnQObQdcl8EPchOVVcfxxBjtXTr7RdRqsB+1fpAvSaFCo0fUdJ5Y8kEFs6D/Os/3bcamPj0KaZ2nONOW2mHjWvxYROGyZyxpoNRtsgwAIOZdXYrxNvGRf+Pb2ks38Am9kY6RgqrQiF+2V/BN6lBOqh9ZZRycjrmie6o9Fw/n8pelvpQuQIEEjTmMswU8Urpx8sFfMUUOGmU9nPqHnYjiRS21royouupxr/TA7dqrejHiEs9ilRHfWU3myV4WJsFU9U/4OZGmhQw5ZRmxtEs215WMOyMgMrO0hgV+PV3bI2QO1x7nwj4rMsMAIuLZgdasJ9I/updPcJWq8NDcvYqXwGCxd2nI40p2v72pTMviGIRUPNJerUG3IP111fZLdvOrll4XCzfLqXmt7BLNBVAJ0qK3/W5wL+o/eY0HTYJ61ZBzbBb/SYClf1JlPGJgiGBqiqO5TRG2WQSaONnN/EsP6vIh35BlRUOGoHhLE8egCqXr9U4JsZOJ6Olnjpp0CR/n6oxkix/2L3oIjtXBVI1HyB0bouPmKfWmPPrXgR1u8xkoEAuMK+tgG+oKGMyL42mLBZnbXhl/As8l+y6AE55j95j0RHHR/LlhXb//SAPzICKX/ODOib6wGYyaMFyS
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6506007)(52116002)(5660300002)(2906002)(26005)(6666004)(83380400001)(15650500001)(38100700002)(86362001)(9686003)(33716001)(6512007)(7416002)(6486002)(41300700001)(66476007)(316002)(6916009)(54906003)(66946007)(66556008)(8676002)(4326008)(38350700005)(8936002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NVNFdTJhVmZueWZLbG9RWTJyQzJuZ1Q0KzFTdzExc1VucVFIMCtlY3NWZlYx?=
 =?utf-8?B?eTlSb09NL1RjSjBVME5vNjFNNFUxc0FPS3ovd3hHNi8vM2pLdDZnc1pQOGJv?=
 =?utf-8?B?NDdNK215a1VnUzRuMlI5YnV4RnBnUEJXUmJobWNobHd2WVc2azZUZHdETmlW?=
 =?utf-8?B?ZTNSMlpEQWhWNzdWMWp3M3FkTW03RzR3Z2ErMEFCanlUMU9JNU1PSzlpVzND?=
 =?utf-8?B?RjhiQ3VXVktZRDl3Mld5UWJhdU1rdFBnZDBPeUl1aVVQNU53am9NaVVKOHBo?=
 =?utf-8?B?SmpUbkFHSXRuay9BVjRqa290em5zSCtCMzRvbTlWWWxHV3NOOXNiUWE0bjB5?=
 =?utf-8?B?bFlBVGpyZmd2NGtjd3U2SFJxRzM1alU2OUdlYVJUd1Y3T0dzanAxREhyZUph?=
 =?utf-8?B?Rmo1YVVJQ0JnY3ZSZUJDNHI1WkxlWW9vclNydXR4SXJ6aUd3cHBGejEvWmJM?=
 =?utf-8?B?QXMvdGJKenU5TlNRNUJPTE1VamZNV1QzQTZYSVJMeEhWTXMrNHYwd2d6K0Fv?=
 =?utf-8?B?L21VSGxUK3JpdzZDd3M0emE4SndqWkp2NlhyQUtVcnRHeE5kcElDam9TMDFU?=
 =?utf-8?B?UzRSUFdGcGpVSTdJREFlbFNQSWxDUGNLNnY1MjVuM1RJUFlvcUxVL0NPNmgr?=
 =?utf-8?B?RHhEQnc5OXp0R25yRDNPeFd4YVhmQWtOTUpRTENKVW1qRFA4SisvY3JuTUxz?=
 =?utf-8?B?bUNFMllBT0t3L3NtcVlCQ0hKOUMzYUhycGM3VzJ1dERrZUtxV2kxTDFZN0F0?=
 =?utf-8?B?NUM4UHMvalo4eGFHVUF0YitmWldPWnpjYi8rZlNRUHh0UXFXM2VHYTJGSWhO?=
 =?utf-8?B?M2JrdldRK3d3SlpOOHBYWmM5eXdpMFN6em42dlUrWkp5Vno5ZS9SY21WK0pu?=
 =?utf-8?B?ZW5ScmczdlYrUXc1SkZhZDJlOEdiYU94UENUY1EwK0JjcjA4UGlWMTBFbFAr?=
 =?utf-8?B?aS8zVzJnT0x4MXZzWEJGNnFrTEhEOW5nZTVUbzBEbGZLYjhVa21ZU0wreWdI?=
 =?utf-8?B?a0RnaVZQZjhNYjdDYW12WXZzbkNlS0E4Z0U4TjIvQzRlVWF0RDhhazFvUHNt?=
 =?utf-8?B?Z0NYOU1BUWFrNXR6NGJVSE5nMjFqcUllcWw5Wk1pQk5rcHNUem1TR28yRUdm?=
 =?utf-8?B?a0VsNXZFT3NuNU01UXllL2VTMlJXdmQ4WjFBeEFVeXBuWkhHaTF2YnBkeWl0?=
 =?utf-8?B?SWVnbVJOVEowcUNhZFh6dEIvVzROV3BWdTQ2VTFRZ1E5amVrRlpBWWNlR0VG?=
 =?utf-8?B?YmY3WVZpdEQ0N2QyRkY3Nmg0MHFIOHlRbGwvSkxnaWRaR2kvVkZoNkt3Z1JH?=
 =?utf-8?B?MnVxN0Y2OTBDaWk2UkNSeThLeE9YTlNjdEo5amkzbUxhYVZJYmRMODR3enhD?=
 =?utf-8?B?SnRtcDB6ZmNSRVBSN2Mwc2xtTkF4dFlSdTJhd1ZjQ2RpWmRUVFp4R09NZXRq?=
 =?utf-8?B?NFh5MXQ3OE81MTFLRUc2MFNGNFBTMW1zYTNndGZBWnorb3RYWVZXMVY5Rjdx?=
 =?utf-8?B?aUtiWGw3bnMrMzZxaFowZnB1SGt1dEczWi9BUVM5ZUZGRjVhcFRnQmEzdVBx?=
 =?utf-8?B?Y0dLREJjanFUdTk2Y1pVTFNBNll4eDUzcWkxcDFXL2FCbE9aT1VadkJMeEJO?=
 =?utf-8?B?a0hHRUl2bHdnOGFYTDY5bzlkR1NKNFlid0xKbHdud252MWVBd2VaUitEQUtI?=
 =?utf-8?B?d3liVlVqR1lINHNuOGxGcDBCSnphZk9WSDZnTlh3cHJNQWkyQ040WUNjbUdr?=
 =?utf-8?B?cW1GWWxSUUNqYnh0QkR4bXowS1k3U0c0eGZYekQzRko2NEcya0VrQWhRdTNn?=
 =?utf-8?B?Tmd3clVORVk3emJtcDR4aUV2bk9xYlYrOUtiNE0xaDJqNHl2UGRyendhY3di?=
 =?utf-8?B?blh2L01QSUdPRThvbVBldnNNQmJnWFcyTUhwMmZ5NDQvd1JNNzVLSlQ3Ymt0?=
 =?utf-8?B?YlRvMkFmaGdOc0xnayt3ZkNqYVhtV2pUT1lqRXVrb1B6WnlCeTQrQ3F3UjFw?=
 =?utf-8?B?MTVoRGx6OEg1L21yK3E1SUxjeEtkVzR2ODZPTURZdGV4TGxBSnQwZ3ZIZjAv?=
 =?utf-8?B?MzBlbFhuOWFSSndsVU81aTlTOFM5VTNHWDBlM2pqWjcydDkvcmRiZ28yM3A2?=
 =?utf-8?Q?91hE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2609b533-3902-40b9-2edf-08dbce8518ba
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 20:18:44.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SU4YDDpEsOy9Ro1T7xWrT5M8J9C7Nw0oxiqascO0ojpOXoZNo8sSFyuj77x118k09eQG6GymBL7bp09c4xK4AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9389
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

On Mon, Oct 16, 2023 at 10:28:24PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> > ls1021a add suspend/resume support.
> > 
> 
> Please add what the driver is doing during suspend/resume.
> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 20c48c06e2248..bc5a8ff1a26ce 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -35,6 +35,12 @@
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
> >  struct ls_pcie_drvdata {
> > @@ -48,6 +54,8 @@ struct ls_pcie {
> >  	struct dw_pcie *pci;
> >  	const struct ls_pcie_drvdata *drvdata;
> >  	void __iomem *pf_base;
> > +	struct regmap *scfg;
> > +	int index;
> >  	bool big_endian;
> >  };
> >  
> > @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> >  	return 0;
> >  }
> >  
> > +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	if (!pcie->scfg) {
> 
> Can this ever happen?
> 
> > +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> > +		return;
> > +	}
> > +
> > +	/* Send Turn_off message */
> 
> "Send PME_Turn_Off message"
> 
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val |= PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +
> > +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> 
> "There is no specific register to check for PME_To_Ack from endpoint. So on the
> safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US."
> 
> > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > +
> > +	/* Clear Turn_off message */
> 
> "PME_Turn_off". But I'm not sure if this is really required. Are you doing it
> because the layerspace hw implements the PME_Turn_Off bit as "level triggered"?

I am not sure how hardware implement this. But reference manual said:
 
PMXMTTURNOFF:
Generate PM turnoff message for power management of PCI Express controllers.
This bit should be cleared by software.
0 Clear PM turnoff (default)
1 Trigger PM turnoff

Frank

> 
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val &= ~PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +}
> > +
> > +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> 
> A comment here would be good.
> 
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val |= PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val &= ~PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +}
> > +
> > +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 index[2];
> > +	int ret;
> > +
> > +	ret = ls_pcie_host_init(pp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> > +	if (IS_ERR(pcie->scfg)) {
> > +		ret = PTR_ERR(pcie->scfg);
> > +		dev_err(dev, "No syscfg phandle specified\n");
> > +		pcie->scfg = NULL;
> > +		return ret;
> > +	}
> > +
> > +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> > +	if (ret) {
> > +		pcie->scfg = NULL;
> > +		return ret;
> > +	}
> > +
> > +	pcie->index = index[1];
> > +
> 
> The above syscon parsing could be done conditionally during probe itself. There
> is no need to do it during host_init() time.
> 
> - Mani
> 
> > +	return ret;
> > +}
> > +
> >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> >  	.host_init = ls_pcie_host_init,
> >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> >  };
> >  
> > +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> > +	.host_init = ls1021a_pcie_host_init,
> > +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> > +};
> > +
> >  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > -	.pm_support = false,
> > +	.pm_support = true,
> > +	.ops = &ls1021a_pcie_host_ops,
> > +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> >  };
> >  
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
