Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAB23C62A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:43:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM2Bd06yRzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 16:43:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.45; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=VHzX4vIN; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM24T4ySVzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:38:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReBOrj0kVNmCO0ImIrZiKtfm0p2MUUfa61bNsZ3RM3BbBFZU7ByHTSd7YSZO3yeKMdkA/hzZE/EIcHJVFUD/Vp9HCTrizc2ufLEIcakM3ao+Rh9Vq7EQ2VlyQm60mX72Wuzcd7HAD3Yr3sMPWxOnZ9oLAWLrH4/SB7m9YFN5JlesPdzaODW0LTzdzjvmZYDqBHJBT3GEr18aehSLgbjcba/hNf3nc2y76sW4XI8H4S66HQl+Ozvnckajktq1vRAFqzpjgvisuuZi4RvmkNgKV/eMEVvFmHU36NtsxwsmCtA5aLnj75y/OMm9pvQr2TF75eUtA71dcxpAehkkqkftYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41a3LhpzwaysSVfuj7i+bfsGWsb/UqmfvP5vI5gncLs=;
 b=COfbG7FF6o2mGUd5lgULXR0Hcg2rfYK5ES5B+E6SpT0cwf26W8eK0fCejPajJ73EkEBnIO9VZQPniyscJ0QnGETVocDH1G4WSrVGlyujQU8B0Zhyg+/OpTeT99Zwhml98MUqI3eBb2/uMeC5TlTibXamUXAWFxxHkacKMaExe28OfFZh7ldNQAr3R3DyPfq2JePKkcCPwIqkZmFPyr4ESLRelRa+QEb1YYmcbVIUBP0M1OUgMy+qzURey7sp4YEO+LQpOXG98oTgC8aPZIZ1woHjxvnNyTAdCX0FheYvfqV6+Cj7S7zOfIlSe5IfF3k/LXyCXSkB1LyLvKvr5LRbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41a3LhpzwaysSVfuj7i+bfsGWsb/UqmfvP5vI5gncLs=;
 b=VHzX4vIN7k3dynjiKpdrUSerB951wKsojRpBDRVxo6oZ/0N3HP9dWgb+oSGLk7EmzU9SgkI/0eJAc7lStxhEdPqmwUwZKYpqfBdPwUWpb+ip6IbgrUkGiA64WspkDHxJURlpbBjytNmC/UcIBVQU7RU8mcZJ9dDNLNqByW/n+eg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB3055.eurprd04.prod.outlook.com
 (2603:10a6:802:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 06:37:59 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 06:37:59 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ASoC: fsl_sai: Drop TMR/RMR settings for synchronous
 mode
Date: Wed,  5 Aug 2020 14:34:12 +0800
Message-Id: <20200805063413.4610-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805063413.4610-1-shengjiu.wang@nxp.com>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.67) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3261.12 via Frontend Transport; Wed, 5 Aug 2020 06:37:55 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0de288d-a301-42eb-4308-08d8390a1844
X-MS-TrafficTypeDiagnostic: VI1PR04MB3055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB305523FC3CFA5D1CEA82602DE34B0@VI1PR04MB3055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9QfRfeOtyzzTk6aavARIyz0NHBSXtR/WVrsRmusDvJfH9KY3JaVz8mEYvVNznMjaAL+yNXtH5O0ArsPwSHdW7NFMmqgM61q+HDR4h6gUXRO2j2k/wVg2mwtaDwTn4lqvhz5PjTTZhEqzQhYKCBdot0hESvAfHF4e2CP1gwDD/2Tl02bhQovMoOSuEfJr0tOJk4HDv7/REW0rovIAKnzpiy7C+kAIzDR1dIOOj7D5UKw48GrbSebepwrTiNQBdTSvoiG3lD+qEGeSrBWJqJkVtpga4023YT57nPFd/5K4U4vIoEm3b/XZXnw/Yd7jtZkrZekBHrR7CpeFIHBiwDqZ79pTBtC+f1CohFhmrWYI1FFETvC85zfDXVpDmD4HUQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(36756003)(2906002)(44832011)(26005)(86362001)(6506007)(16526019)(186003)(956004)(2616005)(1076003)(5660300002)(6666004)(7416002)(6486002)(6512007)(316002)(8936002)(8676002)(52116002)(478600001)(66946007)(83380400001)(66556008)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gyRFBKEND3ryjZDJOysjAzEopbastUAKLvJFi28bvcTYIADrflDulhvG7PO0yu2IrzxYxlj6JBj87G9jjnHjC1WpB/ETt3dxnfP05h6ny5hNDiAqC26bJTV6NZv49Q5wdabWbE7hLFrAV2du9KBJ0l1DqO0kpMWO8p6wHgovaFrFluqV7Gu1vANpVfyR0lGShc3pe8cZgTKTe0yDpnA9K9gh4Lt4NMv+pmA+evEJyOSu/+ACbM3tPbc0VJUVB9FM8o1kTvZ20XZYP3rlZKPsqPpqCz7l7g9VK8fv66kDWnmJWXCVxLFaYg/vM5+K5fA/nNeHe6UXOLJTHvcmOAzajg/2h3a11P/rnatyMMihuLTTfxvzVhKLaoV0ZrCgVwvoc45TV+D0/hNdCdDnmY3/3wvH6h5J+iMXp54SysRFw5SvrxjkpkaKKRFlYhZItQ4XsX6oNO1b2iu0PSsGuj2Ead07i7E+7Egju6otv7dz3G+CLfkm75xSC61jYNW77me7/R1XjaNGNfBdO7rqg7JZcf83w0OUPVeK0QDb747VZwzWIM9PbbxoFqp0a5287+jBXvx1NOq8yr4EBhfZIhDUece5i/K6U5msD6gbqLsYv02bodZn87tybFlTg0ClNoorZo6jHwQuCBUNoxAMttlE9g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0de288d-a301-42eb-4308-08d8390a1844
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 06:37:59.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3IYOc8M273DMHOvpqFq3aEx4iUtJTRSvH6LwtFrQzi2cph7TB0VQdBo7KxQIQSzZkWyzGKGhi1dEhUehvtAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3055
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tx synchronous with Rx: The RMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Tx is going to be enabled.

Rx synchronous with Tx: The TMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Rx is going to be enabled.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 566c4747362a..334090d581ae 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -488,8 +488,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
-	 * RCR5(TCR5) and RMR(TMR) for playback(capture), or there will be sync
-	 * error.
+	 * RCR5(TCR5) for playback(capture), or there will be sync error.
 	 */
 
 	if (!sai->is_slave_mode) {
@@ -500,8 +499,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_TMR,
-				~0UL - ((1 << channels) - 1));
 		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
@@ -509,8 +506,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_RMR,
-				~0UL - ((1 << channels) - 1));
 		}
 	}
 
-- 
2.27.0

