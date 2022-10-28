Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E19610C3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzG4Z5Z3Nz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 19:32:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gtaj0VMo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.42; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=gtaj0VMo;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzG0V6vWkz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:28:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCr377OGilpmaJia824H4Y+mzXtFngxQ3nN0nV/IQOmBSEZ2K0u5TA4V5TWjkqUlwft2x4Uz8RH3hkJSL0TGbpIHbqEkwYLHsD2ej4y52M+bOc2MjBjCrJaq/k6J5BiN+OPajSPQmUsx/6aqoYaksAIqG8Wa9Gzw0GeH0FSIWD2EzNuQkcBm4mfBM2zEwXwxRy8qRWbKm2hWqtfgr36v4IZiiwx0y2Flx57aZ56N8txu94Vdg+WwsGlxCJ0HxlSI0ptudV2z7PlSpZ1cwxkfLoGYdutBx77sxua7E0I/duUa9xQGYg2bTsv2qpefzFIEaY5BBJTd4+lw+H87kZh4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG25X3TBSZ6y14VSB3Ru83bnz6KcYCxEkoykgD8sPuc=;
 b=JthegQQmRC6LxNInhR2xWcFX4z1waEYNwEwV2vVb6R2G2nFvd38wukkEBbOzByWGOjbKgCIIPMGv6Wn0f9R2qyKyUPtMjg+Ib82v8c0hqx18K9N7hnUz2jgkRy/wmGLwZ2x70gQHcYZPBMscud4N2wxHSL+gssv2smt7Hkzf3vr2CF03Ri1TCNtqf4n5njT7ppudPYr/GpBeBYBdJxOjPyobH6o5x2c8BVTe/n/VNxRhArWd8jcTL6TyfBFCQxatEhGzWUG0aGDckYbv6e6EAOkfH7UIHBU7Bq1DVlBTfTSfak0IQvIR4FUHo5bUKDq3EPrXL00hlDiG2saifIvjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG25X3TBSZ6y14VSB3Ru83bnz6KcYCxEkoykgD8sPuc=;
 b=gtaj0VMofBoSvgY2tXz/h78wyJOZzKzzPxjiAJ91H4yBKMyI6rNE88s3WJzzEhddKWmYCx9jQHKLmoyLX3nawMtJgUDQ52Fzshb5qVqkCc4BnKWwcwFEFoA1SMoT/dhBL/6h2M4hmHqDlcXiDMPqYZT7ua3k1RAjSmcJzQ4PE5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com (2603:10a6:209:4a::21)
 by DBBPR04MB7755.eurprd04.prod.outlook.com (2603:10a6:10:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:28:40 +0000
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541]) by AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 08:28:40 +0000
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
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] ASoC: fsl_micfil: Add support when using eDMA
Date: Fri, 28 Oct 2022 16:27:50 +0800
Message-Id: <20221028082750.991822-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028082750.991822-1-chancel.liu@nxp.com>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To AM6PR04MB4213.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4213:EE_|DBBPR04MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: b05104df-1d8f-4593-73c3-08dab8be6ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1edV7p4dFbHom1YSQ+awu/9on4pEpH6VyROJzx20c26CYb8IT2R7okH9RFt31ICcDAqxR82uaKwmqn1WMTikiWwBDgrZKiyvMckJxFxoYDJriBXSLN+qQYIobxD/ZoEsdUnrskvgcxvL1hPRxO6DIPnj8ZIfig8PHtk1fmVOAUByEbq/mumfm4PuOgD8LGKBqVJrMH0fLmHMjZjwSu4XDjmPV2Ln5qYOUsjtNZfYSYD6LjRta4uQilK8+tOZCytdsarmNzclO8tlUx5KivaCDEgCKrmmeVJzxUXnadjL9lPbswPVQXEmYJ0gefo9yfR9CXwyMjcQ/A5sdy4BjOQ5L1hrOnz9eP6l+CDNbVIb45AvUFxQV/N6qwTh3VbSwb21a+CDm5YG4SR49fZ+dec6nuwUVtiBWYaS225P2h3PiJuhzm1hhCyM+qBrUI8RuwlaV6FiS5+D7S7i32xIu8iUbFidZjoTDZOBek66Y469gVm/QM+LW0tyroJHQtzQvOvRemMTcDXVTrM+9qe6SWuEb0yYfO2oBwdwj0/LMJ4y7iI8BxDxPTMqlnFu/cp6I4K6f553w9CN/hlVfVQUSiQ9AGuK+r7u+UDsCN49V8boFxsePCq0e+G3ib8ed/Ud29OaglH5PCPaq2KonS26owf+RshNKNID+eyfogpGCQJqHSj9mECBi2FAk0vqFv401Pj8BgIjLVzwclOnKfwPk/fTOeQc+RbuWGGN6QnZt/cHdNDP6cvO+aQzVhOoNut+By3M85bjhzGa8NTR6QX97gDmb609dyzf1AwbHtAdoWsUcOo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(44832011)(66946007)(7416002)(38100700002)(4326008)(2906002)(66556008)(316002)(8936002)(41300700001)(66476007)(5660300002)(478600001)(8676002)(921005)(36756003)(38350700002)(6506007)(6486002)(2616005)(26005)(52116002)(6666004)(1076003)(186003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3XKWK6PWRAEQoXhimgT7lxRJhvwiG70wuISezaw+qLrfiuBNNcxbJF63G49J?=
 =?us-ascii?Q?Kh4kaQ9A39jlOJUMPA7Jb97ltIDe1yTp3w+Pxlns+BIEzyFKTfrzNB6uLbWM?=
 =?us-ascii?Q?WQz+EHPWnKm7Z1G6DabGWePQg9HQoh+CU3P4IZtjylApXx7/eYgL+DqxlOil?=
 =?us-ascii?Q?qzvadnM4rIYcgnTsqj+LT2vPxPxerwTik3dcyGXFmF9huJee7mR8kIudoUSJ?=
 =?us-ascii?Q?Th27nNnLCKkE/CYcEghPLKHynHjfqxlVq3K3VUh7h52SjB8ZM5PLDZ2l6alA?=
 =?us-ascii?Q?Fu9OpZp0wRMIqbJT97ZGR8VeEvsApdL9aEYxpf0wXMUQsl+YV1jhJXOHs/gE?=
 =?us-ascii?Q?Z2oAxup7LtVPbgeEIzVqrwUfjn43gDMCHARypclN0nQI/WI7jNnDVlyl71G0?=
 =?us-ascii?Q?fefsjq4Xge8SpEDb+PkZfLrb1ly+9gy37VcJG+xVRVPeImiO1fx1a4yZvLcT?=
 =?us-ascii?Q?GPNDyW1sYS+FkfFwwzGVtHLbTY9XUp2shnALMD31AM2a/cGKc2jTU+PfAp8Q?=
 =?us-ascii?Q?5yMe5OUD67skxetG9ewMP4tVn2zhSjp/UkxDqNFBhcuEuXPjPjTVOVNb7Syh?=
 =?us-ascii?Q?Tl9nx2Dg97VmtqsWBCk4wLf8aTWTVxJ4VVkMlCGEgHs13V32xhIs9DVQ5Fid?=
 =?us-ascii?Q?uZSaz+E3f0JX9UGHiicRAxR/bSF6tSOe6w01D+hYTbMVOgL3+bhFG4dYQhHM?=
 =?us-ascii?Q?su2UQE1f99COYWwAFYqVPVHBER4e8HWyN2197cYiVhzOMiO3MI9xcTnqPNgh?=
 =?us-ascii?Q?CFaZr8yumqTIv1zOEh3PuahPotwLQJuqj/TZHpnNOuciMiql4/DfBR33/pC5?=
 =?us-ascii?Q?vBFGTY3beNJEMvvXlf3Tzotm2YzB8fALISyJ5/LSScNkQtehJt0515slJw25?=
 =?us-ascii?Q?yFkR5IRakdiUtCno06Wz9UjKguBMznzSI41IgqPjgoETLqNI3ShXTofKDM8s?=
 =?us-ascii?Q?gulyQ5jmSG7V9Yt+WD3ZZUnMugDy/0tFs/C/oV9vguSBpp+QAyoBsBdSJ64G?=
 =?us-ascii?Q?FrOSL1i4R+OCwdWIhyuJ3ywiRue1zr8VNzGNKamduz1r9QSVZY1CXIB3bTF4?=
 =?us-ascii?Q?88SQ2sWDElrHH1n9aCSHjBP8ft/QYAUeE2O/GJ35sM8D86rI631NDgLzCi2V?=
 =?us-ascii?Q?asMCAfbCt9FJR5rIrK3orp5VomEzEV8MXB+EOnKqKeOrrFaYP77n6Dcvx71a?=
 =?us-ascii?Q?UZTzgfHJJh5pClNvk7lrzsEsjpHKMxnqUjEfq3RK26Sh+FMi1uvwyouc3+59?=
 =?us-ascii?Q?2oocudyEe+4l5J5TOwcR5DqJvXtnlcrP4P16MUALv8ux0bhXdB0KJidZ9i6f?=
 =?us-ascii?Q?UQxill3Ea8cMsdwuteSBrCoh0vjdoK9CEOjUs9kU7zXr00k03FAAhVndWy4M?=
 =?us-ascii?Q?+bmZyhd7Ma6TIq4E6iP78f7T8jE8Y/LrVxkLboFLgIySWTnKSJMRKcqpIC/U?=
 =?us-ascii?Q?jA9dtIO8OFL+e3FFcu6eIC3JCO8MPdovsDxws4yigkFy4esTZs8Q2ZBtRSix?=
 =?us-ascii?Q?krecogWCENX4kJG/7SzxH5X4BJJIpoEe+BBeXwI6/wAUjYyKpnQvUsMn3KlF?=
 =?us-ascii?Q?3cpD1DvLTw9vR0SnrQ0xQwBpybQ61NnvGacGoY+g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05104df-1d8f-4593-73c3-08dab8be6ab1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:28:40.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iUvFlCxbxgB6SGSV3z5DumEOsJ9JVWj63MVCt/gCYdduMuYEgULPeqFO4ybPZBw8cAgeJ8eIAwyrZjsIoFTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7755
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

On i.MX93 platform MICFIL uses eDMA. The maxburst should be set to the
number of channels in eDMA multiple FIFO mode.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index b8a9504441df..22e75c14cac4 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -63,6 +63,7 @@ struct fsl_micfil_soc_data {
 	unsigned int fifo_depth;
 	unsigned int dataline;
 	bool imx;
+	bool use_edma;
 	u64  formats;
 };
 
@@ -88,6 +89,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.fifo_depth = 32,
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.use_edma = true,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -690,6 +692,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	micfil->sdmacfg.n_fifos_src = channels;
 	micfil->sdmacfg.sw_done = true;
 	micfil->dma_params_rx.maxburst = channels * MICFIL_DMA_MAXBURST_RX;
+	if (micfil->soc->use_edma)
+		micfil->dma_params_rx.maxburst = channels;
 
 	return 0;
 }
-- 
2.25.1

