Return-Path: <linuxppc-dev+bounces-4027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2959EE075
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 08:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y84KM3KZBz2yN2;
	Thu, 12 Dec 2024 18:46:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733989575;
	cv=pass; b=YR6/Zc9vIDqvYTw+/gC1YTcLCWgmgqUkAAgwIu/Vu+sgS4Yu6AFVEfJO93pB+/LZhZsR32/uSUtdYoMRKlvOO4CVvZvln7zuvnxD7UWrcHU2GWJ8Q3YCcLtEw1Muv+oWOjiCkQA5om7WZeI2jBJbditd7HJee2B78iHmTwfZSJ+tUipt4NIGgKg6GsMQD6MU0QJ7SoipRl3UWc/arLyq57En1W48yWvSokp7ieLjFtSeyskTGJhIRsNemxpMDWkI+tNcpxPX8y1ga1PxmpakNpsxDrIyHSaFItB67s2Ih5GuY24+gK2M/nGvZ5D1SBcnr6KyVlIgsmvOg2XUdZ0BgA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733989575; c=relaxed/relaxed;
	bh=OaLHwnsqbGGf7kfT1yW2Q1i3/G+7bXgxqMvN1OgxehU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fcz9NImh3ZxCHQm9yBd6OrL75ruPp76eCVq4DcNCSH9XHRqF5Y/+4gXzvH/0MZqnNFkrc8gfh7svOGH1RshIOwX0dThcozFDX9m3C9uLWSxKwFj62lY9JS5WhbSU1/s2y3f1PLpjAlJ4WYj0xAH9RIBVD+HBjnoMM8INvvHcxLcYbjyKTFfq7QwWZOPyTBUVO+28h6iDkd9iAxwoiYTB5qY0p63GTinYBuwjBgqQht4tyc7nbVIBVwcVZE8E6PcwRi5I0nEQGmeoVk1F7ljvPf3vryg4Md1vMwDQ0QGx754e6WvyvbdDtWtB0AYCfL9QSqv869OrsTxcfMuoewwLeQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=elOnmmMW; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=elOnmmMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y84KF663gz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 18:46:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHSTHd+iWNx7+p+Wy4xe/H1Qz4uwHY++B3JsuaOEl7LaUFsLDqOorW7fXGeRueY/osljeN16XjWbn5Gy85T52v/V6wkaoP+cu9pf3uqqVJa+9b7JEbkZAUgRhToo8ZZQQrsfykX5aNJ6p51MjEr0kgShybww3sns9TdSL0bFtk5yPXTaHWazmZ29/ZM05Iqxjf5l1h+XuU8GeQeqhNnAzKeviFRe97UzWpPhtY5Cpj8Yl9f97BXEI6GfK62hl2hexK/hDUahYJkNhoAyID3FyuoQSpoFqYmPCU4NBhbYhUcvAlwlXOy9V9yQdGvh3IwwucA4/0/Rrvq6slOfWQj6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaLHwnsqbGGf7kfT1yW2Q1i3/G+7bXgxqMvN1OgxehU=;
 b=Tfnl2WkdoxkKYrP0sZtTbvggI6Zuthn+DwZG3gVNnCrBuR+wufLJEOLj7wS/KSHVThmTw+DByk19zcBxHc8CNrJfYfmzxQ77b2YXyX5NqZgSLRjEk5mJL16jCxQW/7cYekcTZTmIRKnSLM59S4k6U5d5wk8kuHleh7RdrUHHBr7IxLJFvfaRdeFzJcQnXKnsPqDmUNsoDq15e/j1MNYZ1hNbw3OZz9W4I2l+aX+xLItf7jBQYzmiIRY9TBmobfgx8C33uggkUjdQN33k1duiRbWPsp74X1+1HYZdoS4KmtTxEd16MNb67xfU2rtW2/ftwh67xrwyoqpMrxLcnWPBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaLHwnsqbGGf7kfT1yW2Q1i3/G+7bXgxqMvN1OgxehU=;
 b=elOnmmMWcBaG58cNpOF1e0R3iLbWKHgdBmSq5Gz9g/CuXR+8WV2QkoLBl2pJJM6dhCe01UMgZGBUNhzp3JJkLGq5DrstRDcmusTBBIWWNofmRxv6TzBGhwIFDT4lA9jJocWxD2JNUSx8kFGrGMoD/pfeRQfdCiM0+QU9ujQRZMadZjh/13Fx5hHgl9ul7Otjlzu8eO9LYDfJDH+/dem61n5XE1F52pW21W+PeXewhy806fJcqVVfbJyvAonOXrdhGqI1ZahU1IFHpfZ+prQh8Bf5VTkrTYFWy001jdtOK0hcs7/oC3tafAvzepOyDPkTDNVRFSJgruTf8IDuLPgDLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:45:44 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:45:44 +0000
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
Subject: [PATCH v7 0/6] ASoC: fsl: add memory to memory function for ASRC
Date: Thu, 12 Dec 2024 15:45:03 +0800
Message-Id: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcfd71c-a9ba-4dca-4809-08dd1a80fc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KxyJJK4f3sZagRpIfQMbCsS3NY/mhT11h+NW28H1jLxbwoIi6voXgqjBV1CA?=
 =?us-ascii?Q?sehVox/DG9kbSNP4aNFwS2NtFW2wbTWpNBVMgAf4w2XHF1naRKIOXW9EyUc1?=
 =?us-ascii?Q?gSHV/JYZ0VqgcPuFXqXbiq9+J96Ed6895dQQ7Id30EtR1RNfuEzSjoBqSKP6?=
 =?us-ascii?Q?bJuYLif41tpdtCbaQiLwY1YrJgVnkIKOuSt8aUkrD2k0xZR1oV+dnx0eWaGJ?=
 =?us-ascii?Q?9U5VlGBmY4nCToMqzRcGNdgKMA/aLo9vr1PShoy5S2XJHXJDexe1g0CHDGZZ?=
 =?us-ascii?Q?g4NE5NnjebRvJKwdYXPAG5yi8mUU7m8M2caFS/GVQy7uEe6u5U7M4EA7SWhG?=
 =?us-ascii?Q?Mj6t5jFyT1Dt0lvSRqFYrMEUOoz47fT8e/sQPNdChEGetgu0/UZ4PexWiWCv?=
 =?us-ascii?Q?iflYrHs/+W161ImdBqzTXxGY4UfX+9GWp5yEU829pp0bIxJhxsJOScAHZz5E?=
 =?us-ascii?Q?avFPUKVGPl8sv0mBIxOrKb+D/U9HoOph5qu4Rf3AuN2D1QO830R8KWY8iKp5?=
 =?us-ascii?Q?pQ1sCr8oxR2YKNHkHW1Vdk0rU8shG6SC3QW9QJHeFVzqlAHbmWPhJRu0jzfc?=
 =?us-ascii?Q?gu1CxnRFSP2BH9c7Fs5v4gKdQOfX1NkNTcQlkAmJyMRTmXzHblAsr17LZEYQ?=
 =?us-ascii?Q?rDDDAgptRVJf24Z4fd63u9849y38ZdOYoD6nRyjWVbALUJNoYCHMMa4CLqwD?=
 =?us-ascii?Q?1ohLxKKkDjajJ3OhzMHVujMW02b+cVNqrPcqJH9zW1pg/vp7dAp37XYan2A2?=
 =?us-ascii?Q?TpPjky+4TJV7tWGaZq2wHEIvRS3UtfoURjIm8umEKqmLi6MkrAAFCgKN1eGm?=
 =?us-ascii?Q?wQUxsV7GGrurEfbhUoKvjnZpW7NTN1fgYf7zMIQtPwKLJhhkLleroIsvl0jS?=
 =?us-ascii?Q?ky+16fKzkB4W7p7DGm54Z7DHhV/USVgLkZydCkY9EkIVjsvrYeRxX17/kTS8?=
 =?us-ascii?Q?+9F8Zufok9OuTufjDuQyPqoNfCQFQujwj8VYlq4Z2xHCWJNBPcVYWAfpUv6m?=
 =?us-ascii?Q?f4imVYADIlegQDJGNfPquW6WzOvXNFARe450gSt852ELOBGI9B6GOfSx1YOj?=
 =?us-ascii?Q?LDFTixmv0auMbX6Cv7Fn4AJJ7+f0fLo4b0UB6yNSDAmq4DTAyfR3SOZ4TaYo?=
 =?us-ascii?Q?wdqCMUlHq5WxOZZayBZh5hIZKzDM/7+Zpt0VzEf89XBcBqKgDEd4YOtioqVa?=
 =?us-ascii?Q?fTC3bA9bTdXYmwhFgsOCYWmFQmz9ZITOeAcqvOh1RZWZjT1uhQg8+pL3RteD?=
 =?us-ascii?Q?umWIcp3WfbdB9oiq03/8B2TbkuzjoOpjIXJkNn07EitAAD+f483D15B1DrNd?=
 =?us-ascii?Q?JGavFamz/bTzHLBPG0RwOwNe1H6fF9NAWnntNPtmQLnujHDSSCAFPAEDHT43?=
 =?us-ascii?Q?Pa8TEsIGED5wpvOdHySwrXwvnLUhzBVCMfvnF8LhAwPaTt4sf7g1Z0lOF8ik?=
 =?us-ascii?Q?/gsgz7QRUQo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgRiLjbvGs11phFMdOhvx3ZsjhFWWiHfGE/cmE4aCNyAslpdb2lRZEJO337F?=
 =?us-ascii?Q?iHLQnqtJxek+K0rTRE8sL0s/griA6aItIHyla7EGBxz1fHKju8+nNcSHgZpG?=
 =?us-ascii?Q?CdyiN4l0CdvtEO2wsIldJSx8+Ln4iZIV+wX2w1VsgCMv728/Mxi2xqOb2gNi?=
 =?us-ascii?Q?yKMycdbSG/rAjizkIpGp6kJsR+/JvHL4FkKiaWiQ50AkdGyP24CC+ZyTUkiq?=
 =?us-ascii?Q?TD+5ZA93ajXJ3f417thOPlpc9rkErTcZDqqRXwGbY0d9BgHj8cIcA1EfnXhB?=
 =?us-ascii?Q?KOvANBPXzw8Ivpd2EQ4Xl6ohEmU8jHYyEe8N6xMvLvc4SPXeJ23WCp93eWOp?=
 =?us-ascii?Q?U5muJWQQlS0VV8UipxNzQ6liir/VwGFd8JQ1zpRlX3mtH8VNZ2tLzY8LbJI7?=
 =?us-ascii?Q?QCwrfEv5ZmBUobbEdQmIl0Tz5O+NsWS5t3ZKRE8QQl3QPFFXxGg2a4zuBqOc?=
 =?us-ascii?Q?lGzOIoIs4xAefhfpUTgl5UsxEQZztqcMGKm+u0Q4NLqjBxd49PiGI1VhNlu6?=
 =?us-ascii?Q?TJ8laK6nK0QUHFuQWQu1K6qpga6S9MenPRu3Mq4fVsri7pKgnfgCifvE3ZZW?=
 =?us-ascii?Q?UL6O+4tEHzQ9THSasVvLP6rB67Q+K+u3EL2OciOxXXSLaDZkMT0YC8y70hns?=
 =?us-ascii?Q?zV3yPGC3/NLihv8ofFgdigJ8TgW6JKCATuZMlvWZE1/ClGNxuSmO3ZwugcB6?=
 =?us-ascii?Q?BaD0XvjIkuXRpA8NoFg2FFJCQiENnjQezXw1qVj+w++FGLkAxiz7bJFKXEr0?=
 =?us-ascii?Q?M69tIfa7MDndb4gv17Cnb/YoUx8Al4IX14CcxFt3makq79YrETbPHUG6oPK3?=
 =?us-ascii?Q?HOdBGdjj4OWcHBKfYrytxsQG8aerpQnDcPzCxz40MwcbH43Xq/znKV6gTolw?=
 =?us-ascii?Q?/OLluwvFqMMZLHmNbZokYzjvLyGmj+SRHu9YpIhNCEDWWQ1qeAzSA6laH10G?=
 =?us-ascii?Q?H8RZ15mnbm5sGn1E7+r5ewegbK3k/ljrFSonaA3zgwB2UddGYvSZwhb/kuaX?=
 =?us-ascii?Q?vDDbqNY4vIuMTxEBRuou58TSBmBRhG71oCh1ikqRonZjAKhyFQcB0Rqe4kZ+?=
 =?us-ascii?Q?0pDPQcdIsGHyWYD4usgHiNVTwi8tE1AgkPWW0wSW+EO3GQqrfsZhbuAQaZ7A?=
 =?us-ascii?Q?3aQHYxUlCePzMdCHvUa/Xmw1jTGAAW010tMAA6xaCfwPQpJ7VbwQaVeRyUBI?=
 =?us-ascii?Q?MAtQxRvSMHR8X/fUD4zIiPwWvczWp8cZhbifmC+KVllvuTNFndDRVH+9ogAL?=
 =?us-ascii?Q?7YjkBE9MPpT/jOnbvPBaIe3QppDAdh5De0koaBCVxs7fQTlwJsOLe40ZZPK1?=
 =?us-ascii?Q?87XL4CrqktzWG071PA3OFfByuIgrI8RA/CZF43O1yFzPte2vG+HSV5XhY44n?=
 =?us-ascii?Q?9oBepSmmENUIlCeJS6TPWlk3bOAiOf51BLzNl0qxRlqyYabEKYqAywU3cgWs?=
 =?us-ascii?Q?tTqf8dlSyYhO8ZWr8OsFwvOdvLXK04/VKLHnMZ1QgxpC94vM5cW4IA4KQNL+?=
 =?us-ascii?Q?akcw43lAFOoMJhkDgXjQ1sDSv0++JtptxTuG1zvh/drIAEj09ANaORdr/+nn?=
 =?us-ascii?Q?+8M6upKhLJlZ0Jh+8Exgk48iVBdUBxuQ5CZL9Pn5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcfd71c-a9ba-4dca-4809-08dd1a80fc11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:45:44.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TMk1IQyf4Dt0PIIF+OCCCF1dhdsaMfwxv4IJm1015cSbeyNtJTJlZxNJFPmA4qYxnKgO/feyU4nwHbItZJK0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This function is base on the accelerator implementation
for compress API:
04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v7:
- add 'select SND_COMPRESS_OFFLOAD' for fixing compile issue with
  imx_v6_v7_defconfig

changes in v6:
- rebase to latest tree, change to use 'MODULE_IMPORT_NS("DMA_BUF")'
- Add Acked-by: Vinod Koul for patch 1/6

changes in v5:
- Drop Jaroslav Kysela's patch as it has been merged.
- Add Jaroslav Kysela's Acked-by tag, received in v3.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 include/uapi/sound/compress_params.h |  23 +-
 sound/soc/fsl/Kconfig                |   2 +
 sound/soc/fsl/Makefile               |   2 +-
 sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
 sound/soc/fsl/fsl_asrc.h             |   2 +
 sound/soc/fsl/fsl_asrc_common.h      |  70 +++
 sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
 sound/soc/fsl/fsl_easrc.h            |   4 +
 9 files changed, 1261 insertions(+), 9 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1


