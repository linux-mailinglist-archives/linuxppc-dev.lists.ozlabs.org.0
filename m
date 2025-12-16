Return-Path: <linuxppc-dev+bounces-14807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82055CC3264
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 14:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVyH14qpjz2yDY;
	Wed, 17 Dec 2025 00:20:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.162.67 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765891245;
	cv=pass; b=EjDTmDR9GhmVsUhpEqmgxet/U9ZhFYbN2FottSgYRWtWhHnbaq4sbuBsOMuFTFmrBHTpHKmvhaO/qgDHFPlu+VqWVVmcaBiRuRWE9vPY0EbeJwwzASFL1TbMjaRV6KzfC1/s7qsXh7nEHZAnwbvPVJ455PiP2sQZv3jGhoryT/1KU52yNAfB+Xgs0yiiT0Hs1bu2r/RtHWd5FYTGzR5HFmouA7mqb+x4BVMCdVqhoW4E9/CSE6foA5qjo4Xm+W7e7dnzmARxxMhW3BXyaU0Rdqln8Kw3X8/qCR069vnH+5s8w7nCd3xjJ3tn1+SwtMpSuPy0CuZL7B092KTI6Cc6lQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765891245; c=relaxed/relaxed;
	bh=LVvf1ZauRww72o4FAI9CCIjFhqVXZeAS7EF0Vu0Vdd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O2SSuI9ICMbRGN95GQL+FSUbyDu7Cw3a3hQNgn4y33lrlFRVGO3NHByvZgpQinr1JE6YGicCwOvu3Qw0hDvLCbnYR/A31FzoE0Ch3Fsqi6zRsEOUqcQqqqEEEUCqkW92U5wpz8i6NDL9mNoKRNNWKtJdhaPLPBa9RsypY4HwA23vmNAp9G85NlOKNWZsqx4lcUR/2TK4vQ2Fs7m+OGcAH5/d/aPOFYV9SAssEX7GBBrA0vqgCeEtNnmpV+nxwvrmXktw5kL9mYRWxWnmlYpjWbBFb59+xJifJuc7NbkQnlnbXOiz9xREc2sG8QXL4vWidJYazChN/Rwu3/OUNwztIA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Nmi9ST/B; dkim-atps=neutral; spf=pass (client-ip=40.107.162.67; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Nmi9ST/B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.162.67; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVyH02YR3z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 00:20:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obf49AvVe31sL48WMOWaM0ioPhiR1oBdxSZ5D7mJ5m9wbYRk3VATVWi83H+m+PLDhfWBYR+HsmXXluxhV8/66I1/JH1niKUQR0Wpf+d9sS9gr4hCz+u+K/Vq/pa+HqRApthxgtuAXLxg3CNi0/LsroPtpwQqF+IHSqufHiG5fwo/su3xDMDF+020utyI7vdqk0/3pV4pcHUmYtUuE/ckiNi44/EK2uOwjexFhzFwJjEl/n4lV7lCjXBGyQHHwSgrOOnwkZqqGUojaT7LVECeUHUYuHVFSmFYZVYnS3huIPTOXEUZmVdVQNUxUuqTy7/oTOI/3yD2HwlqiCiSqOec+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVvf1ZauRww72o4FAI9CCIjFhqVXZeAS7EF0Vu0Vdd8=;
 b=uISUbxrixCyriwkf/fENjLSjY6xEHrYHR26EKxLHaMvOMOd0hKgO7Rp9e1KLQk3jjQ/D/nhufgSUnXt+gcKfaEsY09IJxpixjCwWn07PuptSX/nmEnaBZis+vFhUGfYpd/XCztGCZTcKAdDkKb601ARaWvo50z+XRyAIOo44HD1ZKVCD4YuQ95B1lSiWt+U2nkrYkymgftoy4Ez0bPGmZqtwmbnYW7iNUaEEEbOx7+1ZbMwaHMwCjqgyybSWvAt/PCY60++Uc1mG9JXuxrIrz9OvHzEbbWFPwW0IH5i3HeypQlw3UjxP0yVQELk+LUanMIEQyZ3b75BR4jWWpkhAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVvf1ZauRww72o4FAI9CCIjFhqVXZeAS7EF0Vu0Vdd8=;
 b=Nmi9ST/BZRCzCqj2XwLnhvOI9Zeywt/HBt+P9wbyfgxpH6B/5I2FS2Wpa0keF76UMegxOx0BTbzF0TrnXW2Odk6tY51lPOae2hZ1Ki+9fnRv6WZ/QhOgYjuuTaYrBl5eX0xCdjKsxyu0SN8oV6Z5VLZu+xsb2mM18sYiltxL6YRMuCUl8iotDjgwc8oeqXE2g4fNACD1irL8A7yrUi9xUTcVBWRXIrf6DHrWE1xTSvVypcA9CmM2KZD+wYcINnHvu3OWhq8OZheIZdzA0SLipM+cw2AOe1Ga0wWfobRQ2++7Pcs7pnvZ22wcctJ1BM3ZmFmBWjYZGmdHT8W/2aPPIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7)
 by GVXPR04MB10203.eurprd04.prod.outlook.com (2603:10a6:150:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 13:20:03 +0000
Received: from AM9PR04MB8242.eurprd04.prod.outlook.com
 ([fe80::9be4:fb7a:535:5c08]) by AM9PR04MB8242.eurprd04.prod.outlook.com
 ([fe80::9be4:fb7a:535:5c08%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 13:20:03 +0000
Date: Tue, 16 Dec 2025 15:19:59 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: fix use-after-free in driver_override_show()
Message-ID: <c6fswwfgzywci26nodyxe26foujp6va5nhr5w67rurtfoxljge@d7655uvgslkm>
References: <20251202174438.12658-1-hanguidong02@gmail.com>
 <CALbr=LZvZJn=Qoyfsr=m-_eCJYwRafmdXV+TAUQSib4H0j27rA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALbr=LZvZJn=Qoyfsr=m-_eCJYwRafmdXV+TAUQSib4H0j27rA@mail.gmail.com>
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To AM9PR04MB8242.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ee::7)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8242:EE_|GVXPR04MB10203:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f2ea8c-d9db-4583-3794-08de3ca5d239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBd+p1aOKvN49aIvPLIXI+9b0BGUuws6Mid4PlJMMuC3qbO+4Hk5YJ/PXw5+?=
 =?us-ascii?Q?jTMHaDLGMwBQ4DoedGyKkp6iw8kLgzja/iRgx3fzyqyBJnHd6CK7CHDt0G6b?=
 =?us-ascii?Q?bEOWhnyJqdIw82+mP451I0HTB/IQRNShH1FeNLoGAudcPV/1VlgRG+jlR3+1?=
 =?us-ascii?Q?fYX2tKQh/LDGaYIsme7x+MumBNiCyOxYQLvCdLigj1Dz2feT4sCzqjzCJsRe?=
 =?us-ascii?Q?VgSjf9OKlhXMRly1oFySOneiAT8hYA720XipPUWzOUBVB4HqJzmaCSENlgxE?=
 =?us-ascii?Q?OGVl4g6pkRcnThv53p2WZSPIm5nIRRKWR621O30q2R0yuERiI8fHMbo3SI0s?=
 =?us-ascii?Q?A/gv0RPY8Cuz2K9ZdNYEk/WnEg1q0a6yP/n7XdfWb9Jj2gjRxdgJ8QrgKUWp?=
 =?us-ascii?Q?PRGqN7QuvLk3VeTlJ5/eb22kAWnD9NrI4wmqKCnegICoZXBdAfu/lSGc4fiu?=
 =?us-ascii?Q?9Oeator+JQXX4tYjlq0+NUDyDwe56bSe1w+K0n9IizYnQVUpJmdBMBU76iNg?=
 =?us-ascii?Q?xcWW81a1NbZlry+4Fy4cB04C222YcTB5P5fvrQGlT4KB8Wxcv34Uq6dB4/W/?=
 =?us-ascii?Q?vsiReHGv63F+e6zs3tTv40ENt5YtjYL0wZyNacF9Z/BlftZq15I/lXhUJx/t?=
 =?us-ascii?Q?3iqXjXdigfIr1d36t95t2M0EshG2jSvR1FgjqvtFmFZFnRkvYzYH1/Pbyr2L?=
 =?us-ascii?Q?PdPLiu5mjPgwYjv4eFfJxcgjdUZ7aMBric8HApN7wzuJBWGJwLLbeCifD0fo?=
 =?us-ascii?Q?1RciO2YsZnPWS4FbzzzaUol3naGRBOvU4mA0iYphgrzN4i2pk/dV2dRSXq6J?=
 =?us-ascii?Q?UbzCg68nFArjbiHAl2KbDOp6q63FizOPYicSF/X05HggTjw/NA8zvE2DpWED?=
 =?us-ascii?Q?axolRE6EeuvEVIDLNZa9wzxCgBBDyH/8y5xXe+b/bGZFMcQ/4og8of8hE7GK?=
 =?us-ascii?Q?uBnsPl80gj4gqx5Kc3AzTS9zmIU1c1BCIViC49LXqxs/QrHJhOQKy7cmWLlV?=
 =?us-ascii?Q?67vi9H6cLOl4QHSiGYHKPJivw2ZV17fijbPqWugA5qkRXp0lhecTKApTD3v2?=
 =?us-ascii?Q?zLxOccIoqo5V6Nf7/TKldO25RSjnuBh1WecyJcYiaa4iH49VCHOTTaDUlYdt?=
 =?us-ascii?Q?1ntSOaqskqJygX1Pa6SZP+UmLCL6/XIixqv22170FypRqO3zYU4VmYkGF3SG?=
 =?us-ascii?Q?w09XCj2O7wx+9qHM3ZbEO323wc3SqAxryqKV+anqWUJSAScTIexW6xySLVfP?=
 =?us-ascii?Q?nfeYjD4ZB5Rymaj/fGS/OomaEzrnFUwhGQkfeb+p51/Gq7T64Zk+kvc8VWZL?=
 =?us-ascii?Q?0yvm/r2PpoMwlcRY2Lpw1eHaTEVwpk86iJgCfBbn+BZ0bUy1edoVIg8yK9uf?=
 =?us-ascii?Q?d381rXWPE1Ies3RVWLcIVBhFWPQjQ2BpWU1pCSuyF45TUgd47NNqjzSEwSsV?=
 =?us-ascii?Q?oY/8S0hMfdnUsYIZnaor/y0zLrczgkP7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8242.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8n7WAhsMjgpTSNMrk9/vOzBPIuhOMY73JdNeaRPf5xA7oCYnd8VRlG/4pEe?=
 =?us-ascii?Q?U2mf47xHCwyF5RBggksnD+DMorpzaZGSiCLl0lnU4WqNN8XY/pr7dwpoxpAQ?=
 =?us-ascii?Q?9203y8UPRXQIYQLcE0cerexhMF/fLG1JdqbiH2/76bdhrhKiTce9LmaMTKaU?=
 =?us-ascii?Q?HwMqR5egmvTXTW47+pGEj0pu16g5NsDEZ+6TTohR0mWODE+6W15t4ezBbb4B?=
 =?us-ascii?Q?jFQQ5ZZM06j5q8mOKX3QZojh466a1+v/5nrTBT3whUC7p7We8Cwv0qRsZbrn?=
 =?us-ascii?Q?fJD7sc0M5cmSgX7AeUCpu7HxywCmxAOYr09AB7WlSsibc4Glp0G0fJZRXcI7?=
 =?us-ascii?Q?sOmu3+w94iAndWnjGRnJTNjR4UU2DClAVxAxRBvRTRiifmJ8IcltDiG8d6T5?=
 =?us-ascii?Q?LDlj2gh2Gu+fpfjsSF+77RxCc+KTbzpyUCqyftIZfP/3vb0hkPxhSwNiCP/W?=
 =?us-ascii?Q?RDkEOAAJn8TgahXtaxvdDQ/QrEk0ibC4AcD79DV8d3fOVG6OkGF9tNg3xUjP?=
 =?us-ascii?Q?QwoP/i08q4M4Ol3QL+ML2w5WQVMLXTu8/sqrCxKDCNfa/Tx3xeeb/LYOEsoo?=
 =?us-ascii?Q?dZ3NGTon99IsTqoc6UE8uJQNgYvd87Pd5DeFhmfy05BvCdvGyHbRD3yxTRyx?=
 =?us-ascii?Q?3H711mq3kebZOSxfHGz+pxO4YVyB45TKpCWgUQ0x2d46tMbBfRKHwRFHBmWC?=
 =?us-ascii?Q?8P3CwDTEVSY/TdZU3Zm5En6IwVrJ5VVB5HWbUVsOkeg7hDFargXrFm3TNOol?=
 =?us-ascii?Q?S5iOeZyaz1u5/UceHG+dPFVmZ5XQ6PT5HeEcDlf6CGrtA8BE/tnHLtRTEPuu?=
 =?us-ascii?Q?Iq6c3ukFFYIBtJ3M9GnNOZKmMDugSTmmnxJauyzG/IKcqQvscrvccJ3apmEC?=
 =?us-ascii?Q?nYihBzXRRyEfkP3PekVzKkekI3fCbgxJLqJx7lLQE2EuWeUIHeIKqfTNmePd?=
 =?us-ascii?Q?bgG/ewG8eGU7k0VlPv0PxY5SevOvuI7kZg29lreHa6ugisRn10cE//m4uThq?=
 =?us-ascii?Q?IkAKCDjY/H/aGfVjtwJmcX4IOiXIRovL9+CWyz4+FEAUc/bVlEgOR62+tBQj?=
 =?us-ascii?Q?EMFVKf8zv0qJl+VIfrkNj6cf1Q7TNB6zQormeKm6M895kxIfatYPhPlX1Bn8?=
 =?us-ascii?Q?zUhoP3CnvowCb6XoL1ioYhamMLI9t+HXlJ6fC81+jcR3rz2/pZIn0erHrnl3?=
 =?us-ascii?Q?z5ifalhuq+6RC0sqssBE61yxgGTmV5pwZ0kZz7x3KAelko9tfNlnHL1HIphF?=
 =?us-ascii?Q?8xgW4ePPtBuoFdj8hoGfO7efNUCpHR7+5z2qCZPtEtQOCYyRLFndP36IOJaQ?=
 =?us-ascii?Q?RmTF1RJ+R3YrEZ1WKLdhPzjUTTVRla8pvd/1zZQTkLX+y1KqVUWE9/rAWL5z?=
 =?us-ascii?Q?CoVGk0kTg1gaVuEwkLymc20oukzSaiZp2R/Q+GnJVqAgC2uC5Ym1O7/d/II0?=
 =?us-ascii?Q?vG0pOCeB8X8Zd9MONEt5UQ3JA/1ILlVRQVsEfyqRfS8ZelAgW8BgUxOzh5gi?=
 =?us-ascii?Q?K/AT3WTn3WYtQ0WKaT+zBtdSVBnZaGaJknb7rcIhieTT8+oNaCAys9nk0G9b?=
 =?us-ascii?Q?/GcqzZrK6iFo/g8OjVvGZrr1MWQE+gm+qVnvk9Qi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f2ea8c-d9db-4583-3794-08de3ca5d239
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8242.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:20:03.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beHrAegxYBC3rRJG9bGx4Q3H+BL5Kasd+PzTZ85wH1vyrXAduurajzaQ9Gr28Um4Mgv4MUMzZu2qriOgkfMuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10203
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 03:31:43PM +0800, Gui-Dong Han wrote:
> Hi Ioana,
> 
> This is a gentle ping regarding the patch above.
> 
> I understand you are likely very busy, but I wanted to check if this
> might have been missed.

Really sorry for missing this patch and not responding in time.
And thanks a lot for the ping.

Ioana

