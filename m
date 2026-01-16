Return-Path: <linuxppc-dev+bounces-15884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D14D2F6A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 11:17:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dswlZ1PDGz2xnj;
	Fri, 16 Jan 2026 21:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768558666;
	cv=pass; b=R0z2Mk1ygTvimQ/5wW0oRT99SOLXWy/ad7B1lSgC4YWq8KT5N6BlJ5ER6QCOWVWl6GA2PN8Ustu1jrPF7VKAXES7JU0B1CRzvcvSaWxnwEFp7JA2FLcpNVuOqY+SSUO2VmA3c5Bd1LauwBz/zdDoCxvZi14H9i1LK35Vo8vzlWCf4jMh/gG+Vz+oEBW6hySvKp80SabrMUFDiXxH02HF+uABA9/0xS36BQJJVM4sNnt+iAvNN7Ko8UpEigAeMYhIs+wjygJyGWvsLaomNEW7pXXDkwMtRMfsdD0EcVTvGrnAIEOXOChCY17jmPYudD9rMqXOhLDZ0TRj9kfKVMHZUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768558666; c=relaxed/relaxed;
	bh=ZOtS/RhHsIGZN+7TiwRRC/p4ALE9+e/m3sDD0svFZdY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fpE+1+78J6/j0YHg3B7ifOBP6DSf1ScLhU7CIrxuPii6lnpDbKz+gFz5CEhzUb06KBCNJnvC74/IgOfhmTvAx1m05KhEBsfE+0GKR4bIAawyjdDiXQicxMjuHESF4mYUiG60H1UWm1+u7ubWOLOZw1jdAsqOHLyO8G0wD7CKTXF85WFj/7yTQ/HyDICgfxNpsNONxoBg/wNDGycUTsBpXATmzeVHAItus0369As+tbY53t2ddQURYdxIEW92FoXKFKDnJDhAPJfQ429ViC2PCViCFDVGxbrQg+wH38+7Hn1kfUO02wiHUNpUFgTXL/3CGYhS1uexAYj6eDdvwQ5FAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ObUCLSVX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ObUCLSVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dswlX1KYKz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 21:17:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKNbU6JwxooLjJqPbVD8oI5NGx+sstvmxn0/x1s8xSMHU7+ZDJ/qe2n586H7TE6W9ZEbylkbn00ebLNv2JqMHeY/IrXcrLNcyzdsrZm0t2kINjCMNKLgArQPa+BvWT05MYbo7dgvnyb5kUHAM68wMFTBumupoXrkMDUGc9bozXW2FEdvqUTPeacfBjB5D+T9MmzNpHioK4YJADp6hq02TFirZ+LOzu/YmBZPSptNJ4yyTZcYE2QhuY7c0+j11AMbBNTRMFEW/b/w27p9nymWEVOQxg65LxohXU1vOWg5K8ofqMo8sSCxQrc2oT86HGYNO7X4+wGK7kTa9q6S2h3lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOtS/RhHsIGZN+7TiwRRC/p4ALE9+e/m3sDD0svFZdY=;
 b=bmX9ro3maqSUdLDcBnAp2Q4JGScBKYp78vkyNuLG+x4iRPHwteCja+Yps0+weTsyfuTEu2W2juPDVrVzHOD2ajeq6Lg676yfIWn7vFRyDfawnnm7s05NREvSdpLPlrKcbOZxWrwggO6dW2C+i2peIF/P9i1wagyOLNttT38llhcm2z+ZqL/viCNC/iaN0MBmKKx8DllNxh/Ee2uc7YcAt01DZhc7iUrrxy1mWT0U33zBdMQhGzBvzHJkuP3mXkuEu2Ky4Nz9MIHE9Sd4arBAw4gP3nZt9LCkopQ6I0DHgKJKYTv4r4RC+ixi5HgYbcxEEYZ9gfv7ofdW+6+LENdCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOtS/RhHsIGZN+7TiwRRC/p4ALE9+e/m3sDD0svFZdY=;
 b=ObUCLSVXOw6bZ8yQWon4ZFz4etThkyvjXoRlLzGVxVrRUvVdx0owDIWZlKNq3XDPwCLX55FucnYgM0hZqBpcN/qLjLaVwsLghyVUxBDoWs8J+PZYRGTt25DpjRra5sWMv+vuk20vXGef6iWRmsKcrq/V5bwuFUh6xnDdQCX23c3FIONehqeXpAObQ2dQUrzsTloxkyWi9XYHwj12GqEjvDtbs99Zdq+CTqY6CbLCMiWHo2CYKAuQEdAM6YW/KvSAAR8AXdts/l99683HmydjfAWu0pN1xrnpGl9U83/FUQ8j14HtVQr5CuR3jAE17A3e/TI7aX7DglSz3ZChXvoVwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11598.eurprd04.prod.outlook.com (2603:10a6:10:60f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:17:19 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:17:19 +0000
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
Subject: [PATCH 0/2] ASoC: fsl_audmix: Support the i.MX952 platform
Date: Fri, 16 Jan 2026 18:16:46 +0800
Message-Id: <20260116101648.377952-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
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
X-MS-Office365-Filtering-Correlation-Id: 5d111262-56b2-4b6d-e671-08de54e86e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cyu+im75XvltwwnYYxu6xlu1z1zl5xJll2b6s8UpnjGiW18yvjwK68rSnX1v?=
 =?us-ascii?Q?H3KAtVqbRnEK/fkf0irP4Vxkn1+MFCAC3Vef8Y6tbrs+pE3o53VSex2cHNzD?=
 =?us-ascii?Q?h7E8IgS3kBx365lzA5B454/uxNiCb0QudZ8ikyfBrFBNDHoeXwscJFndNaUl?=
 =?us-ascii?Q?bUwQ/6hOdxX2baQdb/Yg4OduNi/ku6LSA2tobA0TQm+vd4ygnCy6lbQMavEl?=
 =?us-ascii?Q?ouTTG0dz9Im5s5QLfsvSOXawS7JMkbQHH6arPLmi9Pj3QLS1k9W8E6z86eb/?=
 =?us-ascii?Q?83BoAe59n5m8FBByV345oAO2oqUqOgnLbmoecGrvfFxzSeM+xGgcnzgKWgLu?=
 =?us-ascii?Q?qdO7aTkqBqW3mCWByoNaPWzEwUnSjRVgylIwp64vS0ZEJV5Xhtv6EwRpk+PU?=
 =?us-ascii?Q?IY++Vzn1HQtPv/1oDGRhcXZIsR4FmdaSe6bHse3TuCE2VhMYi2PRmbtjxh1+?=
 =?us-ascii?Q?hNN7IdaI2/hWUcjJWTxG/UrV/JFpeO0wdkVNOxDiChgtksrldRbARnlP2Bef?=
 =?us-ascii?Q?PZO2wmtD7P4zGwLRzvMOakZGiJZLhddSzMspQtG6wAsCWuchnJ/c89xvfFgc?=
 =?us-ascii?Q?sX+0FaiNzHyqypciDwW8ogsOfTouGCVodipYnriGV0pI2CqvxXieGz7PYyaI?=
 =?us-ascii?Q?FeXy3EE7c64Q7ETtT8h6o804QTHDo3gFMWAON+tkQDuWxLQqamPyA7IqGTGm?=
 =?us-ascii?Q?tlA61jtHgiubfef999+jZd5uQ1LBUm+53IxhZ2vGemQRXA8LnTZ+Uni4DRcb?=
 =?us-ascii?Q?ZSuQhwFgEho8YS5X3YVDqJVDxNDj2xdJmwpd2kV+Q/wPZa4Fg4d3NwRHnbJn?=
 =?us-ascii?Q?ZTZ9th9GX+0OkzmXepl1BjMcYk6kablx3I/+HzR0EdKbAhZwzsL5I6tae4Wg?=
 =?us-ascii?Q?h4+X87+Z94R0VtyEP6o8rpTgcImOmV4j9yG3gpKuSWoo3GQ4iZBSizWTx7vJ?=
 =?us-ascii?Q?VMaKd4UfbCrp+188f/JqVcUfusk2IavlMoyj97ZwtE/gc5TgFtiR3q1ZqeU4?=
 =?us-ascii?Q?w5UhXAYPCOWyGT0vKIviSw+SCCB1lJJxupjayRaU5/uMD+dpEZIBPP4O3G9D?=
 =?us-ascii?Q?pCpDEhJAMq0k0327IzEs4QiKB2sVvjrcFg3FZAS1eqWwjT3yEre2Ezx3lQVg?=
 =?us-ascii?Q?DnGuKjn479Dw7rku8fAioT02Wg2vayWB0nWvfanglr0k27QtfF5Bgg+O88a0?=
 =?us-ascii?Q?lu9vutFUOh1c3M6zOr7gJ+z8YGtCb64KvNnBqviGZbVJep+sbGEAbmxNGDUV?=
 =?us-ascii?Q?g5kPm4VTU+6dvMJ92GJGaLkICzrp4e2ssfZupdjd+tO/j9bUKhu4wELRKoVZ?=
 =?us-ascii?Q?H9VBPGr9HTXKwHmGp6zE2i8GT0r6Hi/rOE1YBI9ZULeSYEPzG5V5ArVU2vhB?=
 =?us-ascii?Q?Tyfjr79u27BJQrxRk7FtF1JftlvsUGw3ZkAGk0NJrpIlZWHtO+Ki8LOkY8d2?=
 =?us-ascii?Q?pWcZc7ghyBr4UzJ47xxGwMBc7zeMhkuNg9mn+enzibf1aEKC5xtMHOtbggQy?=
 =?us-ascii?Q?kkxdjfAI47pfJqwpgmtT9mH+RJrVwqUPhylDlYCEcQ8TmsN4pXop2Tx9s3dw?=
 =?us-ascii?Q?NWPt9XjNVCTGjKeiH/fXfFdcHRxxzyvYb4DwnYeTWGvPejRIoYvXgh6xhX69?=
 =?us-ascii?Q?DPeLeHZBtppQbMQoqnKxarW6mfgKxfiX+98SxMs5UZ2c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dsn/Ht/puv7BhbJVQHX3EDne4iia+t89ySc8mWzOtJUP6Dt2PHXb3UrlkVg0?=
 =?us-ascii?Q?UQFJEisV4OnxisfrfMo6O1JXQO9uRd5kc0keCGfNybigYE/zHk5eopJqbQm5?=
 =?us-ascii?Q?7XoHlE5fnG8n63k5z6GPStjAtTNQKBI4WHqsc/oig6Y1+8cgbuE1I+e6yBrz?=
 =?us-ascii?Q?ngk4Xv92j3HMOcIEDvjCUdMyhA6znyfz5nDHWehUNjpsq0rA649lpI7RcVA5?=
 =?us-ascii?Q?J9RJesBkL0X4f2c28963r4hYBNXlxlav0l7LxEeP+WFWVw3ZdhgClH2T4BHj?=
 =?us-ascii?Q?rbdiHpCliUHc4+XSbBUuO69uFdFNVXX/SHOis4Q9BAiCcRuIiN4Y/qfuU2iC?=
 =?us-ascii?Q?JBrqxWSZVYpxHWhYdQltB8oXeYIh3uohcKl3kn6k5mn14a/TbD+7W3pqqpcy?=
 =?us-ascii?Q?QYul3At27EY7AHpJZPVcDXD5WRbKec3c8Ddf9UywzKQNqIdXiOXRdDXqLZUo?=
 =?us-ascii?Q?f1bUIanGGI1+dEKydk0q/UCokf/wF6bKJ0sLSV4JtOCmBxxSeedtbJuUKOXt?=
 =?us-ascii?Q?qvbwZZLg3Amoq9/VF137wwkpz2LR1K2WNXk41yLVvBNYWuF7fi+a06ssa5vp?=
 =?us-ascii?Q?ajeHSF0JMGeZbYsVJvbAyXWynmNDodTQEANCjoBJhpYc+ZXZkrVK9ctXP8KS?=
 =?us-ascii?Q?ozwgf+YOePFuaihqy8NKT2/EYTCER+c97gamlgLbdMbfPyJKaPC1Exk6hXE6?=
 =?us-ascii?Q?FogjUCfZRpIfgGna2bHMAAQmDOSHgC8/e2Cl+SfxzcgBvsldJFN+rHLI0A2y?=
 =?us-ascii?Q?D+y6HqpUAfjtslfiUwpNEpbvcqxrRzcnKfEltfyLef4w0y/SVzOY55w1fx9r?=
 =?us-ascii?Q?42Zty6qPybqngKaJ4xvVzfTNizO5w9PgpYm4UU5E/cLF0HadLzAZnTAJSOhP?=
 =?us-ascii?Q?pB7pcdcCoCrwv/l74SFtPXWTD6elUIDB5QkkEkSNT4lvnL3Yjc8rcgWUpgFa?=
 =?us-ascii?Q?Sp81Vk5z4gTVPsr6aTdf46Ow2jFFPc9u1ri0cW7oCZmDdFjUtNXSu026JXMu?=
 =?us-ascii?Q?Wb68hVNNi65PMpydpmUVWqoE6yXJe/obBPDPc0N/4tVr8sGXod+2ZRj8raWT?=
 =?us-ascii?Q?Z+IrNL/a6hZh12+mI16/CIorfpzNHmaa2Xm/863O61cq7R2bW1wr1b+oLlRr?=
 =?us-ascii?Q?BrQ4FV5NGRjlqaLc4tOri0+CE5mG7pa24j9Kb2kG0NFKYe51AoGaMC5HIpIj?=
 =?us-ascii?Q?DIRQ2g2mqZy3uz7dckrH3+O7MlbX+aEOTS8oSN/8kzjv1AvFrngqAbKD1PA7?=
 =?us-ascii?Q?9nX8Eg4VqT00r9R3qigM9B3Ks1QgU72FOEYzyOuXTki+B/t0uuQyC2CkVk/3?=
 =?us-ascii?Q?MoxjEZUgbZmz/2QC/MENHObVydh0qBSQTcqNTQVw6i7D+s1dLAMM4GWUDcPR?=
 =?us-ascii?Q?Z7SRNS7qdlDuopOzypvOiHKNEBKAtQgVTz6am5NYqjVlVmEM+n7GDIJYbk+X?=
 =?us-ascii?Q?ftVB18CpSRc3vkyJ+N2gzg5fkTjtEypqdNjcm2WdCZPE2Q6YYdVKv8VRPgNJ?=
 =?us-ascii?Q?s/M6P7f/SO1VZa8J2IIDJEM+RZFeSjeajRrf/nm/Oxn+CZHCNhjsWEcdfe8r?=
 =?us-ascii?Q?ZHkRlY8N9CePqeowZp1nA6WQYXnGmWa8axFXd9TSL+a/+O0EhyMUceXYz9+D?=
 =?us-ascii?Q?1jnuLJejP8MsUBabJA7l4AV37coJlU55E074NoBASy18umXLUjTtCxDeeGmt?=
 =?us-ascii?Q?YkwPnBWOJRv16J+OZQHiV7+Au0KKHKtnhYtO/0oRSaMcuW+7FsPQPJ7PwR0L?=
 =?us-ascii?Q?smwPXia2Cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d111262-56b2-4b6d-e671-08de54e86e0b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:17:19.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a81VpxHgMPln5liWv+qOYaWOYciq3DokLUpiQD9a5fBONiLfrtnHJUzpXkkBpJD61UCU9qCBCo16H1vYUB+G1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11598
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable audmix on i.MX952 platform, update dt binding document and
driver.

Shengjiu Wang (2):
  ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
  ASoC: fsl_audmix: Add support for i.MX952 platform

 .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
 include/linux/firmware/imx/sm.h               |  2 ++
 sound/soc/fsl/fsl_audmix.c                    | 28 +++++++++++++++
 sound/soc/fsl/fsl_audmix.h                    |  5 +++
 4 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.34.1


