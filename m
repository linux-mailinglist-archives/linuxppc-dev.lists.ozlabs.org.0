Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D268FF682
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 23:11:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DUUoGUVc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwH7s45bPz30T6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 07:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DUUoGUVc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwH791htJz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 07:11:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbKyAYUzLjzd81SlrjO9K2Fm/VqOHuH+5aN3GLdAgz14rVHnPHEPs3dRI7vhNVV3Nox3fo5HaQvb7V12Ls0zBqp9DCvXreTzG7tXrlIxKk+X8L4sZ/RYgp9OF8Vz7pqRzCE/zHZQtbHrbstcUZ9lYW4LFZckLKrFDrHY+9Y+GGGtHEMeQI4hykF7DGY5ctVHgMF3In2TVgWiyprOZu6io7H8YjqDdbfIWfWSJBM01mExkAZ1fK/yxMFVwRllPbVJZiqd1j+BoxP5CAb0UvuSN+hrozMDmnloeTAg9tDIDSCgsgd35ZibCzwfjd/YebSLCMQWI0ZGLow5p4pSibr5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLjwML3+LJqJe0egmg4+SzXghL6iZlUrjvqiCwPG3WM=;
 b=XBpEc3nfuIpPYBqr4FXAym+0h4wi6fWETK9Z2nSiut0xAJolWLPG8JTHThNmV1zntJl3xcVTPzAUgsIqwdSOSZ7E8CRokdruc4LVM+uJ8ZSqCsTTPczdmwMcYd9zWiJQwYGKxOoY6ZdB6YZhenoIO/kZv0MWz0nyTyyL79+V58hoCowSTl01mwPvu9DcC9mLBjHZi6+4bEy+ywbYcxbe6lUwx3T2xAqeTSw3exO7TbY8YdqDVhlzEPxkzsCvTE+HhIyI4oC2zKeEBMpPNeBlKOO4gQ2FEVoN/gs0eRAKaJkHCFYSzmo3YgUlVF3haMI9cvWy7a9z7JyTtZ4CnwmI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLjwML3+LJqJe0egmg4+SzXghL6iZlUrjvqiCwPG3WM=;
 b=DUUoGUVcYK4bjDs4WFZ/CBM+4l//Yl9hNUvk7wXYQENMWU+UtgAMhtUc3vaCcFwwFSmLME0a3v8Wbboi4UT8TDt96WV7T83Osez9lteRwzNVCj1d+HSFh0E11Q14ZzU2JiNRlapo1vym68c1rOSjBoh+emvEAC5sxcV81/2fDo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10208.eurprd04.prod.outlook.com (2603:10a6:102:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 21:10:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 21:10:42 +0000
Date: Thu, 6 Jun 2024 17:10:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Message-ID: <ZmIlxSQ8ffDk4Dau@lizhi-Precision-Tower-5810>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: f9585b62-22e6-40bb-3067-08dc866d1fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?imY6PnzkWIsks1J2DWujzNdheRbLCnZNtaA0GHhRbzyeV+aUfUF4T+Pa4gWq?=
 =?us-ascii?Q?KX9m/nzGUg/JF+LaxnOd0YZcVrCMILs1b3XBWZBBzSc8KKgyXtTGZv/JAq4W?=
 =?us-ascii?Q?B5po1zMoNMUDhL0uwYPi8M52kXDVe2UxNG+zircP+YZyy1EHg+gZS/UPxQJY?=
 =?us-ascii?Q?8cZiFDF+QKUohec47oEHo6NQSxQJKBoowgfiWk6apVlEQGFUb/3vSI5mACsV?=
 =?us-ascii?Q?tsg2vWiAYTyFJwgW2rCz1jyTPbB9KfrgvZhTxQ2SRfywgsC9hBz0/qYS3V1W?=
 =?us-ascii?Q?IzNqQjC/beOARM8PU92VpdlT0SleYDfWSLCHf/ASBwXz9N/1GtrRmoDmcg/U?=
 =?us-ascii?Q?1hIp/Sbkxl0P+X6F30Js46nKvBNTDTCr1/4HfeXuMnjD3rAgnAg5Lwx5yf78?=
 =?us-ascii?Q?f8mm/y2b+a8TQ+zzjTZbjy3Ti6dEnsS6wOSxIFGPr7BRTAOZXvaxVcklKwWS?=
 =?us-ascii?Q?v3WGE6ApVaf5WvNUOqAJkaPCnNmvKPEDyf127rGD6h8TIzg4+Q8SzCN4lqzY?=
 =?us-ascii?Q?8PMDy2XGdtFwha+V3ga9ex7a6nAqEJZ0SIxAMjkIZfi7TrJgwemo/h8SWdEU?=
 =?us-ascii?Q?67w1I9h/7qvjRBQ7gTq3Rghr3NNvTAgJp3LEnYmyNrSY+jNJubcCi5/66IZe?=
 =?us-ascii?Q?bxcXBxVcJMO4E4V4BQNi9dXAJdqDimif7maKlfju+CplyzlMm6WyWcCUyxbM?=
 =?us-ascii?Q?AGiAd4C3suNsw4C9i3VWZYe1OfJ0eUxTVcQpGjvK6Yf3y0CZRAUJg8ZvMAHJ?=
 =?us-ascii?Q?/clxzj/xxS56GfQFkyqSIRb816PJt5/MF1lboVIiyBLprg9v1SaJJXZWXiCv?=
 =?us-ascii?Q?Eoki1ufdvXCcN1w32cEvsdQ8aci8XmkOV5PoyO7iGmMIatv8WSL4JXtiAk7z?=
 =?us-ascii?Q?SsgNlH+ILgkYzDUwXrZx3itRcmGyTxovpZEuoKRuCp3DIvYJx7dEz4RSpc4A?=
 =?us-ascii?Q?ERwpOxAEdUZFwFGxHSvPrRVrJ8JxjS6py4rcaBSmfpEH2o7aNHEdcpI45o2M?=
 =?us-ascii?Q?zhOuJa8qJiRkMbh5VOsmmZNU2mUo8Q8SSJbatoxxxJk6vLly6ocx1qjb11Ni?=
 =?us-ascii?Q?fBv3bsFb78XvQ7Be59MEd2uj9YAoTKMsJDlREmaiWZhaa7n4LH1Ur9O/N9iw?=
 =?us-ascii?Q?0YbHrNwYzRlxvG5lp10l/37+62xLfkvj0EwwKO+fhnlAMv9Ld0Aakx5ewXzp?=
 =?us-ascii?Q?454KrLrpFVkTMzIKIF35xjNiTU+jxFdwtp1lTJZYoKCs4OZaqEwb+e1MKVf4?=
 =?us-ascii?Q?I//K2Go8TZglvcCi+31a+Yl2LWifA1KmZn8if5R/3xUy6QdDH3qT7xNfbRBN?=
 =?us-ascii?Q?kpaKO5WfKIuqAlljL3o9SYY+BBjsbfxW65KnxtaUe7p+Ik8jw2+iYbPnSt2c?=
 =?us-ascii?Q?/szKkbo=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pDhM/hW/FbWSQ/bthLswklRDmLtj9asDyCQRpqHu6xHbcB3rlad+rwPSSLjB?=
 =?us-ascii?Q?k2baVqoLi3N+6Xon2JY8JhLACI8u1k8S2Feso46u517OMSwgHGNjs3QKEhlY?=
 =?us-ascii?Q?4mNVO30fVacJt1SSw2sfYu+VSnGN6QTpaNkX+aeLChAosm26xWKyH2WJxcVT?=
 =?us-ascii?Q?i1cCp73pgbKq17eMYKIyOqr5MSIBufWstW7DpKvVsfZjl7tCVVd2MlGRe2JU?=
 =?us-ascii?Q?F+kYnoYhEW+ITd6Jrj7dL5TtBwkum9fQeRT0MugihGzk7J5r2J7Re23zDCNm?=
 =?us-ascii?Q?iFe6hcl+CP/E1cXGIlJz7UmA0m3GykmZXVAFp4BEyZxKh6+kmsmW5hOPFtYB?=
 =?us-ascii?Q?kKZQUnHnf1z9NEKfX0lIHtJsmqYvbUqaCqh5L4+76eNGtIKt8a3Bh4my7Fuk?=
 =?us-ascii?Q?udZRnGeyVbs8/VmzilmqHSsTGgiHBt2FT1K1nHC3DeX417pvi0S6Yf8H7WDI?=
 =?us-ascii?Q?f1eAXpNnYGpuhC21VH6JY5FSoTOaWBNTPannhahxKKAqfEalHBQ6gfglBJGY?=
 =?us-ascii?Q?4feaEfxlPTluy7ME5L+e+RfSqmNS4i3VM5d4gccLedGj6EQDoQxq5zGkEzDj?=
 =?us-ascii?Q?Xqqf2OhoBXH7O2Z+FvvKHBlpuMoWiEtOtH5xy3K55qgeN72EFKw6LDi25t3L?=
 =?us-ascii?Q?s7hiQRm9OC/+TKjAH0Vucvsb/zZTx8obcWRITSaTu075XJD1uJWCpgTQW4ol?=
 =?us-ascii?Q?VQXedHjhEophE2hyuECoBLS/AjDOsAyyQeI30L/Zv9AAZC+Oq9PR7xVTsQSj?=
 =?us-ascii?Q?oyW4fA37X5YPl5N5mWZ0LCL/ijPUxnmpP0lwvohESy+ZJLKXZw5jjXmOUrs2?=
 =?us-ascii?Q?X0X919m+Z/HpltIug6hzFxF62uboIccCxRaRKcXemmsx4mHFkVwH+DOV53za?=
 =?us-ascii?Q?Ts5Jb/wa93sUTNzwvk/OCH7Na54uJCZF8LWqaJ941UN9wo240kjVeOrRndov?=
 =?us-ascii?Q?FLk+1VAZ6mxFHDI8aYDXfy28Nxf79+2ylAjBunrSNoCciOpeyWjz8/REoNRu?=
 =?us-ascii?Q?o6TlU2FYCw/5GBi8m8pNPjXpBsInj8PMv3ubcsY/Fq5iiqlfGZRFkv52lEkm?=
 =?us-ascii?Q?q7+kVheByxmQxbCiEQEU7qE1zGplTCkckIs9lVKmejNLdk/9lOBGMKtmY141?=
 =?us-ascii?Q?R98plPBA4jShbbVDTVLUO/z3QOFVIZ+lgtVT4tZssNopUIgDp86GWePDphTr?=
 =?us-ascii?Q?+61CavN00T0er3r7hJcLLpGyrnBFLKT907nLi4BtmhHUxXdW2hVacZsdfWEE?=
 =?us-ascii?Q?7ENRPM5AjWYny/LYjqIG4qSiJqA1aUTnZXsWrbE1HXXxFwpA7wJ/y8d6p4GZ?=
 =?us-ascii?Q?MSt+CBL7HGmaRTIFtUpIj8gMpwxFltjEDNeHTkdAcm/0Hqj/j8exwFR0uPAv?=
 =?us-ascii?Q?WpQj6FocuVlVhcellWSpP3/0t2bDiv1HswN1X5tc7wjTmucFynpCCSVEnJx0?=
 =?us-ascii?Q?vXslR+lUaSG4MmPE/JPrRzNiVOidUIdECKxSWBejJ9H0nJ7x2s1qohRcP6XN?=
 =?us-ascii?Q?zjDyRVfkFFtmLgFC327IoXEEpvCwh/MsgXhNlicLnKXIIoXriTwSKCy8nB1c?=
 =?us-ascii?Q?jpKcPp09j3iVRU01TG4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9585b62-22e6-40bb-3067-08dc866d1fcc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:10:42.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7bt6Tm2qzfEz4k3+o+nNFIX6XnQrhsskUdRmtbHritonSUiDhaN0OPH9ZC9LbtnJHu8YLFpHuFA1ZuTtdI6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10208
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:56:35PM +0530, Manivannan Sadhasivam wrote:
> As like the 'epc_init' event, that is used to signal the EPF drivers about
> the EPC initialization, let's introduce 'epc_deinit' event that is used to
> signal EPC deinitialization.
> 
> The EPC deinitialization applies only when any sort of fundamental reset
> is supported by the endpoint controller as per the PCIe spec.
> 
> Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.
> 
> Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
> PERST# as the fundamental reset. So the 'deinit' event will be notified to
> the EPF drivers when PERST# assert happens in the above mentioned EPC
> drivers.
> 
> The EPF drivers, on receiving the event through the epc_deinit() callback
> should reset the EPF state machine and also cleanup any configuration that
> got affected by the fundamental reset like BAR, DMA etc...
> 
> This change also warrants skipping the cleanups in unbind() if already done
> in epc_deinit().
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c |  1 -
>  drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c      |  1 +
>  drivers/pci/endpoint/functions/pci-epf-mhi.c    | 19 +++++++++++++++++++
>  drivers/pci/endpoint/functions/pci-epf-test.c   | 17 +++++++++++++++--
>  drivers/pci/endpoint/pci-epc-core.c             | 25 +++++++++++++++++++++++++
>  include/linux/pci-epc.h                         | 13 +++++++++++++
>  include/linux/pci-epf.h                         |  2 ++
>  8 files changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2e69f81baf99..78d5fc72c9cb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -620,7 +620,6 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
>  	dw_pcie_edma_remove(pci);
> -	ep->epc->init_complete = false;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 4d2d7457dcb3..2324e56c9bfc 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
>  		return;
>  	}
>  
> +	pci_epc_deinit_notify(pci->ep.epc);
>  	dw_pcie_ep_cleanup(&pci->ep);
>  	qcom_pcie_disable_resources(pcie_ep);
>  	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 432ed9d9a463..4ca7404246a3 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1715,6 +1715,7 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
>  	if (ret)
>  		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
>  
> +	pci_epc_deinit_notify(pcie->pci.ep.epc);
>  	dw_pcie_ep_cleanup(&pcie->pci.ep);
>  
>  	reset_control_assert(pcie->core_rst);
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 205c02953f25..5832989e55e8 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -764,6 +764,24 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
>  	return 0;
>  }
>  
> +static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
> +{
> +	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> +	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> +	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
> +	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
> +	struct pci_epc *epc = epf->epc;
> +
> +	if (mhi_cntrl->mhi_dev) {
> +		mhi_ep_power_down(mhi_cntrl);
> +		if (info->flags & MHI_EPF_USE_DMA)
> +			pci_epf_mhi_dma_deinit(epf_mhi);
> +		mhi_ep_unregister_controller(mhi_cntrl);
> +	}
> +
> +	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
> +}
> +
>  static int pci_epf_mhi_link_up(struct pci_epf *epf)
>  {
>  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> @@ -898,6 +916,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
>  
>  static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
>  	.epc_init = pci_epf_mhi_epc_init,
> +	.epc_deinit = pci_epf_mhi_epc_deinit,
>  	.link_up = pci_epf_mhi_link_up,
>  	.link_down = pci_epf_mhi_link_down,
>  	.bus_master_enable = pci_epf_mhi_bus_master_enable,
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index e771be7512a1..7c2ed6eae53a 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -782,6 +782,15 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
>  	return 0;
>  }
>  
> +static void pci_epf_test_epc_deinit(struct pci_epf *epf)
> +{
> +	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
> +
> +	cancel_delayed_work(&epf_test->cmd_handler);
> +	pci_epf_test_clean_dma_chan(epf_test);
> +	pci_epf_test_clear_bar(epf);
> +}
> +
>  static int pci_epf_test_link_up(struct pci_epf *epf)
>  {
>  	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
> @@ -803,6 +812,7 @@ static int pci_epf_test_link_down(struct pci_epf *epf)
>  
>  static const struct pci_epc_event_ops pci_epf_test_event_ops = {
>  	.epc_init = pci_epf_test_epc_init,
> +	.epc_deinit = pci_epf_test_epc_deinit,
>  	.link_up = pci_epf_test_link_up,
>  	.link_down = pci_epf_test_link_down,
>  };
> @@ -905,10 +915,13 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  static void pci_epf_test_unbind(struct pci_epf *epf)
>  {
>  	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
> +	struct pci_epc *epc = epf->epc;
>  
>  	cancel_delayed_work(&epf_test->cmd_handler);
> -	pci_epf_test_clean_dma_chan(epf_test);
> -	pci_epf_test_clear_bar(epf);
> +	if (epc->init_complete) {
> +		pci_epf_test_clean_dma_chan(epf_test);
> +		pci_epf_test_clear_bar(epf);
> +	}
>  	pci_epf_test_free_space(epf);
>  }
>  
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 56b60330355d..47a91dcb07d7 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -774,6 +774,31 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
>  
> +/**
> + * pci_epc_deinit_notify() - Notify the EPF device about EPC deinitialization
> + * @epc: the EPC device whose deinitialization is completed
> + *
> + * Invoke to notify the EPF device that the EPC deinitialization is completed.
> + */
> +void pci_epc_deinit_notify(struct pci_epc *epc)
> +{
> +	struct pci_epf *epf;
> +
> +	if (IS_ERR_OR_NULL(epc))
> +		return;
> +
> +	mutex_lock(&epc->list_lock);
> +	list_for_each_entry(epf, &epc->pci_epf, list) {
> +		mutex_lock(&epf->lock);
> +		if (epf->event_ops && epf->event_ops->epc_deinit)
> +			epf->event_ops->epc_deinit(epf);
> +		mutex_unlock(&epf->lock);
> +	}
> +	epc->init_complete = false;
> +	mutex_unlock(&epc->list_lock);
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_deinit_notify);
> +
>  /**
>   * pci_epc_bus_master_enable_notify() - Notify the EPF device that the EPC
>   *					device has received the Bus Master
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 11115cd0fe5b..85bdf2adb760 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -197,6 +197,8 @@ struct pci_epc_features {
>  
>  #define to_pci_epc(device) container_of((device), struct pci_epc, dev)
>  
> +#ifdef CONFIG_PCI_ENDPOINT
> +
>  #define pci_epc_create(dev, ops)    \
>  		__pci_epc_create((dev), (ops), THIS_MODULE)
>  #define devm_pci_epc_create(dev, ops)    \
> @@ -226,6 +228,7 @@ void pci_epc_linkup(struct pci_epc *epc);
>  void pci_epc_linkdown(struct pci_epc *epc);
>  void pci_epc_init_notify(struct pci_epc *epc);
>  void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf);
> +void pci_epc_deinit_notify(struct pci_epc *epc);
>  void pci_epc_bus_master_enable_notify(struct pci_epc *epc);
>  void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
>  			enum pci_epc_interface_type type);
> @@ -272,4 +275,14 @@ void __iomem *pci_epc_mem_alloc_addr(struct pci_epc *epc,
>  				     phys_addr_t *phys_addr, size_t size);
>  void pci_epc_mem_free_addr(struct pci_epc *epc, phys_addr_t phys_addr,
>  			   void __iomem *virt_addr, size_t size);
> +
> +#else
> +static inline void pci_epc_init_notify(struct pci_epc *epc)
> +{
> +}
> +
> +static inline void pci_epc_deinit_notify(struct pci_epc *epc)
> +{
> +}
> +#endif /* CONFIG_PCI_ENDPOINT */
>  #endif /* __LINUX_PCI_EPC_H */
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index dc759eb7157c..0639d4dc8986 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -71,12 +71,14 @@ struct pci_epf_ops {
>  /**
>   * struct pci_epc_event_ops - Callbacks for capturing the EPC events
>   * @epc_init: Callback for the EPC initialization complete event
> + * @epc_deinit: Callback for the EPC deinitialization event
>   * @link_up: Callback for the EPC link up event
>   * @link_down: Callback for the EPC link down event
>   * @bus_master_enable: Callback for the EPC Bus Master Enable event
>   */
>  struct pci_epc_event_ops {
>  	int (*epc_init)(struct pci_epf *epf);
> +	void (*epc_deinit)(struct pci_epf *epf);
>  	int (*link_up)(struct pci_epf *epf);
>  	int (*link_down)(struct pci_epf *epf);
>  	int (*bus_master_enable)(struct pci_epf *epf);
> 
> -- 
> 2.25.1
> 
