Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F297FFC65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:23:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YrPS4NiX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh71T5HThz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 07:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YrPS4NiX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::61b; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh70f36c0z3cRD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 07:22:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4Iqp4jI4ivTDxynlLB/BujNgzUMFF6W4l/vjL7R7jU8SzspDFrbikgpNoA3RJlmhWoNA4xqs7F+NimJU3eO2I2+7kXri3Ic9eud420nYoW+RYkb7kHE6I+q+zUAeGk28TwmvuV3MCdLDty4nbO+3D6V7Uytl449P92X5VkOtausxHXyBO/ybv0OsYtdZOvh4zb4WyC6fkA2O7vYX2DIjMNzU96AoJJZ1jZ6arlYKueVypbOx7UCVKqwgCcu6mIUuF0PWolT+yftceyEJXNb4ywoPooXLEEM8z0EYz6bwun3RR2PCN4rZstAKaGf2f2nit//SmWHXMyoXJBREKk+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNEYgLR8lZfNLdch+CpRImkHKu5C7Er52qddf/Bg11Q=;
 b=RMs0IPZqgXXY2QXJlVCyNugDGOakvlpSMiuDLYNN+Cn8MpyyXAvH7iL9uiMVvKkE+W3pd+WzkKOjbu56seUUK1QJVy2/Ik7Luu+D43sCAItmfKYXSlAJRI8+cYvQZSLpAnz4gbgiaq1wITKUDyUAV1FptTfJzBPp4JGBlU809BvOJO5e1U2r0F5+HfcMz6mDY1aPqdEmRxSXNe9/AeG2rRHZUdn+VU2baaKu4Eqaa3xrb5XZlPeaOp6LleKSiHgMTxg2GUhaOBYrdOSnBH20126lUf5peug+TS/HwxwR47tU34z8xnjmYSeQTZzTT94UYAqDoJGGUzAaqFVkb6HA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNEYgLR8lZfNLdch+CpRImkHKu5C7Er52qddf/Bg11Q=;
 b=YrPS4NiXDyZHqRrbNAjzObTVdubu3Bp/H2JfdjTZ6ueBdZiTTCAMUxFApWB+lYyLb39x6aeXJB3eUBFoJXMySD6CGmGf+xmApPLidRYePPuMRf0gBQ7t4oj2fDtW6OobAPmB9YgGOR8Nwokm0kxzBH6hY9/tO8Tw04FQXD8awJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 20:22:22 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 20:22:22 +0000
Date: Thu, 30 Nov 2023 15:22:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <ZWju9s/HBS7jNTYX@lizhi-Precision-Tower-5810>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
 <20231129214412.327633-5-Frank.Li@nxp.com>
 <20231130165100.GV3043@thinkpad>
 <ZWjt412xtyZWVjdL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWjt412xtyZWVjdL@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: da5cd070-efe9-4c81-4155-08dbf1e20f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8GanVi4RU+WbN5SihxamlEspCCvf4bCTw3B1ju3lI3kGVBz/cJcd656xPU4JDAnXnBcjOTxTyuWallwjTLkEgu9eY5LmnAgcR18vHrQ0k0v5SQuQ8QLcX5yxSLvX74GsknrgkX4/JK0x7oXo6oeZvlg5ku8zOawMEPA1GmIW646qnx0nHQgGarBig/TqO6x81iiPabyBOezNpzGEwgl5AOMKSkCJihJKC7OP8NTJXtwHmj/94EXVU+kWyY8YjMlTpfnelbsfYKLbXsDpfBR2pwNFN+zocbcPeh2WfID+Abrg+/ptp5cCUcRDNgP3vQePEYEn8IBW5MfSvu5k3Koxt958ZfNbdo78/1PF8cm8rDUrTpZgVW2KuqAUHcrQj4X2q0OLc/a579FU/UrU+kCDVP6Me7HmooLygmK+wtqR1pYd9Y/J7Yu+Mtl3ZAIjBy3rFm10/CWoyI/2BxoJdvS2xwR1F25IiRI3Im96Szu/jI5PnL+c1JRW5ICQtuD5H/Nl0JTjGMpqqmxIZST4hlNmRiRMT0G53Ni3YmjVtAi2RTafmFsy6jhgCxRKzanVNURT20Q3Yx4UaU5ySVrfLu1QpHqSnyGOkvFUCoE3fDfWX+fmb4hGQcrZp+GhRqeZORBE+5to7Vpgy2fNXxL9bmqNRogCkbNqUnlescikmVsMzNo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38350700005)(86362001)(66946007)(66476007)(6916009)(38100700002)(83380400001)(26005)(6506007)(6512007)(52116002)(9686003)(6666004)(2906002)(316002)(33716001)(66556008)(15650500001)(6486002)(8676002)(5660300002)(478600001)(4326008)(7416002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NVExSm1XMThIckxBeGg4SE40UTNvMTFwaHdZSDR4ZitvWVRRNU8xV1dkZDFF?=
 =?utf-8?B?U0E0MVJabEcyczlRQkV2TEluSFVkSktGY3JYV2FOaUQ0bjBJL2dLNHNMamY3?=
 =?utf-8?B?ZklMWXdoOGpVY0dSc3JTaUZUeFY1dU5WcE1Ib0ltYkpma2pDQ1JGb1RTRnho?=
 =?utf-8?B?Z3ZIMElHYmFUUjhOVEk4b0F5ZUFPRzZDSlBwY2hLMlY4bjkzR0tKVk1OVkxz?=
 =?utf-8?B?U3BGc245c2ZRQy96U2YwbmJaR1ovajQwSkxiODNEK2NIa3k3TEZLUVBzeHZh?=
 =?utf-8?B?QWo2RDFpUGc1U2dKaFBORUlVamtNeXlmOEhLVlcyN20zYTJsVnJXVHdqYXI4?=
 =?utf-8?B?a2pubE1YQk1LZ0RLUExEUFlITU9tL0FDSzYvaVdZRnMwb01qSXkweXFOSUtr?=
 =?utf-8?B?V2Radk8zK090ZjdjR3JzQVlDOHQ3NkNUQkIycko5N0tGTmpvVS9rR2dOYnlx?=
 =?utf-8?B?T29kZW5sREcwNVJDdFFlbjR6TGIxUFZmdERUS1hIa0JMRWsvT3p1VTE5VGEv?=
 =?utf-8?B?MXZkbk9LeHgvaWV0ajVpbzgvejVtK0Z3YkdYNU1WcmVUcThXaFBrNlRWcm8x?=
 =?utf-8?B?ZXM4YXdncm14TXhTZzlvTkZBV0ZCSkk1S0t1ZkJoeWlZM3lKL2JhSzZhV1pw?=
 =?utf-8?B?R1ZWd2pRaTk3ZTJhbVc0RFVxczh3STFlNXJnQjNML1A3b214dXM0V1Q1U3RI?=
 =?utf-8?B?SmRGRGZRM0FsZ0NLZnBPU0QwWXVaYXJOTjAyN1E1Q2dqcXI1djEzaDJvTW9y?=
 =?utf-8?B?QjNuUjRxK3FxV28xVTNDN2tKMklZS2kwbWE1bFMwQXFpMjRoSmZSdW9vd2dH?=
 =?utf-8?B?ZW1xczQrQjAveE9lZ2JJTk00bEVuamlrelp2TzNZK1Boc0RnK0FVM1NhNWg0?=
 =?utf-8?B?aXNtWWFUaUFoLzhCdVRjbmFTekVNMlN2UmtKZFVrNmtIb01JREdkOCtIQTQz?=
 =?utf-8?B?eTc0S3FkSkVNbjcrbWVWSURnZjZUZkpORFAzQ3JKOUhKN0lvUjNmelVZTlpm?=
 =?utf-8?B?MHhJblZYUHpiRHREUzh4SWQxMHdsd2dJSU5FVXZnUVgwOG4wN0hzV3diVmRI?=
 =?utf-8?B?dHFHRk5kRkJTcTlJczBBVnJEdUF0Yy9Oc21uWEdtWXFyS3JtNEtsZmpFb203?=
 =?utf-8?B?K2l5V3RzWkZvZ29BMVFhVjF6VlMvOHhCZTgrVlVDQUx3VW9ZcnEySGtVWDFN?=
 =?utf-8?B?d3NOWUN1KzM0Z2lGOTI1d2kwa1lnMUJ2RXB4cXVOR29kVVdQZ0g2c2UveWpj?=
 =?utf-8?B?dWhxaHRBOFBMOFdvQ3Vobk5UeUlCbnd1R1FNTk5zWkYwK0RYVXFPbW8ydFc5?=
 =?utf-8?B?MjJSU2tDcWdBNnFZbXRRNU1pM1BKN0xrU1ZnOVFWS0NBTHNVMW54cDNBSnd0?=
 =?utf-8?B?TWl5M1U1dEpPSDhsaFlUTWZkcG1EUnVJUUovd1BDTkV0M3oyN25KUWpUUnE2?=
 =?utf-8?B?WkRmZjBsRytyeFcySy9mQ1oreEFDUkFyOWNzY1hXQjhyS3hoSERRZDc1MUdE?=
 =?utf-8?B?cFF1djJOV3hyb3RGdFUxUTlNWWtLMXB1Ymw0dTVDQ2ZRSXQvVzNHOEkwWjFt?=
 =?utf-8?B?MVZFdFozcmZ0WDRyYWtSQW1RRTRJalBSblQ5L2JHUlVSR3VuL2NtRE5seEVx?=
 =?utf-8?B?NjhNdUJRcFlFMXpNMDJmbDJMbjNneWU2ek5qbUR5aWluR0NnemhCSVk2SFlx?=
 =?utf-8?B?TTdMbElTS2JoL2JsUEM1ZjlQZlUwUnY1UWt2ZnEvYkhwenEyb3EzRytCcFZa?=
 =?utf-8?B?NXpVQ0dvVGQzWTJyb2R2SmJuRkZ1czlVUW5ReW9IZWRUb2RCMEcycllBNFpT?=
 =?utf-8?B?dGlNQklvWXZnbVpncHNsbnVFMUowam9jY29oTHloSnc0ZzZsaWRERG5WTGdM?=
 =?utf-8?B?MFNQc3pWVmJZZlZZK3VrWmFrWmFqb0lFNXhXUStwZmJ6ZnFmN0JhRXM1Q3BM?=
 =?utf-8?B?RXdRTXhyTTREOFBoVUJQZVF2SFZvWm8yOFl2aXJjOUh6TUVSWkRvZnE5d01W?=
 =?utf-8?B?bFc3MTlnV0ZFa28wZVN3anBvakcxU2lDZEkvcXl6MnZpa1B6NUVGRGYvQVlu?=
 =?utf-8?B?dGNMT0VWRElYeDB3N2VwemJDQ2NuNURJeXZ1VTNlMmRmWXhoT3ptcEI4OW9O?=
 =?utf-8?Q?RHgaKgk+W7wJ6GDKRHDp/xUiy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5cd070-efe9-4c81-4155-08dbf1e20f71
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 20:22:22.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIQGndyN9FxLOkmD1z6F/F54lG4Zygl0EtWL3kA+Qsdn1NPEEgzyqnWiegXZkekCa/l1+gYSBYF5h+9tV1kDrQ==
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

On Thu, Nov 30, 2023 at 03:17:39PM -0500, Frank Li wrote:
> On Thu, Nov 30, 2023 at 10:21:00PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Nov 29, 2023 at 04:44:12PM -0500, Frank Li wrote:
> > > In the suspend path, PME_Turn_Off message is sent to the endpoint to
> > > transition the link to L2/L3_Ready state. In this SoC, there is no way to
> > > check if the controller has received the PME_To_Ack from the endpoint or
> > > not. So to be on the safer side, the driver just waits for
> > > PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> > > bit to complete the PME_Turn_Off handshake. This link would then enter
> > > L2/L3 state depending on the VAUX supply.
> > > 
> > > In the resume path, the link is brought back from L2 to L0 by doing a
> > > software reset.
> > > 
> > 
> > Same comment on the patch description as on patch 2/4.
> > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > 
> > > Notes:
> > >     Change from v3 to v4
> > >     - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
> > >     - update commit message
> > >     
> > >     Change from v2 to v3
> > >     - Remove ls_pcie_lut_readl(writel) function
> > >     
> > >     Change from v1 to v2
> > >     - Update subject 'a' to 'A'
> > > 
> > >  drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
> > >  1 file changed, 62 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > > index 590e07bb27002..d39700b3afaaa 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > > @@ -41,6 +41,15 @@
> > >  #define SCFG_PEXSFTRSTCR	0x190
> > >  #define PEXSR(idx)		BIT(idx)
> > >  
> > > +/* LS1043A PEX PME control register */
> > > +#define SCFG_PEXPMECR		0x144
> > > +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> > > +
> > > +/* LS1043A PEX LUT debug register */
> > > +#define LS_PCIE_LDBG	0x7fc
> > > +#define LDBG_SR		BIT(30)
> > > +#define LDBG_WE		BIT(31)
> > > +
> > >  #define PCIE_IATU_NUM		6
> > >  
> > >  struct ls_pcie_drvdata {
> > > @@ -225,6 +234,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > >  	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
> > >  }
> > >  
> > > +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > +
> > > +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
> > > +}
> > > +
> > > +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > +	u32 val;
> > > +
> > > +	/*
> > > +	 * Only way let PEX module exit L2 is do a software reset.
> > 
> > Can you expand PEX? What is it used for?
> > 
> > Also if the reset is only for the PEX module, please use the same comment in
> > both patches 2 and 4. Patch 2 doesn't mention PEX in the comment.
> 
> After read spec again, I think PEX is pci express. So it should software
> reset controller. I don't know what exactly did in the chip. But without
> below code, PCIe can't exit L2/L3.
> 
> Any harmful if dwc controller reset? Anyway these code works well with
> intel network card.

Sorry, sent too quick. It is PCIe express wrapper

Copy from spec: 

"PEXLDBG[SR]. Once set the
PEXLDBG[SR] will enable the soft reset to the PEX wrapper."

Frank

> 
> Frank
> 
> > 
> > - Mani
> > 
> > > +	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
> > > +	 *	    clearing the soft reset on the PEX module.
> > > +	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
> > > +	 */
> > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > +	val |= LDBG_WE;
> > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > +
> > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > +	val |= LDBG_SR;
> > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > +
> > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > +	val &= ~LDBG_SR;
> > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > +
> > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > +	val &= ~LDBG_WE;
> > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> > >  	.host_init = ls_pcie_host_init,
> > >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> > > @@ -242,6 +290,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > >  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> > >  };
> > >  
> > > +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> > > +	.host_init = ls_pcie_host_init,
> > > +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> > > +};
> > > +
> > > +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> > > +	.pf_lut_off = 0x10000,
> > > +	.pm_support = true,
> > > +	.scfg_support = true,
> > > +	.ops = &ls1043a_pcie_host_ops,
> > > +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> > > +};
> > > +
> > >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > >  	.pf_lut_off = 0xc0000,
> > >  	.pm_support = true,
> > > @@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
> > >  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
> > >  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
> > >  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> > > -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> > > +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
> > >  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
> > >  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
> > >  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
