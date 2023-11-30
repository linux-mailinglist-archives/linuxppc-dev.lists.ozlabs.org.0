Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2C7FFC5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:19:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=V9ij63/B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh6wS0Bwjz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 07:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=V9ij63/B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::600; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh6vY5tYpz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 07:18:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcyPuhDGJuQ0h2cVAmsoWJQ4OLsWRctkl/TlZS+0S2D8E79G8Ao+q5dspgvSEupDXT1mLP6gt6qtOsOP/J+UcbLxNyzVlQMMF09nSI5/q4SjSOuVokeTgsbt0fNd901/d4gWUhJ8an9V9kv0yInFEy1t5B54tRNg7+HoYdffeHcYrIZUPjCqziKO+D9SxaS0kb4/sZqYgfbDwyWlWy5iGwlpmJnGTCu4Jstsj3N27Ai05dFYcs/Yr0wdDdnru3aCMgrICCdfZjTHiqcmpClWsDsBD8dqLvwJD89YSUOTE4M2jyQBB+KukWqG13T3kqFNymbOPhu6KzexYfNZZhAykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6d2dxoOPTVQLUSqU3ggt4ZWS29MC9i2Alq0HpoNNsw=;
 b=UTriP18QkYAPQP560AkIDijaxqU4/5shIbiLsJDihY80jCKUmo5gCxdrQY3vdaYEeD+4IDclWwEejPcsyIYnLAo26YsksEG3Sbza8xaHYVDRj1D3Qix3i7QyuWhZoZ6S+6pU3V9kcW+ENF9ueHQblbSzvLjRjbUKkqx1gdUPgalSeO0QQ0amSZZ/duPe5isYgrYjE2ceOJSkAGQxt/1YfIeNNqm8H3vCxZHpC9FevvJrQEPgVbHBfn/VC9X8fiZIfY00HV6HrH4P7L64dkRaNv7R7/ZQ6KyJO2c0M0gA03wwB7gRpoPIjWC+41dnUeB7ZuwTryzPGeIYUn+fZc7w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6d2dxoOPTVQLUSqU3ggt4ZWS29MC9i2Alq0HpoNNsw=;
 b=V9ij63/BqDb6iZqaIvQI/uzpySBigOU6ipMbk5aR1Ldjqecjc8TXEqRx4zmvSn1EqjOiJZH4ppE9F8NM3JBpEaexZO1tV3b1jqoVxdZzAJ7HRiWSo8WfkmcaisJgcrFjB1jdlF141WmaZDJJcyrjcc8N4fhm0iKgq3vFmDQb9eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 20:17:47 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 20:17:47 +0000
Date: Thu, 30 Nov 2023 15:17:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <ZWjt412xtyZWVjdL@lizhi-Precision-Tower-5810>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
 <20231129214412.327633-5-Frank.Li@nxp.com>
 <20231130165100.GV3043@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231130165100.GV3043@thinkpad>
X-ClientProxiedBy: BY5PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::16) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: b23661c9-8a0d-4b5a-8fb4-08dbf1e16b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UpIrmstMw2HNIrIflCXkcCwQQLTbks4pEUqLE8HE9i6dwnnMoRrBgBS4E3tqFt5DR7y9BCHzIe+AP2deNqHDlvpCRDRVOk9tQhWPtr5Kf/5M0OIv7Q/AnGpPQpkpu0CN1D1DJSHLE+9llr3sURIdK9VjoJi5W9BUPqgKToxFfknzL7Jz9UksCEgyIgMEf6OcK34DhI0ZsyXo1nYE0rIhB+BEQU8bMK0bcYsRwkFvobUd2CbUO8x+BiliEvgTWBk+2JE8kvgh+sAPHtwruiKvtiQfPIqnKsynKsia9k7FF/Zj59lzW9MNTnSzIINPZ42v58sl4TPw+gRkcND5MCoPkIWtS49d5iOtbGUPl6or4L0Na13HR4qFsJMiHtGNPuD4MosIBl7q3Xa0k+c3Ca9RtoJV5GyrYwgSTnTsCY5OhXrZND3Tl+aTYpH4I7wKez3v5T93+nbrHLaenPulh8ORNm+9pvwwKA+cnPhoQ6DLkHP8AZcGGJ5++BKERvVZ9P3NSIvdVM8JLqHEEaQ4BRUoH+raQB0PqGQ4sEKwz1RoZmnG+HGMDd+FjTvDGvZB46yN/NBBj7T25Y5Nxsm1zYp2Wmswd3MqSEljua5zfkEKW2lfZPUsgUgk6eYIQURG5BdCiGfBWvIPnmBEEJr3ih/++OkqvpNJkdmBv6YRjMMsJnw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38350700005)(86362001)(66946007)(66476007)(6916009)(38100700002)(83380400001)(26005)(6506007)(6512007)(52116002)(9686003)(6666004)(2906002)(316002)(33716001)(66556008)(15650500001)(6486002)(8676002)(5660300002)(478600001)(4326008)(7416002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Wk92cmJTeGxqNjBZTUIvMlprUjdQQjVocTR0UEpCOU9MWjZaQkFOeFhxaDN4?=
 =?utf-8?B?OTE0aEVTbTNBZ0FUQ1FYN21mR3Zuem1lZElZakhJMkc4dWdkSjhYYzc4T2cy?=
 =?utf-8?B?djhheVVZZDY5NTkwMGlySE9hSHlzckc4OUU5bzBWNmhuK3c5a3F3VDg4WnNs?=
 =?utf-8?B?dFFhYytOSnJOTERvZHE5SmdETHVTRzdMU2lKWHJ2dThFTlZURGxGamROY0Q2?=
 =?utf-8?B?OVVlN1FHdlJLeHN1Q1ZlUy84VnlKemhGOEh1QmNrVjB4SzU1b1RiWG1zY0JI?=
 =?utf-8?B?czNLMlZjNVRRNThpNlNBQVN4c2pqMjhBY2h5Slo3bTVnNHpUN202dmloOU8z?=
 =?utf-8?B?dmhEaS9uZTFqRnhDdzdXVTJWQWZRdGJEUkIray9GQnZ2dytsa3c2dDhmMW42?=
 =?utf-8?B?S2NyV05OU2lEMUZFM2dlbGZpVnBrK0dBeUJZTStscEdkb01mVkpqcWFhZ2k3?=
 =?utf-8?B?cUNsWU1GSFY5bXphaUVrYzhscXZibTJNYzJsQW9qVFovU2tFL3lKbUp4VThR?=
 =?utf-8?B?TzVJV1Z5Z0dOUks0eEpoRVVZb2lGem1sZTdHQUZKVkl3cHUvem92S0J1RlN4?=
 =?utf-8?B?UDI2bVcxK29pcHNDWGk0QjlSTDgzTWhFV1JlRmluS2hGQ0diYlZZZkJVc0Ux?=
 =?utf-8?B?RXBTSmNLYjI4TW5ReXlFUlFxT1dUNGhEZEZoQWYrWExMODdFamNnSHNOTnpG?=
 =?utf-8?B?OFNURFZNUm9xdVA4N3RCQTNDVnNxbVVKcUNvWjh6OTgxUS9QdURtTDdaZ0hP?=
 =?utf-8?B?WjM3ZzFrSHc2Zjc2ZE5BcnlVL2tBenM3Nzc3ZVA4SExrSDBqV29kTXJXaGYx?=
 =?utf-8?B?dGJVaFNNcDIzZk9MK1FFODdrRnlzU1J5RCtjdnJldlhlNU8yajVlZ3JGUEZk?=
 =?utf-8?B?bm12MldsdzJKM2wvR3R3V0pXWU45TTMrQUlyS3Y4bDk5MnBUaDhuZjdQcFln?=
 =?utf-8?B?QUViVnl4ZTh2aVN3Zk9DWXo2emNBRTB2WWQ5SkdBSm5YaXhBVkZmUkpVMkhj?=
 =?utf-8?B?eFV0bk9xYmJSY2tqMy82b29sVzMva1JpSiswSFA2Wjc4NjVLU2RNOE5uTE5R?=
 =?utf-8?B?UGUra2krcldRWFRJNVZqTktyVlYyVWlNMFo0Zng0dGE0aDFVQndkMmhDQWRP?=
 =?utf-8?B?bG5rbHo2QzkrZ1RvODQvL0FoQjZCci90NXIwZ25URjVibzVGbGRIeWkvZFdn?=
 =?utf-8?B?UkU3SXF3bXVXVWQ1UThpdEZDL2JueHJmQ2hNT1RBZ1F4czhWUUU1N1ZXQ3Zk?=
 =?utf-8?B?dDc3ekxWTWtuREtzRTVselI0a2JIYnhINU9IY3J5a2h0OGVGdkZET2hOVHQ3?=
 =?utf-8?B?SzFNSTF6d3ppN0NDV2V0Z3NjZ3B0MjJhWFYvSEkvM2E4ZlRUOHlsQktENmd1?=
 =?utf-8?B?Yk00bUFWYUR2NlNKNUYxM285UUhLem9RSWQ2OU9Hd05xSUZvbGtzdTJnd0Ja?=
 =?utf-8?B?dTdOZmdMb01jcmpBaFBkSWxIZCt5MzNxUHNLTUVUQUZreUpHenVFdmxwSmc1?=
 =?utf-8?B?RURUWWRCQzRsSlZjcHY5dCtFSFk0Mjk3bzZSSnVoWmdwN0NWRnJpWU8xTXBU?=
 =?utf-8?B?UVVVaHNYOGpjR3hTWEZoOEJvVEpicjFxcUpqZlYzMyszMFFobTYwZ3Faa1hI?=
 =?utf-8?B?Uy9mR1AvTzQ4ZUVQdm00T1JhQUFUSEJkNnVMTytGWEtTODVzemcweklYRnFw?=
 =?utf-8?B?T0dHTjQrQmJjY21Kcm0xUWdGN0JVZExiTHdhQmpqbjBtN1AxcmFjREFybCsr?=
 =?utf-8?B?YmJEbktwQUN1SUM3WFY3VHR6eHI0R1NWTVhLaFJFNEN3VXkySTVlaTZTdDVq?=
 =?utf-8?B?ZlZveDVKSWNXWW1MdW96MEt0dHRvQUdyOE1lcWZ0SmxHU2d6OVIwUW11QlJU?=
 =?utf-8?B?aTdFYjFuM2NVcko4cWErbmV5Rm1qc2FSVmIvSFNRMzRvQkVNYUlLeTFwWnZX?=
 =?utf-8?B?WHQ3Q3pGcllUTGhhR2E0aDl4alBDSVB3R055N0JPdkRKWVI5R1lqclBDemZx?=
 =?utf-8?B?Mk1PeGJrYTczNTdjWFVhQ3lkQUhZRUxaV1lFWjdoNTF3Z09OMGwwQWwwUS92?=
 =?utf-8?B?ZkJtK09yUGE5bDNIU3RwTlVieHdIT0RWUHQ2Vm5qVlRhOEZnYnVRWlpoQzNX?=
 =?utf-8?Q?JOa4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23661c9-8a0d-4b5a-8fb4-08dbf1e16b10
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 20:17:47.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a94QdLmhZOBqXBW/9g/vIBLeicBcFf3kDqS0L29EGPIV7OXhEiU8u6lI09qFHQq3bb7zDKps/bCsckqCHVVFIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838
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

On Thu, Nov 30, 2023 at 10:21:00PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Nov 29, 2023 at 04:44:12PM -0500, Frank Li wrote:
> > In the suspend path, PME_Turn_Off message is sent to the endpoint to
> > transition the link to L2/L3_Ready state. In this SoC, there is no way to
> > check if the controller has received the PME_To_Ack from the endpoint or
> > not. So to be on the safer side, the driver just waits for
> > PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> > bit to complete the PME_Turn_Off handshake. This link would then enter
> > L2/L3 state depending on the VAUX supply.
> > 
> > In the resume path, the link is brought back from L2 to L0 by doing a
> > software reset.
> > 
> 
> Same comment on the patch description as on patch 2/4.
> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > 
> > Notes:
> >     Change from v3 to v4
> >     - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
> >     - update commit message
> >     
> >     Change from v2 to v3
> >     - Remove ls_pcie_lut_readl(writel) function
> >     
> >     Change from v1 to v2
> >     - Update subject 'a' to 'A'
> > 
> >  drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
> >  1 file changed, 62 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 590e07bb27002..d39700b3afaaa 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -41,6 +41,15 @@
> >  #define SCFG_PEXSFTRSTCR	0x190
> >  #define PEXSR(idx)		BIT(idx)
> >  
> > +/* LS1043A PEX PME control register */
> > +#define SCFG_PEXPMECR		0x144
> > +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> > +
> > +/* LS1043A PEX LUT debug register */
> > +#define LS_PCIE_LDBG	0x7fc
> > +#define LDBG_SR		BIT(30)
> > +#define LDBG_WE		BIT(31)
> > +
> >  #define PCIE_IATU_NUM		6
> >  
> >  struct ls_pcie_drvdata {
> > @@ -225,6 +234,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> >  	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
> >  }
> >  
> > +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +
> > +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
> > +}
> > +
> > +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	/*
> > +	 * Only way let PEX module exit L2 is do a software reset.
> 
> Can you expand PEX? What is it used for?
> 
> Also if the reset is only for the PEX module, please use the same comment in
> both patches 2 and 4. Patch 2 doesn't mention PEX in the comment.

After read spec again, I think PEX is pci express. So it should software
reset controller. I don't know what exactly did in the chip. But without
below code, PCIe can't exit L2/L3.

Any harmful if dwc controller reset? Anyway these code works well with
intel network card.

Frank

> 
> - Mani
> 
> > +	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
> > +	 *	    clearing the soft reset on the PEX module.
> > +	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
> > +	 */
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > +	val |= LDBG_WE;
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > +
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > +	val |= LDBG_SR;
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > +
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > +	val &= ~LDBG_SR;
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > +
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > +	val &= ~LDBG_WE;
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> >  	.host_init = ls_pcie_host_init,
> >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> > @@ -242,6 +290,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
> >  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> >  };
> >  
> > +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> > +	.host_init = ls_pcie_host_init,
> > +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> > +};
> > +
> > +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> > +	.pf_lut_off = 0x10000,
> > +	.pm_support = true,
> > +	.scfg_support = true,
> > +	.ops = &ls1043a_pcie_host_ops,
> > +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> > +};
> > +
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> >  	.pf_lut_off = 0xc0000,
> >  	.pm_support = true,
> > @@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
> >  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
> >  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
> >  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> > -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> > +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
> >  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
> >  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
> >  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
