Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D29357CABE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 16:46:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kmJMMo8i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Kgm5VB3z3cCG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 01:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kmJMMo8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::626; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0626.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Kfv1tjNz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 01:45:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPGdfgNFudn0Ipz3p85WURnMdCQT3t+lZ6zdgJF29K87sKTg+I8skoFScT5uaeQ+AcxA7MQsfoflJ80zznSpIY3Ptd+ZtdRF51NcQQDP0egjVRn5v5t1Ue8DdlKWJ2mAAV7r6s0oQBm0hk1J2CgKCJ2V8TkG5BxHnCwENjbXHr1r5n2yInM42dNT0GffNCgYY4QFtS0QaQLPOUE/ctmgNqQUpQ3vPg7NnpGs7gvDN2E0bI+CHsVeUPKblvslD4ZR4Njhwb0S3ZlFvjeKEQktR1MzHv66nJsl89t9dcDvh60vphFQpJ8tWd8kbXQJnnl7bf63GgZubWXYAZI0b2VbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/36cyA5cL4s1jaU/E9PH4krTq8JejiQbgxOecVOOXXQ=;
 b=KNAhUc7P79M3y9xylcNK4zlOsb5D5NL9PVTZEqc0RyspH94wwWW/T9jEiDnKx4idAxRKho3voHUt2/DBdAIhJ6VxdWIHaksNynTRvRyS+PJddivQAbGM27xSwt+XwJL7xRaUKg2QdJwDOgNpxrQD2nph/A/nSqL13jC8nm9Njpr6Jm/h7Bt4qI1GLN5hsokEwnIe0mtu/sfbFy+nktjAPuIq9KsLEp7WR2B3GKgiL14tt/B9aLkmjdWovQKXBQfDKLsnL77Eb6Zjp7rpAO4PGC3lsnXjOuzxpGPRDV8LDCzifLkKdf8csZnmxxsK2YSLe9nGmUl/63IzljTYR5epZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/36cyA5cL4s1jaU/E9PH4krTq8JejiQbgxOecVOOXXQ=;
 b=kmJMMo8iicDC4lmDiFuCM8VF/Qhbj94EVVgRfJ3cs2U1K6pSES5W5NenkTNDn1IyoNjD2npsdGCTy/fBWjcdl/R2KJHqyOL75P5oeduvjfCLR3xbXF6NYbd8j2rRgDi9FLCtZ7pax9H3ydIS88gG+iwAjHkvtfygH5NtfzD2NbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7519.eurprd04.prod.outlook.com (2603:10a6:102:f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:45:34 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:45:34 +0000
Date: Mon, 16 Oct 2023 10:45:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZS1Mhe9JOsY2JJER@lizhi-Precision-Tower-5810>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
 <ZR10SVVBYvfMJPv1@lizhi-Precision-Tower-5810>
 <ZSVdnAsRQA2zHsF7@lizhi-Precision-Tower-5810>
 <ZSV1nJUAbUdLXkt4@lpieralisi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSV1nJUAbUdLXkt4@lpieralisi>
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: d0af859d-63e6-43bd-82f7-08dbce568dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wz9emdb5KmkVz/nF8OJKoyoP0kmgwEj0k4qMexRZtkpKh3H2PaHnRfy/B5eSvljAfckAxQnk8Rw/Q8qixSweVn4jtFqKnIFIDzj8LQAGLDD6o4roxg7cMAa/4xRVaeOKzRaoOVpiM8vP3JX4edEH690sQNImnsIVWpSCClTzHHn4OGxt0ghxm36jNxOXRvaLbD82IB5h2lccM7YFiLlOzK26aqK1PlgPQ9TH2Tao9mVBNrNuY4i0Jm2jR72j0B60TurGICFzq9A0pTEiho71OuxbAJx5XUkcyHRMveVt1fvj6evvUa+FCYfOrqi/ojmmV8U8mkoBQw6gumyh1oIhKPsvdbXCejrIWjCAJpsh5Ozn1XlCZNOTbWqq8ryCeZxo04J1gk7oXSn8GpGxRoPKhg2F9UYLDMU1YwEAKlkdrCcTx2c5jzKmBW6eNH6FsdCMNRnUy5id9agzdh7uk24tUak0cTg1070Fwkc3huZnLKJr4vfHhvTHGHDZWZMUim6apC+KDGSIOTt3Rrp30N9qoplzpWVb1e+uAFw96BbGNXEyVEkbzsrAaTnTW3c74HMOLftYZAmZ31uMIWtiDycnU/cPciHDdTJPmtRM6P5l/bk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(6666004)(6506007)(6512007)(9686003)(52116002)(83380400001)(41300700001)(5660300002)(4326008)(8676002)(15650500001)(2906002)(478600001)(33716001)(6486002)(966005)(8936002)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(86362001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ng1e64vJlGZily+jD4F8xJp6xrZEcgi4dESEGnc5KkHfUf+CzKWFHO65MMRG?=
 =?us-ascii?Q?wE+FwBeM9rFLkFDt4EjAQC7oNwy25kxE///aWd12ydG/PT4fNhF8LoYCIYWw?=
 =?us-ascii?Q?FbMpwPTisGMuY8R87w86yp5tsF5qS8j6wFFr8+BXQlgvGwn/XK4v3AGhNUgM?=
 =?us-ascii?Q?fg9Ul2ymdsSukS064PHKut1FRLjfmRwWVwN4t+2cEDIHK3XlJhPqjKvYxeAT?=
 =?us-ascii?Q?6LM6kz3V7Goyw98jiyvTy67+9Y2vnGdL6mwv2agq8+jbpBLY2/AN1Dcw66r9?=
 =?us-ascii?Q?oTD54e6rbSF3s2EKDaOL16qYkurAXwDPjpF0E3wFTF8h0bimgvnZxym7xxlf?=
 =?us-ascii?Q?rfceudEoW5+tvWCuSmlNg2hInZpqX+o25OX6F6sW7vtx41q6qZL4fp1t32Es?=
 =?us-ascii?Q?ZaL/A8OKr2knv99fIJ/ORwopTvGpfdoM77ZC0qc911AqWvCfvA5E3BMehDJF?=
 =?us-ascii?Q?6j+LA+fccVhnJOuF3ohlBfQUh1okS5+KVuyq8VWDif0/MNxauwfygMuJkXZG?=
 =?us-ascii?Q?8DAQ0NIRxlUvXJeGBVg/Bs7Xebclbyn0CAHI2cZKZ9QAQXMjd9pOBTZOPwhy?=
 =?us-ascii?Q?kY1u/etoEq5EpzToz3vIxs1onYvp7A7OPKhkE6GmnwD4jkiGFviUMX3P7w5C?=
 =?us-ascii?Q?BKSKHMZ9ebhwBrLrx+8KmEvznHPD1ugidDFcBfrVzbAbmI6nho1qbuXUPA7f?=
 =?us-ascii?Q?pmUGH5a51mNuaxCyw4UoegtMXHQqPp7oiVBvBXw+Y+silLfWz9OtuBR5lOcj?=
 =?us-ascii?Q?dmxYC8VGjCJyfsK/2wGu4rzbJ0tCvqbAzzVu6BLMbCta2oPTIEvRW81XTLDQ?=
 =?us-ascii?Q?s9+iiIJ9nuqdC05jdZQe3AzlWwbyjRcM3dQjyxIOe0SdWUgt0WDGYtisPU4Q?=
 =?us-ascii?Q?O7QTKP7Q/Oy+6xM0+hEXTsQYi7jCTr9bs3NjHsdqy6dzPIbIo7yfEw1jCrNx?=
 =?us-ascii?Q?Fd4CIbn/P7Eq6GO0N4z5HfNZ+hrlkXTGFuX1FYSpeMQmb/5L13oaRgFlGZsN?=
 =?us-ascii?Q?JBvMg00T66ntxsGbl3faxLrTI4xNuZ4ckpAdR5ChaQCEducOuttC7k/WqqzF?=
 =?us-ascii?Q?5rtbYrd65BRDBLGXnRyt0OUA0nqy2u07OzuE15gDBCFTnLTVkKoZf4zPnUgs?=
 =?us-ascii?Q?vyP3fs19XTHIZizt//CtbJ7wSkZvyp+UZoq8h3J03t6K4PKEMf0rbTFS8Lxj?=
 =?us-ascii?Q?LhFNipjqHFt2TnAbLQv0b0LiTnZpBGk5uelR1GfRpX1BJ7oWwhOgC06wOvwc?=
 =?us-ascii?Q?XmwGQTT2lLvoTETdNIliU/Yo/aAqt5mMedZ/N7X5I9Q4r1Own5/yKjo5JzVw?=
 =?us-ascii?Q?U6FLcOAC41Oz/DQA/dbrIs5UJIVnYbkaOvE8NyIIo9S/MfcAfn6q7UP80Qky?=
 =?us-ascii?Q?rLhyDtphf2QUKJJkZ2tDtM1U5iY66Hb2uaNsdiCLVngn7zDLuzeMztPs5LYb?=
 =?us-ascii?Q?7lQxBpyI75uki9NbtAgMkp4/DXMbYhiOurWKx16ACcRo8Q2JXnr4jaWlLVnA?=
 =?us-ascii?Q?YVl0aBrQ33NEUSyJmTGQII9OiN0gR0olQqLuYbkn6vIX21JayQs1P5JBSc6L?=
 =?us-ascii?Q?s86/bpKhG6Ahk1bpkBE/m/40HtV7t3bPYV0/lGvZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0af859d-63e6-43bd-82f7-08dbce568dc6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:45:34.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB9Y9ub4OuzZjnjC3mKeohyx0G4gu+l9dqsxDExLi4+uWHiPycR5eza790G4Q+eMswuqH0cC4j/WJqTwvI+knQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7519
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 06:02:36PM +0200, Lorenzo Pieralisi wrote:
> On Tue, Oct 10, 2023 at 10:20:12AM -0400, Frank Li wrote:
> > On Wed, Oct 04, 2023 at 10:23:51AM -0400, Frank Li wrote:
> > > On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> > > > ls1021a add suspend/resume support.
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > 
> > > ping
> > > 
> > > Frank
> > 
> > Ping
> 
> Read and follow please (and then ping us):
> https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com

Could you please help point which specic one was not follow aboved guide?
Then I can update my code. I think that's efficial communication method. I
think I have read it serial times. But not sure which one violate the
guide?

@Bjorn Helgaas. How do you think so? 

best regards
Frank Li

> 
> > Frank
> > 
> > > 
> > > >  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
> > > >  1 file changed, 87 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > > > index 20c48c06e2248..bc5a8ff1a26ce 100644
> > > > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > > > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > > > @@ -35,6 +35,12 @@
> > > >  #define PF_MCR_PTOMR		BIT(0)
> > > >  #define PF_MCR_EXL2S		BIT(1)
> > > >  
> > > > +/* LS1021A PEXn PM Write Control Register */
> > > > +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> > > > +#define PMXMTTURNOFF		BIT(31)
> > > > +#define SCFG_PEXSFTRSTCR	0x190
> > > > +#define PEXSR(idx)		BIT(idx)
> > > > +
> > > >  #define PCIE_IATU_NUM		6
> > > >  
> > > >  struct ls_pcie_drvdata {
> > > > @@ -48,6 +54,8 @@ struct ls_pcie {
> > > >  	struct dw_pcie *pci;
> > > >  	const struct ls_pcie_drvdata *drvdata;
> > > >  	void __iomem *pf_base;
> > > > +	struct regmap *scfg;
> > > > +	int index;
> > > >  	bool big_endian;
> > > >  };
> > > >  
> > > > @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > > +	u32 val;
> > > > +
> > > > +	if (!pcie->scfg) {
> > > > +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/* Send Turn_off message */
> > > > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > > > +	val |= PMXMTTURNOFF;
> > > > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > > > +
> > > > +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> > > > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > > > +
> > > > +	/* Clear Turn_off message */
> > > > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > > > +	val &= ~PMXMTTURNOFF;
> > > > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > > > +}
> > > > +
> > > > +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > > +	u32 val;
> > > > +
> > > > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > > > +	val |= PEXSR(pcie->index);
> > > > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > > > +
> > > > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > > > +	val &= ~PEXSR(pcie->index);
> > > > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > > > +}
> > > > +
> > > > +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > > +	struct device *dev = pcie->pci->dev;
> > > > +	u32 index[2];
> > > > +	int ret;
> > > > +
> > > > +	ret = ls_pcie_host_init(pp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> > > > +	if (IS_ERR(pcie->scfg)) {
> > > > +		ret = PTR_ERR(pcie->scfg);
> > > > +		dev_err(dev, "No syscfg phandle specified\n");
> > > > +		pcie->scfg = NULL;
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> > > > +	if (ret) {
> > > > +		pcie->scfg = NULL;
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	pcie->index = index[1];
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> > > >  	.host_init = ls_pcie_host_init,
> > > >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> > > >  };
> > > >  
> > > > +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> > > > +	.host_init = ls1021a_pcie_host_init,
> > > > +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> > > > +};
> > > > +
> > > >  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > > > -	.pm_support = false,
> > > > +	.pm_support = true,
> > > > +	.ops = &ls1021a_pcie_host_ops,
> > > > +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> > > >  };
> > > >  
> > > >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > > > -- 
> > > > 2.34.1
> > > > 
