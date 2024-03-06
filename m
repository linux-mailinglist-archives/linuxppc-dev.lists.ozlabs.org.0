Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA22873010
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 08:57:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HEM4xhsp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqPsf00syz3vgp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 18:57:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HEM4xhsp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::613; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqPrx6Nxdz3dRl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 18:56:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2UEUQydOrMinr8GovqQW/caR7GWL4bTHezQFrfHOrkpI1aP7/r/B66sHzqn+/Pyep5+FbnE2YBm9QG2KejiKOh0fN5ND6zU2B751kk9fcre5fYNqAWAmzgBARyTmjigQau7O/gyafVxsWmD4R63LOzevmfYkep+uiYCqA6AGCOEFU5ULZZjpMdodE0QGlAZBRe0zdXrYc2HpKVn0g4UnKpeAM+NV+qnbFrqvy27ExeKzD55YyFnmJcxHmvU8GugnZQIF11rJCXfKLCFWl0Bq3HANTHV231Dsu1bN2IjDR8QperApJscjAhoy8+tbzBatUB/iXQctv3VDANN0XRdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KogfI+Bwc+F6tW2umRyYpttJgjfLzTfDgR6lxTBBDFU=;
 b=R1QzG//alN9RKZImIll2RERczET4ovc0CBG60ZMQyXIOu32/cH0EvyPI3oncQCTFd098wwEhFb3QWymtQSXGBxIbARGezHCfQLBqIldCk34yoPzd1Aa5AHJkej3k3+YkfeC/ltc1BoNzN5mpmuIzlSNKk7hjkdr1Dyb/cruIN9JMbOrEI+h3qURz9ANUCOjiKBDfFDeWSAqeY4i6MmseAl0z4+l/5RlPqLIDPwSlgeXS0HqKz3VNxbJlQHvx9YUvTXdYCyY49XqUoFt+BrWRzWwKZ7eto278bgifPWHBwA/3g+Gx+JL23q2Tl/J/zrR2yuHfuYJ/A4QzxmXtobDs4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KogfI+Bwc+F6tW2umRyYpttJgjfLzTfDgR6lxTBBDFU=;
 b=HEM4xhspZPvzNKto4xLbah924lY1vw49i1YtT379EzDtM2edoTdsUTr7WFMkUhBUg5MqC6Q2VaGp5dn/ZK0VKwZqpJ1Vsy6UTtZnUjqZtVmpjLlofVlppTLgQgXCPtIw9pHWUGD/Ln1Yf3Xc70XsVNS8h5SNx+7/YueaBXhSIPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:56:12 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 07:56:11 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] ASoC: fsl: Support register and unregister rpmsg sound card through remoteproc
Date: Wed,  6 Mar 2024 16:55:06 +0900
Message-ID: <20240306075510.535963-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 38389de8-9272-41c9-b011-08dc3db2e384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gtgctc5BgGap1/+LjmqbF/7ZkmSyHzpx1pFubDmwcpuJ44zmrTBppK+mIUnEHPwCe/EKP/aunQ4sWonjcUPUgUXYXTyLWgHpjbraUuXdyy4ZdKUrbacAbpB9mmMbE4fGKUh8HRO23uwm7GwjJ8FySHn0e3YKq0cESP2EtKI6R5ivBITikiZem7EmnE+wRTtZLqxPy9j+vMX0ml7oSHE16BUAwKcDUoX2OwlkfufRfw497KvqApH/WjAY7/AbyeG3Mu7jGMNh4h1p+bGPURrbP8x/x+TvFKamc7rxHWo1RNEcjmn+VoEShE0MQ+X1fN/tKvUt1iPFnmKI0/LLXoi71X7y3QGENC8NvSFelR4fsaYOq0Emnsjs/KR/W3fIVb1WyFNLY3DniW9ArZUe1wwQMJHSZxQwAxeDelBrUwCM0rtyBFodCiPvvopEh3a8e0pH6JRsotrmF0SBrGhZ95iPYFwLdFsZdE9i4KqvseyZFuSjXxcMOraH8VrYNM1aE8AKhHHGBqXGfkjPPnA4MijjBK+EgSQbId96wO2epz74l3GjSPny9dFt0Imf0o+biAWuiLJiM5nyXXUIleJAYT2ijJWbVCWw9uDpcVw3nXbYoMAq5TyeMHO5qMZ4r1gSVEA8aJ/2LyhfCqQG3ppl8oQsy8jM+Tka4aAG1v7lDS5HIw6zXHypwi08WKPN1K1BMQMcZF0tav3sw/CIyx/LsnwP8qEfqpohNqs/cTZF51LU2V8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?38LmUDWj9toWTvdkZ0y+GK6VSKf+s/26wED4tQLO8CFG5kU1nWm8iZUtiHyQ?=
 =?us-ascii?Q?24zgZngmFxmRFv5yGYknOa2I1qRE3eR0OyQbEtilO4jhKyr31r72410NAYKt?=
 =?us-ascii?Q?+Hnf8z069H9eoCL3cfqYY1TdI/rx/d/BVYtZTuPjysAeIFobeHoOCcAAy4Ot?=
 =?us-ascii?Q?Y3iI/MZc2TQBdyuYUpM7L8oNOCh9p7DUgvrhQ9SGztjI3tZLUZuJe/Enpm1W?=
 =?us-ascii?Q?dpVOHBKo+QGwkkfvDvO6cuDyVPjTtYezjy8OgplATS+woBVtA8kNkO+HiHg9?=
 =?us-ascii?Q?jJW/n7pRztq1ifxkLzadYTuCBsHlrOZ2/Iqu2I9CN9wepZsTpO3RknbTtk5a?=
 =?us-ascii?Q?dMro5HcPxnJKHXlyYOO7EPqXj+e6aBUmkjd3faEWGRyNiCBYFEyjlkqbYiK0?=
 =?us-ascii?Q?2N6x+pHIbLkTh6Wp7Eje77zktloXTEM9BaStZvozT+VmOLN4eYvymFteoxco?=
 =?us-ascii?Q?j/Wy7/7+le6ydv/6C+4uGopG0TpI2gB4CRrlc2s8mh+Ck6cY3vt177lSndl9?=
 =?us-ascii?Q?zBgYFcNoZ94cSq8kWZS7tnemsHDyCczInHQjpDr2FgJE2F+F6FaQSJ3eDTEx?=
 =?us-ascii?Q?rssmkZcAw9vxpFPkCv6YDEIknGqlWM49yob77besRT2wVwjeNMXV2yQPvItY?=
 =?us-ascii?Q?BtBCEhCzdwneWFncSCFsTXvPq9P1EEEvyguVmm0CI815F4BbUuduoBHK91CT?=
 =?us-ascii?Q?FRNJ5bvPcaWQP2xnJZS/QePPoVthvc5FKO7pTO9W8AO9uDV7u+E24djuXM0O?=
 =?us-ascii?Q?pKQn1b213f1+7YF49b6RRz+yXKvDgXf2+qwXF2fHoZyAoDbu4/Y0DLNSdFFz?=
 =?us-ascii?Q?LheHK/b+NWytpm4CDu8U4DjW8w8DZbyr1tCo9NT0OIrr5UX8ZFcKR6u763Am?=
 =?us-ascii?Q?pNlEBa+qHv1HqQ8DsEPdIKcL/RTGMqk/h4u5eTAc99ZZMof1Zy6bob83AyGc?=
 =?us-ascii?Q?OsM990uZMXDqkqs+c6DsKsF5g1PmyjojzO+GO4Qi0MPrNm+DLCdEPL264lXH?=
 =?us-ascii?Q?CGt286nEc5nD3Abio45ax0QRWfhtb3dWZCoL9MFfIFOfn9P87yUybp2y64kk?=
 =?us-ascii?Q?LQ8k7NR0tOh5T9Mc2TjDLVWxYa/p0qrnShci+6o7500CYVhhcY13jjjbClZk?=
 =?us-ascii?Q?jeVZ5KnfQhti/RN1f1NdHAnMr3/N5cnxDvl0iAXAL5g9psGPQHiiQOyKSBNv?=
 =?us-ascii?Q?VDtPxOsg9685xdGMdRr7K3vhphyeLOOKHLh0DS1Zr7URwxenmU1gzIEWw6Aj?=
 =?us-ascii?Q?C8r4rdkhJPjtV7Mh6kheJPQgPRGS09EWicSwpQL8tao3ECwy7GtqxTzDGASs?=
 =?us-ascii?Q?mN4cLRNh0hdpqJTZBHmbCXDELnPAPkariKWrb55uZobs4Mea7AO7VVdNsb6r?=
 =?us-ascii?Q?AC3d/GAg4IBklemE3Uhji1Yx9HpZrKH8+onglrkOxnMOcsVnDta0F7Tyr/16?=
 =?us-ascii?Q?+r0XK6pfQ6Oo3u2b5FdU5A/zbd0Qqjfu69kUJQNMLlyjUrEZWIqb1lkZZ+R7?=
 =?us-ascii?Q?joMvtRTW9QAPnf2d7y7aZkLgSOKrdRA4zuHXo5FdRj8JI6mUHi+hDDf9355s?=
 =?us-ascii?Q?6Jc2h74WTZE5T1gtb5KT943WWtj28eJYsHjNJ2wN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38389de8-9272-41c9-b011-08dc3db2e384
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:56:11.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxtT8zOpNWqmqvS53eLPPkMFz9gZmLQtijnrR/7lF4q8ajUCk5Y+ibW808WV1+rHFN4ysJFNyzQE4kCI5zkElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

	echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/firmware
(A)	echo start > /sys/class/remoteproc/remoteproc0/state
(B)	echo stop > /sys/class/remoteproc/remoteproc0/state

The rpmsg sound card is registered in (A) and unregistered in (B).
After "start", imx-audio-rpmsg registers devices for ASoC platform driver
and machine driver. Then sound card is registered. After "stop",
imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
driver. Then sound card is unregistered.

Chancel Liu (4):
  ASoC: fsl: imx_pcm_rpmsg: Register component with rpmsg channel name
  ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
  ASoC: fsl: Let imx-audio-rpmsg register platform device for card
  ASoC: fsl: imx-rpmsg: Update to correct DT node

 sound/soc/fsl/fsl_rpmsg.c       | 11 -----------
 sound/soc/fsl/imx-audio-rpmsg.c | 22 +++++++++++++++++++---
 sound/soc/fsl/imx-pcm-rpmsg.c   | 11 ++++++++---
 sound/soc/fsl/imx-rpmsg.c       | 21 ++++++++++++++++++---
 4 files changed, 45 insertions(+), 20 deletions(-)

--
2.43.0

