Return-Path: <linuxppc-dev+bounces-5131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E065A0B168
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm1S4Wm8z3cXn;
	Mon, 13 Jan 2025 19:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757644;
	cv=pass; b=LX8C0K6YEklTkTt5RmnGGCEDMTHLpwazHp2xciJUKODvLdZWMs3oqaWVgieIW3qUcg6Vy+2eqMkHQMPcFMIF3D39LKJUIJrSe/AZb7qAGodhFPDVZBmD/x7NAqSzkcl5+696eRQjDnEKmYqAEyjzNqY6m6pHB5hyVqkJdYBU7g3ur9ZK8OMnDDAIzyx1xyGU2yzl356aAizRxw33dWKgz9xCQWZ1x0y/MVw+nRZnM4zvcsfUJLq+UU/0S/nSIivIVa14yrJQy5fOUmLa2OZwSt/c2yiA93fimQzaNoZ3zd5MNARtXrEE+dtSi4iPhkh6+BWMIm0TSn4fh24suXeAiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757644; c=relaxed/relaxed;
	bh=pu6ntkLObRIbz5+7oOeXDOyf7hzrTA573fozhFELF5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIUqHWNhIPReJ4J7+bl6d7/jPRgQTDL9PzZG9FmE+xcYeAA+665AwJpUiMatpa0i0CtDJc1SepHU4zjr/zyinsizRe+TyP9/znb24KK1ePYoGP8p36j5ld2wSnHpCvKJLXwqpOT3VS9AJTYncykidEtFuUPePD5rvgYnQVLB1uWtPIUxqpzORu9Mn3nFLgmERdR9uuuHUsK0OhVPWzoOWFSqvdYI4naSAwX+25fDC56O3kpo50cUdreqZtgkcq/Bv4NpmG9O/cTR7f3ZP0GifP19IZs6oczEGEjlAkT+r40D2UXWDv8Z/DMwG1nrov4JZD8vn93XMIY55rWw2Arhwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YcileEKc; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YcileEKc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm1R53MYz3cXv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBr/jPq6w+XWIrOccq1WU72pXqnQdPXB+SMZvXzKlMSbtyl35kXT1PfSsYN58tWkcfhp+By5iJXi+E2qNuuGBJsh9es8LRPOttPXx6axpqYcNi7wTKK5lOKvy3NRfXtfehqKX8YTxkSQlh2COPr7ZpJWx1Y7/UlPUN3kYz4gbWB6woz4wpLjMCpzvJB+BkEKjhQYu+K6L/XCMYbDgb2ZYNvyKBo4XAqqNNOBM7axASWlsBYau3+bMHR84w0ZyYLpzPf8BJkwU4Grnu7kvMolQ4MvVjLSRywOG6aYI+T5v2lkOZOA8C/WPlDFJNS24PTHSgm3udVdLrkPPlruvEODtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu6ntkLObRIbz5+7oOeXDOyf7hzrTA573fozhFELF5A=;
 b=fju6m2d8NJECrrJCVTrkVqIOoiKW8e+K8BojBAs249VlTrNOnYz9HPrG0x9F3oqKPvnS6BhUkdV5w6SXtrvcHRRXgZTWujde0Iup2kHg/KTut9Vlo6UjT98Ccx1rl6zxXyYBg6w168UkM2M0kE5+v2dbw+Q7WoDk/enF3Jye8zvTY5BzaIst0QWoubPHqvy2DAfw5mETkidm/AzL6b3tukVZBddGUlDcXdB1fPktb7ZwYS9J4w4/nInkc1Xh6mLOtkJZBCy4Sfso4C7+2Jy1uZJOIIky0UDPCdApvOy+RS15sEUS1vg0n/UVeJO7S4mLmxsjS2v47AXmz1lnN3jVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu6ntkLObRIbz5+7oOeXDOyf7hzrTA573fozhFELF5A=;
 b=YcileEKcY+pu58Yo5h3zIev6Yus+hgPDuFvqpTKN7EYzbMMv1ybo0njPfQZeuXJnKcHcW2QOxW78ZG6k2hkFMeb/Te7fCi+Z/f9kWB/EQj8aEE9lfiiGlWJoIC3WcCe+6JiGrIn7EIWlp1WD+lpMLK87xgHBQUA9Jq7qkURM7xVpkFphhADMb+nl1kbbYPmI2vAvmVE9yRllc6VXGFzBiDw2ZRlKx5PStyRXOmxDsNqgJsll7NK7S/h61dhUgQz5MjpNwHwsXqMSPPdmNLxga6aS1QVg7Atie7iqmmnayi4SYszo8hNzp6CpJiRBXkt3GbuGkMd+8/G1x1wvnehr6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:35 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:35 +0000
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
Subject: [PATCH v2 net-next 11/13] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Mon, 13 Jan 2025 16:22:43 +0800
Message-Id: <20250113082245.2332775-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d394f27-ca88-4043-0b68-08dd33adf28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6g+W1mgmdfN/S9v4A7wUhBU4UEJGmnMjRcpzN6MjL8lmQQ1gjUA7zR7Fg5Qt?=
 =?us-ascii?Q?0sVEdD2y3XLV9c/sxFiq+1riUI7aqwWU89bat5mobkC/Sni8neo2VKBPbHgG?=
 =?us-ascii?Q?dACFRNjZwvFfrJc4oCpzWzDINWITmQs1jdDUeqhC/E9mPiGqmsMl82hG0DyW?=
 =?us-ascii?Q?burbcYX06CuRbaxq+XpFRcCUZLTf+Jx+Pzp+3BOtsZdPkOuh7T+RDBHWcCr6?=
 =?us-ascii?Q?2qE/Hom8BPlFANHHQr/ECcg4Rf42WS23DWBQ3de7ZIkNZByD50jl9ZeKbMg2?=
 =?us-ascii?Q?gAUs2FqRDqMw9WQj4a/Dc3vYj2KqGVuk0i4/8Y2iZjdsqZVi3JZtjzv0+AEA?=
 =?us-ascii?Q?SNGniFq3OkUGEbz+z2ArswKQ0J44Kjzyi/lWiIMqwQpUY5ohjLLuEkot+dRj?=
 =?us-ascii?Q?yquAu3+tiB+M6NCvCvP91TEdyRQqjreoGJaUPNv1CiTutmyIc8QSrNJ/39rA?=
 =?us-ascii?Q?nF1cjJwkN1rbDQv2f6ZYxl05F8AnTzBIfp5oBBt1pHExKuIaW9NjVDYdp6Jk?=
 =?us-ascii?Q?J2VXUR38hIsxgdB5twos3adloyRfk/FLB0S3vnwgcoF7cWrZiFX0jNPJsCqf?=
 =?us-ascii?Q?WhMZyTeX+9EJaZHh3s7t8Tlqa/yHKGY2uQp5I6EjfEgXSYVxFDidteAPIPES?=
 =?us-ascii?Q?EQbqys/hvPgBBtMgv8vCwp61N50an7IjSYvgxxgNT/ugQ257o6ys7methjpy?=
 =?us-ascii?Q?LKaBWowW46c2jo/SMQuEEXy+YzR+xKxIoDX0n1cBrRPnSZrNhAWJjq3DXxV0?=
 =?us-ascii?Q?MiskQshi6NY+8eCuUCs/IvIEq0j49mHDzK4YsCJz8WTy6FsopKZ2KLRGjPfk?=
 =?us-ascii?Q?wF7EnW2d1hF+KTXmGRiGb+GCTsvFvQm5zVi0vQsAYXhHm1ZoJJWD+xIwqW2e?=
 =?us-ascii?Q?dg8jqW/tyfTW3S6vGtqp3XLVcIty0x+SyhkHW/D8/Rp+O5RMcDHFFGGrhYu7?=
 =?us-ascii?Q?ogY4HEmVXNzX/a4+5syDyVzSWzPGZmYGXaeMf+efjfjsL20m26n587f+fPjB?=
 =?us-ascii?Q?kvunPgSuc4s9g9htJ6ceA0QSyVGdOR7qd/HXuAr/mDWT7b2Os8WcdkUX45m/?=
 =?us-ascii?Q?2yRY/KWEOycUtEQlEDlAJySCT90i3Z+Y0bIACuI+3LvlMwUD9MJwCtGyAUnU?=
 =?us-ascii?Q?8bxdXt8grTHT9WMcSxOF6e+E/xiDN9wq2+AsScjmZstTPQKjpQtRVWzr71Oa?=
 =?us-ascii?Q?snScWQdX1/6wpwye1cDSQDnf/JYX9jQmdQoJhvwUKpi6x0Th8vs7h2Jfbg0U?=
 =?us-ascii?Q?Do7bGie8/QEmY1EmD0fhw9ce+ohhdQXRZcdEvTpN5jeIUF26UqicvZpnXTaj?=
 =?us-ascii?Q?3D8JEnV5LoP+U5h6kyp7YaMTIvfPAJo3fJXEEN0x0eAFaVw8eaj4K0RdIV98?=
 =?us-ascii?Q?c17xJWINzGO4cHH+7x7BpqwKtkz0nJxQluFimwNDtl1Jdl+kM10kNDVH2xa7?=
 =?us-ascii?Q?2cpvszelXOVmVDrht+BQCr2S4tY1yhuC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wfDwXewOTeGSA7N1LdQv426bXlayVKxIwVUslkrjcjYdXJCUgct4vYv1NFHn?=
 =?us-ascii?Q?N2ZvE3dDSZAuOZjvgUxCtUdP3PiELmeWWpQiQ5v+/qWHxfbJmZHlsdaag45+?=
 =?us-ascii?Q?hWEbvOkwLux+h7+DrfePwYj5EqYuVLAgPpchTmyJQSZrXCNIdBb8ATbpsogw?=
 =?us-ascii?Q?vWqosB2w/ODiTNMypVgDLHjguA/2j/V6o2aed+2FLNjX6UT6Q6DATNd+bxbl?=
 =?us-ascii?Q?n4d0uQTN9R5BjAElNxO5qwAtJZbYajCR61y4JzEpWvYRc6N2MK2OUQyKU68H?=
 =?us-ascii?Q?fzruirW5K7BDgOVq6+lzspGpwNORjj6VQwuUEfGNNXLYgbP9IgC7+zqN3uLA?=
 =?us-ascii?Q?G9atMLqJZ7drc6aJHo6uiMwarue7n8vpha8d5xsJOB/gk6YcMqWnAA3Gj5RL?=
 =?us-ascii?Q?fGa/0RusQoAEWKGWq2ZGI9IQTXEblo0iwbSpVjXZMwknnfnIGRhY2+GcgY0v?=
 =?us-ascii?Q?ijboDkPdhdMYxWdr5pZGe0MFo55sdjcaMEc5zFLI2Anq/8hEkURzhIJmC7Y1?=
 =?us-ascii?Q?tusAxCMpCmkyb1ykbiWvLoNbnFgDwuPB+4Nd6utz2cgYpFZJ8nZBcD05qChM?=
 =?us-ascii?Q?2gNj/+TSVph6EUOB32O7AZxIK3wjfOlwFVK6emRkKHG5MY2ySxvySjVrOZqG?=
 =?us-ascii?Q?TBZk6hdyJDdzlWuY/wds4DavT1+DZLIgILJ+4tCL9hqUz4fTiPO8CUCDPdPa?=
 =?us-ascii?Q?I1LV7FErUcLaoGchrYbwH+9PqQ4jVzlxAGhMQcWpe91VHzkieOtKOCN+5yd4?=
 =?us-ascii?Q?4eR4MkTRjUudnu93OitvY0r8fKoH5BztQ29uFW77e39WPd8ozHl5Yguuu1JK?=
 =?us-ascii?Q?lPGC/Lzcyij0TFFknYVHXXC1/A6HmBIcvt8cuX7X3VMEXdHdEfEMJNlhSdWU?=
 =?us-ascii?Q?W19kW32btVnqYmeb+v0pc1Rp8qVPC9jztuNdD/amXwyMBLU5+c5vLwrWrPoa?=
 =?us-ascii?Q?u8CUtJKVaIOfE4ujlqS9WozIbttrH4rfBOTy0Y4QyqBMPw1pqL3bnnaMo7mU?=
 =?us-ascii?Q?Z34rxh9Te0YkdBrDeYb/TNXEMCY5z0oNYmZy/XKdF2WU6hpmV6I0cGCuxCCE?=
 =?us-ascii?Q?KCamG73+/X93f7CukDMva09mHe5HrK9S0MMxUGFl9cYzKYuwHc8srwLdvQFa?=
 =?us-ascii?Q?ZRZWQusTvLPOP5FLKcrEiTBQibDsiJwR5gyuKxEBCIZA2AKNhr9XoD+bX0iN?=
 =?us-ascii?Q?CuSik2wjQtfArTXm+e5mf4bwrUhItv9f2aJfjgYyobdltdbDVciU5JbB7MUA?=
 =?us-ascii?Q?CxKbjZw6Nj24OeA3pRW3skjpxFw14h0bJGc42KIcyTYUQ63mtb6OgOWIXO+A?=
 =?us-ascii?Q?M9wsPMvBsK7e5jaeCT7XEBu5Z2izbNQCOS2Rm7cTqFdljWmuSX84ELJuvx2S?=
 =?us-ascii?Q?oOdqlpeQvyMGMe/ZzHG/bDEaXwtHkmMVfLVYt+hzKZdL7ortD78CaxE3v+5P?=
 =?us-ascii?Q?Ix47660OgIqZfdyPHVRo5AZ8pIvfOjBChJHaoM/cGyUxjQ/YIUYozJn3wuAO?=
 =?us-ascii?Q?dduEmhBtCq/qLgf759mxfCFuoaFMIpnfyBwTJJ/sfUl4eTQ+t1mOX+Ln1iRs?=
 =?us-ascii?Q?2kgmk9BUDWyaLufZFRJm+QhzOHPN0a6enK4DdwWw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d394f27-ca88-4043-0b68-08dd33adf28d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:35.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l1N7f9rmEpRhNYfD7xx6jcNe5BPvchJjQTulBkZf7GT21Td3MmmjpZm/XKwSS2uKohMeArK/TDKyP5/JiEbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add VLAN hash filter support for i.MX95 ENETC PF. If VLAN filtering is
disabled, then VLAN promiscuous mode will be enabled, which means that
PF qualifies for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.c         |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index adb5819c091f..65e6e3742ada 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -85,11 +85,19 @@ static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
 		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
 }
 
+static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
+					      int si, u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIVHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
 	.set_rss_key = enetc4_set_rss_key,
 	.get_rss_key = enetc4_get_rss_key,
+	.set_si_vlan_hash_filter = enetc4_pf_set_si_vlan_hash_filter,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -704,6 +712,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -717,6 +735,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 9f812c1af7a3..3f7ccc482301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
-- 
2.34.1


