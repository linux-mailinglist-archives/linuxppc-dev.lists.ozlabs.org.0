Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A204C5A4B94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGV3X460wz3chR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:23:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hhVoFK/6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.48; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hhVoFK/6;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGN6w4Q7yz307F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 17:56:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVoRB5KbJLEdbUs6xcuzzpwoZFoJMWFPXRMhKWVDGDClvcnh8dLg1O/VWIWAUmUC6xRPR0ohbKsbN2BCB+D8sPKF/tdl7Ts4pW5dmBtK+ZJip6YK5VA9Q499NZ84KevD0XLdlhpcFiuYsEiRamsNBRe0l6wCZjExCrNe9ES5lGXA9V7d62Pqv31vOgsrrZdEAA9XXUgr7HJCoL/g5mXfqXEQ+QY37ah7b0/uYHRJEj4AeJRUI1f2XL2jkfteqJdG4/iTEQfZmCHSk61zf88c/yNTQTyS9uPdnBlPV9UKq5tz911BTL69E9Ze19lGnylmGk8/wxcH+8G3zBCBdVjB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8iEGMwGzDbOykjeKNYc8bhXt8INYgJS5SB8YoWsoQE=;
 b=QU1mh4mUOlIdimB0cqZYe2F45jDQAitMtIE1wKGO+ZVvIxrB7Rb1rjb3/A+fdj+KxiEEQWpxCs6NuNsxtiOuc8S6yKYASOj34LUFB76U6phZkaqd5conTjjuCY8ITXZnhW60y4SJm+ie9qhkV9xatvHOAAlr8uj1VTqy4g+zCkFLXyFeY93Muq1qg7a8jfTmUzPbMrcU61+JxEb16uB+tlQODS5WqZL2bP7NNf3Xq78Qc2wBJn1unIgOSqnCyalmb8+GLAXrIME5v1OS7/nZjowDxwtQTPz8BN+1/1aUTDfqvjMi2XqkdWzpomjrj+uOWyEWDdHxx4kUog8SgFqSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8iEGMwGzDbOykjeKNYc8bhXt8INYgJS5SB8YoWsoQE=;
 b=hhVoFK/6rCpwAohsSisKzv4A8MevEke+fEntx4G1tsUKxhgBw9PJ4YNBmjVrfxr9txqMiPqGfVl5YPl0lG0sWZKH1kfvF3S/n5H9AOPBaX1d0vDV/jB5p/BvIVZoWsEzvRfj3eGMkAG8aPhxyjVxdDfCtPVegq+1lvQjzuq6n8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DB7PR04MB4220.eurprd04.prod.outlook.com (2603:10a6:5:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:56:04 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:56:03 +0000
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
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
Date: Mon, 29 Aug 2022 15:51:41 +0800
Message-Id: <20220829075144.2405000-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829075144.2405000-1-chancel.liu@nxp.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed046c7-358d-4158-85fd-08da8993eb3f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	io3+ImBeQfdFNqPqaiUxo+FCel876PnacmGW5SyQa1hUY5cmuU0xxMfmlkg0j1ojW/9//Kz0PPkbGjvA4+cvs+C1EDwEYlKywracJ7kPs6/2UiJd6JaCUhIpV83suTP+da0fDRUTbKDUvSkwa+lA5oJ+ulWFnAxIg70AMbLHn94Zc4FV9IDd9Z9VLDK4uF7mlxbs+mifnluPpSDhD5dXvAUIXFG0dqB1biCcR6g8jDN1z94uviNlQjo/QhRHDEVGy7zjMx6iuyTMtYdQC3bF7V2U8wHG/uH0AAhwtkEn+8eiP5hD6LdLK22NdMICvHy+snMMac/Ti3gs0tp4kZIrrjUKPReG65jadsYsecRl6td2hibj/tCro+rec8fre8w0yIMb+42dRVLymZlk9osMk/GZo1AHX5N+Wpt/6dOXxrr5xQW3H2o14fFd1HuooeRozK7cywsAjcewKLOJhDqke8oWoaJcuZrne6EXoIGdTgCJYR+GNGVLL1tHvy6Yg0Us75UF0lsxyxYPaWZ2oVJe8iot+YZbxxrM3JCbqKwf981Okjkn0RNQBnmi+tqhFXJgXAGjhdgj+iem/djjsUmEDTuk6r7AbBl8Y0NMPD0GmSf/ggYBaYpCLlzNwRfrLq4Yku52Gbh/s6irfcmZcS7YweCrlrJFSkkvnNIZ7heeCPizQg2t/mZjii2sKDpZg3/4TCAKE93P6AAlyyNkQY9xk64ZvN0Z2xaqctbVMw/MgKza1H0gKOpG2WUhqEna0bxxpW1hLaJ7lb4szIbkL3pynX5SyIGM13Nt3gmOsoB3QBE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(6506007)(38100700002)(52116002)(2906002)(44832011)(38350700002)(6666004)(2616005)(83380400001)(6512007)(186003)(26005)(8676002)(6486002)(4326008)(86362001)(66476007)(66556008)(66946007)(1076003)(316002)(36756003)(7416002)(921005)(8936002)(41300700001)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?D3+nJNuMmkgBWk293etiql7BScBX1TrjNUhTIF8Ec6kp4cSwEzqVrAGjpoHO?=
 =?us-ascii?Q?ZfmPPcoB13afX4jjsL13/rUM4XEDqOyhe9R+aOPk3Qc+0QSMIQwStcLFgwnO?=
 =?us-ascii?Q?poki01jYSoOZEyKHJwYwEf/2Eg//BrJLuo6MADIjhu8Mpd88COzxh4ZSCfi8?=
 =?us-ascii?Q?lW16mMed42o678sqyg313jIbwamvG4QqdcxhXOXbk6ZaRT13KYULcoLSulA7?=
 =?us-ascii?Q?wIKN5a4R1HvHdiZ/WOwXVkaC/ZjSUhiraUWeMiyyWU3n6kKU6tV0HlwWnFPm?=
 =?us-ascii?Q?uzZSXVuu1AoLZ08mxZY6pkIdOdeQz7t7cjNrtX6gjTXc37WDE6L8ymxwyVJc?=
 =?us-ascii?Q?toLrrWMylvMR69HhPlMvwt4d5fiNdi994x4k+Xu0rOm//RZpWF+fo11iH2+7?=
 =?us-ascii?Q?MZn8EXu77gKC6We+R1/6bKwLOHwVaYNPJJwPtIhYoD72Gr7R5jWntb/Ty+ZO?=
 =?us-ascii?Q?vFc4uOiF/S63kIPl6rW5/1ShbzzqUuj6/eePC27OowAXekDjaNp1xl5RAkqx?=
 =?us-ascii?Q?ALMCn54I226MU0tS02xzwfdLulX7BGwqvie3OXJr30bdp45TRbcQJElk0rKi?=
 =?us-ascii?Q?/eUICVloGs+rjFHUdu1f9b5yPnBN4R/CgECLM1vPFLI5wyXqBOT/EuuBsiLN?=
 =?us-ascii?Q?MQBI7+JeEG6Wr7DeIjurfvoAvXWUIYs9YKtax0eAwX4T8l5r+Grf8bx29Gr8?=
 =?us-ascii?Q?1NZYnJ/BxaAXFyX5JhVQnRkyxgknOXEeTE0mc4aC6hnjiAwomahmKarXBQbL?=
 =?us-ascii?Q?d6GSev+Ufgctw1edwtvOAcWJUUKVd4VOMCzXQuQJnXB1dmt99tBd4Sldjz8D?=
 =?us-ascii?Q?cuPcd314TfIyScR5+tniQ9tpVeg18F45cE1ge9HtCMJaHRLjZE0jFFYjCzGl?=
 =?us-ascii?Q?RmTDxpBNBNo2Moxo7Ihp38MyGs7hQYgfGBw+iFrMpJp5o+qup6S+zfuN0UtR?=
 =?us-ascii?Q?5+D00aZF7Fapm0VejsjBFyFC8MNcBZ1tCxtZVl1mmHU5vbh2+HAOgg1PC5kr?=
 =?us-ascii?Q?tbKjZ+oAQvaDlrRHEBEJXEKgq26G6P/osEpi4fJEiVkXbqt+D0Gk+tZZXV7b?=
 =?us-ascii?Q?DEKPL/Az3xvbxH/iUBS0m44nFdu8hOfnZe8wdq9ULKEaL3Uf2L/Rc65CQmE8?=
 =?us-ascii?Q?OJaqZo+9T2VAzzqVl9xBivZvRMMScIANJJ5SO9Ww5lPlhUZZvuljE9dux19G?=
 =?us-ascii?Q?rSJSfDoR1McNtE2TcXHuowAyv3N5uoPcSNlQ5UjWyXaxhzsljLPdXZ/DAO+X?=
 =?us-ascii?Q?9eXDUsntpTQkbGyGAAKX2YxO4kHamSrpvcBhVxlcJ8c4ti+0p6GKnqcq8A/v?=
 =?us-ascii?Q?G7slL3ganbgDH3ysJBJCaFRqxrsRKMqdhzms9COaTfNjvXnPSV/gLiQmQdrB?=
 =?us-ascii?Q?50BdMrhvCXQyS3/TMla+LaK2TA7eHREUEJnhfEYFEar9SJ1DH5hi1gSsV188?=
 =?us-ascii?Q?cLhzy2qKSc8m2IVUddYG3BWqfBfDD6hCCJ/AGi8+0BfvIdbglGktAK7eBrjK?=
 =?us-ascii?Q?Rt+LJy5a0pSWnU2yJYCv/veQIsD31t7tmCcBKSC3++ChfJN9Au7k7ZNZBXbK?=
 =?us-ascii?Q?drR2gCPXzG4XjS9GXaq5uuJ8FRh138IagbljLW7D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed046c7-358d-4158-85fd-08da8993eb3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:56:02.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/dLFFrw61pxGd1HDER/6Q9cfFwfNTL4wgMVLlJRFEZiU0jFp1THJjwJEIHty8P/qnY4yOVq26ksBQk7MgR97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4220
X-Mailman-Approved-At: Mon, 29 Aug 2022 22:21:55 +1000
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

Rpmsg channel for MICFIL can also be created through rpmsg name
service announcement. If this driver is probed, Cortex-A can access
MICFIL which is actually controlled by Cortex-M through rpmsg channel
for MICFIL.

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

