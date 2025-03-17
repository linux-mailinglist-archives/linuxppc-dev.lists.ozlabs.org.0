Return-Path: <linuxppc-dev+bounces-7153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C305A657F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 17:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGgMz6CLmz2yqv;
	Tue, 18 Mar 2025 03:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742228799;
	cv=pass; b=HhaPkG6GLW3BO1I4EPpGQjUWPYSGvrYo6AOv+1om07sD2GXpcwixyqTtCmP+rw1HFBTXe0V7lXpAntA5+NOKBMwu48u2XIMm6+X/h77DAZ0zNRoCdHrSN/FNBq3UKaGEtbwqLt3JGeh4K+q4hDvVwzJX+BkzvN/VExu/KxCaZ1LVHY5A+rxssluhfNOJDnjoJn0B+uCV38qmT8MpomUIEVzbVSGbLk/L6SpIuQzGWM+wJYEZqEKyjKdExFl0ptYvjbEftYXuArVickSFHrcgwjFw84VCfSbJOuf/q1Pnk9lLsv5bGR+LvVd9wgpTx8OIXvxwWDL4RMG+3w0ZDBlrIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742228799; c=relaxed/relaxed;
	bh=bVwWTVtxWQYWl5CvdZU7f8nezVxewC4+mc713iB6aYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SbBL5s2rMnDqgUrm/km22XgyS5eszmWZwZMKIJCB5XNs2rg2dwoDCj2fOOdA8Ls3WwcLEM7boFN9nizgbqbIzasehNjwhwOZhkmjaRRWTlFbzBFIsCy4BmAefLilrfib4rvUP+roow79D/WP3brKZOzA6mMz1pMy4WSS1EFup++P/Y6J60QKB/4OWj+IrpPJssKAwjGQllIxvRUhkMjw8DZl5LmkZW6CWEERuov8GoYbCxDHVMB5zgMmvjugJOYFzzADiJdLuCMVfE51LnJRnQcTInl/M0KtJrY6sl8wb5AQ8Glg3yacWacDlDoKB2pVWlT6OFVWCUwPPFGYxLsNRQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dYhTUseQ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dYhTUseQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGgMz0pgtz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 03:26:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCioz6ovJhBC6NjkF3jozDE9Hp3gIQ8SeTUT2K1WJzxzLHLWbggE/PZowciJbaw9RIBwN9HhiMS69pockqYSLjHPXKDNSrdldGHrfzVlU0mV75LLRIEEJKw74TIXFkVG7oAellrFWf9omWAY1D1GvowxjcseoEo0CWA3jFzCMtGIcAMlbJ/Dwpy8qKLDK+KWXsW3m1x8XGKDYkyY9ec0GDXnSfKpLTa9W6wsIaJq/sMd0jn2dpv8iiq6VfF3C1q5i0WTj77y926QS5W7D0tyQEqKIvebT9hBLSym3VrFBjMT4uUWyhgz45T46ljVfRK2tK6a8iHlZnSHHQ6bXAWg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVwWTVtxWQYWl5CvdZU7f8nezVxewC4+mc713iB6aYM=;
 b=P6RFKjGPI4xZCWYnTyQQo7BFikhh9RRVRxUhhqhjcW0ZN43gXrSL9Q4e37zoeNGA9a08Wlg6g8+leUHveQjjDvV5bNQIIuD4qA84TIb92mbBFfpQaMHMlkmTWpAQppW8tRevmkK+4V1GZR210zpdold3ErrLfqdvg39OwuNGMo5ZSyn0J4d/yOtLX3Our4PsKV4iasR4jjfao8iXjriGb32DGfsrWdHK6HSOdcO+qy5pLdezbqRhDDLwGLVQr+P6E2SUVFMb9Uwuajxo1tgzgZlOtxaN0pk3jH2xHUg2DkzWBv5es+ohJPDZ2wtCxwFVLt12xwRjrw12jsb3QQ35Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVwWTVtxWQYWl5CvdZU7f8nezVxewC4+mc713iB6aYM=;
 b=dYhTUseQu7TRcvmNJKNE2ZwpruRbC7lOYFychTAY5ZO9Fh9d8VkvDIYHVaUwoOdMny8agpi5Q9f6mCWwk1CZppjceItmVRSg8TFBbeTHcQC7x0Um3RVXwADaYEeJMfHpSodVgRowjTDgcZwrEeg4rqwYbr9rUAMosWR5fsS67rFo2Kj/T6qse0VmUwHoLY0IVmy1A593nGfRZJzksuXAf7ceDi7gtN9mnsDLZtCfd86hslfspiMHcfyHPvjm2JTkZBVxu0Hd3bxX1LVu7VkbMThZ2VJW2vT47Cj9E3zc3YO5RRe9JdDSaCVEUMIKkI995D1wun5AndHjAI13/PO/EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:26:20 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:26:20 +0000
Date: Mon, 17 Mar 2025 18:26:17 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 07/14] net: enetc: make enetc_set_rss_key()
 reusable
Message-ID: <20250317162617.glikwbcey3s3isfn@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-8-wei.fang@nxp.com>
 <20250311053830.1516523-8-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-8-wei.fang@nxp.com>
 <20250311053830.1516523-8-wei.fang@nxp.com>
X-ClientProxiedBy: VI1P195CA0088.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::41) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM7PR04MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fca27b-c4ed-4242-5446-08dd6570736d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?teftZZi+uhLjPklZXGcW+FhJPhIKXhjmn4kcqZgEyD53b4EW7gpE3PPqdl4M?=
 =?us-ascii?Q?fSOE2gld6OTTtyIrEL0opEIylak3YaOo12HWv+1Ko5373zUgmGrWkO5MjTMU?=
 =?us-ascii?Q?ZUgnk+w6yjAq2yuvKJUVwBrdwsIWiQNRPoo0Xob1bWZBqep2St9NAHRTZy4W?=
 =?us-ascii?Q?Gw3xb9lgAirt+gAnSpxZzzW1xlWUGOpPy7tdChKrvCmylIScG/4VEpcybjRc?=
 =?us-ascii?Q?s3jTyNcdqwZNGbqYjV092upnGpRR8JTO3wBbWlqzYm6PhiqQwn1G4pvi9geK?=
 =?us-ascii?Q?okhlURJZOB6H/3qHZJbzmnjV96sZTGHFfE/pyXEg4BHhGUUHjVEtXgww4ziM?=
 =?us-ascii?Q?Yn5Q60faD5gER7DyV8MMOs+VbKmR12HjS86RYaDnnmlTB5NU91+gqWcCw+CV?=
 =?us-ascii?Q?K7J8UbFbjfipinE8r4ibXEE4ob9VFmlSfsx6ayajeUfwWj5gDfz0Fkv1ATRF?=
 =?us-ascii?Q?Hwh3P9FXe/QPKjcIlJ6xYhkVrc9vgRrx4wOwSJe03zD5yrpJbNf2m9EV8snN?=
 =?us-ascii?Q?p6Wq3JuMvf+Xr9R/BC93reuyUy/byKGVGZH7TfYJ5lEEaI06WLBrkGL5VrHu?=
 =?us-ascii?Q?9rPIEOZr1OUj0IeoUcIlLcg3NRQBEbhecjBydOC+HzWusiaQpFohzzg9r1Nx?=
 =?us-ascii?Q?o5AtfJXGtu99d6biADm+LkAVfo16uXz4+xPuw2+NK1/B76wRw9sX5wokeTZx?=
 =?us-ascii?Q?ulxv9o1z9dfemlCxqS6FRESCODwVGZwrg1bsvhRFwfe5d0+irUmi6APeKYRt?=
 =?us-ascii?Q?BuQTVxKIDB1xdDpZvJ1LJPByfZIFKnEwsZosqR01Mra8c4FwblC2scz1var/?=
 =?us-ascii?Q?r+l/gPwQcGMjl9deY7irmBAZ4bRmSzCX4FXA1esWEIwotGztZBQ6U/eV2A5z?=
 =?us-ascii?Q?5/6F9HS3SiMseW6gMTlFGOPIFPtojv2RxKxm+TZhGv3qoEWCrTLANjbHBjlG?=
 =?us-ascii?Q?M+xNPSUzzxU93XpUtyCCvkYrYtjaUKgFZhPt2U+hHqwxO9HgQyxawFIkaGhX?=
 =?us-ascii?Q?bphheB0C9eagaJfkLRdOOLqgiGtsxesXFqJiHsZ8FDsxhPwTj9mbYLTmSfjx?=
 =?us-ascii?Q?Vy9HK/fKAWJXMu46vsjgYXIoKDo67OjVA3iC3zwERWeE8ywc7kgeF9OBQNYz?=
 =?us-ascii?Q?RbwXC6/ljf3P35239CX2n9r+s0WU4QcHU+3GE6QPZrPsGOSTGOv0iGDnScVw?=
 =?us-ascii?Q?XPiyaOQY5golBU/iiABIooFAkrNkv45emx4okGYKKTWaaAOlI/s3xNl1W3XY?=
 =?us-ascii?Q?oFDjoCkpApyGOZ0NzTs3L32PKsD0b++XndGS4HrpzzscfuviBUGAGc8xX9Hw?=
 =?us-ascii?Q?92I7HkIxD1ZbAhQF8JN7WimsCtmSrHb6QeyYEfoi1cyqrhdNzG89rEcfVdfs?=
 =?us-ascii?Q?zpvwy5jI7u2EYf7+erg0JKcBeL5q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3L96gt3+iwDi1giGsBCHp/mclITHkodsiMqR8SXG04Ok2VOZ1e2mM3CCpQ1?=
 =?us-ascii?Q?NcgSu9kzOh8peqbuK0lIVlcauUZ1/YOEUg6qP4U6KmVK3EDZstQcu46797x+?=
 =?us-ascii?Q?HFS7o6G9G8FIndIL3yk333uEsvmCa2KgvHBo69E6EI1OWIBm1ysBCn1lHnmE?=
 =?us-ascii?Q?29K9HX+DDyNDHG+d6PcRv/OeLgc3BdwNmY3X/evb1nTA6SqgHUTFiaCDkcVt?=
 =?us-ascii?Q?n4ck0+nWyANa8pP6WHtPiYyTpMp92JwzFDmhpOk945AqqbL1+D142eS8Ea2J?=
 =?us-ascii?Q?ocY5BWoQcF12JOR9yztOtcgvVrYN1+8JxJygI9+1GI4SSJTij7YcE943inlW?=
 =?us-ascii?Q?pUDc482YDUmdhxA7uJytoi+SuSdPGOJsKlHI7J/QsZgYp9FMgxGa03u9K4Uv?=
 =?us-ascii?Q?64tnXxWR2O6fhV1K38376CNhLGkjEWc1alMuhw/W+xHhq8u1UZRls/g/0wT3?=
 =?us-ascii?Q?D2HAPaogCetKpz0IlvlDdSgeaiiJ0O9ZY/EQtjOYJYabSZYyS6UMt7uRqbjy?=
 =?us-ascii?Q?twZsroCAiB7V8wxsoZR0yWVGYLepa/N+53kifADGbPwpP6551sB1hSRQClph?=
 =?us-ascii?Q?3OwBsq+nmfeeOyRJqFJEeRML9kcFK7K592Tcyafi1U8dwI7d8xDJsOfZpvs8?=
 =?us-ascii?Q?7X8TaKhru2IhthmEOmAPVp9emHNEkAoCSqKY8JgT+dCnr3FQpVu4XyDoXN5G?=
 =?us-ascii?Q?svBX/mQ9icbh0En+rdxQiWhwrJuoi11xOQ04/kq5Ppkqyu2axiioTxkPWxFX?=
 =?us-ascii?Q?Q7eZ8k0oeDxF9KAYjdBxoXkIJfZ/PHzG6SzcUriQ9Zyna5DzjpBoHUJ8GUg5?=
 =?us-ascii?Q?Wv4iSnJD+dvVO0w63lXPghnXcOY7gnGsZZhwC3JiYZryKnpB9XD4GxD/mN3U?=
 =?us-ascii?Q?9z52x5XCq7Quhe4vfygehNZehyk+mrKKRX+6v0R0dgpsW37zX7FNGVKfcifx?=
 =?us-ascii?Q?zmx3XxYgjHQxOH12zc2QnY7P83UrsOQP65a4jM7tRov5xUowla+QEgGti3p1?=
 =?us-ascii?Q?41Gar+GHdt2W3/pz48ZgHwzLMIyLDiRI+JOlWjz6MB9G3xKQQGFly5auWDUL?=
 =?us-ascii?Q?klX7nyEf+feY/Uonhg9soMeqfPgSRtlglEL0olu+DAfxHHT0UqsCT/Fw7rPI?=
 =?us-ascii?Q?ak0lwbqNttpxVQeuYmNydQFjJqCWov5ZK3Vz+WaGXWjK1G6cjcTRW/D2I/VE?=
 =?us-ascii?Q?xj0fesT92dL2SNjuObPwVUspqYDyC5e67yWqhYFRL48Ox9z8AWRPHLBE6h9X?=
 =?us-ascii?Q?vQRH2gGkvYyEoZl7SQB+cdBxnHbUMczRhZoSd8tHUMk0ULcTJRfxua7FV9Kk?=
 =?us-ascii?Q?oPj5OS/OZ+WpIDB94CBNsaTlIA9CF15XUlmiKDIblDb1PYyztT5+KNDNiN0B?=
 =?us-ascii?Q?WLC6xjCLg2m+9WeoaPWeLw4IfGaVKOyC47D7P0NB0W8cTXi4wWvdeNt4SCGe?=
 =?us-ascii?Q?CrYavrE1GenrMiSo4rKv6rZi83H35WPNPVEYw13Qmlepl6i2zIRVFkhg0w4B?=
 =?us-ascii?Q?i3bhDjcmYzgwGGWIVG4BZyIy61Am8UdyOTl63QTnsJt9Evr22MrE7rUi4l8Z?=
 =?us-ascii?Q?VwbwB8GpHbViZjIszFQdEMThAELfV3CvIZPP2pWrYVobCd0LrxEL4YxtMpBm?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fca27b-c4ed-4242-5446-08dd6570736d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:26:20.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3hmUC93C/xxw+7XApUWPkEXfSbrf8hN9Ix+gNrTd4OR/ojxQQfUOhktKYBaItWKwUqz1lnXBwMGTL7MQ0CVJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:23PM +0800, Wei Fang wrote:
> Since the offset of the RSS key registers of i.MX95 ENETC is different
> from that of LS1028A, so add enetc_get_rss_key_base() to get the base
> offset for the different chips, so that enetc_set_rss_key() can be
> reused for this trivial.

for this trivial... ? task?

> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 11 +----------
>  .../ethernet/freescale/enetc/enetc_ethtool.c  | 19 ++++++++++++++-----
>  .../net/ethernet/freescale/enetc/enetc_pf.c   |  2 +-
>  4 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index a98ed059a83f..f991e1aae85c 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -583,22 +583,13 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
>  	enetc4_pf_reset_tc_msdu(&si->hw);
>  }
>  
> -static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
> -{
> -	int i;
> -
> -	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> -		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)bytes)[i]);
> -}
> -
>  static void enetc4_set_default_rss_key(struct enetc_pf *pf)
>  {
>  	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
> -	struct enetc_hw *hw = &pf->si->hw;
>  
>  	/* set up hash key */
>  	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
> -	enetc4_set_rss_key(hw, hash_key);
> +	enetc_set_rss_key(pf->si, hash_key);
>  }

The entire enetc4_set_default_rss_key() seems reusable as
enetc_set_default_rss_key(). enetc_configure_port() has the same logic.

>  
>  static void enetc4_enable_trx(struct enetc_pf *pf)

