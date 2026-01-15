Return-Path: <linuxppc-dev+bounces-15764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A71AD2282B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 07:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsCQJ5jBBz2yFm;
	Thu, 15 Jan 2026 17:15:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768457720;
	cv=pass; b=nkaidBF3ZylvL3nspTrMHlNQBeWZUXoH7oKm4sAiX8MOV2KLz2iTwlR3QEX6yDDpJ33RFuLXWmuFpdeC/EZs6+B6paVYZB/NuyWPIFb2d99XpIGa7dFrO6dyKfmPwxmByNkPZcYkc9oryRxi5HX5EDTD5nDuDotsSVmJcgjL/gPTnuDP7qK9fkaWZpIu5QNScFvMxLWgrt8NGyuQnvrb6uJWbRGH0QeEwDbmHhB35Qa1UoOd9ddiu+KGYsiEeZI1oiVFw4dSMQ+gxyE0f8GeGMBxXFQ9pr4aKSq4IIQx4rFefRHM4b5BZBOy/UXL1enrcUWQb/z79pKKqgLuH/FWIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768457720; c=relaxed/relaxed;
	bh=VRX1bm6LSi+rvtgcb8qmg0DqnR1VewWVetxOmGk8KUs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j9TQM32WU9hOBFtM/kx6cu2Ii3uN37mUnJhmlJ7/hlpATip9uGCKkVlmsv+YWv6QxBtKK1+a9XALNUZo1YGhJyVlmxjk1owszEQ0iDglT+6AY4hNi6bQKxhSdG9tFho/fDE8CisQ2wbObWIzaMvp67K+/khZ8lwd78Xdaozu/8MawSkn4k736xHRXjl1jqztJxkKHaJO5uHM0KY4cN+MZoClHjmPC0ib9NAioGJv1TrWxSWP6XOt4xebTx6uDZgF0P9/VSFl91Z9Fr/k3vnVCohmk7FdBL/4ql2hma6AR+mvgjq6Ou3xDjlE+kMbUBlzLdagCwbjNu8SVljF+1r0DA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gX8N0aK/; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gX8N0aK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsCQH2rYzz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 17:15:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmyuD6EwU8gg6kP1DBP3WBPg50uFdr2PwVz/SbbQFp2hajXUzqrpoGxk3HOldtN0JvtaqVSa0dSRp/qtLmQN64shqq/RlBWeazYAuSkFEXtcfyk4maK6PExmMyBLO1CYVAAq0XBcEq5pJUT9DaCDKcE3ooRbh2FZEdLR1Hw45pD/eqWMaHV7NjvIXOIJqC2FDIOa78ykj8dg7wGOgV5fJfQUQGLjrh3z5KcXOTGOCMD2/4GMJpGoG/L1isV0MfarlBvNDo2C0yOMQ9WENpf+MTpP56PleSgEeT0aqoJvle7MRUA5LF+XGN8X5GYWks8vg2iFKUJiRhDb0ZQ23Lhvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRX1bm6LSi+rvtgcb8qmg0DqnR1VewWVetxOmGk8KUs=;
 b=QTNBF9G4T1fD9b8Gp6yG5WEICWfFXKAEV4McCDowk8jeoHiwcPDsctSXc7jzWD8FzNC6aTaPvJ2dY95LJyylUd2hrm+3nMxx0cwo5iFz2PxGAGAHaazzGceWSLQm5OHKxBNlwP6+2BDsdWT7CmVRK3CWpvW0VR+yHz2/p0jtr/ykXP46rUluajEZldHp9XTZ6OLOUR68udbKECoE+kNWbr9m90TLYYjQEjTw0c61rQeroULkDXCNnBbAnY7uZXMPKiBG33pAc2M0aud+0o601tkoPiU2bA5IjT2LYf4fsMBJ7diL1p3p+k3CiESmCzoztm7P74UOilPcd5+GQiX3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRX1bm6LSi+rvtgcb8qmg0DqnR1VewWVetxOmGk8KUs=;
 b=gX8N0aK/WQeGBLGhpdObdMFZt+5i9QSOhIMzAPoPAxxDW6X/dmVkZ0KAaSYrTh2nqItPSWYYWIVw4+L/06b2w8GGlSpSkC+vSx0ezU+1vdCRnCyYZeQIZaDnN/P0d9kZy/w1rHIxoa5Ite1QjOuUrbR2hi2sEh0gtRZUXaOXgBUo7u76fPidrwT42PRSFUQmFZQyaaYO7zS3pFDguiLjLYNlM20BkJGfSi8/3hCut8kuhDdh7QYRYIJscERkysR3l9x0/vl1sb/UpAqrV8LVAykf9Cl+M7phKQjm4Q2dypnErOTHmdWOX/gRmab5b+//uvc3YzRhFo1JDOQVipMRYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB11372.eurprd04.prod.outlook.com (2603:10a6:20b:6c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 06:14:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 06:14:55 +0000
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
Subject: [PATCH v2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform
Date: Thu, 15 Jan 2026 14:14:18 +0800
Message-Id: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB11372:EE_
X-MS-Office365-Filtering-Correlation-Id: 90be80de-378d-4d72-103f-08de53fd6703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HqVN+ucviCKBnMl/dPBLkAyhXkodS8CmaJbzecHxhZ1uEA/C1FxJdGp3u4+r?=
 =?us-ascii?Q?BwkTV887Ign2VcjZT6chKZCeUWGXWR+Fv3IjACkMM5wqxGTvyjtkYbegZotV?=
 =?us-ascii?Q?zRjOSrthu2GDECYOvhkcde/6tbYW6xesJ1fJ6UI8ikNdtpqf5Xf+DaJV5icM?=
 =?us-ascii?Q?B6UJX7/gid+yX59D8SCS9JDwQZ6wLV8haztr+ASgjbSBHWkGiXAG63Uru75c?=
 =?us-ascii?Q?KuNgPPPW0rpj2O6xE07C6+KCcuUi8BVpgxXR3xjsvB8vKTSzf+DjoBNNKiWt?=
 =?us-ascii?Q?mGLgdoKeM2kjWnKxWyHRUml4UoS1TNvbGNHB6+EZneW4dyOUZqphE0KqP+Hm?=
 =?us-ascii?Q?c4nWJQyYGkTVkM0jcAII4cske0AB1EO6IXlMlqEE+wlAoTOG90OV/VYYGoDQ?=
 =?us-ascii?Q?A9XTtNhWAPTTpZfcCfWzyKLuI01RxgQTzokOgesu6JWruQMIG6uSVthr/m0q?=
 =?us-ascii?Q?y3mzP8Px6iU8RqlCcjJkufHL2o5KfvlocJPAyhXua3BdP6cqetuRQti86XX4?=
 =?us-ascii?Q?afHKNuXNiFWTD86tVRwZ0dhA2tGp/dVWm8V1V6cgtJA4oO453JU4kvO+7A1m?=
 =?us-ascii?Q?griQZGBt98hueGBfaUlgPkdONY4I+1YH7CEB59wmW1u+ReAKHzB7AUS+Isk3?=
 =?us-ascii?Q?J2K3R6tNpJwiwVCrD1j9aDt1aae09IRcvPt7QcRmnhBYiRqTIJFkCcTQE0N5?=
 =?us-ascii?Q?fODBuIhtRStSzOxZ/fwgxHsAlKJQa6Nol6XVS3osjdwjXxEcPkeP47b+NQ4Q?=
 =?us-ascii?Q?ihfEJtEII/p0tAcFrcNL8csW22ZnukZN6/7lc9W9SYAqZqrlFQfG2zyfwdnn?=
 =?us-ascii?Q?FaxM6HEPrzDQF67zQHvanaFMaeCgXb2cInh/MCvvL2hny4Cpj3TXGjKOsxfV?=
 =?us-ascii?Q?fUnLGuOVFUwg8dqCig3JelCIroHrQzcsfMydlrWjXrpFwgL24VImXL0AXBAN?=
 =?us-ascii?Q?lJIh2RAcqw4XCLgRve9XgXn1yRfWXCvz4QOIpzIVderrxpDXrjAdQuTt1AY1?=
 =?us-ascii?Q?OMqn3R5+p1O39ZT3cNSowdsrw/+ZOG7XVEYL/p5nNU3D2zstK93RxDRlKXYN?=
 =?us-ascii?Q?UfHUHHMPG3RKR5NCRwo+TMB593l7NPQMiN3mgLnfJgC+/2ftrF+ZQ2iGQPn4?=
 =?us-ascii?Q?VmEgQQzyB7Av8Bywp13tGmShz7tViXzVvfmwv+R/sO2PwJA0yU1SpoqVrr42?=
 =?us-ascii?Q?gMIj5ahadbRKlKQd3VleG4nBB7SlflFw5QV+K4WkKrMiyTts+mKc6wNDino8?=
 =?us-ascii?Q?V9z9wvBi9ZTI/UsC6ayZuZSO4U1GYc9HOfunSlldTVHSj6h26wpOevwMgiA9?=
 =?us-ascii?Q?rvU+0dfBBBrxP9upm4zwTAhAl9Btw5nWu7Ubc9Db5t7T3vMz3iTob5VGB3So?=
 =?us-ascii?Q?QMfwn2879/Jz4N1MLw0nK2ZKSjqD2UlrKactesElFTsg+yjukTumrS3EbyAT?=
 =?us-ascii?Q?3UVjEaaGjyZFiy7To+GhwOywdHSbbse33PykxGQUMAQltzVVlhG26v459sku?=
 =?us-ascii?Q?tlJfF9DgPmtxqoWr/Fo8AaOC/CIRjXTGlj+hqK+d1YlbwohtYnZ7eJzeychZ?=
 =?us-ascii?Q?ZKeOzcSKlHiTSOjCJI8jGhB/AnVm2kPLwSqwqmDQttqr8JhrIaa8nz1YVytW?=
 =?us-ascii?Q?YjaxCIiJkJ36XxDw+26Wvl+2G0g6gxV9FAIIoO0vhnsZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbdgEsYE3R+ktCOCUb3BJnGXwyo5rxVrmIjMCVkUGzvkaG8IikAyAaxC0S4I?=
 =?us-ascii?Q?3MEOiyAA+JGYnVdJTfOQ6/eNh6u82G08M2GiX6GHt11etV8JeLsF92K4N8jc?=
 =?us-ascii?Q?IhD0YaD+2ZwmaEJogAxaQaDz4KPZQwlpLtW1lt+ye2LFK3QZrVeQe4QNRwEm?=
 =?us-ascii?Q?W4mMMYs4nCnBe1HLe7xPN8SgdyL0zfHKOXNdpCsrwtGKdGtWz+s729I/fmPv?=
 =?us-ascii?Q?pqHBCf1G82lK1kudtpHV7GrFDUVZ577QvSTnWKfe8lqmLE4kMQo1ZWm1trsM?=
 =?us-ascii?Q?8y27JjP1EECh+omNP8DvUUpKsOjhLD5FCCGsVlr8d3/dzZR0zoY4cospizAQ?=
 =?us-ascii?Q?sNCYDrxqB/UpKMR9X3+XL/OZ2pin4WLoNFUWx5tGBVy62g3J6dI6lQvin58h?=
 =?us-ascii?Q?5MmVt0mUmEBQemBdW0ig4gelDUBzS5Yv0p8kB7KT5y1VQwRCwAdvcujIlse5?=
 =?us-ascii?Q?RPvbsqVu3DvkIAuCMrEisKG3h8ZLFiNb/lJEZ2KKKjsw8nHvE27Y4xNvRv+8?=
 =?us-ascii?Q?t5mVGMdgKGCMtJYJlW4616njNpO+eie5HKLx5yVC2MrCT+0l7pzKV9rCcYuO?=
 =?us-ascii?Q?0GTqtwCct6sO1hChJyXYFfLtm5vudRqxvxnBv+ioexpEa+L1jgFKlZK3GqW8?=
 =?us-ascii?Q?/oicYfetb63o2bvTUFpu+42WWlihdbU1ukHH5WpbajSSoGQt2HjABdM5elsB?=
 =?us-ascii?Q?m9QFoveVYJs3yp155ncwI55TjJIttcxMYV32dlOdfrX7c1oUX8VnUHhiHm+R?=
 =?us-ascii?Q?8zDyZYDr7iVCu0qh6yZqzvtWqU8vSxihWfRThSwXEGghdM5WdZdFROA286Y3?=
 =?us-ascii?Q?E1i1JXkbGpr/K/od6sUD96VUMzpqTc7KF/K2yO8M9YwX7bRhy4b422vTV5Bk?=
 =?us-ascii?Q?Zs8Fw4Xeq8TARBRMGKOf2X4mScmAC4JSKKXnpv7EMfe8Ku96ImPUUZgzOqVh?=
 =?us-ascii?Q?jBusYSHrBVQmeY6EiT96j/CfG565um4u27g7TEyTlHKRQg7CxRmFDjMjXoMd?=
 =?us-ascii?Q?WpAGeagTJRnGgaD3sAQaHPXmOum31ZASvTqDkjhPZutWGTGqEyVrMRFXgrfm?=
 =?us-ascii?Q?vOYZCkVd6HZlJgmQPKrpcO29llXBUOU/n2DcfHl46DYk3LzB6ED+lT1N4J0m?=
 =?us-ascii?Q?aDWEptf3xJ4W6ls0j9W2x+3FQ2bOvB5C0Zmx3VS7cUe6hpVskx0L9OPzmcaS?=
 =?us-ascii?Q?a8LGj2TeyBS82P+9mx3JxQbsWq+SLn2X0qZMUZ+UK7rU2aIGmsKgCF6OmbG1?=
 =?us-ascii?Q?LMqAougl1LUAtiCA420XWsvmoYimwwYm3Xc40TtSVgSokxKqz20Fhd9H3cDC?=
 =?us-ascii?Q?agMOL7L1R65PrMTsR13pVIuIebLcldBvsv1XlHkDScoUCAAlLswRclJsMILB?=
 =?us-ascii?Q?d4Q+aN0rRewVhV9Yg3L44ctc1M4eSMxr/tPbiTpmsD9rED3RA5oFiRlMXIHr?=
 =?us-ascii?Q?yBoP8kgOv/6aRo7KS+JIGgTd3XYTma23H0m1wWT7W18/PDdryWxunC1di7hV?=
 =?us-ascii?Q?MklzgjxbCLmtNmtq0/6lsoNJwDReoGKC9/NfKjQ0Kko2NcVBU+Ij2SfajG5p?=
 =?us-ascii?Q?dq1QvV3GiRyQbhyMghPNfLLRxQp9HWVMdksrODqpr6kibq54vbqJJf7mTTif?=
 =?us-ascii?Q?cUVi/FKj+Ywr1jbTB283K6PgcZMkCD1MeMijSoLKU/xSFDWqdqkl1s5disw+?=
 =?us-ascii?Q?XxyVtVf/pHBssD+Oj4OA2rVVne/zWvnPGr1zI7xtlulIeTk1f2In8+REFqvg?=
 =?us-ascii?Q?xk0jo57EUQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90be80de-378d-4d72-103f-08de53fd6703
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 06:14:55.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /20aSoQSJcAuQLWtlXqe9EH0AGDIVnzFcdcmEKfmkpW5bOD9ffERJXO8PLsBlLrFSw2sjr2/6iO0yH8tNMzg9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11372
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a new compatible string 'fsl,imx952-sai' for i.MX952 platform, which
is fallback compatible with 'fsl,imx95-sai'.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- drop driver changes, as it is fallback compatible with mx95

 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 0d733e5b08a4..d838ee0b61cb 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fsl,imx94-sai
+              - fsl,imx952-sai
           - const: fsl,imx95-sai
 
   reg:
-- 
2.34.1


