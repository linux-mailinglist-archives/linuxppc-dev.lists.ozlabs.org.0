Return-Path: <linuxppc-dev+bounces-7134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6BA652AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:18:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGcXF5BD0z2ynR;
	Tue, 18 Mar 2025 01:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742221117;
	cv=pass; b=PPkek1BMbtDe/B6tNiJlBvDqq1tcFZRkPHFpMtZ1pVSpuammjFjuXkkVivuIy1C2p/FD/4thkPDS3rwSm3shMcSQn5f1b8FMT/jejZSvuft3R5kcYe57WZQX4BEmk/6kMkZ1HInVNRO06FwnByY2EpwpXz5x9Ku+qENNZhaoh25dOCjqMqBENzbbW7hq/ZB6wVQ/RQhfRqve+HEr7zD9C8MJr3YXEq74dPsYWuZTJKUOfWYgCSArd0agFy0Twd7LAVad37qwOzjQsnqistEmMHRFtcUQeY25IBEUulq6TDKbTMBjymCIP2X1NrrG3Ys94w3B8GtUnMYxnd0GklogDA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742221117; c=relaxed/relaxed;
	bh=VNpFb4cPoc9LsjFZEhbQ+WG0KI9NgjAhi79pjWfgQa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k91Qkq+xCQVNnGUSyFLBj2a75ggZIIlKOp16AQ0wZqAPA7j3ljVRPvGYdNCZndbQWNiUwTgAnYLYs2RaipdYIgnOelH7G/WbKyUi1RmzKl42eDyAYx9V8XnZQFgmOHzm0ALHTY6wnuft0gq0jZ2yf2JzjFrVhQ5EY6M8XnL07oH51ih7fm32OyuoluAXCmzoQKp3vb0I5hawB+SHZY1wLMlGo/WBEYlBYmYnfCwpSXGKL0zVc1WxikzZkm7ZtyQahzHazxujHoLTIJaFDGpNg0Isf6CRWKh7gCsQzrZxGotARXtrFjXXr9ZnKYJ1fxo3kZhm5n4T8697IrRd7eU3qg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hRyibAhi; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hRyibAhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGcXD0RMwz2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:18:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzLYWUbTx6cmrlOfQ78pBeadQ+wEOnS8yUz9ttfn3dd/fg8RJ9ustFhxL1Pa2PO4o4PmJtCgEKS/prgLxp0M2Gv1wUy47corUDqcPCq80HqeY91zzT2r9HAAAPkaM8RCdsul80/dF6nXk+2j5tofB/nGsItl4nIAUXJ6BVcc09t0ryc/xdxmmwzAEZRHDgsaH1YrILVEk32+kIEBh4ZLe0z0JblZ12g3isKpPQLgP2D+R4DZGQn7QEG+tM53P2ShVmZHEfgYwzwT4fq5Q821jnsVf8tevD1YEETbYZZl+gKHbGmpOWwWhpVOz6oNdHQsqkNwvn7q0uD/ExWZcJwojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNpFb4cPoc9LsjFZEhbQ+WG0KI9NgjAhi79pjWfgQa0=;
 b=RgDnb4zV4+Hp4ACAgIKGjc0vpEdanXtwbWB66gJVRC2niD0L7qlUUPIqJG5kKpBUldw+HkotpbbniAR8bg1z2LuJi1xCoqLjI48EmLB9V6JDdMg9i7WDL4SsBjkiKD4FgSDXpacAhx3fHOevTN5XbRkpFc5yyl0ox19t/8dkpn1l1LhFLQ8eh4t0yS0u6zRsUznv9pWSO5D/WVxbOc6SJcoMuhSJx5mWolpFQutoilMESRMfq0sYQj/MuaOMCVKV2XG6dumLi5uhEKnLR8bn2RVynH0AWtGPwzNnqHCH4HRGQR7IkmdxFIVE9SHm1fGSVucOfHYeTZGn6OKAVEFzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNpFb4cPoc9LsjFZEhbQ+WG0KI9NgjAhi79pjWfgQa0=;
 b=hRyibAhiz2hECbFBzy3L5JJGS5Y5ew6tA1OSuQ5bki/6wn545ILLFLVJMavM66JATQPLAG9kPiHC8PhWNj5W36jRsy6913WPt4/aZvyPznrktDpdfVm4yWKcADnju11ibLQDDfo0O9KPGZ+Q3oY03vE9s473t8ljOqC/1RaBVYQO0IxiADIWKREMUcvoQFZjkGekQMZTfKLtLk6wGXCEzXR1EpRY88IpUcqc/DsU0dIXSIS4w1mQfRSfwsPZ8/7MMtexK30LgwMRxPt8lMFzeK9WpQdFJmMCNp/Uud9RHuijHmVSYL2U6aht7jKDWr2oBotV/mUycPbLSoIrP+p5Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA1PR04MB10579.eurprd04.prod.outlook.com (2603:10a6:102:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 17 Mar
 2025 14:18:11 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:18:11 +0000
Date: Mon, 17 Mar 2025 16:18:07 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Message-ID: <20250317141807.2zobsefxl5vnqdet@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-5-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR09CA0101.eurprd09.prod.outlook.com
 (2603:10a6:803:78::24) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA1PR04MB10579:EE_
X-MS-Office365-Filtering-Correlation-Id: 6185dd38-4c5b-4456-e7f2-08dd655e8bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HIjp10xwt/i6OlzR0OSdxB8jzAYayNu/3s2IlcAgkEFNslh27a5V+5TG4Fo1?=
 =?us-ascii?Q?wydZtJb/7NF9Ypo6mDeNrRZOu9gH3atn446QqdvjyDDXtukvQdtS1mAg+5F+?=
 =?us-ascii?Q?lsdousc5O0CNMyaG/gQOnhgVpL9s99ZRMQPucwzTsBD8d8hqPEAKGT1IJBWD?=
 =?us-ascii?Q?kz4O/6UZfWEqInReosk2h2nDqVyDmTHBqFYSZuRbTC9QbhRkv0elISIku7lU?=
 =?us-ascii?Q?pFXardvdWecZpAPs2ApG1F54hVLnmUKQwBjS426loGbuDl/n2W805+mjjv6B?=
 =?us-ascii?Q?Kr7eB2fd0lhYjCdGFMak8MkeUV1501FDL4dbQ7/s/9dk3l7DM7nI89xCPVR9?=
 =?us-ascii?Q?Nt/bshUxjJ5NlwsHzah6yHTyAozM6ZdL7oMb0fgUsaWdB6u4lC/nLVRf1Omd?=
 =?us-ascii?Q?saLIovqwBbmo/k0CSetNX4FCqbTQ/g7Ql86RkVFg/+rJlo3tnYHENa6djkDt?=
 =?us-ascii?Q?aeDsqt0pbhI/DpCXkJesPpzOHCXhWJ4CMDyi+yTuDYGmzvfaEiT3VttVKHc0?=
 =?us-ascii?Q?Gm/qySZuKRU/TQnDL73rEqlmP7GbWdQsEyZ1nVC+QSDda0YhFq+ZgRgOQMQb?=
 =?us-ascii?Q?gdkC2dH10iOKvIPpeHr6uFCp6fCzpG9YeMo3JW0YYRjM38RhBe8QrZkrEu/r?=
 =?us-ascii?Q?AO1T7A9cUSgk9+cKFNPb5qzrBH0A4lstYKj63zj+zZHwhOSZhwd0zkp4Z+aI?=
 =?us-ascii?Q?EGB85LJULZc2iGeoBOvci0npbGuuev1X74O0SY4oGqM/QD8CsucoCLI1RPui?=
 =?us-ascii?Q?xskjE9Ts0Q7tSJ7qR3F2GoAGjN2wEg+V5JALYunJ2MCzfilqG7yDSh0+Y+BK?=
 =?us-ascii?Q?vPS4DpvFEXgR+a4aF2dLDhiesJcGsucQhPY94qcFlBDOsQfCOX+Wpg88b4pM?=
 =?us-ascii?Q?07TgRn06XRg3wVBeSRLTap8vqY+Cc05zvoXdX2D/I8b91ouIMXvXrmW92iP0?=
 =?us-ascii?Q?wy/6aCLnlxCCb5N0n06Wjqi4D+jDUFbChZVuUBkMc2dWaD3E5QZsso2bK3xV?=
 =?us-ascii?Q?JpX3Twyg81kSvLtFlvb6rtg1poJEHJTetjt9PMxeUavvExugE3G/o/KJJsUp?=
 =?us-ascii?Q?cI8LHae6rBLphr3KdUD0Uevdto9scqm8AOFfNFf+vktAXJnpO6ZRy1dx5vbe?=
 =?us-ascii?Q?hYT0EX4CGrKlDbeC/IrgsmpMdRSl3WPcuf6Jgi/QPyL1t0+w3Cf+e8eXF6Az?=
 =?us-ascii?Q?+drVSBIaGsa2D1vDUODg8Sr1whhYsx/9Es28+kRcEhWaU6CBtsXV3i+RtJ1X?=
 =?us-ascii?Q?3bCHgOmBtRSnbVb5966ywf6dEUhAiBgrniVHjrBR0e8ghCgUabAcV61oTi6u?=
 =?us-ascii?Q?XijDATmIiBkjF7obtCQ/gR5CWe7umQUEJRTIXlMVwBckaEaKEinlJi7q0Skd?=
 =?us-ascii?Q?G+nTJ2wKPQQ74TNEGpikwo+1w3Bq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cWDFJxb1cw4g6yGPLZOnDlRcPN6VDPeIUdXnfVIa4HuhvhxlMCjldLNs50wQ?=
 =?us-ascii?Q?K3kxsYQu0Z7itlh4Mo9FWyw8SiZGcftzLbFgD/mjRx3h3pw78rVHIv1eNExJ?=
 =?us-ascii?Q?LOeUhcGTeSRabeumqv1a0+WAApZZhbIG4qRovMwHwlLAcNuhEgcz/Aga/c85?=
 =?us-ascii?Q?NvHgZ7NFPn3HMQkuqi1iInqNORMHnhFL8IWciMoUoyPHuP0Hv8jjxbSd1ilc?=
 =?us-ascii?Q?31GahHSmoKzG4oDDcbvqcSKDdk7rtdNX66ML60QQhyD9l5Yal3x4levw4Tjd?=
 =?us-ascii?Q?Nx69Ncx/39H5MimbNwvYmsmIBHoZi78rEZ8+Z1t1j4rSeX8ia/yg59XMnZlD?=
 =?us-ascii?Q?dzIm5OmxcYQGW750XUJoDyuBk9nGeEzylm+ybE+8rtRDmlsEIN8qaYvLGeCd?=
 =?us-ascii?Q?CmGtZhRcjIRXcLV+KUj+NaWjr/LuNSMHjvW0CxBsEPLVT7saYeA4eN75n5Bo?=
 =?us-ascii?Q?HzVqGpwr+lRHCpzRaDM8CVCesowJNSm3+Ebx1OIREQfVBFHa1Ksb4kW9gjFs?=
 =?us-ascii?Q?tvypesaljQapr20aVXaXMYArC5KTclXcLBT92FtYw/obP2YOdD23BbieJTpK?=
 =?us-ascii?Q?/X1Q04qdC0hChHBNOaQGfWexRNn8v49x4YvkiieRJGeU8i57kMAdb6Glop+J?=
 =?us-ascii?Q?PYnDmbdZYvLpbPzS8Cd4xjBO57jBWVLu04smC4s0yAyz4fWfb7hC2DWWQx6x?=
 =?us-ascii?Q?DVMnKl67HD0P63eReVdJODzs2BaeiKprsyFLi4cBXgDa8aMooW+x1sQzTjkq?=
 =?us-ascii?Q?QjOLIoEBKjjkpiqiO+KbKlXivuBc8ru79X3nNeWshVRcLsVYI3cG25yClEwc?=
 =?us-ascii?Q?MF3ph7aeW843qIH8RAUBUMatObCr9fPXynjYovVF2KUKAA/CMxVxDw45u6Rj?=
 =?us-ascii?Q?RRXO/bBTqqcAyu8GejLn5mB4m6qdO0lZvhNqKxXQV4k9g/WoRQSSYNy5Fsdb?=
 =?us-ascii?Q?QQkFaupiwcqnFv/OxE7FI6OgE+fqcNFo1DemFWnoR8OdlNchjAktqAJ4UKW8?=
 =?us-ascii?Q?FVZIbeyhBJK3C74dQEX+gHYk6RsQ76w0a6j7GynldjXI5yE7Tk3uhWojCTF7?=
 =?us-ascii?Q?2gwmLC3F+QDfxq/xo9LHd5kmuMT5GSDVTZRHSRrE0xKCleZHcUOyBA8Th/fL?=
 =?us-ascii?Q?oJU7GucIW8slILqQzovLCTtcptKdAremRv1o2mt5VrnkafyFoOWtU0mTSzcA?=
 =?us-ascii?Q?wQmctlRDYqyRmcYk69cLlpPOePFrI8ON7E6btMk50t5t/h0waaAZMNvHwCie?=
 =?us-ascii?Q?5nRKqzhaDkXbDB9poZEidMTW3FFWyds/BTRvnZgRA8trbEwpqlA4Bhz+8rPt?=
 =?us-ascii?Q?zqNMAMVr8xgEyQUJ23E487GXo2unFpCMn3NFpsUJMkjJYRHdo603tp+U8P7a?=
 =?us-ascii?Q?15XFXuwGpH1371prIX1V6KwsPSa0wQayoI7e5lNmLtSFUyFPWnSYN3pyPEF6?=
 =?us-ascii?Q?TMdw2EA+74ItgjcOU5DBIEreFqHyb+YPDrPHrSyCIxFfu/2CYeApp8Y1cnEn?=
 =?us-ascii?Q?0EPMOfCtwP+t+sCrJajIONNcoETXH3r6FLZ/G5GnlU5ocp0JQ4d6URa/Vm78?=
 =?us-ascii?Q?o7BhCzmq6ay+sl86+CVeRueaTttOFtUObqVAglKL8IjH9kfOAObm8KtWjymb?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6185dd38-4c5b-4456-e7f2-08dd655e8bd0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:18:10.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EbrCJGGgNZ7O2MXtUjRT2JzIy7jLNKTRpaljeVxzH9hSeqvd+etx+epHdRJgCwC3KnAK/Nm+rmt/CJQhj33rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10579
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:20PM +0800, Wei Fang wrote:
> The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
> hash filter is implenented through a 64-bits hash table to match against

s/implenented/implemented/
s/64-bits/64-bit/

> the hashed addresses, PF and VFs each have two MAC hash tables, one is
> for unicast and the other one is for multicast. But MAC exact filter is
> shared between SIs (PF and VFs), each table entry contains a MAC address
> that may be unicast or multicast and the entry also contains an SI bitmap
> field that indicates for which SIs the entry is valid.
> 
> For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
> observation of the system default network configuration, the MAC filter
> will be configured with multiple multicast addresses, so MAC exact filter
> does not have enough entries to implement multicast filtering. Therefore,
> the current MAC exact filter is only used for unicast filtering. If the
> number of unicast addresses exceeds 4, then MAC hash filter is used.
> 
> Note that both MAC hash filter and MAC exact filter can only be accessed
> by PF, VFs can notify PF to set its corresponding MAC filter through the
> mailbox mechanism of ENETC. But currently MAC filter is only added for
> i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
> subsequent patches.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc.h  |   2 +
>  .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 422 +++++++++++++++++-
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
>  .../net/ethernet/freescale/enetc/enetc_pf.h   |  11 +
>  5 files changed, 448 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
> index 9380d3e8ca01..4dba91408e3d 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.h
> @@ -316,6 +316,8 @@ struct enetc_si {
>  	const struct enetc_si_ops *ops;
>  
>  	struct enetc_mac_filter mac_filter[MADDR_TYPE];
> +	struct workqueue_struct *workqueue;
> +	struct work_struct rx_mode_task;
>  };
>  
>  #define ENETC_SI_ALIGN	32
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> index 695cb07c74bc..826359004850 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> @@ -99,6 +99,14 @@
>  #define ENETC4_PSICFGR2(a)		((a) * 0x80 + 0x2018)
>  #define  PSICFGR2_NUM_MSIX		GENMASK(5, 0)
>  
> +/* Port station interface a unicast MAC hash filter register 0/1 */
> +#define ENETC4_PSIUMHFR0(a)		((a) * 0x80 + 0x2050)
> +#define ENETC4_PSIUMHFR1(a)		((a) * 0x80 + 0x2054)
> +
> +/* Port station interface a multicast MAC hash filter register 0/1 */
> +#define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
> +#define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
> +
>  #define ENETC4_PMCAPR			0x4004
>  #define  PMCAPR_HD			BIT(8)
>  #define  PMCAPR_FP			GENMASK(10, 9)
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index 63001379f0a0..7d1c545f3f56 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -11,6 +11,15 @@
>  
>  #define ENETC_SI_MAX_RING_NUM	8
>  
> +#define ENETC_MAC_FILTER_TYPE_UC	BIT(0)
> +#define ENETC_MAC_FILTER_TYPE_MC	BIT(1)
> +#define ENETC_MAC_FILTER_TYPE_ALL	(ENETC_MAC_FILTER_TYPE_UC | \
> +					 ENETC_MAC_FILTER_TYPE_MC)
> +
> +struct enetc_mac_addr {
> +	u8 addr[ETH_ALEN];
> +};
> +
>  static void enetc4_get_port_caps(struct enetc_pf *pf)
>  {
>  	struct enetc_hw *hw = &pf->si->hw;
> @@ -26,6 +35,9 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
>  
>  	val = enetc_port_rd(hw, ENETC4_PMCAPR);
>  	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
> +
> +	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
> +	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
>  }
>  
>  static void enetc4_pf_set_si_primary_mac(struct enetc_hw *hw, int si,
> @@ -56,6 +68,341 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
>  	put_unaligned_le16(lower, addr + 4);
>  }
>  
> +static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
> +					 int type, bool en)
> +{
> +	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
> +
> +	if (type == UC) {
> +		if (en)
> +			val |= PSIPMMR_SI_MAC_UP(si);
> +		else
> +			val &= ~PSIPMMR_SI_MAC_UP(si);
> +	} else { /* Multicast promiscuous mode. */
> +		if (en)
> +			val |= PSIPMMR_SI_MAC_MP(si);
> +		else
> +			val &= ~PSIPMMR_SI_MAC_MP(si);
> +	}
> +
> +	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
> +}
> +
> +static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
> +					     int type, u64 hash)
> +{
> +	if (type == UC) {
> +		enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
> +		enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
> +	} else { /* MC */
> +		enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
> +		enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
> +	}
> +}

Please split into separate functions for unicast and for multicast.
The implementations don't share any code, and the callers are not in
common code either.

> +
> +static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	struct hlist_node *tmp;
> +
> +	mutex_lock(&pf->mac_list_lock);

The mutex_lock() usage here should raise serious questions. This is
running right before mutex_destroy(). So if there were any concurrent
attempt to acquire this lock, that concurrent code would have been broken
any time it would have lost arbitration, by the fact that it would
attempt to acquire a destroyed mutex.

But there's no such concurrent thread, because we run after destroy_workqueue()
which flushes those concurrent calls and prevents new ones. So the mutex
usage here is not necessary.

[ same thing with mutex_init() immediately followed by mutex_lock().
  It is an incorrect pattern most of the time. ]

> +
> +	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
> +		hlist_del(&entry->node);
> +		kfree(entry);
> +	}
> +
> +	pf->num_mfe = 0;
> +
> +	mutex_unlock(&pf->mac_list_lock);
> +}
> +
> +static bool enetc_mac_filter_type_check(int type, const u8 *addr)
> +{
> +	if (type == ENETC_MAC_FILTER_TYPE_UC)
> +		return !is_multicast_ether_addr(addr);
> +	else if (type == ENETC_MAC_FILTER_TYPE_MC)
> +		return is_multicast_ether_addr(addr);
> +	else
> +		return true;
> +}
> +
> +static struct enetc_mac_list_entry *
> +enetc_mac_list_lookup_entry(struct enetc_pf *pf, const unsigned char *addr)
> +{
> +	struct enetc_mac_list_entry *entry;
> +
> +	hlist_for_each_entry(entry, &pf->mac_list, node)
> +		if (ether_addr_equal(entry->mac, addr))
> +			return entry;
> +
> +	return NULL;
> +}
> +
> +static void enetc_mac_list_add_entry(struct enetc_pf *pf,
> +				     struct enetc_mac_list_entry *entry)
> +{
> +	hlist_add_head(&entry->node, &pf->mac_list);
> +}
> +
> +static void enetc_mac_list_del_entry(struct enetc_mac_list_entry *entry)
> +{
> +	hlist_del(&entry->node);
> +	kfree(entry);
> +}
> +
> +static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
> +					       struct enetc_mac_addr *mac,
> +					       int mac_cnt)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	int i;
> +
> +	for (i = 0; i < mac_cnt; i++) {
> +		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
> +		if (!entry)
> +			continue;
> +
> +		entry->si_bitmap &= ~si_bit;
> +		if (entry->si_bitmap)
> +			continue;
> +
> +		enetc_mac_list_del_entry(entry);
> +		pf->num_mfe--;
> +	}
> +}
> +
> +static bool enetc_mac_list_is_available(struct enetc_pf *pf,
> +					struct enetc_mac_addr *mac,
> +					int mac_cnt)
> +{
> +	int max_num_mfe = pf->caps.mac_filter_num;
> +	struct enetc_mac_list_entry *entry;
> +	int cur_num_mfe = pf->num_mfe;
> +	int i, new_mac_cnt = 0;
> +
> +	if (mac_cnt > max_num_mfe)
> +		return false;
> +
> +	/* Check MAC filter table whether has enough available entries */
> +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> +		for (i = 0; i < mac_cnt; i++) {
> +			if (ether_addr_equal(entry->mac, mac[i].addr))
> +				break;
> +		}
> +
> +		if (i == mac_cnt)
> +			new_mac_cnt++;
> +
> +		if ((cur_num_mfe + new_mac_cnt) > max_num_mfe)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int enetc4_pf_add_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
> +					     struct enetc_mac_addr *mac,
> +					     int mac_cnt)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	struct maft_entry_data data = {0};

As I've also learned, what you actually want is an empty struct initializer "= {}" here:
https://lore.kernel.org/netdev/20210810091238.GB1343@shell.armlinux.org.uk/

> +	struct enetc_si *si = pf->si;
> +	u16 si_bit = BIT(si_id);
> +	int i, num_mfe, err = 0;
> +
> +	mutex_lock(&pf->mac_list_lock);
> +
> +	if (!enetc_mac_list_is_available(pf, mac, mac_cnt)) {
> +		err = -ENOSPC;
> +		goto mac_list_unlock;
> +	}
> +
> +	num_mfe = pf->num_mfe;
> +	/* Update mac_list */
> +	for (i = 0; i < mac_cnt; i++) {
> +		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
> +		if (entry) {
> +			entry->si_bitmap |= si_bit;
> +			continue;
> +		}
> +
> +		entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +		if (unlikely(!entry)) {
> +			/* Restore MAC list to the state before the update
> +			 * if an error occurs.
> +			 */
> +			enetc_mac_list_del_matched_entries(pf, si_bit,
> +							   mac, i + 1);
> +			err = -ENOMEM;
> +			goto mac_list_unlock;
> +		}
> +
> +		ether_addr_copy(entry->mac, mac[i].addr);
> +		entry->si_bitmap = si_bit;
> +		enetc_mac_list_add_entry(pf, entry);
> +		pf->num_mfe++;
> +	}
> +
> +	/* Clear MAC filter table */
> +	for (i = 0; i < num_mfe; i++)
> +		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
> +
> +	i = 0;
> +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> +		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
> +		ether_addr_copy(data.keye.mac_addr, entry->mac);
> +		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);

Don't discard error code.

> +	}
> +
> +mac_list_unlock:
> +	mutex_unlock(&pf->mac_list_lock);
> +
> +	return err;
> +}
> +
> +static void enetc4_pf_flush_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
> +						int mac_type)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	struct maft_entry_data data = {0};

s/{0}/{}/

> +	struct enetc_si *si = pf->si;
> +	u16 si_bit = BIT(si_id);
> +	struct hlist_node *tmp;
> +	int i, num_mfe;
> +
> +	mutex_lock(&pf->mac_list_lock);
> +
> +	num_mfe = pf->num_mfe;
> +	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
> +		if (enetc_mac_filter_type_check(mac_type, entry->mac) &&
> +		    entry->si_bitmap & si_bit) {
> +			entry->si_bitmap ^= si_bit;
> +			if (entry->si_bitmap)
> +				continue;
> +
> +			enetc_mac_list_del_entry(entry);
> +			pf->num_mfe--;
> +		}
> +	}
> +
> +	for (i = 0; i < num_mfe; i++)
> +		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
> +
> +	i = 0;
> +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> +		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
> +		ether_addr_copy(data.keye.mac_addr, entry->mac);
> +		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);

Don't discard error code.

Also, can't you edit MAFT entries in-place over NTMP? Deleting and
re-adding filters creates small time windows where you might have
RX packet loss, which is not ideal.

> +	}
> +
> +	mutex_unlock(&pf->mac_list_lock);
> +}
> +
> +static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int type)
> +{
> +	int max_num_mfe = pf->caps.mac_filter_num;
> +	struct net_device *ndev = pf->si->ndev;
> +	struct enetc_mac_addr *mac_tbl;
> +	struct netdev_hw_addr *ha;
> +	u8 si_mac[ETH_ALEN];
> +	int mac_cnt = 0;
> +	int err;
> +
> +	mac_tbl = kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);

Can't you know ahead of time, based on netdev_uc_count(), whether you
will have space for exact match filters, and avoid unnecessary
allocations if not? enetc_mac_list_is_available() seems way too late.

> +	if (!mac_tbl)
> +		return -ENOMEM;
> +
> +	enetc_get_primary_mac_addr(&pf->si->hw, si_mac);
> +
> +	netif_addr_lock_bh(ndev);
> +	if (type & ENETC_MAC_FILTER_TYPE_UC) {
> +		netdev_for_each_uc_addr(ha, ndev) {
> +			if (!is_valid_ether_addr(ha->addr) ||
> +			    ether_addr_equal(ha->addr, si_mac))
> +				continue;
> +
> +			if (mac_cnt >= max_num_mfe)
> +				goto err_nospace_out;
> +
> +			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
> +		}
> +	}
> +
> +	if (type & ENETC_MAC_FILTER_TYPE_MC) {

Dead code, you never add multicast addresses as exact match filters.
Please remove.

> +		netdev_for_each_mc_addr(ha, ndev) {
> +			if (!is_multicast_ether_addr(ha->addr))
> +				continue;
> +
> +			if (mac_cnt >= max_num_mfe)
> +				goto err_nospace_out;
> +
> +			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
> +		}
> +	}
> +	netif_addr_unlock_bh(ndev);
> +
> +	err = enetc4_pf_add_si_mac_exact_filter(pf, 0, mac_tbl, mac_cnt);
> +	kfree(mac_tbl);
> +
> +	return err;
> +
> +err_nospace_out:
> +	netif_addr_unlock_bh(ndev);
> +	kfree(mac_tbl);
> +
> +	return -ENOSPC;
> +}
> +
> +static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
> +{
> +	struct net_device *ndev = pf->si->ndev;
> +	struct enetc_mac_filter *mac_filter;
> +	struct enetc_hw *hw = &pf->si->hw;
> +	struct enetc_si *si = pf->si;
> +	struct netdev_hw_addr *ha;
> +
> +	netif_addr_lock_bh(ndev);
> +	if (type & ENETC_MAC_FILTER_TYPE_UC) {
> +		mac_filter = &si->mac_filter[UC];
> +		enetc_reset_mac_addr_filter(mac_filter);
> +		netdev_for_each_uc_addr(ha, ndev)
> +			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
> +
> +		enetc4_pf_set_si_mac_hash_filter(hw, 0, UC,
> +						 *mac_filter->mac_hash_table);
> +	}
> +
> +	if (type & ENETC_MAC_FILTER_TYPE_MC) {
> +		mac_filter = &si->mac_filter[MC];
> +		enetc_reset_mac_addr_filter(mac_filter);
> +		netdev_for_each_mc_addr(ha, ndev)
> +			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
> +
> +		enetc4_pf_set_si_mac_hash_filter(hw, 0, MC,
> +						 *mac_filter->mac_hash_table);
> +	}
> +	netif_addr_unlock_bh(ndev);
> +}
> +
> +static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
> +{
> +	/* Currently, the MAC address filter table only has 4 entries, and the
> +	 * table is shared by PF and VFs. In the default network configuration,
> +	 * the MAC filter will be configured with multiple multicast addresses,
> +	 * so it is only suitable for unicast filtering. If the number of unicast
> +	 * addresses exceeds the table capacity, the MAC hash filter will be used.
> +	 */
> +	if (type & ENETC_MAC_FILTER_TYPE_UC) {
> +		if (enetc4_pf_set_mac_exact_filter(pf, ENETC_MAC_FILTER_TYPE_UC))
> +			/* Fall back to the MAC hash filter */
> +			enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
> +	}
> +
> +	if (type & ENETC_MAC_FILTER_TYPE_MC)
> +		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
> +}
> +
>  static const struct enetc_pf_ops enetc4_pf_ops = {
>  	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
>  	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
> @@ -71,9 +418,18 @@ static int enetc4_pf_struct_init(struct enetc_si *si)
>  
>  	enetc4_get_port_caps(pf);
>  
> +	INIT_HLIST_HEAD(&pf->mac_list);
> +	mutex_init(&pf->mac_list_lock);
> +
>  	return 0;
>  }
>  
> +static void enetc4_pf_struct_free(struct enetc_pf *pf)
> +{
> +	enetc4_pf_destroy_mac_list(pf);
> +	mutex_destroy(&pf->mac_list_lock);
> +}
> +
>  static u32 enetc4_psicfgr0_val_construct(bool is_vf, u32 num_tx_bdr, u32 num_rx_bdr)
>  {
>  	u32 val;
> @@ -305,12 +661,53 @@ static void enetc4_pf_free(struct enetc_pf *pf)
>  	enetc4_free_ntmp_priv(pf->si);
>  }
>  
> +static void enetc4_pf_do_set_rx_mode(struct work_struct *work)
> +{
> +	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
> +	struct enetc_pf *pf = enetc_si_priv(si);
> +	struct net_device *ndev = si->ndev;
> +	struct enetc_hw *hw = &si->hw;
> +	bool uc_promisc = false;
> +	bool mc_promisc = false;
> +	int type = 0;
> +
> +	if (ndev->flags & IFF_PROMISC) {
> +		uc_promisc = true;
> +		mc_promisc = true;
> +	} else if (ndev->flags & IFF_ALLMULTI) {
> +		mc_promisc = true;
> +		type = ENETC_MAC_FILTER_TYPE_UC;
> +	} else {
> +		type = ENETC_MAC_FILTER_TYPE_ALL;
> +	}
> +
> +	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
> +	enetc4_pf_set_si_mac_promisc(hw, 0, MC, mc_promisc);

Why don't you call the function just once and provide both uc_promisc
and mc_promisc arguments? You would avoid a useless read of the
ENETC4_PSIPMMR register.

> +
> +	/* Clear Old MAC filter */
> +	enetc4_pf_flush_si_mac_exact_filter(pf, 0, ENETC_MAC_FILTER_TYPE_ALL);
> +	enetc4_pf_set_si_mac_hash_filter(hw, 0, UC, 0);
> +	enetc4_pf_set_si_mac_hash_filter(hw, 0, MC, 0);
> +
> +	/* Set new MAC filter */
> +	enetc4_pf_set_mac_filter(pf, type);
> +}
> +
> +static void enetc4_pf_set_rx_mode(struct net_device *ndev)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +	struct enetc_si *si = priv->si;
> +
> +	queue_work(si->workqueue, &si->rx_mode_task);
> +}
> +
>  static const struct net_device_ops enetc4_ndev_ops = {
>  	.ndo_open		= enetc_open,
>  	.ndo_stop		= enetc_close,
>  	.ndo_start_xmit		= enetc_xmit,
>  	.ndo_get_stats		= enetc_get_stats,
>  	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
> +	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
>  };
>  
>  static struct phylink_pcs *
> @@ -721,6 +1118,19 @@ static const struct enetc_si_ops enetc4_psi_ops = {
>  	.teardown_cbdr = enetc4_teardown_cbdr,
>  };
>  
> +static int enetc4_pf_wq_task_init(struct enetc_si *si)
> +{
> +	char wq_name[24];
> +
> +	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
> +	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
> +	si->workqueue = create_singlethread_workqueue(wq_name);
> +	if (!si->workqueue)
> +		return -ENOMEM;
> +
> +	return 0;
> +}

Naming scheme is inconsistent here: the function is called "pf" but
takes "si" as argument. Same for enetc4_pf_do_set_rx_mode() where the
rx_mode_task is part of the station interface structure.

> +
>  static int enetc4_pf_probe(struct pci_dev *pdev,
>  			   const struct pci_device_id *ent)
>  {
> @@ -756,9 +1166,13 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
>  		return err;
>  
>  	pf = enetc_si_priv(si);
> +	err = enetc4_pf_wq_task_init(si);
> +	if (err)
> +		goto err_wq_task_init;
> +
>  	err = enetc4_pf_init(pf);
>  	if (err)
> -		return err;
> +		goto err_pf_init;
>  
>  	enetc_get_si_caps(si);
>  
> @@ -770,6 +1184,10 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
>  
>  err_netdev_create:
>  	enetc4_pf_free(pf);
> +err_pf_init:
> +	destroy_workqueue(si->workqueue);
> +err_wq_task_init:
> +	enetc4_pf_struct_free(pf);
>  
>  	return err;
>  }
> @@ -781,6 +1199,8 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
>  
>  	enetc4_pf_netdev_destroy(si);
>  	enetc4_pf_free(pf);
> +	destroy_workqueue(si->workqueue);
> +	enetc4_pf_struct_free(pf);
>  }
>  
>  static const struct pci_device_id enetc4_pf_id_table[] = {
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> index 4098f01479bc..2e676212d230 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -712,6 +712,12 @@ static inline void enetc_load_primary_mac_addr(struct enetc_hw *hw,
>  	eth_hw_addr_set(ndev, addr);
>  }
>  
> +static inline void enetc_get_primary_mac_addr(struct enetc_hw *hw, u8 *addr)
> +{
> +	*(u32 *)addr = __raw_readl(hw->reg + ENETC_SIPMAR0);
> +	*(u16 *)(addr + 4) = __raw_readw(hw->reg + ENETC_SIPMAR1);
> +}
> +
>  #define ENETC_SI_INT_IDX	0
>  /* base index for Rx/Tx interrupts */
>  #define ENETC_BDR_INT_BASE_IDX	1
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> index 2b9d0f625f01..3b0cb0d8bf48 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> @@ -22,6 +22,13 @@ struct enetc_port_caps {
>  	int num_msix;
>  	int num_rx_bdr;
>  	int num_tx_bdr;
> +	int mac_filter_num;
> +};
> +
> +struct enetc_mac_list_entry {
> +	u8 mac[ETH_ALEN];
> +	u16 si_bitmap;
> +	struct hlist_node node;
>  };
>  
>  struct enetc_pf;
> @@ -57,6 +64,10 @@ struct enetc_pf {
>  
>  	struct enetc_port_caps caps;
>  	const struct enetc_pf_ops *ops;
> +
> +	struct hlist_head mac_list; /* MAC address filter table */

One thing I don't understand is why, given this implementation and
final effect, you even bother to keep the mac_list persistently in
struct enetc_pf. You have:

enetc4_pf_do_set_rx_mode()
-> enetc4_pf_flush_si_mac_exact_filter(ENETC_MAC_FILTER_TYPE_ALL)
   -> hlist_for_each_entry_safe(&pf->mac_list)
      -> enetc_mac_list_del_entry()

which practically deletes all &pf->mac_list elements every time.
So why even store them persistently in the first place? Why not just
create an on-stack INIT_HLIST_HEAD() list?

> +	struct mutex mac_list_lock; /* mac_list lock */

Unsatisfactory explanation. If you try to explain why it is needed, you
will find it's not needed. That's the intention behind checkpatch
emitting warnings when locks don't have comments. Not to force you to
write blabla, but to force you to verbalize, and thus to think whether
the proposed locking scheme makes sense.

The si->rx_mode_task is an ordered workqueue, which, as per
include/linux/workqueue.h, "executes at most one work item at any given
time in the queued order". In other words, enetc4_pf_do_set_rx_mode()
doesn't race with itself.

Combined with the previous comment on enetc4_pf_destroy_mac_list(), I
suggest that there is no need for this lock.

> +	int num_mfe;	/* number of mac address filter table entries */
>  };
>  
>  #define phylink_to_enetc_pf(config) \
> -- 
> 2.34.1
>

