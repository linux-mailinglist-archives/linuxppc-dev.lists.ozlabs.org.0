Return-Path: <linuxppc-dev+bounces-16660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDgXFKGphWlhEwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC5FBA2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6nff2HP9z3bZm;
	Fri, 06 Feb 2026 19:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770367386;
	cv=pass; b=BVTG8C5IaimHOryRP9y7FsRiEtJS5NNOSjrARKu+xh1jMlSXJh4+5CfZRSJ9eQufpYMwoodc4rPZhXFd/HbpwVDzYeLEmwexdcf1AXzq1sH1glS82CCC+JLMHPYu8nOuPcF4zrtDECcvnj/2f86N+x68MZlvU6AieNVikjpYBJPnNxkl41XzDdyTiJ82M+rsuIU7MRmyEm52KJTXb4sX2cbZl2RDVtQxFyUQ9xMO3IrhblKUMPKQHH9/QCVlSDaQkNp99KxGceXpjI54meQt4Qkisy0fkRMujB4eLbuJdYNsLl2QFrMNtU/U/h4O+9ZwnQrZB1e8iAugI4imdimyzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770367386; c=relaxed/relaxed;
	bh=aaNGK960EyMcvb/0d3oSXE3qEgN+C9b6OGSVALbBXDQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQ3/YqIeJty1Womzaz6y38g5zDG8XIRftXhoth0Pxwvwuouji4SIh2Xncq55cS2q0BPIUQD6MP7TEAIn/uEwkJiUCV3fYDUtUmJUR6FXreWClr23gTshaZjpxs8BoXAd4PJupYLRwLjA35+3tPyQhPaOouV5hccm/SRb8F6xqzCob/C2oGoT+XYxLDsth1r94oktkYwK8vk9m79Begf9qdtULvjo+A5SiRX+oZPrWPOAXg8Zqs6tV9ON7xR5Q5+rtYJRp3zU0Z+FgzRTv1Eq3izbbnQWtBbE0YC/YlUrZIJjjUxBFM4XZ+14+YeBONc41cUqy3skeSbmQ1gaHUsImA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HEj50c1Q; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HEj50c1Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nfd4MnKz30GV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 19:43:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdkYvBF/Op8W2wUePeqU0ezETqRf1YcEBKlsm+62vI0qOoJE5fK3DUGKlOj8YCgnn/EmRO0zUguLGpJHK8v3Dli8cFa4XvQdn3LIjxAI3Z8FdhxDdJpwEdnqJy5GHr65hQwFqUNXfCY+DpzKT3nJm7/QB1sSpFQpohjxaIvgINGn7BL9U2fNdWTIdsV1TdWCTKtTfa/ZZNB6oQRhaRDoPJF08/sIcJfs0ZGecjIeIM5d+7zMF1F22CHa53q1aUW5+pMCSejvATOcPmhfLhmgYD872Vjw7MX463RO+QIBXqg56wegovdTpz/L3I12p0Rg46eUBP1um0X+7pE1b2IOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaNGK960EyMcvb/0d3oSXE3qEgN+C9b6OGSVALbBXDQ=;
 b=UR83dKYCoILGn7S9qgpNBzEO7HkYjV5cXU9bXdymzi1qVTRZjIp08QfuAy8DNrmHJAUKYs/hZ0jF6xS6DchGOXCQI0q3yUoUrcad6IoxEQIbO9z2R7T44zGPXtGmOg3ByuS4eIV3sVpN338KRCemwy7j3Uyqgnbko9Fer3tkmuihDHNzKC4Y7MBAnyIox1q+EIdSjQbQs/G2qFSptzbieCwFnqFBPhNQstRJHIKz8LH2cVz467kh5sOW1apSIFFn9pJGjORBZB+0hkCpm0SgOjV4DV2iaTAzS57YusYhBJsbClrjqeNzF1gslE3TIr0C7i05kot7xtRmnGKjCCuK3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaNGK960EyMcvb/0d3oSXE3qEgN+C9b6OGSVALbBXDQ=;
 b=HEj50c1QezEFkdJOf66ptpFUAxSM32q7Usu1l9jlAnvuFB90+BUBIG5aDEj6XFalX5PPF3b2cetTmPx2VEdAGvnk8qN3KAfjTHMUO8lUUPuOg8jJ/XRFJIP37yocFNUfwn7kvaO/mx1kcM2Bv2/6OB2XS3iaxkSbNCx9vFQZZ6WJpt5+GCVRhYcEx0LF3SI6HpkengKm5113AFbW+ZMkItnYu1xcru6ZR3+Hst2Ds/C1c7NcQeDaeIxf4ZXhDLp2+TCZApN4L1Bp+kigaj6JM67kwCq81pP825IX3Q+o7cXCC3cAlx2B2Bn+5lUJ2TsuNVbbLWHZS0S9wW1AwpYnxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:42:44 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 08:42:44 +0000
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
Subject: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Date: Fri,  6 Feb 2026 16:43:33 +0800
Message-Id: <20260206084334.483404-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206084334.483404-1-shengjiu.wang@nxp.com>
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4f22104d-00f5-4683-b20d-08de655bb20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qaqx6NGB37dllSEDYXXSZ6TBdR5u96xZkTW5+aUk0UFikFAiACu4Q3N7L9MJ?=
 =?us-ascii?Q?yTDsqjqJPwnPTj3QBShuIgo1NnHor+dHp0QSWtWSmHDk3hXKacAdN5erTRDk?=
 =?us-ascii?Q?6Lw58mggdgy1Gv+7vhX095Hz21xY7ugTCM/ALhMrqefnzSciFBydSx5Uzd/s?=
 =?us-ascii?Q?hA0ekKzExR3NtaHWHGv6XpryPLFVeJN1NSJ1zilJav3hQNo3jqj8kBJRDKUs?=
 =?us-ascii?Q?LcBUGdZL3KiREhFQvR/oVRFAE3gKF76XPRIUTOQv8SRYH8+Dpc6RsKYletit?=
 =?us-ascii?Q?yLSHmj2nMv0zCaTD63wUKL9hux+4mtz0UH8YlTB3dMXBjrnJ4E9cqnTy4vg5?=
 =?us-ascii?Q?aoQkeCqfysyHXZmtgBxyes/bUmYN7FsrdRfJ/srovZdWdh0+S9v1CP8H/23s?=
 =?us-ascii?Q?/nppCDD7eg+H1Ari+mO10cLmwc4yH7mlWO/meXuBhVxcDQo2wY/XBOgGG3K2?=
 =?us-ascii?Q?otshFfev9K6WdugYlWcwMQswIoxvzoMZdA+qfBNoJfefamOmTyLK0QaHYh/N?=
 =?us-ascii?Q?bAf1dVAooGUblRwxJPxVM02kv+pFepLzyokhlhRBfXSkYmPzbL66caXMf8BU?=
 =?us-ascii?Q?xPy5DBCp2QP3WAhkbC79D5qIOFaXHgSzeJdE03UOTXskA99R3+Nix7EM4AQL?=
 =?us-ascii?Q?rSggc92oZA0ZDLKXXAxwZPqxLwyPy6LdZ0m9HEAHO5VnFiC9NNI5OIYbwW/i?=
 =?us-ascii?Q?Ojb4R7o34q3uaawU5j2a1xVyzusHbFshV5AaiQFFQA8plYQhbKzu12jVaKjw?=
 =?us-ascii?Q?XRF2Ndx7Lb3XgUWwd/8kEGuZtZ2B8cZrrfbcQwHNQjBmRvwl6G2YADlBd23E?=
 =?us-ascii?Q?mcsT6i+kHZZnTBR6DRJ3u767ZEEvkJxPCiA7VrZA/zUh+JpWHh4qTydiycEu?=
 =?us-ascii?Q?//1IuH33DXTbmhW7p/KEa6NmldBKXagVO0Tqbl4OPkhsuFm2bB0QboU4t1dl?=
 =?us-ascii?Q?YTTVf9HNK9diW3PXMk2TbrXFUMeRxjq6+jgBznMg6t52QnvtOZ/dL6FI+l8o?=
 =?us-ascii?Q?+ycJrn6yG1Vn5AxRQg97GZ+VI1kSYhQ6aFkEoXDSGm1J8lXG/XWZbBYYmibn?=
 =?us-ascii?Q?p+2zN1CLM7IrXbgchz2BPkFln8/gvAijppF2UKveC10CXUjMlfzZZr6al/X/?=
 =?us-ascii?Q?N8oaO5FuaRKuNTp0mqsrumvufx8sLTu3Xsw07VwGxsmKDr5m/qfpCFZNK+6q?=
 =?us-ascii?Q?4ZDI+u+IYp7tc/EZCQfC3ncB+zZ0hrxZxQeu44+Rsy5krIGrCeiOxhtKXYvy?=
 =?us-ascii?Q?Px6kmz6TpN80FHJsbhq7BIY+bYWGqhxyJJZQkIyngqIsJYjxTpxAgJ1SY7iq?=
 =?us-ascii?Q?0Vc2hDS1HgDFB6YhrpGnGnRhkboXTcgjT5RCjS5C/EiLpqQTIWVT2VKC7GhO?=
 =?us-ascii?Q?CgImDJqBE539kupHJXAWgmhr4ZZoAE6XwXtoUklr7kIS+zomHIdT8vbe/8LP?=
 =?us-ascii?Q?gnWliLU6PW5+jVQfZEc4rjm7au75YZ8YMwytebRANmDd9QMHochA3y0PrZQX?=
 =?us-ascii?Q?I/aIUu6mM5Jsjk7mzmmi9CQwsVp6j7cSp3iV6r/drP30zmkHDVmEY2bFkX46?=
 =?us-ascii?Q?BHzMmT5H3T+mrrm+Wqqbhaeg1R8kaghwLqaI3XGPZH4Vq2e1G3dDhev2uFeN?=
 =?us-ascii?Q?ujMZ5HkrLJq/Fvk1HhMTdM4zIhOAacdQB/FPwzmGKnBj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G/wYBdPScYmj0NLxi+NGB9Z/DHp9tqjcRkVjhdD4WMdWN+RrKt46N9KEuqnO?=
 =?us-ascii?Q?AJrVXlz9qRYfBVYQgh828cXJllPFTsSbab3fNGtZy5mqYc6PmmztxnBfQVd5?=
 =?us-ascii?Q?FQRLkYnKHYnpfc5lopc0C4L/ChBU0lbk1msqKazCEMZks39vGp+6ThXVw+7X?=
 =?us-ascii?Q?anvfSEERCQ0G1eQ6nDCU7gJuwmDKMh3NHvu0Yf8K+7Cuu51khtTI3QANFAt9?=
 =?us-ascii?Q?gKoaBuegFuRaZ67uaFT4zzkboQvyxBfuvHc2QX8U1s/SaybBa5F6neXxBI93?=
 =?us-ascii?Q?ctPKZYwnr71MNbezw5jP4uB5klKcYwB8alAssXX6nUUxyGSeaARX6DHBW3cS?=
 =?us-ascii?Q?0ZnIHbx5j5+Q76oPwHSDdhHZPkBuPHqLLzlN6kUpYkpobF4s+e7pSedJi0mi?=
 =?us-ascii?Q?zzIgF50QyBVk/QcilQvHPGeZrJC/uZr5kdQjJiaG519BJvdHO+jOqHI8u3U9?=
 =?us-ascii?Q?egVxhdcAR91yXqXV8tLw2rcpopLvjeT8tm7J8OPYxrroPzR7iKPyCiU9bhPa?=
 =?us-ascii?Q?8pw8j7OEoPz/sJ6ChCMby3RD8pliu7cEJXF4qUVuwqAgWmJfdf+r7V2KcAQL?=
 =?us-ascii?Q?n2XbjX52nmkmjIz0wmIjb6y8IGkmB7spVqbmn2rXn9z8VbO1H7XLxb0lHVEq?=
 =?us-ascii?Q?uPlE5m0eXr9d2EjqUiJ0iuAbMNljOJAGBxe6QUaYd2aBCy69w5kAbfImqhvP?=
 =?us-ascii?Q?XwDUe9f93L3nHPW8b00GG21MfZA8uDv3NG9mCCujEq1fWiZTXIlGyqK4QX8R?=
 =?us-ascii?Q?8axWKkvGuG3M9zdyx1LKNn+98sJ+fIRyUKFoohkrwJDc1O8A4nICmS5Qu6Gm?=
 =?us-ascii?Q?Vr6kVPfBKFAQY0ryXQ1ZINnQK+OmIzeicEhRT2mknXdsy80BZDE0ttc9din/?=
 =?us-ascii?Q?e5iGzaBpSrz+c5e9w8iAQ/DWeKmnX97c2aqQpj2//OSF8xORvEwUdt6Lhvcj?=
 =?us-ascii?Q?VBv1O4v24a6JmvjV5jRRmed/ezbfWY9Z0ahx/CtrEP2wY/mDOgSMuOl6SmkM?=
 =?us-ascii?Q?qMGcvwL8JwhEuCtjXiBsZjuqqAvVyU5dwe0RSADze1ZHUT+27RA0x8rOZY30?=
 =?us-ascii?Q?J2eCtFxxGtyOjM/tlgTAOazoANDb4Q/gnaD53si2hm24exKF86OvG/kWOxbW?=
 =?us-ascii?Q?NSXjK35I4O3V0mkRnNdRMNyhmNxdZnUc0NrqC0ZERuZZ2t7nSI5G5Gh66rPj?=
 =?us-ascii?Q?5pBX3iIOyeAA4opmOfu1XnVDYYM9nKf3+NAZkjU3NuBn6Mw0XFYCkPwLSI7X?=
 =?us-ascii?Q?W69EL1M//SDPBqfhsqfogJySifQMlbxnSNTUquyufhSSeZNE9Fybd0xh7Yby?=
 =?us-ascii?Q?Nz0ZyVIYkjK3ni6hohqMuvu+7UY7lpn4E0YyCnXb+wWir4tC3uJE3m+cQL4a?=
 =?us-ascii?Q?ZjH/zKU+ME4d6Ty6/IJkLYHHFXEtTh17g6Ij97kjElEpUgTKtSKI7vVVFbyI?=
 =?us-ascii?Q?FsQuj+s+oPalFx0r35rMoSt1F58qQHMePMRxRwaavAjf3012Fx2Lmxzuqf1s?=
 =?us-ascii?Q?SC30fUL/nfBqz8snXAUvGNDqeJw84n0FHba6SsxyqtPPv8IEOrbb9Dr2w2ss?=
 =?us-ascii?Q?24Wve5RyK32AnBuefdz7cduPivbYpIyWuBya1F8iM2EtEDVlIIk4VXBoqOhu?=
 =?us-ascii?Q?6CyG96EXun2IWvi469r56NbHskaEDIpQK5thdPqs2rzsRLRkPfrrhj0XNqtu?=
 =?us-ascii?Q?cs8fKFHRjIcA3qk50mXMo54PB2hk6sLfl/hC4n93nEexrAph+Ty4jG6GzkFZ?=
 =?us-ascii?Q?gSNhpW5oyw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f22104d-00f5-4683-b20d-08de655bb20d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:42:43.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYNYCNJBqD49Bq3lDVN3LcvsfMm/7VR1AK/voaXnkdG+sjDbk6l8fi6IDbkwQlsyAtoqI/dHiiNhRICv4QPWdA==
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
	TAGGED_FROM(0.00)[bounces-16660-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A3BC5FBA2F
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

These bitcount and timestamp registers are volatile, and supported when
the module has timestamp features.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 52 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 148e09e58dfa..f07aa664d276 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -41,6 +41,38 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static const struct soc_enum tstmp_enum[] = {
+	SOC_ENUM_SINGLE(FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_TSINC),
+			ARRAY_SIZE(inc_mode), inc_mode),
+	SOC_ENUM_SINGLE(FSL_SAI_RTCTL, __bf_shf(FSL_SAI_xTCTL_TSINC),
+			ARRAY_SIZE(inc_mode), inc_mode),
+};
+
+static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
+	SOC_SINGLE("Transmit Timestamp Control Switch", FSL_SAI_TTCTL,
+		   __bf_shf(FSL_SAI_xTCTL_TSEN), 1, 0),
+	SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),
+	SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RTSC), 1, 0),
+	SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RBC), 1, 0),
+	SOC_SINGLE_XR_SX("Transmit Timestamp Counter", FSL_SAI_TTCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Counter", FSL_SAI_TBCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Latched Timestamp Counter", FSL_SAI_TTCAP,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE("Receive Timestamp Control Switch", FSL_SAI_RTCTL,
+		   __bf_shf(FSL_SAI_xTCTL_TSEN), 1, 0),
+	SOC_ENUM("Receive Timestamp Increment", tstmp_enum[1]),
+	SOC_SINGLE("Receive Timestamp Reset", FSL_SAI_RTCTL, __bf_shf(FSL_SAI_xTCTL_RTSC), 1, 0),
+	SOC_SINGLE("Receive Bit Counter Reset", FSL_SAI_RTCTL, __bf_shf(FSL_SAI_xTCTL_RBC), 1, 0),
+	SOC_SINGLE_XR_SX("Receive Timestamp Counter", FSL_SAI_RTCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Counter", FSL_SAI_RBCTN, 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Latched Timestamp Counter", FSL_SAI_RTCAP,
+			 1, 32, 0, 0xffffffff, 0),
+};
+
 /**
  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
  *
@@ -1010,6 +1042,17 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int fsl_sai_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
+
+	if (sai->verid.feature & FSL_SAI_VERID_TSTMP_EN)
+		snd_soc_add_component_controls(component, fsl_sai_timestamp_ctrls,
+					       ARRAY_SIZE(fsl_sai_timestamp_ctrls));
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx-rx",
@@ -1063,6 +1106,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-sai",
+	.probe			= fsl_sai_component_probe,
 	.resume			= fsl_sai_dai_resume,
 	.legacy_dai_naming	= 1,
 };
@@ -1211,6 +1255,14 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RDR5:
 	case FSL_SAI_RDR6:
 	case FSL_SAI_RDR7:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
-- 
2.34.1


