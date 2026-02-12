Return-Path: <linuxppc-dev+bounces-16828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADW4DZJ/jWmp3QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:21:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21212AEB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBRZ25cBRz3bf2;
	Thu, 12 Feb 2026 18:21:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770880906;
	cv=pass; b=JMcI1fZEVz533SJI9zejg6qWQurKLC4o5LDmaSwZZFajL8NZR2pITf5fVckmlxLFbgRCsURbl0zcYYdsaw86ceja+tbl68jLT3CrPrjeSuavJLYmwg016g33uCNkLgPxN2UtrYu7BFERNbYdR1kUrvK8xjuuEK4Lr4s+hZCvTKtyMCC5EokpEBrG+ycWs0VSMjC7i9/u43csOqUZqQg8wgScyidW7L9sOlcXVz1HI2iy5VYGn+YW2VMyww1VamUbdzI/tP3R1BILRZkastpbQsDKWUzkAZ8SIWcg5EE7SmJzhe/J1NN5ky8yhKQhcJDGCIwVuskrKJoLYgGyfGrFwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770880906; c=relaxed/relaxed;
	bh=fmt6dOEJ2eJjHWDQwiZl8R52eiRqVhFjKRYWaP8Xvgg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UVHW5s8LA/YiTs+z2TDSeanrGNE0EeuGDtXnHGK0sl9Q+i4Jv1wZQWcO2LOmUnKen239mkCylmJYnJY+y5vEPXdaUIqDTIwGz+Yxdq5cEKstcprM0V3sAA0e12WleqbhsuRSvbN+QZixiXogMUxzQYZaZifkJBam6ZSRRz1NMGaZ7AZof9ylZqz5BJc7hPvAY2roeJa0FS/cyoPAPufxBaBIzJG0t1bBf9EnzTY8ZDL14WwBJSU0ISa2V6C14iUqtEfmZE2utv8PQCDp5MFd+KI96I3F3ofD8A5QxaSft2L+QyQqMokSjOyKgybb9O9zJ4/0HPMIzhprde9rvKE39A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Bm3cPhb+; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Bm3cPhb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBRZ15Zqdz2yvy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 18:21:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De+jt/8UvHh/ORArDpIBDpESXbf8dkZK9YUmy2yrNNCQyGKAWV7IqokW1AHEv87C7Y9qdhC77vJrVMv56914pH6sGKvuHo+FhZ4jhib4fQ1svKc7Wau0zI5WMifnZ8xDJZ1gRrvbEnhjXzaGT3VknX4QWjydv+j9rE49A31zmrQA629yL+gRP46at8NkX0wlsRgIUO3IaH1bDJlqSrhh6mZcdZuHWmWePOqu38DCA+dNxWucEg4OIHr7FvEhWXNxozOb65ti8Oc33orU0QGl5vrJYihJUTFoccC7pOGWOLlwlV1D/QHyI/l119G8s1Fc46kPTpb6xRFSC5p933tBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmt6dOEJ2eJjHWDQwiZl8R52eiRqVhFjKRYWaP8Xvgg=;
 b=qF1LpLq7vMf29huEK3rRCTrLzS5dJ6VmjmbVwQc10qvP2o0WeoPR5UKjPRaHImvkhbgIzCByJcgDS3vW2cAcViqc4Fn7ScLTpDUp9oj+ADpa50BWdqClbrggNTt5LCfsasvuBy0SDsxKFTWlCQ56rakJ7aLFFbuKKB57Yjcx11YTHT5H+3nfBmFAO/kG+ZJ1OmRsf5LbQkkZLHUjhotE9aPoijHqL2iLzNVu4zA3svrVNNw31J3x7h6iWMfd/JTZ+SpTSP0b3IYHGE8IROg+JsLtLwpzcMZ75MgvZM8YziiKN1CFJFZopsD9MR+zVOI4F2EpFA1gWuEsHBb9cQSMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmt6dOEJ2eJjHWDQwiZl8R52eiRqVhFjKRYWaP8Xvgg=;
 b=Bm3cPhb+atnKwBK6WPJMmZ/OLnZWNT3e8y6SzYFQaubs1jlB9h+zIBXGDDJhBbkWTaJMZ9XLAVy/N6CAuYl1dfDXrxVMHBN/1dVjijbyAFI4vEVNJShmR51+tgY6BvPn8YgNEyaWgjrU6u1aKMJg4uwLPGERnuwSsU1bb1P5rNjokhYxMfBpj6yOkhXP1w7/iqaa33lh66hx+FucDYBX2/MRPb8WXh0T+UMolnqGbR+Tli8+Zier2vSPumISrjC05mJJEtfBjkajxEtNaCn9KKwObnOPVHp4Iw/Pct2gHk0EsTHnu579is6cfNeNIhH3muQ8ndMvwi2cQ5VBRIoJXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:21:14 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 07:21:14 +0000
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
Subject: [PATCH v2 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Date: Thu, 12 Feb 2026 15:22:28 +0800
Message-Id: <20260212072229.3247604-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To VI1PR04MB7055.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: c0925026-9973-4855-08d8-08de6a074e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aPdYBZxftQyglLDGS+1G/08tpAPJO3WrR+XMDYRXal5fPw0p9qytqA3irbc7?=
 =?us-ascii?Q?FTriQJi/t1ERpcYUAV7wDyLY+UnmIhb/njNWtV4KyadgzkyZqGTyJhwo7X9R?=
 =?us-ascii?Q?rl+9wUxyNaOqeqi0AGo7yZ9WsWjuRLjHMk+1F1YYPei3vRZJb9j3tvJQd50g?=
 =?us-ascii?Q?bvmnZWYnPXWk2OlJX3rHz0wQqBCdMaKk2/w2Hh8ar+rRCPDkFmNvQHwAr+RL?=
 =?us-ascii?Q?yt7QDxA7jR/qESj6DTAmWzhhAxpmQVUr+49CSq2lbueR1XPF0YVQUwCxhbcZ?=
 =?us-ascii?Q?rLrAiE03D921jrMbhGBKk8l7uN206XM0L5TuHjOsjgdIPHa8ZT1zc6RSiY5D?=
 =?us-ascii?Q?epBqEfk6pUFFOYYOQtoMkzgFyLMnEyt0i5ClkvqINCpoHVUx8s4tsphiFfzL?=
 =?us-ascii?Q?oc6Lh29MHtL0RBjKnyMSa4bvOFlhbWQmLpPXgWynwO2xPrd+z0uuVF1TuiL+?=
 =?us-ascii?Q?kIvEk8Mm8e88hGNuxTjZBWf5Rxnpsp+tGk73flrxUvY2BdDHITAemuWpCW5J?=
 =?us-ascii?Q?kUzaeeCjk3E0kkEp/KRX4Q3ZbsB5aB2frE2KNTFSsKdBe8ghADx4KApRB7b/?=
 =?us-ascii?Q?XosKf7sMzAdxig0FjSLgm22TXmNI66iZaogtCNpE32wIN5kdumGNt23UDmIB?=
 =?us-ascii?Q?SdYqjgSyVQeppRHWUPoZ4R8rxmkaqwJUXeiCArA3LsMLaEsFyqpS+T1SGgjK?=
 =?us-ascii?Q?VQek/Atg6icBu0LoZqLAm6b/H3k7xx8QmWCaW5i2BmmMpyJ8Gp9Rnv4YFMQC?=
 =?us-ascii?Q?5Ne10Fu48qvOgefmXTtk/vwu3EyxLsKN2lsvJiluq7y12sW+8dE9d+PYLlpz?=
 =?us-ascii?Q?447zPwKLeKEn97x+pxTnjShusbbcuHixnGs9a9XGM5iSNrCfLB0JSiRwlxDB?=
 =?us-ascii?Q?zZWLw5pz6IO4UgQP0AXUw2juYpxK8AE2JSc+hdHwnMlyomhHVJB+HF+zvVpI?=
 =?us-ascii?Q?v2/6Y8WWXAVhp03pPHYAiyItXQCkWpuSEsksY/t7ZmXNmW6RkN/4q1aDs9Bz?=
 =?us-ascii?Q?7xfsWIqUSa3scX0WwiVTTasIN+a1FKWMyws2YUCvlFsDPadf2aNoTJtQeVcc?=
 =?us-ascii?Q?x6FSwYdwsZnxaR3qdt/NXEch5s0FyKJJIg6LuMuZWU90GOMbeNia0GawcJDH?=
 =?us-ascii?Q?YM9HKqmmw0IKWH3ro6cvTDihodbTLNnJ6npRBHHtX/Jz26gsPDuSerkwLdPk?=
 =?us-ascii?Q?/r9aQu1HhP/ASreSixUgmqHUiOFZ+6/lRPyGSd0zT77bG0kRzYnYL1FFuwxp?=
 =?us-ascii?Q?MdP7BfBCHjTR8mjaYHqT6lDQL8BlvdFu+dZoTQKgXbYzrvtjdRwgLTMkuElD?=
 =?us-ascii?Q?phOe+rFTHRLsmwRPWrAytjFsJFyZ+LXJ0s4RVsyi3IHoQkn8W7YhsxVIFs0q?=
 =?us-ascii?Q?WMm9RvjGDOsi3oXrOvDXWipeYaexf2qb+cSe1UXmRktdejiTfM+9NHMhU23U?=
 =?us-ascii?Q?69T9FWigkY5JOHzZ5RwBcg/EUpOVW9hgOriV5XNYUErSQUeet5Yj42G8lo9J?=
 =?us-ascii?Q?kRTXMqD0zJLiIutgBH7ggxb64G3YYQdTGXbQb0rs5ccOXnCY9ccqqLK9Ld57?=
 =?us-ascii?Q?2hEI7rnSAgkMbULA5zpzAoCXj4G2vrnoHqS7Z0hsx2KqjiG4LRPEuP5dtFSj?=
 =?us-ascii?Q?PdRFgfiQv7jz9y1KxasVXiHrvzuywFX5s5rMWKGZmR5S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fixGhVYdJbWjhgzjOQdwJ9NwEzCjnDqxz8egJC5k0AaP3extYw1rBCXQPLHV?=
 =?us-ascii?Q?YK7UKA/oCuA9OM6AfEdP6uvxn1uD7Cb10YM2b2Gyj771XSvZwV/dKgJLEGm0?=
 =?us-ascii?Q?oP6Sdy2LOJDJ6eg1uwW9MGUpCYH1hC0vWXP1ozz5MHTlZ0qXZYoZ7QYeVG+n?=
 =?us-ascii?Q?JDrcQBM9wYl4NERrczy3CRDH3V+IfuLY6eHARdcScqwYeGvrrSZhuZ9Zoxfr?=
 =?us-ascii?Q?EgyJEJ83unlF2CaA2zIwnXsg3bwnk0VEthGLxAXGTpr7l3sJLUcz7uAHKbKK?=
 =?us-ascii?Q?DjV+AE6p48kZ5IKhrA0VnTs4NFY26PM8T1QCiQvMcRU/CHoWC/SVPbJb+rTm?=
 =?us-ascii?Q?5eBGC0C3vqEd6gdlEkI+c9mQ+ZXJCXhvl6MEBBjuBiFvI/QQgBy/81R5773N?=
 =?us-ascii?Q?bj0lYLSa6b0UvMEa37Wn5gkOMPxBr8JQIgpbYnQIkqBrsRiL+z+sLyQIgIBQ?=
 =?us-ascii?Q?P1uoXLwB8Q7nofPnBwkUQhk+6jS9oHdQZxWwjmg58DK/LszjTcDkRYBtLDdn?=
 =?us-ascii?Q?EXGJym+jWp3J8HD4rjCF8EEAdUT8P8TQFY/rPe/aI1wtBSXOGOPtE6bp59/9?=
 =?us-ascii?Q?HbL503mzxFY1eM7G7UHoejsWvIt9dcEZYCfJKS2rDlNH8Hy6fSG3ZlUSUzOu?=
 =?us-ascii?Q?aVWR1HarNrYxRsNRw4Zr7Mv2ENbGalUTYg9ESP7ksazSZ7zRaJNIqrR66WfE?=
 =?us-ascii?Q?1eF+abW/215I3odV9rKU4As3PGhJPJ9JPoahkHN+mJDEAzlX5zBT3AjEJaPw?=
 =?us-ascii?Q?X2wWAUBWfLLNO8t6BEqGNyImtxcaeKnuUFDagM+W9YgobYRW9h1ER62fFLW8?=
 =?us-ascii?Q?lipjbIg0GwstGGlfGzLlICQ1aZDmKo3zx4hzNgwHkHdKq8arHetXgIOWtQTS?=
 =?us-ascii?Q?ssp/VXLL6YY+UmrwMr882spVyqdQjtQXZuKlBSsRqogFEgWvfnDMFj4UOrTL?=
 =?us-ascii?Q?u5xZys5ckur24EAnbAigZmSAh4GLq0Snwb3JDMR/411XCAthmgWVUjW2ld94?=
 =?us-ascii?Q?F7dC/ErsRVF6PiS6Z/8aZKTQB1ckiS7stlBQdfqq0nnAjN8lKGCybRNVYpNq?=
 =?us-ascii?Q?OcMveym4pH3RkVov+nba9BquQVicCJiD7m/K9+n0RG7NvQLJ6FOo0oiP+Toe?=
 =?us-ascii?Q?oK7seniq4+DmDjFSxIGi7LTCjrLOsP0hF2qA327q1MgqjCbqY/W97aXPLh5a?=
 =?us-ascii?Q?7InTX/Ezw5w4uL7/MbMM6Yv361obRR5OKJvklJp7ipPlZQ+LBkn31FlgAX7U?=
 =?us-ascii?Q?LjqbgnHD1I+Fvo/IstUA9EFePlAVGWUqvewYh90HIgvsNS1neXIzJY30UIfs?=
 =?us-ascii?Q?D2pw57rvAXDRFud6fN4u/3IgZddwJzL3msFTaLcxZjV1sPTIMpwZc1K4UuBn?=
 =?us-ascii?Q?XjIPVdvlQiRLiS78kH3w18l8Yoj3gM7qQlkcHoiFkZJHDIh0JvTOYQG2aGkT?=
 =?us-ascii?Q?klE2pG16tGzJil7DHTNNVpXH31f3mo4j9DGn1UzVvOqF4uj0omFBXG13E93l?=
 =?us-ascii?Q?Q91PTGWip57t0TQiG4RHOwqNKTAJOZFZZrF6AZo8AvUSb6wy43hpbivyQu04?=
 =?us-ascii?Q?mNaCnCHoWjY06X3ZPmAJRJ/vqpQyut+80MxxVf8qW6Z/yG+t2oF2W1U2O0V9?=
 =?us-ascii?Q?H4lY6NppytiJiV0WCbBS4o2gw/b2aVKAQFwiMA3QTRHoFAb45akU8z8oEDgv?=
 =?us-ascii?Q?odLWTvOFrSxQwuQOC5Vq+W0+rcAUK/EqopD0dMD5jXXfY3wL9PSbKeiRHpa0?=
 =?us-ascii?Q?IX9xEhyg/Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0925026-9973-4855-08d8-08de6a074e49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:21:14.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1Nlw0G9qQ8tjjFZ1QCwD/EF9k64mlid6IptIKregvtcUYwxveE+B8iapp6bo1DU2EtPWL12SOCUrP9NCrVDvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16828-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 9B21212AEB5
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

These bitcount and timestamp registers are volatile, and supported when
the module has timestamp features.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 50 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  4 ++++
 2 files changed, 54 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 148e09e58dfa..632be4d6ae69 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -41,6 +41,36 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_SAI_TTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_SAI_RTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
+	SOC_SINGLE("Transmit Timestamp Control Switch", FSL_SAI_TTCTL,
+		   FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Transmit Timestamp Increment", transmit_tstmp_enum),
+	SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Transmit Timestamp Counter", FSL_SAI_TTCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Counter", FSL_SAI_TBCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Latched Timestamp Counter", FSL_SAI_TTCAP,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE("Receive Timestamp Control Switch", FSL_SAI_RTCTL,
+		   FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Receive Timestamp Increment", receive_tstmp_enum),
+	SOC_SINGLE("Receive Timestamp Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Receive Bit Counter Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Receive Timestamp Counter", FSL_SAI_RTCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Counter", FSL_SAI_RBCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Latched Timestamp Counter", FSL_SAI_RTCAP,
+			 1, 32, 0, 0xffffffff, 0),
+};
+
 /**
  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
  *
@@ -1010,6 +1040,17 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int fsl_sai_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
+
+	if (sai->verid.feature & FSL_SAI_VERID_TSTMP_EN)
+		snd_soc_add_component_controls(component, fsl_sai_timestamp_ctrls,
+					       ARRAY_SIZE(fsl_sai_timestamp_ctrls));
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx-rx",
@@ -1063,6 +1104,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-sai",
+	.probe			= fsl_sai_component_probe,
 	.resume			= fsl_sai_dai_resume,
 	.legacy_dai_naming	= 1,
 };
@@ -1211,6 +1253,14 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RDR5:
 	case FSL_SAI_RDR6:
 	case FSL_SAI_RDR7:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7605cbaca3d8..af967833b6ed 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -196,9 +196,13 @@
 #define FSL_SAI_MDIV_MASK	    0xFFFFF
 
 /* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN_SHIFT   0
 #define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC_SHIFT  1
 #define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC_SHIFT   8
 #define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC_SHIFT    9
 #define FSL_SAI_xTCTL_RBC          BIT(9)
 
 /* SAI type */
-- 
2.34.1


