Return-Path: <linuxppc-dev+bounces-14499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85635C887C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 08:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGWpZ5Wm7z30V3;
	Wed, 26 Nov 2025 18:46:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764143190;
	cv=pass; b=XTAJpa3cOyWJiWndfs/nlvQD63bepuQPaZdl5m44xK4GArDa7+SLbMX/BvQpV01Qe0z18z8OnxKnYetoTpSVwctclJwuUgIg0AVI9KXfTip8bRKksoDBp0nV0ES28ij76p0tYd1haetuPBtgYKwPtVy730cMwXP4nI4TKbW5y7aT4ghycEFyC0ZyBJUdc3VH0L+F+ytUSiXZzsfjGckn42XhsHNUoG/CENFk2+p7iacXWwcPo5pcCcNisP++dbQmBhutBwQS9rVS8+naVwIw7vVB497v+kIXOwF0ksOWreEROYJaOVC2zRcfeKAdNHzbY4H9i3ech5V8oLeUkPgzQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764143190; c=relaxed/relaxed;
	bh=LJM35NdppYpnLFbHieooYOAZyucwdewO5rQO4CyGf94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKaoYl5AZZex4BQDnaIW/xvlPbBRd4AyG4Vr/50lid2/nGr/svwTwELbNMEfrpLdBCwEtQv5KV1wWHOToNzIojeEdCSnL1sWwEBB94gmQIjBESGSKUp9rbRMfxLhBlf/DGrDqJFnjLm0vaJYtE5a/VcXXGrNKj8916482ObfJiDyiPMmaCq6lZcfihRg4IRs6lk7iebGPKBY9goZz15qX3oT99Ir6YbH+vfg7WZbJt/beRo+bLzcC3TOiXaUQtZrP2SDR9RYnUYu58FmBfgrqI05PKqoXj6DUKNgbSBna5Ts4PubugFlpZcfw22RtGxAVRo0RgpopGJaveDsMsJa4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bHZPmyV3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bHZPmyV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGWpY37Xrz30HQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 18:46:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjQnqIz/McgD1mvaL9F3kuhxoMhjXf9pMZIfXP6RPZBm1fJWPmlM7Ha22FaXmF4OtUC8ivfVONIWQ8ZVeGwtvB9ZJySb80S8EQLAHiGnPU605nfqkyAJawQpwmh+zPFNovJU5uDR7Ze20ftUkw+wb9e4uYrhw31SFHzquK6mUDTfkAVHtwvhyD+sWpd/IzjGawGpq0X73lY1JOiF2I2yyRUSWma78QjrJgxj6UKAPaZDJDIKGE+zFGMI7r13FcNUFKSkOnA9y1KNkrzZuO5g3t97j632t8lURgFvSdk0qKrJ75Ec/rovGL4vOLvzH2GaySpIbWFqCubVTejj2cJAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJM35NdppYpnLFbHieooYOAZyucwdewO5rQO4CyGf94=;
 b=Fcf2sw4bsuYknmbE0jk6sESiZEyxGtaEfTnhwAmcAjHErLdI6vOo6oi/G6Nf2b9agivRxCJyGHGYhItiC7jfEyLRSCmcD402cX5Hjdy3VkJlUWvdz0lclXbtGolcQkS71RuLV3hXJ5PM3p7CgB+XRaEJeO6jY3ElJ3k5woFLRNLqLMoKjfQjVmSd28RDd/APVf/iNTN2Bqm9qvI/K8x1XkWOj3LCwUGM7OoANzj6HjK+MoBOLs+yIxY9TRmAG45Bwr0FjaETTHDgU6DmdihLa5acCn8fulKl17PT/TmtOQwKJpkLvlYmVrKRmejFZWL1S6t8Ob9iaP+kgZdO/7Jmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJM35NdppYpnLFbHieooYOAZyucwdewO5rQO4CyGf94=;
 b=bHZPmyV3UjWmCBBTjID7AcPbQbPux7LSiuCjJwwPErGDuvAsvBsC7pnj4NKDau+EAQsJq+o+sLzQnn7jshT+G6purO2GgI2c1AzDWng7uGwvh6S/844pK48neuJ3vsk6AoKExmAealVRcnu7KYQw6LYsA6I8KhmI6X+WCXto+glzOjr+AfbHJ14Kpa0NWaPaPeLkK/3EIWK9Pa1NUk8A6oujyKhWzMpkBMp7NRUjVR4E5SmHdHa5dPTxy8bUcliW9PdOnUbfwQ2YOYw3xBxaZlg2Y68Uj64mld76U2CGzCZ+bi2PCYv4x6KtCgVQZYvkR7XCszBVzNBKbo4Vbx2+fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 07:46:03 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 07:46:03 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_micfil: Set channel range control
Date: Wed, 26 Nov 2025 16:45:20 +0900
Message-ID: <20251126074520.2959154-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251126074520.2959154-1-chancel.liu@nxp.com>
References: <20251126074520.2959154-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::21) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee17222-40b1-4d00-82c4-08de2cbfd979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ZwvryukW8M2WlVN20bDMt8euoqOh2NvC/t18Hsy+856bGfZxjx85mgHXruh?=
 =?us-ascii?Q?uYP0kvirkBN42zMP0Wd1sQ9J0zf8B4F9dWC8CD/EEGAyyw+KYDrUcDdugh84?=
 =?us-ascii?Q?xlJns7EHijqjJ+dzHBnYfgTMuL49Uetfpi+MRKEt+vQlpag3uokBTbHbQpVI?=
 =?us-ascii?Q?p5HLs23FthM2ljU97QzkizchCg2xycHiOAjdO3RfVqT/ZcgvYk4taV4jPMnx?=
 =?us-ascii?Q?WMkSAs09PBfup+VN27fIugfqVTELPNDsfOEvWq2RMer385JJE9KptMVeIrV6?=
 =?us-ascii?Q?LpE20tslCdFGVnuYmlXqPoIhGA+U6iYJBrzj/OrdXn1EhPnGZ5WH3cm9/5A1?=
 =?us-ascii?Q?ZQCBr0rntuag5mAgjJ5Db0CtELkZKCtlJtOUd0BlehgccftUcedTcUw3sDn0?=
 =?us-ascii?Q?uUn6Xif5gymHENJhERpCJ3dXZRnnX+cjINY55w+OBPTcUQm4WGNdSMQBjmsE?=
 =?us-ascii?Q?mkGKL+2pZ+LyN+CcxeHn0ly5k1MEPbex3S2/gkNYHJ/gFkMJe4uNElBcsBjx?=
 =?us-ascii?Q?ax5A0e3zzK7eg09iGrqgp1uka9liHjpvv9Ee0OOgtmiQuJt1Ykrrmue3USWZ?=
 =?us-ascii?Q?uVXlmv7uM6SXVJukzg00hftKO42pE2dPFQ26vZkElg8z4fzgEri4Oo4g6o1R?=
 =?us-ascii?Q?hLWBZykJBAJEDhVd/Cmcqc9e0FPBYqdSiaDLrlrrr6lrYmRJqqv2G6EipNTX?=
 =?us-ascii?Q?oRP8Pi4tpyA1TmVD0UDGDKmF+w1R0yJZb4ll7J+ZtDXFQGPFmcFEtZzHlPpE?=
 =?us-ascii?Q?+T03PyT5matNcTIfe+Nk3JOB9OQbSClasqLyR6HEbEDIbK/FFKVH9qlhCinZ?=
 =?us-ascii?Q?4JdLBhcz7L0R72vZgzO+psj6v+gv6YoORWDO0fo7uIRVXwlr56bvKAjDefGj?=
 =?us-ascii?Q?Mh4BC2NLipaVCcQTDlVITn83yLco8V/ArgYltdmT9gB/EXRc0O+8OK5zq2Yq?=
 =?us-ascii?Q?p2CTMHp4vbV+CLglLl5NqbuqfalgLuM1C8ZJUFRYqmQMzbwwmZeKJzpRNAgV?=
 =?us-ascii?Q?pCMQjkAIJFXfULZO2iviMKtATYrfk8h7D1pVYRt5Mm5CiPSBOIzbQv0mOUH9?=
 =?us-ascii?Q?UKW8aUL10pqb9qUSQ4/Dz5mFlApvoChqa2Q2mzz+dgRr/J+VI6J8XaWzvOrV?=
 =?us-ascii?Q?yDMEshXCY3/gd9HoTqLZVUJyI2znN4McW3bxL+Izs0OlhZQgh5C1qv+XxtSS?=
 =?us-ascii?Q?VXuWjq8ANNqnO8vMIogIgBY4Pm6NdE/KrBpMppd3/icIVYh15/sL4jnIbhhP?=
 =?us-ascii?Q?NWnmRBVCFHEFSVI8tM0tN6dHktoPuMwTMQeRTutXisizU9YMVr+JHqU4LyL6?=
 =?us-ascii?Q?n3DioyI+9b69FXT0kJq/n1kpdKYTqYQ0TZScEKF6lNNA5WiDndXVo7LdL3DU?=
 =?us-ascii?Q?0g44i2OkRaUte2IFkOGZkvn/K198tePOhgi0Is/5SomYcmWQOUNLZQUBOXs6?=
 =?us-ascii?Q?nNx4h3LtISpgKy6VnScTmx+Qkeb53HEKMKj5i11hxyDrbWYviIxoinEcD5G0?=
 =?us-ascii?Q?V1YFyWVsNSYVodIK/7A6wDOQgxuklqmYaT5gwnM2NcWaGv93mBhaiOl83g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wzoU6pRMAG7zneiGCKSx0BrFF3SJKzN9gO2QRRxyBQ4PuUzHy6f4vwRR4ach?=
 =?us-ascii?Q?4Bn/WlOUxHIY7jrzM+PLKdSh0id3mxbZLHxspwbnraAeql8rlR5Qnzqfln0h?=
 =?us-ascii?Q?eVZJtVPusDk3SKDK+sEr1PBZVkMsSM+5qhUNpaG+NdBvS2M67O8ip6B7k2Fz?=
 =?us-ascii?Q?O4tMG/RR4NYr8ULCOdaTjicvrNP8XIfjx+6DEYge1LovYdHItBcyPs4NgzV6?=
 =?us-ascii?Q?3Jr+iAy0LnvNmsitgp2of+iSgkujr6XXguw0vwz8Fm4+mYf+qa8eS2Lk2+17?=
 =?us-ascii?Q?Cd46i8BwClZ/uXbmw0WaDHVYJ7/7YU9G30d4wcFf/vtu8DidSYqlwS665jOS?=
 =?us-ascii?Q?1YwIAdtCuF98LX/x8a3Mqm/6oMyctUHDtkAMdPvitNyrDbRPXDC84CjStFic?=
 =?us-ascii?Q?4F8BpPq7SaXfcdcTtWZvAZWnqPPvQ5L53JtiFOAsmTKz4w+9ZFBLLPDCNbmK?=
 =?us-ascii?Q?UJ30pzzWRgGUhaoOyBHWRsRF7jzBOCjyf45aB9PPc5uFkCoKbDJJFqQJ8Wpu?=
 =?us-ascii?Q?RkEuBa+m1ixQ8+NQ+2qNCVKtzigqgFBsFE9+IMK9tPSgbO81SJQJlk7xwull?=
 =?us-ascii?Q?IuGr3u6WjGXwRygLr8GYYSHACJuZ+zS3gzwQFv8FIvJmnDkJXPcnseZLOUae?=
 =?us-ascii?Q?79VF+r4yBmc5anrXnxRdufcgRDu8uLdGdJGxv+uOZVnZoRe5/xSXVoZjDeyZ?=
 =?us-ascii?Q?LI/PRknLVtNQGDRUssooFVNSUu2XCQVhpzqrMeck37lYYlRsTgRKBb0xyQg4?=
 =?us-ascii?Q?a0tdarroVn/qZTQZMcSi+66L9fK/m2GB4JZLRtKIDpzvrL3PXNiEDLy7+02i?=
 =?us-ascii?Q?6SSLTNwZ7uq/wrgdi/C16uu+sX3l1NW08m2i2XdPpWRotZPRUA4V4Vaf8Pu5?=
 =?us-ascii?Q?hwlvxajp1uzw+HT4XM/pWeLdMKyyvnRiC+o8wh6N9DMHbCEyG0rl8lelhyAJ?=
 =?us-ascii?Q?v/oRmp43xxaVCf7hVxdqORSLetndjd/3sKL99iiY33ZPmgnspEE+EpHDCgJn?=
 =?us-ascii?Q?/wKHPYbZ3PhyY8gkGhZVqo7Y/XilZG7yVCBBIj8LjiIoTvnPwALUmbobA0LD?=
 =?us-ascii?Q?POstEjWSkOMchPdpQRebTSvSXov4TIF9tIPxHz98vjARzBbUZHx92z2jIsA/?=
 =?us-ascii?Q?ZgavnFjPBy+EABDhBIRGIdGb+N3y17vJoK/2WRJWLNg83UCYhCoWApHTsjJs?=
 =?us-ascii?Q?RDlboqhXUheHWHeIDQFJV63pmApya5q0nUWfPgxay5DvIBykndLtv0yQazDk?=
 =?us-ascii?Q?4YtO4OinHCRsLg2+KZFL02XCfPamb4Qrt+4FRcFzweCjII4xkInJVIjb7pwA?=
 =?us-ascii?Q?i9Q00WEV6p+0q8m4g9gv2b/2htDgsykp8FaMwDuaDJZKRGQMSA0LOsSG4X5V?=
 =?us-ascii?Q?F5BETEZiI3e8YroSGBzqg1G871HV65UWd0SnIP5rNvxpRHJ4TC8K9GgFCjKv?=
 =?us-ascii?Q?eyT9VKFl63z7Lt/n1AmTT2hiogQ9UcAt0xLiquIh8ZiNvNu8pjWtSwK1phGl?=
 =?us-ascii?Q?XfJRMZVq5EW78OD7J68TBCWvt/4RfkYBfRz2aKmm68Y26X0p8YXzNfpH59bC?=
 =?us-ascii?Q?wHKGWF31rXblQE4Ka/NdTv8kAnoCfqXdpl9cmfrw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee17222-40b1-4d00-82c4-08de2cbfd979
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 07:46:03.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KS4zshcpN9OYDfIR7+3AJu/Qz5DY+ZT0DWY3XwipPRGN0pm6HpmOOA01+mfH7OpGnSIN/40AD0L2zCaweqtnXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The range control register can't directly adjust volume gain according
to specification. It's the dynamic range of the CIC filter. The range
value should meet some conditions otherwise the channel data is not
reliable. Add an array in soc data to store const value in formula
with which range with all quality on different platforms can be
calculated. If the value set to range control exceeds the max range
there'll be warning logs.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 125 ++++++++++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 86678fee7a57..76ce61887b66 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -17,6 +17,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/dma/imx-dma.h>
+#include <linux/log2.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -93,6 +94,8 @@ struct fsl_micfil_soc_data {
 	u64  formats;
 	int  fifo_offset;
 	enum quality default_quality;
+	/* stores const value in formula to calculate range */
+	int rangeadj_const[3][2];
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -115,6 +118,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.volume_sx = false,
 	.fifo_offset = 0,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{27, 7}, {27, 7}, {26, 7}},
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
@@ -128,6 +132,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.volume_sx = false,
 	.fifo_offset = 0,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{30, 6}, {30, 6}, {29, 6}},
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
@@ -141,6 +146,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
 	.volume_sx = false,
 	.fifo_offset = -4,
 	.default_quality = QUALITY_MEDIUM,
+	.rangeadj_const = {{34, 6}, {34, 6}, {33, 6}},
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -167,9 +173,69 @@ static const struct soc_enum fsl_micfil_quality_enum =
 
 static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
 
+static int micfil_get_max_range(struct fsl_micfil *micfil)
+{
+	int max_range;
+
+	switch (micfil->quality) {
+	case QUALITY_HIGH:
+	case QUALITY_VLOW0:
+		max_range = micfil->soc->rangeadj_const[0][0] - micfil->soc->rangeadj_const[0][1] *
+			    ilog2(2 * MICFIL_OSR_DEFAULT);
+		break;
+	case QUALITY_MEDIUM:
+	case QUALITY_VLOW1:
+		max_range = micfil->soc->rangeadj_const[1][0] - micfil->soc->rangeadj_const[1][1] *
+			    ilog2(MICFIL_OSR_DEFAULT);
+		break;
+	case QUALITY_LOW:
+	case QUALITY_VLOW2:
+		max_range = micfil->soc->rangeadj_const[2][0] - micfil->soc->rangeadj_const[2][1] *
+			    ilog2(MICFIL_OSR_DEFAULT);
+		break;
+	default:
+		return 0;
+	}
+	max_range = max_range < 0 ? 0 : max_range;
+
+	return max_range;
+}
+
+static int micfil_range_set(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int shift = mc->shift;
+	int max_range, new_range;
+
+	new_range = ucontrol->value.integer.value[0];
+	max_range = micfil_get_max_range(micfil);
+	if (new_range > max_range)
+		dev_warn(&micfil->pdev->dev, "range makes channel %d data unreliable\n", shift / 4);
+
+	regmap_update_bits(micfil->regmap, REG_MICFIL_OUT_CTRL, 0xF << shift, new_range << shift);
+
+	return 0;
+}
+
 static int micfil_set_quality(struct fsl_micfil *micfil)
 {
-	u32 qsel;
+	int range, max_range;
+	u32 qsel, val;
+	int i;
+
+	if (!micfil->soc->volume_sx) {
+		regmap_read(micfil->regmap, REG_MICFIL_OUT_CTRL, &val);
+		max_range = micfil_get_max_range(micfil);
+		for (i = 0; i < micfil->soc->fifos; i++) {
+			range = (val >> MICFIL_OUTGAIN_CHX_SHIFT(i)) & 0xF;
+			if (range > max_range)
+				dev_warn(&micfil->pdev->dev, "please reset channel %d range\n", i);
+		}
+	}
 
 	switch (micfil->quality) {
 	case QUALITY_HIGH:
@@ -367,23 +433,31 @@ static int hwvad_detected(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const struct snd_kcontrol_new fsl_micfil_volume_controls[] = {
-	SOC_SINGLE_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0, gain_tlv),
-	SOC_SINGLE_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
-		       MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0, gain_tlv),
+static const struct snd_kcontrol_new fsl_micfil_range_controls[] = {
+	SOC_SINGLE_EXT("CH0 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH1 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH2 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH3 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH4 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH5 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH6 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
+	SOC_SINGLE_EXT("CH7 Range", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0,
+		       snd_soc_get_volsw, micfil_range_set),
 };
 
 static const struct snd_kcontrol_new fsl_micfil_volume_sx_controls[] = {
@@ -895,13 +969,20 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
 	struct device *dev = cpu_dai->dev;
 	unsigned int val = 0;
-	int ret, i;
+	int ret, i, max_range;
 
 	micfil->quality = micfil->soc->default_quality;
 	micfil->card = cpu_dai->component->card;
 
 	/* set default gain to 2 */
-	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
+	if (micfil->soc->volume_sx) {
+		regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
+	} else {
+		max_range = micfil_get_max_range(micfil);
+		for (i = 1; i < micfil->soc->fifos; i++)
+			max_range |= max_range << 4;
+		regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, max_range);
+	}
 
 	/* set DC Remover in bypass mode*/
 	for (i = 0; i < MICFIL_OUTPUT_CHANNELS; i++)
@@ -935,8 +1016,8 @@ static int fsl_micfil_component_probe(struct snd_soc_component *component)
 		snd_soc_add_component_controls(component, fsl_micfil_volume_sx_controls,
 					       ARRAY_SIZE(fsl_micfil_volume_sx_controls));
 	else
-		snd_soc_add_component_controls(component, fsl_micfil_volume_controls,
-					       ARRAY_SIZE(fsl_micfil_volume_controls));
+		snd_soc_add_component_controls(component, fsl_micfil_range_controls,
+					       ARRAY_SIZE(fsl_micfil_range_controls));
 
 	return 0;
 }
-- 
2.50.1


