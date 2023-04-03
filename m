Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E96D4680
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 16:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqt4n1N03z3cLF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 00:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AsiIIxAp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe12::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AsiIIxAp;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqt3t6zllz3c79
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 00:06:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9EELBI4A2vGh8TlL8SWPg1yjXVHuEVvkOKGQyLTO+F1Tj7R1LLaS2w7WD58nRlRK2OgKIZEVVSXG/Km4A+T8WU2CnqY9Xtwq3pkfRQ9R9RZ4VctkUrmrGVwbEvAnPAAEZOhJzBu4XcSsCR/ww6wBv024mNr6jKp8xDc9ftaKL6TN3kMTSg9zooIqvHZsjdMLoazlfcR5dxjBxYxEuCbQYcnAqlSmWx6gyyHKAf8H5AzDS1v21YN7zXH8tWvGDWTxABERoT4b1y3VjmSCpOX3p6KJ5X6VoM6Ysi5mL/dS43XVtfVnhFQY9J/K6S53vfpEVmz3BpqJqWgnFVaDK4mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7LsdbkeNbZ26ghdW7W4iRmLjkSzcp0UaTWD0DnkbFo=;
 b=Xsj3iyrSWQSFBb2XuVyvlqqHlItTpkCot8iN5y0dA82svyH9/FU60EkvQ46ZGc+K37I0RDdhsrZ+yT8MN53PTA+6P/B2ztiTEo/STJgI7kQOonOmKW/lttEUgYPYskAeGLOCVxFB1iqB+UHcCsTgZQioS4gQuCSZ6KnXDobmT3vADK94UsAezr+gCNmMz9A0PVJxVkdplhS0a0m0tr33bopZqn9spkGUIjtIkqgP75RhhbBsr+A4KpIvWGAiSMw0WYBuRkx0SdZTOINSzROZMMazFoUVR936isvxlfFtt/fFFSp/oVh/QnY5ViuflfhXI6BEcUWaXWRV8KzW59VUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7LsdbkeNbZ26ghdW7W4iRmLjkSzcp0UaTWD0DnkbFo=;
 b=AsiIIxApeqL8cXARA0bvIV9cWXVjHTCDlGfvekSbFVvNm38l4HOlPoISEJh/IqcUFB/RN+JCLyc+ZFOEPMFavycMKZC0UiLsbL447KCTn1ynf0j3+1V1oIREI7kXhJ3X+uioYPdf/+Y9krH4i9o0ZEDvbLrwHvAHmnIyw17mFvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:06:15 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::dfa2:5d65:fad:a2a5]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::dfa2:5d65:fad:a2a5%3]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 14:06:15 +0000
Date: Mon, 3 Apr 2023 17:06:11 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v2 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Message-ID: <20230403140611.6m7xmver4wnqqigk@skbuf>
References: <20230331151413.1684105-1-sean.anderson@seco.com>
 <20230331151413.1684105-1-sean.anderson@seco.com>
 <20230331151413.1684105-2-sean.anderson@seco.com>
 <20230331151413.1684105-2-sean.anderson@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331151413.1684105-2-sean.anderson@seco.com>
 <20230331151413.1684105-2-sean.anderson@seco.com>
X-ClientProxiedBy: AM4PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:205::20)
 To AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|DB8PR04MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8ab989-a56c-444e-e389-08db344c966f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  vo6lnZ0jb5kD44VGt2KawTjeKZacSIGiirixJgUTCGvwY0IPd5stUhb49HIPEtGNDNHm+Qg6t+4uGRHRtPMQ3xkKsZK8FkaE+6HjZCqi4tAK+io8dEaa1NVrkva3oIjTRWMMT+9xZ01sKVWtSeIITPfKsvMK1m/Au1GTiHZ4/y5ZGpgnl4m2FiPqG4doo6b/axRkBT0O5bcLoy7aWIjDFqjlm7sL9KuUeVudgwb/WwIHGxYATunGuH4MIW8uAoZanJqJHw261Z2wXIjRG1zd6Sd3jagLGjiwKYB8yFax6ul1his5NujIBetMP7l38++5prdGbh8n6OA9GoR2NYEmdpPZwlXQupQVKk5KsWPHuk7QTJD8ZkW1XD+GgPtWRsgPryasILBJwUDmorgq3F3wpynKoOvvZA27MwfIAdMFcw0mr6PjbQmwKLRbiNq4p2iISiWGILHzTLRHS17KzF40manRFnQXh+HYlNEkgSKVampTcebnYdM9mvpbJUU8loJzVHY6f7hftbovyfB9oXbk4udydPane2iEpSEHxfqwGQ0c1qraqgRiwKBJXcS8f13ZwVKrXZmBIuE63RCr2xGULw==
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(5660300002)(44832011)(54906003)(316002)(83380400001)(33716001)(6486002)(478600001)(186003)(966005)(86362001)(6666004)(6512007)(9686003)(6506007)(26005)(1076003)(41300700001)(4326008)(6916009)(8676002)(8936002)(66476007)(66556008)(66946007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?pQQcDP2F+NNQIIx1tTud39lxnmPzxB8nSlZnsH33fs8793GULKq9TgT6jhp7?=
 =?us-ascii?Q?p0s56H5Krhi9ZUz/uiuT3ThcaOuRQyjR9P6UtZvpXEiPqnkT5FObWzCdWC10?=
 =?us-ascii?Q?RYnX3URcrK5uHapvayI0q5RwfDgLOLBR7B65/yFB3PTE8yBrvbFJgh2txLrk?=
 =?us-ascii?Q?67mEsPW4NXaUN0bjSljAsrVBJB6ZfgEuEgKEwGfMneMoA63YSGAODSbQS/y0?=
 =?us-ascii?Q?rtg7VpNsHd0wgbW6L06zwlRXsuTESXqMNNadxMLnj8Gn8GdnBj0AzVUhOZqY?=
 =?us-ascii?Q?1ssliVIT7EwN+d+IW7IuUOSmAiyWEFAvFx7fThbKlnZQQRvuja6Xvf1yGWqc?=
 =?us-ascii?Q?F1/LYr0Zbl+Pnplxfp/ZuWUAX5ZRhw8gU7dQ5dO7VTpa/2EJpfTutbh9xo3n?=
 =?us-ascii?Q?9j2d1ZzXj8jF/Ep/r+msIeJ7rJ+ZM4yjmghmV19QtipijfQvAX7kYFQzqKjr?=
 =?us-ascii?Q?GqQSsPtnVW72BLEceC1cfv37u42GFM+M97t/nqVcMJQZMPtezjTuBDK8i0CX?=
 =?us-ascii?Q?SHUX6nXgm+6rDdJ6l8FgjyxgMD8JNHzoekMGP1XzMq5jGbhtg+Et6S0AGgpn?=
 =?us-ascii?Q?jRk1q2BrTxUflria+RTO5idUdWHOo5rS7/4SITviHVssbhJEzLRSO4cfnAKB?=
 =?us-ascii?Q?RsTYw7mgnKstabz1CIhQK9uQS4iANbizvALsm2TJ36OHWBUM1j21EFOZwwmd?=
 =?us-ascii?Q?d+NPx8/tw9mCC8ytHiqVq9ZbkaUOL5ePxoORUzhn4c5dIcnm2upbNMhS8CtZ?=
 =?us-ascii?Q?BtmSCx8REp3DyPNQkuQ0q+550U+zmUGabar7ctAYdt+r7bxzZS3mRTLZ5zMI?=
 =?us-ascii?Q?y2nxuaR0tS55uSKXZRulIe01Q+RTGVS4Nja6yevAKVbqf31R997HrqSRuypJ?=
 =?us-ascii?Q?ZiMIEKFnT55Xh8HhNLeF4FQ+Gwn6OzWtVrC2jc9fVWi36IYyyO81l6JgVFyP?=
 =?us-ascii?Q?iEEO7VEvA2cPzDhj9iLmx/ZVyc1ybPWLSS9OkSIBhdjNiUWV/5LDlVnsSmV6?=
 =?us-ascii?Q?VkdhGi0Dpd3Ex6ZkApWwK3g2NEpvutgy6wmRuvhGpF1qBWxTDKIcuIU58l7/?=
 =?us-ascii?Q?M5zmoiovvvEp8UgFaGXFc2ngoVmKHNbgg7C0P+6/ixaRWGDzv4iu2WHpIXu9?=
 =?us-ascii?Q?QOgk+k6NI5caqBDtLnkXjJ6nw23dBzGLNoIdPP0WluFRtVslp3w3xst6UiV6?=
 =?us-ascii?Q?sexwim+wa03iP9XiCIWW/mB+jbI0odFaaLCj9Wa07uvHIsvAcHQ4Lc2eyu9v?=
 =?us-ascii?Q?XJofOybHnEEwWsYqdXirxmA0j4CVjYhHFWnGv6ZMTBIhcN6by9H+ryxeQszp?=
 =?us-ascii?Q?JxtNojW8nYCj00uxj9BzNZBFmhxUExsvsoFP8Bhir028HgwpBpLisHJ4jQbb?=
 =?us-ascii?Q?S2Mx7z+BYN6mriN1yVTDQWnAHYx7FUjMLqc9BJCHafVlYd3BGn9+9HeAmsNx?=
 =?us-ascii?Q?FlQcQ8WKgJeimD6HfBSkKp5Nil5BJ8dx2/Pxuhou1lOpQRwsk3AoXFeQoC9L?=
 =?us-ascii?Q?KQd6FbzzGtXncBB22SNH55f3HKyhH+CXOQlAnlrs44/jtL/Fpjtp3NIxE3Bh?=
 =?us-ascii?Q?opOkjvVV1i9SXL2cA+v8mMzhnpLR4YNgtVg26E7CSE0Z5v+iuiZqOAFTpk+k?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8ab989-a56c-444e-e389-08db344c966f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:06:15.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVmdo2K5rAk4v1iBK+MgNrWX34t/6c8qdhD8oDjWh0K2aRlBC9ILA2BEdGoUQNjuIRDqckOvsiRSZLB34mmkMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
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
Cc: Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023 at 11:14:13AM -0400, Sean Anderson wrote:
> cgr_lock may be locked with interrupts already disabled by
> smp_call_function_single. As such, we must use a raw spinlock to avoid
> problems on PREEMPT_RT kernels. Although this bug has existed for a
> while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
> queue depth on rate change") which invokes smp_call_function_single via
> qman_update_cgr_safe every time a link goes up or down.
> 
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")

Same comment about the Fixes tag.

git tag --contains c535e923bb97
v4.9
git tag --contains 96f413f47677
v4.16

Looking at https://www.kernel.org/, I see that kernel 4.14 is still
maintained but should not have this patch backported, do you agree?

> Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Link: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---

Anyway,

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
