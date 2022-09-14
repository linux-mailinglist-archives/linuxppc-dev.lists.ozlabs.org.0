Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26E5B86D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHMH4ymgz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:56:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Tdc6BPu6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.85; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Tdc6BPu6;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHL1XMRz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:53:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7LxRNDjW02AF59eKslPdIApwIA+XfdyTGSSSaEYbDJAXERA3NjvEzIWBMLGU4zOc4GBFG85SHlLujunATAIJAxnb7X7GWqjYGS3CaC8c5rQTt9uUlxuPQJU81OwtnkMBstKtj0zNPnW48U4jKlHB7oeqzYFJtWST2uEcBGn0gIza/5LJla70P6tvj3P2rKB2XgX+XAKHdw8QZuw3uALihn+X4XNEOGOR9iTlqdl1joYOhGTU2gt+ucuAgots8h9mYjqyY1qHARZxIBNmAvI1X+B56QO/JFa0LGHIQ2csHVKHgQYYi2DYWbNi2i2rJ7NZz3ix0zZVqnIx7r9kkkClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHxRl+PyyXeyleSdme+8llYfXmkco4/2wZZPH9pkCDw=;
 b=Bxjg+42uXs+ZsSEpk2dS+lS3ZLw6oVx0TPB075IoVVYDkvCJ7BeGtOEI8t36faFuqXXtEpS3pkbH1iO7xXtC/86muabS3SjCnhyAOElQADu1MAMMbK8I0e3pr1HDFLb7fWMGDgzeVcC2xMX/ZZCCaiwKB2MkW9+uc0VjBvZdjDHd4GaWi/CS+xX7Pr5xMPQdiSCiqn8PP1ML/MQvQphIYccV96gSse2bIUc0iV8D/8ADau6/y9Id4vb0l6T5h8MSmdq3ZPNPW8WeEP6VeXHI3/UZuk9nMkSkEsy3SCc8gtWMmI/Ci24rKE7tk+iuRWzxQU2bg3SY6kC7NEjLD+m/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHxRl+PyyXeyleSdme+8llYfXmkco4/2wZZPH9pkCDw=;
 b=Tdc6BPu6zLWfdUQ0iGnLVC5E0z9O8EC7cAJr8dK1NfmFx8IMNsFK6En8PDGsMovEGfgc5woTBBnlwstaFWLDE9Qy3XLPbcUQ6QGa7S7PG90j09Ic01pfidFCgPz4PCmMnnbK8kSjR4HG7heGl4URjTgIEaU54Paqu7wEyhwxFwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:52:56 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:52:56 +0000
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
Subject: [PATCH v2 4/7] ASoC: imx-pcm-rpmsg: Multi-channel support for sound card based on rpmsg
Date: Wed, 14 Sep 2022 18:51:42 +0800
Message-Id: <20220914105145.2543646-5-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: baa3cde0-0339-45d0-0408-08da963f47e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eg8HRwTzdNXUkDxkxyhPvgxTLu6PJIm6K9TvlzLbGAgiw6ubGldake5nqGCZHYQkRtxMx05/2Ihll8w3chiTwzatt5KQxOkB2X9vMH30mxLM13bmzW1CK0qRlzDxjNuBXifP0MwVeZ5FGxR9vB1xDqRCsOfB9lOYMky+1jGzQC+VEVmlD3rlPRCPSz/hst5k7POJevt536uWI5FWgyTmonW56E6ksnLxMBE7Pe4I/HObJimsFVi4vOWGNniNvL+lXJ3pKiqbW+4fwyItlsr+WgXxl1LIjzC0x8+WNp3mXp4otfDB4K4az2L13plyAm6TmG5HKYsJAjD6XpO+TN5xurNBMsG9REvKwnwFLHYDK0HT6Gy7JQmOGxHZinvRatHdtXn4woJXGQWY6OvxDn10XryvOcPdNOJhCnXwmJjyONfO1MK/QfajL4G/Ess7699nt2UAHoQoSVAElFuWt2T4ztwkcrSPy+NbGh//HfDTV+c7nnkYUtiLn6wGoMHntt/29ndm1VByzObUR8FM4GWQtqA+7DnZptWQKEJGW/RRFy9096/kuOCzs51c66JeVDMWfQBctFIRrOVTpVksty3WJIFfz4dT4pimzGHRIqj3UjvNFO3TMCoIDgGi3HksDTqk/v51rNcZeBrMeN1mkW2NEWBIJ6oJfT+wJAEsiIRTN1VBhlC71gUW1GgWnbPUHtrM3XHFm5uTAHvEZCuoOJYcG7m6yAEKHRM3ZLeKbIMaUtHOvqDwBjt7ol/PO1gJXLYIJrMZr3GMQ6sLKfJHC2G6pMH3p3AxsxoBmBZ6fWU/5Zu4HgLLVBccMPZoRstAI1Ea
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(4744005)(8936002)(17423001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?r4HZK4VIRy+ezAPKKPUQHtA2m3oMjHlMnVmVgtwYNFsOQSuIEgnKNj4ZQxNY?=
 =?us-ascii?Q?TydXq4h2fuSEfBtepYAbMi199JNdWwtTvbrK5L4wyF/cHTQ4e8x9bTCacA3/?=
 =?us-ascii?Q?If0TsJ+T2uiFOkyrqZwyeEqSWG3DtxtXuPAgX4pb/3AvExJSQZybNxXWnWSH?=
 =?us-ascii?Q?YsZu6VO00uR0QbrxF9rJQW0umKSZZNuSMKIH6QMlGK/+0QKoLQq3eFjZlSw3?=
 =?us-ascii?Q?H99F3ULl5phGCx8mygtF4m61xHvv8JRwCGjZ9THP3ZnGpiPBTHRZaotQB/1O?=
 =?us-ascii?Q?12E+nTaL0uZWc3f79pRi6L8au5kk1FB9+XJCBwFOpqo3sOk5FlQwXenbK9Hi?=
 =?us-ascii?Q?vf6zin9EJ4EaTtHVNLroioZYKIAigdRzQP9Ehgowj9wB0ZtLX0uOCZoS3xrP?=
 =?us-ascii?Q?C17YqTU7CX3tF69fHXpbZx+eOtVMH7LORz9ZdT5h2qt7D9GCP/iyRDRN7rwb?=
 =?us-ascii?Q?uGtme7Zu9kZAyj5ZW8i4bGfNhs3MFVhNN8aseVXfnQawicrXMpF91dI6U2HU?=
 =?us-ascii?Q?c1yta7CYPdZ/xueU68fqvI62MkSndQbdEQfFn7JYdshvhvksRysukghwEbWY?=
 =?us-ascii?Q?ytJYC/9n8QMvk2pMM3xEgKkFCYidBrFkLRtUJIlm73PK/T7nQ1JEwFZnVeOd?=
 =?us-ascii?Q?vkDw814VtPKimsO7Ul//dwsa3rZ4ms8IJz+jT+8iWiezxqVXrqwEj0kvvWSp?=
 =?us-ascii?Q?ANuXJi23o8mPdPKcefKCyhZuANamigdtdbgbss/X5x+ajJSIZBTvMOemkvVF?=
 =?us-ascii?Q?ak07P7ZOVGzmzmLB/e2ioR+bUgBiXgcpVXE+NeAUC3ZVooNUBENWte+aICKC?=
 =?us-ascii?Q?QdwaBx/EcJw6MPE4kNmrmPmgLFEx5/6B57HrsT3ZYFyAIN6sA6eFl5cpRbmh?=
 =?us-ascii?Q?hgGTVHKZpj8Asu4ZzH/0F/v7EdEy/IQbCOzIAtD0niGuVz3OBzDu+6mglu4w?=
 =?us-ascii?Q?C8gT/XC0R6G+UN2bEMBFXJsyUb+L59ECFECo5zSBQZqLXMbD4NVF0jmSrkHa?=
 =?us-ascii?Q?io4X5cSnsUS22LGRi1TkYlW8dDgxH44mY/F3QAZ5czLjTbVCfc/LimGDc4+p?=
 =?us-ascii?Q?WmyJk+poLOIRFeIDkLtE1aMhjFZrHh9OrOOgK580CgeCzLtiy6Wdje90cC+G?=
 =?us-ascii?Q?gd+tLkbM4+lwAvdEALhEKzQ7RMad2/laPQhcHE12sXGSEwqpT4ZJSH1uMAg/?=
 =?us-ascii?Q?iRKGTz86qeCna3n+JkPi3RUCuwH0oofplunt0lz+kDNB/7hbfbEyYcZl0gdA?=
 =?us-ascii?Q?CFkpcedcX7UQn6AlZxPFO80fjM9r93lfRZKKAoPymxqjAnDYt63YvSFBFj+c?=
 =?us-ascii?Q?PdKjuH6+nxT2PjCHw3DLHrSTiFPEi1e1vwuP41WDsydbcXSfkxh5ubEsdYlC?=
 =?us-ascii?Q?8wGOPQonsXZA1xq7PyUT4Jj5QQUwGrM/dfluskH3BR6S/5nI8BUAAYgYf7NA?=
 =?us-ascii?Q?wDGlS9farWMG5/u9wFUVhPmlDnceZGYnLu2Mq2Fl8z//C6m8WaWh9+eXY9o/?=
 =?us-ascii?Q?70eWLlndbBkPh5r61huzvsz29tP6senJE+kZ7/sFAgk2FZdSJdQ8rEnpu7iS?=
 =?us-ascii?Q?H+6KVdnenF9wq0WresX3gUlJ8cY+5T6YTeh8+Hne?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa3cde0-0339-45d0-0408-08da963f47e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:52:56.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHzZRDtTtLJt8w+G/g486glxd5PbSwB+kDUbXoAi/r5ZsMEbaWKA6MdlpBB2Zu18R0xz29CGgAFJUj1zJdGRgg==
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

Some sound card based on rpmsg may support multi-channel. The number of
channels can be sent to Cortex-M in rpmsg for process.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 3157cd5a837e..2f310994f7ee 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 		msg->s_msg.param.channels = RPMSG_CH_STEREO;
 		break;
 	default:
-		ret = -EINVAL;
+		msg->s_msg.param.channels = params_channels(params);
 		break;
 	}
 
-- 
2.25.1

