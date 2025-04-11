Return-Path: <linuxppc-dev+bounces-7614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6CA85960
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt135h1Jz3cC9;
	Fri, 11 Apr 2025 20:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366679;
	cv=pass; b=IqMK+R81NDl8a8hOQ+Ra6ZDpFOjBzeg0VYOkoUKcA7iCmhzrqqEp7YNHS6D/B2GL2UTQikTx0pPem43DWgX7bNamR0DrpJj1oT8NSe7a+4viS+9M9zB4I3zk14pIrC9Id5uPJKxqpnBIJjX99Ybau9ZBjhiFFKYqjnnS3B5um4QyhQEyR+X2h+SZ2bYkiahk7oNWi+mtHaJpwomW+4qGwVQ/lzWNiNB3Ko0unek7TWZr3/V4i++5RCh9U8QSb2YR0TMAnasu9DfC6fjJ1RDd9XQAgE4j2Fjdx6TfZk+THpTmUtL95koGmDMsoNr2WujzOx9kOdU2LwWpfEZ4I0PSkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366679; c=relaxed/relaxed;
	bh=7i8gNx9vzcfj6KkEixZFWViA1eY6AXKc4K8PHlGLiVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EPy4tbMgCQOG7Hj2TN9FlYHu5B9nBRx7f19Y7QPJHahM2+F332rKJU2+OxdDy4H2A2nAbbynk9HIN9w6VGzdigcykMZIbqefChWS7WKqkYZOe0Iehm+O1MvCiA66t0F4AAXzFbKKQur9bt/8zyPM/a0v2GofNgFb0RK3DA0ub1f9npsPatC0sr7o1k0FYhydXXjdK2vsvK2rlkHI1vwqknJoF4z+jLhrGx/+yvEjy38akCy4F5IL33SneXI3Ox4cyJ2oqqIHCydLL1ll9Sj/A7Vef3MVHGf+MUS+Wqmv+F6p064upwFm1LKgBRsXZErDlLEXFYYKdMBMjZ6v4z9jEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UACcK5Ki; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UACcK5Ki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt131mYDz3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiJzZOD6pZs6j5kKVsW3Kf+m3kNUyOKPTADqAXBUDF2QpdqkdsRoF3vVfRgyKB0xX07hlwqvdWYix/0rZRwCJHCMIsAnW/+lfaFSZe0ZNa712nX6vYCNJ5khrMEuaMZlKi8lbWpG1YwsHDTZrKeXrGsC3VBJ9uPMhs/TNY73AoUPUGMPwqwh3aSjxVB21zOgssDURcVObunAQNVLEkn7Vi8uqhfPTgHpJdo0Z6isOrugQrnEVvkrKL6KjqEpBLCWQ6BrkhbGcbGLyrLZtNxXvCu2NKgJn8K/6RwXOQmfq7G0PD7Zxta3slAErLfmf++xjl6GrEY0qwcGR5XrLGMMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i8gNx9vzcfj6KkEixZFWViA1eY6AXKc4K8PHlGLiVs=;
 b=y3ll5UJPkHMSXUN6mhlhGtGX2Fw63uLapRbAXBiELx5R8OF/hGcd5ljqZZllDRzF3pZ7CbPDUicRhbsbotpDcy6nRO+eAyKaCZyX9llO52L4h4wKQCexqUawqmI8tYWMJ4XY44N57AswUA+jeTu/rUScqxhmds8chZdfbNpdgEwXJzR009a0kf7ywBJkQrCF1moNi9mOjFAUlCMNA0OLk6T83Vc15p5S+jEQkqLMSIsXb8GmHW8YqqXht3MssiERXKwfDGbacCY3dXY8sOzQIh6hTo7YopL+D4d3pjgmYkymGt5IBBxxQG4f8QpLKTFD0dZMe8CgNHClgTXjrQigaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i8gNx9vzcfj6KkEixZFWViA1eY6AXKc4K8PHlGLiVs=;
 b=UACcK5KicS3uLzazR9HmkvTJYd4Rt8HtMDz876Y5mWXWB5rq7O0y48iUoDBCobCZppuWl5Eo5gOvNJhVO3KUa5aRkDHghnkZ8bU0SbBijMLCv2eYrnHS/ZeyTD9vWUamW4qYfQNepUaUMoILfJi3CdjujApYGZGNlP+tWusG1ziP/WaT7CptUz6CAS29HgJNqrPZ+ZgGgkih4vCzMgkHvgQLlHSr2bZy0zue04n1V9YLar3SlLbNlhDPj+Mj/JqoXHYiVfduuzWCfEMzJ5VJqullxWKfCb5gFRcbrvYkf6nk89zBmWPEK4+5d1HErZjAtxUk2ooIuiaiczLCYCQoBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:52 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:52 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 11/14] net: enetc: extract enetc_refresh_vlan_ht_filter()
Date: Fri, 11 Apr 2025 17:57:49 +0800
Message-Id: <20250411095752.3072696-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 248c26e3-7991-4466-aa17-08dd78e21e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1DCCZNW42rVpS0SknAZiTnRATr9kVgPle2RXZ2rl5wDjoaD7wgGLkMqFNBj0?=
 =?us-ascii?Q?4cLHVusjO8usqqhCk/ddudQ1fS+NZytuwu7ANQDwMLZCcbpFt30W4gmiSfj+?=
 =?us-ascii?Q?f/GcPXHcgfke+foFQpjMxseu1O3at2N/6pGarOdprpIfOSFQc3yyWIkXLHuN?=
 =?us-ascii?Q?m5oNZnVXCCKVAEinpyvlCL+FNnkVxes6RtrwTnMgPUJ85CL59fAbTkRH6ZnR?=
 =?us-ascii?Q?7vEDhNWBcvUFK+8lIUZ+BRKznEMkI73tA8RxhrKP9mznKYecAOnpGiqAI7nl?=
 =?us-ascii?Q?c2SD9T4KrEGBgb3Cgpx/Vf5WCT8um6Og+sz1ZAnE0tYs2ZPxMk62iyVXP6nK?=
 =?us-ascii?Q?1n0bkjud8LYR5gD2siqTp6TJRZQeSRtI3M4p+X6jdIh7OOyv6hRZcEjjo+6K?=
 =?us-ascii?Q?apFiYr4Fe6VHjWv2dI+KvRC78r7DVZG04/AqPDHZwHjQDGXS1gpUM1u9xxi3?=
 =?us-ascii?Q?RBpHs4cvWmZTd8nWwqojhKjPqSicAUsWypdYR9wdyMUWDLCnlKDArteeNVq4?=
 =?us-ascii?Q?rNkXidndkhJAkDZsslEbF0noCGa/l5cYO30PiLjbVXHj7iKolAVcbD4fGXEP?=
 =?us-ascii?Q?7HEUhnfpWneh6+FnQcmmEns41/ljLEIf2bcEMraBLg7I7LImx5H3XxXzBE+H?=
 =?us-ascii?Q?FnXTijF+CNdHe3aHL9/l3XqRiDITReE4LVggGWa/tLuMXda5saJ23BLZ+blE?=
 =?us-ascii?Q?N7kh3SaLqAlCPJnYGwGqSoJezQJgxinwmYqX0Gw56mYTCxeFCHtYTEQLxg/L?=
 =?us-ascii?Q?/eVhsqUU+RDJQ3uAnnqyCKT8j2G62McTA7dFFYO7PDlG8Nc6MGzkVIBBx2vk?=
 =?us-ascii?Q?s1mXuWT+Skg5+1O0t5rJwH+/DNL3FBchoHVJISASfREFRdJdWx48O1qSK9rY?=
 =?us-ascii?Q?bk5ZxNOfr+VGOLiugdGBm0O1CiNjKcJCZPMLKvNcm1AgFJW7HVLVn/5R+bYm?=
 =?us-ascii?Q?JO0fFb0gPm/MLnNmSi20X+rBpymBwm/ipqrZXC9eTQg2kfRVAHuYCr3tTY41?=
 =?us-ascii?Q?AyziDz832YoZuCFMcFvgoFMs/fNe08mUNZwaVg+L0ocSavkRrYOaaWkZNpOc?=
 =?us-ascii?Q?jNhZGEzwwVsTJX9zdyig8NtiBlHN4J2UTpuf5tuQrpN4ARtgvkhoaydIqcLp?=
 =?us-ascii?Q?OdKyyVExloEHQLCUtP0RA5RZA3qeC8hb2bAQtQeind0xuV+teCH0kdDSkkDo?=
 =?us-ascii?Q?OEG6NM3UkuF1KuDKnL5Lghh6aOCfoQiX4po4eLUdOCG3945kgO9AXEoOwRG3?=
 =?us-ascii?Q?dn2E5RA3qUMtg+VbzIIozt4UIHosqwAS1yrOYIGM688EIt/1/L5HMMk9HwNY?=
 =?us-ascii?Q?nTwUePy/KIVZB67vo5Ft/1+8v/82PeivTOKQGtl9iWRrsnVq5kWEUgDyoVuV?=
 =?us-ascii?Q?IwHWy23y+mIYKu5Tlqi4ft8NacLMLifCwzuYxaBemtHIwRojp32ufuUHeO82?=
 =?us-ascii?Q?NG5tNLDODJ+O+1YaEwhw2/185VYdkWWvh3tykQbpDocbUMOD6IrVAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9m2Qpt50wsTmptvHU2uVHCj1Bb30lAgs+8/Nwu+wAGbb83GwZS7Kb1OM3mdu?=
 =?us-ascii?Q?ZxchrLqlCURiMl3HOelVuOa0a2UdYE6Hc0v8B4Y/8wCmpFFko6Wtr7XrNMkv?=
 =?us-ascii?Q?JetE2Zodvp3E72fS3koxmj0NMd2IxbF06mISRU2bSu/d27S2isjyWCrZy7SR?=
 =?us-ascii?Q?jxwpnQuQDRJmypDqF5RftOs7oiAPkWkiDRr8GZgYzo2WBWaUWeAOZ1seftRu?=
 =?us-ascii?Q?uxgcjfbuCeFjUk+18SF4JQaX95zsMbwm7/62LuZdQvjLT65XRFzz+XcUd1+O?=
 =?us-ascii?Q?Gt2C4MdXAE+ul6O4g5P7LjME5XAhoIPLaVfVuddMLl3iN1OHohlumIuuxTBc?=
 =?us-ascii?Q?Y3+abZxAy1mRS9DdYU57D5tQIQJb6/SP8VU7se6k/uz7JpOjaHb3NBpFqunX?=
 =?us-ascii?Q?U0AuA/Wl5xh3LLm3SNviU2CqLGMADeuH5IXPNa3LhoxnM1AugDkJ3R4KvLyD?=
 =?us-ascii?Q?Lfc8DOCqsGS95iP0f96hu/pXCqKIlq6tDBIUDg/QPHTru4j4egP95LgidQxZ?=
 =?us-ascii?Q?A9QBEFDXziOzsZToR2cK2p5zXTZsVcpvmQLDOt24vCCrZ4vs2KmyVaTEIljq?=
 =?us-ascii?Q?N8awEvmCNsyYEUhfYmPi11Fo8gH3aYUNuY2xwsJi7KYQImo4k+v+Et8Vypq6?=
 =?us-ascii?Q?NBy2lhGWQtJ0YQ9dmt3QGQ14T4JshFcnPr9WkkRzk7TQgZC01s7YPY3hu8Jn?=
 =?us-ascii?Q?unw5VBuUIUAXft3+k1NxlegLbY8jYOcpxZlknZFOR6B6WS6RYqXMGFpTXylG?=
 =?us-ascii?Q?fBKML8IxqPhbnfgB7Df3otoa5EiPLl3NtHdccFlpSIgW6P+i5U1SVyOpE/fv?=
 =?us-ascii?Q?IthfL5fRjjVNFsbG6yWmLSgS0U/Saxu+cCmkrcSfupmxkNNFYBtqRcjIc9yH?=
 =?us-ascii?Q?2MnaIMPD2qZoUjDCNZAi7NIAkTPBZZb0sxHkBPIGFRFfVU+LNAaHqjfhLCmn?=
 =?us-ascii?Q?4kEfAVqmy9mZqRp3ULXNu72rQgnps+LWlEO+y2YvCH2o78g/j5TWMNLcqJlo?=
 =?us-ascii?Q?ZqMJsxT4A78mP4ekMbPs3heFIp/4NKJyZKSlXV3SlJ7nLN79Xr1OJlltDgnV?=
 =?us-ascii?Q?+3YJ4Cf5+xKAkgqIxjJCaS7woX3l1/l5U0mBhtBrb07hy3mKlugSBl73xb2n?=
 =?us-ascii?Q?vF0tjhT9QOfoumnSJfbL4/7bw0JoFGOwVp/ne8lIckF0DVkZ7GAXqmVQ5+Iu?=
 =?us-ascii?Q?fYL89ylqtwHbMRtBv46zszDartaUetJ7gabfTUjwHietnknLtye0/soAjg0M?=
 =?us-ascii?Q?tFKP8C0blmuogQ8F/8ebCawdlBCL4slAFMP/G+MGWoX+Zt1cSlwk5OmA/3sc?=
 =?us-ascii?Q?7mICmnE+BFzb5HhopcNtpQ7v+s7j+zjxsuoAfiWV+DWt37sfuQ30Pfl0FNQ2?=
 =?us-ascii?Q?5SXYKiwWvnoHCSpzxWyGEd1Yu4Y+xXscpDIkQHxyzSGohqtQN1xzHtpWZFPw?=
 =?us-ascii?Q?rFFQot+hbhNyjP6/3aos20hwUHkdr34WvM0csd0MVHgaySAbQ/0wvcfnbf5H?=
 =?us-ascii?Q?UzaVrrtOFrJHFTSDs4Aof8jHpemXjx3WqP3MZoYPSkjsvoTw2M2knZoiFaeq?=
 =?us-ascii?Q?5sSrzuemIMXyDBez6eZqb/iaxCp6Ti1gpa1iGIia?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248c26e3-7991-4466-aa17-08dd78e21e25
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:52.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je2cYJX/Cn1nKz6IgL3ZPdaWCHupgZYEgDqstEtVHMBhURAhB/lfCnkt1YbXMZSD/9aw1NXT+1LPkxLJPa3p+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extract the common function enetc_refresh_vlan_ht_filter() from
enetc_sync_vlan_ht_filter() so that it can be reused by the ENETC
v4 PF and VF drivers in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes
New patch
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8f2616fd83d2..ae2dbd159ab4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -234,21 +234,16 @@ static int enetc_vid_hash_idx(unsigned int vid)
 	return res;
 }
 
-static void enetc_sync_vlan_ht_filter(struct enetc_pf *pf, bool rehash)
+static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
 {
 	int i;
 
-	if (rehash) {
-		bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
 
-		for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-			int hidx = enetc_vid_hash_idx(i);
-
-			__set_bit(hidx, pf->vlan_ht_filter);
-		}
+		__set_bit(hidx, pf->vlan_ht_filter);
 	}
-
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 }
 
 static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
@@ -261,7 +256,7 @@ static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	idx = enetc_vid_hash_idx(vid);
 	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_sync_vlan_ht_filter(pf, false);
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
@@ -272,7 +267,8 @@ static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 	struct enetc_pf *pf = enetc_si_priv(priv->si);
 
 	__clear_bit(vid, pf->active_vlans);
-	enetc_sync_vlan_ht_filter(pf, true);
+	enetc_refresh_vlan_ht_filter(pf);
+	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
-- 
2.34.1


