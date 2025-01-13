Return-Path: <linuxppc-dev+bounces-5137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC35A0B251
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 10:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWmYb4QPNz3cSK;
	Mon, 13 Jan 2025 20:05:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736759107;
	cv=pass; b=Q6c99xxnL77r1yLomNuYt10P51dgpP0NsYY+wL/NB1bcvRXBcUaoY6DTt8t5SJN4GTuWbZhf9yulgeYxolkzYPaKRNFtMS9P2Op6U+vayYOsTHs9JdIXmeAJ2cJW0OM2JZjJkZ2C8IZ8Xbz2KpWtdCnUyBW7XDfKAP+936knz3+CaD8dqhvrIfq0Hg/slIIU1iuXUFJKfKzIU1U6q7z2dSkWB6URb9AWGxMhwFJOdosFQGbz3ko3A3bFwD9yR662494n9BfGMSkvOAgtjdjhjsjTx3YRpxD1BSyWTp9XumqU4QebgTPugGOr5akbNhHQNJtjoGi9eBU6aTbFapXeYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736759107; c=relaxed/relaxed;
	bh=CEtWM1Cg0IR+sfMW481GrdMby0bSCxDNZdqnVDHHncA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FFEQeXgcgbbx6wbRUpai6C8osURx8a96QRZW9hvjXN3s04BTaIorZLlxKjdOqzCWbkCI4lKDCYcJtrXBbgBwx8uGJVhrKDqRMB+uLMMIWniA+qBSFZm8GjGMcDyxolgdW0YSmmOZMElKh5laK4bLbQyydpN6ms5bQMTlR/GbDj7Tht/AKBb3ThCVcjoMRUTLr/dzeVjIbi39vCjOUVGd9c2mQXDBhFi+DKrU7u07DZdq2qNg6/wc9O1w2TkTsVOPNlpB0ccv8H85qEl/DAni4s+wVILGSQm5LpEiBdFNsoim2HmpP5cKGjJvt5ULrr165v0G6S4E+mSZVqIfKPbSFw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SC/hXfaC; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SC/hXfaC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWmYZ6d19z3cXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 20:05:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqK12M+4omUSFfmCfVBh/hOIkfFriM4LdUW3ATsh9Lf1UumQLUpe3SBpJqq9sGOtVRPQZrdSlbxQ+SmokCg34mD7LSSWgFuruzjaE8Nx7h4J1Pw0b7JI/1fcRd/ozuHuYzxq8UsueSjq0T9Me0IFcGWTUv/BrGLBWsfnBExOw7wcVlpO2y0ZWbhsvw73/OKKD/Agt0wXlOcCkExxwthFzyJuWoCdsNXe7tYEOaXZLuPwZO+zJ+2LjplzpOiRH4d5gLWzVNStqFz5wX9H1VTzVJa0cKSk6yjw0k5lGx9Iy6yyM62+ZiOWVRtIsrsj9WDL34q91PIal9ObPXy9QNKxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEtWM1Cg0IR+sfMW481GrdMby0bSCxDNZdqnVDHHncA=;
 b=glKfRGpJMZcM4kUlScL5rewk9e+dhI6ahienYhf/lxtRA+d+uRVE+1rLQ2nj3A4zMdI4usDRfNnswXRmoOplXMGWpXVMOtI2steLS3PjKP1QU+uxNLMv0YIY32PiGcBPmz1GacGJiQzAziiuwMjR7hTsyOGfEnHzjOkHAJvz9MUTpiKuqCt4mnaBBnJ3pHXLmRwWhu1bEPJfETgi7Tqz7u4/IiJOCNUrAUh9nCM8KXG4I7T6Z2hUzQLbq+Ku8DeSbvxNTN7K+rcztPCGDjvy0JfgfxUGr3rD1nOLZCVyPBQdKMgQiPA4eb4oybPh7TTVzXrj9IJNZ5kikA+l3BvSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEtWM1Cg0IR+sfMW481GrdMby0bSCxDNZdqnVDHHncA=;
 b=SC/hXfaCf8EHseL5fi0ZXR9oijgOpJH/E5dMLiHDTAxHC5PGCB2EwgpJwygcQL1dH3wN02ShA1AjuVJgmzussRfhAo3g5klVCPDFCwHge67BGVw5wLMNHT/AKSlXZA8cRbb0ZIaFhuehxCEgL16ws8awKDXeMB+QsQsx37i6wqGF5GfPG5WSP0w8TX6RTiBXjD/kxQp4S6rW2DW+H7BwqiLVkwpJWOXQEPO5Sw82RX1FGk+JMu2tthnoGyDtqo1sqKr4oMTdbzsnCz0OJQ5PXe9Yylt7z03d7BdUu0SNsjPomP5NnhExsK6gg+tyNbvdnlH/K6X2EC5P+ID5cnj1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:04:50 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:04:50 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_mqs: Add i.MX943 platform support
Date: Mon, 13 Jan 2025 17:03:20 +0800
Message-Id: <20250113090321.3193464-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: a338db9d-fa11-4d64-0ac6-08dd33b155f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9gUGPGuBE3k3YC8O3VIG+knEf9PFmCwpKZ2QwGKwkD878C7OBKsE5MDKal6?=
 =?us-ascii?Q?7+/v+cNdHffqB+pkQmBCrinE8sh51g8Sdr87IDQMxNkMJ3LuuGNrSuJ6NB0s?=
 =?us-ascii?Q?P+mFQCb5m0uW0Z6hDEH3kB1lO7nib5egKi1GLe4dHD/Rmgz69Jd/ygF0zJ2w?=
 =?us-ascii?Q?j2LvuEv+IQTeVl2OgZ0ygWdkKDwoYo++musJO+clKTq+BdMsnt5jqiw163NH?=
 =?us-ascii?Q?UBiI0WrZeEzFrglsncDnB4PSWwm9mxO6wDzDEHPys1UD06TSUnuxsjc+t7G+?=
 =?us-ascii?Q?e/tfHniUd3JmZc12Pp51YX1QI0HeORZ/ELV2Sa/PGxoRF6uNZap2/FEznxDn?=
 =?us-ascii?Q?S9oYwE1OomkOuWmHcg0Glq/W81w47Uyfku/DMw3T+i3Rgg+sY8qDWNi1HpNL?=
 =?us-ascii?Q?QDPPgbSHtnQ5ipyDeSNyQ8k9Mtxj0pfsGouEs2EvEYV9ZDPRKFWU7W0mrG65?=
 =?us-ascii?Q?Xs1nKnzi51bsv18GdvnGHzunm4Wf0Yg3MUT6ZqyWd/U9qBoA5dkNuXBmTghl?=
 =?us-ascii?Q?TrIJSZGAoXSYr5JzYof9fzges/Lnooa+17SHCWGWtlgpwACZVvYVZb4uT5o0?=
 =?us-ascii?Q?i9UG2WswlXOZ8ARRmtUUQ0Pd6u9HEYxu6wKOCHaPa7m+ZLft0YuVlNuqkG1+?=
 =?us-ascii?Q?W6OItAgnsdixu7lYzXkBt2WdKbgpZZYxV+diWDcwLsG6O1VrNSzoFYx8iU05?=
 =?us-ascii?Q?gctOpbyjY7k8IG9YtYR6AQSfBHYDsHUMdqY9PlhNbTdLLKorUnkr6CTzAUGY?=
 =?us-ascii?Q?LlJPkdL2EOD9OyJ86Ai5S25Ys59u706ZcrCstSGT4OE9SuL2D6Xgxrof/Q1U?=
 =?us-ascii?Q?SvzeNvwzraZ8FI2/8vV/gT36sMvCdONSuem7QTIOaO83JQof80X3clmN6f18?=
 =?us-ascii?Q?0CDfeXDMztdtAK61iwBycn92JyJ+KuObkicibzQuDoo3elUOH4se58SJ05ua?=
 =?us-ascii?Q?c2INVPPMz/vb1Aqur7srU7Pr5Pgxu3WMXP/5S3YOFl6dNx73M0reb0ZCGJbM?=
 =?us-ascii?Q?xdB+H+intcAgGr1kMpDTYpfUE2dCgxlTin23lsYHuLdk+lPgFWCmJK/eRZTf?=
 =?us-ascii?Q?cwX+QH2dzfDZgKS7JtIldKf7XVQPCkk6RMLikY6xdY4wfme/uumngMzL5IDu?=
 =?us-ascii?Q?6doFOwToPC4rw/87uCqiogcB9A8RUXid6ZvrK5F6MF6gWOw5u4UvLQCxo9B+?=
 =?us-ascii?Q?DD6GrewLp6Ozffj0E99tJYAse2YhM9qmelE+tJrKceZz26aGSc5Jj9PG24E7?=
 =?us-ascii?Q?r74gXwvUpZ5KqjRCOMHKPOT3VBXA8krsRmPUWqUQLrYROT7ThcVp3yzcvDmb?=
 =?us-ascii?Q?LVx9mRoAESMpVkc+SgFPgNsXfqASrQhzQR4vqmvpGfpkY9yEMfJGXAjpb83k?=
 =?us-ascii?Q?asr8dZIRJVOTcd79RgoQ6+T3CQqrab++rgVqiKXzzpt4p9/PmiK1JJJKFrlC?=
 =?us-ascii?Q?6eyGL3A/O+NzHOoURyYn+3IGqfW0hgLb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sGTBdafH7HgCMJKFF25UdlQdQp9MOk+cHtDmzjSxQWkQxU/wi9darmMbXs6p?=
 =?us-ascii?Q?TWPxPgQN4zpuw6OODxVbjnNM8Hfk9SSIpch+qYSWJ1vCjNYOWsSQoie+yLdL?=
 =?us-ascii?Q?9n1qp91C9hB9XRoqeWk0v5Ku342jzWQ96FMv4Rze4RzQjCEy19CxA2czb7ke?=
 =?us-ascii?Q?V9hHkhjHCYKYibI9fGDlYjw0hTmbF3a2Z+1ApWZbaI1I/4sAIE/piGBQN3fv?=
 =?us-ascii?Q?Ca/SZoWowlotbQM/szVkDN4xU5mFKH+sPJg5sXfOB4cERdFOIwoBqYBsKS0H?=
 =?us-ascii?Q?J+aI3jaTiDXEzgAagZ4Dt3XxzSAJ/lVDlyYEc+SMkJdBWdufH9GnSw3flOZb?=
 =?us-ascii?Q?8oxBmzQxrotQNqPGbI1+HH/7I9IRR4n1nuX3LyFWPYS6jmLf3Yb1+BiyRYGE?=
 =?us-ascii?Q?sdSfFOgxmHw1/up5aydXvTH55uRzrBDInULL/S0fj1P4vLLywGWaDUtkv/if?=
 =?us-ascii?Q?aShQ5KYDT8q4lciJMrNVy69K14dpVX4ER9SK/9b1Ns24dCZ0tF5+ARnBAxth?=
 =?us-ascii?Q?sntx9XZLQnKwccOHmVOrDHnSkbAD9J2BHlbkqSfTywpU9/tg7ajtLGh80ivQ?=
 =?us-ascii?Q?FaZUiJRFMKRtvEFW4RtGgj0IpwECldgOZJUBQ8AoOotYQsic/bJSttA5tqax?=
 =?us-ascii?Q?xnbdLKMd5TRpQanhkgOVPI0Nq4pNa+pB61xarFA+lh4ZMyfRTrSz2jVBH81l?=
 =?us-ascii?Q?HdNcpTmTH5t5jcdBE3AZw35T0KTjYRvtJkXEKWwkMPKSajiQPaqYyy6igucD?=
 =?us-ascii?Q?+UKgSqCUO08SOCdiKyn9T9haxGJ4AwleDQlw1areQM9iWjG9cf2U26Exe58w?=
 =?us-ascii?Q?laRg8mPpTHBmi5ABL7UEBDxQJRj1DfaDppHYSNp+C7EjwyDvRD78wJF/CtP0?=
 =?us-ascii?Q?+lpZ+/ETpuV6UP1ABm4z+I0jlqiJVi8Qg7g0o3iuqTyTL5qWROn4gbHCPbPm?=
 =?us-ascii?Q?jPsFuWUFKcfZFYfTFjoVEoqReI83/Uo4ADRSn/XhgEn9NQAhTRERNPAOYzbP?=
 =?us-ascii?Q?quYXXsiS2V02HC7knkbnIX1J6+PhWAW+6Cc3+tyD6WCueWX5y9uer3EQk5O2?=
 =?us-ascii?Q?BOst0WDzZwWv1Ow/kv4aPDI4P+mZXqsXiSKFKtqTy34ut66iCer8CJnkGs5w?=
 =?us-ascii?Q?k6BELFTv3G6O7qgl0rMcthQqYbQHBqPQJHGa9tj4dap6KL4yGcb/pIsQzbAG?=
 =?us-ascii?Q?8X0n7EniTWCJNJD5L4f7yMENz7lShC07v71ItoxiwlFn2Y/4gKj1IpQp610P?=
 =?us-ascii?Q?CyzY5FqpbIbSMAbF9bZxvOeDX1/cPTg/NKj7h+iE5lz+2ea7/cqK8EClB46Q?=
 =?us-ascii?Q?ttooRgZLkSHYMIh3rbR2j+oeR4UhRe7g1N/CElAWjJJivG7wdqWcx3bt3bhK?=
 =?us-ascii?Q?Yg3AmmPZ/wUeBRApTvGJG1rnHOTPvbDi6wdBIM7QDuMcKrBUysUsF1a7O9fV?=
 =?us-ascii?Q?oRyu2dXjijF27eWN8dKz4yb4CLdx/VQ1s+0l49QLGVqKUYQA4iQr+5EZV6sk?=
 =?us-ascii?Q?9aRo6VNFugOxoXvYeef7xjORFqmDfm28lfiSoFD84W5DE0f5Iv43wawdQGPk?=
 =?us-ascii?Q?v5cXEIO8iXNQ1+3tLpOH7pNEadIbhaCuOUdmy2c1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a338db9d-fa11-4d64-0ac6-08dd33b155f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:04:50.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w3kRMBF7gwxOoQ/+c76kpv5yS46CGMJbW5glrnAhbiwuiOK6ZT1uVVu7Y7nYZDBTnMYw4A6f0KlRT2a6FDZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There are two MQS instances on the i.MX943 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

On i.MX943 one instance is in Always-on mix, another is in
Wakeup-mix.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 0513e9e8402e..e34e5ea98de5 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -410,12 +410,40 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx95_netc_data = {
 	.div_shift = 9,
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx943_aon_data = {
+	.type = TYPE_REG_SM,
+	.ctrl_off = 0x88,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
+static const struct fsl_mqs_soc_data fsl_mqs_imx943_wakeup_data = {
+	.type = TYPE_REG_GPR,
+	.ctrl_off = 0x10,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
 	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
 	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
 	{ .compatible = "fsl,imx93-mqs", .data = &fsl_mqs_imx93_data },
 	{ .compatible = "fsl,imx95-aonmix-mqs", .data = &fsl_mqs_imx95_aon_data },
 	{ .compatible = "fsl,imx95-netcmix-mqs", .data = &fsl_mqs_imx95_netc_data },
+	{ .compatible = "fsl,imx943-aonmix-mqs", .data = &fsl_mqs_imx943_aon_data },
+	{ .compatible = "fsl,imx943-wakeupmix-mqs", .data = &fsl_mqs_imx943_wakeup_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.34.1


