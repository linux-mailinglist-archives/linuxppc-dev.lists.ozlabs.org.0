Return-Path: <linuxppc-dev+bounces-16217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEtcNZgwc2mTswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65272702
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy9xK0zZHz3bTf;
	Fri, 23 Jan 2026 19:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769156757;
	cv=pass; b=dzxh0bxX7BOq3TCaIlbfFS8Ftc+zFl0iASHNUtyrc2+ux/V7BHB1gJvWvKAlbDKb0+c5/Mf+tdCYsY5WySwZOAo50afiw5QClqd9HbLKwyLItjxYGCkRsBXXtdJNjxe9L0uubbcBEorPMrjkqTHmLNOvNAV9ro3bTLS3NFiW6cbjPhAAlpLfkWykNW9OctWTiJP72JsmofMt/H0xsvecILoEiGR8qnBe1YcJhnjxxT0wsvvxxxqPsoQ2kJUGqqEKIT4OvY2s2ZwUf+SQZtLGClue57iTAmxl4uySROFgU/NZERBCW46mUyNYV5Ldx0Bv7Q4+HakUSL67LWGKhkMfhg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769156757; c=relaxed/relaxed;
	bh=4zGuRTSFtlLXLV7ehJ8CMU24KuXdASofWlVMIORCOIE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HU+qbaAbUs0O3YhytX62tqciWvNfHk/KH/+44LW5RVsm6LDarBVcjGLwYXfEfmxazfwvs6i8tMJ4yTIzD49DQQP2k87XSnYEw24NecvTp+CT7H0yGmBGXV+whMjoCW+Pe6sYTgegQc2vRAxoAbRztJ8iPHDtDrNn7HfIHbTs4mru3S45XW3BjH5EvOABcqLRBcw0DtCaxN4wC9r+d7jt4qkaWs3D//Z8h4a+T5Jjqmia9h95DadXqkfY+35xAYRpPyRp78vZIDkCQCnA6arDOk7ePyU9NNi1FRhlTaOyFst+SuVo7B9tMmn3FAIZ4x/LW5bquv9QPyfif+5KgGGxqg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EGcEKd8G; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EGcEKd8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy9xH6S6gz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 19:25:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc4354852dCRx82Urk2z8Ka5rbQXeWCMS/I/Zmx0BoPhJVcdLkO4tXFN2o/njohCjQ3SGzUsODNBc3NbyTGrN3ew8bxlIi1AtNeLb5dsJl0DLOIvN7gmRjND2EY3z61lwdXbEcik5pjaOxuvfNeKXeepkvWNq3ADyGu9FjeZdfsim6ex+i0lLE6F9Yeid56WUCa0DhUvu9k+XMd1IDft8nj4ddDFeC+tgAHsIEd+W8C/Ys/prJDRwz575nyfIv9kocsbZKkouDHCtWrpnlBjlVIQR46hapNWqL5J2BAmqax9mkFeH/DS09jdXNWMk/c4DgNj+0Avz1SUxLgBoCDHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zGuRTSFtlLXLV7ehJ8CMU24KuXdASofWlVMIORCOIE=;
 b=oQ2XPscIe5dECCbI5s2qLcJIbFVppm+by9+GVgq0cvVpeU5tSGpqg+E8NSlDSauDsZI/MEPVPc4r3UUyWjXjuKvebA7w1TY+Cqr5eQyWb8Q5kMElmooZIVtTGtsqMUh7H1sV4seWtABRre6JKqtk3g3REJsI1QTmKoNo4TMuyNfy4wz16hgU5jh6vtfoWVBXCqp3PPLIjKKFB/cWlEXgIKTkH1yT7Z1cfOh9Ynl2TmDFuusDGboEgAjYa/qlvqGClXJwH0azMn4GsrcSBGU3qle+Q1e//TRPl6tg3rwMutvMZ4Bly3+fmZScxuKx15cYk5VB5iRv8XC1AI8xK54RHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zGuRTSFtlLXLV7ehJ8CMU24KuXdASofWlVMIORCOIE=;
 b=EGcEKd8GshWnUprQKbJSxGuDgjATAcIrCYMkXHjoRS3waKMtCMS8o2EV1d+JeAWm+mz+rvsceTqbb1y/YtgfDPWbhTRCLV+5R/338mz5b5zkEGqdivVMK32Gbz3f8R4yydlXlo9aUDeOB9VXFpwWB5GltSxK1sxgjf9He0RZnqCbh3Ubcoaw/VddGVBicz3X1MMde3ztxM5M0bVNCQ6Sa7eevxAmz4BQOzr6YKVdsKcRQemf1T1D7CLuQ/1+H0tcyDEnS882rXfQymD7SvWGdd7y0EcAG8YCIhF8Hx0NeJEOVVMWZ3UIAw9gR5iAyaEs1E4UAaxdWVUtd5hrakYTig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:25:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:25:27 +0000
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
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] ASoC: fsl_audmix: Support the i.MX952 platform
Date: Fri, 23 Jan 2026 16:24:57 +0800
Message-Id: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fbb7c7-b629-413e-9f6a-08de5a58f681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REBwf51WVlesZA/hch2fHxCp7msp+s6Ut7h02CmhyxqYfI8CffrbWpxy9w28?=
 =?us-ascii?Q?V2OK/5i7+f3jbNTQXu9rwtGZkyqYvzm5n21ItHkPC1v1dqw8Bq8AACSb0Pu7?=
 =?us-ascii?Q?6Rb6SuIxEuUCki7petFd0Rm1J8vH3Q+95EUHH3R2+7Gc1ZwMZFlvi6uUCQRo?=
 =?us-ascii?Q?KoJEdPOwgWOjrUXPTaiM2yLV2TFEm0ofhyJ86AHFRuDVcImXZX+W2nTVHeuX?=
 =?us-ascii?Q?tYwm+G+4NZDeUalDpsY6T79oQMLEEUwiN13ybv6SJQIPTK/rE3M0Lc7fTUUR?=
 =?us-ascii?Q?uRHhlp6728hh6etxbQDMa9SY5l6XVcHFF9Ytq+Nts+F6FhQAD6ZT1w0ivwMW?=
 =?us-ascii?Q?dj+pz9DNrn5g2rU1mADQV0I/y747y79G7IvFfB0BiS5XZ3+E2dOul8eYLpaX?=
 =?us-ascii?Q?5IK19jj4vJYD2vbaHMkl8Mc13tlq3jDXp/3Ke5ooaMOG4WmHtmbghf1FCJ9p?=
 =?us-ascii?Q?eoZ0cb/EMi3/zax1t54eXg0TNVXiyMvoED41BmP7BHbD3dQ2Lcs9KQwLJ0W+?=
 =?us-ascii?Q?dW0cElbLiqAWLRf/jXh4klRxxLi0m1kOnN16uxSjfRkRxn6lFUDVpWnYRs97?=
 =?us-ascii?Q?WV3zqy+hwxHLcoKjSOIdnGXJnMeTklC19+mpqJgRsdfevczt8mXQkQFFCyoY?=
 =?us-ascii?Q?FqoWR7DxCvH/Lm8K8i/4xs8b/8grjH3zwPKSBCSC0f+xdElCy/GHJ4HB8plM?=
 =?us-ascii?Q?dXke2YaiqvjVH8mfS9NpBqOxZktAl+GJiYVYuKp4qGbf3zobAmuVYdUyaRfW?=
 =?us-ascii?Q?XutAuulgRz3u4ojxQvv7snVu425UBNmi9d8qCNNThxqod+htUTSKo3/asOox?=
 =?us-ascii?Q?HkFUnvYUi5frqMjk37dVp+pcPl+V7OoHULJvBNPFRrGPj2Xg/ROEtNIgLsB0?=
 =?us-ascii?Q?e/Y7joOyfUbbsPVBco5W/8IsKHxthH5oGLQ6PTkWel1adac2HPr/PokfndAt?=
 =?us-ascii?Q?ZuPEl8w1MmPey6p3W340/h1DJ5gj7bonJKFhE9mBLiRSz9UokbEQr1Qnhe+4?=
 =?us-ascii?Q?CwgI28Sfu4BS4U3vsorOXDB66WrC+mEmJPzE6QZSqh7J73rNlO5RJJnSVHxY?=
 =?us-ascii?Q?892LgopQqeWpuKZkSupwdcFc3uWU6EBrYLbuNe5S7UZKHhYn0SNpx7dsY2nJ?=
 =?us-ascii?Q?KQl7RXVzeCd4sXFeo9VbBArG4oF2xc2XcrfpTAJC2bU3NiQ97QfQy5vAzNJk?=
 =?us-ascii?Q?u3b15zcSs0QsBs6o0mgjbhQk3TziMQ/BAiprk67s9jNVA7KceGyOvpHYJxT1?=
 =?us-ascii?Q?JjjJAIoLadumBK6597cB9hc7i02f3pwz5D1u262I3lLvY5AevQsxZhIBBJN9?=
 =?us-ascii?Q?ve0VZ6Qpjt1Sbg2Y1eIPfLhez8Pz+EZJ/Jv7ewnOevG9Hohmpr7p9FSDszVd?=
 =?us-ascii?Q?TcotBqL4Je9vMxXNXWt5pZnbRT82VCB4fNZ2rPw67H6LeeMeuqiWckgffQsx?=
 =?us-ascii?Q?SUbG3jxo5q75Zu9azJOT/n97NVgD04WMeOiSn1R5X1uqV/hsjZvsZ+oYF/QB?=
 =?us-ascii?Q?vQ/0XEQhky17WsjYcyyI7rcVIA6lvoryu5xudPPFd6Mx82eIiBB+3pvWAGth?=
 =?us-ascii?Q?30H28Jvg+S2dNnsfYR3rfbP9K7Ia1CSctlSW9q54LIthCVVQF95Nn5adZKEb?=
 =?us-ascii?Q?gZ8ufo/tm6FHSKztkZ0YzCfe8Ea8ORWlC+FzcBhgStjk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BhmAksiZLK+Avun8mM4z5NIOwimboB5z2bqD8BNxRpLORIrr4sZGSlnrTAIY?=
 =?us-ascii?Q?TKIegUMu5NO6XpOc8Rmf6GlbffPXJZO6UuKtnJy5ijKFGZK9GiMGESwMF76N?=
 =?us-ascii?Q?oDCALr1MzJiB8FFSwZxLIeoBJYxu7mXauXPP6jXS/2J5zpx1eqvWT5Hdz8fR?=
 =?us-ascii?Q?IrmA6j/IVGlXqfgB3BdWey0bGReD/hwx4YewE9nQcMC22wqhWyMQ9JGJYcn0?=
 =?us-ascii?Q?C/uE0UKFy2pqDYU4SGDNf7zHUWYIuKAtp5m0BzwlXGgGRlKAT9CmqDB3WHNz?=
 =?us-ascii?Q?tCT2VKLLbP+w/Q8M1kgOHWyrHXJjtvDHIUbzloWJ6fyDukGpSKmRLIquOfbV?=
 =?us-ascii?Q?8KiCNRVSQdjiFyfHNQHNq3yQZeJCUf5LN9cVfC6fv6S8lsa4uNaoUmf8X561?=
 =?us-ascii?Q?q/h5w3qxkUAHwtBy8P8ogxYepWv6fDr4wn6OB1HWMo7RKkrVKNDbQ6nGLdkG?=
 =?us-ascii?Q?M4BS609VyCf0OE1MjOtWNw5cWGjOmGfNrJ6ee8ZC2x6QeutY/eEf8/jhkEze?=
 =?us-ascii?Q?Dao/cQIkMX43wlQVix5rx/ORIJ14d8pCSFVKJcre2To1wAqA94GCQllyg2oM?=
 =?us-ascii?Q?kRDMhAJFCGuKdRp2CUdgewCC46LkZ/CfwvxVsBDvBSUG0K5UDT0lgbdk4cY/?=
 =?us-ascii?Q?UQtOAoQvVz8UrtpuY7onrenNDiViALDbodWKfLTvjqBpQCmtqWYCg6Gm4QQS?=
 =?us-ascii?Q?l6KOEJRh8XkZfyU+VUPwDmuSzxcMM26WgWHUMwSX4cDCTq0gpyjR2eX/z9yA?=
 =?us-ascii?Q?rOUZ4hJhu/05uFCzFEOjKxPlKgIilfWYEFTzM1sSP7BiJyOVx7bMv0SQQiJW?=
 =?us-ascii?Q?4vemCXBsG7l5Q/UJNf1w9CJzIqven21/sX30W8qZORHFdBz8tkosW+S92Jhl?=
 =?us-ascii?Q?x8c4OWfLasICQIuyJQ5yRXS/eBPFkc1Fyi1HXUHhwlZmM3Lw7+MwO9ywnHvr?=
 =?us-ascii?Q?H7A12iEhQ3SwNDHL0PUyrRgZXJMgfCDVSdbV1hbTXw6Bjqt865rGS0BjfZeO?=
 =?us-ascii?Q?sZj6vmA5Nz8xB6eN+FgWczK+evagcrwuhZmG68UxT67s1cku0rY5jbKPkKRl?=
 =?us-ascii?Q?l65nWuOEx2QcUaqwcaY+jhBfY+ofmE3b9JKbUzUhnRAtElgjWdo9WFkN5s6S?=
 =?us-ascii?Q?zkKbrD9oXE6d6aLGsHBtDvawquVUXjg2Q7awMgVkcyD2fEPFKthBeT/eDv9A?=
 =?us-ascii?Q?zvYCG5/yl6c7zsokytghJWHB80EKPS+8MdB/NiiaJNVig7a4rcTD/lggaXqw?=
 =?us-ascii?Q?zRMJ9d0wCDSnn2fi9qx3rtnAXnNWbkSXWL6Po48YH8K/tInpDkjrTPYsWzpD?=
 =?us-ascii?Q?aA0UNG+ngVfs50n5UdbzPyZLw4i/pXSUWgMsQCNcEJVLntA5CUGgamLBCbxM?=
 =?us-ascii?Q?92Vlug/X51jJwce4sEQ00SIucbFptSWgd9sXDKyMv8ufVmCjugUw7363g4NY?=
 =?us-ascii?Q?YwBO6lNgkTDU+NqJdUiBt3hSlIu6P8qOMqKpmI+ecyKKrUs9G8DljAo7gXuY?=
 =?us-ascii?Q?m92SLJXuBQ/4Jb79enVml+gnVHs8vF9KR92UBBEbEkea9tAC+OG9H6CsQJh9?=
 =?us-ascii?Q?bCrr/q2YVVVplAc/3IHTKGyB6bEw5455AwCDhNRc3GesVpS54l4su3UaVqSb?=
 =?us-ascii?Q?zfMDkNUAy1aSFcip7jPyBblPVVEB6xVTFbkCRURwC+p9mylakQ/HNMJLZTPd?=
 =?us-ascii?Q?fYS1SG8CMjPH0sQMtrwAPvp81zPtT61MrSiqdv6Oz0nFZHzs+p5pTO191NWk?=
 =?us-ascii?Q?6+Kt6Qj+gA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fbb7c7-b629-413e-9f6a-08de5a58f681
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:25:27.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqahAc/HCe09AzzZW8K43s5F8MLfVqWA1e/8HUkaqSikVVtGPsbsgSwpSavX4QWRugqTRuZ5zGKq4fCmKXisCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16217-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.863];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DE65272702
X-Rspamd-Action: no action

Enable AUDMIX on i.MX952 platform, update dt binding document and
driver.

SAI is connected to AUDMIX, and the AUDMIX can be bypassed, so
add 'fsl,sai-amix-mode' property in SAI binding document for this
case.

Changes in v3:
- refine the commit messages
- use string for 'fsl,sai-amix-mode' and add default value.
- update driver for property change

Changes in v2:
- Move the property to SAI binding document
- The property name is 'fsl,sai-amix-mode'
- Move the code for above property to SAI driver

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
  ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
  ASoC: fsl_audmix: Add support for i.MX952 platform
  ASoC: fsl_sai: Add AUDMIX mode support on i.MX952

 .../devicetree/bindings/sound/fsl,audmix.yaml | 16 ++++++++++++--
 .../devicetree/bindings/sound/fsl,sai.yaml    | 16 ++++++++++++++
 include/linux/firmware/imx/sm.h               |  2 ++
 sound/soc/fsl/fsl_audmix.c                    |  3 +++
 sound/soc/fsl/fsl_sai.c                       | 21 +++++++++++++++++++
 sound/soc/fsl/fsl_sai.h                       |  4 ++++
 6 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.34.1


