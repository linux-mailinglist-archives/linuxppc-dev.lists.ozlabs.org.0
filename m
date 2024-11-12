Return-Path: <linuxppc-dev+bounces-3109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D29C53E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 11:35:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnjTw538Dz2y89;
	Tue, 12 Nov 2024 21:35:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731407700;
	cv=pass; b=W3vokb6HmeCTqbg2uutQQIKrgDG03Z31f1HR8dfpC3roNTI55E9Uij5WCXXxiJu81r39U+ZWWqSR+ItVP50oZ1CxI3XW9jpPl1puv0bO2H1ZgntPao3ubLFdAZu4MgpagWInUVJQSxx3Vj7ybR7sHIFTYClHzFu4PzEiEvfb6fe1HI3ggWlZFxvshK+h4i9NFnipUHVsXR09bXH9ZrOOhw7AbhWTXxQSihQFsdQOkab/oVaJMB9TMeokm5Q5NV1UiZTsDezeUyRFHfFCk/qChfKmTJg+T/u6Ar6126FyXB0jHdZCHlR+4r5/aglfXk5nwHlEoOEl29vHjIyIDfp84g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731407700; c=relaxed/relaxed;
	bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dMVcDBV5Q7ljOKInIwgINlCWlGTr3QPXGK8VTggswotl/pYHJQj919HF8iwPHbxoMxfPiIQbhIDvF9mUsOjPr85s8SJKES1To8LRTLqysFiQMXvjQqQE8ekiKpPIvCTsL82eXATd8tALMVIG5Oc9/UcHBAym1kXg1QFJ8dRzwg95hVQxL/vsUIFbQuLYTkWQG2vlstWkEWFJqhX/fFMDKzzV0WIQjGW0DWn3zA2iavm+3VMiWdBKQvv6x8ZirrBYgfS8elQfv8Nr2qNt3tS213SZ+Hz7xXh045R9PAebqAVQkgj1Y8mtYROx8/4NrYiBBvFzo5RGT//Ag90M+cYZKQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XDaT+nxJ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XDaT+nxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnjTv6QvCz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 21:34:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWUo8hmvdHEb9gOFzVbzO0jRtvViyeZuOVs1S1igY0n6by7draD2F6s6bzdFVNmD3QujavzdBHFpbrRUAABl7w/7QdAJq3mvmMC1bIbsTVem4mrxWYhaH6MYR1ZMv5Dcfoju+Y1S8aJjhvzJmO4Ta6e9m8oAP0A+tV7dWoAzf8mXE39krN76cZXZb3hrC+wwQexBZQ2jF+YqVPl31N/zU19f+e/qzBGyIAArbZw+grFdHM1Kf1he288ysEr2YpIloZ78uEzpH9S4SheKSiJkHeqNWmft0ig3C65WTYJGzEczf8GjRDdc5ZACk9KjFLNtw8Zxygu8HDhPpq468MW2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=Qivnr8mMLIpVv5LetzMYuvQVh5U6Xgy3Nljv/bHdj24QTBN5UV0tM/E8xGqs8BZTmV46K4zQYJ9OV2m3HC2fwZnqzik3KSwh4lofFKEv6b64ZjCRMWOqbk8EfP4+7Jx0OZ8iDbc7R5P5spCi5Aaea2EiGW2hc9xCdCiFU593omffb91AmDz1X2+2Gc6Y8wf1o2Scx9Y4Iu9IG/90BnsJY6DpJ5tC6udT/YjknyigBMkSfxwXZwnuX6xqNR19DRBTKpaFgPvnNHIMWxP3qL05tdmn4xaCprQHujARoX9Gy7THN39pxe+f/AeM+lVfVvKV40WdkqF5t5yBoMcQ76q0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=XDaT+nxJmNiTsQslEYKegoBVf74SkSyto13UsX30+YD8IYZD9TcUHr0R2Ni/RWSHD1poZjEtEdcTv1kjsx8emtb1coqT/hDJ+O8O3xKGJnzh054Ny/9ifjgEYQqpt6T6xga2+KTeDYsE5zTFhzEjxbXEcE4TxczSRRnnfy2aZFmEtV+ZMnBF5G+Q2NrueKHr9GlOdYjcW3R0oTwGCLqZukjmgP+pylNcFMa+wq3SPzRdISVvCRogDYG7lcTSjV/Y4H07Z4QtLSGqOAlTHRcRXVHVxuIWKThGU6ojwWKEwcmKlTedIXInbAyaWxOfzfsk142n5zmjajsTkwjFLF9RHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10757.eurprd04.prod.outlook.com (2603:10a6:800:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:38 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v5 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Tue, 12 Nov 2024 18:34:00 +0800
Message-Id: <20241112103404.3565675-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
References: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10757:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb7ec34-bc3d-4721-1e93-08dd03059be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kJr5NsQ9of02bOg0lDVh0O8zfhbIHnamEa30YJoqKCBjILo4CRcOGwePs5Bu?=
 =?us-ascii?Q?cl+rWBcntDuzeGd71ZoT0PIo5rwjHlXyg/Ez/hn227kZXlZFvfc/8X5D12S/?=
 =?us-ascii?Q?paiH2JTsxzQ7aFECKVWlDZY/ZqqfvBzNNCCLfJMgtOsopyxvAqHb7Kn9mRM6?=
 =?us-ascii?Q?r5KLDeFsr7t4rFtVMWbLnTQLxWj1rj/nf/oP0s3Xphyf8R6CNXd7bq85+/ZI?=
 =?us-ascii?Q?cHlhaTDgZlnksyZQuQ/rZ+fK6xnYXNC09Ax+NyZtbQjjDr4trHP4OfsrtxrN?=
 =?us-ascii?Q?K/xAifDZoTD0BhtxaXFHpOsJtzMHpi+wmAXxWCX4afcstTEgdHDE3Vs4+pW2?=
 =?us-ascii?Q?vnJG4pQGa48uumb/kzXjrRqzkET+neJ0yR3pHlbTPm2gvC9H0E33iLOA65M9?=
 =?us-ascii?Q?6InlYa/sFlTpfk7RxmudacdXMMMTjaCxv9U0YkiZ+SkgMHrhT+yKlbsMOKn4?=
 =?us-ascii?Q?FMnvLw/ghSiS6T0+eSTB4pRuQezSlhXlzXcA9A0IWjns3u3HkMJfr6mNQoeY?=
 =?us-ascii?Q?9QgzU2B6eYOxwYaFFpw95zb0thBlBam2iN4h0lRdq/KMqrY6jqQ9tF/N+fdX?=
 =?us-ascii?Q?ENlOPnbjQ7sM23gTaXxUafoh1Uz+UUja69dpxRFyXG4Ss1sKd3Asst7Orzw9?=
 =?us-ascii?Q?ZKvbD6FsvczzECx0tt6IvJmvJ1ryNVrtXaJMC3fv1DOcAxIZ51mKtWB7C84d?=
 =?us-ascii?Q?lA8KVD1oatOcCJSqOYLCmbEVZ4qxJ6R9Yy7EhF1NDNF1lb9h5KXyIkk5FVzD?=
 =?us-ascii?Q?xaD4fdh1gi77pyCsCy3ISHQ57ylvFrdEaD7JYxiXz11uFUAjqPPDXFKB5VLa?=
 =?us-ascii?Q?PNYDdFnSK3Ledu/X/+r48FWn7Rv0Go6HgoxKSNbayg47wOhcc1ayrBPy33gX?=
 =?us-ascii?Q?FPDfTH3qWkPcJ24WbdyW0XXXct1Q7SxmcwHSmxIO2uNZZFC4oxfseNxDTwQQ?=
 =?us-ascii?Q?17YgzmQYghY+PontnHdQp37bZ/bTqFDr4Z28rFnKUDR7PmQjqYpcTz2J5KVc?=
 =?us-ascii?Q?sDi176hE17ziCl5BtmdS4K+MS7RobjCPYzuD6osVthv7QjoJC2g55qtl/9R/?=
 =?us-ascii?Q?Yvduu7haf54j19mxYBwdvhYyis9VMmIYoDkTROySZYeFdCeeT85mRJJeCLWD?=
 =?us-ascii?Q?s1kH6spfW0IG8PqcJU35O8OIqlUqMY04++PGo7y1Rt3mTIe69oOfcsVzIlUk?=
 =?us-ascii?Q?SkGajIrGyP1PaZN2vDhdSQJ3q18oQGHM2EfQwR2QMJvQg37IHNE1C0V18dBW?=
 =?us-ascii?Q?LK38k92UiBff7FgPzLdK2IyHEpfb37jbrJbqeA6dxsbMHVYLqKDAzEHngfH+?=
 =?us-ascii?Q?j0N7Bb53gdrLJFeBtl0JURMcXJeKk0ko4Xh5HHNGC1y5EjDhudTSrynjc+zb?=
 =?us-ascii?Q?KOw0pl8pBr+5ZS9J1KFBKN2U0vXM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y5mkaZqupvMwUeCQjHSKg4MAWwp5OffXDkvpH2MbNCePoWw916cLKcv7o3op?=
 =?us-ascii?Q?rgVBqZTeIh9NL7Kb699iyyVvt9NDVElAqFdV/CbWVKWwOiNcEGKkABRQYABD?=
 =?us-ascii?Q?eWqmqbM7e6VQ3XcxeiV3EKsjcQ/CxFIzCZ3JR7r71iZX3EOS5nTD7t5PBJbx?=
 =?us-ascii?Q?1iUa1GdpD9m5KDkI0tye00S+e9bjDtTTs+anjGN2hqZwQPilsaczer+Q+4ea?=
 =?us-ascii?Q?u/kJ3h/V/VTApcRptxA4jkYdONHjhiPETl6F+GL2cHn5oDSIBfKO+V2D6+XQ?=
 =?us-ascii?Q?GpkKVJcL8i9vQ9aFoFWmzmHwZXM+IN/Wn3LDb4Sj2x9+2x0K6PDgj8sqjIyW?=
 =?us-ascii?Q?v/CCBzzCJZf3VCRGZ+Y/2yYQG9e1m8Fv+uAoCYsMGj0Y6qm3XTe+k1Tp5h9x?=
 =?us-ascii?Q?nf7oEaH5JktkBzUESfGKCFdeRy40+tfyldGB+Jxwi4vsZ0DnrTiIbC9vWy33?=
 =?us-ascii?Q?rjSJ62e+B2UjcEyPL0/KpsED79dmVUn48X1UbswJ2m9bXmt/1DBOVsDzoi9t?=
 =?us-ascii?Q?hMIf7aXzE/x9N+5cS9J7cpOlom6/PT5+xhrxHRKpn9Q1D3hGth41PeJLUA2r?=
 =?us-ascii?Q?/EgsZaX0wlIaYCiSszZFkRuktIylzHc87q8P6wAV5IMWS6P/mkCQQvqLLwaO?=
 =?us-ascii?Q?iXzHZR30WLCD3V6e4iiWZeqR5qijFJHRn9J5sfjL8gfvurgHfoRJ6Evhz5TN?=
 =?us-ascii?Q?tfT9wCW3+bySiapsL4s+6RwfRExSec2AHbMJ6Qmj0L+p4jpMlF+oOzOO5nts?=
 =?us-ascii?Q?DVCQ4z9LMpgJmmmVuOC+jjLe4t5Vh/oqUQRjkRM0zOH+IDX9teOuCPxdUxRY?=
 =?us-ascii?Q?zVMSh6ANI1mlVxdllonjalzNA9QvYNTDORqWZfPTjvrDQhd/VUPom7RsLig1?=
 =?us-ascii?Q?znU2Q3fQWSMP8tsbmyHbBbjSFpql/3Av4QxJxkJBpSlKFRi4C2t4P2W1VHp8?=
 =?us-ascii?Q?KtVWrXvjoYLvndBUBdQ/1xduS0+mr4cfDZekCSacs8Y56jskf+LkWSfcI9fF?=
 =?us-ascii?Q?gNtFh5yr2+W0kNPv6WvBM74LV8XC9tZDqwyKxDi3asw/2vuuX6oe2ttkdhCx?=
 =?us-ascii?Q?sjCwFKThNXZVF0AMJWA39g3ThCIrf4SPexfN8bhZewozNu/1cZR5Y4vYejm6?=
 =?us-ascii?Q?4RmkzH6zcDRd0mVunQw1chldhASG/n7qsG6wBkXJgdZM5xinvvpSRBizAtF1?=
 =?us-ascii?Q?v1AZ7EqlqbENvT5i5XNE4yryoRa6+DpVjrPMEZ4mRb46z5fUTYdo9q/6IZPT?=
 =?us-ascii?Q?IivHp//HWCEUgRXAaQNq/ox7EvIFnzTWKqnpwWswwkHWYgfsUtkGqrCyivP5?=
 =?us-ascii?Q?aJWi99GlxKORVCBYYAgR1h50IuCWMB9M0yw9nI3yngc3KSqFumobcwEnBC+O?=
 =?us-ascii?Q?5MKbc3ZCXb89hbUXwzT11l2Lbxaw/suBkCggWWkO6sbTJoI97o0UWYQokzai?=
 =?us-ascii?Q?YQ5t0PbiUSSZGAfrVXGNMT1rOkVyN9SBVbRVc6R5JVEnm71GbMrdfm7ivFf0?=
 =?us-ascii?Q?IMD1GVYbEmPgl9FU5YAzV/r61lHE4eWL0vQdiS3Lus43txH8N2sNZZsky5aM?=
 =?us-ascii?Q?b9uPJMfYVNThRHKG+hxrIkAHu9QxEqi9rwUYOTC3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb7ec34-bc3d-4721-1e93-08dd03059be6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:38.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4etb7VVCaVD5EbDZmnCt8wToKpfcNHtYb4WqZh/Yu+ahCsOnwdr8+WOhv4HTN6nqkfybf9SqVlg12sp7A2jEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10757
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c        | 142 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  61 ++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bd5c46d763c0..471753276209 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,139 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+
+	cap->rate_in = supported_asrc_rate;
+	cap->rate_in_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->rate_out = supported_asrc_rate;
+	cap->rate_out_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1280,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..3bdd6ea07c09 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,26 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	const unsigned int *rate_in;
+	int rate_in_count;
+	const unsigned int *rate_out;
+	int rate_out_count;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +54,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +76,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +108,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +144,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1


