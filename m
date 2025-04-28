Return-Path: <linuxppc-dev+bounces-8095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D189A9EEC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLWH2W2rz30T0;
	Mon, 28 Apr 2025 21:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745839019;
	cv=pass; b=Ft3iYxVChyIsL0P5haNiX5WkSwKMdBZGRGAVeXTwZzJF66spA2xOCGlNRqeV1ybbjhcOXGoAbTM0pih8SZawB4YghMuEvcxYrz0h/N86wQns+v+U3tqqlEqfd77hGGFgxxZDlpaLGAMPpDmwX0ezQKnMY1x/MQF2nNqK+ppjK3InnM/+FwCGrwA93kr0EHtJQ/3AuHnApWaX8/F7chOGvUT/aRtbnI5otIbpiI/wz839QYkB8hDxnrhKFTAcveTcsz1VkI7pTwrI/9FXkyrBGXmyzVAI9cK9b5Jp2by1k8zwT/KJZh913n9ISxOhqKZF2eVayBoMBLSuBuX6alsfIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745839019; c=relaxed/relaxed;
	bh=RFJ9qEM/Hwl18iJPH1zXM91Ea0Y4BqoYNGLcx2XJUGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TLR/9ZDGteTxjQfO84aQgZUzX5JuAYqeUQdBZJIZp4KtgGpdFLxiG9JQC7NQoIb+z1p7dmSLEiaanfDYe6Ugw0EMRNkKtqyxUkkeLfB7bDMrOMmTHkvZXtucJH4sBgCN1nZpa+DaUxNgDkCBWRLQy0GkHTUMIarn13ZQIfbasYMV/dYzk+/ZHmA5p3xeywDqGwJIA3y7QMhWlC9brEvCg+5q0jC1jXSeRWkGFUK4CWK125Z3k9DhoW0934GOO4jSbBeT56xmPFbNDdb6SXWfQEHOtqrMv6U1CB7YSvzdc53haBlWRbYEPXGAEwdNl2Ov8DRZhYTwRuvrtbW9YPsFCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ELqQbPgG; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ELqQbPgG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLWG4tFQz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlM+qCGkgjnAjGhdY03W9E2BFbDZemiD+FyQdYB428cfHl5b/D40sIBf+pxSZS7W6ijlNTDBvzqHSHdzBEaoF2JXke2Adz9cF/fOBBVEPN+jZXPJrLbuDiFdDSf6JBVPXFT1zDV1IYavxHnB9mv0qBzAL3qHhGYt8MbOeLp8eOVreK5LR76me/skGwYZ76xT8UeNheqdSdpTD1j2ecO98PuxYliIrmNguA/T7tsO445ckwmQJf/TfaCx6dauPp9lhDBdFGdE7UNzmqFZAxq4XAJ1TEx2k1zxK+R4DFC19339PmHhSWnIXD2tqUcPV4hqKWi011zj7OC8fmDpNNIQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFJ9qEM/Hwl18iJPH1zXM91Ea0Y4BqoYNGLcx2XJUGY=;
 b=OUHZA1LfS916hIPgN12P3BZ+Q0MJeCiA7W2Y+zAbF4g1QxIaQFPyaU2KpjosDH7oe8M6dxGmSuNXrCC9mlx6IjGrKzVi+ZHyAknDgfNd3mVhovG3LGrGNYVnaepS8lPT92vahPwXUlDB/wHV+ZymdVQfKxhLGbBZCwzi+Fgy33VCpkBxTFHQDnBmj/tVgd9IFx19T+nJcK5EiFQhiMnL/1Cpt5vOzvFF0b/OrRuVuBgxlWIe9E3v84SaSH5TXh+s/33QSGWHLoP+eNM6ASsW2sT8D2jRGQBNGD0ZDY6PMDwswFVEbigMkKVKO3+xDAD29mKJv55dTKWmpqxXwJ+9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFJ9qEM/Hwl18iJPH1zXM91Ea0Y4BqoYNGLcx2XJUGY=;
 b=ELqQbPgGBUZTJfUbVr5Qz52yBWqV7N4DyJCem7KXLgWx9IgULmMR+vpEJ7Qt5hECM90B1AE3BsrutQf4Pm2t4aVeuLZCubzPLmFCwgGayNbH/TATRj2vxIRKaqAgxj+s8QGvOuy//WUpKl8n8VAWQbK3QekQkyyAXe25kVd1Vx+1ArVDbSbzS6HkkQYFjWCeKXZkEmge9BLn/MDbr3bfXMnb53U1GD84mw9g2PZuEQscpPXtaH7a+bl9wMiISiJgidqs+YH86AlK6XbsjoHYbunhvqflYW6/BbAOkkp99CXjOYOW5f36BDOmCEtAdno4ZmSf06LI5vIIWwqap5xX1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:53 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:53 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 12/14] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
Date: Mon, 28 Apr 2025 18:56:55 +0800
Message-Id: <20250428105657.3283130-13-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5b7dd6-522c-49d6-3a70-08dd86462dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L9MHsXXk9iB8YWanCukNIxtr9inxua68cEr0dUTaBqZJaquG84PUJF3SPrvc?=
 =?us-ascii?Q?jJB+cbWaGJfHwR29O1IsAlv3XxfNgc4dsP4VTg3SU4Eh/ZDKNCcU8Pqw/tgv?=
 =?us-ascii?Q?Z/2uHk44talSXYDTcuOG5xTOZvvFQyBEQAyeY28ormUjE3Xly76fFc1RN37z?=
 =?us-ascii?Q?b9D7eIP/1Dpf7XcsunqXtrKslXcGTw1Ry2a8AcvYBRJHPS0+hzM68Sdr+21m?=
 =?us-ascii?Q?S7tQFsLaIyPryU9vLb7tf5hpsJvIFYdpPQwKKxkWPSmnC56m8i4vQYEdYK29?=
 =?us-ascii?Q?B83d07n+BMxSI0ZvpLkhbI4HYFatVgMh0VYxoS8Z+e1PBr5mdotrMtrQKEo9?=
 =?us-ascii?Q?02rVQHWIU5Hrq7CnQMwPDTCerTy/cyFbhuVDKbh+3fIFGaobWyvFfMJNsiMh?=
 =?us-ascii?Q?vKN6/Sy2dGwEfz2+8LAQoRBANI/1NpBeNZBWQTUgQYrvPNhddCOufoof5HZM?=
 =?us-ascii?Q?1XzkmWgdamOpnu+Tl+WUh+tU0FE2meqIWt80k0GNIaRNtQhr4uuhy2zMjfKl?=
 =?us-ascii?Q?aZLxnSITf15b0xo5/loRAvJT64hS3+0RqqNp53iTiN4iqZL9+10XHQunb1Co?=
 =?us-ascii?Q?+rb3uDZ57nZfXMCc8Bqg4yvWFua/ABW6mgd+tQDMrSRzvktYfwR56wI6szpL?=
 =?us-ascii?Q?0xuohfC5vK6zdaaXnsE7haII9U/WlNuQVoUOOplDgL/8niHrCaq7ukQi4jf9?=
 =?us-ascii?Q?8P3H6BFg+sObzvZqTigep2bncRXvSmpjaZq8znRRgjBIXpPMTAnoI/Jg7b0h?=
 =?us-ascii?Q?BNaziB8ph1AwJAVIxe3slU9MsjDommFXhBuY+8pHoT3gbUpfyCs4OACY/orV?=
 =?us-ascii?Q?NUcIdBLd7C8o/us/GlHdfSSNf+Z/bEm9SGpT3fBGcCSpHcsqfClEhhMzbBs7?=
 =?us-ascii?Q?T98Xyzi8ir9GIm2D2uxgkatzcx/TFk4UZKaRz6YxITh6H/uoGtqTuZhXC/U8?=
 =?us-ascii?Q?IJm4VbCwMy8SJQow+lfPHGhvn8sUoyughgWXJ9B2vYOX05fvgKoXd4FPXxTj?=
 =?us-ascii?Q?IA0husV8ltoQdpIqezFROeqlJd5fwQ7kAkqWujrgk607ghhXL9eUM+2GLDq7?=
 =?us-ascii?Q?EwWGr6DHn36RgwfEvEvE6w8gfe2IkC0jkXm4Go0hZPLho2PxkCd7kMKYqbfq?=
 =?us-ascii?Q?xzcoHNsfLCtUjGEUre4XcQhYekMXz5z+8Do0Wl2cywX4Hj8SoQSMLyWEzHwU?=
 =?us-ascii?Q?7HbQ3JFsY44TtIRRsb+GlUchOigLk+m1A1Vy37JOOEV13UyoFQ2YRbVpJ/WL?=
 =?us-ascii?Q?5JAtLxmJvN/jmyTt0eESL4kl72GPwJMtjBzvO4Ij1ziE9kuKImwavgDG/UHH?=
 =?us-ascii?Q?nmmE8xVrM87VoHLckFxMjdcqAcjea7Hw/wzHlBGlHx2NS8WthgYon1eTtL8U?=
 =?us-ascii?Q?mqhHVTKkm3NVxjWmKvefUQQhSkw0ztGDCuuwqZ5GlWHhQxDtqpRLL/qKViJW?=
 =?us-ascii?Q?r7woDEXOrOrjnbyHP9oGNGss+LWPdnHXq3KRGM5rHD5QdGg12vG8fA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLzRLHqKVt4V0xDM5O2j3Bg6LDMTSO4yYbS8ZT7tu4K5qFfNr+1E0x87hP85?=
 =?us-ascii?Q?Wvk1ZFOOeCYphjm+Y3190CajSUjtNb1ViU0OPQF3BxI58lKL+hDSbjiy6hoj?=
 =?us-ascii?Q?k8T4VkI0Dho2j/VBAWxByp43daHMotArZt88SSlHhrGm+QEjkpLlIO3OBtbU?=
 =?us-ascii?Q?9r9Cwl58ZEwfBZ78VrQHOoR4y+pzX97sw8THhuK7cIUNKBiu1UzN8oeNyr2l?=
 =?us-ascii?Q?A+/0upw370HEiQMUcR0XTYapu3Oye4nIgorWSqQdqPFKkLZMFrdg7SL2nbA6?=
 =?us-ascii?Q?YOg7gPNELK00QSSUSJnSxznH67K8qFJ8sworSvtpsfRk6bRbSxfaEIdFlxcf?=
 =?us-ascii?Q?UQAPJSp5hZvURSUYFTvq88M/QW0xdSdsI4yHz7kBfamdklWI7AkwXwvus+Bb?=
 =?us-ascii?Q?kvr81c5q/A1Uw1W/FgjbV91aD3fizQfUnlj5FzBSrLDAeJn8NXmGvyfsvr4i?=
 =?us-ascii?Q?TvWZF/w0nzYK8+Rxe9J2loLjea2AM0rQfKRkrqlz1RznBKzrvmrGv3rd5JlL?=
 =?us-ascii?Q?3ElXrYE8lOI4gVov1lkdS3FDQlSXGIe4PtvpeQ+8im+1JR14OfWdHmIZvrZh?=
 =?us-ascii?Q?J3jeKRrHJaCLZhwxxe/47+6ELE3qIykiqT8Su6cyQ02Hg63htGu8+Ky2oc2o?=
 =?us-ascii?Q?zRuvW6Lg2/caO3tPKlKikfJnnrPERAW73x8WoHmagCtGGyS/19CynYpndsWm?=
 =?us-ascii?Q?3Y0OQlXPvRRvIBiOp+zt4by/g+mZk8BoGftU9pkUEFd28tiDlozfcb3tuL0Y?=
 =?us-ascii?Q?0htCtXHFgjE1NDNhrmkFcwMFc1/a3O6ldQzyirEhUl7NBgUaxhzwC8Uc6R4n?=
 =?us-ascii?Q?F5eUHLvU/LZuQCssuqExzG7fe+/P3Vn8I+QQa3Up2ead0ByBlEtp4vQLB69s?=
 =?us-ascii?Q?9RlFFWF9fD7KYehTelmmaKvZzTGW32sR/IlLLHLEhJ6SvyOk87krSG+whw4G?=
 =?us-ascii?Q?AX8zzmfyh4xcUAZj0H9udRYSWunPfqKVarJZlkHt2Mks68v7QEAsKJJrYL2E?=
 =?us-ascii?Q?CFD6+BldFsMNWMSXVjkxIrL8zeB2n5p0x1sKz9LQTw1SXz9hKJoMscWAbyY2?=
 =?us-ascii?Q?zy3eItuN9SSHUcR4y9NUyAI3Y2ARYCvmdUf2XnmpQgk2EqQsfjdpL/ApNSZv?=
 =?us-ascii?Q?ObcMaBecUG++5U9w6I7b6kOfLUvT4y38+lRQLn86CCI5onka+pKdYjIP2luo?=
 =?us-ascii?Q?gekPCJdtOHxJfx38lKB2RvSQDRV0zjWFJa/d7qBjRp6YVHJiWORnf8xWvAnv?=
 =?us-ascii?Q?yDC9YaqRTdWT+GUwSdhdF/XZCPzZPdv42CO1aJ6ux+7jf6cqBs7Csv17Yk3N?=
 =?us-ascii?Q?G57pUNHKDwLaNf1fnjnP03uKy6Qg0e6Z4PGcCs3Yyo0CWWSgmsC4x4z01FES?=
 =?us-ascii?Q?3aLrzp33LcIRY+3rs2XV97P9EZpdtxcTnCnX17pS6Zs+PMv+TydBkIaCyaee?=
 =?us-ascii?Q?miuG/WryPdqddfIpykkgqoE8MR8uFhzLkrUVON29b8zrCzSXg5AvP1GqDxUp?=
 =?us-ascii?Q?2vTzwfP5eYiyGqWye3LMKZFH05AmjDWhYNETGKL3dT6BoVyHquGtM5mlSOQU?=
 =?us-ascii?Q?O6/m5g0k8HaKZeuN3xbn0h0Ro8g4bl9C4ysptI7I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5b7dd6-522c-49d6-3a70-08dd86462dbb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:53.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ninRQ3PtO/2hHmpIXrjZfDTHYJF6Xr6HngoIkK8hWsnGBpnAHxpr8hb6pae+F4xbbnbNSoI3vZpZ6yQKmlJcsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The VLAN hash filters of ENETC v1 and v4 are basically the same, the only
difference is that the offset of the VLAN hash filter registers has been
changed in ENETC v4. So some functions like enetc_vlan_rx_add_vid() and
enetc_vlan_rx_del_vid() only need to be slightly modified to be reused
by ENETC v4. Currently, we just move these functions from enetc_pf.c to
enetc_pf_common.c. Appropriate modifications will be made for ENETC4 in
a subsequent patch.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes
Remove set_si_vlan_hash_filter() hook
v6: no changes
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 57 ------------------
 .../freescale/enetc/enetc_pf_common.c         | 60 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  2 +
 3 files changed, 62 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index ae2dbd159ab4..6560bdbff287 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -216,63 +216,6 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	enetc_port_wr(hw, ENETC_PSIPMR, psipmr);
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
-{
-	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
-	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
-}
-
-static int enetc_vid_hash_idx(unsigned int vid)
-{
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
-{
-	int i;
-
-	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-		int hidx = enetc_vid_hash_idx(i);
-
-		__set_bit(hidx, pf->vlan_ht_filter);
-	}
-}
-
-static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	int idx;
-
-	__set_bit(vid, pf->active_vlans);
-
-	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-
-	return 0;
-}
-
-static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-
-	__clear_bit(vid, pf->active_vlans);
-	enetc_refresh_vlan_ht_filter(pf);
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-
-	return 0;
-}
-
 static void enetc_set_loopback(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a751862a70b1..ed8afd174c9e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -353,5 +353,65 @@ void enetc_set_default_rss_key(struct enetc_pf *pf)
 }
 EXPORT_SYMBOL_GPL(enetc_set_default_rss_key);
 
+static int enetc_vid_hash_idx(unsigned int vid)
+{
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
+
+	return res;
+}
+
+static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
+{
+	int i;
+
+	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
+
+		__set_bit(hidx, pf->vlan_ht_filter);
+	}
+}
+
+static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
+				     unsigned long hash)
+{
+	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
+}
+
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	int idx;
+
+	__set_bit(vid, pf->active_vlans);
+
+	idx = enetc_vid_hash_idx(vid);
+	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_add_vid);
+
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+
+	if (__test_and_clear_bit(vid, pf->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(pf);
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_del_vid);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index e07cf3c35001..96d4840a3107 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -13,6 +13,8 @@ int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
 void enetc_set_default_rss_key(struct enetc_pf *pf);
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid);
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


