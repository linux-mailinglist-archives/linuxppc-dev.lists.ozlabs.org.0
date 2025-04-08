Return-Path: <linuxppc-dev+bounces-7537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9AA7FD37
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33q3msmz3050;
	Tue,  8 Apr 2025 20:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109943;
	cv=pass; b=XS53dH9RLL0xp3qOKJfgzSZKD2cE3Lew6WclrWiNuqa5aWt7heTfiown0/+kVXjjBDOfVFnws4aaY+XNLELlQjiXWX47T2AbgyOf7dfsz45ZrIxDG0bTVIJhnhfmMSWnUAv/FzGU2EG2yiT7xe21TnQCVaal2gCqbmhZPQMdIlcphhQdaHlb8lIxoWxTqaZYNDeyzcUvkduh15TmgEpAOsT4L5v9sl/BdOuozz9kOwyf5UDkc/VsgXrjDOZrnO811yo62D4IdGO6Ael3IIUJA8qIZ605rYERpCwxvDOv4sTD7Lwerx53gcZCJkJcVZuqVE86HZpT1QvX4jz+e0Tv1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109943; c=relaxed/relaxed;
	bh=+So1uoHfd40DGopFNSSkdEL7dApq8huOOzhV5ybptR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ji7NxdjWKf3mFmB+r76iVJQjcIZnKXyTCueILmAEGiTtLiFXIGMnRwixrYZRh1UP8RNrH6OFejT27A8QL9D7qXg/d1rNdtm0tfVa4TQyjqEniW3yF64tP5lmaagAqiQgZXTeU+MF/h1w+MQUSiqAuUNidUBDYXdWVMnKDg3b0fi8/UIcTQ1RPDljLPwb1663ZONwfg8qACMT5E00X7EZ/YxOK2u2PJFOUzjaWMuEKmf2jL5YmboxiMVnJiGlOdCgyL5pix0OyUFygC5QOUFlRPDWmjqr0kNgHuLbbw1bM8+yxMdvEhK+gLP/ILRrjS+96qc1P7c1D7upg2c44u0/Ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AwmYTXZf; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AwmYTXZf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33p4tCmz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5EkrNZI9XUKaSwcBcIPAGJvzi6jcVKN1hE+SObVvSinE003BqMkcBHw0i6BjFeH4WhIKyFySH/IBa/xz/54pEABEsM+crz8pqlqwgAah12unzf7feGR9I7HEXvox2vliwDaLHnkb1A74rJdlt9Ei9aNwFDlLqnK4ibRWeE2ir3X2c0K34bqTvHBwZ9eROL/BDimbV3THxCTQX+otmkkDDcirkg5QVBhh8PwpT3dWA1luckx1ZhnrpBVIEJYZGlxtiDXYGcAljlRoLdN/4b6sRyXXdKqsgV0Lawiu1OCl8FPkuLIljAS8G28MAn1cSwhq9OrOooeCUz3dN49BDe7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+So1uoHfd40DGopFNSSkdEL7dApq8huOOzhV5ybptR8=;
 b=Mr2Rh0Bwx5iL6J4kK7cAEX4ouUG0zjdCkA/tsdkepKVSfNhcb+uZLEk1YIQcnTVdAOKuPzTA9NU030yLPxIoiT9DBCEccqX2LeuHRUnxmoOrKVBIkdGjgMvf/mX4YOEGcyrq7ShyzhGXi/WnGy6Sp6zeE1PiavXQE4jvEfaa0TUWw46Wiwn5KXhfvQWojcsTUXPUkEwd6AaMPZNutTD3EAyL1jhsVWEY43oqx/s0/LX5oXQNwbLs4BZM2Rfdg/xXWCv9E8y0Uf1/sShtSmj0R99lc7sSvc5h26n6JqgtU3nOW1fE/nouslD1jdYMc0tEkJdIxA87UDhQNlFMdAM0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+So1uoHfd40DGopFNSSkdEL7dApq8huOOzhV5ybptR8=;
 b=AwmYTXZf6PxV6g3WAcIngpEic1c2XOF+dIm3vJ3emMOfXVRQaxTy9ZGFFG/4TbB4Xm0GbhlxFlte9pu8SwjC0lwEYAXOCZa9MBxJvWuv/+22RoLqWjycghkWNFEQguVv0eMWZFcpV2vnzmrw+BKQzzyUTjv0qQ9rSu5jQp8urKF49h+l2bPv9vIpUGj335SPDtp7Rjf+Mk3lFR/BA+8hfEYgMD/7cwS2E21ZDBtZ5ZgCPv3UZIgCs56lpLnqyZABbEJFhb5WoTLkWmr0t7BBMXl7SchZXWR+u4mr898gFDiVUPHL3b7PWDhzVUJnNMo3wLpONIHUio5iCvC/hUpXGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:34 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:34 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu
Subject: [PATCH 1/6] bus: fsl-mc: fix double-free on mc_dev
Date: Tue,  8 Apr 2025 13:58:09 +0300
Message-Id: <20250408105814.2837951-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
References: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d884d8-10dd-4672-622a-08dd768c4ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gjuLtAeeSQbm08b+GQAHZI6WorSzGe1Bfm+tW7S23Qx4WlrqNqBqRch8yB5f?=
 =?us-ascii?Q?xq2UWqHgflyZRB2Ub7TZQ+hNg2Cr90BSB23/fU2+1RTeLghhhC7l1rxKg9BK?=
 =?us-ascii?Q?4qlahQ8MjSszYz5tTAvvDgxOinA5ney9lPiVQf/9UTGAoPcaDcxpIRjKp5+Y?=
 =?us-ascii?Q?+ImXfNQgQiA/hhgunlYUFc3Pq2Sm434ZU4zCDt8bCjdYWFoqnMBUht1MIGsN?=
 =?us-ascii?Q?IYBvEpT/L6hO0gWyMPv7uLiKb2DmomOt5lrJ+h+E66wnBZiX4LwgmMhg11Kd?=
 =?us-ascii?Q?cFJfQo72Tem7E3ynWc91DaVZm5j4P5AuvQhq/Y/h0+Dnv0Ox9w6j/EVRl/Wv?=
 =?us-ascii?Q?na4NRyUzGb760AbRwVk3Ne0vpVbKqBV4sCWuWxCCjep/EpNS4jD9TIKQd+fv?=
 =?us-ascii?Q?G2sVWwKEIWvvurwNXtcaHenKL7KIk23n6/Eb/y8tLS0+W2K+/AK847h+84TS?=
 =?us-ascii?Q?78H6fIwxUcKgLMFtuWB8w3K7m1J2PCJgZybNEI9UjIy1VawhePtD46uo8vQ7?=
 =?us-ascii?Q?dgDkubpe+3dyJajs/7twlZ/YbStFwewqfyxm43s9e99ZDhUwvdmYQ3WgILnn?=
 =?us-ascii?Q?k82eLZPcDfbc32VdlWBF8QzvSdurgEkTOrWASsJspDCZ0oxNAhZAuWl5N9yF?=
 =?us-ascii?Q?oeZKSl5Y6LU1iks53j3MnCpMrxNkpoX/VuS++x0O9/IM3tP9kC7oojrLeBQQ?=
 =?us-ascii?Q?lwIDg6I9DgCHnPCEKYZM0H6Ly3SCVjYf0ymPNxlYeYxQnj7FDIZJsX5dIr18?=
 =?us-ascii?Q?3vMCQQqZmDUO4/B6jy639L8gJvOZuJ7/Njxh+NNxBBseeC5J8zqvIQMyFT4a?=
 =?us-ascii?Q?hO9U2oThFg/adn1XOc6Et/BeylrlsXejRKFbTz2KMvr9fvbabYeO5tqSZUXx?=
 =?us-ascii?Q?dM4tHF5IkqIIaXBwMcHvzEPVrIQk726ldIH+diplUNjXnuLkz5bwF+r4MwO8?=
 =?us-ascii?Q?pumquB2IUsM5lpH95c11ihfgCqyZu4MrF1YmdZjC3NrqLhDObOi1AKeyl9sB?=
 =?us-ascii?Q?Aq7o2WO82YLFj7tfPusIuTTQH4veClwSdY0DJn3luUbysn9PR0GLQtEnF1jC?=
 =?us-ascii?Q?EAPCOa0FelPG3oSPetBPb8LvuMhvjKp9WjkQayZpeW5TxYFsZUYptghhNXIG?=
 =?us-ascii?Q?T91oCkpjd64+27dgbYNyI2grzUDzadi+h9BsxBBcM2TA642DoUur6Y8gJ8Wd?=
 =?us-ascii?Q?sds0KROlaPZePzBibIzsHTf+HzOeU/5g7LDh9mtTtDwwKDIOSv2s8/ASvVz5?=
 =?us-ascii?Q?OlenS/O5rrSIScBbF63kt/7yaGhiazWJC6OG/+NQc0p/yQUaLop3H3YCV7mp?=
 =?us-ascii?Q?leSSNil9uaYhvkjWXvaPvGouk/zz/qep6nr5sRIdor7DucJGyIyDNEGeEY+7?=
 =?us-ascii?Q?wK5ZZlE0jYjs8ARlOaerat/DJcjr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PWIlJouyXP0fuPta/whyBfxdakWClcPLTJT+85Rww8kxDYKA4bqcnll1Oe45?=
 =?us-ascii?Q?6dEbxZYfHEk3AV8O5yYynvJVhyncebgpQZxxJGh2anRunux4ByzAUMerR/Ia?=
 =?us-ascii?Q?v1Ph2yTY2H7c6tnrdBRGs8jEu/pXrRNHKPNEMFY78E/NHqzD69Y+izNt6ChZ?=
 =?us-ascii?Q?Qm/1dACS2Cwaolw8bBAkMSrgxZBhHgC02Z50g7QSAZSq7Kj6HmrO0wAcdALO?=
 =?us-ascii?Q?IKgfbm7ygKZYw/QidjA8KNHmYUakZ1mVh+X9gAyvQAR0V/kAbdRqm2WEdvtU?=
 =?us-ascii?Q?ppPJWkoaQIvCYXOdT862r1gJZNAM1cdi5O9uKQhsxbC+Dxu1qG3zdTpBT7nO?=
 =?us-ascii?Q?4Jfsb/863GKLgu8DypYuSPodDmAkico6s7qMhFacsVvI+OtzR1tVtlfz8mkk?=
 =?us-ascii?Q?gMRijHnsGdBOJzsXjs06pRccRRtBD9f1KHXym6uBYfYG1zZIEEsLUL7GCjQB?=
 =?us-ascii?Q?074HjuwnyuzeNSRbh2777a0e8SBh/aZLl9X574G8ieX2a5q348FgNjyMND4F?=
 =?us-ascii?Q?yafLU0ukfFAybRW9pBVu5WF2xck55aa+VOdBH2sUf7Hu+lLKv4kUt96fldRN?=
 =?us-ascii?Q?QwdRUaj66VZADmWMEPu6CyxVgipB6KYDGfJiMJpLnWQi2XeysitJ8iwbIKl+?=
 =?us-ascii?Q?3v2C2kMmLoSVJBG29D/kmakLLxv8VczASOzLaTmJMF5q3Ya+CzrKmFatB8Nx?=
 =?us-ascii?Q?qlgTWNFZWCjnHL44WXq6JVXt8bWhLxohCwqb6u9LRW3BqpdNog8QfC749taT?=
 =?us-ascii?Q?ex1kmsl1BFypFr7ewHqExcq959gHNKdSe47p6wavqEh2jtQw1pyvDyh/jIxV?=
 =?us-ascii?Q?Tsos7Q5Zh0CAbTNdp1UZCLmrqaYIsWzERHbSNDf8S+lkd39yYNHz+Scqo0lG?=
 =?us-ascii?Q?Jr+8IjrlIzW1q1LOOnIjNTvqeENRFimK1GiSBskjlfVDI3Th+/BbAYfMAKfr?=
 =?us-ascii?Q?TecfHybh6PShjl3btxziFHGRNcdDVIBGnfWLgGIKSI9Fn89Y6xoqzZ9wafjt?=
 =?us-ascii?Q?8mMRzwELohz9h9AfnV6k3G+KSHRLQexoYsqeXm19Xcr5ZaU4la0Wjl0H5IOT?=
 =?us-ascii?Q?JDsS6Olz3omYTNeR3ZjYvh85wlI6gFbfgT5VfDUG+fw/+R+a/pUOBxqbbwEc?=
 =?us-ascii?Q?hOySJbN/1SqFQkXYqg/cQwq/UYloBzUJPIalH3vrfpP1ymU+NlyRYS4Kuncp?=
 =?us-ascii?Q?ptX1nHQ0f6dLg+725sYkX+pgM3jK4fnJBATzN9IBndhQJS4v3e0b0TjBhoDQ?=
 =?us-ascii?Q?wFAOou1biF40d8m+XC+Zksx8eGVOkyKPHNXhV6A/ybei2oKXAAkc1Dn0y6n3?=
 =?us-ascii?Q?SYbYzAG/7pgo1hB47rrfpyFTr96pxbtIy7k4kpv5ofjXaF3T1KBOCtnCXIFE?=
 =?us-ascii?Q?jDQ+KYwFsaMnAYs7uWrLJQFHywAvqPasdNLw4LZ2VFfdf0izDg6opk2MWviR?=
 =?us-ascii?Q?QVFGzMYMh0iXeY5ecMJiT8fHdaPSeONs114DBq++oJpyLqr5O0eycfr7XFbu?=
 =?us-ascii?Q?9A9B/yL6eyjDef/+0TfTuo0VES/TWhob2tujtHX/nv9+iZ/lsc1go0EtAo2d?=
 =?us-ascii?Q?U2pU6eudH3Z2eLEOdIsDHlzBSlGlpgRf4MPk4i+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d884d8-10dd-4672-622a-08dd768c4ebf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:34.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAk6z3LYzKJcGlO2tcqrzEEgbWDnHUaX8rNRqrtY3qqIGA4rMA9B6pN0OMWHOd9pKZyvWpSQ3Ir1yVjMfgcTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The blamed commit tried to simplify how the deallocations are done but,
in the process, introduced a double-free on the mc_dev variable.

In case the MC device is a DPRC, a new mc_bus is allocated and the
mc_dev variable is just a reference to one of its fields. In this
circumstance, on the error path only the mc_bus should be freed.

This commit introduces back the following checkpatch warning which is a
false-positive.

WARNING: kfree(NULL) is safe and this check is probably not required
+       if (mc_bus)
+               kfree(mc_bus);

Fixes: a042fbed0290 ("staging: fsl-mc: simplify couple of deallocations")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index a8be8cf246fb..0c3a38d7f335 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -906,8 +906,10 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 
 error_cleanup_dev:
 	kfree(mc_dev->regions);
-	kfree(mc_bus);
-	kfree(mc_dev);
+	if (mc_bus)
+		kfree(mc_bus);
+	else
+		kfree(mc_dev);
 
 	return error;
 }
-- 
2.34.1


