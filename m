Return-Path: <linuxppc-dev+bounces-17208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMttAnNbn2lRagQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 21:28:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4519D34E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 21:28:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLmPn49nfz3fFT;
	Thu, 26 Feb 2026 07:28:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772051309;
	cv=pass; b=OcXxSxhFmLPypu1hHGmsyTNzq6KfORgP1On+SyhdI84ATT0EnUqakj/LQc9MbHp0a4xHWkwZRABe2DOmUA+R2inGajFmQrcUyZypBkKbVNZe7imSJPAXaDgqB+4z2lVdbRVzFblTVcCqpW7iFlT0qqFxWm4yM4dNtW42Yrbe96EwWdNQLgJ065LwRDxLTWRMLfdGOq9J73sTN5uMXV5waNPn3D0fCiRp0DpqaHbIOn7lyrXlVmHFlpAdzXEFcZZ3tQfZTYfYIAmUom4WtAJ4Ytz+04wH20us91PxqWMuMIt3bkAYu+3iYZYpV7vK4AsJ9TT6TM8gd0BjuvmKPzzt0g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772051309; c=relaxed/relaxed;
	bh=F83qY5mizs2GrmsmNbSCJntICQQNrwFUxwBYmpReT1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gUf1pS+WlX71qtqXJ9Kd0Vt8ndeeugK5nwCCfk4aNwqoS8ueI0KoFD/esFJZTaupBhahJAAmX/hVlfj4TWmBzweRioRNtFPxIH9kD9QWHa3Flmurv9r/2l9rJ+7DMb47v+KSRYIDfEPvZ3qmCKsxGdKzPJF9kA5xr2BcRUUmxK5crdzCTD7OiY2a0JfutFqNDDgXUxclGdcv9wnqE+9Dboc+nGJNH9Y5O3zY0DAah3It4TrOfPk5ECpsyHLCrl6Me/DvFzz0WjIFoAL3A1CMRvIIDrXouTl+V1Z5ML8Vq9/zwclLx7Fl62RyMpt3bYfKFZkQ4A64+y98KqMW3fkn3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I3bbEXPj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I3bbEXPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLmPl2qZTz3fDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 07:28:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z24G9kGwawNQCIwsSVAlfgybb/9ahyhvwL09Jd8Rk5kacjp3Vfju+j26tkounZFw+YsAs8fleFX0vjMpKhyyaiF0Lw6xzRoPxAQfCeZThm4W8Q6CEzGL/bmy19h7ASB5deKmDBrm8LsYdcNAhMOETeFveP/ahD/M7hz8F8iOgZEwQYaKZus6fZy7RPCmPHVcDZJMfDzexkXxteKPtXtcdCjrV/WUDLegUYf7ejofRl6JRo7Y2HFfoLYXZTK6+lygsa4dworRa2Sv8D3DW6bzvL7iiwyiyTDkwhEV792hBASxDKiCPUqoS2vweq6oBfzDpL2gjIrJNfCSP+kj0kfWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F83qY5mizs2GrmsmNbSCJntICQQNrwFUxwBYmpReT1k=;
 b=rkb8WFTg34nyOl9VdiUW+zPeJ9vIvuMSeh418yrIbgeA/TUxzNcbllwbqGM63J59beii+EovF1cyQFfpnZRWzd8rdPDmmzC0uPwrocgi4OQ653+i52NUpFnFUakKe773H2DexhDtscU/ZqKRHlzZcltF9eoFKGtsmqWcxiLnLCcvdu/44i2EJvXn6JwLFTIpCT0mqU1R1E2MVY18e//U4qTdOFHdpev93udH7I4orEOfHsJVGS5+t8n8QlYvpQSMFNSl1dqg0mH+3e9tC5XidU9aIavoUNzi0A54YK6fk8Rbrbw4C3Lj+q1g81I93Nll2T3SHfAzEDaZn6ITuQnyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F83qY5mizs2GrmsmNbSCJntICQQNrwFUxwBYmpReT1k=;
 b=I3bbEXPjUCMd2YSEEkS4cGOX+plMTPTY82r5cKDmGKd2xJRFFlF/M/Rdl/K9E7vxKRetr38McBzbjejfe7zHhcGtzwh0Oy3IsEkC37sjOSLTa5wdXk/BiowN2NIEG3irT3o/5wmAlzP0hFL63U0vR3M2bMFCmHLom113eUZK5vi9GC8zUZpK+YPQjywpmBNtgyDuS0vvMQAuuwunN6FCUHBtmUsFLRGb82u+lfYoAVrWSZWWYSdCFs8dG+1w+4HG4287KD9vEAai2Jtp6+tebbZpmlrE0d2WXMS327eJKP8C1nYkFUO+TEfSJg04ml0oH4UHkRA0VEg46cjMyVYDoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 20:27:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:27:57 +0000
Date: Wed, 25 Feb 2026 15:27:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 6/9] PCI: dwc: Disable BARs in common code instead of
 in each glue driver
Message-ID: <aZ9bQozWjS_ZcxK1@lizhi-Precision-Tower-5810>
References: <20260225170324.4033466-11-cassel@kernel.org>
 <20260225170324.4033466-17-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-17-cassel@kernel.org>
X-ClientProxiedBy: SA0PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:806:d3::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a1b415-f625-4f2e-5329-08de74ac5cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	J+Kw6gcV8eo+GX7fK4DrMq0n9BGcj4fBuRjsy6y/qxXtxbbApLv4gB7uiUdG0qDUpCPPlDaWay2VULfs7KDxukL4gFCMxA5J4c9HmhSth9svUlG45K0EiAtDtByE4IKRZSkv8k52ClUBVEHumfDmYfOvFJb5YHDGp8mGcVJAd40AV8k75KJU8ZlvVgfTGghbVC+BJ449nQPqCMGimMxtYztOz3RlAzXhGsQKlcXyE0tkTKBEjbGErsd6CEBp1tnLrmhYaUIzmQM6L9R2LTh73FJSd2xkqKvn/4vToncV/6i58POsNREh+tqlmjrQfNtwgsjxfdZS2h78PBxCNxywBhmKngT5uYSzOiQkzCA7YMvO8BMpWll+cA6pWK63OImSbP7HiLBKT0P7QpM5HJMFO5r1qqqCcu2+Vmvw0TDRghwlv3bNBdKN/f7o7yddrckd03WZCitQ/UcgcZmKIivsROTHPOv3H3C31PYb/C4GGWfNkC08h0x5KUSDyJEzhcpnTz8yU2Fjk8q0O+n4FRi53kdz8UMoLmTtRQI1ZaVKXeiKeOKMziEkUNViYVgbyvGy2XGe9cOp/bBkFl5cAIYual+UjlSVvSLXusgeL2y0znKp0PwS0N26/bvjuH+AajHBv0KQN6qIU8TMb8OzdSVObSBD0r9LwiYPcdhP1eoYB7di8E2FZERDCfQo3jzNSn3uVpGF9EWplerdsCxnNDcMK4oKdNlJ87wdlIl7ASUTbYih5dMbjK4AESk6y2ZqwYQU5i59cZAuXhCaZ/pmksOda9+XSrKSy44nyeguw0phGs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4FnlcFzmSyuhBt7xWMLmrtw8ooq54DmXxnHbGvUbbCrv7I1C5oqSzwyPeqJO?=
 =?us-ascii?Q?ITWEDsZpMUiwZMs1nWtp3X9xH/3wE9LzRf4IR9LX8ih9dRCmh/896647K6hx?=
 =?us-ascii?Q?1subRPxi4M89M5zW0+V5KBO2uEnZ1roKSufZkQ7HbtiYSTPOm0AMHUMtlk6M?=
 =?us-ascii?Q?ipPnUe5YaZelXuB/5qmncuyZ0ityz/WuHTJsxiXyCLFC1tUyz0g/p0tj9y+6?=
 =?us-ascii?Q?k5d14rZ4RaHgtvWLrLzk0v1VD0giyxORM7vou4shFX9LVmD92fx0YMn0Ja5U?=
 =?us-ascii?Q?vwIZe2IVcAcuaTVPU4n6I7D3YdLk0vHePox7m20TdUOi/bKlnxDxLhlufdEA?=
 =?us-ascii?Q?FKihUpv6wpYu24btc/pKdoBqLLnPOWy0Vs8jpVjo6f6VrsC4hdB7JRCm5l8N?=
 =?us-ascii?Q?KfKjbrnBZBP/C/YPIQlmzhpidAvhuCC2c3CVCShKS7+nd6Yx9MUsDYYV0Sho?=
 =?us-ascii?Q?eloNV0GMFDXavEDRMkR7pIxtUYeyq4fjFElbKhOBsQSQDsYLCaDH/BMlEAah?=
 =?us-ascii?Q?EIoNpxdmfauJBoJ7O9PFMxzbbepxGvongQzdM92CX2TXTA+5Fb1JM5qij/08?=
 =?us-ascii?Q?//yRhEMXyRvM3/xlwlbGPoEw4HagGPMgK8BJDHnAIYzPxMFF/5CDxVEgsX7E?=
 =?us-ascii?Q?MJDKtflvkC24OKcumqpTFwgfmgvZ5I4qd71pBeWHK6wlkeMz9vgzttSePk+k?=
 =?us-ascii?Q?BnIuTmt6AETFF1b1bo/fimCBlTWkrEu1S3XiETZeFuLaQh2NDLi1hy8ldJU0?=
 =?us-ascii?Q?8aUIqDM8ynNFwuWuMHYg2mjzOc2E7xh6yhOR6iqpXTR83Ih+V7X4PgpPgFzv?=
 =?us-ascii?Q?RAHvUg94FThMhVDo/Y0T3EGcrOb+rWJyVtQNOolV75bDUvXPDVlGUXVGuKie?=
 =?us-ascii?Q?wlD7+uYi7PdbsYgZ1ycRQ/soh2ulzoDNgd0URgUGYt8OM1TH9cqfTNMYKKDq?=
 =?us-ascii?Q?ine76L4mc/dV4z1dk4Yh0r5LqHrs90aV2YCYRq5RFAlIk+7rZpdufZoRX9gS?=
 =?us-ascii?Q?btGi+FpFOYkhlU8D+nW/GQIAOu6phsPIxRFMw/wbT2UnM+41LlUu46W+qIVa?=
 =?us-ascii?Q?9kd008WXjdvGQgOVjShsPD67/sZu7O/b6JgEQWtEaf7H8+NC2mvndfPbNuiz?=
 =?us-ascii?Q?diFi/O3OGEOVWA4u3tz+2YHRMj14xoZionATSQ4Jr1HVhhDYCEmOSVJ6Unmo?=
 =?us-ascii?Q?4/Qb5JfZFDPcuZKuxM0HamrhDyzHaKxyvKclo/iZK4wE9WztUqAXCLF3nFz3?=
 =?us-ascii?Q?LMI0Pqb31ec+/W4a7a0ODKjEhbBORVw5X8XLiqwZHsFS27S7+z/Lc0zuSbXp?=
 =?us-ascii?Q?jujJUbZEmmPwtCPTG+MWWNen3lAVW7vxb02C8X2Lu3J0XOXMnqiFClXzGZz2?=
 =?us-ascii?Q?sk1bpFuTOd0t/vmSBo+O6FacMoPWVpz5fxaGCpHgPzpIwfQL4P8ByZ00JLoP?=
 =?us-ascii?Q?oOZqIOfFxkVko1q9Vj5DSBlekUDA80gWv5NRpaQ8oH4jPnDKQTbq3GuNAx5G?=
 =?us-ascii?Q?8y5PiGrs3sRYQ0osS7wPc0KgeeLa7KMzkwMgcpXbmmAKI7nW2pYL/M7+9oot?=
 =?us-ascii?Q?0uL1OL1tE5D5FkKjZaKGOU/3AYKwYQQGL5vojWVFyzDGy0oOCihAPuXFzP/A?=
 =?us-ascii?Q?OpmL7VUuf416ydpl5sx9fWdIiK6/GtwEIqaOrm8YgpQyuA0XirsZ4SJx3yKh?=
 =?us-ascii?Q?MMZcwtsYtJPmwvBrOzvuoOfT64we8EnEqHm/1cQsRzUtuHAdhtuDtdrybTwA?=
 =?us-ascii?Q?gfkuVnBCAA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a1b415-f625-4f2e-5329-08de74ac5cc0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:27:57.4033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG68UbHBy1QcL1vhcBwDlkq04Ksb2cAn0NQ2WybozgKHskcVGvFNr9qrkurtvWG76LqJV/rnJZGbQe7LN4hY0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:jingoohan1@gmail.com,m:heiko@sntech.de,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:mmaddireddy@nvidia.com,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:l
 inux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	TAGGED_FROM(0.00)[bounces-17208-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: 62F4519D34E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:03:29PM +0100, Niklas Cassel wrote:
> The current EPC core design relies on an EPC driver disabling all BARs by
> default. An EPF driver will then enable the BARs that it wants to enabled.
>
> This design is there because there is no epc->ops->disable_bar().
> (There is a epc->ops->clear_bar(), but that is only to disable a BAR that
> has been enabled using epc->ops->set_bar() first.)
>
> By default, an EPF driver will not be able to get/enable BARs that are
> marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).
>
> Since the current EPC code design requires an EPC driver to disable all
> BARs by default, let's move this to DWC common code from each glue driver.
>
> BAR_RESERVED BARs are not disabled by default because these BARs are
> hardware backed, and should only be disabled explicitly by an EPF driver
> if absolutely necessary for the EPF driver to function correctly.
> (This is similar to how e.g. NVMe may have vendor specific BARs outside of
> the mandatory BAR0 which contains the NVMe registers.)
>
> Note that there is currently no EPC operation to disable a BAR that has not
> first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
> to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
> have to be added first.
>
> No functional changes intended.
>
> Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
>  drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
>  12 files changed, 24 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d5d26229063f..cd904659c321 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>
>  	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
>  }
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ec1e3557ca53..f5fe5cfc46c7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>  	.stop_link = imx_pcie_stop_link,
>  };
>
> -static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	enum pci_barno bar;
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				  unsigned int type, u16 interrupt_num)
>  {
> @@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = imx_pcie_ep_init,
>  	.raise_irq = imx_pcie_ep_raise_irq,
>  	.get_features = imx_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 5a03a8f895f9..1f5fccdb4ff4 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>  	struct dw_pcie_ep_func *ep_func;
> -	enum pci_barno bar;
>
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
>  	if (!ep_func)
>  		return;
>
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -
>  	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
>  	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index e994b75986c3..55cb957ae1f3 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
> -	enum pci_barno bar;
>
>  	artpec6_pcie_assert_core_reset(artpec6_pcie);
>  	artpec6_pcie_init_phy(artpec6_pcie);
>  	artpec6_pcie_deassert_core_reset(artpec6_pcie);
>  	artpec6_pcie_wait_for_phy(artpec6_pcie);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  }
>
>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 295076cf70de..386bfb7b2bf6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -1114,6 +1114,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>
> +static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_epc_bar_type bar_type;
> +	enum pci_barno bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
> +
> +		/*
> +		 * Reserved BARs should not get disabled by default. All other
> +		 * BAR types are disabled by default.
> +		 *
> +		 * This is in line with the current EPC core design, where all
> +		 * BARs are disabled by default, and then the EPF driver enables
> +		 * the BARs it wishes to use.
> +		 */
> +		if (bar_type != BAR_RESERVED)
> +			dw_pcie_ep_reset_bar(pci, bar);
> +	}
> +}
> +
>  /**
>   * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
>   * @ep: DWC EP device
> @@ -1196,6 +1218,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>
> +	dw_pcie_ep_disable_bars(ep);
> +
>  	/*
>  	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
>  	 * PTM, this capability structure is required in exactly one
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 8530746ec5cb..d103ab759c4e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
>  static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
>  };
>
> -static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				     unsigned int type, u16 interrupt_num)
>  {
> @@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = dw_plat_pcie_ep_init,
>  	.raise_irq = dw_plat_pcie_ep_raise_irq,
>  	.get_features = dw_plat_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ecc28093c589..4e9b813c3afb 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
>  static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
>
>  	rockchip_pcie_enable_l0s(pci);
>  	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  };
>
>  static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index e55675b3840a..e8c8ba1659fd 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
>  	return &qcom_pcie_epc_features;
>  }
>
> -static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static const struct dw_pcie_ep_ops pci_ep_ops = {
> -	.init = qcom_pcie_ep_init,
>  	.raise_irq = qcom_pcie_ep_raise_irq,
>  	.get_features = qcom_pcie_epc_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 9dd05bac22b9..1198ddc1752c 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>  	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
>  }
>
> -static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
>  {
>  	writel(0, rcar->base + PCIEDMAINTSTSEN);
> @@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.pre_init = rcar_gen4_pcie_ep_pre_init,
> -	.init = rcar_gen4_pcie_ep_init,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
>  	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index c1944b40ce02..a7988dff1045 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -28,15 +28,6 @@ struct stm32_pcie {
>  	unsigned int perst_irq;
>  };
>
> -static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int stm32_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> @@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
> -	.init = stm32_pcie_ep_init,
>  	.raise_irq = stm32_pcie_raise_irq,
>  	.get_features = stm32_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 9f9453e8cd23..3a6bffaff9ea 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>
> -static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -};
> -
>  static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
>  {
>  	/* Tegra194 supports only INTA */
> @@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = tegra_pcie_ep_init,
>  	.raise_irq = tegra_pcie_ep_raise_irq,
>  	.get_features = tegra_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 5bde3ee682b5..494376d1812d 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
>  	uniphier_pcie_ltssm_enable(priv, false);
>  }
>
> -static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> -	.init = uniphier_pcie_ep_init,
>  	.raise_irq = uniphier_pcie_ep_raise_irq,
>  	.get_features = uniphier_pcie_get_features,
>  };
> --
> 2.53.0
>

