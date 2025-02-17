Return-Path: <linuxppc-dev+bounces-6231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97517A379A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 03:18:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx5tf0kNyz2xYl;
	Mon, 17 Feb 2025 13:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739758730;
	cv=pass; b=hiSJln8erw1qVUnOI18RuI/i4s53/hV2XhqJXxcPdTxlDs4fKcJl3zA8bo2gfOIZ6KJiqS8cTNqu/3Q65G09oNhGBHDkwLanbEaxjma9GDYkFfl9Ra+nCtfOov7hWmeRqkdzJv9SX5Irqv78Uu4V05dNdBFSzNQv3VpMhibi13cwKyXrkC6OgUXNjlZu4ek2yhFgKr6/yf2gv60i55tqeTjyQCOy42mVB3gdB2Lq1YET4MW9jNJ6PXC/K1hmLBJCuExeeDXrZFZxO8pQpXf0AkuJZ71Swx2JFfXXtEA++3idS/L5kAvcort3KthLN6URpXrGuBU1JVVxH6ebL1c8yA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739758730; c=relaxed/relaxed;
	bh=3cz9kwKRS++UQKst6A6+3R7KQGyt7TUxPHjEH87CLm0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Y9vXbp0oEA1y2ixjowcUJGPvG5eXfDF5gXLhfxtQ6sPWbH0FVkcNCErMjGRDIznsO2xrzNobrqiDTsqxatRU/d1pC2iljdkTrKywSObPtbdRVdovneSznWbgM16M9wVquBddfqnonDmRWjTrV0RquDw2dV7N4vfylTh1Eh6xjC8+XursGOPVOawBZRaj80+7HVW0bc2Fx+z/gbjc19LLpDGiyq1tiq5e0rohJAT9mdV/wIAu7WkvbgFGRyJvdjzljZ28AuIXBkTDyUXT/hzP/WhkK74AVu3u1Fe7XK5yUYymVb/9QM3vgQ3LJwsT0JNzwD4sN9cP0CyCiOwO2Mk7bA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aZzw8bzr; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aZzw8bzr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx5td2Hpkz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 13:18:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b20tYbCnXS0jbLJ0DV59uIRBFK3Yh7oe1Qr78hZ4EVTp3+nsLMLrDZ4FmgPM9+gUdmx1XG6q+echv1gbUYVwKYhwlJyqK9Sgw4syQureLSROoVpLCBhrawYGN8BBUtIOuE2DAGRrnrAhCVY9RH5YU4EzthTyU3tpSg4D5sH7OBRwviLwh+CZH/DeHHd0zHzTew3MpsuK5oH0bvmTYto65H1/0tC4f1q2XHlnR/BjIBCUjd8Ytxpx8Qt6gbltXG1osrvIUbk9dWU6geRt5SzvTriivBCcjkahks/aQgBq4qKdDAhWle+agg8719N7xcESQbfy2aEYblnwMbPwlLHlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cz9kwKRS++UQKst6A6+3R7KQGyt7TUxPHjEH87CLm0=;
 b=c/Bbx4M/9HROlIL8QkZ69WZsSc6M74ox6HQ8fjc9eLr1zdKU8G0KOUiCCSMmeya0+gJM9NHWZop/uCEtnyC4faCjnmhVI44MEjNBtNBI8XPzNDxlVeB99EPwqUEFcz3nz8JKItiisxQdhWcxdC33NZn/EQPm6mWUjjomlbY/laJFBYFlmsVMOJwccdT4mHn8dmcnCcL0GLZhD2/uy8cOCNpxf28BYjbMYfzqTN56sNj9pCj3BVCdJOcyYuvhvZhkuS9LEKgZPNPAJ1ZngZC3g+Vkgd4coeUcPsutMBjVuUy08YnSqOFmSyJ946mKXVS8xv7vEiMM52zoSJtk9HTJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cz9kwKRS++UQKst6A6+3R7KQGyt7TUxPHjEH87CLm0=;
 b=aZzw8bzr8qXdspszpL/vUzU8C52DwqscZY/ws9dmrSGmTGs4/Jp6NMOGB9vldqGi+L3yG8WR6+gu4Pg6VLytMd3jH0PrwA2ZAB3u7je7UnCoB7x0P6E605z/JGSwJufw4F+/TodDpA3yiqX0Ojpg72/fP9aXS32RJdzTfGMcYxOOM0ikX4OOuUljisLV0lQK5Xtu9Hv2/D9UO/yjoPiMg4L33tO3OTyW2rJxK3UawouvYu19xWHbKdsSwXuprI0BaL7KQV9ig4sg0ZIQ3kTHHG6VqlWRJzrR7SByqyk8puaL2VprHSz/hRtAdNHkBKN39B2T9rtMr/HkcwuA8JoMkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBBPR04MB7865.eurprd04.prod.outlook.com (2603:10a6:10:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 02:18:25 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:18:25 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: imx-card: support playback or capture only
Date: Mon, 17 Feb 2025 10:17:13 +0800
Message-Id: <20250217021715.284951-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBBPR04MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d5107c-fde3-45f4-56eb-08dd4ef95b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G8MT9BKGj4o0V8W5y1DLBGElX9kMxcXrVxJsI9Jg0mAa1eBWTWUSi95OnVAq?=
 =?us-ascii?Q?zfIyjtAFVsMSY78qkcz7p0IOUKkqoVf8Uh2M6/BBOuEXXK6Rn+5ia+Gz8nPE?=
 =?us-ascii?Q?CTJlnjErL6Jrj9VGtbn9H8ZDbk1MBfuHxZfeQBsUCE47T/nJDuOxcaxCjO/j?=
 =?us-ascii?Q?AqQIahxTwbsHtwue+i2kAbzmB4DatnAb6DfUYaaFTsTqbjkZv0Mj9hQdAYJE?=
 =?us-ascii?Q?L205IQyyGegqnVHANELualhG5dL5lZJjn6Wn18iz6cpNiQgZNKcgM6LrF+6z?=
 =?us-ascii?Q?n/po4eBZiuXEEHlYFVMavYUBjfaiOTg6/FNHykPudxAk7QzxAFlMOov24QU8?=
 =?us-ascii?Q?G0PNjNpzT2WzpPN8T/q8oe7GGmyXsiOz6uAfOMdW4sacBX7Kwt+YHflYJ5vQ?=
 =?us-ascii?Q?H5PinBDPZFFypv6tGXeiZegdWYn0MT26piD9hlwv/E09WEWmSA0rkXqlnOAv?=
 =?us-ascii?Q?HQeCm3HQD9obA4nw+tmy6IdMvl7yZlwFlxoX3woT2CnuZKQpDA8m4lTjhg8n?=
 =?us-ascii?Q?iHTJ6fwowvi6fM1Ul3N1A9wKdBs3tyRZ+cYh5/y7tFa7RftKnbscyAJtbsCk?=
 =?us-ascii?Q?uMxjMyA/lP8V09RoCyzlMwzcon5dqNzkebxDwaKHEVDvCzUi3LTGpXTk9tp4?=
 =?us-ascii?Q?YyME7u5AhTgTw1jUUNzJ34hyw8v7ZEJIr6HlpYHcCu/9f+4WioyXmOgUSA5a?=
 =?us-ascii?Q?rF8zB+7wVwtFyhCZpPLje8YU6zbSBsEQjUsKDmecq+A7UjSNvTU0Iq1F7JyG?=
 =?us-ascii?Q?aisLaIR+u378vB/DCtqmMynkofKxVXJnE8unowpx+MEUXWiCPJbpLQWZuvrj?=
 =?us-ascii?Q?t9LcRo3qXSYsOZwOV7fUZiqcPYSUhrmV+yvxVkb/hMMTVGMC7wQj7T7WHXFV?=
 =?us-ascii?Q?iRh9sjDlKEe1FK3YxFIBBIv5lx7SR3D+i96/utcBHiEv+wWQrozsgygMXeOq?=
 =?us-ascii?Q?/l0JDRkNNxebp3YmvKQjD2xs8Ne2fBOGdT7mCCbSmqY54JfDgMRBBz/OAjQc?=
 =?us-ascii?Q?H74hxR6bU+Ks7kLvgJEzHzLcZq1Rfk7PtxfaLwwk93SxzJ57WNlOgtddhDK4?=
 =?us-ascii?Q?jTQkfm9xV0z/Mpzu1KbZtfzlCz7PLLj39v42qNUyoftvH3q5cJKnnUVqpxnW?=
 =?us-ascii?Q?ciatDmpKyUG1BE6tyAy88Qw+tYTHOiQ5sEp/w7EiInRiyo2rqyo+rptYUqgf?=
 =?us-ascii?Q?M8KxHkXEBfuWkkjokWRpQi0gIzy7S+e6waCu0g6IOrJcBsuWt8HYFIka7PbK?=
 =?us-ascii?Q?94/dbncdChpqxoDE/EPs3Jq5mArJo86seZr06YzqMUeOlMgJhZwMiK+A2ICv?=
 =?us-ascii?Q?tx07TGVgImeCY7EQx+OCUxzJs9e3pYKF7JuaAaX/HYi2yjQ3NbbCdaw8BFWo?=
 =?us-ascii?Q?rcGcoEPIA7xGAP4S1SQ2d3Ws50clWT33ZrrA/WqZKaQv5qv8nNJ6vvuhwGAx?=
 =?us-ascii?Q?5aisSHZAZ9FeAsF1wchy7sMpsgnlJ+hoIYB0mIOddSbMHUoRYdIb6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAiGg/kwoZa9qrOeC0hqPB4/PlLbuxdvAOEXnvipCo5g/2vR7UM6pwD8BCRN?=
 =?us-ascii?Q?Ov14//OWQWQOt2RwX6LkZyLCc+OsllMqRZlGvoF9hEqxNgis1Yt/xqRaG09J?=
 =?us-ascii?Q?PfJ5svSA0W+77AS2qyjkh+sVEICEg6nKCv+NlqRc7NzAbkg2zH8hMZQRhyUP?=
 =?us-ascii?Q?Z9VuFQTpyjl73e8AdA1UTEjRfdyqzjaf+i5xLbkFEnub0MX0rim6nAtW2BgU?=
 =?us-ascii?Q?M1fSIYP1558TR4VLXGIXVtBtPuEWm3kBWFFroGZkrzQ0j6z0OXV5uy9dLqN8?=
 =?us-ascii?Q?W5uVj60ecqf48a3bO15b20woufOoCBM9XbLwji4Q7d9MoFeJ1JFM6TtR6+Pu?=
 =?us-ascii?Q?7MpVgssJPQRmjZv/zYkWrZXtFz1N4xzC7UpPaXe7HFNgT9Tdb81Lgs68RcBk?=
 =?us-ascii?Q?mhPQ+5AP4hsDhvSshUCgvGf/Eet5G5x2dmm2xxOE5yBFySiuL2WW+pyTUwqv?=
 =?us-ascii?Q?50mlJgGL9Jp+lm14gt2ebqNJ0inFeuILBLo8AF2gpboARgKABv2plP/cuOqb?=
 =?us-ascii?Q?8kTAwmfPftv9WeGHiXSmYKGKjc/urnJI/giQSnnVl3YyD3jS9LjhT+VkshGw?=
 =?us-ascii?Q?U7XXbW/mFp/V173YlUfOgFjckyQfE57HUk/dyaLl2MOcH36g4tY+qcB0IQPd?=
 =?us-ascii?Q?eJ2XK0oknJFj4b+ei2/9rUX3pmwfstW/bNypk/+Rj41/x+AKEuRfhZLtk2qu?=
 =?us-ascii?Q?wSUd/ou59/OUMt6BxFuI+7jbkVkwae1Sqw2W7Wpz/wVXbgINzdz13x2yB6xn?=
 =?us-ascii?Q?WwDDEB+ID66lPH8EesRjFP0G/avCuvk430yRBvNUgVYO5ulU7uxX8nBmNFsH?=
 =?us-ascii?Q?fuBSCZGLo3vUnaQd7/8LJTWDLamBH87MlzRnSW7I/R+RT0bxuPzXcY4VcqUq?=
 =?us-ascii?Q?Lm2ljyRPX5+LiMOBdu0yc1OguXGk0iOJohWTE4i8wKAbl6KO9/T/W6wvRTPi?=
 =?us-ascii?Q?uyBeViq4qGm04AyKalAiEc4fbSbF5f2f35zo/kT8myWkWXkV8dqAuhmnirpA?=
 =?us-ascii?Q?wwKof/reAD92iLJAwGNMBIa+OmpXRvoL/r07Lk0V3V1vwPCd8vcoLXMgyWQG?=
 =?us-ascii?Q?MGbH5C/2+57oD+K8prb1SxhoSXym3HCp+ZC9N0PbLXIidsio/69cq4KzCttW?=
 =?us-ascii?Q?G6DUxqxvtyv/0k9isgt0esjKDdaAUkkULnTzbM/oalcomdu9o8YqY6ns8XfX?=
 =?us-ascii?Q?FuZChqs6Vo1BOKPbI/C+Adj13JpObkdVk/xb+I6nEUTQL963EjB7LcB/xYb1?=
 =?us-ascii?Q?L5SNgoKy8e/zIrbn8ph72fHo3rkgNQFu4Z+D45dvwaPXuo9TM/qKveBs5fBk?=
 =?us-ascii?Q?bz3GkhOhuL1YVaNgmUa6FYRI26x1zsBKhBpI+nn2BD3jdPXK4tqxwOZW6kqn?=
 =?us-ascii?Q?L+O/IH/Rc45YAOVybcgP43UtrwrFmTW1adogiauAAWFJ4xXSzJiEOv++A2no?=
 =?us-ascii?Q?EwOCTm0Wue0ZZuXnX9U8m/G1/RZgyrapGRQVqYZYzKprWKFWfNBgzPQkdlp5?=
 =?us-ascii?Q?CF/MS/czPTVnXEHGB4N+n31vKrViMxa2aTuAlebOLHkMpd9eQmsogRMO6Msv?=
 =?us-ascii?Q?7WJ7RrSE0k2dPROUNY3yJY+FekTGhMezSpKgATkQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d5107c-fde3-45f4-56eb-08dd4ef95b2e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 02:18:24.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fgm2iGA4e8ECHtec44S5Pp5ncTpw8GLdU6f0mnpUbcSBxdKZQeQ9CNIYD6t7sM2vVN6CnvtQRi2U13vPklWKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7865
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Be similar to audio graph card, support playback or capture only for
imx-audio-card.

imx-card can't directly refer to audio-graph-port.yaml, because it is
not based on 'ports'. Add playback-only and capture-only property
directly

changes in v3:
- add mutually exclusive expression

changes in v2:
- wrap at 75 chars for commit messages

Shengjiu Wang (2):
  ASoC: dt-bindings: imx-card: Add playback-only and capture-only
    property
  ASoC: imx-card: Add playback_only or capture_only support

 .../devicetree/bindings/sound/imx-audio-card.yaml  | 14 ++++++++++++++
 sound/soc/fsl/imx-card.c                           |  5 +++++
 2 files changed, 19 insertions(+)

-- 
2.34.1


