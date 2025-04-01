Return-Path: <linuxppc-dev+bounces-7416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B22A77E45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 16:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRrZy5v5Nz2yf1;
	Wed,  2 Apr 2025 01:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743519178;
	cv=pass; b=HYz8VTa8rY6IkpQ2mHehKjgFhHpyiiBUgSnyYBnqHZ0trPHAwEGSeBMI48zEcO15GQwkEMKZK1kTJFspYFi+ZoZqnIojT9HXOXkzeOLfZDsDXSthtsTvzvsnm2BkqgpHpE1s1toIVALINKKCbvU7U6ZWTk8lDOiqKV71jBdQ2u4e1kSHyzc+sKZ6lJOYseXYTi62tVB0+QkHX2oV0pOLShjHPv4Wx08PdjGzQjiLdWDkqySPlmN2VDOMcCCFUqGLmjuKfZOOemZyGyVrL+MuosggoCyUJ4JJJOSu/p4yaLBTr2QT3zmtMJRl/Z7APF9nJTQINA+Xo5OX6pr+D9zOOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743519178; c=relaxed/relaxed;
	bh=jahQ3DtBaPXca5egBHCWthHkQzQJDZIvDycBzFCHbrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZP/x5u4ELa6BsTmZAi9FCR7bZ5nJtO1nAnqWlO8POhQ9scqtEA11PtNkBXPmcAVR9Ka5z5cp3v8KHTuwPQOVfG0RVpQnFDctyFO4Zwqi9u0NIxX3gFFKuQj5tGdQ+edLOC+kxxx8YnaP+iB57ce2p1gZ5kXYAVBYWV4i37GeLXO03DFttn7JmVb+OXNmchGvif/QiZyjfDVVBnOFwKplw+LK+QQhLdVu74AoN21xVxBYQBcByM8Hmorhd+T7vzpMq/49nucwRrOPOn/njWhh5+14KBnwjXF4RG8hNjjhA4TH976U/vInRmcTZMeivJAemRO+1z81WOCIcDSRx2eUBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nzBDmEUF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::621; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nzBDmEUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::621; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRrZx32fQz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 01:52:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtrwQaBLQZ2eUKUeTyb+3rVV4rAkW+UABB63UMo9FreKavV3prq9PbA4x1Y5umu6/Q/trWnv+AUlPafkFbyIwx5T/1pithsUlRURV3C6kzZ02QKPuvY5o/cqBnJ3NyWWhi7AiVcoIX795BHN7fcqQxjTlZqhOG7I4zq/9hu7/7u+/FjDiKsI2+/r/xPWgB/8ny9rb1CtvSs0TGtzMWig/CPY5qbtTieprcJJl1lfJip939KxTELN9s1vNPhIiywrcHpQufqNsVcrxOBMMbfKbvDFkVxhy0/FSs3p8RMoBdwwDoRcefv5cyqd+3ISfUdX0bDrFEzsCwU3JAhsPE6dJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jahQ3DtBaPXca5egBHCWthHkQzQJDZIvDycBzFCHbrE=;
 b=Sbuk9k+yzCwzlsDsGwpGVrbOsOIojNI6S4M5Z1lcuyG6pv7aUrQQTPBgHKxbZzgAb7FzSCX9a2nIeTru1vqbn9YluEAMatnedb/dEJPYAtKqg6ncjdnmI5mxYpsbvdOi9N95NmA598R3WrcLK04Lfs5fdFhdXWIGDnmFWXYlPM1sHnryU8FOKUwn4SUFPIh2CJgBuFQeJYDYRo2+y/t0xw1usmkofA+wCNo95V7w4lJT6XELYd1nQ+u4pKucXeAAYEex85NBk6jouqTdkoVaWJn3jtItvzazk79bu1LR3hwfrT7l2M9JtPke5loDzA+xroZ/auVZPmHXY16Ask9ONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jahQ3DtBaPXca5egBHCWthHkQzQJDZIvDycBzFCHbrE=;
 b=nzBDmEUFNaYRK178nrBqFsrQ2vPvy2oOmvawBeTh/0ImfFceVhBMzM8by5At9/PoPZ3HWtURsUjF4/da0rqwfQ63/cMIM5P7IyagFUYOgYlhX7fD8FRDDmeYBOJJM+CgBXmImqj/NohvL8W2i3yW2w8v7+wMNMlib1RIu9y59/28xCfCZe6T6cKKR2AlgTxx2zOjaXxhg8PL+BBuO7vlt2n5l2qI5dQlwOfj3Xxr30aBfIJ53Yf+nrpZlQ7uOB5bfTmYsoPrbIraV3SDnJxUq7mIZQnG3zri/OwLtMh7yAMgEAFxEMyYBBGEOIwaylegG8cyzeMxKGH4tZDP/UnLtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9524.eurprd04.prod.outlook.com (2603:10a6:10:2f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 14:52:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:52:35 +0000
Date: Tue, 1 Apr 2025 10:52:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Message-ID: <Z+v9qbFjSNpDcHW1@lizhi-Precision-Tower-5810>
References: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: dd336ecf-a78e-4043-a02d-08dd712cd68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xrapDI0y1R/W9V7Ww6BEh24WxOTQWKy3CsjrnZBKkksprmE9qTyJCVSqopNw?=
 =?us-ascii?Q?bz9AqI2nInt7WSp0J9My1Diz12Ll4tizocFvl3CQhVHKZlJIO1WQ/F9Skfaa?=
 =?us-ascii?Q?z0gVkAeczT4fSibMsxhTKBZh+K2GjqJPedxz3seFgmHNjNjFNMOVzfFuanGO?=
 =?us-ascii?Q?E/oZjL/6LVDm6exM/bB2KlvI+fB/5fOBoYABWOBDIvvohsb2nYeAdtrAzqDC?=
 =?us-ascii?Q?YPZTul4s/B5h6bDJc5Fas4dcJ6KTSSY90cV4HDzJmINGoSCsFs4++KLxQrq+?=
 =?us-ascii?Q?2Sh6obMG1CZ3kwLtgHhslH2dh15gtpojKiMYHP8pYySbzyV88CMY2DMnV1LM?=
 =?us-ascii?Q?WjSyODP9J8qOrMlqb1oV4DwhnJDA3XoeYVD5PhK22b9yqHbw9k3S1JLdG6Mc?=
 =?us-ascii?Q?j13C6EHsfEx/zeEpenNouaMPOeW4Sh0WobtczT8WNwB6JOhLMeK110URmfX2?=
 =?us-ascii?Q?I2gVNZEMGMJHIFDcio/n/pXaHTTPtMmYw3LKnvzhWK+w4KRCF3tp5gWI0sUT?=
 =?us-ascii?Q?U0Tbfbtkvd/HxxGUBmTLdNfGcASkErjH+qobXsD7vm6VWBbjfb4rPrGU9jY+?=
 =?us-ascii?Q?3IAGGpFnC+DDd6vQC5/D95JCnnGkSRPFDdSWgdJiH1UgkTHDX8XRWDOYZGdi?=
 =?us-ascii?Q?BGrOYoJedzj30W/FDsrUUHWrompZlUoz1v7qbNe/tmnysk8Xts8YceVhXqN/?=
 =?us-ascii?Q?45uZSL1A4ytyXQBc8n9IQscas4FCWgdMLVh9w2oAGhr9FlOs74fcU0duxaKa?=
 =?us-ascii?Q?m3iO5pymJlhjqi3YYDZawTJCH+ASG3MPl0rk/HfdDeMY+RliTWlmVbw3l9TX?=
 =?us-ascii?Q?+CAI9uh0gio0CxvLodmt5hh8SpuVfM7rYLrSiHfD0uUuj6+kwUvWA4S1DYNz?=
 =?us-ascii?Q?kVkFduXXlcChP6N6asQ1z2AtuPCyzAoq0dWVuEOV/MtMDbg68dBiMdvi/q1B?=
 =?us-ascii?Q?nN5xiW/ZY7qCqK0X8w8Lvee+Rw7uC8DrEjebHhJKUvRfaotQ+J1zfEJxAkoA?=
 =?us-ascii?Q?dwNaRVBF8OQ6iZ+f7it3pg/rU87GRGHZr3ly59bz7nB1dAD+eCCPpmg2ik6s?=
 =?us-ascii?Q?vpyqQtlZ5lbscO6rScFVabVq+q3iFc7ESSUACvj/N7B6ToTg/auRiVJB3xfN?=
 =?us-ascii?Q?SQrfL4aEMwnIDeRvmLh/EIdeORt8+g6PZ2dSW56h8zvwFpJUwvIu/dCBdv7c?=
 =?us-ascii?Q?Exp61YIoFXfiVkTcRcoXHaCkDxD/XxSPexyYMfq/VPCoutRvKJZVooAVQ0sY?=
 =?us-ascii?Q?tLJGgc9tB4P2BftdBnHznhK6O3AGeCbYvOjy5tmTXLqa7AbM7bB99/y1exjv?=
 =?us-ascii?Q?CynJiUKe8OcgpFXfMkzQbQ9tvMgv99A0AP2UdCMXdSnG7txVX0m23wjX+lP/?=
 =?us-ascii?Q?hcRkmaPhrRPM+bji4F9BZ7GNSNF8Iq6mQwCh/B0dz9fm6U1OTE9m1lvpBZ1C?=
 =?us-ascii?Q?dtyKUYQTPIieM0mgn8GcKinCc7xHM6oE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n3E9PQhYtxnn9vbJYQoprs4T9QSBY1+cxJJZ99vslP/0JNx1fvCqeUFYTyJR?=
 =?us-ascii?Q?fZcb71474eSc2p2Fa99b8ajRQsYlRxA6yxWc5I9KDSW4JyVL6VsyM7CEdz4C?=
 =?us-ascii?Q?OIAzgzJ9g29TImur/NeYAv6yNAQX1v9Ef8mYQ465dcQH4YTIARw3OnqkOmH2?=
 =?us-ascii?Q?mKYXJMeCdRPYfjvJN9X/7Q7Fj/sLjGKNGcD+K0IE605DQ7cFUGXU6FfKy+mq?=
 =?us-ascii?Q?Dl4mh+K4QjqmjuBW2SAzHEFPMV/9/NioTWzMdjZnmoEztyaHKR+Xyefko5kn?=
 =?us-ascii?Q?5oMSRzgHWVlFduVk+t11RvtaU0d1lTvnXwMcnRJzrjZgsGSAnDnD1BEwboha?=
 =?us-ascii?Q?zJUhd+kTlsdF+yIxRBtsO8j7+R3gh6IEDzMYLdN+EvdkaOU7OIF6PDMKKxg6?=
 =?us-ascii?Q?xSSRhT7YJR1GkGa6UNQH2f5vUJZhytfqtJ5qqd7hUrn+VrtPkXBiALOPNYCm?=
 =?us-ascii?Q?LFd/vIL3SGNBD4VYEmYPELG3J023XKk5zGsW8LMqoGAE47AQtDsPCk1uTiKK?=
 =?us-ascii?Q?03y80m4wu4EhvFce9ssuSWGf/LrDgP05N4mQIo9zvtRdf9sKmgdKP+ITB2PC?=
 =?us-ascii?Q?KcBnmaBhm3BUjVMSKgmrMl5t7MrrVaPmXiJcsJqVgXG+wkoLWceVPY/5yr+p?=
 =?us-ascii?Q?URIhktNQuWQUhmHuKjE4TG8McB27OF/EmYfCqqAH8KzLQcNixd4JJYDg/Lok?=
 =?us-ascii?Q?2MNUWFdOn04us1HZDK7lZ9exePMZm7qqPf+qUKVHExpoKcu76dgpp41ubORs?=
 =?us-ascii?Q?ZQAEUHZ+tPIlTPZqPnOQ4nhqQcWT6ITZYAaYcK/5uLgreJnDl2GASzaBvi6X?=
 =?us-ascii?Q?Gdl7UuI8xFnIgRV9ZL5uq61VXIVOGdxSLMhjRxsZH+lAoOgzdpGB8xIFGJHd?=
 =?us-ascii?Q?WryC856BjHJmtlY+3s5ahxrjVcel4UR2QV8eg2MZuWF2pXCJSBkN7zQkb7BU?=
 =?us-ascii?Q?yRKMsm9gX43M00J7DN+jz11FSpEaxL+73nmgk72qPz6PVCEKcMklJQUSNWnF?=
 =?us-ascii?Q?aHkHt8wg1fAuJRkY8KKfnFJNkvDqnUfddByJ6fm+m3w0DYeAInQeiWNqioIE?=
 =?us-ascii?Q?PgHbj9zI4QE2hnwMUQdNeadRV2fAatP2WzpcUiAoDNCCFQWosXw08AHlKWaK?=
 =?us-ascii?Q?w2Y3yQQjUo+tLAk2jBDNO+825RA4Yl9CrCOZZ0xuzHJscyke2wp/Jt6vU1Gj?=
 =?us-ascii?Q?Yx+CzUz3hedPgLiwKbW8X5fZe0xjnXklurV7gCz9A/lxuMPuAP1qnNU0mIhv?=
 =?us-ascii?Q?J2qGUbRRbRsB8LtgjSNBgSDhHBgnkwTjffcN6nxJdYVfZdxQmeaU8LPuW1r3?=
 =?us-ascii?Q?/x4c01w32t5Z6PsVy5Vpryoq7Sh1+8b5c3Uq9hNg0pa2956r87fOLMm4UUAq?=
 =?us-ascii?Q?LVefdnKraR5nfgiDiHG3EfjllfWjX2EFnUbVBDjSKopCNLtMcuHjHVLE0XZZ?=
 =?us-ascii?Q?P4sNgMf6dOLlmMJXseRyGFPd2XZ7tCmd6BrwFcmCJIEwfb0AWod0VMH0wVJC?=
 =?us-ascii?Q?th9DBEDTSGuU3z5R3lUUxyEMnBYl3kMAIXOV72mOnBHmFRiQ6ikNcgjSTNTz?=
 =?us-ascii?Q?xXGlfJF9gPbjqfszp2Kz5ksnVDGRV7yUevyW7UMy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd336ecf-a78e-4043-a02d-08dd712cd68f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:52:35.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sId6UeOeDyl4OiF5Qf00N+W1FqOJWoHg9GjbgkzjWfoQLA0irJQSBkteqP9MdIl+1AVMjMFncE/tqXFQlaGY5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9524
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 01, 2025 at 10:25:10PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> imx_card_probe() does not check for this case, which results in a NULL
> pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/fsl/imx-card.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index 905294682996..3686d468506b 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -772,6 +772,8 @@ static int imx_card_probe(struct platform_device *pdev)
>  				data->dapm_routes[i].sink =
>  					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
>  						       i + 1, "Playback");
> +				if (!data->dapm_routes[i].sink)
> +					return -ENOMEM;
>  				data->dapm_routes[i].source = "CPU-Playback";
>  			}
>  		}
> @@ -789,6 +791,8 @@ static int imx_card_probe(struct platform_device *pdev)
>  				data->dapm_routes[i].source =
>  					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
>  						       i + 1, "Capture");
> +				if (!data->dapm_routes[i].source)
> +					return -ENOMEM;
>  				data->dapm_routes[i].sink = "CPU-Capture";
>  			}
>  		}
> --
> 2.34.1
>

