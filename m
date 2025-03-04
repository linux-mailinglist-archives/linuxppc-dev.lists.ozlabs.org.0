Return-Path: <linuxppc-dev+bounces-6665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC8A4D4F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJ218t8z30WF;
	Tue,  4 Mar 2025 18:39:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741073986;
	cv=pass; b=CSLW9t3QDIFYgtt42WGH3uxVHJH5MW88FpEZFrt4iIckufLEynchNe9Zy1aGCxleGrkYAPYsC2MvJq1zoM+bNfA1PIjjA+/32hQRsESLEcXBx+9Ak8pNZ4NonUySFC+3S980TKoYrDMZ4NbqXqvqearRqTclbwDbnml9BrIHXdfnowR7oOpfiKEM24q68OGZ/v7v1u59Xw9E7SPToKZwDwFyEEQXhF8Lyl5+Xy8mwty4wpQ5x1A+JOcVFJIcBz1oAV/Db1g4PALwsYUGkuoaddhQSZ6nXeobSldjmQVSrALJRU1qG4N0635ERLCU32FHbeigavAtCDdLnqcaEYS5IA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741073986; c=relaxed/relaxed;
	bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g3ZmF8t2TONUftvGRrbVVpQfpdfI5zol2Co/TRwoJXgz891KzTvR4jN4t+XjhCiAzGDSfjYnYEXhwZJG/P1gkrfIpF4LqM69Sa4fNfdZt2csR82SN3gDhCXygZT2OO0+o0Bdb0az192Gu0l33cf4Poclt/1MPZmWd9KIw8k6QH6TaqLCRu5kPZrFaYmsEMDtsPogrnJasq2CWMnXmboKzAcfYynI8VFYo7CDZYr4vWOcX9d26jYXOC6j/BrO22m2YLtx1dwA8Wzm2I08TearKrLgSf7B31Lcduy/iCxP1NnCvL+7zafuh6bvWRVydVRvloYNEioQhsvyQwrRiFrP2w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CreVcpA0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=CreVcpA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJ13MBDz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:39:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZNa4r3NNjpdR8lZb4xOaoVDgxDNFDoSe879iC970Pv6W1AgswL8p7aOGV6K+z5qH/KXgKLFn9aLQFNF6cMaxWutRif19o+cT18JMVJnpH+yhMmdYv9uinFhEAXC/tkgZwmKivG+YSnjLibZsWdkfSAm3LBBIIFT7t/QvxmwaI4bctj/eld1Q//7upLv0KTu2ds3YSSpDvBGQdE/KH/20/AeE36PqFFUa+Mp6X6e+QNS6q7Dn1hJibF7U9mu+ghXNi3egcdL5zKWxs/uKHa3z2opvjzX9rTzxhOQFUZNrqzT6GCwfQzTqz3qbLojnbkcqrxjS3KWHyZakocNZC+HPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
 b=GKjrv6iwPK1qW9LxlRq2qve6UdmRHxRA2aEA8fTlLS+BEylaDBW51f4yuKLSicQfIO2wrHm6w2/f6JzTjldpz0AxchM9zVN4P/TmdHxatrj6nSetL2NL2VQ6vB7X5RK7m7fmCG+wLXA2Ah5lErEh9VQdJiupTj2JOWye2d6Dknzk5uICDqGe+U7KmPTba+vGsu44qkprTEmBVNXdptVV3stTJg/Jx8oCFR0G0VctWmw0uh7sOglO7BD9UouWI40qKo05kxYRMoNOGtlkS46p1uWCFySpOBC84BUJvaGQ0JrMlOAwPOLPxbJfRpnmT1UsFg6N38eQsyzvhrnnl0wubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
 b=CreVcpA0xyLUfjJfGJGa2DIUS0/3gROX2AJeZ2z6x6v2zlcYfBEMub8qoMTGbcJfZ0LsPLaccBUNCE3zPH+R/32y86nUZkMRXhTL04pRBtqGM3ZUEWn41Z54dlwLr8xt1ErIdRTPwqXyrwDoUuCq+5Yp6eCznT/crq/Xa8RQHQ5YgZsRQdSqMQqlKmTIfTzP5Ijct/F7ETfsMcmVdtnNX6z2g73/qn6bwSi29yLuCTW4KUThbTJpVeHI8+AkHJgE/wqIaqOrzeXxbGcoRj9keqj7P6bOlOe+wDlHbnbJ6Pflztf2LYJUtM+4fys6QeFaZnlrIGe5Fq7wemuOsET0vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:39:32 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:39:32 +0000
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
Subject: [PATCH v3 net-next 03/13] net: enetc: move generic MAC filterng interfaces to enetc-core
Date: Tue,  4 Mar 2025 15:21:51 +0800
Message-Id: <20250304072201.1332603-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fcaf431-6c70-43a4-84ea-08dd5aefb3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J1DtNYtIROQHIwbm0XfXxyP2Sa1P0zzkyUxcOP8cU8mj9kW8rgF9n1ssBf91?=
 =?us-ascii?Q?GHHulxl8w2/GUcj4sqIIGK2Q5EgSIf+W5ICRDd7oAirXR74qkTClvnKdbJGH?=
 =?us-ascii?Q?Go02V4SbWalcOhbQpsawxWh1PKXOgreoaROGYfo3lHxTzglY5I8SCsZDe0Xd?=
 =?us-ascii?Q?HNp8Nd6vzI7Y6zwQl8EyFU5cJbjn77tkTFVPLS6b8Muyo/6cdYLaaB2vuPhv?=
 =?us-ascii?Q?o4xqQq3gVur7YMTFDzBzGdFwDdHcjBElaKVZhHBgRWLS+TFZe1ydCTl7e20c?=
 =?us-ascii?Q?4KNwIIIFm5DKrVr2nJMC8SIzDHyPx6nQ0S8HOa+pDYD52az5np57MgRY9Jzo?=
 =?us-ascii?Q?doYenvJGtCnGoidMS6TwwGnXiTufWgseUiuoizh77xjNGoHf6HIGf7qq9K4K?=
 =?us-ascii?Q?j83tVUdhbbUoXCayb8tKTrGsztvY1WM3dDc5psK6wVUX7HjfPo7POiuGw9We?=
 =?us-ascii?Q?+pIRPfyczj954TfHDWn9uHgOGc4PCwlUyK7/NuIvyiDAS9otDiSEDCTcl8nB?=
 =?us-ascii?Q?c0UGSWM87ZphUsGRNCEn5ErSOLVguGUx+drbQ4wPcFISiwVTAUejBTOYbtTQ?=
 =?us-ascii?Q?+pC6jXvCylzn0DmJFKMsAcRwwxidzCMjk/ajvHOv835FPvnDvjhAbqRu0Gsv?=
 =?us-ascii?Q?vKegbSAV9Kr3XPRkxKFCmaqQIxZA6uWAtqIkb3duB9I57f/dbE93EG3iICau?=
 =?us-ascii?Q?vQHtdqUEx3Qfx5ctDIKw1zvYiV+ip9Kr/c2mBiGGdpjhvNJEc0EVU+6MLwdR?=
 =?us-ascii?Q?2a5P/63ZHM6iLUywo3yWRH5BO6HWV5I3HdH9KBXLdOUrznXKaZ8IS7DO4ufG?=
 =?us-ascii?Q?1d8a3VbxikesyxCuUliZIVXSamkbIdxqRPUbmKWFZKk2dOe35FZlNEqO2TVV?=
 =?us-ascii?Q?uX2suULCEaDouGdo26Z6Twdlx6O6eC8100tPJ8nct503bNgMvBdJiPcz/dNU?=
 =?us-ascii?Q?9kc9A9LRwiq1HaxbON8GvybxEwQjf3eAGXW+zMIJBK0L9GRXQ2lP4Lf35o95?=
 =?us-ascii?Q?ZBubQnNQ94yxudmKpEs9V93I83FOD0xEULElyJv9Q2dQ5B1nDv8+2JmQGL0C?=
 =?us-ascii?Q?BYJdmN1aeG8cY6UzEeb+fPZujGbGHRjAB363nCk93oWY1AMrlFRx10G058VO?=
 =?us-ascii?Q?cYk0zJd2P1YL9azSpC1+Q3rrQ8GIf2RyfSIUMwZkZi6tB423L2jsY5uMPzEh?=
 =?us-ascii?Q?GWYVUvJarGIBSeDMre35NIWdN7Y0WjOwNK6wbP457rdHiMJu/WfJ+b+jdTF9?=
 =?us-ascii?Q?A06F6tscJtcnwhhhiAw7Cv1Th3s48TzQvSWowN9PD+FhSDHwoauFijX+LMnv?=
 =?us-ascii?Q?u6UZeYSx1PEna56PoAmb/zziLVRQO1XEqNCuEMRCo/GV0UA90PAKxqlU0RFV?=
 =?us-ascii?Q?9qrhDpMb6cQW1GAQmg/3WThxKRMWLL4ZcMJXfcDoKoSd46kEYnHf2/y+Fg87?=
 =?us-ascii?Q?yxIsn6QbuBLznPPSFEk8nBhCRSqCbMw8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k50rusoD+4B7tZJQybOApDeWewDwQJxtkicMmoITAfxswq/B7RO/0TNDavKR?=
 =?us-ascii?Q?6Z1AMctclav8Ag5LifYGJsGrSZ0BYfnD9u8fy+uXClBahbat7iHw4ZFwDeU6?=
 =?us-ascii?Q?apdaJ2WF+9NxcrX0Q9EeYiDpI9yctr5vI1Aub44qyF+tfU7L68UhUOW1Gu9p?=
 =?us-ascii?Q?pZgKJsm/aJUuE2UNiU4Z3Ksk3SoaR6rl6w4wGOQia1JdI+ZM3V87u6qmVQU7?=
 =?us-ascii?Q?MRZpxazXErIJ+8VC1F+UEUiMqxiXSu6ZhEaYYlTvl1IvFz/i+wsH45dPz9bA?=
 =?us-ascii?Q?DxfY06lHDkEe+jGxEiN83vv9WgQIcbpbn+Cd7WF5qRNxxKQj5HAn5dyskmT8?=
 =?us-ascii?Q?lJ5G8Uo2zZoLNhHcjoJNd9AwCv/d6QRMFq/tiMXDrkXhLpHR1sccCQuZqbTR?=
 =?us-ascii?Q?WTCaDF/M5wDiRfKaj2aGL3k5aRMNh+asm4jwIRXiAzAN4mrS5Vht9OCfTrvL?=
 =?us-ascii?Q?Hs5vGkPkdVuIl7gjPNVYz+N8fCQ15EGryqacsk23snTWk/tVNh4WY/yigCoc?=
 =?us-ascii?Q?HLD9x20YEXwqJmpxu1e8BvhMQ/cJJWLzIQcoeBZP9bD1jXS5pi10s89tYXy6?=
 =?us-ascii?Q?vu3aTq0Hry3Hq14ARNopAUzQNIdCQIuYK8n+AvO47pw+6n5ZdXFqF59JVdHJ?=
 =?us-ascii?Q?rM5n63l+3jYjN8t0RE73RKehoM6DGaaD35qhuPK6ScPBQVqwuihOnpwhQ8Hw?=
 =?us-ascii?Q?e6+JArB1eAvSKsOXkM7XH1E45tiLRfY4TRJtCW1McoQnrUINQPT4KZljplB2?=
 =?us-ascii?Q?tWfRKaP/W0aCNVuCfl3RJLlkerbiHBtvJdHkb7CWiRXzWLSPrQwqT1QVBbmt?=
 =?us-ascii?Q?TPLQaQ3edLWfLCGdU+vPIpH7FuE7+ytSBUCbRoWEFx2HylmjFI9FAJn4S1fM?=
 =?us-ascii?Q?GZm+SvZTA4GWkXS25D2As7YiPBBcUeIBEGLm8qaaFF1GVVHjhR8w1WBpDrN0?=
 =?us-ascii?Q?qncbMGrkjnWmUpCnDgIGM7HeYB2uSFknnl1JJBe3CczzfyJ9anysZq/PSmVY?=
 =?us-ascii?Q?CwMHS6fCQUG9ePved0Rc6NAJdKoDVilm7LDdV/1Qki9232YswdzZqeWcMfbJ?=
 =?us-ascii?Q?mfWIGsSZMld5PPvaXeJlqjyzgdxJUkw2ggssio4z6lGfBpussgZwPNQyCp8B?=
 =?us-ascii?Q?U+YcTASuTX7No/h6AM/hYhQzr03+GieUPkqxE4iQNA5G+rLNIOJ5+7KQRw0r?=
 =?us-ascii?Q?P0FlAWON4H+Lyq0AFiS2JlfZeUU6LsdUAinumxuV07N5NnSpJC2PSf5dTxre?=
 =?us-ascii?Q?DVobLhg5G2DSCsR12ZXfoEVjKSEJ9bC/z7S2ZfUDNdbroXpn98Orgf6bQPRf?=
 =?us-ascii?Q?KK10Ud7d4FKzvmay7A1GmTupSmQnE/1IAPII9Y2GwzFalTTIR5tg4bVzY2no?=
 =?us-ascii?Q?G1CgFU2ZZEqP50QD/IaV/5Gs01GLvVAunKHLGxtG1n3TJjSKzxZckOCeuO2Z?=
 =?us-ascii?Q?wndkIq5t6ZsT+OS1zNwMfYWGS2IZ/o5AXSj4BaW2jLhBKrQBRa9cbewgR9+e?=
 =?us-ascii?Q?WvLoTkFeEIT5VtxRjxDGNkZe9dwsz5zdbmyF2jNHTL9N51lnWTK+JBQN0/Yd?=
 =?us-ascii?Q?39SRGxJFKZGvCPd7vtS6HrZb3cURZmEwdQ1ESjDr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcaf431-6c70-43a4-84ea-08dd5aefb3dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:39:32.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3i0CRyLZreLdY43VpNJdR/v9/XTvTDV2m4qnbwXb+ahnVOFjVN7jTPKGS5hX2d2akYzhmveGp8rXpFlm/Qh5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. At the same time, the struct enetc_mac_filter is
moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 ++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 17 +++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 49 +++----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 14 ------
 4 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 2106861463e4..3832d2cd91ba 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ff0957e69be..9380d3e8ca01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -302,6 +314,8 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 };
 
 #define ENETC_SI_ALIGN	32
@@ -484,6 +498,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index a214749a4af6..cc3e52bd3096 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
@@ -145,10 +111,9 @@ static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int type,
 	}
 }
 
-static void enetc_sync_mac_filters(struct enetc_pf *pf)
+static void enetc_sync_mac_filters(struct enetc_si *si)
 {
-	struct enetc_mac_filter *f = pf->mac_filter;
-	struct enetc_si *si = pf->si;
+	struct enetc_mac_filter *f = si->mac_filter;
 	int i, pos;
 
 	pos = EMETC_MAC_ADDR_FILT_RES;
@@ -192,10 +157,10 @@ static void enetc_sync_mac_filters(struct enetc_pf *pf)
 static void enetc_pf_set_rx_mode(struct net_device *ndev)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	struct enetc_hw *hw = &priv->si->hw;
 	bool uprom = false, mprom = false;
 	struct enetc_mac_filter *filter;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	struct netdev_hw_addr *ha;
 	u32 psipmr = 0;
 	bool em;
@@ -214,7 +179,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	/* first 2 filter entries belong to PF */
 	if (!uprom) {
 		/* Update unicast filters */
-		filter = &pf->mac_filter[UC];
+		filter = &si->mac_filter[UC];
 		enetc_reset_mac_addr_filter(filter);
 
 		em = (netdev_uc_count(ndev) == 1);
@@ -230,7 +195,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!mprom) {
 		/* Update multicast filters */
-		filter = &pf->mac_filter[MC];
+		filter = &si->mac_filter[MC];
 		enetc_reset_mac_addr_filter(filter);
 
 		netdev_for_each_mc_addr(ha, ndev) {
@@ -243,7 +208,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!uprom || !mprom)
 		/* update PF entries */
-		enetc_sync_mac_filters(pf);
+		enetc_sync_mac_filters(si);
 
 	psipmr |= enetc_port_rd(hw, ENETC_PSIPMR) &
 		  ~(ENETC_PSIPMR_SET_UP(0) | ENETC_PSIPMR_SET_MP(0));
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..2b9d0f625f01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,18 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
-#define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
-
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
@@ -52,8 +40,6 @@ struct enetc_pf {
 	int total_vfs; /* max number of VFs, set for PF at probe */
 	struct enetc_vf_state *vf_state;
 
-	struct enetc_mac_filter mac_filter[ENETC_MAX_NUM_MAC_FLT];
-
 	struct enetc_msg_swbd rxmsg[ENETC_MAX_NUM_VFS];
 	struct work_struct msg_task;
 	char msg_int_name[ENETC_INT_NAME_MAX];
-- 
2.34.1


