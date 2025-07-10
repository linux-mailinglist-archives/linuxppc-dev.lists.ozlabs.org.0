Return-Path: <linuxppc-dev+bounces-10167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B266BAFF751
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 05:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd09k2Qg4z2yhX;
	Thu, 10 Jul 2025 13:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752116794;
	cv=pass; b=nZEW1H6T8A8t1vhaBtbKRxKlcXTee3WTMr4QIRXKXoYaedJbe71oYCX4KDLBZ5++WLOhz765Zr1qRe+WmVTjZx01uZ+Lzb0uGqRCJngvJG9X/Xnk6PMjP38AduWamcvISiPFjUX3J6uXmDMcisV4X9LCWrGFpdWxfgwEo+vkH0jZ4viKy3sWUBg+hf4pApL+aKxDfFLnV1+iF4m3Bqy1r+CkJY7HfPyQzyseK+LEC3dQq7l2gngntzepBtmcB/BVIVtLaP5296JbrxDkKz4slRhgPUKCmArmPXkDfAl94rDUM05Ohtmy2IJNaro8vDm+25CGcKmk48grDfPN1tqT4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752116794; c=relaxed/relaxed;
	bh=r/16ruogJwI38w9BJuL3HyQzEoF6VaasiKZlobU9QzU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fMrWFrh/XaUQi4kr0q1Nnb3f9mZYhYEDh/JHk5D3f3+Rc0CnKJ6wVlc1wx1qmUQg//ecnC7U/xp7nym/3I2iazNWg8LPXlcQ7V+PRfYRvvFujdOV9HrLb72q8BSheWQ4vVIKyifNbH/Bji8KDRwvGmyW5ErhrsdptnLqwmyQGHpndalXLKPBTwYedApdCYY8+lGJhT8aUhjRfk0C8P65kp2upGhOeIbUrxg+Nso2zrYco17y4RWThHVGxfqbGkpOJM+iOfZYQKgoOh0S1GMI4dzDkb/gwZfpXQT+XovSKpkLjZWBfQxD57Iivc9aJrTB4ojICrGm90lneF+qksq3WA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oKrWOCKt; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oKrWOCKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd09j5b4bz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 13:06:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN61l+72DgzjojCZGVHQgCsBRpHQ4KFu/kDFWdsQygK6N/UjQN+2nXaywisFw3heOA6J7zP9Brvv5TmQ9EtlEdsIQT18c8qTXYOBlCEfKNE5Q1c+ycEv80LHMD9Ke5zc2RlNRMqOR/Qp0f5s7H3/GdNJeWTJ80cSpXUOEbV3yYaxucKS6D84czOmUTJH83LEGS/OcYFG5GOkEamFxa2rVLd9Utevz6Wza8BlPlnWZ1PMjUzwi0zruYmbsJ9mJKm/L7ZwcIVUN9u0ZeKzoSdGK9pMAqyOnQuu7gMFtAigMdaLSfQ+kLLTlUupHLg8W2Q2U19chgY20daz2BNvM0QL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/16ruogJwI38w9BJuL3HyQzEoF6VaasiKZlobU9QzU=;
 b=HrR/q/alLW/ypjtzeO8/VRwfj71kHgQeuINS7VJ5RGL/+TdbJNcCegajRsdgjamdxqe4xRgpCg9hmOJqbRp1Y2F7P4hHLaAtuSF0mcBBc7Eu+8/wQ9/b9F6eaXwp8eAVF1JriiRzHT3Cwbg4+awtb2u/goEQteMIMEsv8WZDHUgrmFYXzNYglzSCgSOnJ6Qi56PVS3axzxDQbtMuinf+xBEoKD+pd+hcGPJVuKIAzZOn8FASgwsxSRX9dUwd/uCDCS7T+9rhPOEeSi21NI3VAbWdf7Q4g0JqTjkqeYI9TdOIo/MMWHwkB3pK5Y3v19bvvIO1QY/Y3x8UxJkcalXfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/16ruogJwI38w9BJuL3HyQzEoF6VaasiKZlobU9QzU=;
 b=oKrWOCKtI0NLLf13xZaO4AwkEJWSR90qbAGC1zNQVt4EP1k/QNc0mC17XIvFno7NY12CqMfDhreUR/0ZsJhZS9BCRUsZqvVR6cOw9fQH802+jR6OMnEnqGxxznSK4w/2Z5zrQFTMCwPPc9NUaWr11lnUlnFfwpmNjClbQkVqMkzz2mmm968pJmeUndzfWzvPyFwc9nrYA+XD6QKe4ZGE0rO0A5/9aEt/x9+QaJ6q+DtadA4CdO//Qbddk+7IZzQQ+2hVx4dCtB62yadRB4kyCLoIpcdXJzKA3s09K8pqzf/UK0QAjG7EqUUqggtEUy6uGzYBpjJEU3pFzTkskVsEgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11221.eurprd04.prod.outlook.com (2603:10a6:d10:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 03:06:10 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 03:06:10 +0000
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
Subject: [PATCH 1/2] ASoC: fsl_xcvr: get channel status data when PHY is not exists
Date: Thu, 10 Jul 2025 11:04:04 +0800
Message-Id: <20250710030405.3370671-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
References: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: e2abb27c-7583-46a3-684d-08ddbf5eb88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZvGSZKZ+uL+VG+nYbgDvsjc85REmN/MM9MdACPV347zPvD8MKqGQZ6ZsOnD5?=
 =?us-ascii?Q?9GaHg2iQ457EEhr+jHzHuWVS6jPBJnOaxM7O4rB4lkjlzb88/EVNnoR8rxAA?=
 =?us-ascii?Q?nSAE5IEW2EYXcTShKdI7DFq2Txf+P8TWJlHzetZTcLQZajvO5RGxbSRmTGbB?=
 =?us-ascii?Q?z6VMGYBY1+zKm1/5e+xG9P6arjM43DI/bLyeR3JPmvJ6iGz1qPUhnWo+gZFB?=
 =?us-ascii?Q?gRmjjjtX/aV0+mLXfkI01MGo+CqXNbr6vVkNBFTySjJqoCbjXlCMbc5LFxzF?=
 =?us-ascii?Q?lq9zc8cTgat4PY5KFbdLhP5HEj96sBgZKDOo87W+Vrr8wDw9zdSBJOeCJ9a3?=
 =?us-ascii?Q?iaa+H5Mrw7Xy4d438Xh4uzb4O+WpUlrQIVq7iaad/vcL3zoTJawiQz2havFr?=
 =?us-ascii?Q?oelUObtNvDXybCSUlcJJ/MjxGoQnIWibbbuMF6TQBQ5Py2s3BG3VVFbovkTE?=
 =?us-ascii?Q?eofGr4T7qWt1B2lTLC4X2FY8aKLXUpeDf5cNOR0OguiFBhO0OLHc/zoqziln?=
 =?us-ascii?Q?biIfI3hbShKRW1WHQzM9wq0F8ZVScxmVICmi0LPgpWkBc3odyaxE/CxRkCmz?=
 =?us-ascii?Q?uB4OcpHHasiooyY2hTCAemLt34fsr0cGBWjTgwQrFvIsIUVBPtNAye3op4TC?=
 =?us-ascii?Q?xvdz1iH1IysM3/9G+AuvUBKprmNWEWp3tYpBsrM8ZC7puj+rVFWmc5MN/Hkh?=
 =?us-ascii?Q?9g8ENFLffDZ06DtQ/A3mx4hEISXO5R1NeNneHTAtCz237ZJuzJaMlLMsYJAm?=
 =?us-ascii?Q?ioryqmaC7pIv/1oOUaDf/i0NOW1AVn/kohTQE6UcltcyWEgcCUUH7SWcuWNx?=
 =?us-ascii?Q?OEl0psDu6XzAJNIhQHeWbyze3gYXOjGh8/zIW6v4AzGLJhfNdIsW9o82QIYH?=
 =?us-ascii?Q?a8tFo9OibZpqzwUvbuldanTqJS1YH5JZM0DJNg8eSkxerjqLUOGrjsjTlzBq?=
 =?us-ascii?Q?wCIcsj21km+Mo/mJ5I5SNkioKS2EePjdRvYb3mgHLoNWxRoUofKCQI6dALxK?=
 =?us-ascii?Q?aeh/QltKWQHb/dbiOTHJlZeTbZIrzsmTx6sPoLkM5wbEMN47k0eTtfjk+XLt?=
 =?us-ascii?Q?bXMXe6ShFJ9WOpCn+UdyvtwctzVGpvEN4mU7DcC0RzEOqsY14bNKwEzL6xTm?=
 =?us-ascii?Q?FNCE50SBWIYl/gu3H5sinVdh7uEDxAVBI693mEKvwjv53NobIG84p4fy3Qod?=
 =?us-ascii?Q?FVjRva5HxZ8rxC+OTIrM/d2Qst+QqECc+NxXu4J4e+jqTBJj8oTfCOkMfZMo?=
 =?us-ascii?Q?RwCdBPX1MQeEJSoSak/+tY1kWCTHyhmlhjsGmt9JtMSN3G4o1b6H0vE9ISJ2?=
 =?us-ascii?Q?qYF3HPlo8MxrUbG4mrzx+7W6N26hNvupLcFv0SAREJQW9L/edFq006wC9o4U?=
 =?us-ascii?Q?aFKGKsgatliCOVuxNwQTVSNDNpSWh54RBoFLWhl53UH+4NQcrSgeSHS4m2Us?=
 =?us-ascii?Q?1+CS8oUVABqdJSwrErUk0FGvMzZKVMhFP4dYz4pzssya1bk6xG1c2MH+RBvH?=
 =?us-ascii?Q?IRsLZ2L8tvfyR9A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cLL7oBe51/43EydZnBIXySgPv7LNHvm9Gr4FK6uv0ORg509Jwar/3XpvFXBW?=
 =?us-ascii?Q?CyHdV59XDamIFyN10Enr62ljXfDAwu35ORw+1w8sL1qujltcrWKGnUuMB2UY?=
 =?us-ascii?Q?wp3t4zK6dmrKhEOPvVoSzfh3BuMH7gYI5cELBsZjFKJSXiSsa04b2MdpSIvJ?=
 =?us-ascii?Q?uDuV1DvLCeVe9GfJKJVXWvm89PCJJMh22y2WB/Hf8UresWlQ2ifRY8TpWEQo?=
 =?us-ascii?Q?vs/fzmKFvK5MvbHk0A7xbm1K+iPIEVLP1v9cCBeVdjA+QIE8X7Lad7uUWN5o?=
 =?us-ascii?Q?8+tJE1v7mr7xxb6fpQQSrpZxrcyCfbqlKqH1kHHTTcTTLSShwE8mY7b2qP47?=
 =?us-ascii?Q?MOUzzmAX63lFmIeCaPKfbqA2Yk5Mu0glzkgwpbTmPl6UIRg+gBW3JWofwJQK?=
 =?us-ascii?Q?JruPjQ4Rte9XRzmX6BhWTF78b7aUDDqwnBdTygBQSekblVBk2/Y5Ncp1y7bP?=
 =?us-ascii?Q?MpuB2uMGwu1qApaX8rIfw+YWokcY2IPRuw0sasGJ4QATtkyrNpm30mX8Twud?=
 =?us-ascii?Q?KUFhBRDnUJ7mdiccHJSIQCpqyYNBQIk/wOXBAp8n3izmwkPRpEoy1B83BVmX?=
 =?us-ascii?Q?Imw0BHx5A+iWVXtZ8Pm6nGDdY/B/UiBmdYiv8qTZ9aYW1XTM9DSIFwxEapGL?=
 =?us-ascii?Q?cSh/lx7GnCNtkl2L4WrBTtCAA+0Go/f0lL8Gx5qbf69qRYRSZNzaR5jU+Xot?=
 =?us-ascii?Q?nRqL89p6vOP2G/cCXjqGtWAtiJtfYzqrydWdToeisH6mfT5Hu4gILGspW4yn?=
 =?us-ascii?Q?IY8g/XyoROgaSsaOig6r9OC/3fWrRMm9Ce6bbW/u4A3GL4eDxa4jCs/UundB?=
 =?us-ascii?Q?MP9ba5nrkENSwLDciv8uPyrYShM2rvHtqVHHioLlctqFrSW0hcPl7ee2uFA/?=
 =?us-ascii?Q?VTNsAp90PvvNZ9c8OjrG6S8P7jlClS3ersFYVhV0oQ2GH/U1Y3V9DJoAY9if?=
 =?us-ascii?Q?c47vuuVcBNeLcFlf/mEmxwuGL1DEgNHV/OEKz1JjXjvmnYxg8UVmGn5iLaWE?=
 =?us-ascii?Q?6VKC2D40sTmMjV8UkSdlPJ9LDqzLGovKOD1Eamf3NeHkUVOuE9W0RI3W45Fe?=
 =?us-ascii?Q?MvJg/z63YjxYCtF+YbsZrZswI4zicixeOE+IOZwLUer/iPydb8EPbgXukcRl?=
 =?us-ascii?Q?/TEYyHtGUPJppHosvEkKao+veQ/nCQYTeSUPvTwd5ROxQuaL6HKbCTe+IG1q?=
 =?us-ascii?Q?Wp06ss0rjKTR7cwuJxd8rMOWiR5WZd2NZpQhiqxyNypg7hTkqIXnExY+Mjjv?=
 =?us-ascii?Q?tuk2wYkIsUmIq51Q73WFAav5QguvCkHkASlVMtEN6/O7/DS0fQhhJZRF+qY8?=
 =?us-ascii?Q?7jijrGc46FjW3OgO+n2S8lKTL7jV/95Kg6TZ+a2cFC+XPKvOMPYIMF1jPSV3?=
 =?us-ascii?Q?B/LKGSFAdeoIiD9qXm7Az4vUDJn7+B3FMjm2vhIg6o1eaug21XpYOeFXs7Ui?=
 =?us-ascii?Q?t1F7Ha6luQMCLJSXKmZC3yqCKzYPBAdg6JrmDzg0fcSwFGD7DBGPdvC7+koq?=
 =?us-ascii?Q?UfP/Jz1680JmjY3cKz7nP7/EPDv7ksyhWOlh7KLDk+czW9vAR7YwVB5yx1vR?=
 =?us-ascii?Q?SbJSujc6L/5u/QSXfmBMZpBKkdl5STGwKnNd/+9Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2abb27c-7583-46a3-684d-08ddbf5eb88c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 03:06:10.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB0t64+CjKiMGgBWI4SxFK6eKApJbB+g5Yv0y35WWXdRvD7bsZfTw854c1JuxjUMQQLZ90qaeqjhtux9gOmm4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11221
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There is no PHY for the XCVR module on i.MX93, the channel status needs
to be obtained from FSL_XCVR_RX_CS_DATA_* registers. And channel status
acknowledge (CSA) bit should be set once channel status is processed.

Fixes: e240b9329a30 ("ASoC: fsl_xcvr: Add support for i.MX93 platform")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index e3111dd80be4..405433144515 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1423,6 +1423,26 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 				/* clear CS control register */
 				memset_io(reg_ctrl, 0, sizeof(val));
 			}
+		} else {
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_0,
+				    (u32 *)&xcvr->rx_iec958.status[0]);
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_1,
+				    (u32 *)&xcvr->rx_iec958.status[4]);
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_2,
+				    (u32 *)&xcvr->rx_iec958.status[8]);
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_3,
+				    (u32 *)&xcvr->rx_iec958.status[12]);
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_4,
+				    (u32 *)&xcvr->rx_iec958.status[16]);
+			regmap_read(xcvr->regmap, FSL_XCVR_RX_CS_DATA_5,
+				    (u32 *)&xcvr->rx_iec958.status[20]);
+			for (i = 0; i < 6; i++) {
+				val = *(u32 *)(xcvr->rx_iec958.status + i * 4);
+				*(u32 *)(xcvr->rx_iec958.status + i * 4) =
+					bitrev32(val);
+			}
+			regmap_set_bits(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL,
+					FSL_XCVR_RX_DPTH_CTRL_CSA);
 		}
 	}
 	if (isr & FSL_XCVR_IRQ_NEW_UD) {
-- 
2.34.1


