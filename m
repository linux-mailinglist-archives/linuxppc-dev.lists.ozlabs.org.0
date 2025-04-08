Return-Path: <linuxppc-dev+bounces-7545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B5A80C7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 15:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX6Y41KySz301N;
	Tue,  8 Apr 2025 23:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::61a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744119368;
	cv=pass; b=FzoMzJypYz4/azK45J41A7BkhiWpEVVxDCxiPUIx3ncTjlFGpxBy+EjpP5OqMcpVSKozjChvvxlM6CJ5km3JiYrLXo15CV2E4FpHjidQ8iKSbKOc9QWIWQq5DTrTG0CtZSimdmR45PO8Pz/7h3Lm5TlXcC1TFsU9U7Q4e4TisH1txMBMjSDFTcRepWHyM0R4mo9G66pbC4sgCuY+NMMAXIzgM93mTF4Bp4HuDil80ltNeZI5NDA3H0Vf0AAC1UXCjzoZN5FEBtTX6NBz8Th21PqLNDKkU8tB3K+kEXffGP3R42uzCPcXXH8wIKDOgrtS3/UxsVBwyAYky0xZiH/a3w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744119368; c=relaxed/relaxed;
	bh=OhvVTc+/gX9mTDuvNSMMNAJVT6OpgSGMna+kvt1qO94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dcaKJjrPwOw4a3gwK2abR477/xz1d4ULAtr/E/crgroEKLrAAcGWIbYLoB9RWfo3+Cn6oTDaA3oacJxfdLaWkTRO1xy59AGVWqQm+Zu0DvTI4KHXosLM5D+B3omFAAyYl6QLMkiQryW9eenL4mSExyfzqyZIqi83cabdLMzJ0oSq+DtTIcpj7dYM5dGcq9Ls9zDh8CjGDvEbc3WKZ/LV/NWERB7eQKVMTcllLBSfReIimcP47ey+VE4QMOUMUKF4wnYhDFKGNd/PUTUB8mlkVJKACW2xVR+qaNxlU1bGKFQuPfZQOmIfyEWo8QpM8KYYRShr517u5StjVHlGQc46SQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DBFdsrRX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::61a; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DBFdsrRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::61a; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::61a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX6Xz4Fkbz2yrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 23:36:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF9xJXDNEFgTpS9w8V+0fXXad6P512nG2saZQqauY2ClsDvmDoTkGSUkaIOcbUhL8lqYYcA3UYiNQCPpJ3QvtteL1qAcy87dn1Z+XODjUHnF27Tvybg0+7lIomcFZx9cEMujWIdfFK5kJWPbZIMr+atdjRm5sZKw5ETkFBBXf5+mUaqOrSzHrccTbK8ZSu6xYgF7HJ9jMxgG6CZRIB3GnmDaYnW9BNNgiMwgM+hbqF9oQzOqILtdB263Oy1tzrgnXPy1uvsrMIORL5a9TFVpM18e4QsG5zZ+xIj6KDueX4asCHHY2w+/3r2CGP2GjSt4/uHstKmi1XZ6gwVdSPeoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhvVTc+/gX9mTDuvNSMMNAJVT6OpgSGMna+kvt1qO94=;
 b=d94Af0getVXpjsjqbZDd2TZoBi45K2+a2xgavHZJcqQTEMkmmqrR4FRL0V8dMjUmH8RXaLro7Oc5yOM/krPAl4r4WxdiD/iMaKYQ1wmPGhnb+NgpHmkkm1x41yx9F/V7m532+CbrTUs2wE0NOBeHNExGMVF6Jth6zZnJZ3599XRKDrKoHTr/cUvrKQaDrMMbjjEQiF3ivDAGIp4O4Cl4LxOjgblSPS5OlIvSr5tfcHTgt8L41FYzegejuXO4yEzxaRGtd8YqKqWjsqnTM49106Hb0J5ClrsK9SoKkzCmdHtZV2eyh4jAMXUHtT60S6rDP5lTpZ6fYEZmwhTE+odTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhvVTc+/gX9mTDuvNSMMNAJVT6OpgSGMna+kvt1qO94=;
 b=DBFdsrRXPucmxxJMz9RJRvq8efdjkmjXpP/Fu/F4ER2twLf3t0FUdNvnX43h/AYZ6+geE9SPZjQwh81g5O032N3LXGimRlc0h/TrSNZyXdFjLIQ3erYeE4aUrQtCoOLTLOOJQjAkl78I3jWPMoSZSVrhnIlHBHUZkIkBCR0tGuUAlAbUD04apNkUX/ZCk8R0uLlgem3bZkrZXbfZkeej36MbN/Zd5j1B7l7BoYPO+PTcXVF//vQIoiZVSaG0NWcZIAO35cmKcwXvCaiRyhEshbSS/k2kSdnblbsmjcCP3oJF8VqgBet+qcL2d7vcWjCJh1AHvHOgcxvccGHsav0s2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI0PR04MB10101.eurprd04.prod.outlook.com (2603:10a6:800:24a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 13:35:42 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 13:35:41 +0000
Date: Tue, 8 Apr 2025 16:35:38 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during
 compile testing
Message-ID: <iet2fsgwhe6bnkznz2z3xgidkbfhxas7madnzlflui5di2qbjl@wr36cskvjvje>
References: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
X-ClientProxiedBy: AS4P189CA0063.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI0PR04MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: ea520ca6-fb38-4939-008f-08dd76a241ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cW1qbUlFBcwGiNEevAdntIs4qmYHRlkKJEkECv54tNtncuUhOE19KblVPf2g?=
 =?us-ascii?Q?qYF5XPE+hseTGidF1N4HfsX8sgHzF/xXXeQT/DgXePUBwYiRLt+uAaWAtqVm?=
 =?us-ascii?Q?dBi9MVnBM/NcpnCMaPJcyyU8oM0Tq/lo8jWryik3q17CpByCLHWciuT70AWm?=
 =?us-ascii?Q?/+jSdPSdo8+cHuq3slcbM9+5r/h6NWe5pDwwl1DWG1OQzS7mmim16M/b+csC?=
 =?us-ascii?Q?LYOFxgZfiFQuc+N/G9gC0UxOJVS68f+kWhZvtcJ01jsmeyM5BRSVMoUFUQV2?=
 =?us-ascii?Q?ntliNsfoVxJpMFhUm+KhLPwVZelm6ma/U3EfbxgLBi79ET1rRA1MirdczORg?=
 =?us-ascii?Q?GAe1OlFv+yxsHAMaVjl9df+3FuthWgDyjAbtrq7FZoMHzbKf/eVJ2M/LYH2x?=
 =?us-ascii?Q?vxrIFaK7fW39mrfTfSUYWgSZg+W8hK8Um+IavxYCYRdp+yE/6a730+93N3fD?=
 =?us-ascii?Q?EZAXwqdIYVPtIPU/XXimefO1T14cb/9vg+GFpW0Y4/YThtM/MCAfdELvn1zF?=
 =?us-ascii?Q?wA/HF9ZXb5vZt/WGBL6x5sATYwMHt23D7mUKBTlMJTagHufoRQmKoWH366Al?=
 =?us-ascii?Q?3N46MsnUkzgVW/0ANUphVYw7DsDvcKnFjLBmfHTyrfwi32pqys62hXN2xNGn?=
 =?us-ascii?Q?ldpz/4HETqdm4kTRZkRtJW/2d/MVawWtZuXa7x1rBiZ8xfd9uXgW4we91xjJ?=
 =?us-ascii?Q?GX2qWCyJsji+qJTFgrB2oAayVdBSBdxpro7Qs/3QU/6T0i4Uk6Heyr7rgJLR?=
 =?us-ascii?Q?yf9COF6xfkHXt8RAti0Xqgk33GKYsunfTxfZlPWFHNgNuGpiO9KdO7Jf/UqA?=
 =?us-ascii?Q?DT1L73gzaED7cMvfITPi+Jdlk+Q9cbpNEf0kwCbQWLwImt6+/Nw9LrkW6ag6?=
 =?us-ascii?Q?EeFucKMbw4LFPF6Rl/WasyKLyR7VgaJWkWnx+nO53J0RgnOvgHBo3jcy5esL?=
 =?us-ascii?Q?uNTZxCdMk34i2hde9dDx+0T3AiF+MQqGRyTpn51sr9oIaGwVfJfH9AVKMr23?=
 =?us-ascii?Q?Tm2mzwxx6agoae5D6RSqoJbGmF+rhw7oNon4KLCqKm9rvFLk0PXW1tia2pn2?=
 =?us-ascii?Q?OE+Sl7WGm0RDklMWGniCCm1ulwy4pKHfepSa08/MwZ3TDpJWgsHASuF2Oq1m?=
 =?us-ascii?Q?butQBCLdCGA4bO5FlBX9UNksMmcvHi7tJZ+xJAOnhTCyPpHhSxXt5ktOk3HT?=
 =?us-ascii?Q?+duiizK/m4dCEj9ETp8Mx5K+nBR0rXzvE8941CwpMVdrMM38G179qoTtR18j?=
 =?us-ascii?Q?mTUmCRMxuBnnFNCXhBGzICGDPl9yy6v49bwrFYlJ+C/6vjLrTQWiDC8UJ9TD?=
 =?us-ascii?Q?+BiweIRFfu9f2TuJIv47p7ZxZo86fBtf3IDmvlz27cIAxnWDSSby2uLZQ6p7?=
 =?us-ascii?Q?oIW8xXrSa/F0RliFRJ7fzsNRISH9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DxmzN1q7NIgrquDBdA9gC4RYj59trIgZL1tKFqj0lmKBNGjJd3N7Vr/mJoWY?=
 =?us-ascii?Q?SDf9fLMLPI18iy96cMaBvXzqlG5O7t3JWBLl8pswpy7GeQRNtIHygfRHjKTg?=
 =?us-ascii?Q?sBbz3EnfzPXx1h78adWMbqaOa1mwb1/So0n87+UtJ+K7n7N7WVB2y67wzqrz?=
 =?us-ascii?Q?jyRCKGJoVVYEGUfgUtpIWBbOY1m/vdBRBP+/GTcUMVBBRKHvI1sg2181k/Mn?=
 =?us-ascii?Q?tLegAU0Pr99KZfMIhRYO9T3Fvwom8ePDG28UZ1E/cnIFMjeTY0OIIXwxBoAv?=
 =?us-ascii?Q?MbwfX9OwAHDPP3SawkCEp1pp1bRfCor0ebCrNMtcTCr51QbZRtuxHyvzrAHa?=
 =?us-ascii?Q?DnnKx94+VSmsMk80KPDSnBUExpTnXa03EcfDbu+EuIsJLMi8GycuaQQluem5?=
 =?us-ascii?Q?D38W1tGMZh0UcnQNBSzYrxS3BPMC+jXQ4T8AdB2Wi4AYlYhYq48T96EaY/AL?=
 =?us-ascii?Q?yY46UYXZz0H5+FqDkRi7F0Yatxmnhlw5+nqKAiT3pUy4T4hEOHTf6eTbxQKx?=
 =?us-ascii?Q?WDTLrgSd6ESrvPGSp18wygrSZ+zB0/gAn4XkBp9+vfbR46Zt9GVGTQI+/7ew?=
 =?us-ascii?Q?97zriA1SiGT/7DAiI69wFxZkIESa2Id+QrGGvoI5zWSxny2YqPKHn96TGcaD?=
 =?us-ascii?Q?LS4cnxrrFM2YSWYABTGoPEWqIbZlklO17e6yxZwsgk68A8IhnW7m6pstJX5a?=
 =?us-ascii?Q?OmtBfyj8v3b3b/RZsHaVPXmI9ASrRzp9IaGPynmAe1L7m6zV4ku02ozscsPi?=
 =?us-ascii?Q?1E+//y2nkabqEYZdmFBr/e4htrXeEllswv0bbohSHWkEQdePdIW33KgsIctu?=
 =?us-ascii?Q?I/cfiL081LduZirehRA64PPqK7XJpFSCf6HbWV2dRX3H0pj5yc5Dll5p55SG?=
 =?us-ascii?Q?nWGz2H20JwjCMvm2/Y+YRyw4KcNkdba6EH6cLCSqAmRnGLzTEfEXi2lBQzGL?=
 =?us-ascii?Q?uF4KvmQezkLh1rJxEwcxqKHk1P3d3Gzazq9cIvfD/etbbJ3aOJW+WqZbJbqK?=
 =?us-ascii?Q?cxqo5fS7x8IALcdrlRhaz64p3iDrEEEJV53q91eU17s/uNhqxjBTlng2NIyj?=
 =?us-ascii?Q?irJvoNvwvqM9LqbUBJ0WfBvVUtfjTUfurh9ThQpe5V8DashlQ94yhNIDCPlu?=
 =?us-ascii?Q?tJZzpa7DQNWgGbyHQbE0BRYczffEDyrDzjaWU4hWEoz7UjxT+HcsBjLIhNZQ?=
 =?us-ascii?Q?iYljVa5tduLZyV4swQdqJhVqUc+T9Q6WPoETjJkdCWbDGJN9TM278Fv8QeLK?=
 =?us-ascii?Q?l4HhmnCA2jg/zeWPQ6BlvF8X/smT5KaKmLSpTYE+/qnGtUVtENkpEqZDVlb9?=
 =?us-ascii?Q?ddGAtGhu2JDzdWGP4mEfFpkdeKRGdfrEwSRW1G0MZa2rpQ4ZvLbHhCW0rpEX?=
 =?us-ascii?Q?mwaXaSz7zWBAhpDid/Oqb1qqbfTgSkVJXm+b/LY81vnWDK3fSAvFZGye5hbg?=
 =?us-ascii?Q?+QTFfZYmkwE6Qz42+Wm79nEp7gEhMwOXPO7lOE+2F68nz/2t3qg3dPjbbadG?=
 =?us-ascii?Q?V+s2uS7FCT7LPVyj0takvWslMAEugz0ts945qb9TXFy6WItuoGqjUnD8g090?=
 =?us-ascii?Q?2Gu9I/E3gp3z8UGxo8K6P6RBZOfpY7cRWhQbFUzs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea520ca6-fb38-4939-008f-08dd76a241ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:35:41.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IgMeWjUyLPLyUsHPtWknfNmLXoDgynkN8v6xJ351DXUx+SJMUlsdfYypkMoX7lwbE97IxKee32Y0MP/IaoaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10101
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 04, 2025 at 01:24:07PM +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of such
> drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>


