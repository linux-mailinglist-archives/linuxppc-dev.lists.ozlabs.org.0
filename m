Return-Path: <linuxppc-dev+bounces-3769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0139E3321
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 06:35:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y35nM0pjtz30Tc;
	Wed,  4 Dec 2024 16:34:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733290487;
	cv=pass; b=Z+Y3wDvjmsM+1U3o2rqwNL/Ed5aoJ3VBU1Fugp9Jwx9RXCWVDnYMuWwhVJ0+bk3NdXWVHU4G0QgQ81vGvJXr9Cx0CXhKCauAJIMCveXbH4/lgDkuVcanf2kFn3vylGBXr7//RYu6bRXKSBpJGelaHaYzxmwAtrroHwfRi/amZhNscXkC77o4XIebqXa6QeUmrx/OekIQRtnJJnqCCe0FdNy/U7YucppmmuX9iPL0oihT+P1OO76iekhXr/WcLuG1TtaEBiL58rI71sOeDfpMSm6o0OLKqmSZH61t7YTNL9R6ve+HjAZA6ZZ9KRv9S4jhtImC7cVP3KCXfh2uPmwx0w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733290487; c=relaxed/relaxed;
	bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l6UCUwfb9kZVRok+upAT4LQcHRI/pxcdar/M2/zThZnPYsqmk2BWIjUnQr6IsoO/Dl3cdnlDGr4lhdD3lO9mwjDap/PXUZ5ztLOSWhqustb7IVYerXGQH+BCg5d/WCcMc2C26O/AJ995pLoHbUtajcx2g05jaPi+Hp9n8QgrL8ertBnkCiXSPuYZjTw2pwjgXEF351nmv0YFDiEVCD8urQPg4kuRIIj9nQPjVREOFjhu/8P+Suj4MkMFSPFwkQmqda4vuGc7NlRMYqMYrqgFrwxTRYvjUipYiP4E2KWn4270XwBckDdsY+6OVTRpXg6Z/OU1C7QNxLDV5kZezXgTRQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fmq+g5SM; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fmq+g5SM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35nL23MMz30VF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 16:34:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXefKCdMRiQZoNCJCnhww9AGFrdc7rScEBrGPuUXNE7mkxgW+cpThA37oGYEZ1mOgfY/ZzxISP2/qYyJ52xsXOClbc8AeFpucXUsYfR3Ib+uj9vQBo4yvJTBKyg2nr60MndmjiTKnqJewATTx/zON0yaEBcqelIcwMZe4X2Gz3O/z6ETpLbQ6wEfJMEPh5uYLZ0E0ADUp48AEMS92RbptKUNujmrfgAFpFxweIxbri2z4yzIgkrByD5y05i4FAUz3l/rd+3SqO46c/wcnDfVjOyH7Rdt6xyZA4Xy4AtNINGCuI7nC76NdwVJFNPqD0bFE0J7YgZ2wJhubNQSxGI9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=iJt0pOWKl+gwCLQxnazJ6Uq/Z/xliqqmbLK0mjzVlgoKajXPo/sDK58PFMo/ZXW24k6JGXwxtPgTerZSoWw1y47hwAIiSozNBgE6nUjqNiZbROoDUYMtfRpnS0UA5yR/MTiUsoAg5EMCvyAqfEKR1iKDagPNe43oCckkpb/obb77yjTHunkUUnOAdKdDxpj8AzA1/b0tdZU2Ec45IqAfwWgpBzFRpDPttZjZJ/DXLzgcVSCo8r0m6vXIejABCGB7YoI4FoeG+zhAeiHykE5NelaKTpJUA4gNeAPHczAhvWnrL6heKP9RsyHUx3pQoiK5HG++3R83vB77yYiMboueow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=fmq+g5SMmJhgF3FRGNA9de9DDqt2cximP3nwIi0aybYSJra07YrLQ4OVzIDsXouUlu1x7ZEtdk/JFncLKpByfW0Ap/amriLm4hCNceHcyxOf0OEZQ8VNbfg3m6NW006LwPKSaBEVqTQCAlPwBqzDc1XoGin00EdZk8PFmj69FqjL5bz51NwZ4gsk93oGj+cGZNx7m6wLXnDdPSNI2D0MVslBix3d0sKwRjXgGeeoqniLhDBRCiGf6YCod9nzK7xbEndbNMzNh1cd4BVsbNsNQs8xu7pPAcROC01b0EtASswhwk3onWfRMyFdTbFsf5HtQiOobBxl3UCqXw9WMJ8ltg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:30 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:30 +0000
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
Subject: [PATCH v5 RESEND 3/6] ASoC: fsl_easrc: define functions for memory to memory usage
Date: Wed,  4 Dec 2024 13:33:43 +0800
Message-Id: <20241204053346.1865723-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 910e8d5c-561f-454d-8d22-08dd14255351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NVxdhwZl8ANEtNr70YHkN9i6RRHpmIgmxTTJ5S4IaufLLwgnV32Crg1QiwGP?=
 =?us-ascii?Q?e//Sr/XY0BmpmMA7jwJJzY8+C534vlJ5mwVyT3rU5XZEAXyA2EtZatIy9IvU?=
 =?us-ascii?Q?vHk7zxeAZ/vqIr+mbwjrqzxfsavg+MxmrjHbs3J1i6PPiIZfc7mjodu6LYam?=
 =?us-ascii?Q?Nt8q1qUeb0kzLbe7HvN3e/hRp/tf9//18BaF8hI5OHn/ZRF3+xhMVm7+xgMF?=
 =?us-ascii?Q?iIy4Cmz31pe6meM3ulBP3JF/W6gUv/Id8l4UUPjbydrocXMRSNcwEXyzEApM?=
 =?us-ascii?Q?aOcwFuK8HrFSpEg8FDcrlrAmisdq9W/0RGA/pby0XdY5fJvXjDOOZh3UZ2Wc?=
 =?us-ascii?Q?iootaQNz1mkUElYxa8gwVq1PoMlnlW0rD5b9j9aY9n7+ETy1O41zgnAu99YF?=
 =?us-ascii?Q?65TftD3v+1OyNmOWqmEMXA6Djmehspeke4slVsdrIion+mmUj0OUnisDXU3i?=
 =?us-ascii?Q?lltu95UpSru0qtzPtdbsYxqI1iVx8IK25HHK4FTtsSrESnXP2el36+Q9fmR3?=
 =?us-ascii?Q?freKYsm/ZrdxuODfyxEF9Krcy4Nu3cinoLM+ouk79CzIoF4P1f9WikiqQYPU?=
 =?us-ascii?Q?rzhLHDMc3uibGmDpl7GgD3REbmg+spu5LlYaO0JHX8/Zna+fV6NU3MnV5CPr?=
 =?us-ascii?Q?5nEHebKovrDxGHe9vXJkHlVuQKDsjl/ib0aH4tk4eF41Qikm3H0gr8mMQe7t?=
 =?us-ascii?Q?hzBg1ranTxZCiuYXNXDkPhxW7nDvzOMKP6/BOTFeSq3GApwJCikSfOjIZ0WR?=
 =?us-ascii?Q?BWX97COqcJYvG90CKZA4FkjmQ6PLgyfoC+ZaHCFQ+Gp7vYQos4IHQvul40We?=
 =?us-ascii?Q?tFKH9fQVvISr5rtBMzXN9b0vdz+aDVnarTVESAYfy4NODYvFcMMCRLl3SzoY?=
 =?us-ascii?Q?e3nBXUOh/lawl8DkOM5FrRlVnRFkwsc8uWgh3oJTeaNF3CEjkJWUGK13bRsV?=
 =?us-ascii?Q?cBJO99uf11QIMoX0V8uUeocUxFfwiFeFwoVpqpX1ynmaIjCP+Pz8BsMHhVjr?=
 =?us-ascii?Q?EyMgNtS1NcQszjuYVKk0gFw3baTxHJ0FmwIF7eAq5OFh+nD4gxYGNX6u/Q91?=
 =?us-ascii?Q?fjtZO3ijyrei4giSlHaYMjZTQkY5DZJGYB6Z8dHAVa7ZE56e+BDDMaDCfrFh?=
 =?us-ascii?Q?hOsbIOIf3gPvQ69beW0uSgeNUtlMGf/0vQElWSj3WGNUf5M2lOQnq05W9Bpg?=
 =?us-ascii?Q?Y2RSVLkQ+RLw93i3V2iH+nCh5BD903p/kIPwxVKp/zVMQ5uaFg6ugIdhahDl?=
 =?us-ascii?Q?I3aRWWpWXL8wPKoiXxEVQAhK6c9xSW/myB3EDCe+ztLou2yasofzsHMa+TpB?=
 =?us-ascii?Q?3NmVwqy+EtmVTw2lqQQ8zqQLkVIwwm+bkVFn4kNlMVX0ayLKpb1bzWHNRDSm?=
 =?us-ascii?Q?bujZMxiz9kkVb7CckYKPljiy1RAcyhEUE6UTjaFBpBkl9zuiUaTo55j6yna0?=
 =?us-ascii?Q?fyeFP4ZKQXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ENjJoS0x5+ZcrjzqypZRE2olKUuu6ZqKnDGF7rzIaZkWU/v/IHKKlVieU0kQ?=
 =?us-ascii?Q?y+z6eCi8J0/lvCaSvr0qPDPjrpgdRk+j4ZV79KepquNynfMWLf/ptZTBbao0?=
 =?us-ascii?Q?zLupUVGV99v4Ep1hR8RntVJ3uwAO/SxeGARVmMGYMN5N5Cxuzlvrzu+4uaWl?=
 =?us-ascii?Q?HpCeTRwO5Y4Q5mAnqY3mf9BURfEg74G7Lhb5ujgGLAuTb8vGVUeNkfpZ7czI?=
 =?us-ascii?Q?vQN6FDO8yAud19So6rrvDb6OqSUK2QlTudNEI7o1Zp9rCbTmYiJ49d2VCXeB?=
 =?us-ascii?Q?Kvw3uMjq8LUd/m3cXCcKQVkxUuyst4gX7QMtibh3R1sOfXeq93lCwNTIhVT1?=
 =?us-ascii?Q?8v0Zh+JjiR4M6ElcE+oEMws+uG+Ricv5A2b+3L3C2xWq4FJtXpCTnn+d3uad?=
 =?us-ascii?Q?ahOysY3leGw0QmnPHwFcnM3iYJXI//AE1gK0grt2jTMxq/pmKZgj71LYMlff?=
 =?us-ascii?Q?CpkczwBKq6aJpgEqCLqp6TgyKvCp5t83WYKypX6aNIZU0BKGTm3xUzh/USDn?=
 =?us-ascii?Q?PJVP707uXnBDPQ6EX2wseOL7SFSpzgdPoTPBScbXwdRSRCYd3U9MWFg64ddq?=
 =?us-ascii?Q?+yp38QtnyuH4MrlJMKLYreEiikUFv5aiq7s7mqQgKONICvrwd0MaT5ZeBcGw?=
 =?us-ascii?Q?m21+eZb2rzQ+s6Y5P72lhCMw+OlW1rRhNP/iHDxF2tGhIJ0tkCf9xiGAU9ma?=
 =?us-ascii?Q?m+n2LUqLsFPhwNAX09Cqbo4btzgiEpcPqmV2dcCLHjiyzTK5FwpDH+WU0RcA?=
 =?us-ascii?Q?/o/uieLQ7BkptVYCYfYbUzSXOauDWLYaQwqH0dl2nEGUQZZbeOffLQMNusjp?=
 =?us-ascii?Q?UV4zwm+I/TWbIDQ3tsmi6xdlCQGBPEfqX3GbvXGs8f3fteeHYaIMn5lNKdkq?=
 =?us-ascii?Q?ijednA75MUl5Zmzw88I4iI82Ehatavyx9JtaJPcQ6HUOOA9y+pD2nhJJznYW?=
 =?us-ascii?Q?rb17O35pjWbQHjtkkzWvLhqf1X5HB9n6KO+ftjFPpNgcJNK+nqYQTlRQwB6L?=
 =?us-ascii?Q?gDOmF/Oef09TrqUgJLgJG18jXzZDk805GxY/9OxNglKZGrYHskstKBoS0U5+?=
 =?us-ascii?Q?6zjJEioiYgPoySEJHMqZm8nNTYUozRP0wzrVHmiQhXeg5UAEUwXbXXHYYwiQ?=
 =?us-ascii?Q?xYnqEpqTONsehoH/atD5Sn3WA+j2BdQze21z2O4GuGxZSwJJwaz0+5YTtkhK?=
 =?us-ascii?Q?k7251dTTQyx8pn8uOQzp55CpJ54DN2p/2lKJ95bmHHqo6F81v0HhYiFR9q7w?=
 =?us-ascii?Q?HFfP3JlaUxjDYWHbmD/JyCkIyzqd36Hhmqm8HZ6Rey9nMSh82Gzt+aLP+Qjs?=
 =?us-ascii?Q?kqXzCDIH0y2jYKqVvfGrgSIzEXTdYAe+JXBQ4RhioJ/7wPaCqV6QBoyMcwf3?=
 =?us-ascii?Q?LyWX1+P1i6hsmYvdBI19lzecy5QvHjhqMm6LRNhg0hR0RAwbNAsfY6rzsJKK?=
 =?us-ascii?Q?C6fDjUsdb7yzt0lLzZDpylh3srAN88nvqZNJS/GsxYQQG1CYzdIP56WDsDXr?=
 =?us-ascii?Q?/5KXp+de9TD7v/g3IsSkZps86vOtQM4duychODmmrM4/Tgkh/2558loXrMpN?=
 =?us-ascii?Q?hYvTZa9Oj4kl3dk1vC0Hf5UJdHkTfu35fNo7HoXu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910e8d5c-561f-454d-8d22-08dd14255351
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:30.2625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9lMTa/7ODOOejwClL9p7awZj0i/UkyLo9gYBiuiDS/rcROhulM45d6sAaAH0j01ZTOdVL3v7pjGriuk8KMDmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage and export them as function pointer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 228 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h |   4 +
 2 files changed, 232 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index d22f0621c465..f17a185a1910 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1861,6 +1861,224 @@ static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_EASRC_FIFO(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_easrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_EASRC_SFS(index), &val);
+	val &= EASRC_SFS_NSGO_MASK;
+
+	return val >> EASRC_SFS_NSGO_SHIFT;
+}
+
+static int fsl_easrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	ctx_priv->in_params.sample_rate = pair->rate[IN];
+	ctx_priv->in_params.sample_format = pair->sample_format[IN];
+	ctx_priv->out_params.sample_rate = pair->rate[OUT];
+	ctx_priv->out_params.sample_format = pair->sample_format[OUT];
+
+	ctx_priv->in_params.fifo_wtmk = FSL_EASRC_INPUTFIFO_WML;
+	ctx_priv->out_params.fifo_wtmk = FSL_EASRC_OUTPUTFIFO_WML;
+	/* Fill the right half of the re-sampler with zeros */
+	ctx_priv->rs_init_mode = 0x2;
+	/* Zero fill the right half of the prefilter */
+	ctx_priv->pf_init_mode = 0x2;
+
+	ret = fsl_easrc_set_ctx_format(pair,
+				       &ctx_priv->in_params.sample_format,
+				       &ctx_priv->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set context format: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(asrc, pair->index);
+	if (ret) {
+		dev_err(dev, "failed to config context %d\n", ret);
+		return ret;
+	}
+
+	ctx_priv->in_params.iterations = 1;
+	ctx_priv->in_params.group_len = pair->channels;
+	ctx_priv->in_params.access_len = pair->channels;
+	ctx_priv->out_params.iterations = 1;
+	ctx_priv->out_params.group_len = pair->channels;
+	ctx_priv->out_params.access_len = pair->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(pair);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	/* The context start flag */
+	pair->first_convert = 1;
+	return 0;
+}
+
+static int fsl_easrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	/* start context once */
+	if (pair->first_convert) {
+		fsl_easrc_start_context(pair);
+		pair->first_convert = 0;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	/* Stop pair/context */
+	if (!pair->first_convert) {
+		fsl_easrc_stop_context(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	unsigned int in_rate = ctx_priv->in_params.norm_rate;
+	unsigned int out_rate = ctx_priv->out_params.norm_rate;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int in_width, out_width;
+	unsigned int out_length;
+	unsigned int frac_bits;
+	u64 val1, val2;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val1 = (u64)in_rate << frac_bits;
+	do_div(val1, out_rate);
+	val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
+
+	in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
+	out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
+
+	ctx_priv->in_filled_len += input_buffer_length;
+	if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
+		out_length = 0;
+	} else {
+		in_samples = ctx_priv->in_filled_len / (in_width * channels) -
+			     ctx_priv->in_filled_sample;
+
+		/* right shift 12 bit to make ratio in 32bit space */
+		val2 = (u64)in_samples << (frac_bits - 12);
+		val1 = val1 >> 12;
+		do_div(val2, val1);
+		out_samples = val2;
+
+		out_length = out_samples * out_width * channels;
+		ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
+	}
+
+	return out_length;
+}
+
+static int fsl_easrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	if (dir == IN)
+		return ctx_priv->in_params.fifo_wtmk * pair->channels;
+	else
+		return ctx_priv->out_params.fifo_wtmk * pair->channels;
+}
+
+static int fsl_easrc_m2m_pair_suspend(struct fsl_asrc_pair *pair)
+{
+	fsl_easrc_stop_context(pair);
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	pair->first_convert = 1;
+	ctx_priv->in_filled_len = 0;
+
+	return 0;
+}
+
+/* val is Q31 */
+static int fsl_easrc_m2m_set_ratio_mod(struct fsl_asrc_pair *pair, int val)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	unsigned int frac_bits;
+
+	ctx_priv->ratio_mod += val;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= (frac_bits - 31);
+	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_EASRC_FORMATS;
+	cap->fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	cap->rate_in = easrc_rates;
+	cap->rate_in_count = ARRAY_SIZE(easrc_rates);
+	cap->rate_out = easrc_rates;
+	cap->rate_out_count = ARRAY_SIZE(easrc_rates);
+	cap->chan_min = 1;
+	cap->chan_max = 32;
+	return 0;
+}
+
 static const struct of_device_id fsl_easrc_dt_ids[] = {
 	{ .compatible = "fsl,imx8mn-easrc",},
 	{}
@@ -1926,6 +2144,16 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	easrc->release_pair = fsl_easrc_release_context;
 	easrc->get_fifo_addr = fsl_easrc_get_fifo_addr;
 	easrc->pair_priv_size = sizeof(struct fsl_easrc_ctx_priv);
+	easrc->m2m_prepare = fsl_easrc_m2m_prepare;
+	easrc->m2m_start = fsl_easrc_m2m_start;
+	easrc->m2m_stop = fsl_easrc_m2m_stop;
+	easrc->get_output_fifo_size = fsl_easrc_get_output_fifo_size;
+	easrc->m2m_calc_out_len = fsl_easrc_m2m_calc_out_len;
+	easrc->m2m_get_maxburst = fsl_easrc_m2m_get_maxburst;
+	easrc->m2m_pair_suspend = fsl_easrc_m2m_pair_suspend;
+	easrc->m2m_pair_resume = fsl_easrc_m2m_pair_resume;
+	easrc->m2m_set_ratio_mod = fsl_easrc_m2m_set_ratio_mod;
+	easrc->m2m_get_cap = fsl_easrc_m2m_get_cap;
 
 	easrc_priv->rs_num_taps = EASRC_RS_32_TAPS;
 	easrc_priv->const_coeff = 0x3FF0000000000000;
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 7c70dac52713..c9f770862662 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -601,6 +601,8 @@ struct fsl_easrc_slot {
  * @out_missed_sample: sample missed in output
  * @st1_addexp: exponent added for stage1
  * @st2_addexp: exponent added for stage2
+ * @ratio_mod: update ratio
+ * @in_filled_len: input filled length
  */
 struct fsl_easrc_ctx_priv {
 	struct fsl_easrc_io_params in_params;
@@ -618,6 +620,8 @@ struct fsl_easrc_ctx_priv {
 	int out_missed_sample;
 	int st1_addexp;
 	int st2_addexp;
+	int ratio_mod;
+	unsigned int in_filled_len;
 };
 
 /**
-- 
2.34.1


