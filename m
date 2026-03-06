Return-Path: <linuxppc-dev+bounces-17793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BYDOregqmlLUgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4F21E143
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS1Z65Vk4z3cCC;
	Fri, 06 Mar 2026 20:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772789934;
	cv=pass; b=RUD/XXBPhGNOq6dvddu7Da0GhPD5AoGU3TTAgR42Fa+Y++dxJRIR+SBziUvaB5mbqNUxMrKNxmq/9TEoyX2Eai3EQNdq8ClPyfjRPaq8tYc0Mk5ANq6M51Stx49fYfb+bHVnIvaNaQMyE311rz0AnPFP4Lan+PL1PdUr2xidsdvMIEZit99hfzhX2PH5DZNXegd6gudf8p/Vl2JQcPYTNUxizCt6N1fKRUZgy4rQFyeX3YBKz0nri/HD3ok7yt1a8ARh0S2dKTm7sYfgF9I2gzlk8jECoUUaC7xfeGEoy0VdZ8bRJtGdpbN6O1Hj/0CLn5XBHRM0MHjxiseACUeznA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772789934; c=relaxed/relaxed;
	bh=pw+02UVDLKT0GpgRFQFHBZEqlxW93FIqScdiBCYQ+CE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UzawTZy/871bjOJb8WbjpTsnEAw3zQmmivIyO2uMvK8TSemnjKNdCe12mslvBTa1AD2yKcn/SzzQaljcnE3m59es5GdmCgw3HJn9sy/ppBPAUYnJtBICUe9BMpUC0KTz08Y3/Fu62T7AHzEZdnawr1mAQkAmWamGGVMWcPI9rUZ6NzKRxn8V4khDAt2NBf49aM2t72heErzXdClv/AyIPP8afLTuxt4QGoM5Sl7+7K1s8WsfZMIv3q/To3fAyiY79kN2RlIzIigTKUUpvj+kNAC6xp8tJ39aNH8wg2ibZtofhD2kfTBwpzzM1qYNc1GAqIavh1RRy/sJPBzUCOZ0Aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nU0HSBrq; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nU0HSBrq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS1Z60J3rz3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 20:38:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlZsLebbQNSZrebHXVF2aDsqmN+JlajJYK0eGqKCB0oDZn5ckTDNvjHKn01ACxp/J7QlgrfDwtMlDUCks4jCirvBkzD4qFup7s/PIdsqpb8NIZQpLefr11Ly6E6VlogibR9OloP9Wigz4+JwbUrcuXNuemhtuu0AWrrm4+pYRJIIyAju3wYX8dQ7930vse0Z7gBIwvymMJQl7HXXgJeaB24xo1eNCHFxxIQfAVPWjWXFGVI1l/SpB59ega49EGSTIMzUG5yNKA5VuTpi/tr/pPNNRo6u6u5Lt8c0GFiUJiFIm9PZdHWlufDyuA+s2mLvl68HNr5lNKTYcsCWEL1W3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw+02UVDLKT0GpgRFQFHBZEqlxW93FIqScdiBCYQ+CE=;
 b=vQFc4rWZVFLswMz3ctahSfsPAIWi9QajEY636cRdI9WEmLg5v2FtCvGVjguwWYztpeWjCH7VA0SFdC6TatsCRnALAxJYrj7KUArJ5FE3LaBLTTMFAVHtzTrj8jY9VIbdHxxN9h+9vRMA1sSmk0jEFNaJkYeIMFiDmToUK/ku+1CW/PrbWIYbVzWeeKUli0HqVKQeextwg5SEDQOMnbDwe8oC1htPDSM3qPm5g1X0sRxTrzDk3IL3QqiNAhN5S43BIKIoIi6H36ePWapIQdGZopNYSAa2Oe1oZNoSgSholLv8t46J31iQFlXNQJXKkPuV5gDYaxWfSemUrY9odF7aVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pw+02UVDLKT0GpgRFQFHBZEqlxW93FIqScdiBCYQ+CE=;
 b=nU0HSBrqQ1+VlS6SmH3iVN//TItpILhkrOuOzDFetfxsxIL26aT9/ZaJtmKW/I7OO8ufR1+0AOpQW2Kw0W/VbTm2+YgZNsZe5RmxXWL3S6LfIjjIHzlxcpRJdmB0fZuMk2IrA0O8brpxTh/EP28KhvH8Y+qHwshFmCnEDJTN79bTV+SdFfGiRbuoBB2u9wJVyxqzaeGxHtJNCeLYPnBYBHUMJOWY4S+71E9L8eqNOWpFftPsL/FL6zhXo4XNHtyLjWtCQstO7Je2cpDVl4pVLQohfTL5JDIeDvYEey+ZID3Bm7RSq1zNTtuActdFF3WO3ljo14wq4K0Vn0l0cQfU0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:38:29 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:38:29 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
Date: Fri,  6 Mar 2026 17:39:47 +0800
Message-Id: <20260306093949.1647452-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0d494d-7415-4cb5-bb48-08de7b641ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	GBv4XA7mrZ+d7xOJiAY7uUvi7ALwAdZOqsGeEpD/SQ+bEYDVjugaURZPSuh+hdt0ViHgZRr10y3zk65UsFEwvo0cyLulQJ8YzGQKNnzwnpSt3SyA2mwxx2K9VKz5/Gbt0koHScXa8tyjx/s8tDq4UETkv/RyjqkemSJzERp11c6ZSOim1bdoqB1b/TS1DD8gkNQD4KN/hsNanljWJUI/PQwzFzSG1+oXoeb/yS2wydn6C/1wF0BKHMB3h6Q56Fs3cmeLcTkDBV6d0Yf9aaizQO53hAr8KySSJ86MuoHTtHzVkTV4aI+x+k8aWnwN7YpMOkIHJMQr480SxY+ZiE1hLC9EzMMQkgmyEz3IN7CC6LxR4f7bNUT31Dlz/uIs8anJ6lRCPtEqiS3RY4gnYPsXTXHpJ5sFVRCa68Z/U14Zink/BLZODSRwYdIAMmkgz0H+Az7bEC5Esi677EVyK2m8XV4XEec+Uk+fNkjWu36Eixlpurv5fJiCaKzpNizpO2/hNSvvNUGW2BxbUOE02Z8vZ3TGDFxi5OEmFVa4qhO9SQZybkPBQwff64VDmWcMseEQLAfsVhmshEirYMuobnK62K+uRzw4qxTkrWKTj/abjW0BexUUqkTHk4zfCY/J+ZThXnU0odeLvblKQAQNU36VG8sQCXFOqVdWATGtX7tJPYHwzXbFUMYftSrqSlzXdhF5j6NhxG4KrnimyvalUabfaAGpOO/ZaaAYme3fWKT9noNrDDGMdEAuzuCQ13E7xQv3pBmO5HHPYeGPsSHOyc3Rb9wXngWbRVZpgBjKYPc0RoGOHustQ9iZnYIMyCGEkwic
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4NTawC/CW2G4z5LChVfmBgS1XEjw+8+R6i5Us7v/Qtiqmvto5Ka0byaVely7?=
 =?us-ascii?Q?RBUis4gA/TcHuBflZjVtcCC9q2+kU+EQ0d+xSVi6fKKTysyKb7qY4o/9OYVO?=
 =?us-ascii?Q?ve1+YhmWOyktEYMLcS6ZEM22EGcaNjA6MZL9eYBvcGYjPPguFFdnH3kmCaDW?=
 =?us-ascii?Q?MOxpd25PtNHYdUJ0DUnXGgDr1ATD9yOdcHEpF9B8sQWtREYrmDhjLtWltVR4?=
 =?us-ascii?Q?pvEm78NVdkzzxvhLffr6UMPljEhTck0igA5LYf+2CcR8WwvrZnyCIxNZG4/W?=
 =?us-ascii?Q?/GxZYZzp2FCQmiOiAcAGMMTnxfrDOB3GWm0GlFfCDCf2rlU6RJUFdTezUbX7?=
 =?us-ascii?Q?uAO7ecj63x/fr/5WTJoRc00Mfapw/6LbjaKYHHCCbAbNPCjuxBKC74TH7k1Z?=
 =?us-ascii?Q?1ZTtwPuto/ayOOrXcl6NiSluYCvQqJF3J0xpkrYw0sZYm7Lrl6TTl/DYZlA+?=
 =?us-ascii?Q?0/lMAKZMf5mib1KAXFJn2NmCYpZNKnKXRJBOrNytcdk6FhBn+jItDvCwhVrz?=
 =?us-ascii?Q?pu4Z4OG6UFmxMbQ1JFMnoLsX+s0lV2jWJFEdW4BvEaBH7HC+b86gxNNQJJP6?=
 =?us-ascii?Q?20Igqu40VZAj3pl5IlgyFjmZTnAJt/D1BJzCFsjkY/ATee2Z8/YKd01wTg5Y?=
 =?us-ascii?Q?jdE2bE3OuRsOpsGDZPYR5TlGcgy/ZId/hpOxfIbl1WyrQmFB0+Bj/Ue7D62z?=
 =?us-ascii?Q?vMmv1N4IFkK0WjawWFeeDX0Da/6j3cET7L98QRqpTc/2pVxc530fT0BzcOGe?=
 =?us-ascii?Q?wpBpmTqfcAQ/BvgOCeXyrH/DuuewNegqKGkEnaunr6bOEUnTJHBCVpITaNTM?=
 =?us-ascii?Q?F3uDzxnSEZnG9BYFhTcQ5Fpsu6y0SsnbZ1P5dWu3W685XYtjMirG24bXwWWW?=
 =?us-ascii?Q?wzRmtGRBUPY2XsYI2koVxcvvJdugN2obbOZS33lSPufVfOG4rBVD7fdPcSXQ?=
 =?us-ascii?Q?AYOZbtXWr6TqwQuDc+OhpjpFP+FRX6s7wZmZVxgQdOfIwX07sRemdDXED3PB?=
 =?us-ascii?Q?p3s/ETwXVO5JzSTaPyYDMnyz/Ldw6gIkUeHFHOe0pVQ4Ds7mKcUan99O7XFv?=
 =?us-ascii?Q?AbGp5E9+rlG1v+GbFuTfEDpCDNdnvNCFYzwk3JRIE7097ApBaLpDMVhxN1Td?=
 =?us-ascii?Q?6VQNNSkjqGwXya+0WX9xMPyQxOl7Wfq7DAOybaR73qs67467S+Bl/iThsknH?=
 =?us-ascii?Q?N1ZClthShxxtULfXkTcrliLzAmdO7kWkq+lZ35GN/MGET1JrzrqbOdirUTJr?=
 =?us-ascii?Q?ZWbey3owfY6QGNHpCOKwYGC8N9HwRCt7k580CfMPGOsnWeJV/ryjzGPDsAZS?=
 =?us-ascii?Q?9hDRzqn6+o0lflROuvzX9JRFKcGfmcpqtHneYnf3IL99yNKzn3aj682vuten?=
 =?us-ascii?Q?TESJmENBJKJdVYkS7WO8qxzbt4oCWwdAYmq4M/9GJ/PL+B87euHMrTSZjFrO?=
 =?us-ascii?Q?ldx2g7bRyPjccTLk3TLsAHmgUMReBfVCQTNqSBJ03fl2lWI9KPUd2XEnHXEz?=
 =?us-ascii?Q?3DUF06fl9zWPO85/Ams8MF8Yg15cqafX3lWrzKCjgV/BXTliNnzDj5Ze9jxm?=
 =?us-ascii?Q?ez7Q6hqq5Ivwtw83wcYtwUjPFgF1hcUGoch5Ginb/M/rtYTP1sXw0yK+qZyv?=
 =?us-ascii?Q?Jb/el7PkCRTTgl13FkYjJrmPlVEnOemqCvYilxaqCqI+GFLjnILztQd5VRCX?=
 =?us-ascii?Q?FYIOSnYk8wqA1lZCx4bG2fj5qnh1sAEmTKycvRS9jzJ0ZvVxqsRk5iCI+7rY?=
 =?us-ascii?Q?3DpmsjbX1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0d494d-7415-4cb5-bb48-08de7b641ffb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:38:29.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8dgz7XenH2BVSMCk2P3MmhVTF/KNchTit1vZn3VS1Q74dR+sz+NxY47ytx0calWM0H0SJUI8qCR2TRb7u6lEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: EBB4F21E143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17793-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

There are some registers which are volatile, at pm runtime suspend state,
the regmap cache only is enabled, regmap will return -EBUSY when trying to
access these registers.

static int _regmap_read(struct regmap *map, unsigned int reg,
                        unsigned int *val)
{
        int ret;
        void *context = _regmap_map_get_context(map);

        if (!map->cache_bypass) {
                ret = regcache_read(map, reg, val);
                if (ret == 0)
                        return 0;
        }

        if (map->cache_only)
                return -EBUSY;

        if (!regmap_readable(map, reg))
                return -EIO;

When exporting these registers by amixer interface to user space, there
will be -EBUSY errors in mixer-test when the cpu dai is in idle. In order
to avoid such error, needs to define FSL own functions to take a pm
runtime reference before calling snd_soc_get_xr_sx(),
snd_soc_get_enum_double(), snd_soc_get_volsw(), and so on.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 113 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  30 ++++++++++
 2 files changed, 143 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index d69a6b9795bf..b82c2c3bc886 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
 #include "fsl_utils.h"
@@ -197,6 +198,118 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 }
 EXPORT_SYMBOL(fsl_asoc_constrain_rates);
 
+/*
+ * Below functions are used by mixer interface to avoid accessing registers
+ * which are volatile at pm runtime suspend state (cache_only is enabled).
+ */
+int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_xr_sx(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
+
+int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_xr_sx(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
+
+int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_get_enum_double);
+
+int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_put_enum_double);
+
+int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_get_volsw);
+
+int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put_autosuspend(component->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(fsl_asoc_put_volsw);
+
 MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
 MODULE_DESCRIPTION("Freescale ASoC utility code");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
index 21b25a11ecda..0cf9d1e7fb14 100644
--- a/sound/soc/fsl/fsl_utils.h
+++ b/sound/soc/fsl/fsl_utils.h
@@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 			      const struct snd_pcm_hw_constraint_list *original_constr,
 			      struct clk *pll8k_clk, struct clk *pll11k_clk,
 			      struct clk *ext_clk, int *target_rates);
+
+/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
+#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbits, \
+				xmin, xmax, xinvert, xhandler_get) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_READ |		\
+		SNDRV_CTL_ELEM_ACCESS_VOLATILE,		\
+	.info = snd_soc_info_xr_sx, .get = xhandler_get, \
+	.private_value = (unsigned long)&(struct soc_mreg_control) \
+		{.regbase = xregbase, .regcount = xregcount, .nbits = xnbits, \
+		.invert = xinvert, .min = xmin, .max = xmax} }
+
+int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
+int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+
 #endif /* _FSL_UTILS_H */
-- 
2.34.1


