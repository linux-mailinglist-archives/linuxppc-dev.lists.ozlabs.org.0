Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14118869DC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:35:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lbM/fVH9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkl4Y5mcZz3vXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 04:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lbM/fVH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::601; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkl3r23r9z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 04:34:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=le4OiT3C7+GzA/74eRLPhyzo6UT4fV2WmraA6J1H8dUew5ck2gPe3JjJFqSAYkwv63rw8p9a8GMp0Soe9x6B4iFNmmf+nfRn8J7oT4NKbV0CxhQe3sSHe/S43tvs6IFmnkHR9Q+nYW/WEdaFiCDuvaiyDa9b5wHsntLbuhcuxU6MU3qZdoVfJdcIAderDxeict2TeSWS8mJ+jRthBYq19Q6gwI7KdrZttrhoCypKv/QhnBEDJbCIKCzcSh8bKUCuAw5w99qQwK7QElkBVKLLrfD8u6dy/lyNuTHyqmiOEJ5jD/gNMyPaiSPaU44bjaXGpMhnT7VRbltMsrAOynhFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFZ5vmbctW+lZSnmeEDU0E16ZcjcXcndHr6+EwaDqBw=;
 b=AmEwTbpoCWggcP7UrNydQhbAANDN+Sl4SUFZwt0mrE7CzVAcraADbqhVZ8K+8+x+yX+oW6scyZS9LxFVdbd5dCwK+GjEXEWTguV36Ru0rHUPellSxp8AAgiEiF0PlzifYdRS+4ikEhJJHiuwL0rFK8C8Q1FhodJq1rKs9M3laxFvTLAgbCOpr4TwcaBHXfGV4P7jxybmoMAjOTnwKqF743wDQoOZeKZ9qEgN7MFcXZgCH2xMmnBi8hjLFWoRKKfflrgg/g00p4v5TqIDOJSN/f0xDSzCN3GKQLKqpvYVGu35Ns6JNPKLUqqpdrhsy4ojcdojIgpA5iIuI0Jd41AA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFZ5vmbctW+lZSnmeEDU0E16ZcjcXcndHr6+EwaDqBw=;
 b=lbM/fVH9kGZKokgknj2I70j8Bkmm1NUgHneUavR1VXX69Nq5MIb+yz5pYcGXoddTPl2xVpdvhbYe25+cKbOBj9ddDbwkTemvkMu3SUepsmtuQRXVQjDRGF3/NQ2VYyv3DPtw7avMv87S8z/novWHb8lGOmNhVD2o/zfsV2AWPkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10171.eurprd04.prod.outlook.com (2603:10a6:102:460::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 17:34:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 17:34:27 +0000
Date: Tue, 27 Feb 2024 12:34:15 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <Zd4dFyM78Nc1f7fk@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
 <ZdzIada1H95ike0t@lizhi-Precision-Tower-5810>
 <20240227123230.GP2587@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227123230.GP2587@thinkpad>
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10171:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cfa71f-a0c8-4cb4-b7a9-08dc37ba58b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oQMTbWrdZj+saAw34uVAWeIMcdE5r1Q3yb4cn45vA7nrVMuINF4a6PPEWGFOi0EG8GWdj7D/lMjExEkj2igAlUtSIh83eQV4UjtiB19clBblSs0H7IxtCNc4tO1K2g6SgIHZkzkat1vV64grC1mUcAm1aWDnBDzHlIKUkfayvw95QOOkuNSMMshRNCqps357aBM1K7YvbjMzFEKs1UXQsMqeYtq9JSzpLQ3m8xT4ZEI7n2ByhARNB6MHb8dpHUEchBZW9RvsuL+4iYJQB/wwcRAzl+zW4UjkVzAgfO9gkS78U4NCT2Uo1vkapWdU7jnmXLuq1sc8wlnQ2muxSFnejsWM4gyOfxYpa4bi2TWzhSdbPAJMP+WWIps8tc8AMPKp0xNUk+NU1oT1TpS7AkFSAF/cpNZ4tybfO7aT7dOYzg/XfFxCavOooxucNY4yyygcG8NzGsVQJCJS3DzJWIBokVplqVlC3M6KjwkTXUsJeSWIlb73ByFai89Gm7dGtAVXUOuE3fhor7Qou3VZ4QLilj5HuhqXxj3xYH1K88talVozUI55PaghQwSpMQUmOXeuRdEFoBwaqjJc4KPXP0OEQE7tD2MNaamm46E22ogZUhxIF+zka87YXXZ9Bi3TZT0HOI3HF5dKYf1gZo4lMJFwb6FK1WVGZgm+6a0KHwpCl+FF6BaeAZ5MI20SS9cGB3+cAZj4QNrV/JAwTKJpGiqkzg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?T1I3OG93TFd3OEhJblNRbGtxYlFJUHJzVTZpTkg2c29CU2R5QUFUTWlrZDJV?=
 =?utf-8?B?OEh4MkdXekJlSlYrOVJvNlBaUjVBWkgvQVJzcVlIR1hHMmgzTmhwRnRtSy94?=
 =?utf-8?B?WnY5UUl3NG1iQTB0UlYzd3BSTjYwdmEzMkRaaHpSYWgvLzE5NW1GamRiS0E3?=
 =?utf-8?B?YVhiNE9LaXNZL3g5anpSZlBpcEZwRlFudU5DM1poMFFMbGRhdDJwYzFIUmhu?=
 =?utf-8?B?eUd6dXlPaGg0LzNHdzMwV0RjZnRRNUswVHBFdjdweGhvcDdWUkZkTmptVHpO?=
 =?utf-8?B?dFR4M1IwQ00rbVRPWU1rYzlwVTI0cFBJRHV4b0w0VWVVcEZGc2pFOTlpNi9j?=
 =?utf-8?B?RkZpcUhpRU1QNkI4ZFRSajlPcm5uN0VmU25sQUxuMDBhTmEzVWdsQUFJN1ZT?=
 =?utf-8?B?aTZWRm1FQjZhdENsN3RXQTc5VW82RVk1dFIyNW1vcXFvUG1GcFBTZDVCQnBB?=
 =?utf-8?B?dVEvNU1hdTFOS2pJdFpNMHIvUGNIRVdVa042TXNaYSs2cStIWHpiTkh2aS93?=
 =?utf-8?B?cjhHc0l6NGUwQW5hRHBWcFdHZHRKZUhYNy9pY0FhR0lSdzNBRE95RU1NY2VO?=
 =?utf-8?B?QkkyNmhyb1E2TnpESXZ4Q0N5SjFjQ3Bka05DeWMyY0lLbFlwWVZoRG1KNUM5?=
 =?utf-8?B?eWpzcUJGODFQTFhGTU1tdnNTR0E5WGtIa1NiaGZvLzYwekhvdnRRTE9VVWJ1?=
 =?utf-8?B?RTUzUjM3OERIalIyRVcvWFRaMHBDWHJYQmIvR1JjTVpiY0dDNzNNUzlvMWRv?=
 =?utf-8?B?M2srVFN6STQyOGx3eGdzUE1nVE1WRVl2UHRPVDFXc1F5bkJ2QmRTUHlmY0Jz?=
 =?utf-8?B?U3VvVUl5SXR0aHJ2QzlMWEtPZ01MU0JIdmhVS3NSYjJLZXhTOFU2T2RFN0NC?=
 =?utf-8?B?bUMzRGJHWE5YNDg4RmlXUGZzTFc4dWpaMFIzNjdHQ04wRlhlZmswN1BxQTdh?=
 =?utf-8?B?dkREN3BsZk9Xc0FlVjRyRjZHUFcvYVppblVua05pZzZnMkUrejd1M3dYMnNB?=
 =?utf-8?B?M2pJNkw0SFk5anBPQ2RaUkJ1Wk5DV3NHQWVlK243Sy9ralRvQWxLdUxqWFAz?=
 =?utf-8?B?TlN1c3VXNFFjSnBLOVNmeFFicGY1NlR4bXdvQkJsVTBsU1Yvc1luU0FtQm5W?=
 =?utf-8?B?YUxHeFNXSTM5SmRYaHVncmdGSUVPQU9GN0h5Wngxd09zaXFadFdObzloWmxF?=
 =?utf-8?B?YnJIMWsxOVl0RldKaXgwWVdrNjE0VWluQlNTSFZPVVJzaFJXYnpXTzdXNjMr?=
 =?utf-8?B?VG9sOVg3RHBSdWZ4dXlmMFdZT0NiTmhJdFUwc3N0bzR6Ujk0Q2hWMW42ZXhs?=
 =?utf-8?B?YkYrOFk0dXFxcGZoRHJpSFp0VGVUT210ckFZSWN3VnMzbE9hNlgxbjdDU05S?=
 =?utf-8?B?a0lRdW5zK1BUYXkzdGZKQnhURVVsYnlha3JpeEV2b0pRcTRNSkNuNzNDbjhD?=
 =?utf-8?B?L1QwRENMTFlmdnJhV2pGUng0cjVZUVVrQ1NRT0ZIU1dHdHdVRllYUjhsbFFC?=
 =?utf-8?B?UDk3Wjg5NmxCQ0NRQnBVSms5cE5jeXZaSEFZa29tak41VFZhbkFSQmhGdStH?=
 =?utf-8?B?YU5LZzZKK1lvTGdXd09OSmhIVUJ0S2p3Q2FRMjYxNU56d003OGJzVnV0eWww?=
 =?utf-8?B?MzRxTUNpWmQ3a0w0NUloSEJQeDhxVVZCcERGazZWMnVPd0tXRXRzdGhDMjg0?=
 =?utf-8?B?cVR5bG45Z01FOHhkOVd5dTdjc01XdlVlUWJaQlRTSXkydXNwdmpOcTdtZXRM?=
 =?utf-8?B?VDNiTW0vaHF2Z1pRUjRsU1BmMXo0KzlQSXJkcGtpb3kwekliVnRiUkZZYmhL?=
 =?utf-8?B?eERTNkNHU3Fha2J6cDE5N1RDNGUyUWlDL1BmNmhxcndJTkVNcUhXanEwSUJE?=
 =?utf-8?B?WWR4ejJMWU82SWpDL2o5cS9lZkMySzFCZ09jdENEYk9OUXEyTCsrRFByQitL?=
 =?utf-8?B?d0hNNTcwMS91OUtLMENIUjBleGNJbml4SEMrWEd4YndsNHUzVHpqNFJlbm9i?=
 =?utf-8?B?OEZBZDl2bzBCK0tGV1d3V3AzL1B2Z0hnZU9Sclk4aUNuS2ZETUpUT3JNd283?=
 =?utf-8?B?azhwc3FybnFOTGhvcWJOb1h0UnVVWkx5RWsvdjhjazBRUk1CbUNkcWhLa2hN?=
 =?utf-8?Q?vsKSI8RlRCZByOmoTR2PhiIFn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cfa71f-a0c8-4cb4-b7a9-08dc37ba58b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:34:27.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxsR+1HjWqRYAIXgb/UbZv+Cq7880d3XNYOBLbJq8KhyCR6uLKTxK5wj+JlCRNt87Ynop6D5+B/W1n/8IpI2Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10171
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

On Tue, Feb 27, 2024 at 06:02:30PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 26, 2024 at 12:20:41PM -0500, Frank Li wrote:
> > On Sat, Feb 24, 2024 at 12:24:15PM +0530, Manivannan Sadhasivam wrote:
> > > Now that the API is available, let's make use of it. It also handles the
> > > reinitialization of DWC non-sticky registers in addition to sending the
> > > notification to EPF drivers.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > index 2fb8c15e7a91..4e45bc4bca45 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > @@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
> > >  	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > >  		dev_dbg(dev, "Received Linkdown event\n");
> > >  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
> > > -		pci_epc_linkdown(pci->ep.epc);
> > > +		dw_pcie_ep_linkdown(&pci->ep);
> > 
> > Suppose pci_epc_linkdown() will call dw_pcie_ep_linkdown() ?
> > why need direct call dw_pcie_ep_linkdown() here?
> > 
> 
> I've already justified this in the commit message. Here is the excerpt:
> 
> "It also handles the reinitialization of DWC non-sticky registers in addition
> to sending the notification to EPF drivers."

API function name is too similar. It is hard to know difference from API
naming. It'd better to know what function do from function name.

Frank
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
