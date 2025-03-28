Return-Path: <linuxppc-dev+bounces-7366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9DA745DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 10:00:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPDxF0Ss3z2yrf;
	Fri, 28 Mar 2025 19:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743152385;
	cv=pass; b=oAawc2DmvcZO5PQKUvh+RPX8+xiY0eB7DdCX0AELof0CMrFFbTzGO9jb+dvmpsENSsivIbcVt/I9gPC/RzTjaht3EaRSJDk8fB74zoJ0BbyqcWo2gTlSUsxi+5JXjhaBL0eRm2YTohZHeXJFP1ylDmXpTsKH17E70EFctnffllJijCu+6+E6O6vpqYXD6FIfK+ugWGPQ6dGclmohypuxCFTNJ4zPDnmInhbBMXWeYPTLlaa2yzDatIWfXgGPLE7XegNMOWelIBiEwowciBD4pEHkE0ZAFcl3bwUTeXEdBld1BiSd1yl9CNOrlPFKsaD9/im7lZ8M/+MOd1bJSzh/8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743152385; c=relaxed/relaxed;
	bh=EADBFlOxypym4EXgRKyAYTTw6n/3UcSyUhMwe94pv+M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TEFylLR4g+75YYCfcL8RR8iJ1gjCMPMAgpMNitkVsBoBPgETFVMmHQIVle0UpAgR1qM/4zNAF0O8RFaXpDie7JojUJ23PnuswYwj9Gqghr0o7KitAlQGeBVoC/ov4AjHZUNJKnWPq/QmYp4g8py9t9UctNS8AKR56bYjnBXXjR3QK5TIy3bGkc1DbrqwJs3RmCjuwbqIUbs9gVR0F8v8fgB8G0PlZ6aOdrfHuQ9oiALSCFL77PV+HDEdqSFwp3j2RkZQXn6AXVzucoWnj2y9Sx62kdpDtzJGEGjxt/kjMcTpqHa9cZFcTE/n4oLiJN8PBbDCgajjG+a17rxFyDnLZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ePyEH75N; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ePyEH75N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPDxD1DNgz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 19:59:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0HTxLMfwOGK3cq3g1vE48kIfknHiK8eWkRC/YHKKanrJapG/HuVEu6mfeU4ZV+gnN/yaKM5oQS2DznqRcKn+oi6DIjY7tr98+DZk2BrQYUuWht1f2L8EMu51fO1qwfkNWvrB4ZPDcdqcfCL30Y1A04uRyUXrRG4dxt0MwMa0Mv1El3+UHyw1LkMAz0bUB5szCFB8yeuDsupLoGFY4g5TXS5GxH5eS0eJa4q8XOvPYbeMr9I3vvTScbH8v4NLuF3VvA4Kbidc735vlxEiiIA79i5Wwh/ZMB2pFCoD/NW3wz9Fyr2J+7AzXHLr8Yeba0PTDqX3Xlwm20B0EtqYnXzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EADBFlOxypym4EXgRKyAYTTw6n/3UcSyUhMwe94pv+M=;
 b=XWr0ZGsbeST/a2GsItV3fDIxJ3/CTLdLvyIEduy/Np65ehIREmPuuCvx5MGp4cMUbm18UsGq3IQf5cEwB7g8idlWH5pcpAItBZiEYMIR/nf8BtDzy7bqENLuIQ7+izHx2BZEOhjIDqDVz/xr0AIevPZAhSR9phwfVZUMBnQDxW8AuWL0cFM9UD2oPt2z4m1gcQAf9svm7bFgR87DfXTFGDf9fiWuY9Yj0MzIHf0faKUxFLAxrQU1mNh7E22UZLXoT8tOqkIYmcjijGQjs+KRjX9yLlOvusi/iq5h+dYkUWeBWDHEjYRpKSCK86UJG4yacCM65BNOVLn0VnkwV6okPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EADBFlOxypym4EXgRKyAYTTw6n/3UcSyUhMwe94pv+M=;
 b=ePyEH75NjSLZRhMw/lRbjFTPHpef955YSlyhH1VDq28/knm90jBP+gQzXSkWNOTjl65CBwhvNClUXSgbC0gJaHK+JPqq6ijLX71kR1iKEfSriLJFzSZ3awoRB3GKBNMcPHPMMEiY7D4LpNzDqmjwy4B+vmc5GgHlS5jcR7zPkdoWpbadxIAxnVib7keZGWmmFQhBKd9mKhXsHIn1vU9Jt/GoWfT49XHymfs7emV7QmAU8OTo53gBc7geXOQ9TK+F8vM/QTIwpb4mPP3hv977O/8pBxjCJY0bNpcW1w1LnKCIJYwXdcMb+yXeZ9JLHxmiU0Mc64r9FBp64l5T0YRYmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:59:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:59:30 +0000
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
Subject: [PATCH 3/4] ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
Date: Fri, 28 Mar 2025 16:57:43 +0800
Message-Id: <20250328085744.1893434-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
References: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a70df3-b8ab-4530-1087-08dd6dd6da1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Mn6lmwpEhYDSTMw6Lsd4Vj1Rnc6P1bWuZWL1w5LW8ZM12Z8f6GM7/V2oMgi?=
 =?us-ascii?Q?XC7sr+J/tbkElxUu2Nxa+j9LPGsmCFM0BHSKpOhH1RGgTzVT83yODSPrArHn?=
 =?us-ascii?Q?lJeYbFa4Be9FuQ+zrmTiDVIrFMNYljYGXxqM+RhEwLuTizCOtS9A7cCf8li9?=
 =?us-ascii?Q?XMzFF7+Bk9Tn5SMo17qGtVdnobrlZyYO7az3wUvaFp0UvmfeJJ4K5+/NwalQ?=
 =?us-ascii?Q?Xca5sKuHerxIPNYrLhwmLbh0mGM1z4tLaAYGqA/52/VkSBMfIlgpQDbMms7O?=
 =?us-ascii?Q?rN7YhM+WSh7VvJ7yrJokb20fvoLow9JiuKbFjUAAo/gJ1OGXPkzpYPb0hJv9?=
 =?us-ascii?Q?UBgHGn02/E8qrE/tMpztvjGLcn5Mp5/I/EyTT+cRQEZzDXugIzPMISQdmqcC?=
 =?us-ascii?Q?WIxFkWfc6sEAnIFvEoz2+qAkMTzk61pUb2VHcO+pIhs/BKzOuJ9p1uQHf7Oo?=
 =?us-ascii?Q?/BBarXp2bZvy86Ca/y3aI2t4SEA2ZbQrFEsQScNbqAnCSMuc/weuGsCWz7Ow?=
 =?us-ascii?Q?wGhycaTLFNIiPP1gEzHnADYquZnoaACVlryATQUsRJ0FPUcnb7OoVrXSGHMW?=
 =?us-ascii?Q?Ciu4u0HzbCK+5NViskhazysir/tD53TFlwcXAbP/wYerrEV+YzqNzUzWJRBO?=
 =?us-ascii?Q?DtNxRu+ymXQoSoWQNpuhwWZLdnWFhzo+4PqOOmtYp8ULBHoj+lnalyFJ4n2g?=
 =?us-ascii?Q?Rkg4rJKJL8QSQWgoABGM3Ggsmlp5hXp5FABNrrpiHygKrwooQ2mXtqAZArC3?=
 =?us-ascii?Q?burYIO1DjRvaL2fOALt1+2MmcV9t2MMN7TUsMn+8AQ4ogdScSaYZb4IyvqU0?=
 =?us-ascii?Q?sYpNbfESsL7lwUdMT+byzn0WuiVLbK/Q/6aRrvvZ0esKCKy6+SaEINqQmtEh?=
 =?us-ascii?Q?smJpBEsr+GrWKnokgVsWprsfcOQXwzOZ6mdG3oX5nenvZvLYvrhDevf1q63X?=
 =?us-ascii?Q?foAkFPGTElxTDkduKvToKpEGkGBOBHZcihDCDtDmXKNytbUAxISbIekj3TDE?=
 =?us-ascii?Q?HdHxPgCqkh+mRinuNmJetUj0jH6kGP+KchybuSwXWQWAENgr8OF9YOwfMXqT?=
 =?us-ascii?Q?OsOycGtshUBWSbX5/pedN5yXG1yPPCR9z6r2I2KwqyUSjPkFQdZTM4gj43a9?=
 =?us-ascii?Q?wlIU9009J14DBcWRdEgXs/fb4ZOkpBrSDLmf0DAJkiypsTvEds9fBLgwDGfn?=
 =?us-ascii?Q?S4w9Hfp8QF6Rkhhq2djz9/wMyuYgA/VX4CbeKpxF8IMOmRz9OzJkqcDozr6N?=
 =?us-ascii?Q?BXRQVN2Q0zMHn0Gexv85M5lKPhdTvtHL4q1HiiwCs5H0aXLy8T7AGJsIcqrP?=
 =?us-ascii?Q?C9ivSNQQzD2m+2sD9mo0FpDbktwUZELDidnpv/zkZ7ZjzOq03BR39sR1iNlt?=
 =?us-ascii?Q?bRx81Zxvw3HEd5gxm//Ttf96l8s2rneCbLu/MyUiLJ3SB4RKow/jHRbY1ukX?=
 =?us-ascii?Q?VrY4S+iR/v8BHHTmrdwDPF+wVMEAau07?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7xUoJXpplBMrTByMivuwURyhXAiQJ1u1l8AdQwkVdUleBKHslqytKdHhEHjT?=
 =?us-ascii?Q?SZAWK+a8A+oIZW18ar3wlx6p/48cl1pAeN8Tq2IAm4vkeCUI6eOeLoVWQJDQ?=
 =?us-ascii?Q?ukFED7Y/UKCnfDxULfS7fb7yaJhxAKnObDKtgHYeoAYk2qVlwkk+2Gvh+VpF?=
 =?us-ascii?Q?ig0RwxITyvbc3dWTuP5ZO5tFKAx7zFF/RzvAWROsWHw58eLlKjHA69NRB+h3?=
 =?us-ascii?Q?L+sTI9IEhHrQOKFDO2eL2fYG3zHsSi8h2xrK93Y7wXNUr5ep+Cq6HzQfioC6?=
 =?us-ascii?Q?L4okF95SaQPKxhE6LSBspJOqTSAVbOrdW6jvxUEM4lLHpcfHtgG76R2ymIX0?=
 =?us-ascii?Q?PLyHbaz/SgzKClkdBlO1oe4p36FUiD1ixLQGahRR2JWOEv79XWhnMnIFJotL?=
 =?us-ascii?Q?GiWjyTWUIfU/ysssfmyBum4OThcdpdi6ZzwjLbeod78H8yCjNr30xgPgoSwK?=
 =?us-ascii?Q?o1yzyDQw/T5Y//cehvTT2vL1CwBy5W0ydt+TJsjvdx5I8YuR+vvs8fz8HUxX?=
 =?us-ascii?Q?xb0GNidZSr+efva6BUiFGScMNdaJen2XRVHQDeYKOEBjqdCJM4DT9JfaLfM+?=
 =?us-ascii?Q?vjyAB1dJHd+ha0SqdsIJl0bTUgC1ydaxX5WPooKRT4GqrsX0c8hhfDbnDZJt?=
 =?us-ascii?Q?dVKHyTUrpRcKyqCHOKfpzQqD4mBgBBIRbkMZXgFvNGyxh4f45CPLEbzvw1Pk?=
 =?us-ascii?Q?gXWksZsloHAKGnAgpjxWbAPdHB6RdismykFSertdfkDa20FcfMVs1qXNWhsq?=
 =?us-ascii?Q?XGZ2kE9qnbkEHIn96O8hpXIQLfCfhoVCOAHyjONuGM0GP9SPugc3EwUeep+W?=
 =?us-ascii?Q?+dJuIa1gE+DTxramQJ5x+zo01IC6EGKb3RnbQuMc9mCks1Zgq7DPqBgukzyl?=
 =?us-ascii?Q?gpXOCnZ2yuCBaEhACAruI5q0bqWkK1XVTMAJN2MuxWWJB0BsoEpVACj4RwKD?=
 =?us-ascii?Q?nTTbD7RzY0Ug9nIPZNU5o8LmVSOivtaY2uEi1QEmvJk/4wDR9LmG6c0UY7P3?=
 =?us-ascii?Q?jPobvqHIafQgeAChRGtbgwrziNgA2I8lxBaihjpgCJGVyM6fD3BeOS+YQjaq?=
 =?us-ascii?Q?ZINQHY+5TEI6s2CQBfkTyLhGyWjSXBHL9dii9G1aWac6cv3Gtrk7syTri+QO?=
 =?us-ascii?Q?esN5tkbrpqZyv9iiQHD79CcVHQkLy/kz/UdRQK8gE0jZ45fBt4bzY0E5O5mb?=
 =?us-ascii?Q?H5C3C4WrQK0SgGGhDqJJWWtqgzTCWh2DqvshNYsFHkdfZojgN+iXS7Qf9Cv4?=
 =?us-ascii?Q?LE6guCtUSiOSAZUmn+8064CNsiqBBe6Dj1wWqmIooARfisic0VE8jdC6SiNm?=
 =?us-ascii?Q?E2T1xiMHke7fnTNuIRBCUHUz9SMDvIxgfTQ6GJrHUIPyzH4h94avzHC+wRbm?=
 =?us-ascii?Q?jm/il8wybb0h8e6+A+djfZt5IyGC5xZXojcHGmJZdivAmhVJ3UxYPcOFRQZg?=
 =?us-ascii?Q?QJZiughbZTbyOkAlvNs2GgJvDdsN6cMZDB7027vbaf49LRZQAgbLvR0uReDb?=
 =?us-ascii?Q?gH7vM522jXdOkMIahZBn5putEyWYVV++w66uAcVypkO1ocnbEBJwIpIDytIm?=
 =?us-ascii?Q?t0yws5PVuZ838+uJ7OOX/rjP9h2b2fFK05CPJ5H2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a70df3-b8ab-4530-1087-08dd6dd6da1a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:59:30.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z61f8W7FGnCF25le1tind6+UC7tCXgrgPCgUo5MURvzRga9CC/Z8n4NXZWq5aLlkxlsdk9lahIF6xwebuOT9/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The transmitter and receiver of SAI can be used for different dsp modes,
then 'is_dsp_mode' needs to be separated.

Expand 'is_dsp_mode' to array 'is_dsp_mode[]' to support different
configuration of tx and rx.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 8 ++++----
 sound/soc/fsl/fsl_sai.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 9a450fc86dba..09054e339b31 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -287,7 +287,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		val_cr4 |= FSL_SAI_CR4_MF;
 
 	sai->is_pdm_mode = false;
-	sai->is_dsp_mode = false;
+	sai->is_dsp_mode[tx] = false;
 	/* DAI mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -316,7 +316,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		 */
 		val_cr2 |= FSL_SAI_CR2_BCP;
 		val_cr4 |= FSL_SAI_CR4_FSE;
-		sai->is_dsp_mode = true;
+		sai->is_dsp_mode[tx] = true;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		/*
@@ -324,7 +324,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		 * frame sync asserts with the first bit of the frame.
 		 */
 		val_cr2 |= FSL_SAI_CR2_BCP;
-		sai->is_dsp_mode = true;
+		sai->is_dsp_mode[tx] = true;
 		break;
 	case SND_SOC_DAIFMT_PDM:
 		val_cr2 |= FSL_SAI_CR2_BCP;
@@ -607,7 +607,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (!sai->is_dsp_mode && !sai->is_pdm_mode)
+	if (!sai->is_dsp_mode[tx] && !sai->is_pdm_mode)
 		val_cr4 |= FSL_SAI_CR4_SYWD(slot_width);
 
 	val_cr5 |= FSL_SAI_CR5_WNW(slot_width);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 0e25e2fc7ce0..3f9357da0d8f 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -286,7 +286,7 @@ struct fsl_sai {
 
 	bool is_consumer_mode[2];
 	bool is_lsb_first;
-	bool is_dsp_mode;
+	bool is_dsp_mode[2];
 	bool is_pdm_mode;
 	bool is_multi_fifo_dma;
 	bool synchronous[2];
-- 
2.34.1


