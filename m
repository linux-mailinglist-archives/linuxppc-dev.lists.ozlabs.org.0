Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A15B86CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHKZ5PgTz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KzqIGDZ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.85; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KzqIGDZ5;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHJ709Fz2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:53:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFGZiSd1SwOqGiVfcW5QoERi+IewlXXAycvqoUFYTneBlC8hLP6hWwN+GevMY4bC2fgHTJAL1YxF/rdkAN4XE2oAbrBBsEcj0JyTRhJ4f+5eUKasCrlkiRX9xLsWB03q3IKe8twBpJ2tgBtrKcv6ZbIORvz0Bxj28vPz8fSawcXbCpGWDSIncNVmxbcRzdG8NDsJ4j6L9rZDHgCfqkNTn/S0Vf0LXcuPehUegKYwyRTvRprH2lfVnv0ATPtn0m3VlFa1E6syDNVOnthpVxP//43ytDqn8YBLoYGj8zfnXQuWwlCaUQRgu6mrdeHt/OLeZGoFzuUIExFJRR1TmUZ2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qccABiWaUvVO+xTPzGBnYWyvQQd83WgKac52ZwfOQ5w=;
 b=YzO8rPTRox68DVzRcGu8vld67Zsu5f5X5QMWuUwOmGHK53dpLc1C1EJSYiAOufNQvdRMoevKq+kQf7DzxZKZM+4GKXl8gLdk4T5ZQCsdA2qVbQIjngv6d7PfFskPWYI1kiwU26vB4yDiK38kQ3K7l7l3kRLqXkfBcKj9DNPphA15a1ZBoKsCcqF1dGnwjMNp+fsmqif2hfp3ke3PaS7nZNK0co9veQpDysocLHHTKy4z/uuiUx4pPkhapp6LpyTYCKgxrsaD50lcPFge6GvQRToTyEny2lccXCylaHxsXjry40/fQNOV8F8NibBNJtgEpRRtCEbuIQtdRAjXQ1/WTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qccABiWaUvVO+xTPzGBnYWyvQQd83WgKac52ZwfOQ5w=;
 b=KzqIGDZ5HEMAvHeIvb+lIVT4RJLau2/8HUYde4H5xhHwdP0QlcOr59AMuzGWutzuMICS0OLcmTTY+P+uVuzzceoASE5ndUFOYGyCiN3sqg9xM/uHKZP1beRpO8Om5w2Q/LySXkcM5u6SxhHacgLpgXSvdbqUjl2TiGimgaqjiaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:52:46 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:52:46 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@gmail.com,
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/7] ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
Date: Wed, 14 Sep 2022 18:51:40 +0800
Message-Id: <20220914105145.2543646-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105145.2543646-1-chancel.liu@nxp.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f896897-4995-41f7-518c-08da963f41fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HcEl9o4cHj3BpZBCOLxpVGj90/qOtthurKo3105Ok9jlhv5BeBs/E+p989VvrSGVTGOk65MiEKN1DdxZ4YgSmvbST56J7OdPNuLVEXx3Dh9Y3Jk2UGWiFKwd6H/IJtZZWw5h5VWFP76FfOKEEexxLhJAXrxu3ryjQBNof2mwf+vKVO7AWku1z+yFmtDIpifGD+uIEPcuLLsDn4FVAVRzXCM8WnPWPV2+6P+hKyD5X/H45/OhXZBaXtP+p4c7h6/55yLv4sW4+fkhuOgxY9EIq2anVu27TL15gMO/ySOlRZ5rvz8AVziwifEIHRF/YZsv+FSd95SmBca18Jc7ALzTkjYyVoeLkOnCmDLy30xDbfxqmp9bHoSN6Zf5zJ95oQ6zLVNaZErYm8tGb9I8SlT7TeEBeWC00zFC39CnoKpv29TcS6us/u42iq1RmyGKG1vpiL5CNeyqULI7xbOovcO/zafoeXY4w9NRFRiF0luLw7+EBgPT2HFrQ1p0dPEYf/Eq/sKsadrSaw25jc6S3FWjCpTI7+7yP94Goqbfti1nvAN/LnKUezk4TKOm/ecT4G5VTSoFwf2tf3ka5ZwihRgGLAENc3MUpu54yIi6ZEzOR4SefqjUuoD3AQZD95c3fW0WZkecGLXjRxaPfKwGliutOQsOPjnpeT8k94GqvyKIi5vA/eUsgdZsr2mIaNjWUK1fB/ptP4lcT3l7kxwp9q+1xxKsFiOtKfVGtJr63ypqudjAe7EDKnEo6Ol+tKB37MaoCITtTZe7FCk6F7s32uPrrg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GSmByizf2nH05kgSJhJ92Ey6CrYNpewOWMqVRCbSiBRqh/WB10l30hTGF5z6?=
 =?us-ascii?Q?+MblssQS6NHa7o1ldJIah4smkho3fZOKhtJNly6IA4LuRvAtrT9YjHnrWQsk?=
 =?us-ascii?Q?pIKnzbjGMB6v16rLx1QVSSIu4ykHoV69DPyiJDz+/mdHA0+FxGIbUOrGgCuj?=
 =?us-ascii?Q?CTQ6q9Hxl/q3NnmnS7gIRxHdsWSiDQS2UTPKUBi/P1Q4kGUXgYrOFfRVDQTX?=
 =?us-ascii?Q?JaMm7B2bjoTYm/iqVGeRN/9x04k/+Jnq3T6M7cn/PMlYT9WBvmt9pPqzQnn0?=
 =?us-ascii?Q?3OI1g89d2Eon2+LqbaDktL53F0PgCQl/1uwDpYxQXZWPpEBmMecPwzJXKfdn?=
 =?us-ascii?Q?K0SWg33zrF8mdi3R7ifHxcf8KG4f6QldCzBKoXlH+i4qeBdx0r7febVtO6vL?=
 =?us-ascii?Q?nSbWcITO1k3H+/sD8vjT7NcQEcR4GwA9LF2HOkuTU7omap2rawKeNwrrkq5B?=
 =?us-ascii?Q?dMzsCpEGBytw3f5eM7NBTxOhGFwzO2xNpOuJdFOoVx7DwapcgMvVpTT5y6qy?=
 =?us-ascii?Q?iaF2p0HPy7AD6NLgCMgUPQjbH6W3s+YpSVsop/kIKTIAuBlNe8lEp7oJpd50?=
 =?us-ascii?Q?ysQ3kKuLCicdGlaVH36RaTfEcPAjBHKzh5ndnTFSXzdWjNGLREgqXAJF7F0u?=
 =?us-ascii?Q?+UfBK0ASYzV7b7Wj4HxviEZTQoS7dSGc1yAdTrmAiKinEe8HtbdzXc0kDDMF?=
 =?us-ascii?Q?PIK51bnNdB+VmeqJosbeQC06aD4ODK65say0l96qRK59Mqbi9xCZI4BBGCf/?=
 =?us-ascii?Q?fMmNduEAz3JbU+LmXVeFL7O8MHf5necry/hPbWtROLwmL9EkNFTojqFNcYVX?=
 =?us-ascii?Q?6u474DnyAgCzzZg2OItdZmvP1xvsd9sFQhh3Zb4WDzf8obypwepNh1LCUrrn?=
 =?us-ascii?Q?IfKV6kZcHqbRJNbmF6N7X6cRD0tbuTtv5229RAHPzb90LNjAiEVE1Myqhy+K?=
 =?us-ascii?Q?QA5e0pUvUtO6D4gSed9EcULq7LMA+/SzKccsHF1C/KHHA6h2sRSuaZC4RyE3?=
 =?us-ascii?Q?HWjDTQp12aqsFcAjFgkrHZh9nj0U+8qKe7y0jXMiZHg6OWYZGkmZnLZCFerP?=
 =?us-ascii?Q?cnwhH+jFF1e6kTcn6foyotFvHEuld2nADpXt50719oSgkMCDJ+IEnFRFTKR7?=
 =?us-ascii?Q?6urAMzoxuHf56AjMhoUZ8fAWiwhAMQb6GzGPMiqEn+AT0Opvl202clB/I0V9?=
 =?us-ascii?Q?/pQbKoOMlvbdMyoTN9uFlXiymJzMo41L4xcZ1v1wXEffo1zrqBpbqy+iHrB9?=
 =?us-ascii?Q?kw7KllqH+7GMJPlSB3GQQprcErmb+dn6wrx2CasVfEH2DB/IdN8ojf3DVhbA?=
 =?us-ascii?Q?8DajUTJoRlzSgR9KqEEXTTR0XZ1l2nixSkPyAPuZGHw/KxTcI8VZIEAoJ2ZQ?=
 =?us-ascii?Q?uVlCWvP44QtemirjkFgF9v5+Hf4hLroIJgHEMqxzkfAsfjYNX4F9x0Zk5FsF?=
 =?us-ascii?Q?AkofaSvRVvRevJpLNo9FLh2jQQn43RVuezn//yfet+R2PyC4Zaos15y8Gp9R?=
 =?us-ascii?Q?/oFO1FRoVVIskHXkCqBdWZPi3ynRmSq5D5/4EqMnx/H2ekP/1qpnFvr2Inkz?=
 =?us-ascii?Q?YINsfuJPd2P7nefsHrSaf6e2BD+y+42J53SJ6Brv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f896897-4995-41f7-518c-08da963f41fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:52:46.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asLZOhsX+29ZMCy6XPYg6xxE7p4bwVfj4hFNF7Wqkl5uzLvp1lOoxgi7SPBkvsmP2Ozo0RpSZVH+b227NBfVCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
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

Rpmsg channel for MICFIL can also be created through rpmsg name service
announcement. If this driver is probed, Cortex-A can access MICFIL
which is actually controlled by Cortex-M through rpmsg channel for
MICFIL. This driver also helps register ASoC platform device thus use
of PLATFORM_DEVID_AUTO macro in API can automatically create device for
each rpmsg channel.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 905c3a071300..d5234ac4b09b 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -88,7 +88,7 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 	/* Register platform driver for rpmsg routine */
 	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
 							 IMX_PCM_DRV_NAME,
-							 PLATFORM_DEVID_NONE,
+							 PLATFORM_DEVID_AUTO,
 							 NULL, 0);
 	if (IS_ERR(data->rpmsg_pdev)) {
 		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
@@ -110,6 +110,7 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
 
 static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
 	{ .name	= "rpmsg-audio-channel" },
+	{ .name = "rpmsg-micfil-channel" },
 	{ },
 };
 
-- 
2.25.1

