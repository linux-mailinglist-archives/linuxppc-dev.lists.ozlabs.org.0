Return-Path: <linuxppc-dev+bounces-7176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52469A672E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 12:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH9334nbmz2yrQ;
	Tue, 18 Mar 2025 22:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742298223;
	cv=pass; b=E5Ar3WQgUkWI+sQfEGYAfeM/2+g0xhopfmduggbRLkzpdlNsxRaWoM/Sni/BKek3gCiFt8QYl7ki/rpFy1GcMbxWz6QdZw/S9u/xytoljTGU4LUDeZFeXiSkilc1FHB/DP4TgeuKee4mWYpTVpeIh+08F55rZY2+9S/M+DpRT5DMliwLZ2WmFiIe9fkNBoAGIgV+ZBho6l5q90g1FwmgCDoMxLWdK+9AL91y15IedJ+SFAceHjXQS0VUl206qTzzYm+t7bscmfKuvQqKFdM8cAjxAx/vDNHMqllJwquQTIwS8x1XHe27TUiVggaJ1dQlGThfX4qoWEIP2oQ8ZPKoDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742298223; c=relaxed/relaxed;
	bh=zTM+PhxnknvHZ41V59SF0bnDjI6MCZ2gaFEwNz7AikY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dZx6hIJx1p/wnh77EE652Sk1ol53MKqXTXrm1G9cgWWKk9+g6sCNBIJdYY8wjT34ON0jRXo+Aqq+omYXwNUy/yZTkKraqWgs7FK5LVMvK0/DZrn+qqBOLM9Q224CvMnWB9Jzcf54ZLrMUS00Pger5LYyfiJxXh3gF1Kl7UwzoTSYsinZFqAp+OzozDYLuX16qRA6P/oFiXHVIcymowPKXTAQatFIsq7h3CWP8nvG0DEWJo2XUqLnt7y5iRrBxNQrc+Y3YUOkzH+5qAWm5o1/8A8oTGYv5+XYX6YCLRsznzY9F1tfKyDMYZ0CveP/kAF8+eE2x/+rAsvkG//UklFc9g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T3bKkhD3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T3bKkhD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH92z3LLRz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 22:43:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEC4wUNDqShp+Oa2gkQzNnCtjnQIViF4ANhEo211sXoj9WsrZcM92yOMbynaD+gYpgzPNsMzw8alTUEfZQZhj6llJn36ufiNYUX+lWsJACxXc6hJuV6nhsQnxQa6JjBtySUfsbbla51qDRHVxTwHnJCCx2jPhxTlBw6FfksLyReQO+BnadyNV7SK/vYA7jkKcEUJESkbZCtN7pFPSC4LTnTiwFIQiGfvGoA/hK14eehOVh3r2NKX7SkPjAHkbgjXYitfriTpgLhXIfVRgRzjmLyYcjoA4smDAs6vNDLgoEUFLqaZVYbo3olgvk7rnZvYH2q7Xw+uacb+fgP00JgNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTM+PhxnknvHZ41V59SF0bnDjI6MCZ2gaFEwNz7AikY=;
 b=nD1FxEcFSWlsnJlV7vdbTm2CxYZkw/8u6F7nOnxhZ2MBI4iyAaq63U+1yi3lG6a8sk6N5y08KLOvq1zOhTjihNKSMyXCNIsr5r8r7zCw7qnB9h8kOXzACQ0NGuBGRTBnf+NtEuuIjc181OYGJa4GHm52eO1m7Hj7cx9i37+l00NBsj/IBWEicSv1P/TIbYg5qNaAD4oE6vrr5KfrhK9oHHaht7V61AnTkQG1Wm9iMUS/xDwgY1BM/HlJtvJjHsCqygBegRZKe8orDgSubSmE6HJmO5ipxnIwLnZdWuQJMc9wmDH/jhWy1/4uIhO6N6DKE1YZrJ+b95VKoOeTlpx4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTM+PhxnknvHZ41V59SF0bnDjI6MCZ2gaFEwNz7AikY=;
 b=T3bKkhD3wQZuCOL9GKK285Vj4Nnmsc9X3YFSw+Jr7tNLihGguQzXde6Yir7y88aTHtayiQ/K4n4OTKk44LpU2CGDSNFggjd5iHV4fGIrp+wSrSkfMfBcy9ybwC+oeQCHGcQUWsftnNMUR4K9voGNRhHNFl98dZnfbShAE66xtyD5wk+5D0uywAiJmFNtGCodseyZ8tNC4PC2sYbDTOuIg45VHMddVSFwwFZqMzBmezT1RA6HqwE0u8AuVxiKairnUBt6IPS6u5tpwa6uGuTqTMgBomsJHZ1bhnXUuGk/l3L695/hKZT2+NUDKWIqfUwT0Qc2P7MUWpNKGgqkwWcLiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM8PR04MB7794.eurprd04.prod.outlook.com (2603:10a6:20b:247::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:43:19 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 11:43:19 +0000
Date: Tue, 18 Mar 2025 13:43:16 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Message-ID: <20250318114316.2st2ylxuu7srloqc@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250317155501.4haweyhlrfozg7zr@skbuf>
 <PAXPR04MB8510DE829523749E9FB5E20B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510DE829523749E9FB5E20B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR03CA0062.eurprd03.prod.outlook.com
 (2603:10a6:803:50::33) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM8PR04MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 06736dbd-2849-4920-3a59-08dd6612143b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0FO84ZwZ8js6Ltu+KB6OQkBKT4Jki0u+I70W/KVe1f5WGyPmgxLPOOoLLuM?=
 =?us-ascii?Q?jOKsoPqRaLLAkdPuWSVcY4sERTA5yotc/Lda2vQhzXFO+RwvH5b40VNk3qxW?=
 =?us-ascii?Q?MGM8fyR9qCWIaG//5Q482ySJGhn/L57AAs7tEHLbIFY01Tsia21CvpSYZ39s?=
 =?us-ascii?Q?GyabYi2+drWR8eNnfF1MZfkV+QurEcX9zKEZpv9sKXbqP3/SgHt+pJozHiqf?=
 =?us-ascii?Q?CDUkx9Et1RcS/X2c1cf0KmRxZiCUyyYx3+Vl9CMQ8+rDZy+/XPijYpBxQhWa?=
 =?us-ascii?Q?Xh4tQvNgyPihkMWGip5tuUswQSWoLRsnLIpJ19qhDAK7FLs3pfXTXSWMbZ5n?=
 =?us-ascii?Q?RHUa+cAm2f4EdovzBqYqoXMX80AyTQfhL+sYjZB0VxHoKXPV+14tfapJkUOJ?=
 =?us-ascii?Q?ZR1FO+XDttIsbTjJp+Wtqx6Edqo2VvdeVTCGbuwdSslPtOtm8AvvHVSp+lpu?=
 =?us-ascii?Q?Y5T+r8UEgV7NDCdoBYLPzwVEGgPkjQiaW9pyHhBmtaFT0kpTqb5FX4GLB3R8?=
 =?us-ascii?Q?R3l9pO+2nP89aTcNCh/Kdqs406pQEvl0P+k2moNEj36Mhe0x0dt2IE4dCodj?=
 =?us-ascii?Q?bNMHK9uod0okRGBlZv7cz3y5617DhFOiRTehUM6xqyDTOFK1wmnjWyl3Pm1B?=
 =?us-ascii?Q?PU36C8BDXNrRjtHDapRbr6rY/lwRp/0Seyjw+JnMs8pj7g6iAyFIEa3azkGg?=
 =?us-ascii?Q?BJ1+tBeo3bcv9SRNkgwSkguNvFBjDDmDp/JN4bomVzHf+p0kSI59tKlHxGzG?=
 =?us-ascii?Q?ALa0pI9nWzzSB+BsS4pB7OeCkNyuAsExbr0vam0d6C+iR9beq72zUMQMMt8F?=
 =?us-ascii?Q?UjpQUwounkpRDWNFX1LI0djSgo7FNQJtqNO7d21YUM1fxrDqYuiUpEKyAgct?=
 =?us-ascii?Q?zhhXq8q0iK+cqWLRXr1aXRLNK2wmFzYyrsAqrJs7nliE8hCFKT82GXijm8lw?=
 =?us-ascii?Q?AfcgRsfX5ChKvMK9YJWwnI3/HLnoaUwC2TeEZtbjy3xZOngR4WEimTKIzXqv?=
 =?us-ascii?Q?YBPQ6rM6xtXwSxbuQI5zc3aU+kgEHIPmqCkd7sfOixbEdn1pQCtwehtzDXbU?=
 =?us-ascii?Q?GP5bDsKAk5P665t/Xegu7Mnl8KZSd6+KVWhiTVBk+/XjotDyTPBbzFs+ELAI?=
 =?us-ascii?Q?CBScO+jQN/7vuL9E9DOzGcgOpWKDBc/5kwtuCrRDZZB0gYjDxFC6QoWy6D/6?=
 =?us-ascii?Q?n5JJIsLH92yVVR8gGkqYHdrk3B8lJ4B1d3aIySwd1dZvBAot5nszOAXGjeF4?=
 =?us-ascii?Q?n5WJScoSBTkNONSxKW6BNogfzVwKsb3UQVIFCoqSH+Ha+/mT66aVwf9aP1AC?=
 =?us-ascii?Q?1T8LQHuiHVPIdVSAEe6nxn6j5vZGG58FkJIgrcce8noFTMZALw4MEGgJhDyD?=
 =?us-ascii?Q?xXkb9yIcJxJimlWwenpYlDCsIh3+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqsnOEHAFijsh/xJK3b704c890Lk8zYGrFmtPXf5rRo0CaCIzB3OYtyXdiBd?=
 =?us-ascii?Q?fN6tDnflUD/WGx6c2QIMNNy/cySp831Esb52bvKQsx/WPzeZO2/O9KE3drpE?=
 =?us-ascii?Q?AKHWHek49X2SgxNGGQWQGXCMSVwRAZB0frjhMC8z5j9+owTedmvQvMyiS/B2?=
 =?us-ascii?Q?T9iP+bfaxi+jAeywZAw4h7D9/1CKNq3wKbxVYqVB/ey+Is3/THlt0MH9UKlz?=
 =?us-ascii?Q?4aM0JvH1NtPK4GEckKC2bIEYoeG6nUwi5lOxIFd2DXzi3AK1rxfrFpTFI3qB?=
 =?us-ascii?Q?DQL/ajoMPbGuB19BJOHYUq8vsgBvn3o2xkaujjFQecEzgjfwLbag1wtdUyaF?=
 =?us-ascii?Q?Sn8UWpDKHObqZGEuzFEG0E3zFpw6xp+oHl9Z9va5pww7Bw6FzwgSuFxZtEZc?=
 =?us-ascii?Q?4t4Lb9//5Z+PGb+rHNsAa5O0ayBUx9Nw91pVbST5cV83FXN5gd8/RBza8vOt?=
 =?us-ascii?Q?BP6KaJHNyNNt2NFwJa4T27LICsUG5FecRhIiQn75gzSYI1k30vS44WE3r6ti?=
 =?us-ascii?Q?dwJQIaGcdj7jG//kP+9Us6ehXlkTm1xLToYB8np3ZdqR2akQCHb5BlaPfX3Y?=
 =?us-ascii?Q?m6SkxVg9YbnA9Ryf15O4scTcOLHNhxLPosSFXA8bLZiAnUmFDN3Xp5AH300q?=
 =?us-ascii?Q?V5l4uuZYSTAq3gMzAl/SjnMSDPVgVuoDxGnYM65SN5gUA0HOj+NOFJtGts/X?=
 =?us-ascii?Q?FezskMWuvpSp/5+/EwdlYoStJ0v9R91rMiPOPVnJP2ZzOzDyuTYbdiZYcqKz?=
 =?us-ascii?Q?IuJGBdenaA9R8aWb8TvjS6w71ado2Neb3MIcm9uc9WGQu0VdWDryxNZUrVXT?=
 =?us-ascii?Q?izCZuwDK4L/n1JQXR+1cai3KYUMQRVmsczjEbYBmF12nGyJAKDdrplySnjol?=
 =?us-ascii?Q?LDX3UhnGmSDHA6YGBpgEkKgnDLLvnST/T6vO8n3e94h6SH7Ttx2om2PgoCg/?=
 =?us-ascii?Q?OL/TQTEgOCb8N7rvBEoQdGQAqjF/0N7EMnsOkqlP/mwe9O0z/MHbE6VZCIYz?=
 =?us-ascii?Q?z86OG3km2PrxoXTV0k9dTcIJWHYumK+G6ZbcoKiQdFf9fyDQA+941Vl+7DGe?=
 =?us-ascii?Q?5KEgDaqG3pVlvOMG9Nu4fE8Mh2Bcl1JrbXAfk1jkq6F7gSRl5Dw5xqz1G5na?=
 =?us-ascii?Q?SFbWG2LdEwyJjve4WGe+59StfcIs2wFc4tqQh2gy9sKVVlMPt3Fwy7d62/1H?=
 =?us-ascii?Q?udMjnfwBkt9TWwF1A+C7SHrtMZsAGgKc/5jsEMvMRGo2AGAiPC6JTAsl2S7N?=
 =?us-ascii?Q?t+CbN06QfhQSXuFHpTvlaVe9PXf4OjoJ1GGu/6EtJRFQyBKxDp7AAloFCDmK?=
 =?us-ascii?Q?ug+3bKvtGkC1mamvOyV2aGxXoAowclIJBSNZWCiFgue6Ag3YivQ8HPMzAHNa?=
 =?us-ascii?Q?jbrrT2gnXnKa0aS5ketGOcV+GnHZjvMDLZuySSPmUPQMp/kE+Yj5RylppRvv?=
 =?us-ascii?Q?rT031qCQivGdn8XfQF2K1a9SgW668GHD/WXbBYWV6ZGN64QazoDwgu6SvPjj?=
 =?us-ascii?Q?CuB13g/yd6w2uwicOcQIegozM0SFUGLTAYRPYXDCFA+Hr3nj0FiooxvC0D1v?=
 =?us-ascii?Q?4W/HLK58SjBTOhdrWoPDoiseQMvuliDYz2YruCFtm3pqCaPVej2YBncJmHxu?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06736dbd-2849-4920-3a59-08dd6612143b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:43:19.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3TrWvIkh2YhDXmL+2v5eDNujKYYmi2cSxBpvPTpiJM01SNzrPDYiMFl9HAM46f9tpwqkHuoLQZHYHhsiD2XSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 18, 2025 at 06:47:11AM +0200, Wei Fang wrote:
> > These rxnfc commands seem implemented identically to the corresponding
> > subset from enetc_get_rxnfc(). Rather than duplicating those, could you
> > rather return -EOPNOTSUPP for the unsupported ones on NETC v4, and reuse
> > enetc_get_rxnfc()?
> > 
> 
> I have explained it to Jakub in v2:
> https://lore.kernel.org/imx/PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com/
> 
> So I don't want to reuse it for ENETC v4 PF.

A detail of the review process, written in Documentation/process/6.Followthrough.rst,
is that "Andrew Morton has suggested that every review comment which does
not result in a code change should result in an additional code comment
instead; that can help future reviewers avoid the questions which came
up the first time around."

[ personal mention: it doesn't have to be a code comment but can also be
  a sentence in the commit message ]

I believe that it would be good if you could apply that suggestion for
future submissions (not only for this particular comment).

