Return-Path: <linuxppc-dev+bounces-2127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21999AE05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 23:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQKQh34z4z2yNv;
	Sat, 12 Oct 2024 08:25:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728657913;
	cv=pass; b=bGSkJKavBuq+36IowMZtWyCNot/kjsxeKoEE8iDhERW64tHYju9FU4w+3j+ZZrxpXsque/t9diH4xsK6VpaOrWEzEkHs93U381jiUcCkSZGuOhmL1h1jcuGexbcm4OVZzoBD67Zu7R8P0PefoBOw7Cknk1j9ZmmEEbpa7awouBWEWBfll4gGCMORYhYk8iNV2BzfLjpvk9ww2XUmCcZantS5xuZL30xcvfKwFeg3VW8eN1++eArBqJXqypvlLlkwV8QsIWF/PNBvJ73TQoasiSCOYTcjmfqOxJZjPhqNcTUchXa0rj2TNamSkuwm326hgkxNb0znB8YumMBZYC3ccQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728657913; c=relaxed/relaxed;
	bh=D7rrx1M86SqTs0UmO7+DZaC30BaIHUOL9f091coEBGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wh34/8ualdigm7EAeHxzwUOQc3I1GXt9C2m4t8UxF5vyWzqWmlK+aCB7GIVfSxyRuRQujJyouF0f3bheoy0N1SLM6nHt2ydRR/MRBgiQYMqBbjDU4Y6CdAaqtn1o1bFYUlD++EoIbOMdsDOf88IHse0NZXfR5omroKy89TXUnNYvfSN70yoEPjnERXmYtIRMBKa5lQAxfgxsFehQHb+MYIEaW0u6AtSzHy26PrDG8wNhtK1vHVOk3DerGqB1FzJ8okSriM46N1EnYBSOmwC9b6VKNxWRu6qNC3pEieOIY5mwuluMHBUpNtGvDQtXtV8sBSwGapXSFw7hhzqCXkrilg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QmRArqaT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::610; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QmRArqaT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::610; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8YM3sWcz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 01:45:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKITRgRGg0zVyKX7pmn4VrdbOQ2URhDflgtCiMDNCwBddzGcOpxgDnirHCJiTGVxow9OpeFQkJnJc+aBYQ/ckVBad+zh/eFKFhedyHXrKWnWfuM4y3Kp5/aoxlgA5eXdr/ScHib3HDt6wiHhzXoVDcRXGwLCMmfuInx61yvlXjVSGi55f4mNnk3lF+47lvOUoD9jHDS1kRTU1vYUf685bdlanrSoa2So5j9pvffCj7smpmxWimjDWiFAucP55j+TRIjOqioNKblLcWRR5dtMgRNZ4yR7GEEasQy+NxJA7YYCZ/FfDi/1OAJLhBZr3+C2ebSZqg6iUGvvDQuz/8SlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7rrx1M86SqTs0UmO7+DZaC30BaIHUOL9f091coEBGQ=;
 b=PdsVfvKzI9BiBOWqxx7NOkWp1Dwe9sATBc6rRBKt0zREmJBrde0Cgj/YvDhwsnD+m1ksghLegIk5J8XPJd/1DDgjWpY6VXk74pQg/VL3hyfc5ZmdAxel8XWYsXtsB208I4JVsbFf+R1xOSrP/65rWFQij9ZMG0InO1dJdCs4z/EOi8CaJeYADa8d62m2MkOVXSPIW81Vbab2SBMDWI1G9lNRJnNOJZ3RLmrCsOOYliP+Y1PXvMUI+AMLRcNYWgGhmI6C2hRiGqqErQ0rWOFJeC42Q+2bJLPFEHpUfkM+lASYFMafBwkvCbc0M17fJt7+mlXEmW5qleOzZzvcrx0T9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7rrx1M86SqTs0UmO7+DZaC30BaIHUOL9f091coEBGQ=;
 b=QmRArqaTVMk4StHCC6mbaeVuITIeacc11xnEnm3OS9mLcFNpBJeOBgv+B8ah6kc5StXM4PsmfQWIQEnA7BB3RKXpE9M8c6S3cLNFljGnLYtLNzdtSqmVi8+oUBd+oaDSVGi2GnsY+dba1yUKI1AY46hvWodnO4pZ4Z3RcrPGaMUN7QHJMojUXnu1s0+gYsAdTCzBKHXJNoAx0UI8toJZ5Sy1DT2TFjfB/3/psaJs7i7LLkMghTRaVdxddjR4zJSt4oRY2wTIr5et8/MGVegWfRsgyq0re4V+C1uFljdUhW1UOFTBYn8jGaGXKLaJpJEt6WHVf9H55sMzd3DVFWdsVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7952.eurprd04.prod.outlook.com (2603:10a6:102:b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 14:44:49 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 14:44:49 +0000
Date: Fri, 11 Oct 2024 17:44:45 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, claudiu.manoil@nxp.com,
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH net] net: enetc: add missing static descriptor and inline
 keyword
Message-ID: <20241011144445.jau6yqrj6pzrvsi2@skbuf>
References: <20241011030103.392362-1-wei.fang@nxp.com>
 <20241011030103.392362-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011030103.392362-1-wei.fang@nxp.com>
 <20241011030103.392362-1-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR07CA0250.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::17) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 279e319e-0050-44d1-145f-08dcea03415b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QYbAGco3eqzqCN2cpGyKsNKRcEtErmqmKZSdOe7wbrJUNlccKyb1/8w/fi/V?=
 =?us-ascii?Q?nkjO5DcetwBoZXL5DPFr83lSnZsE2uD7nHu/NN3G2ccWNzYNJeme5BROabZb?=
 =?us-ascii?Q?K27U33ej4d3IwZKitdPB/FXiwgpfybJUQfwa05QAjDTGNQ5QrNQAl54Ru7sy?=
 =?us-ascii?Q?Y9ad+E27ady5Ih5rxd4FsQtTw2yegy8v4wqqC11E45D25TxB0GJuhLphjm8e?=
 =?us-ascii?Q?567bIlzrq/rJLYPvjj88LZ8i3oHKSYq1tUWeOQSyQ1qFzBZGtQuBFFfaiJxr?=
 =?us-ascii?Q?bjb4SYvxEAfjv3LrqgF7pVSjhETuFtgFsV5im+vcVwhWQHmOWsC8haMZU3G9?=
 =?us-ascii?Q?zF+b/wuIHW0wAUXKUN8ZBVMzHYTYU+phi4pzcPn67e8KnSrlMZhs1/1phhGl?=
 =?us-ascii?Q?tfnG9toSevx3i6uKCtDYKJIIfkrWAX+Zhwrt647IXlECu40/OIsoCOlYeSiB?=
 =?us-ascii?Q?VL9pLe2XeGAVRTJ+vBrI+szrw1Vlz+GHvazMrstWU38+0D6Z8mbpvmrv4aOR?=
 =?us-ascii?Q?cG4c7NHZyuPcbeX6o1ebjaekcfAXYqmTk2fk3BGGU8XqETZDDJH0aXB5Mz39?=
 =?us-ascii?Q?oxxwj6WXiC8wItX6fE12hrWeBLZVcb6/9N61vpLu3J1bGJ4kB81/FwfKcN/f?=
 =?us-ascii?Q?odVuc3cRdPud365Zm3/Toi057Ciig+E0MlebYNY5nuuklrmwjs5SPfhhDpsf?=
 =?us-ascii?Q?b8ztV2ZOW0mpEWRVFI7Xfmwy4SIZ/3rm9RVoak0U7EcMyIG7o3lX9sMMnxQh?=
 =?us-ascii?Q?lJzzajMMUXlP1+d/Qb9TmTXQOC+QG7vN7t5L76tg95X/d3UePRyKBR82axhl?=
 =?us-ascii?Q?+4O6t7q3aOEGL4YwVN2ZdC+ZmGoThLZgYsc1jFg3Ph0lNytYPSundAN6d7fo?=
 =?us-ascii?Q?ssRAEcdonhc5GPULOyPEKhMmIFe4S9FPl2xSSk3LUHaCbjQHRNZKiiJ5W3Nv?=
 =?us-ascii?Q?gXXBJfVZ4wbB+D0QJrI9Mp7vCZ8hPalZYN6wx/RwzQPDK2z8IsHrRvj2KSJE?=
 =?us-ascii?Q?tp/8PAYUHkg/9P8RCAv9G6yPCp6P/r4jEHXKWTWABxV6ciWMQlY9zoAoynua?=
 =?us-ascii?Q?+TfIXsuPjc6fMXziUfUcmx1DT1ss47mGcX6JbJ5m6Oixnli5TD2mRMxF2sgL?=
 =?us-ascii?Q?cgFWEEfDemC0QwRA092aEOWjsnM3sX1fXK9LLYhO8ynZXTAYKp4xJz8fyl+x?=
 =?us-ascii?Q?s3aM2H2AwcikCsB9hk1SD7iyNcsnTmNEtYCgkHDqEaVYjvfrcc/8ArO1wxKq?=
 =?us-ascii?Q?wxU8v9az74eubfsMJdBlCniYKoJRYOfx2t3j98Fytw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uMYKwqNEt2ubSKPX5KgYHLGb761aaY47nhoeofMA80g7JNOZQeAQ2cfnUf7A?=
 =?us-ascii?Q?6hWajhZbDNz+uFciZDDpeQmPpa/JFwKsy2iLMKt8IZYspUZgTFq7KgVv1MkJ?=
 =?us-ascii?Q?XWl57ITkYdKyzUrDg3Ry7UtM/HtjcrpY/I0woPGTKxL4CMhNwChM9KFsdMnm?=
 =?us-ascii?Q?dh7KwFC4n4YPIEfALCQNaKj6pVw5VBhvh1H/DrKWCyWaQRkxYKxQRk6Ra9a2?=
 =?us-ascii?Q?MSF/LKphKyplD7OtS1nBYEHizCymv9RA0re7rn5WRAdOrCX4nKtITj6KWMlk?=
 =?us-ascii?Q?LqW9WdD8cYlhc0U3XB8yphIwcvm8dsnwz2nOmCfgDoVu6fXG4ETbP5aQBbzK?=
 =?us-ascii?Q?0+y575nnRqf53wjOcSfI8WYU1LltQX76sxz94+3sOpD2PO4hvT6R1DvOtsKA?=
 =?us-ascii?Q?qbbG6N4Ij/Be5ohiyjV/6e9e2f5qFDGbRiXSLladvIlMPF8+xRbOKl5Cfd9F?=
 =?us-ascii?Q?XSgYo2K529EDKzMBcVWIBo0pX3xi/1tsMXyuXScDSB4od7Roq9gWgMO0ScYq?=
 =?us-ascii?Q?ERvBh9uwfImKeOOYbpLJ98gxmMqovWjvQFSopfPC98rJBpUXG/dbbBPzqHrY?=
 =?us-ascii?Q?HGO09/Wrh/1Brzu7DoRgqKgsSPqn0NoFA+ApxNGSY+iP52enfsN9C62Qe3Dz?=
 =?us-ascii?Q?TbMawriGbkN9rgNrIeJFujU3v7g+ercti6C3uG4Ao5/gPZyDsDIQmpK0l/yJ?=
 =?us-ascii?Q?A88UN3E3+xqP63SJrQCv2MPHPQYwxSjOTaJCVJFwlX3HcCQqn2ustKYTBsYI?=
 =?us-ascii?Q?nobGoTYcgeva1fXzSpxjbV4sEph/IZyAxMMS44wtlkAqrOYFFEr1jTKNvr82?=
 =?us-ascii?Q?8n2HPE9r4NV0qBrAFCvlMcrKjygsIf5e7Qx7Qp7xYOxb5zXLF45cbXXI/mBK?=
 =?us-ascii?Q?srUItBuVTiLwRl3hh7T4cJ8OkGf0OqjWpXsvYbD8FxhGPT/j5yuQQMvKcPvI?=
 =?us-ascii?Q?fwg2KDJr4hchXT1qNszDyxpBsIRno/LNq/GVceBSb5bfJhOCxrWXntkQN6Di?=
 =?us-ascii?Q?3a29HYczCWlENDz98Y3vDYhfoSSSzVW/Jn2Mg5xBoyMKAirjhgYomUSisk6i?=
 =?us-ascii?Q?jnbmUPchCoQDxZFP16yqLmZAdN12+wggZf8Goh80uEHzABvFM5RxaVQ2xgzM?=
 =?us-ascii?Q?zLQc7a5ubRmiI+i1KMH1oWYFiLwBhX2JPsFJJdM6sf/zpTymKSj3QRtP6z2j?=
 =?us-ascii?Q?T2EY+OUwIIZhVDyrBsNL6vRkvsgaed5k2wBSFs9opf4VDeKNm0h5MBP71GQ3?=
 =?us-ascii?Q?CKy3F/BasvNUKRpT2R3Ohzt7FBBSB8/4wi/xgBWLux5mjMt/NObyJUsqyl0n?=
 =?us-ascii?Q?5iqN5EzmMnx3+yrY6ZHjmZ/KsepcdnxfNpIuVwP8HhdCEGmbnyw9epB4jl9G?=
 =?us-ascii?Q?wQ1uQdrNoWaa/kFvsF/65gYDR+D9eeOTVoHN09pRZhNJTy5xkE7wWbK384tE?=
 =?us-ascii?Q?xIBxM5wUvqzkm+uk/0k704n/gwpPOUp2htAyO8QCLnt68Lh/Exa20sO12xdI?=
 =?us-ascii?Q?/0a7wkqA+TzEGVOhRRg+CFlfgq8usQal8J7UfxkTQI6Qc6wqNE6c5a4I009D?=
 =?us-ascii?Q?8ilSbCZh67MPVtDM7BDoE7+dsHQcgkQ2dBHwk9hzVanoIZbdL+HQ6O59eSIw?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e319e-0050-44d1-145f-08dcea03415b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 14:44:49.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwwbrLJtFXEQvjoPeyPRXQ2545RR7O5JleSZgVlp0G2+T1v3dxJi63w37AdbzBxcI9CZ5YgAT8zZx3ya0X5imA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7952
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 11:01:03AM +0800, Wei Fang wrote:
> Fix the build warnings when CONFIG_FSL_ENETC_MDIO is not enabled.
> The detailed warnings are shown as follows.
> 
> include/linux/fsl/enetc_mdio.h:62:18: warning: no previous prototype for function 'enetc_hw_alloc' [-Wmissing-prototypes]
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
>          |                  ^
> include/linux/fsl/enetc_mdio.h:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
>          | ^
>          | static
> 8 warnings generated.
> 
> Fixes: 6517798dd343 ("enetc: Make MDIO accessors more generic and export to include/linux/fsl")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410102136.jQHZOcS4-lkp@intel.com/
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

