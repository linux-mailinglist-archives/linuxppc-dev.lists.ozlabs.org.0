Return-Path: <linuxppc-dev+bounces-16659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOBqMpyphWnUEgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A3FBA28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6nfd2bd0z2yFc;
	Fri, 06 Feb 2026 19:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770367385;
	cv=pass; b=llTW/5Y6ItfWDwuR8R1JMB8rvSD5mpgoRx2w0DthXpo7aMI2ulRKFdp2LwlVyBHkLHhFAc0fbc0wrhjPvA62DY+C/qfs88miWQmWC/J6/dEHvp0o7SvhMQxiGNoVUqQblupkObYfF1lX/okwfS01nrrfELkmVmRlbhIIMqlE2NvFIHT4zjTXW2orZ0TSX/KQKC8b9O3FHKCROw/1imFN7XtVkkJe5qJ/Il9zbLEoKZUJSloa/d+4Pt36pTBB0Log01wXiB0A4RyRmBjY/L3Blb67sYKdKkMFKbezU/DM5o+WJ1TNwElumMFiEbJdbrKXdKJXKs9+EmXkfw/DncLOdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770367385; c=relaxed/relaxed;
	bh=DHJv4om29nDL23nkXqH2NWPtyudzSU8ysG1DZUcWGlM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Mg0jSF0HvdtuO9rChk+sXnWw/3LDD4x/R5l+071sIHxNXLa21LGJVTqMHcUsBs3139u7xtCBccpy9ShOTqRWN1kdOLYOwhYPDdaja41WZAgZf1Tq5Y3OTW1t1YsM7JV4M/RQTv8sX2/LBOjTGcAp5zeYglA4fQw7Et7zjHGfeE/31/m2ZPOgehANk2DoEdgMwoxsVaQUpKj69ubWbHu6uujv0Bl5dIHDxfhG2VHRVJEpnoYsHJujC/s/uhr7YbaS1zR2RVDiAkD3wlXMPazJTh19fd1T9E9IF31hY/v4g0DmAWVDtqlzeagwv37GlWNBSD1uXaXEDvWe+KMaeZEptw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BhXK6Uzy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BhXK6Uzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nfc0kHWz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 19:43:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyyclp96+OOBgWLReDZEipXb5N8mxNq3zlKkvxQBNqWmlJPkdS76WwKc/IJea6gGIjSvJIOiuJ2AV0fSROwzIUuBmupbGhXaf8+tLsvfHkuYXMIu5+RNYQmLRa32VrODiu1MNUzd8TIMmRiL7+g9N/5EuKDSjg+WUnIygsn6tn72h25GSWF4PR+zx12SFAeJGMvveBO+5eIRr8efJvwxEBJZG9L8S1iaQgn1Y4NXEyP6/KDL2Y/Pmri7UkBK7+dRVEGST6buqzErE412ZCBYKwDTS17ZQy5PIBpuS8ohHHbsJvvh+Yld2aTmlnkTRAIwabH86iGwzMsXDkVIFHyqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHJv4om29nDL23nkXqH2NWPtyudzSU8ysG1DZUcWGlM=;
 b=SQFAhnYe4N0RMsgK2kE4CSJ+1HgyyDRUjG5Hf1vS2srPwUWbeXotwlvcPfcsF1vPha8gWirHQmyPzAywc4pVQ+6oYP/vb1DCVLUsp1ESpQQ9kLcog16qO+qRq1QsVB310IChRL7e8vpdNBJSZ9vkk9QUgfxRW4GRiTx6e2yGMjW+mp4jd7xD9darcpB8HQOaY2APyjG9tCkg4Js3piy7R/alYdxt4iY9QYQSBFzxeKtby/hFlNmC3MoGDQNQzvXgK1G+whsv6MChYJyaM84uLY615zq4Em516/yuR18F1A7TvT189BxhywEdztP+jx8n/L7o8BpXC6FEQv5rn7x/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHJv4om29nDL23nkXqH2NWPtyudzSU8ysG1DZUcWGlM=;
 b=BhXK6UzyOfbcC8zK3+rPFawTdzhWMJt5KqdbrkY1hj7FGmB6X/0wdDaFRrZqY1i88RLU7csmUp+XZz7CtPXpfLUNGTkKEdxiIP9X7zztP7wQtnoBUs7/WkUeZACjT/tAwE1fYd6bjknnVAtUDRz5nZgNi9bFsvqby7FWM1lJ5XRVUgYUjdeM9N4bKWd0SylXpaur7AIvBfEnAk+dxYb/KsEeTTBvQ+cAuBUmmMlcX8iak2QOBKm8TggJIfDxcZPsqD1MOALGh9EoZEr3Q9G/RBFfavbfLwkUOw3VUbV5uIPCVW5BBzLmQ+u0eEY63vJKqLI7Tda06TsBcU3IWnnIHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:42:40 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 08:42:40 +0000
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
Subject: [PATCH 0/2] ASoC: fsl: add bitcount and timestamp controls
Date: Fri,  6 Feb 2026 16:43:32 +0800
Message-Id: <20260206084334.483404-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB11503:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5c512b-3c5b-4f41-2f69-08de655bafbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lRckedDfie46Y+JE/bei52/Ac6vBYcScd+PJxjGwU3Q+zPLpaIGfC/xU7GcW?=
 =?us-ascii?Q?D9AItrtcYdIuro2dVnDfrFZfOUbZ4tPNQpVFcVSd4TjeYONl4pc3qMPbxqTe?=
 =?us-ascii?Q?lv0erz3+ASeSjP2UAVvGBX3ofDedAedcykd2IVgA51LxYnByic0opVihhZxx?=
 =?us-ascii?Q?PhzLmOpVjty+zh+wtbQ6cW6fi0ZO622T9fMM7T1esbhtYZx/hA8XkMkMmQNg?=
 =?us-ascii?Q?4Lvr/eSSEBjONiky1ug26bjPLd8PeqOs05fQexgiurFqAFxCDsoHRVFZ3ZBB?=
 =?us-ascii?Q?7gIpOHbTFIQeXdscKfG3vP1Gr7C+A4u5VeoBq9ewThQOsIyIwvvEj0CqnmwJ?=
 =?us-ascii?Q?iTP4Z1ylYadpOLHkZmts6uB859vq2zyxN7npZ07Ni6Pee2cvw3+rFK6bZNBH?=
 =?us-ascii?Q?iRuh2zyDrsV2jAAHHzzq0Z8Dki+xfF2VJ4monJOET2zsj4yu1XicikGH1R8a?=
 =?us-ascii?Q?1H4fahk9jfTnNEcw5TwJVkX2552OiFr/Xq0Qs2610E7/2GKs9HfAyzojZcPe?=
 =?us-ascii?Q?FxPy+1iUVqmCTZTMS8co7oTKjdMyYzq+Qlkw+r7uCadsEHx4QH38zI1ej9Bv?=
 =?us-ascii?Q?Yq+gh3JsipJq8dpBZJHZ4GCzjMHaCY/wBOM/USOSq6R7kGSAVYdcCniGZBCW?=
 =?us-ascii?Q?FzonnbioLQdswUhW7Sw05O84upC0NilhEkP+QTkqWQKgTQZjYFO3ZNUoRfOa?=
 =?us-ascii?Q?Sw7YNIzcBCn8pwvyWwXxgFeqnPMbxB4MSfyWJoj0mS5MISu/pxFwY13EJaIy?=
 =?us-ascii?Q?we2i9De8qDNYcuEqDrcH3TB2ReyJJtOP5tk3Zc6QGevdU8Fo+TT31SKIdmuc?=
 =?us-ascii?Q?sVlxMd3e6bxp54+e5mnGZeykTL/KTFuaOZWq+ThRRMBaETL42Ii+oN6Sp4ec?=
 =?us-ascii?Q?/tTIieWNnr6SMT3znXnc9Hr9I7QND2+s8bKwOECwcQnm4OaS3HbDcGlIgfOX?=
 =?us-ascii?Q?6uWl2L1DmUp2xD4+XYGDiM5LalVhFBkNbXRCHCJ4F2461+WZuHKnGBhiNzEw?=
 =?us-ascii?Q?3Qd4zvz0FDeUkX5fSp36yqabuKLDFwL5uEmJWVaUkU16Zylgj3MYiVMJ92lr?=
 =?us-ascii?Q?Y9/wKUJJc9WUo7mFhJC7ER878Oy2PRV6xqm/Av2l6krdWkjWSfa2Yv2xRS2k?=
 =?us-ascii?Q?noZBanxuMlE8clx+PpC35xklDM9EwlB8u2dTLccw/dwPnAchz+mMhDHrncNw?=
 =?us-ascii?Q?imO1KG9LwrEiLazsTorn4cnk8rRHivGfkpEoWAdZlS2Ky3/dxtRIsQHpPlO0?=
 =?us-ascii?Q?mc2mGI8jFFDepYXTSidLMHdkxHBLjoR6oNcJkBv0hOxIPC/7xOT8UGoWBBKI?=
 =?us-ascii?Q?N8UrYe4JA8tAShIBr6E96IOuorQP2Xrm7HPF5o4jT71JzkdWkldXYn/y/1s+?=
 =?us-ascii?Q?52I4kscv1IrD2V6AaPtSJm4NnlDP52kK7WPxU/PDpcSsoEkY8pg1WDGudEpL?=
 =?us-ascii?Q?bJw9fzi8c6uRwHKhSjvRiBOA6zxP2cDpyzy8cpEWhPm9x69WA+R0uEVFjjUw?=
 =?us-ascii?Q?CZAQTq2GJKDu8557/WOsKdkyQS62SIOBYqZ0YwOCTt/7sKcLisFaPBzigXq7?=
 =?us-ascii?Q?IH+kQcaqGopX9VXLLw954zgeUOMbUhdsilZJLPrY1NNl3QDXv1HnZ9cpvwEl?=
 =?us-ascii?Q?ITr3aPcTVeJXZi5ubuN5qdJh69ovPVx/UzHYQRc+VR2d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWtHzD6reCVnJ6Qq6IgdntN5XSeCRhSSUkAY0kWCoCIy+cg6xjgxHeVrtcBe?=
 =?us-ascii?Q?o14i4QF0u5upj9y0KCXquNb4Vhu+kvRG8tLx3fab80dUK0iDA/R4lO8TatDH?=
 =?us-ascii?Q?oyRXizNYa/cUcobD9IvHrndOaqzSvk8sPOqERXa0J1m+BtVxAKmmDkJ+VTcz?=
 =?us-ascii?Q?Cv65SSummZuDbailJUITYtCIjk6xPQhTXH6cwwrhJNqGzxdt6td7ekS6W+QW?=
 =?us-ascii?Q?Ri3C/Y3BcFW1ZUlNi1YI16VpVbzPajxytkbM2fwKNaS2iPqHgOzgebqpG9/l?=
 =?us-ascii?Q?p7iiJB+ORWLKgsRV2ed8DU6C1cKeXjujx3gK/ud75S9BtnyMiW8bl1SWt1ue?=
 =?us-ascii?Q?d+o+rCOxpoquWM/+Zd/U1YuOmJ3D84kxOq9VaGt19BZt0kni7XjV0CJBZWL9?=
 =?us-ascii?Q?FEV7yLBYpRFXtUY+fP2TEJyw5R1HokSHtz2cyVyof/mdhJxfuJ78dYwrJ6Fi?=
 =?us-ascii?Q?Cv0b0sTHi9Sr6wSCRAkiPDhWQJgkYviEIB3Bscf1yWbZUF5N8ZoQ9iUDbGvz?=
 =?us-ascii?Q?r0utA9wulhPsupdkjhEvfKdtPsCeXaqoY5CZkjVJohk/1gRzNSq5jHklVxDM?=
 =?us-ascii?Q?Gfl1w8QpfvtZ+8cnojIxUXdS2OxQabk6AFpKB+692KN5NqSkibCemb5X702G?=
 =?us-ascii?Q?hlKY3x7qCydd2DO+8DmMfoEtK97MyUYciKS/BfYsV6n2+vLdsbILCmalQSms?=
 =?us-ascii?Q?PbH8Q4X4TqCPkeXozptMQ9MWwmrvwUdX5/6QKSgn2MmUZ0UWs7W2pENEh5J3?=
 =?us-ascii?Q?JiBelKAa0GafjOFB+OqPUtOoihEeR3oKu/662UxbuAEwDCbdLegObJerp5tT?=
 =?us-ascii?Q?R5nX6PjjGq8k5l2nJzSQe3njgI59Bl42QQWIKOViXF96nWVo1jJR36u7jW6S?=
 =?us-ascii?Q?1aZSQcaayB5b5fhFj2bXNRV5DwNnSQRmk5KOak4sHfp8QSD9pRsrlMHME8tB?=
 =?us-ascii?Q?r++rHrpoHsWp8W3+/NClwSP/ahA1Qj9t7lxzkxBmsLK2DIP5gaSTfmd2vV6q?=
 =?us-ascii?Q?qdzUb/DQG5Teq4CgnGCnEzyTvD8H8/7FMZ2si2FxZaUkzRdSUDCoQFL+ToG+?=
 =?us-ascii?Q?XoOV2Y8fLq7/M2mvwpIY//3+4XxFH723ow7u7CIMTwodVxC0cKso6v//YlT5?=
 =?us-ascii?Q?NhitFKeRhz79GaXrceMlOoYMnhqGFZ86YyeBzGS4CZN1Rg53XQsu4NjycMGq?=
 =?us-ascii?Q?OoMaZ0bfZdIMQ49twzoEDFdpt7q6FyMimfe7FRvvYilqPHFceWbOmOSHbZe1?=
 =?us-ascii?Q?nj8yu4e5FmeWYwCKglwX4yKaoKLwg6ceFedjlsF8zPHvKsIpQUA8UsZv+RbX?=
 =?us-ascii?Q?DRl37TZnIFISiDdpe5LgJWLoBTrlSTN81D6kRUKiISUPv4ug61tCbrvu9JFr?=
 =?us-ascii?Q?LgXZ6nLlv5j+Nz/Q9IAvXYXdNcuIZFaGXJD1bjVig6TsIBJWUrhiP4S11bX3?=
 =?us-ascii?Q?8ru8Qdfn5JwdCVzws+nUbqsdoTD4gVkgMP3PPuqgMfAiom7/BNKHLDv9NCKV?=
 =?us-ascii?Q?LknyYKUSV/wXRNYh3c5y9OS1B9/n2ICXdqx5EtK4/hLlXSfrm3nY17bvTKho?=
 =?us-ascii?Q?iHttb9d+9lvgImhJCP2JLgz57879WFyq7dT4EsvJE/auyz0reoqKm/JFY4Gq?=
 =?us-ascii?Q?DWhXe80FpGNYwA2aYc4QC/4qmLA/ngQlBe/jQREZJl6uyPMMzQO+Y/olyHKg?=
 =?us-ascii?Q?RJDSQvrQlfBjZLebE1vLkPHVLhak44cv3wbpuop0K6/aTbiGtj8CdMDCldGT?=
 =?us-ascii?Q?DK96ZrTp3Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5c512b-3c5b-4f41-2f69-08de655bafbd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:42:40.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnFaYm1jz/ryJ+zviRbi3MenMyTfnuvqWdrfMuYJyPdHTvk+FPvmyZhGushQtpvPW26EOIfoytlMln2sE38eHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
	TAGGED_FROM(0.00)[bounces-16659-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E44A3FBA28
X-Rspamd-Action: no action

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

Shengjiu Wang (2):
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c  | 52 +++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 10 +++++++
 3 files changed, 118 insertions(+)

-- 
2.34.1


