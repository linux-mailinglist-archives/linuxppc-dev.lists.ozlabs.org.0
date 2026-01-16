Return-Path: <linuxppc-dev+bounces-15886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D6D2F6B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 11:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dswlc3prCz309N;
	Fri, 16 Jan 2026 21:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768558668;
	cv=pass; b=EMwIbpnpfhvmhna6NTyGHMAn86d6iopMzghvunwKEtovaGUPKo3zlcce22OSkI7tAawcU8kAzF21lSqUncnP0rCvHNcqxj4SAgyqG/Ysat5glKv2Rh/ehkott+E6lrPFdWPa29s+hcSf5uhqWRCgG4TzojW/OFxRA/j9NLFvzFxL3skooZ68/a1CEy1hHiIyO3rL+oQGYbzu4CfhtMBBN1znOPlNXSEbj/hqRPTJC2YWcEwzt+sng0Jmyt3NEWVOUbRs9YTa7IVUitY+h70dhdgi5bIIKY20Cs1fxE7IXi/8d/8JXOfHHZU1OKic24WCyxFHp4FIbCg32qkaopEKOA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768558668; c=relaxed/relaxed;
	bh=KFgaZ4yguYceSjxDyQ3VwA46I/JV+3w5+HcrmGSRvrw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=moc6bTCfFjnQgndzHSOCj4S6WotNvxCDtwr6fylLkMLAmDBvh1p30hh38sWPbnNVEU1B2cowbtqmDYcH9VUqDhlSzTwJiTHVjEjTLPB463TzNrmoV+1qcHMyEnU5/Lssv3IdNAaVkwZyVSWsOBwznhLngPTI9EMyrtXUIUgB49BogvjtVAtzRYlQ3+M6164bgV1LxKyTtSKrfHEjonS77gENIGjLBYXpS8/Q1Toin4/SlEL1uycV2PkmYEAbyidfqNzQ483VYDsp/PUaCZRc0wTQvaS3Mc4huuR7qpWFXb61xHlr8aolj/qhy559cxS5PdoN0jwwEZUPIJXPlENLmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GG8hspaP; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GG8hspaP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dswlb3HDqz3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 21:17:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHRkW0dAERXpCq9x+AUkJ945Lck8I7QbI8dQc6iYtkmbebeIsJ1QJ6H+v9gA6Xt0afIDrCNZqG6C2zBsCR85cY1pnXDowKeqzI1vCopBqVd5TP4nP4xrBa41kqxz+KUfKCgv0YcU1BwKZeEhf2zqFYSzTGRXidWtsr73Iwcm/J8s0yDxkouceUXVcrBScAKP+wZoH7BtZL+IErGTANBuWfx6kzK2hzJ6q89k1346WNNJjgjhB33VpCD0fPazvPjD2+MYywtEFEwnfkZXD8fTDluO+QNEtrSXNBqNjlFEWSvA1JkBh/JQzWEvqsae0d+eOjSoD1IBEvMCyAHpIpFuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFgaZ4yguYceSjxDyQ3VwA46I/JV+3w5+HcrmGSRvrw=;
 b=rfwUk8Y8Fwhaa+t+8bG+iFc4Ru2JLJ22QSlBh7I5Crd+YCtAoGUHuuWNqJ2IcLOpxU5zKnsxPphVJ1oXVHuZN7RN6nswBVjmigrnNLcSuqCvWV4fM+x7AhQeH43mHLqAJEDoXEQXH21GEd0aZNODbAC6/cD26UDXdy5GWfvk0vGEeN+mxNAKqLQs2nIXHGLt7ACI0Uir9xceRa8UdWnWRegJae4zkNbHCJ7QaIpeL8NtdESXhuuapn0AZOrEZA9DCaXE1jkJXgk4iRriqmDJsw32BmIpJqFG/hHuz1JNvgL9qlUzx6GwAVoBwxj2RlwJj99ObI+tNt6NxfwqN/5LjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFgaZ4yguYceSjxDyQ3VwA46I/JV+3w5+HcrmGSRvrw=;
 b=GG8hspaPlaXXTzLjAZQ2vieOHqfZLS7GS9QN04cetnMI9Yylr+uS5f1RPs6+Vau6K+e4ossqhT5LE+KQMKAClMyX+Sh6jF66GTqTD5OCuXX8PEnYOUBInXZd5/MXmo6NbY24sHMajyizYk9izQMannCu1B4HxaaWQApBVWVgfyJhyLzsoEeTsH28Lu4+mL8LGsAYqhQsWPl7JJFuvMHJ7EKbH2rKPtD7EkPl46Tl2e7V1wuGnBHxWWngq44dVeVrWarlHgBnuzrIU+yt2YoJ8NFnVyxupxYfED6jdJRip/FOOYLvDPabzwTQf+pNc27AgjHmbEFjlSDn0i+5UML6hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11598.eurprd04.prod.outlook.com (2603:10a6:10:60f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:17:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:17:30 +0000
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
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
Date: Fri, 16 Jan 2026 18:16:48 +0800
Message-Id: <20260116101648.377952-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260116101648.377952-1-shengjiu.wang@nxp.com>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB11598:EE_
X-MS-Office365-Filtering-Correlation-Id: d9adbfcb-8a27-4a57-2138-08de54e8750e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OSdw/dsspqZtwWe47/+e1RUGQbUrFxgWsiwNyOoBlJFCJOEoHr5zn3RDyyUG?=
 =?us-ascii?Q?6IUhApl0Vj0E8V7tnZj7ULmXKt9Uuz1eHiGsQeWVSXjTGMrIvqQeI3Dnj3Zg?=
 =?us-ascii?Q?tj0DXNgBKwb2DRNpw1NhO9kAY/l3FLmbRTHHEGAYAY2b0dJqA6GAl2hd06m0?=
 =?us-ascii?Q?NfEAcBTU1/JgGQEsbKO3FEmpTFJuAq8a24M+6qsGyRAjhUUvRDstjJSMgA5Y?=
 =?us-ascii?Q?h1VqEnSMjW/iJPrhOinryFMcBfDLTh/acN93SnOurn5fEmhoQbo4shCTrMWb?=
 =?us-ascii?Q?JCnRPso5KDX4Eg3vnTBrfzFeLtnscqsruzldRJVWJzwuSPYZeT7WD+qBBoKr?=
 =?us-ascii?Q?4s80KTfjEzyYmRRtwRGx7LzdbUkxHcvWYWdXE5ZqIVzaterU8ceVoOcUp7pt?=
 =?us-ascii?Q?A8qgwQ4/C37Bul5u7IMu5BOh029ay/mfLZyuXBWnR8FG5U0G58xLYXxwFod0?=
 =?us-ascii?Q?oIpdeNUndppKVoLzsePmTC3YPUSgqR3YWYZ81XMqd5llISYyJG8YAm/3Wfqr?=
 =?us-ascii?Q?qM1ZK3S9DOK3tJXm1turcegvOjlUw+2bt2d3Ag8EQcc78bsACyeP1K9C9vwO?=
 =?us-ascii?Q?tbKtcgtbawrtiCQS2qxR0eL2LA0hEWfcFVU/3iign00DjVYODq5SBtwnMejc?=
 =?us-ascii?Q?ZRw9+vtalwAeEkGSjT6ehM6O8YGpYsZRdk0zBFbR3Z6fk0z07JnW6mnvgDWr?=
 =?us-ascii?Q?8qoGqql8fr47pSvFFAUVjD29eObIubTJL7qoLAZRbZF8ldbV7j0OnQvmo0tz?=
 =?us-ascii?Q?cIGHK6jeSdwx/j+S6kLu01I6yY0dvUIbdvPTv6R/+18JKh32QVnlwCRoWl28?=
 =?us-ascii?Q?yG8aaPQoU3Ye9aB1+rkCFBblpz7iMCQBCzXBV0/oV9VD66g/u4rVGR/ccHQe?=
 =?us-ascii?Q?GK51RwsDTfuE5zu3viyFnkvnVec1xDg9SUGudybQ3Om79+PuKmALgdqm7DRt?=
 =?us-ascii?Q?b+SVvmIzd4O71pYnvo0RX5KNDUZZ11hXiff7LFrX8uIDc9C3LELqreyHgbtb?=
 =?us-ascii?Q?spqZyAYGZVPJvvCX74IemhSL+hiaVpmBMDZed+sdhc4NZsHOLPWb+5seFM2U?=
 =?us-ascii?Q?KsLnC5uodiiNuSNq5iVU7jhnxvL1imFnByVGtuCnfWQbFXG1MadvqISkKQ0s?=
 =?us-ascii?Q?BMzJGwZgsCdTdoUy3m+sw3UBuM6ZzOQwx3I3BS7ppJtpFXgYK5M7Y4OMNikz?=
 =?us-ascii?Q?YX4vOlkL+R4g94kDhUqh5DT19Nue8QYxfYrNUKz2V33ZD94E2Ndjy8Q/rMNz?=
 =?us-ascii?Q?XWgikM44Leg0NYLaF+nXVOlNb0qkZJmyg8ZDMcxyxZecmWI7SmkssJSxS2r5?=
 =?us-ascii?Q?T8pAU4uYohWqNntexk+DW858I8lKH8pItNhDdRmUxNz+tMkf0VtvglDzRW8b?=
 =?us-ascii?Q?r8GgBZLpxmpINyZRQl7JwRJnlo4LQ5sYxsS+mELBnfv014Uq8IyK7jOloz9t?=
 =?us-ascii?Q?YpkxAwe6wyj20uWX2BuEYGh1I/adTnPZLGVxTpQAiLQV1SQftW/wPFm4OVNi?=
 =?us-ascii?Q?EHygVu1TkH7YIgFCbap+7oSDoFYXsvV7QQeJemt5M7GIQ4pv2GAivZ/Umvi6?=
 =?us-ascii?Q?525RWX2mZqV8wtx/APzOri/XtzEpOqqtZcz53jfkTE+2TpPbJwzWFeVC5tkI?=
 =?us-ascii?Q?f/atGVz5zr3QIsiH9UMxtimKUrWriq4Hoz0wygZurxga?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jSDlwQD9/9CDupMMx2NW4lIbsYyMO7W35kjmxoY9fbaqsP1tQYpRrHe17aMK?=
 =?us-ascii?Q?fRJ2g9/jFcm6sBKpDufZnBzRy502XHQJfC+72mDzxPN9fyu5uZMqrOtOxsAF?=
 =?us-ascii?Q?FcAMrJgUe6d/QFhxIN6vN92dxOW5vKN/zZJv9HgQ3LJqc3mco20y7CyQ6Sfz?=
 =?us-ascii?Q?cT6CV27rGLJBHoih13QKYL52j1e6vtYZ3SqKZceIycHPcispKbCsnTD0h3J4?=
 =?us-ascii?Q?1swYkhm8n3uEI31x4oWxg9Qf+6AMwHiefnhRWjxzifx6IkGxcXOTA0LKqsyG?=
 =?us-ascii?Q?vDiL1zyjHDF50yN/nn3QRdZ148Otfcgci183rZghWm6ybtU2bQTArf/57262?=
 =?us-ascii?Q?oX9jX4rQnxAUt4JRNzuABm0oLIrgrIJn68PA8Zw16E82pCb08PaELfdBloH6?=
 =?us-ascii?Q?4wQBk/aAKiu23c+cdwTrlrH2bj8p5XBIbUT247z9DXukIKfLUXLRMxenA+P+?=
 =?us-ascii?Q?2jBV/q0BKeiAqMEp/LHIKJ9eVkYczehi8D4BdFNW/lMcUHIIYLE4+qnvMtmq?=
 =?us-ascii?Q?lStfGKr7Tga1uMBi76bKhfRX9YbrDS7X26TLIikpJk0RCdeG3g03ks0+AKB2?=
 =?us-ascii?Q?BIFOCHs6bfQAgI2A/AgAs9rufFgrMWjKMZS6w074Ixjl5g+xsQG/IF8Mr6dA?=
 =?us-ascii?Q?A3jjgENxy9A14t36gq8yC75sL7iA7I8eyCRgnrgqsecnwg+kQL4ceqFKhLG3?=
 =?us-ascii?Q?XAFVdRWmA65Y/RPPm83ZM1WwbN0usDzYD6sjmTBlLYkVRVgZjriKu2o6eiYE?=
 =?us-ascii?Q?Pln88PKq4J1BRqyMHtU71AfPmL76KLlkR5UCiK5u8gjs6KsKZ9H9IPmd3DSO?=
 =?us-ascii?Q?3zijLGFELUVym3ZPa/zloXW6gKysehzuZLScneutQS4bD+7HjlKB0pU8dQNT?=
 =?us-ascii?Q?liUFG28NCrh8d8NnEKmfeE0CcPLkSBupSngfiX3foIR0Sx9uFII8vE1DpFpv?=
 =?us-ascii?Q?y+JZi/IrjNW6VIokA6GHuZtwvFinFu8kFVpNsGIWUXa7fC/DvY86UB5QxJR4?=
 =?us-ascii?Q?FkOTNuS/YECQk3yxkBGNnA7Rl0wllCl10X2GhuGgfhIx/OA86nYVAckrZ6Oq?=
 =?us-ascii?Q?rdbB24h/rdQcqjGcMKbNK3iJAFkMj5fq01dedQ8E9Tf/brknB6XvmtKNbf67?=
 =?us-ascii?Q?p7u/6SBxLXmnrIl9IhK6kzv/xIWbdrNqeElMgj+LzK+etgHwdYXOh3XY4l06?=
 =?us-ascii?Q?5+lj+HyD62aSArPC03h0wL8cv9PZazpHT3ImuB3mHZI7kCBoaEW6JfCIahMl?=
 =?us-ascii?Q?xH87jP6/4HYrrbi7PK9//O01ZY9lS8AITxtHcBbl+vqq3Ht0T3Z0euv/BQbJ?=
 =?us-ascii?Q?WY0qJeQJXxC9i+CiJzkpJHB7KxrOdVZQ6W5OyEOyfLjuKaX4ohp6+qtNNLod?=
 =?us-ascii?Q?b/XRMvgM3UOhJGINzfjYbDZ5tYwq00IzjPrifZHEydkQPnMKTgx2pOyYlhCs?=
 =?us-ascii?Q?JaBR9biECwpGsMAH/sIHsm5pOsSJL6R02265tOnn6jLJt4xOkTCJRqmUImna?=
 =?us-ascii?Q?TO8Z/08/e8ktAi2WQCtoE1GK8NvtkSKQ02CwkQh4/WodpeXaatccA32+RJtp?=
 =?us-ascii?Q?USrodQlEyqqlad/a3e7HJzaD43sH5uwpmc6tG0QjCGsi/ksUSSt8tsSdvQxB?=
 =?us-ascii?Q?Cif7z213pJAvihs+1O3yjUWRhg4H/giN3vc4Vdn6b9S6GgX0Vbxf6thmD+Qu?=
 =?us-ascii?Q?Q+XYjrQiTkKo7l+6xW0e4Y18dQ7vL1UH4Ri7k9b/eVHv/iKIcipeArsqAm7y?=
 =?us-ascii?Q?YQHwbp5SeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9adbfcb-8a27-4a57-2138-08de54e8750e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:17:30.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82nh5ONGdaZYIbobZDtMf+bjGkPniMVhVa+1R5yeRfTLO3Zhb1mDGP75PrQ6sopvkyuGDHNdeeZJdcCnYyrDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11598
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add compatible string to support AUDMIX on i.MX952

The audmix module can be bypassed so that SAI signals go directly to
external pin, which makes the SAI function independent with AUDMIX.
Add struct fsl_audmix_soc_data for this soc difference.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/linux/firmware/imx/sm.h |  2 ++
 sound/soc/fsl/fsl_audmix.c      | 28 ++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_audmix.h      |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index a33b45027356..1e3e0fb1ef81 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -26,6 +26,8 @@
 #define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
 #define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
 
+#define SCMI_IMX952_CTRL_BYPASS_AUDMIX	8U	/* WAKE AUDMIX */
+
 #if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 7981d598ba13..f2187b45eeec 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
@@ -440,9 +441,22 @@ static const struct regmap_config fsl_audmix_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct fsl_audmix_soc_data fsl_audmix_imx8qm_data = {
+	.bypass_index = -1,
+};
+
+static const struct fsl_audmix_soc_data fsl_audmix_imx952_data = {
+	.bypass_index = SCMI_IMX952_CTRL_BYPASS_AUDMIX,
+};
+
 static const struct of_device_id fsl_audmix_ids[] = {
 	{
 		.compatible = "fsl,imx8qm-audmix",
+		.data = &fsl_audmix_imx8qm_data,
+	},
+	{
+		.compatible = "fsl,imx952-audmix",
+		.data = &fsl_audmix_imx952_data,
 	},
 	{ /* sentinel */ }
 };
@@ -450,6 +464,7 @@ MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
 
 static int fsl_audmix_probe(struct platform_device *pdev)
 {
+	const struct fsl_audmix_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct fsl_audmix *priv;
 	void __iomem *regs;
@@ -501,6 +516,19 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		}
 	}
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data) {
+		dev_err(dev, "failed to match device\n");
+		goto err_disable_pm;
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "fsl,amix-bypass") &&
+	    soc_data->bypass_index > 0) {
+		ret = scmi_imx_misc_ctrl_set(soc_data->bypass_index, 0);
+		if (ret)
+			goto err_disable_pm;
+	}
+
 	return 0;
 
 err_disable_pm:
diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
index 479f05695d53..ad40a959873b 100644
--- a/sound/soc/fsl/fsl_audmix.h
+++ b/sound/soc/fsl/fsl_audmix.h
@@ -92,6 +92,11 @@
 #define FSL_AUDMIX_ATSTP_STPCTR_MASK	0x3FFFF
 
 #define FSL_AUDMIX_MAX_DAIS		2
+
+struct fsl_audmix_soc_data {
+	int bypass_index;
+};
+
 struct fsl_audmix {
 	struct platform_device *pdev;
 	struct regmap *regmap;
-- 
2.34.1


