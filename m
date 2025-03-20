Return-Path: <linuxppc-dev+bounces-7231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAEA6A5B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 13:04:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJPPh4r0lz2ySP;
	Thu, 20 Mar 2025 23:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742472248;
	cv=pass; b=GBN/+VawcD/K0ScblIxeqaME6P0vZdKgJxth/615b9GTSdRBvoS8Ozg0OKFvfHeFd/L1nqGbCN6Lv3efGBYpz8U+UETqZjaaPeX/PzWcaSQctJEbmUNJ01Ely2WB7I9avjnVIna9PZyCcchW3xgXE8CVwyoAEXs4cg/5eyqJcAbArdvwaDGb2WQQ4nK5eJP53YSsMeM1mDkcMw5WPIlj1hTMBdKaZEYMg6MkX10RCw81hmIHLo7BzEj/CzxX76T8OxWwp91SQPblcQ7UNP7E98e6QEI44n84tWDMilYoJaI9CWtqeyw8Esco2vIpEW+yVGlHWEH78Ffxv56SkV2V1g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742472248; c=relaxed/relaxed;
	bh=hGOGrw9+T1AXH0g8R3HJAYNbEy8USaIjlKimFgzgPW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=obvn0caNwph487eEL3MfPfGY/1OKKczv3g2NKCDDfnoDlPzSii//JIB8P1qGznGeWaIw4Z4ZPC7ZLL9Cr1a4kNjVsaWcxnOgp5YtTuJYCDK4sSF7roMHpcPIwJtzcpaCcSzmSYLgLl7aNOoPuXkIS26++tmc9aUxUyTYverd70afd/+uVjoJZiwmVxn5bR9f/OJka5ugcihVwt6YEG7x0sQ/g1EubmQtc2J7Jk3TP0o/NeyOVtVvP7GI4L2/602nUPy7kC7qHw7yXmEFlTWXdlDkzvafV38QmqLuwaOfUPZ6U80MPRzQwgmLvPDLj3U8iFOHo2yjIY3AllicIUJpAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KU4v3yei; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KU4v3yei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJPPg6XmBz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 23:04:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWESx7kJbwQ9SYzWLxOt84OvgBtJgs9YCHFYt3Ws6hFk2uUMzS8J7cBmQJF9IbGe/ykglW73+MUH5mtHyaIE4mAGUQ8vtelhLjwxWx8KyzJdokTBt0z5qpsL1AzyZTgUfEi6f77j2/AoIlYTJz0RR0vQngfuLvsFjHp7gDruokwJ1PevB7yKTLoAu+KOwnLotj/h3p02zc20+80IEg4GXA+/VAwa/DCj0BE5Fzh0SvIOvTdezz/OcSd7/rEsfofkz/g3hwwTMsQPfUAdgHItCcR9MTBc+MK2+UTYJRNL9jzFjWmIHq2aRDgBbyxNN13FnUYn1u/n5ajaONgRkaI0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGOGrw9+T1AXH0g8R3HJAYNbEy8USaIjlKimFgzgPW8=;
 b=Y+j0OAQcGLAg63mEWqrK3CEwTjxP7SsrWiW3Jt+tkVfoLB/xFIIEcwmbqpiZsw9WO1cxSvV4WUOVQF9ddllSy++UJJOZX5Q5kW4pHL3BDFo7W7gv5GsfB59W12wdD9L/EO47UJZqr111y+4TuovPsKi3J2yWVPlqwap4VVfGrUpw+1CshCvyULp8XL34vbFzx+3l69cn3JcT/CH9WD3dMY2RqixSHmiiOendFutxnMLdcwHPybeuVeGFCGLZyA+IoXOqvqmhc0svrtq46PxhxzrTRSpUaVv8j3+wgTXynJK0uZx86DO4RvLNk3TtjmZ9cPzKemVw1Op65fb+N6s6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGOGrw9+T1AXH0g8R3HJAYNbEy8USaIjlKimFgzgPW8=;
 b=KU4v3yeirOsHxknEA0kapRtTktGr+O/c02ZoStbl9qUEUz42DCQo7yEjSuQveFxRsUvIu06fqVQiD/kqMkHb8kq5Ggvht19i8uglL9ho0M4IcjNa34BXOqSDOm9tMx4th4geODgavFQce43DZh3OKZ7qTEu2O0z5mB0uRbLoMHJqXrNSJ6ISTr/IIgR3ljQX4Pn5IVomTcFk1mElnzWmqVtLKATlZ8bUJTplmKVQW2G3gtUuyAQNZqRW03+UM/cWUbNfMICnWgjk4Ge4G4tHcm2mOk1s8a98XEQ5EnqOP2jwjPn/Ml/MqpWeCyzIoHv+ZHpegiNKTLomyepUIOSn/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 12:03:45 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:03:45 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/3] MAINTAINERS: add myself as maintainer for the fsl-mc bus
Date: Thu, 20 Mar 2025 14:03:17 +0200
Message-Id: <20250320120319.3520315-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
References: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e745b63-0a5a-4ff2-2ce4-08dd67a74401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pb4c6yGfAKwKGwMXkU/zll7fXJj+dCyk+KKWJ7Rjv5YaK69Hp5wP17nd3Dfp?=
 =?us-ascii?Q?IkHVitRJjVLAuNKUVnqjWeL9fYscCxJurD+vYPeg46S161guISSpgCbTC6VB?=
 =?us-ascii?Q?WYwsx5l+F4eufsPKTsBmmCB6sbTrlYoAFDpM1AVKl4PYvQtAeau3wlNGkYlD?=
 =?us-ascii?Q?WBzxci6kLFB8FUBGkLZctwuxbxlMXXq/+NfE9OV7r1TzNC7M2uPh36nBxfQH?=
 =?us-ascii?Q?vf41OG4TpdtUHZwcmgFeLxbAuUas7b/fpifoYtMYjpC95UP481gZKpmp4ydf?=
 =?us-ascii?Q?jQdVNnM2jonQgM245LXIWRKJkY2ehQATWx29/mbD3Ta9Rj+uhwBRHUKgeHyu?=
 =?us-ascii?Q?5NT9d8nHBBu/4vChPy52uZautvarDZryYMz/tUvwB/lrbtn1HzaK4/3wyWiG?=
 =?us-ascii?Q?0aOQ+iiiBhDaAbWWrdWB/hTulOUuVJXmfX0YizQX/3YSOeXr+XkBgBpNY6/u?=
 =?us-ascii?Q?A/r949ixTDVJqYBkRdGya783+8tigsNqbJbQ2XVZ0Jnon/mwfrlPUvlztbdy?=
 =?us-ascii?Q?6virxnpDJvk7w/R5KPfjAHUs5KpEWWimrCJLBu2YIXlWI9DhStydDv3R1EXH?=
 =?us-ascii?Q?zBsHCarUUrONIGOMW9tsjqLdJoamxNGvOuPHi9tmaCAtRIAXP7/9qdteRtiu?=
 =?us-ascii?Q?DPQR/UtWaeNpz3Gf3WdDFqtdVHB1oBbFavoyJZTfj+7eKrd7dbNmU8GMBpOJ?=
 =?us-ascii?Q?Xe3LC1Ekg75y+s2w9ctszHSUqTygVK5CRHyy9mEzuDN43zfGpTQ1BQIG1W7E?=
 =?us-ascii?Q?jr+osUgQJwXivFiAyRIAMZMLGbyiDG6T29G2ouO6cSCxigXT7xVZMuGa0zAd?=
 =?us-ascii?Q?ooXKW1t3vpNPkS7ybi+I/JmuJqFBztv7rHwJd4X3MC0hOWHJWrYVgx+QmgHC?=
 =?us-ascii?Q?fMU+FEyIcLCHQ0lWFKpcQYkAGLtmhhM3C62GYrspG1W9HFr+WQahOOW+VBco?=
 =?us-ascii?Q?yU1Vjp/qOk7gdeAOCpQpvWZo8ATibIuXaVefvggDldqK8WeM/6DnEECxKzMy?=
 =?us-ascii?Q?GwiaRRuSeeJPBw7bjDz/vmPxSq8swx4vRZ+Y+BY65Jjo9t4cQaK0WUwy+xVH?=
 =?us-ascii?Q?dFaHHUqHBXFp7zUWe4DYHAx5AX4cV8ENVr2TusljuvkT7O9D7Lkvb1HjK0t1?=
 =?us-ascii?Q?n+lP1M1OAsRP0fomjyzYUsaHV6fOex6NTKXrxDjIAZvHxPLmcqQRq1cUj6ZD?=
 =?us-ascii?Q?jmX8D+PsV+RHXYZupE8opILiJTZxz/4jnJcpUcUxXN9OKEQu/gNagan6V/Xg?=
 =?us-ascii?Q?RHL5zP2wMaGVryhsyZYAoeikaKUZBRSGOUETNjPa9xSGWesV659cRKG78FbA?=
 =?us-ascii?Q?lMUjgyOfpakXcpe6fix/NZmd47ezDXKtxZcmFgmdiJVr6X2eynaUIvpgpxLf?=
 =?us-ascii?Q?qRbHAplCrcbRXs+H/pZxfz7U2EG2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qrKtl0djEq8M0vlw1EwU4y1E7W4AoaXFv7tSppiLIaZQJN1O0I7rGQpe2c3/?=
 =?us-ascii?Q?IO+LHZNMN9mZpQ4oVpkJIAJ/NXtyOljNwX0rvdRXVni3lwrcH7+r7K+zceo3?=
 =?us-ascii?Q?UmXG8mpClvkrmD3bc/YxEqxfSfgin3MYSV3ccIKDr3MAcjPF8lHTFa5CXmZP?=
 =?us-ascii?Q?4a8jvV9UqyS7HY75jwXm0lIcdo4dk+XjJua+pgDASUMEC8vVqfel1KxNyTLy?=
 =?us-ascii?Q?ixApulC4/HfTCLaa2OGh/4YYTIpLgcyVwrbvifz3pPw3uuSoN3d3hYwx/uye?=
 =?us-ascii?Q?bufWVrLyAnrofM9tUsNjqJJiEDRH31yK7f4mrbV/7olqlwXm+hu0dMYoqQ2U?=
 =?us-ascii?Q?N0Jqt6uN9dBcjQYB3v08LlPqY7X9w72eJJ4BmsJJl3Ff1dMTEdUlAoskClKU?=
 =?us-ascii?Q?55DzQgEiz7t5e2sKSLbNEZ2cXcaYOUVrgBJNRFb4I+RROg4IxofclE+1h5Lc?=
 =?us-ascii?Q?5BD/Aaj9VGUvnMdc+4QNMJ3R5spWrzMpMbSd9qC0CoRCyDc5BhTYHnHv9Edh?=
 =?us-ascii?Q?L9uDjtkmgbIvyw9anaaq0IBhs30tPAu2SXZXei6X14P0CdUJNpEi04tsy7sY?=
 =?us-ascii?Q?8hagMAMEYHbM9h7gOG6wiVkAfExQF63Wew7l6EVFDiC4yOxqcRCZHoiQpyam?=
 =?us-ascii?Q?zE5JLTO8d/x5gnf01zR2eRNZTj7x7rYtGF4kRmnJvwSc1zFvu+OjnXbT9zm1?=
 =?us-ascii?Q?fD1xRCxYpvXiXBbejlvpC4wbLIizs3d4HTkIJBNSB1rl9ZU+oFbY+yQ01XC2?=
 =?us-ascii?Q?xa97cdGQVqUlqcAIzii4cpVVtr4NYKCtt8c5s18omRNOM7Crtjxhw9nxM/mA?=
 =?us-ascii?Q?dynNe03HoxNFYPstOPMrjpmy5r3yOpy1WEqXx0KeWY4AMFsIU9+4ltecSjU1?=
 =?us-ascii?Q?1hJta7izZeIO0WwvjVfWgGvksY32TLDejaf0PGxpU7ce/li+4z+9IpZZcRjR?=
 =?us-ascii?Q?E0PcbVKTjxJailop0IRFCzYj6wZ7c1C8MjYnnyE01uHXZdcjv15Uh0ojlYKH?=
 =?us-ascii?Q?mCUxHyYNCOmON7cbgiBj0IonMhMHzzwgq08dTWh6TmKNKAfRJwGHwhKVUwIV?=
 =?us-ascii?Q?ZRbXvBXMZ8L8bUHHcyy2La6bu8L2dd1J1qu1ppS0iMoUs/AjwGut9jQwH0qT?=
 =?us-ascii?Q?beXcoYiZaZ692VQa1XvOBxuYwxvtX+VYj9MsdJ6ZyktH2O4LcXs6O7OK7mzX?=
 =?us-ascii?Q?7S710zKV/6OaENLfYRKX8hJ4p3cigY5C9qqPsx7dktweg8pCwH/891sXczPW?=
 =?us-ascii?Q?cY0fZB1ebYSrs1i5PspUEFuCqma3TYs1zZtXCCvi5/Dw9/illpicBWwefUPb?=
 =?us-ascii?Q?dW9ymPi4dMm+2GrB57KOxn0x9gsAp37Nb4/RkxG6+klJGV6RJ5n7tRTjPd/Z?=
 =?us-ascii?Q?oYW1c+4dgLZRCsne2eKjA4LHYFJ5/mqeHzVbJ1iCdS+7oi6cHdLr1pydctBZ?=
 =?us-ascii?Q?sxzVIfOKkqlCGUEuWWqQwpJy5kRe+11koxjB45u260pKlnB33zmPD8O5d508?=
 =?us-ascii?Q?NKZF+fN35wd2QlU7OwZhjZUjVL4XPj/a0U9n/6XbBLggQJ7FNmVtr3uRm5JQ?=
 =?us-ascii?Q?CaxR4Is8mavwOTJhsAEzVi5QiBEAVVIc9mAShamZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e745b63-0a5a-4ff2-2ce4-08dd67a74401
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:03:45.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+TO7KiIXvqXu+dKviuplCFvJ+rVUFngCl1RyG14OJgXWPwdcxSYp8rXVpxEoVtxUJ2vslS0tvzUqocw/t1LEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Both Laurentiu and Stuart left the company and are no longer involved
with the fsl-mc bus. Remove them and add myself as maintainer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- also removed Stuart from the MAINTAINERS file
https://lore.kernel.org/linuxppc-dev/CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com/

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 565efd642bd6..95cf8b1a40d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19638,8 +19638,7 @@ F:	fs/qnx6/
 F:	include/linux/qnx6_fs.h
 
 QORIQ DPAA2 FSL-MC BUS DRIVER
-M:	Stuart Yoder <stuyoder@gmail.com>
-M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
+M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-- 
2.34.1


