Return-Path: <linuxppc-dev+bounces-17762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACUlHxn0qGmfzgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EE20A702
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRDzy2rp1z3c97;
	Thu, 05 Mar 2026 14:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772680206;
	cv=pass; b=AL5VE/Fb4MELytkiDyazRi1Ql37dN7pP/Zl6+ZoyJkTC9QbhNdtZWTSJhtnBoc4can4Glca5Abe8SdbiAujh4+TZMnMa90jrUK8me/oUAPm9dBGvn7Nqxe5iHfGZIidgyLFHU1en48b3wbynPO4tEkkScKb61C+uKh/hIJwDw4mRu6sCZbDkPZzBtmmntTZQGV44ZwPK8rovxYcUbPIswFJ7i/cuMO1N1dK/9F5aSywRTVhoawiVgI+fwru/K6V68diS/m2jSa44eTN/M5i08jhWbtmvQSFLXZwTgL/uQnEQH5Mm+jCVbROKguiJR8StZI31n4bzqOX6EjKIsSw2Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772680206; c=relaxed/relaxed;
	bh=+k2qsq5DuS4TJUulk+1VIkGnYk4y7GIOHk8mdhz6cqM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i0ophlw5VRG6A0frTRys0CRxpMynz4yNvBNnfGyCTHKZSQo2qeicNhuV06KvRMZLxCFr4YybyYQJwySIgnwmcqVj8fShmnSaRHJS1g1j4sojScdYIa4Yfd5pVz8Nw8WgjDMOyi4iRwUvcU8AJTy3PK19EiiRsND9toTAGszw3gXiFSE7yP7d6QShPvNfKwe/hVjRFwOyPPDW6l4C7Lo/sA3FRtTtoHZoa2kClpzriktASdCzFXx6inYZXbOAqx795ImawqVX5jcaVvcdmh9pTEp/nM8v49aUfE6ecldtLgH6xzQ8shDrkP9TYGsIQJWRnfrGs4ylyETPU/RswYmDHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kGl/5bBx; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kGl/5bBx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRDzx12nDz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 14:10:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaEEuFV6U+Vqx67y42cAWSu8CXYhW0ocD6rMhZCNHthtNndPSMGPHHvf2FplBoW5fgJwBwAC+S6R00Q//h6DS2VZEykwbWg3p3tQWt63wWUxMkwq/Up9i3NuMGAAmlnoJieAqmsGN8ZwaL6+9RZKPr26rad8ZR+eME4/M6Tfy0zkW4kAOB/iUN9xqxYjyU3yq0vtzEFuRSlym2RJfmPomLvk/MPV/yOhgeWwzi2bWapMrP3IMNjwWx+f+B0sDAFCprVIiq+76x4zIvUdMNJS9/3WUHmmWnlxPTVipbLWyTNFHASGm2u0GQOzBZKJdSdWTGfplDSKTcrGKoybeJUNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k2qsq5DuS4TJUulk+1VIkGnYk4y7GIOHk8mdhz6cqM=;
 b=avn38VEex6DT/3qrxJ/r4jnzIFp1pi/1SKqjtPYPZM+AaVcA9XYndV8JnpfMheP6RaznThg3Sh5aWMq5L4T42q0kolTfQTJCxNiYw5TmV/UYO5vGGjB0l6j05YDImWGMhuerZyvzwF75qEEV2v9t5pX2LglfUPdBYGeghrAwa4vO0cg0SJ7dAk+mWndWqtHb173gufCup7j/tWX1WFPzK2oGsnH6Oh2e82HWVH2djl+nCZtWVwjHpMfLgcqUzGRO/r58Z0gjqzZ1PzCFacB2CHEp2VHgWmRRxLZrBYWRbgy0maPrKgDORhGFzlu8rGGy85MFeWVsdVRRHeS0kaUe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k2qsq5DuS4TJUulk+1VIkGnYk4y7GIOHk8mdhz6cqM=;
 b=kGl/5bBxgDmjyJw7i76QlCJN1FJ4HoIl3MtbRaxojyqvH2ceuz4cc5TNJcblseGGVoASqaTpHcGcvybZA3N4QjvNmAEYQUm5XLEeFzjRUaMW5yPwLuD/eAeK2F9jhGBsbQKRcu8tOMwn80il/tEyKtMtznAXwJIhIQ8r+nmS9Yi0a/DQISc44c9GeLA1Gq2ymLZf/Am6+em7exxfEv+TOHtf0kyHCoH2LvTqLqq9jpEP/bPkucS1hk0vWiwf1LtEPitZ5XeKHVBlvtqtDr6XEIiIh16B3iGp7MpSH2GtYXT7IzDyno9NV26FJgHnjyyPht60hkmTbSkFHnES7lH+GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 03:09:44 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 03:09:44 +0000
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
Subject: [PATCH v3 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
Date: Thu,  5 Mar 2026 11:10:29 +0800
Message-Id: <20260305031031.3808182-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c360f5d-3f3b-4758-dc60-08de7a64a620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	jsyxTRU5j4w+acW0PZeVug5Mvks8FWq3/05nzF/iNMf9DhUrDTBVXQrhJvZ3Mr+jcpZW/3PjSN0NOiiOBtb+AfAs9oIB/bNJrs5/kBRedOdpFgS+5daInmnysMh7xD1ZDZ9YPUur9jtKP+Xn2Y803DQ2qg4c2xcUf6+4M7iz5ArMdE621kCzgM4dOZNZQYw93lLuFUpeuYrTKheJ+oJr7/U9QUU6kPbYiN1F8GaL7PsjBeZ/u3g/dz76NGF1/h/HCR5u107dYqyzx7IS0n8rFPtYuJObjhoMFtOcCWKiauMmCM36LCM/qEieWKirnS39oVVYTJYSu7f/hEXXsPTnou3OYRyUB8+G9VnMajT1DZHUN+zGUS5e3fm+NHzG8CvYs+vgXlWsCaLZkS3Gp43hffL7G7H79g7ZDfZE13jhRKreCFQHIUju+Ql3zKXVFcxrU82i4IfyJXzh6O0biJ5deggi22GfaM63oXIoQpsmvc157gM3faLdnTO0vYzSnBHRbWucFDAobclLZEPeOPmv/zFbpMZr3LYD5KfY/nNULmc9wsxvvIwovJSFGsGHsMYSe7toaMtp2Z9rW0OF8jzaqFk+9cPRJK5AqWibqabwJHgBFamlWF9mPuuqOCS8K0HqNpW0JLnY0Cryr1q2ffNSZ3OS+Y72vFLrr36VxG0IBDMUhI690GfxWF9Mp3lgwWkdf8OxObzxC239bROxVAgPy9RjE3Oo+sIq3TRaO94dVO8DijVECziv09euX6GJVo+QV8FqniIv2QGc1gjZ0xUmpA7nzsnBIIzwoXQLRb1qeMQaUpur3GArNzJKSpwm69cT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?692xmHhgGWxMR7MvYaWWAUXkQfP9qN6c9PK3b5er7K5xz3a5DUiHOSuhb5E+?=
 =?us-ascii?Q?ymvl236d6pOdrjt5INB44v1YS7NtlNzwC4ZWe47nkyqoQRUo1/btd4oE/I5D?=
 =?us-ascii?Q?9sEhBJvXCgDz6x4jNRV7zRtwsVA4rGk43P3nHHQZdUqWdOgZ2H3nkqGff4B+?=
 =?us-ascii?Q?whideplzAoOmOhQdqdZSuPEmUcV/y/V4eegR48dk/kBwrw6AZKfPLIxO4TO3?=
 =?us-ascii?Q?7/KmHzHAimSdmFwhvt1ft/vGMvzc3YAJLGYfgri+6FBnivf+Kv2DL3pRQpG3?=
 =?us-ascii?Q?s0vaaxSBwdrm5hOfxvAZQ1pjLKeBr/B5pBkxjKqXNCmLUyI2lVVClVPHl0gy?=
 =?us-ascii?Q?0+72zoQBKmk4O5J5kAWvBAII5kKcQlvPDbbABKcnwPLzqM0JpXYhwJPipnFn?=
 =?us-ascii?Q?Nno5g0NTRe2PX9wu+aO5T3Htb5g6s7NTUkgo1DyDgiEQhUeLI2HBZI8MylGp?=
 =?us-ascii?Q?EtUsGShFDho42p1oUslEULyfKu0eBQGjLsLrWxVawC98koAHtLc3LzQgz2Pt?=
 =?us-ascii?Q?L4tnog/yXYc1p86KcdYPL4R/FjKunJqrnvdBOuL51izDtcVl8hvqoLs5ldYR?=
 =?us-ascii?Q?cgeedDNUoV8SKm5RcpW86Ic1FgQ6QoRm+giOCzdiOrLhEy6U8l2TxeQpdeok?=
 =?us-ascii?Q?Nzd0JlUyViOuWSXVlfAbNcYlWtncSdOjRVxXu9Ml2AHgNEq/XKgQurcfVfm5?=
 =?us-ascii?Q?9RQhEH9mS//v5Be2eYAsLUEMKfs76pzW9JvLQ37Ww2gI4qXVEY6WFr2Skiwk?=
 =?us-ascii?Q?pBZJzXmLQnNhWgkPu3cMtkVLDXCycgYJrh8X7Uwp+78tHWyV0WT3QMbBfFOo?=
 =?us-ascii?Q?Z4+vwL9y7ybF7vYqz1pV3a+xnObCrmawUSO4k2BllfjiS5ZzkZHU8Mag+WCH?=
 =?us-ascii?Q?zF7vAMK+zGH48AYTAVxP245whR9XzClOOvMJcxqo86vb6UKFlli/7BTA9fdi?=
 =?us-ascii?Q?EKdTzy4ifsClVdDrbBRxZpmz9Ba9yeQgscNjMLLVHGz0FtfQMeeXXRt2CLSW?=
 =?us-ascii?Q?trrsjrYdXa5zqIDuiWgJSGlwQxX8tiudA29v9h1T8hdXKvtxylz5M6laB9/U?=
 =?us-ascii?Q?q4CEHXXJ2+kVrJ9TjMasJg/KbNIKRcCdOX3rTub8A+Y5Ej9faFqhu5pv7e6w?=
 =?us-ascii?Q?5p3cdrRS9SXuyeKKwCMbDMRhwLyklvWNnToDutzR6A3c7P6HmtG2Ia9pyk3O?=
 =?us-ascii?Q?bmkWVC/un1moILx5WWLRTqCKoP0uxLZpp/8toEUePF3OXz7jkVL3fiHp7wXl?=
 =?us-ascii?Q?XeBYD3CiM5y19WkX85M/Lj9bXfjaIBA4l4N7njSP8LdP/1Cn7+Vz2qo7+eA/?=
 =?us-ascii?Q?BQ9bqhl7q4agrz0Y6LnlVJSHq4xNlB9HRQqPnZOG5xaYdDk43xSq3zB5ey7I?=
 =?us-ascii?Q?cQudKcCxq64qqpzh7kFmO1BEmwCS6PAD9txsh+hvNMD95fw3pR/c0TWKplSL?=
 =?us-ascii?Q?OSNHyX1ybqVh3de14XxC8AF5s2Dv/nIPXw2V4KKV7ugkqHaoe7wu3QTgwwqM?=
 =?us-ascii?Q?Pstpi/h+ZMn0kTRIUd0MvYM+oGAdiCOBfg21ZnPO3Drf+uXEgS6nJ2r9eVKu?=
 =?us-ascii?Q?9nqH8o57ldNdQl61dj4t5rMg8XLS7PSUjb3NKX5vqCTcyyOYMwZAGHcadV84?=
 =?us-ascii?Q?VXxHoQadGNuiwOEChQwYBCNua6DGvODVg63eomUVnJrmYQLueTaxwT4QCqak?=
 =?us-ascii?Q?4tJ2eIQw6vXbXILG8QnHYj4hODlHXTllRnsxOCagLcPsePs1AmHHR6tJAx+F?=
 =?us-ascii?Q?rJOBlT1SAQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c360f5d-3f3b-4758-dc60-08de7a64a620
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 03:09:44.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv5NVPDRD0l2ZafoR+cEtlDHLibwyNXbpbC5Kj1BPOTpkiD6NgDsps8n/MQRr3eJayHXYw0UYPblh+v8rNAN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A57EE20A702
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
	TAGGED_FROM(0.00)[bounces-17762-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
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
to avoid such error, needs to define FSL own functions to check pm runtime
status before calling snd_soc_get_xr_sx(), snd_soc_get_enum_double(),
snd_soc_get_volsw(), and so on, if pm runtime is not active, no register
accessing happen.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 89 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h | 30 +++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index d69a6b9795bf..1b0f34408c00 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
 #include "fsl_utils.h"
@@ -197,6 +198,94 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
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
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active) {
+		ucontrol->value.integer.value[0] = 0;
+		return 0;
+	}
+
+	return snd_soc_get_xr_sx(kcontrol, ucontrol);
+}
+EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
+
+int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active)
+		return 0;
+
+	return snd_soc_put_xr_sx(kcontrol, ucontrol);
+}
+EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
+
+int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active) {
+		ucontrol->value.enumerated.item[0] = 0;
+		return 0;
+	}
+
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
+}
+EXPORT_SYMBOL(fsl_asoc_get_enum_double);
+
+int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active)
+		return 0;
+
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
+}
+EXPORT_SYMBOL(fsl_asoc_put_enum_double);
+
+int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active) {
+		ucontrol->value.integer.value[0] = 0;
+		return 0;
+	}
+
+	return snd_soc_get_volsw(kcontrol, ucontrol);
+}
+EXPORT_SYMBOL(fsl_asoc_get_volsw);
+
+int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	bool pm_active = pm_runtime_active(component->dev);
+
+	if (!pm_active)
+		return 0;
+
+	return snd_soc_put_volsw(kcontrol, ucontrol);
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


