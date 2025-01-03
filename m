Return-Path: <linuxppc-dev+bounces-4608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA102A00442
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:24:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYS618ZVz30RJ;
	Fri,  3 Jan 2025 17:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885430;
	cv=pass; b=d/WKOhd4YMMcMa8EaZexYihEj7TN+XjHhmyEcKuOVgBIRIBtAvB91NW9cBz0cFrKB/r1yedYyFnWIyADJl+bN2GYrZpfwtd09TGhRkJv4HPbi7XH6e/BPG6NNuq9VCvToIC7RW3PDruzdjvlaKhAt0UCjVP0SIZCZHQnH6sqDb9l27FueQKgfcQCftyOF9JURWln7tRu3cBSal8rUQYEmtg2ocv4fNnkBk3GLgNZtlalTdhqt7s3oWZ0MD9Ms/M2AwCGVhzhy5Yq3aN8/7YjfZf51gwy/+15DC+NU8jgnE6OvFwB+w4W9ZH8mnZMS9Kp+LPIs6qMvw53zM5R3d0jXA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885430; c=relaxed/relaxed;
	bh=9Eut/oSc+g1Go8gtsL2w0y3LR6sstdGSy8Cm6RIW0js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NnaAjusNsRO3mCMQF5Wodpap87VL5DYTSRyjbyk5UAH0KmNRI6fF/ilDwxdVt8R29k8s6ziD+Xh/l5JT680dJJVMe4ovZU8T3P8C1zKPEckjg4JL3dVADE5rGVOCh4ECsgt/ig5Y+52G5fW69hfQ/fIOkzxA9SLQ7hT2r18yWRhGl/4/zghFtBv0NG8lbe4tK4Fl1luf0P0ytSGEMDZtc71TRIV7090xjYhuDBLOld3u8jjacCMvlAxFwdM4qX2A+AeWkJCA4D4GKUWvCAl6wdSZRaFu3+vkV3eLBfUS2tebDIIm2Uqg0ze5l55YNGfk6RA2pHpeYhE/6JPUvH1/BQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h3rvB4hm; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h3rvB4hm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYS53dxMz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXfkquVZQNNLKQ1WslJXBNcUtHG71Ls6ULNv0UYJEgc2ZhJLsV4FAAomGGQQfxFD76H1fwVSBHthTOz0M2hUXJxhI1PlmyCpnafTTB4wARKvO9rEv6Hv/HfThLDvcioJQ75HdO9GO/0C6YPua2At4d4Hv2wPkoES9u96httXWqNaIYVnTvs5n8QwKzVBuGKm23BSjR5rI7ywZ8CgsnWTW083RyfcSJARzk+HsBhsk9xjLtc0gJ90AfAsQ6UmduckYWOQB8X2Wt24BSll2LbTNAqy+5nI+f5VlQyo9ZgEyi4TxpCzHdHcGL1JXaWMTQjHl69Pt+xUc0vAvBBxMCy3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Eut/oSc+g1Go8gtsL2w0y3LR6sstdGSy8Cm6RIW0js=;
 b=nw8dKiD4eDW4YKKwtAWO8LTlriFwI8mNNsfsjOY2r5jfXoQVOHxjw9MNvGcafQojCKaqXwkEm9ikVuq48dw7SxSYJyUorzyOd+SW/xqxycEvPp6dmZ3PX4AM5Z/+LWcPtsSHAKLWzNVyM5cT3RKAD87IG3XeQNqqnlYs5AaAJWFkHanLrU5D84j4YJ3VeaDSLt4X42V2FqfDPTunPAVvcw85iEn8fUCm+3sf/WUE5/qVu+ZR8vuFbtK7pIHoHe3ZSM16UGEKI8iPmjkjjNaTD7z1KBgtU6OmfF2SJETPD3EZTb+L/k+YKlrRvzVYTe+sXRbGiqHNu+qiOVhivc5JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Eut/oSc+g1Go8gtsL2w0y3LR6sstdGSy8Cm6RIW0js=;
 b=h3rvB4hmnEBpc67ekHmNNXrJgpnBGDRatfsVCIUmgASACn2VUZ9cqholf8DfRFAGaELjBQ5/bEFaKvSBKAF4YMuFIU3wgRgaJnAtDmzjYD4Qy17p+JFXEkOuRFdpTxSopCuJyP8rZbNoZUNyRYDegty+GiO/0Dogu8gVZycBQEqbdx4XpvfMOmXScF9XqrQI1lCn1xpnoKTcW6S3kCDuPqJAzcxLy2qYVeYRJhMoG3ctwruAdBQQMrwhJiAPmpUJ+qURrqFhH2v6fXpp4aiZ5FynZj87WUXzB2KrkQTPwhqllAtH8Cq2C/CpaXGCu0rlipNWWO5kuwk0c642gllaYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:39 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:39 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 09/13] net: enetc: move generic VLAN filter interfaces to enetc-core
Date: Fri,  3 Jan 2025 14:06:05 +0800
Message-Id: <20250103060610.2233908-10-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 467a6731-1647-44b4-3985-08dd2bbf294e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?//Zpj8AWbLfzMSm65y8+qvW9PpznK0+PQhE1KvK03OOnWkpeSVmrMiMD4Q87?=
 =?us-ascii?Q?hkg6/s+XFrwOAgS+8L6pz/DqHeOTnAq8ISZ7/PVndzAUgQ/0LJnWPDtxAqlo?=
 =?us-ascii?Q?DRKqcond4tlqwLhUUzarZ76okXgxJ4zdJAWJR8gqJRBTVki0ZSM99umL92DH?=
 =?us-ascii?Q?10voHk9nJWC0EfwUHA7hfV4uWvpAZ1KiXGPM0Zh8pJIINyHAqalBPK3VEYYz?=
 =?us-ascii?Q?f2DIRGTyb/boM8qiNWaTX7kxPUeJDaXQPZI9B6NcIZIZpqj93x1C6YOCFog+?=
 =?us-ascii?Q?7v3+U6QLann4gTQlQGBFG57sHAdoYv5wiY1b5L/Om+SeyZdNqZZOhFpkrxPG?=
 =?us-ascii?Q?kpztSVpyd4/qh2w6EPn0Dml8pVKpdqfM2N7nbd8ooJv/BHbnb2HduBKptIWd?=
 =?us-ascii?Q?wPnGLUCI9oJM9xT9ZxryoUCO1UjOMrG08NIeDxYMOsFpZ+Hurs6E4kKBF7Hf?=
 =?us-ascii?Q?tpD48xDVrIDOp3lmj9PgEXH7mn9KYmIGMREnWDCywkoqEmiGUbvLX08CZuXu?=
 =?us-ascii?Q?ksB5Js/p3y+s1B6k2MuBndYxQU9Jw8AekO7hoYAfRXmcfda1NUFZ1DL/K5nQ?=
 =?us-ascii?Q?VGHGHnhDkmtWl6wjRmpvYBaYOcJddop+7Dj3d3Sqr97W5UxbO6x8huFSB/je?=
 =?us-ascii?Q?GHYv86BBo2Eg4RCmJqqfUXk3NxI2qRDdcbcz/4hBwW/fSesTzM4elrlI/xbY?=
 =?us-ascii?Q?81h7a5zjnDS4NbbIgvpNgUKa7Soo9bU8PYf3Eecnx/IPBIz9wkfZFh4yxhsh?=
 =?us-ascii?Q?oZxpT0AHaiWqHgXcJI7CMlisUp99jLJgr0/4phPKSrE/OT78vceFq6QB28Um?=
 =?us-ascii?Q?PzIeYrFWPdSJeb5i5PW13D+o47ZdvWnfpILxiQpu3OOrG+katv9y8yXq0sDz?=
 =?us-ascii?Q?xpHIsJpMgrEvYwBfCx2rTDJlKpGlcWVtCGp4/Ngv3X1sI/fXI8OiJZ7SEcJK?=
 =?us-ascii?Q?YuB9rwGqBF3MB3xoJHOKH6VQY660p4xCQ+kvIx73U2wb8nFdY0Q9BU/ykV8n?=
 =?us-ascii?Q?zpYobmvOSp3kxJP2PW8Q2AbYApJeU/9kbiwc6FtFFBtIAqdzioBEGDFG2/uh?=
 =?us-ascii?Q?B7tqduwyo70P+8NYZ59WX1eQjysl9iwImEuangHEc0BwT3DLuBB8t3BUuYRj?=
 =?us-ascii?Q?uHmGG/LkeKnDlEigH7V6Mvd/ZbgNgBa2C1M2lT+XaXSfUW8Mh3jm/up62KXa?=
 =?us-ascii?Q?lA4D/XqrSnBT+zv8ufrDYveam1G3XbRTh5HAsuVhr+w2IgdudMkPNc2d/c9I?=
 =?us-ascii?Q?aIvIW0uqQmOSPi2+UzoTpikULkg7qGeOGkgO8zHkn89YRgpegeHPDj+iHSq0?=
 =?us-ascii?Q?fZIXRvEZS8QhPs2h8dIpPSg83bgEslOlDQDsaqgSlheAR6api4PktKZdK1h3?=
 =?us-ascii?Q?1178fg4cs8IXUqVy7cqMhUFaaAZHogq1JZ00Rfx9iTbDqZn01GcaAek80WLr?=
 =?us-ascii?Q?6R8TBYKtlSr/cDLHx2hz9otpTqKGXQ0a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?syf3i25/DVCfNlJ1a/Or9x2mtqh5UDZ2C6kK4kKjXoWT2iAHk90uYQhZxC8y?=
 =?us-ascii?Q?H7HUuf7FyXljPtcKkWkQRYXFVkJh2rWUzHlwA7BFW49tQKwZZ0+4barpg/HK?=
 =?us-ascii?Q?xtiYUMsYuUPvPajUIK8ovrEwRqpohR3SrGNbiNOE8P35sBUbcz6ZCj+Lx9fU?=
 =?us-ascii?Q?vwYx6IJ9QH8YZYa0TcVsXiKZx4ON3I0LRphzfCq4SHcAEdJNHZaLfH0czZVx?=
 =?us-ascii?Q?QDfCMyDMw1Uu7W+ODQWhEtbOsR28udQhOSM4QqdXZX2zhqM2ZcVMR2oQXSjM?=
 =?us-ascii?Q?QrJeOrHOf43MQGJFcvyAgwhRKxWyMYOsv4jfKbJHLWH4LMRLykbchKHBZgv/?=
 =?us-ascii?Q?4W37dOs2Bj6kJiu07RUQkJJl3T7Ki4PF14puFI3DZef5+BnIbdpZA+Rn9pd5?=
 =?us-ascii?Q?Ws+7HTIjF+ruaJ7aFjSks8GvJDlkTiEvdjhTVP3xWiceA2R2xIjYVSzTHa9b?=
 =?us-ascii?Q?1kBmBx8nUEV4GtEuw2SH+Z0GtF0hs97ibqy/JqQZpY0ER3YIR1cGdimTYbuc?=
 =?us-ascii?Q?EvthA+clKk3UpE3BtZCxlWQg4chcQCVCZfGpIDrLZeOq0qnZlCL+ZxY7ZzXy?=
 =?us-ascii?Q?zOkH9VbzW+ZeXAvNSVAurlM5vLyVgOgoyCymWVL03lmD+EEONbkUntc3/dfV?=
 =?us-ascii?Q?A8XVfMA8mQNQKzMuUtrLFUQqZQ6+EBrnZv1g7LlfYePVjHX37rnY9J8bvpLj?=
 =?us-ascii?Q?cVnkAe7AeaZYy3hcdsMg7ZcCQ3gCJUen6SenkoYjyKpFHKyuwl9bMye9SqES?=
 =?us-ascii?Q?7s4ojuONOjvVvS9oRnDTIEhfHlN3yhcw+we2jE0qSPd7bpVB0YZSf30w5Jdi?=
 =?us-ascii?Q?x6WXpnPnBJ0t2GOavfcf301jMQ3GFdde+cpwYePfTIbQ3/uqilqtLoozbMYh?=
 =?us-ascii?Q?Nn76B4T7cCxnOixhsh9ylYkPfQP61B9u1JxvBUDC2YIMPWg6zC/gjC2PqSjA?=
 =?us-ascii?Q?K08H0LLkau5gszE7BrXmRV7K+5Sqs0CHIyzpY1b95uHwXLxWyNAj1zkvWCGS?=
 =?us-ascii?Q?Ec9cOLGF9fBS6ftaObE6ZlbF23c/H38WOg0shvm4o5Lc3tBi2l1f1cCiOil5?=
 =?us-ascii?Q?LQixLAJgQCw/SIxdGd5EDhEvEh4YW0MMjqpohAxfmAABstXMMgSejsDoIOob?=
 =?us-ascii?Q?qRxktU5vL75DXnI1KIqNAx/f92FCyUWEexwNgyb6rVqO/7dUw8iBPZjLRLu7?=
 =?us-ascii?Q?nwh/movFu7FgvBc1JYKLKrdxcwzmA9eyq4GVuMKBuk1RFEI1EG/ZwVh6gGyO?=
 =?us-ascii?Q?rw2+p7DIh5G5/hYV4C/fLJtu8g1a7W1Nx6IguSWfHuwQBkp/JQCwlxbeCoFp?=
 =?us-ascii?Q?HblSuABZU6kne1zXBI1rScyum2vPT4O5pvmCIHLL7/z5FNaxhJs5Ayid6PYK?=
 =?us-ascii?Q?bX97WC69C9Pda2wYDBymh+WHBVMMzQP5mp0f5yY4Z6inLNnTysnFWQYejJpO?=
 =?us-ascii?Q?vJoAOWhncDNOIV9gG2wQnsi9d9szQZ1NyM1RqDX/DUsUS8n+97lM+e28RDkP?=
 =?us-ascii?Q?9LeN2LMQdEG3MJk/VAi7Vt//4kohdgFE44JtRxzIxm669MMHjmSLhoWpeZqH?=
 =?us-ascii?Q?EssEeYPGAdwfyOW1B9Mq3ZL8Yu7hHIAeMC5QNE5R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467a6731-1647-44b4-3985-08dd2bbf294e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:39.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35x5gljgss/Z9rfwW7x6pro4vi25ENKo3r49yCVToWR9G7Z/BWa0Zr+5UqJJPvgv7L9WZ6kjzSEUyKgTqrOwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For ENETC, each SI has a corresponding VLAN hash table. That is to say,
both PF and VFs can support VLAN filter. However, currently only ENETC v1
PF driver supports VLAN filter. In order to make i.MX95 ENETC (v4) PF and
VF drivers also support VLAN filter, some related macros are moved from
enetc_pf.h to enetc.h, and the related structure variables are moved from
enetc_pf to enetc_si.

Besides, enetc_vid_hash_idx() as a generic function is moved to enetc.c.
Extract enetc_refresh_vlan_ht_filter() from enetc_sync_vlan_ht_filter()
so that it can be shared by PF and VF drivers. This will make it easier
to add VLAN filter support for i.MX95 ENETC later.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 25 ++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  |  6 +++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 46 +++++--------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  4 --
 4 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index e27b031c4f46..8b4a004f51a4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -72,6 +72,31 @@ void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
 }
 EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
 
+int enetc_vid_hash_idx(unsigned int vid)
+{
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(enetc_vid_hash_idx);
+
+void enetc_refresh_vlan_ht_filter(struct enetc_si *si)
+{
+	int i;
+
+	bitmap_zero(si->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, si->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
+
+		__set_bit(hidx, si->vlan_ht_filter);
+	}
+}
+EXPORT_SYMBOL_GPL(enetc_refresh_vlan_ht_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 2b0d27ed924d..0ecec9da6148 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -24,6 +24,7 @@
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
 #define ENETC_MADDR_HASH_TBL_SZ	64
+#define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
 
@@ -321,6 +322,9 @@ struct enetc_si {
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
 	struct dentry *debugfs_root;
+
+	DECLARE_BITMAP(vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	DECLARE_BITMAP(active_vlans, VLAN_N_VID);
 };
 
 #define ENETC_SI_ALIGN	32
@@ -506,6 +510,8 @@ int enetc_get_driver_data(struct enetc_si *si);
 void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
 				  const unsigned char *addr);
 void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
+int enetc_vid_hash_idx(unsigned int vid);
+void enetc_refresh_vlan_ht_filter(struct enetc_si *si);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 59039d087695..c0aaf6349b0b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -222,45 +222,18 @@ static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
 	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
 }
 
-static int enetc_vid_hash_idx(unsigned int vid)
-{
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_sync_vlan_ht_filter(struct enetc_pf *pf, bool rehash)
-{
-	int i;
-
-	if (rehash) {
-		bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-
-		for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-			int hidx = enetc_vid_hash_idx(i);
-
-			__set_bit(hidx, pf->vlan_ht_filter);
-		}
-	}
-
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-}
-
 static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int idx;
 
-	__set_bit(vid, pf->active_vlans);
+	__set_bit(vid, si->active_vlans);
 
 	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_sync_vlan_ht_filter(pf, false);
+	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
+		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
 
 	return 0;
 }
@@ -268,10 +241,13 @@ static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 
-	__clear_bit(vid, pf->active_vlans);
-	enetc_sync_vlan_ht_filter(pf, true);
+	if (__test_and_clear_bit(vid, si->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(si);
+		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
+	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 916818d2fdb5..d56b381b9da9 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,8 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-#define ENETC_VLAN_HT_SIZE	64
-
 enum enetc_vf_flags {
 	ENETC_VF_FLAG_PF_SET_MAC	= BIT(0),
 };
@@ -54,8 +52,6 @@ struct enetc_pf {
 	char msg_int_name[ENETC_INT_NAME_MAX];
 
 	char vlan_promisc_simap; /* bitmap of SIs in VLAN promisc mode */
-	DECLARE_BITMAP(vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-	DECLARE_BITMAP(active_vlans, VLAN_N_VID);
 
 	struct mii_bus *mdio; /* saved for cleanup */
 	struct mii_bus *imdio;
-- 
2.34.1


