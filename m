Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CA9307D1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 00:39:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=SHqeUWdf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM3Kl2Dsjz30VN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 08:39:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=SHqeUWdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM3K31sD7z30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 08:38:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV/K4PI/QIXkum9adtTR2T2QVJw29+lVR5SVTREOpEtdLg5+F5GO/g8JH53HGHY0FPkxcXvyGgG04g00TKQhKpHJJQK5wF1z1ZM/sJgpk3rbQnE1Uyuwe3AsrZpwuXGnDmVnTOh5TDgxf546q5it9OxW4cjwWIEKmIXFtF58/b8chPn3tlp9ZCczdcn8WqYHqkkcX6yD/sK+tBADsuPFpOPTtaHJP3Yw6VDbM2LLvSy+6sA8f9fWr+bMmpDsyTIU+n9xqoPgq3daL+5DaqZqi6o70MQ9CKQdaKGCg0g9RqqptUFgly5tt8YyKapwJ3J78JxEEUamBmiKIlvtVmf0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQHibKHzNFUlVYUeNpqmyILlVPuLu6CoO9q4sjOGOfo=;
 b=oj2bQz2aQqGjavBNAjEs6Wa+yWVf8PJ5rATsBC1VhsfDd2jwiDzohPSwZgo/+Ue9NNlm5Ct7YU101hXYpXvMliwni3oYqe7ydkEHTAEGt3DtOFN7ZvWOf5MQcDWIxnhgKboIXbNqFx13xzIbXGZHqBC5CTmmWA1JiVy9IiXTWFsW/G0HlMUspQRnWmHX/gsf1VggFAEgPrOoEfsRT/GDapR1eR9wS2YzOzTNWyxVZ/2VbLp73L0MivKH4keCKFKPpZU1BulQoo/NRyO5un7/xg7PzPLWxQjPhx4FEMsJXlVOo2YMzHKDRZyr2tBJBUpvgbV9n1NlDzgwI2M26eVXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQHibKHzNFUlVYUeNpqmyILlVPuLu6CoO9q4sjOGOfo=;
 b=SHqeUWdfXnEN6c7pESspNgi4CHlxHJsfnSaAA+i757gOY3iojz7q9qszwlWIS8iK6GnsZfFgQPaIXak05tQowdikapZfjt/zZhBiFDIm2DD0H0n30AvW5KHsIauiT+Ha0XucOQyHtcx3rntQuxdregLoxJLl6jCInrtkxcgR4pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Sat, 13 Jul
 2024 22:38:03 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:38:02 +0000
Date: Sun, 14 Jul 2024 01:37:59 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 2/5] net: dpaa: eliminate NR_CPUS dependency in
 egress_fqs[] and conf_fqs[]
Message-ID: <20240713223759.g62slq7iikw5s2q6@skbuf>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
 <20240710230025.46487-3-vladimir.oltean@nxp.com>
 <20240713153532.28bf1320@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713153532.28bf1320@kernel.org>
X-ClientProxiedBy: VI1P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::32) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|AM8PR04MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e7e3a1-dffe-4a2a-47b6-08dca38c74ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Vei6q3TNqGBQTkDNApkf5mFoMCFRDMY/ZsbLXSyB/19CAUWxECU15/80pkGw?=
 =?us-ascii?Q?rEmLam94Jeqx5DW89Fggxr6/cr/u1sgF2nC2DuzWHJNWuD6irY94zEKLSBaA?=
 =?us-ascii?Q?HREDNSbSmNufm8S7o6v7RBv45HXWabNixE9we3zQxpzKe2fe1cL4Uw369+pB?=
 =?us-ascii?Q?W7WF0zUcRP1GwSsKf3QCKCV/BU6dUbacP6HPY+MyYVerAFrrE6P/Zw8KrbAa?=
 =?us-ascii?Q?siPL2Pr3vtRGjYPkrovDSF00PJkljlhstrpZLPi822mBUXCKTXky0K6rmoob?=
 =?us-ascii?Q?ueU7YoyCysXnJZFSjAQD6N2sevkyO+voKTWFU3BfyuAoOZZqWsO7BhaKcaes?=
 =?us-ascii?Q?sID0p3hKhic1lneWflSgRJTbZoEjJsd+e5LHdkDsnpVfF6FX47MDMhP2S18H?=
 =?us-ascii?Q?1+2jNya3ozQk7nvb5FMcK1E/m9MI1QDA/4JP//1EXzWFkEMP3BBgqG4GxpO4?=
 =?us-ascii?Q?bGchJnYNsJIgyfwiaRa6CDcYReoMSeE06zk54RchiHMo76zyVZWR+U2l4F+6?=
 =?us-ascii?Q?QpDocScs176LEqoPWHteT24i6ak3pE+GgD9c0Opz8UeklZKTsyltRYMWY66+?=
 =?us-ascii?Q?TFRRsid06CL1rXZS1vIfSV9eukT2naL/g/JvfvEjAb8Hz8TGgJZPdZqjy5dF?=
 =?us-ascii?Q?nQKnp2gifFcVhKwlDsNoSpLHwk6heSpQ7BRS3M7QVXYgEQXry5YCBa9SssqV?=
 =?us-ascii?Q?ZrCfTizYEjl5VQyuE4T4MdAoSiMbzoGkoxW9CqwiaKztTHSpM1TPoWKLmsUR?=
 =?us-ascii?Q?eplSJcTfaeQ1PRQN7GbrkiwL/7W9QtxjQtVgYGLoVsM5WVvLrIRXkAl4jQff?=
 =?us-ascii?Q?RYAxz5PFIjygL9rJ/7FQOvyHs+bmC/PmG2YsXwOBaxgpVFGiV+GjftQT7HRC?=
 =?us-ascii?Q?ySQ1c2n4DzCqWH2sFLLTbI3HqW2JOedea7FUojzCJuHFJfD6bfB4PZtMLn7z?=
 =?us-ascii?Q?smdwyRO07vHvjZm3nrTibKhhHNkB5e7+nViMSkoEuOaADL8LckoUdxQa1/Ih?=
 =?us-ascii?Q?WVhBG1kwlcabkV3vF8Tp33q9vPSiA1TnSIFa98IIunKtXVoWvZ264t/qFi6P?=
 =?us-ascii?Q?KuiBtesZLyz0F6AzREbxmwU4xFoTqdQsXqJCFhGpJnOgkf0VfH+QGTYNoHDG?=
 =?us-ascii?Q?3AAYL054GHl8STymNtx00NFnp+nbsVmziyj7cBqP6BFk7C4yd86nOOFF5oo1?=
 =?us-ascii?Q?WZdg0UC0mS3uKl6M2AzEZQOUYf0Y7ZhG4HtzlEzUFHqK95FmpbTv2ytFwtaE?=
 =?us-ascii?Q?yeVns29ef1fOYBLjl4gj3nVEN85XVvzah/Ppivx1XB0euSBfgWswhBNB74D6?=
 =?us-ascii?Q?FlYYqRPlYvuMK7jS/sagVTaId8jRcO30bP6gFC1zmuPDrQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4fhLR8eCqbPWG9hk5h06ekyuMB62ICbqDdg+1ljzvWWuxheg3NOhOFJQMuS6?=
 =?us-ascii?Q?dIjMOPsychD4qtAYGnljp++gFKxwMwZjJesm5h5f8AIFgc2YpMjn+cVgbRXd?=
 =?us-ascii?Q?toVSbcv4bMX9oPUPIo948uHs8rXCzDP2m1Z+vPc1yEFB9BGZhI5jcrpG8gu9?=
 =?us-ascii?Q?zAi/1VedDLmANYEc8IgctG85e1yPzIcQzZ158p2rtje0Q9K0Dnlt+FqgyzPn?=
 =?us-ascii?Q?1/h7MU3TQ/QKuqZ7wyqokl7pe9IviJVX7CB3bWKJiwNbVXte8pm9GsEaEDT+?=
 =?us-ascii?Q?S8LMPLVxQNqTBsoKgmAdx72aTUQ0jeyOgLx6U5M/uMgbOPeJxJSGPU4RF/91?=
 =?us-ascii?Q?DY5Te0/Vp32KmkznbN7lgMy9NyoElhJB4ctK8B2uLRVMFet++PPZCcCL/qtp?=
 =?us-ascii?Q?GGNswTODwUfNcR33wGbtCHelLg3aPaQYH0AdCslsuV8o/rJoV90kSrmL942V?=
 =?us-ascii?Q?6EtB9MoeQDfL30mAM60PHjlw4SfZBoxK5Ul+AAtQqJ5iGipC9sohq0rjti7b?=
 =?us-ascii?Q?Vy0tbFzqo7Y8lMtsNUy31fXqw1AgHADn6jDwRWYF/tMJe6Y9e+mxxt/FOCBt?=
 =?us-ascii?Q?GjdC1+mPqC69Uq+q7lBNuB86uJFfj6hV0h5lAt6MvmKg0lS7qGuYcDeUuFBf?=
 =?us-ascii?Q?NsEUJqRQHJ9ERb2waYz+tRphfyzIE+/zNnTz4lwIK1HmB719v4aBOLxFbyDw?=
 =?us-ascii?Q?hDX+CBuAxr5iOsnwR8VaelUDzehQ9es2Lrzjz8bBNK2YbbkON75yC2/I3Tkd?=
 =?us-ascii?Q?j3F3+al3BDojr16Da1DuaT+a01EwbA/3XpEkIwlu6RVs7qV9fH0WPi3rGets?=
 =?us-ascii?Q?4H1eau9JDtzmZHO+ApbJrwqIrelrsZNNPPctDriNNc6hBjKYuboeCdyFW7Qs?=
 =?us-ascii?Q?9hZ2qgsnUGmvCCK52EhkTlLRJqISrf6z1Osbrp3pFLVsaHZQvrItrKR1R4uv?=
 =?us-ascii?Q?wgZjl0fMgL7rZC+H+BVP8kTGKYMsMFqFYKb1stOx/lYIcvJZrqz2XiMk01QY?=
 =?us-ascii?Q?eI2hn8Gv3HbGXMjGOVHQQWWOzgcXFnc5uMQaxA85uqYwbZkS1b79eB6IkuKv?=
 =?us-ascii?Q?b7hjcMcxIbsJByGM6HzZMN3BseM+jW4nZtchHkiWAQ/+bHeRMeSJ1NQ6iAta?=
 =?us-ascii?Q?cQHGAOXNt68VdW8VjXSgSYCR9qrXIQ0gD3bJLoBahbilRZ4xU1fbOxCUYvWk?=
 =?us-ascii?Q?jqmz0+zbeoEEo8Vb9mk18t9dN40bzCAhgx8lb/yf/CO8qp3Yfr0oyonqcSwM?=
 =?us-ascii?Q?qJHaAy8eGe2RpKT14KuFJV563Amh2tWN7ZOQRsEkbDrN4Tjb9Mi1NERzvipk?=
 =?us-ascii?Q?8a/tgf0VPpKiWHqLwZgjkcUDqLLdFIVpDx1KKNr7H/AtOeubPgzn/8j3n3lU?=
 =?us-ascii?Q?YRWZDVV03qvfeCVMtNc4P9ghK4iQFeMErkEcSFep4rHWnJ4+YGwoocBY1NBp?=
 =?us-ascii?Q?fs2FQL2LumObEBf5V4J12zurSf2i4bwLczaRoL6lKWg4r7Q8RlO6dUokpEN4?=
 =?us-ascii?Q?q6FKUBwfB1razeTUO407n/gQP4JPizzrVMcFVvRcDU4EZ9nG5o6nxK66UwHv?=
 =?us-ascii?Q?uoTmr6UZ25QQ5rVep8wCUnOb1axZu+mldAcxn7dXaxDz5Bl02AVAn3DuFeFm?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e7e3a1-dffe-4a2a-47b6-08dca38c74ac
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:38:02.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnsuqx72sA0lDfGotDSIad/ITGre9+lIUFCilNmuNb30JyPsfEu9Ak91JDWrNiNvq16TlcoNpm13bCzWu452WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 13, 2024 at 03:35:32PM -0700, Jakub Kicinski wrote:
> On Thu, 11 Jul 2024 02:00:22 +0300 Vladimir Oltean wrote:
> > +	priv->egress_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
> > +					sizeof(*priv->egress_fqs),
> > +					GFP_KERNEL);
> > +	if (!priv->egress_fqs)
> > +		goto free_netdev;
> > +
> > +	priv->conf_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
> > +				      sizeof(*priv->conf_fqs),
> > +				      GFP_KERNEL);
> > +	if (!priv->conf_fqs)
> > +		goto free_netdev;
> 
> Gotta set err before jumping
> -- 
> pw-bot: cr

Good point. Thanks for the review.
