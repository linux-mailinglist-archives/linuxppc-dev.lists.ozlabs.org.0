Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF866877EC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:17:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=epsLoDln;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZ4n5NfFz3vZK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=epsLoDln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::60a; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZ1C0X3xz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:14:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtAajZDsxjTmJZUTHYEBJdAFtJerbR7DO7CTfZhicV8TzbMcKk4in0QS1Mpoq5CAOorTAY1V9Wev54fKK2qO81Oe/aHpSB4WGLMbnIIOxIEKrZyayYy8XOIeKGZPDXo/Mt8QDvl5tHTXs0qN1psWHhh83SDo0ULNffCn14Ao9jBaynqbx/HdKK+HHLLxBWbuySJ6HMvLMsbNnaOk03wiGH88UNFzjrWkw0ev3in0XIykVuQgUVIdbSzDZnN7EvBzwPmlXHPEp1bms1avr7RzxC8AJ85FidAaYYEJuwOYDpHv4Xkjp314dRn1z86li5uyiyIZSRLhwoDtX3ATNI94BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQJJipniCwgnOqAY7vv++43laRaYv3/NAZP8xipHoOg=;
 b=WB+dKdDa0H1Q1pLgScG/LthkWhurgNxl3VijBOGO1Po+E5tEDK8qjTd45NglF0cW8KttSqbiApsTYuAEZCngpObZMabQtps27mzPImVO7/EznFOLDE/iV/HljcniXa4SmeeUKMpAaxkwo9pk8rfjU0P+xNHpNpor9ZOwAzLkjhpKrLSc+yZJ7+bGqsodR3Si7dwpHZpok2chzl0JdZUEjnMj06k97ZfHugB2TmDDs4VD0x9BOMqTtVc/2JR6hKNCf13J7zEwrMrxU1padwB1HXYZ1Vyovvln5q9FVPJ+eh784joLUQU0bShRJuXft6nU+ctLxI15t6uZCPJE+tXf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQJJipniCwgnOqAY7vv++43laRaYv3/NAZP8xipHoOg=;
 b=epsLoDln27q0+gEz6ZOFVaWHXJfSpZYg9m7vz0UQvs1K7ue+i7CqRgI0hjPusQE9e3DYPIXrY71ePM5D3Z+UwPVEq5D6oxIuMPk9ocZB+j4UdLsEO5svu8YQMN1CGKnm+Qu22EJKGfMERuhSbeh1LIlxCbGpmmvZc5eW4cNz6GQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:18 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:17 +0000
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
Subject: [PATCH v3 0/5] ASoC: fsl: Support register and unregister rpmsg sound card through remoteproc
Date: Mon, 11 Mar 2024 20:13:44 +0900
Message-ID: <20240311111349.723256-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ca2e17-8d6d-4262-b9c5-08dc41bc6486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZzibMeUvp9JVN9FO7mssbEOgIduO9vBUHCj4j1PsKMUJ+rqRGgANnSlsF7LOmRkwxENN+ivLVk6E/tMJiuey6THMOvtz260rn3de6EyI02gZxfY2132M4pD5jxKuQ+kal6BhLBIo84MTer07L4PhVEod78CR6DJ7DNrFdB13VCrrv9FdTD/3lMvqRC3k6KIrEXVMrsUIAT2s+Lzvdn4OSIRno6MQMsl8LloF7/DYTK7GMTRcd+3OMa+pvOc6FUa71hIA1lJqGGhGctl2Mgzl1NcC4BB9NXFr/4hlX3WKCh9e6TPqHoaxXY2D3DUpM2zKT98Vg8lzu5nON+RzXU379o31Cpd4PBhNjt5XyDv5e58YCrkewmmdsF6HDMhJCpm5W9zh3ydKCAntQFnY0i8ash2vClTLjCOhOSMS1AyieTNd16VLV2Oo2zi07hgoVWtX+DCFlmgWW6vJM034hbTwgwDVmzFL4giO7z9yVlWkCuTQ/A+yPXvnp79c7bj8lqGKAUE1gdh+HcBxLJZQ/mKGyZmK69r2jkE2MTIBF59QMI8AV0+HcSHapDghfYAgRRzDP3qaxKadEcueZk7cSkFXQYTeY4+PKGPdv8i5k8vhQjsdRtztzTFEz7NxSRea2rpVEwmbLYVQq90KOfJdP9HPW24LXBIH0DToJIMaP2+erOYOv6E9swRcBn4UXoaVh1Em0mbS1+2ny86EDTHY7T7ra/J2AlbV0ktdWhZJnvjfqlA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lKfx34klrCaqmbL8viSXnv2WtObwdtKDQeozpl+m9+NPBrPvWWArMnIHx0W5?=
 =?us-ascii?Q?/9re9GcdGjZ4PCFkmFyboE08i/FthW/CNIvHM93b/EChglfICrx6rB15fCXt?=
 =?us-ascii?Q?OSxRfPqZBDw6uW3pHe5Yb6Zys41meolCVxgIAMmxTHYAX0BsGiWW1ybSkjsY?=
 =?us-ascii?Q?3cQZ0HASCJ3nI+8koTi6ipdUpkh2i6CC1OLpwmbeIAb/hvW7jTMOyscDjUuI?=
 =?us-ascii?Q?hg268kLKRkJgibOEQHm4Fszv3dTRBw1KVTQ2Qg8GjnFlrqYH+jeYOt1EtLOy?=
 =?us-ascii?Q?Htko8jmX/hvlHZdCrsm8UVMmOCnU1NpwvUKwT8T6VWp7QBuaVpVEoSqTqluI?=
 =?us-ascii?Q?uAPB8abqgW+GB95t9j/bncIjpBNeuruRt1c2QBMu9rRSBYu5Lr36FnDlpeEk?=
 =?us-ascii?Q?GgDtLvRtI+UYqbodeYHZnw6BKL8glyL41ycWuOcq/s6ETgo7i4IJQssL1FP4?=
 =?us-ascii?Q?+rGr7turCx0r9Oo6CRrcV7fZEBsnMbiDzc6mCLP7GzhSq56A42C0bsKlU0hS?=
 =?us-ascii?Q?7iqOr0s/fUCZmSaE18PgBUqY5ncgouEBPnuPNXClJ1JFefsI1IR85wzlrZtk?=
 =?us-ascii?Q?ayXuqxuJ7oi2sgIGaO6RqmusQZH3hQkq+ZOdZ2CYOSiR+6Qg5mDtcL4IPf2G?=
 =?us-ascii?Q?VZsfF/lX0+iF4rxg2/A+pJa416J7JQ5QbzPNyD6Mn+1cnO5zojJcMGkFe1uH?=
 =?us-ascii?Q?fhIegaHO2XuUOBcw4f+yge4Ww6rkcdBeayIB1bkALzf/UPF0TgMC8TNnNDoo?=
 =?us-ascii?Q?V+bw87C9IYpuEufDSYiroRXJK5sZss926QbE8mEvVTEZZ/6yebOQTfDhrOfi?=
 =?us-ascii?Q?54nS8GVBwDWU7NfkKuKp+tvL/sTBbuIK1r5cspxFxLLo5PlD7FHOpHI4t1C9?=
 =?us-ascii?Q?6LaaeCk3Uejqbntd4z/1g++8c2v2ItOQFi2ADsLfthPVI5kANF4UqGsxeWzt?=
 =?us-ascii?Q?+k4Df8+Mr5xONDYhlg0FsuKl/w8GCfiLPBxX8JjJk+CtI1IWs+7olIuu+QYE?=
 =?us-ascii?Q?4DKyBXdagBn4KsBrPIu5ra/TLGCbLm3hPVYuPxXUxZGmhaNzkxT+4/ldkyCw?=
 =?us-ascii?Q?QxxN3vdvkgZ9mUeo6xID4D+z2irMsn/uQYMrRQASAp8CPmknZlXGpIC5kJ3o?=
 =?us-ascii?Q?sH+rwgtttXRtOtYZUoccaq2Bk6AdZnlm3wEQTd39wfw014kEdxG99Y6onMQ7?=
 =?us-ascii?Q?RBeYsd2xNcznivydYdMPaxLRGp5GMp9yx/8jxGpTMbxuxquOtTtqzMeKaa1L?=
 =?us-ascii?Q?s14n9NJOMmHyKcYwU0i5xP9OgWeb2wO6N7t0tBtopb32DhysPadKaf2WS3fs?=
 =?us-ascii?Q?uGqziAnzlrDJTP52MKJBN4x7phkedgPq+zj9kJl2t0KZulEkJ0nPZ2/E199d?=
 =?us-ascii?Q?B3x/J88tRL7YlgUmRp+ojhOTjqmy/nAGtmLpIaSBxj6R8aewjp5cVvGxPOEc?=
 =?us-ascii?Q?4t+mnG3bZvpAa1nrd0UzF8z7L9Zk83J+jczwDCLYCksUEdZ79O3+BzBKBklx?=
 =?us-ascii?Q?G4ApqKCnH+MUpgjmh2sLXyGRs0ZvES0yP5f7hm8nDobXzQEeGEk6isyTUyHc?=
 =?us-ascii?Q?cwadgnUNkoLteUpVIuXUrQZ8XtvksS4hGx3GGWDo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ca2e17-8d6d-4262-b9c5-08dc41bc6486
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:17.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCVMvtANeJxEZiaZ1RQVfGp2nTWt8tJHQ5Kc35D/x21fE+LTovfpUaQPKiX0Z4zhztLQby/2ftgcoxpudhTW0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
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

changes in v2
- Fix build errors reported by kernel test robot

changes in v3
- Add a new patch for fsl_rpmsg to register CPU DAI with rpmsg channel
  name
- Update imx-rpmsg.c to get DT node of ASoC CPU DAI device with rpmsg
  channel name instead of using undocumented bindings

Chancel Liu (5):
  ASoC: fsl: imx-pcm-rpmsg: Register component with rpmsg channel name
  ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
  ASoC: fsl: Let imx-audio-rpmsg register platform device for card
  ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
  ASoC: fsl: imx-rpmsg: Update to correct DT node

 sound/soc/fsl/fsl_rpmsg.c       | 43 ++++++++++++++++++++-------------
 sound/soc/fsl/imx-audio-rpmsg.c | 21 +++++++++++++---
 sound/soc/fsl/imx-pcm-rpmsg.c   | 11 ++++++---
 sound/soc/fsl/imx-rpmsg.c       | 28 ++++++++++++++-------
 4 files changed, 71 insertions(+), 32 deletions(-)

--
2.43.0

