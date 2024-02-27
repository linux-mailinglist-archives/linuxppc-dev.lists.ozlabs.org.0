Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C3D869D89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:27:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lt1it4GC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkkvM16Jgz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 04:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lt1it4GC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260f::600; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkktY4fDdz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 04:26:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofet5vGYyzKWdKHtJST5+C+nR7OO+7EAIbNLBDV59F8GMhn2i4B36CZrqkSN7dN+M0pl5T81w8jteFXwWEdrgHIWckhdVIW8wfml/6SIbcfnFjfwgpCxQpGA77ZvEwtXCr3uMHBp90L3tvLDXLCoT7TqzbirUBwX6CNKt8fsjpFKiRsMFHppbQ9FxuYEeUnnKxjSmhPWPN+nOJ5EME1SaKw3ch/IqN42+9ziF8/TM9wSNnQfji6SvJT3uGZedwgPM/qrNWB95mlVJWePfjpg/Ax49zFX6jYOaCjCx7rOqtDuuKtS4PMGRQPMkeH2+iNOm5rqsNU+Ql3wRrd40DEwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjHT6+jCdSuqD1fjoddQSeL2D029VS+7w3OWL9ABLs0=;
 b=nscEkar/fbJ3k9oaP2U61pyF3E8lnakXsLUMddZB0LrAib1SeDH/PJFRE86vn5NbPXugeyzNwkgcsnls9lRsSwBGx/7cbC4IBwXLk64znmiFHMsb4Rfs0evW9Wt3SUCnFHCDqBPTIJNlQw+npc48fWT0eWI+Sl2wtsm32EbR5Cmy34ewKkJbuVGD+pproLcUsv8ZNWUzjU9b6StDGlVOk3ghdQZoirH7H/CupZkyMDU27NT0U6tj4vp5OE1ycVtabEpey+Nilvyz+dVT8ICpk6LQF09DWipuK/wpAHn0hIr82K/a55ksMGY5/sNQtwV+ur5FU6klLphWJ1G6/beHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjHT6+jCdSuqD1fjoddQSeL2D029VS+7w3OWL9ABLs0=;
 b=lt1it4GC6guKyQia3aNytNpqOqYnXppKpRNKoZhD/5ijj/22Q2NIUpTmWOIjFRcTPQqIF55IIMSVz5Lgqpc9yfnfxhk3gW7SWM7RkEXlHMAn9tI3hOwi5Z65yTdqQFtsyGBsrEPIZ0INuYPzuLob+8VYBryFgBb7qT3GnmuXXlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 17:26:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 17:26:19 +0000
Date: Tue, 27 Feb 2024 12:26:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <Zd4bLZb2z4TEoR1a@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-8-64c7fd0cfe64@linaro.org>
 <ZdzH2lOSwBsIp/Jc@lizhi-Precision-Tower-5810>
 <20240227123024.GO2587@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227123024.GO2587@thinkpad>
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce7e4bb-5bb4-4359-4de8-08dc37b935d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	X7FAJyz8Pun1JrK77CMR/w/ftJme2jqtpoPGNvGw+bUNtcpZK/AU9hi1JC9HL8di3yl1wgV7316ILfNISgvz1Xcy7zfPb+VCsIGXtvu9Ky0cIq/ZFEqkzZKKNhW1OinLfZM5UdtHcyMT4LNxEM9d4EWc7UzNoZZQK0V5KfbgMiqcBa0umoxlg98kKYCU+7Jao9LToiXV8/4dQSAR7Vh9J3Q/M+jbcip8/99IqxQFPvAECDfTZzLkpGg/2KstPecnV/i+YSgwUKkiv+DWJeHcsafoBAx0mdDOD6gnjr7ahk7EybERYwRPLGFwBeautdLNhltmM5UkjOJCclX5eC2FUqWYI5OIqs/Jug6h+j+lGuf4CQsRd9vU5eeZq5p3UFz7GmLHtZCoGOBFoKixCinzx2GEAO3zq/gYCsElHuMSBL13F+VNUtzt21vYv5eD/Ce85Gibl6E1lJm2EZAGdRPSiyvC1jxTvKsrqEkiAlhafKTgVKrHdojNe8fySdXsRko4yaZRIcAWU1Oyo7SXjJQgFhY2sDLUjeUQyddTerXRawQTKqQI652rnLzEVDvKVXl+7elXgpIfs6x7LxvLiHwdzMtLN7835qFh4MFjVQqOOl2oCIXvUPQTPc/NDSSEKpfI3YsFvXYgMoerlqrW5KWjwvTLZsUovmNXUnFs+/vEGB1uzAPkYRq6G/CMx63blTzSNWdIawoul0QM+sah7C735A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NDcybVhSTi9zNEhuTzlRMWhXRDd2d3N2YXdXSkRTU3pIK0Z5dWZJblp0QjdW?=
 =?utf-8?B?Y1B6aHdtU2N2WE5IZW9JN2xsT0dGaVN1bzRzOWtWUmJhdWJlMGdHZTR2c2Qy?=
 =?utf-8?B?UzBtek9aYUpLaGFOVFVyTVJQS2hpSXBHZFptbHZzN2ZGU0tPQ3RjUEF2K05y?=
 =?utf-8?B?azc1ZWVBTCtsWDJLK1ZPTWo4ajk2WGdpRnAwNm1sQzFRUURQWjV1N1dGVWtN?=
 =?utf-8?B?SGF4VTlONm92Szluamg0Vi9rbmNXWXVEWDIxSEx5akFDV2xnc0FjV0tDRWZN?=
 =?utf-8?B?UTFLTzJMaDZuejhrQ0t4L1VBM29tZjR1b3cvT3pLdE9DYWU4bFpCU2NTNEhj?=
 =?utf-8?B?dXZ4YUd3UmQ2UW9UU21kaDlTTjdRZE91UUxuN0dXMXpSZ2RQcTNtZzcrbzBo?=
 =?utf-8?B?amJ0VFZPUXR6TDJXSDhMQ0hMcWdrenByUll3NCt5V0p6dmhtSlczbU91WUhs?=
 =?utf-8?B?OWVRWE5pZXNNTzEybXl4TTl1Uk1EV0ltNnl5TklzVjBZUSt2STNsK3lxUmRK?=
 =?utf-8?B?eXR2Vit0MnQ0TWo4QTFkV0NRYUp0WHFUZUVPcTJxL3FCSzNkREpDYk1aU01n?=
 =?utf-8?B?Z0licnp5amZMQ1BCTld6d1Bac2FjZm9oc0JGQXZDcUdKRDZuclE5cDQzS3M4?=
 =?utf-8?B?OWFjZjhYeWcvNXNIUE5OcUpzcXJjSjRsdTl0NFRzVkl6djFrZDNPUHFGaTJL?=
 =?utf-8?B?ckRkRG16UFRwWVJsbHRLMkcwazI0ekNSNUlkbkg2eWlIYU82cUdYWEFoQWQ2?=
 =?utf-8?B?eTcxc3hVcy85TFRKUzRzY3VOK0VOdkI3YmRzSy9KZXBNb3I5UFA4a0NvcU9G?=
 =?utf-8?B?NnZjMjRBN3ZPRGxKNktDKzBGYXdhYWxlbWJmY0YvMzhGc2xyakJLZnRQVGo5?=
 =?utf-8?B?MEQ2YzhrYVlaSVluZHFZMVVudmxHT1ZqTytiQTZPVzFWRmtlemRJcDZCUzJC?=
 =?utf-8?B?YVNxckVBRHpkS1VjWkpmSHo4WGFNVWJsdDVhKzhkeGF0cklYcHRvY2RaZER1?=
 =?utf-8?B?SFZEazZtNTZTSGVPemNVQW52c1BXdGtOeVUyU1dxZnBEMDFyRW43bkdyNnlH?=
 =?utf-8?B?NXlGT1FWUGVZR0tZbU1IUFMyMExQM2sxWGFvVmtKaUYvT0RSVkdCK1pHZ0tO?=
 =?utf-8?B?LzF5QVFSQU5LRTRubDI3cGEvVlhJQlo3QlZXWFdwYzBoT1BpdHZPd29HajQy?=
 =?utf-8?B?Mms4QWxUNmdueGlQT25ENHE3SEpYZzhCSWNkVWxnUWNjbWFDcytjWmJaT0p0?=
 =?utf-8?B?aWRDUzZhTjVRZG9abkVlNDVnUnVNcWhoekFOUnY0K0hPRDVYVXFJeGt4Z2VS?=
 =?utf-8?B?TzBjYjZEWmNKRDhXYU1Da0UybW1ySEUzZ0NzaXdyNUJWTjB0NlhMWmVtcW5s?=
 =?utf-8?B?cUw1bzQ1dUlHeU5UeW1vUDR3TnEyS1V3RnUwZG83cUZ4U1R0b0Qwem0wVWlW?=
 =?utf-8?B?L1pnbHdwY0FvU1dmcTFPUWdtUmx3eVJ1VEhkeVlQZnV4S09vcDhFNzRIRXQz?=
 =?utf-8?B?UEV5dXRwem54aEhjK0lucHdYb0dEcmZlYVNlQzBrT0k1aWMzeG1na1l6MzNz?=
 =?utf-8?B?RUh6QkJRYUFZMUJHVEhNWW5sQklOcThxanlIa0tDcVcrOSszbkl0eWY1VnRi?=
 =?utf-8?B?ZzJDQVIrdWRKeDZRS0JJTGlpK0hkUC9uM3lJNTdTMmlodTRxOG5vd28rZTFk?=
 =?utf-8?B?L0lNaW5ndUptRWt3NGkxUHdxQlJ2ZStodGU5dGRSb1pxNWF6L0xEeEVhdjV6?=
 =?utf-8?B?blRXVjRjL1doY040UldVNjJLOTdNdTJzamxxa2F5Q3FTcURMakYrWC9oN1BH?=
 =?utf-8?B?L21yZStpYjc4U0JtekhJbkRZd29XMVptT2hCQlZQeURNV1ErWU1MdUhpaThs?=
 =?utf-8?B?UGhJNVNJWjJkUlg1UFQ5YWxHaXdySFRoUkxBZ1djMi9ObjNrS094WndsSWpN?=
 =?utf-8?B?N0hwMjRjbGVlLzhOSzlvbGlZN2p3eHRBVlNsbGFRd2U5N1VCNEg2aUdWRGRi?=
 =?utf-8?B?UnpXZ0VLcW9YM1lnVUE1SmRNL0poNmxYY0RQYkpzaTk4RE1BbXZYemwwTmxx?=
 =?utf-8?B?WCtLUW51MHZXdUJOTUdxTW5sa0JNV2xPYWtzN1pYc0pFME9TU2czd0UrMUl3?=
 =?utf-8?Q?xgzMkhxW0WTFBV3QaB/gq0Vkj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce7e4bb-5bb4-4359-4de8-08dc37b935d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:26:19.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+UkNiXdtx72j0bymdOu2yhtoPGBp9yh+60BP441M9pyNwNchWK4wKvpXN9IuFc70oKm0fElCehzE/raqgU7yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshih
 iro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024 at 06:00:24PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 26, 2024 at 12:18:18PM -0500, Frank Li wrote:
> > On Sat, Feb 24, 2024 at 12:24:14PM +0530, Manivannan Sadhasivam wrote:
> > > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > > 
> > > 1. Fundamental (PERST#)/hot/warm reset
> > > 2. Link transition from L2/L3 to L0
> > 
> > From L0 to L2/l3
> > 
> 
> I don't understand what you mean here. Link down won't happen while moving from
> L0 to L2/L3, it is the opposite.

Strange, why there are not linkdown from L0 to L2/l3. But have linkdown
from L2/l3 to L0? when linkup happen? Any document show these?

Frank

> 
> > > 
> > > In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> > > state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> > > them to function properly once the link comes back again.
> > > 
> > > This is not a problem for drivers supporting PERST# IRQ, since they can
> > > reinitialize the registers in the PERST# IRQ callback. But for the drivers
> > > not supporting PERST#, there is no way they can reinitialize the registers
> > > other than relying on LINK_DOWN IRQ received when the link goes down. So
> > > let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> > > non-sticky registers and also notifies the EPF drivers about link going
> > > down.
> > > 
> > > This API can also be used by the drivers supporting PERST# to handle the
> > > scenario (2) mentioned above.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
> > >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> > >  2 files changed, 72 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > index 278bdc9b2269..fed4c2936c78 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > @@ -14,14 +14,6 @@
> > >  #include <linux/pci-epc.h>
> > >  #include <linux/pci-epf.h>
> > >  
> > > -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > -{
> > > -	struct pci_epc *epc = ep->epc;
> > > -
> > > -	pci_epc_linkup(epc);
> > > -}
> > > -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > > -
> > 
> > No sure why git remove this block and add these back.
> > 
> 
> Because, we are adding dw_pcie_ep_linkdown() API way below and it makes sense to
> move this API also to keep it ordered. Maybe I should've described it in commit
> message.
> 
> - Mani
> 
> > 
> > >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct pci_epc *epc = ep->epc;
> > > @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
> > >  	return 0;
> > >  }
> > >  
> > > +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> > > +{
> > > +	unsigned int offset, ptm_cap_base;
> > > +	unsigned int nbars;
> > > +	u32 reg, i;
> > > +
> > > +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > > +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > > +
> > > +	dw_pcie_dbi_ro_wr_en(pci);
> > > +
> > > +	if (offset) {
> > > +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > > +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > > +			PCI_REBAR_CTRL_NBAR_SHIFT;
> > > +
> > > +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > > +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > > +	}
> > > +
> > > +	/*
> > > +	 * PTM responder capability can be disabled only after disabling
> > > +	 * PTM root capability.
> > > +	 */
> > > +	if (ptm_cap_base) {
> > > +		dw_pcie_dbi_ro_wr_en(pci);
> > > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > +		reg &= ~PCI_PTM_CAP_ROOT;
> > > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > +
> > > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > +		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > +		dw_pcie_dbi_ro_wr_dis(pci);
> > > +	}
> > > +
> > > +	dw_pcie_setup(pci);
> > > +	dw_pcie_dbi_ro_wr_dis(pci);
> > > +}
> > > +
> > >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	struct dw_pcie_ep_func *ep_func;
> > >  	struct device *dev = pci->dev;
> > >  	struct pci_epc *epc = ep->epc;
> > > -	unsigned int offset, ptm_cap_base;
> > > -	unsigned int nbars;
> > >  	u8 hdr_type;
> > >  	u8 func_no;
> > > -	int i, ret;
> > >  	void *addr;
> > > -	u32 reg;
> > > +	int ret;
> > >  
> > >  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
> > >  		   PCI_HEADER_TYPE_MASK;
> > > @@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >  	if (ep->ops->init)
> > >  		ep->ops->init(ep);
> > >  
> > > -	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > > -	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > > -
> > > -	dw_pcie_dbi_ro_wr_en(pci);
> > > -
> > > -	if (offset) {
> > > -		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > > -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > > -			PCI_REBAR_CTRL_NBAR_SHIFT;
> > > -
> > > -		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > > -			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > > -	}
> > > -
> > > -	/*
> > > -	 * PTM responder capability can be disabled only after disabling
> > > -	 * PTM root capability.
> > > -	 */
> > > -	if (ptm_cap_base) {
> > > -		dw_pcie_dbi_ro_wr_en(pci);
> > > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > -		reg &= ~PCI_PTM_CAP_ROOT;
> > > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > -
> > > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > -		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > -		dw_pcie_dbi_ro_wr_dis(pci);
> > > -	}
> > > -
> > > -	dw_pcie_setup(pci);
> > > -	dw_pcie_dbi_ro_wr_dis(pci);
> > > +	dw_pcie_ep_init_non_sticky_registers(pci);
> > >  
> > >  	return 0;
> > >  
> > > @@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >  }
> > >  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
> > >  
> > > +void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > +{
> > > +	struct pci_epc *epc = ep->epc;
> > > +
> > > +	pci_epc_linkup(epc);
> > > +}
> > > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > > +
> > > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > +	struct pci_epc *epc = ep->epc;
> > > +
> > > +	/*
> > > +	 * Initialize the non-sticky DWC registers as they would've reset post
> > > +	 * LINK_DOWN. This is specifically needed for drivers not supporting
> > > +	 * PERST# as they have no way to reinitialize the registers before the
> > > +	 * link comes back again.
> > > +	 */
> > > +	dw_pcie_ep_init_non_sticky_registers(pci);
> > > +
> > > +	pci_epc_linkdown(epc);
> > > +}
> > > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
> > > +
> > >  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > >  {
> > >  	int ret;
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > index f8e5431a207b..152969545b0a 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
> > >  
> > >  #ifdef CONFIG_PCIE_DW_EP
> > >  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
> > > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
> > >  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
> > >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
> > >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> > > @@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > >  {
> > >  }
> > >  
> > > +static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > > +{
> > > +}
> > > +
> > >  static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > >  {
> > >  	return 0;
> > > 
> > > -- 
> > > 2.25.1
> > > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
