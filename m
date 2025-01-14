Return-Path: <linuxppc-dev+bounces-5219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED12A1040E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 11:28:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXQMP1CKLz301v;
	Tue, 14 Jan 2025 21:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736850513;
	cv=pass; b=DBH96mRr33bwy5cvqHIRquE58e7tgB+xauE+MxZVmibhiwsLPtfVRtHmLwSaE6zTjK4bhJ+Zw3Y72EkzARCzO0v4/eHCwZlpcozod0BonOYyDcCzMbmKRlASN6wRuP1LHLGCpWb+zQ0xm3+pKbsfW3e/65oDhO0v0jrvxcjGMPAaLz6hvHAnen4zRsbFdGmM74dbViWtMTyg14KVsrfyGOKvjQKA45YGT31jNq8Kjofeq4uzJY8YoJmaMyeoS6zJepqJkjNco+TOYbX3iTxm6eB9JGtkJGiAGwz0YmTDorTjnlWgaOTfJdihec3t0Y/0LKPNS1erVSn82S5ZIff39A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736850513; c=relaxed/relaxed;
	bh=v5fR8JC7NMlovC+1qO/wS9qMNHsvo21JDo8K0drx5EI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbR6OIcoHuhqwwWSkuVm92I/CwPmYjTjsZ43nl3svpVYwqfdf1Uie9aS9WemJipxWCZqH/BlJ12yoyNzCFmDD2L8j3UFn06Nati9NyUjXUWHbxQ0O4CSlMedmKwRFjtiJ3UpeMN2ReTspZzMfYHXo+eDDCGiMqt+Wf2z8N8lAkDlOgolqLI4moxDjok7/CBMdLw1cy7XSoeHuDinjkRgwcFNAwlVLYDlrmeceMNo8BJqmmVE0iDfjMVySKGTGxdekSNooGzChjEyBdz+q+aQE5mObwN3ThopmvyPzJSo8V8Ts6FfszFZMZ1yicfSNW3APTnrJaJhA+UJ1PpCsQHjXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MxVy6JnH; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MxVy6JnH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQMN3MpNz306x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:28:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzF79nReC8kPVHFit5fSehv1ZcODsKjLn4PO/8L2tubmgCAv/AWyXlK+UzY9XhCo8iEOuVxBv/lH0PKJt2TXb3GI4YlKmcpVhmYvBuOzW06/dPyCQqH/sCPQnlidW7e0rn4RorxME/Sw8Ds8Mh7P/zA8+C7/oSG2JmuEfwkmgCKdoN0q4Cq8Z3RnaBQIOqPHtnfgd8Njf7rSdLPJfquVU+gqDWQCPrie5XeP56fsFTgU18KbXIys2wn52c5MnYi/6T2D61TAitPU+XD7z+QboAIWQeqrXhhEtuY2wT8p1k+BaQVXh9D9U24Cw1dlYD9IOfOXF8tXoAmcUJupocagMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5fR8JC7NMlovC+1qO/wS9qMNHsvo21JDo8K0drx5EI=;
 b=rpCBjELZnTqu0gAow000kfDHtNai26YVQBVTpGJ0j993NIu3oCattP3QJ7vof3+WyvMxgV5su8ar2HQcVH9sUej6SPzsUGgrxtvPwcaHoNaDxySZSZsaDvUQHNtl1wU6API3t8HC2jd7aZ+oqhlwP0IkcdC80lrdzoVSD1sxGqQ6cr6y+v+MFVQ0H46C85d4ft8S8hADYJkMna7zDwYpiYDIeC4bZ7j/Rv5RkZ3opX/pO7+PbLR7nzNBkSeYUoETa8v1vy0HgKMY1mev6wMqtzrZ2374pb4PQjiPwRkvFtCbxQ40jjGlr+uwg/wuASr2Xzn9LiUJvnYYHZ+8/qM2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5fR8JC7NMlovC+1qO/wS9qMNHsvo21JDo8K0drx5EI=;
 b=MxVy6JnH/i17b4hl2XTKWemiJukiESzjBvBS+71pwiOOTrJZ5q4yp9OwuSYPw3/mJLdqt4TNLKjR4+z8IJ0Fsu76neeKsLvVWOh+hGpTyozFcb5pAsCuclRqqns/AkdG7X+uskkCbYnBPgHV1L1wbzheEA0xrI6uLGNdol/p9d3RsFF+UiNAvcccq9K/BHkCa1E2+55wEV67qhBqlY+4gp0+3Uq2I/tsCeJb3ArWZ86Cd2AXgdVcJC8Og0pQ4VsQ8znFgmJHKZQScjJJSmXK5NT2hjyMw88yKpgY8yfXsfq5ZKPVbY50+AchxQo14yhwQUevNOMapkxbXskitL8e4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:28:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:28:17 +0000
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
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943 platform
Date: Tue, 14 Jan 2025 18:27:20 +0800
Message-Id: <20250114102720.3664667-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
References: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: cf48486c-53b2-4c22-23b0-08dd348628b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LZbEbx5WsVxNOXnCz+WVLBWQe+PYrF6xxYWnjkUxDAAlFAJ3COvIjFuWQ7e4?=
 =?us-ascii?Q?FTRNPKiBSgtRKqeVFsYAbyfg6ui2OVmVXvHj139Q+Jp9/ySwbQdFKL8/qjff?=
 =?us-ascii?Q?ilh1PIQgtAQa8DgZuept8HX2a2CHJfAgHpX6STa2HTw6x4X8gs2I0FY9xhA5?=
 =?us-ascii?Q?8lfg/I+cHNggRWVuI2LJut+EjZ12K8u7KGzBnFrq97fFNcf046YRSxTyzKuy?=
 =?us-ascii?Q?hjKAbVOkrBgcivPXfEaNHF+D3/rbdBORGgFH0UVqdAIdeGuqL4Nf4pRalzdR?=
 =?us-ascii?Q?TBbez3/TiqiWUaaivsOiwZz3z1q+31TAbOZ+kkFUvJuH1yhDZJclfEx41yoV?=
 =?us-ascii?Q?cQuinxFkN8FFawp44pfXA2vQ5B/v3dd44Ua/724JxBpmlkn9+h0gK3QhphC4?=
 =?us-ascii?Q?pLxhAoUZtyv+z/sQBjrmQj2UvC4xE5WB6fzl1al3GSF3FFSu/3n3wGn+sSC0?=
 =?us-ascii?Q?0yWkjGS2ImBJ9g4rXVwKGhffI/q+FpPuQkaR41roiKg05uIZluQdvOVjDzYb?=
 =?us-ascii?Q?QnzOW/zGJ/rCUvjunmaM/rwFchwustZqQoXbzGMj4/i5zu75z6SDzLoQOv8Y?=
 =?us-ascii?Q?MqS9Jm3o9Ee8n0/u+OmJmFkqURfQfGbxIIwZQmpbN9pM1LGTwbOkhQgdsvVE?=
 =?us-ascii?Q?H4Xi1Qa53isgiOVwldUQSxy1Ea1279/3IjwapoqNR6GYvoHJT2sLBtSMXqGC?=
 =?us-ascii?Q?bk2ntp9mVNs15bo+k/sV2ecn+SE6x+YVPK8W+G9PlOn9HYKWb9znb2yumd4v?=
 =?us-ascii?Q?5Zxfoa1uClPBKaf+p4RSKTMAvDyV8BkW6uWDqlpkX9CeUK+LbfsG31g2vDOp?=
 =?us-ascii?Q?xwkc8H7oZF2ZDkedu/kYMRocez+xPcLB6ml+gqCIu8RFnxoLQ3OfbE/nKSrC?=
 =?us-ascii?Q?aufdIlf41Ml+/cPBp8eLwmZVwfx/fOoiVTcRoikVfsJlE7Y70k6xUd4ryn5b?=
 =?us-ascii?Q?Qn14KXSgZgahq8Lj0HYPeBBND55onhZFD5b1B4tbjjQX/1OUTBo1vfFyZzQl?=
 =?us-ascii?Q?7lvEPw/71kzTQMrAsXGZbyZ50xSn7S8z2GmgAIIH4ZOjpeWsGvKJ7A7GevC2?=
 =?us-ascii?Q?Aa8NF3TTsfn2rnA72BcSBZVcruhvXUNkG+6xzvE6oIImyRCUd2FJuW66fK53?=
 =?us-ascii?Q?cAqbCA42Gw6v9DeS0jsE8VFZedoCv99gHBoAMK4P9SiB/L7ptKDqBeryJtgr?=
 =?us-ascii?Q?8QanvCiuzsDutWyZ7d6u/AVVGEXjdbyU8VTJfT0nGWG6/0iaC3dr3unJP8Mh?=
 =?us-ascii?Q?txqK4mF/hApk019LWR+BwEmAua8Dymq5wFndKqPyUp7aXXfShwtm/qtQb6af?=
 =?us-ascii?Q?6ZOoPsGbHFWnhmlWVL1KEeOOjgxBD8UpKF8N630tPaLEThWgOKX6d4f6aPSk?=
 =?us-ascii?Q?zeRLtkNlk99siRxCMtizTA9bN7waVtt2qimDFG7BG29gtzCyexbHYCN4Wvtn?=
 =?us-ascii?Q?qJYs7VsvWNysf18eKdr1MJni4usRIcjiL5sIoBVHpj+j96it+YmVLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UflHiP2mHTRCGPrWBxbEE3OO9qiqEXFSKZP754QS8aIQp6iSIngiygBEVyVA?=
 =?us-ascii?Q?YgzcuH8HCHXp9zie/AKSPzxTWHpT4vYwMwONzST+JilQDPjyGzk0mgYwRRmU?=
 =?us-ascii?Q?ejbRPczyW5/IK9pNd35RfYwBA1uWV1PvDJxaaafr1IJ03eETGh9IMOtIvw8U?=
 =?us-ascii?Q?XTtE6/jvNXzr6o/NFzatXXPaphGuPjXHyri7uEuoJoOMzTLd+UKX9dBpI6g8?=
 =?us-ascii?Q?/cCX7h4fRE1dt0bWvF3GDjqgmoq7BsSxmlceXBqyf/gZNwzXdaMpywZIj1Sp?=
 =?us-ascii?Q?J3IOKZN7x0HM9rO8buivFbzU276HwS67XOkxl+H9QMATEbzv/GYTmUmQRSX4?=
 =?us-ascii?Q?AnQ79+yglmm5LUF7USQIy/ZSlYCl+49KOlafwePXMtLqnXJYdGbpVH0O19Dq?=
 =?us-ascii?Q?eAyKaOJZlJdo9PTGlnj0m0DK+hcS0rGoqgIvbIctxZ+rnFswOlv0P38iFwtM?=
 =?us-ascii?Q?mDmy6LXQ1sts//CfrTEaSOmLepQs/OCLgB6Sv3rtopUC9lBgoysmKk6MN8Pz?=
 =?us-ascii?Q?RSOEODQaVkPuiKlNoL3W//ykCYwW/yBswAt2TzztKN5H4Cj3ee5Gi4lbpZEc?=
 =?us-ascii?Q?VHG1b09cJviBY3onEhn56kxHpr/8iUT7dKfKHvDQ5f7acA52RrnE7w4EVBaD?=
 =?us-ascii?Q?t7nNanx2uvtgUjHGoaASi9vr1duaXCkxfwsaOqD40uoyWWLQRz0G1CAm6Bg8?=
 =?us-ascii?Q?kbvJ6muS1p0EDKPCpG6wHLeVu6fsJUQt487BU73hUwZUiAAtQHJl9TvE3Q3H?=
 =?us-ascii?Q?f4dG0E3XZdO28plkNtDMmMDI3e1loN0QUOqltR8YH2O4OV5r33KaNlNBtya9?=
 =?us-ascii?Q?kiewMQXLPKsZfcf3ubzXouOV/t+iwKDa2b9b45tMGDsQcSGc2TkGgyP3sfme?=
 =?us-ascii?Q?YmBG5dhpeXag4DgsjJZ8ub+ZZvxEpF2Srzumw6htg3TV+HJXYDOInIkFcLR9?=
 =?us-ascii?Q?qotDMUGeuBHqtFrieq8+TmAKt/P8HdHdzCIXfa69as7NLEkhxqqT/5pEWDUQ?=
 =?us-ascii?Q?phZ7PxqJ4ErmIPaewx41TNNmhsLJYkdpMu2tNFU5a4kaPSLs4xphpL8emcRs?=
 =?us-ascii?Q?C6k+lxZThe4YV0om7qrCJ7pN47JC+xS2VKZGkJWZqV/6hqBvbZRxfRxrECy7?=
 =?us-ascii?Q?x2qXGE6pk9lwg588pYiqLjonmvP9hzaFtGZWGbunWlmQC4PAX8l2WqJtKeV8?=
 =?us-ascii?Q?OFBLt7KtIDrq1TMw87+I4WF0UgJYHuiGqtmC38q8Kon7Fuk5ySnpF0p46EqK?=
 =?us-ascii?Q?4lRRzpPwIHCt+9zY980xiECPnzgzmEDKJWjUPXMlauESnU/z0nTofe+s3/zE?=
 =?us-ascii?Q?xLQEfRsnnB2W+WbDeYYHrmx90uwdpPoM91T8v56Rr3+iRVifLfVJa4054NVx?=
 =?us-ascii?Q?A3U4H7RGxef/pfdNw0Xmo0pHA5r9fX18btR3OBb4ks+RCVMTkQ3S2PgN5vND?=
 =?us-ascii?Q?fOyyrd6OGxFkmTJ8gYUoNsGzfzvkRmc/Dh3byF/W29pPiWtKmLtsD5yI22yH?=
 =?us-ascii?Q?CaT5THWd+71ii3legUnJFcPHM/47/TeBDyHbyW6nTIjXY9V/gecGlIy551LR?=
 =?us-ascii?Q?MSIKOU2Jm6RqkCE7Whhflg74zzQePObChFCYH20F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf48486c-53b2-4c22-23b0-08dd348628b9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:28:17.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD4fTW0UsyGPhGaQ++LeuTajtJAz1AbP1NUm/ZTM0H5y2K/yvTDlhVPtY7ubAcApkzbHg4k2WaRCcDkGoHqVvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add compatible string "fsl,imx943-micfil" for i.MX943 platform.
The definition of register map and some register bit map is
different on the i.MX943 platform.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index c1e9803fc113..c47b7a097490 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -25,6 +25,7 @@ properties:
           - fsl,imx8mm-micfil
           - fsl,imx8mp-micfil
           - fsl,imx93-micfil
+          - fsl,imx943-micfil
 
   reg:
     maxItems: 1
-- 
2.34.1


