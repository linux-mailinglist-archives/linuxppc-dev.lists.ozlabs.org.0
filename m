Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAE53A5BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 15:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCqQZ3Qdpz3bnG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 23:15:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=ei1rT3PB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::70d; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=hanyihao@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=ei1rT3PB;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2070d.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCqPn1BCwz2yh9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:15:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNF8/Xdhh8geNu2rWJlGa8B8lLtHyEGK9QbtHq2gA2nRPsFxZxgG4Gd6HWBmBJav8MuCM6z3eCbM72oIGd/W4QDslKw7TSyU2Y0DUnhgQjbJoEzzNTg1HJCTVJ60mb6OS2CpHM4eCWLSSF6rYdFlx1BHc+prOYmjMe7hur2UFZza3iaSeYq+UIWQ542KmpVRnxeFlPvHTKLEs9zC/lujZngk/a3uF9osOpanSOTUsep9qlUSxmEBg9/bTRJULhtXc4JrhjTGqE1xC6OlhIBNSBhYabVhRuZbWtyo+PhHuHAyTZl3BJxU2ckv55L6b+TuATAw0YUJSvuckFLAWSDO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHTah85rWBOUbG9SckPzdADENiGKeLbQF4354TiG8nM=;
 b=YZUNKutyt79/X355IgTLTxqEz1jIjdw0CHyEJ4nP+VLXauP+fvNs4unbN7dubnXDCl4z+5PiZmqSZhcnW60KizX+LlJ40bR9t4yuEd5O42svnMIetHxUwd55z3H0eBP/WHw8vkQ84KjT/bj+CJFwjSAlj+ukTORbyMXoltOso7qqPNSWGEUOSLlkR+JSAKxU10dsGQqR5FIFkD924CNH90w5mvXCmsr1f+0g2W6oppuqNLn/eajxjQTif6x/NzR5uqJGGaReIvTAlFsCFJ+20FIrwjmXFvAqTVh2caOdySV9cTrcyJZ227Jf2Io/FM1s4m0DoVfjDNIVmNeir2QVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHTah85rWBOUbG9SckPzdADENiGKeLbQF4354TiG8nM=;
 b=ei1rT3PBiLpw+wrqKXAwbVWCwINeNHutalH3UlR2u4wGI3/qsOGIUIbGTSlP54f8Vic58sdv1vVw58tOgyZsKfDQd3MR9zmZjIVIZV4C1oj5ranPjXczfpe1ov27va0NwRF21t26j4WmtSLCaZXg4uL02/gvcoQVK/bAX4W75H4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by SG2PR06MB3547.apcprd06.prod.outlook.com (2603:1096:4:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Wed, 1 Jun
 2022 13:14:42 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb%9]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 13:14:42 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: Check before clk_put() not needed
Date: Wed,  1 Jun 2022 06:14:29 -0700
Message-Id: <20220601131429.9794-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ff8070-a217-49eb-6ee0-08da43d0b072
X-MS-TrafficTypeDiagnostic: SG2PR06MB3547:EE_
X-Microsoft-Antispam-PRVS: 	<SG2PR06MB354785F5FBD62DB0AB30011AA2DF9@SG2PR06MB3547.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VZ8+WBQfRSdqCF0AE2jHeMWUQ95LpSFSvFIPhOlg96seR7LquK3yoc7A+Uj6BbYtnUgbOXd3q2fn3AhUUBgRP+1ehUe9e0pGxpS9TobSRP5uEEpqLqypbJxs0WpbWA/YhXKyoOAt8vDizptTpCbZQ2ue0Wb+CdlsiHoSR09l1C/kQADe76yV5mfodXIm2degVDNWvGDo6Hzci/egl79Supb3e6m6PG+e018dPpGzERl5gRfA6TG+emM5ACDyiPakLXeMCD+uf42LP2h2uFl1Ab+MLQBHeGjoydrt36xyon4IjxpM0OvC3FkTo44+ueOWAunih6cHFYpEuHtoa8RlS8bWulz/BEClNnMgfp8gHmY0135gDz2UAnWbT1MTKe/Azlubc4ayqYWl5a/TZGoOJf82j7JosTXmQ4qqvPfeJyd/gE2Yx4Klr+JlemPEpFq3z4IXCrYYQBsK7wP+qrQAIH41YC0G713L/h2XctYk6Mc4CxtQE/sSlNh9fBuHGtTffrF9n/mZqiQ+EYOFB/UAK5leu/z2ydcdI6tcsd9Qwg7WExCEyIY5ANk9jf1CJXr55SIs5x9hs3zaV1lVp3bhwEtkC6O5qWUqjS7qcuDuDM4o45PpWgmksN11IklNOIvtbdz0x05IUlHbHbRb8xemy5jYF0Kph5tO/tE7L/ucX9SmzfIGi3z2qgERAQD/mPIvboL3bIjU4kF3NYjhhbnP++ZFxFLLAKLd50Ux4siONIA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4173.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(110136005)(316002)(66556008)(66476007)(83380400001)(8676002)(66946007)(38350700002)(4326008)(921005)(38100700002)(7416002)(4744005)(107886003)(6486002)(86362001)(186003)(8936002)(6512007)(26005)(5660300002)(52116002)(2906002)(6666004)(6506007)(1076003)(2616005)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?J6uSXer8Ee5OJP9Y7uettXELyc6FTd+BE0rI1XDYyBdRmLSTl5CeIeNDyfMt?=
 =?us-ascii?Q?peecR2LRLrL22V4I3gZavcWd/6+TyNdCRZGNhMqyU/OxMEilnnsh9lKtxQZC?=
 =?us-ascii?Q?S/x0U6qMHbHpavh8CCGTZiUdkcNSWQzwWFcaQbqA7oS83u4hxI/VYin1P62a?=
 =?us-ascii?Q?K88HcJ/O91u0yHw4dEtjg0o5oADVFtBaOT10oX2OHQg9HS5Of3XhsjFvZKDN?=
 =?us-ascii?Q?v/ipZEVYAj0T/FihebMY2l97EQLY7d6SDCcPNdSCmH4PGh3wT5BCOUcWeIOW?=
 =?us-ascii?Q?zbVDHAvIotmNclpAVTZddLSQ4giA71RjWExibKVppOHGCplSOQmd3pzbsCnC?=
 =?us-ascii?Q?HS6WjVXdmttxmrIWZxnbkwQWT2irwp+csyjyLr/5q+BujmbwXMTFIkXn21zv?=
 =?us-ascii?Q?lx7Sl11cvnMh00c7MILkqHbitfhDBV6CdlkukH4Dj2Jyw+9JYfQ8O5SpKuoH?=
 =?us-ascii?Q?Bxx6RZE40V6CHkn1Hgj4BXUhD4LaSt7UipUDnsgk0gkZnnMmJ/Pg5Uf+VJF8?=
 =?us-ascii?Q?SU3lJrH97PUgWXNqOwtZNEwoabH4am0NJgiUW7yJoDH0GKw1to/o0dnot/NF?=
 =?us-ascii?Q?s0nxhkiWAjqC3xsGjaWQAbgyEYctv93SM6cIlx3b/2k+mK42gf2p5oCfyp1v?=
 =?us-ascii?Q?OMwEsqEMSPe3W3Gf/GRIjmr75p0JFRoGlzS0Ixb4D49Q9DmzX44fnOzZcZo/?=
 =?us-ascii?Q?nNQe5a0dYVnMBwxAH7X/YfdNVpSU472mTsorBqtuXFxq86dC239yw+hVne5v?=
 =?us-ascii?Q?IfbRP6Yipg6BfrlC/AhHyaEVz9zP7BQxAcmiMbJYS1ySKgVjEsSObF3t+qNf?=
 =?us-ascii?Q?XDw1d1PnUIF4bGAsA0ElDzzziArQqVVP3uDucqnSq6ANlOtrtfiPYHVVmdPM?=
 =?us-ascii?Q?wyOeX2g6t+6hdV40qIPCkzmTvbGHp4c668b3wt1Rl8Ij12mWYFHr1qfSEnb/?=
 =?us-ascii?Q?Dx8slLHIfrR2qp4yhGsj7gGG2kwOj8sbP/U5l7s6MZ0d/XEHlTz7weJLkzDQ?=
 =?us-ascii?Q?+SHu3rUbKpbGlhEEiTOGEuxcynEGtuM3uY/8VJRB2HByrWdStg17lTzlSxV6?=
 =?us-ascii?Q?pxEaEYGCNaM+iGF3J95TiBSwqyDJ9JN7AWE5glcZ5La9lfAhzuhhohzrfP2L?=
 =?us-ascii?Q?v2G1GMSakG++IPLd6+T/WCweMtBO4NNJya5OW5e2LbFjOe9WwMWnyo7Rv9bk?=
 =?us-ascii?Q?5ZgMwgkMgHU+gF/eODcjzStbCp49hs2DoGX/4/tR3mFlOh4j9dCPqt+sTPrf?=
 =?us-ascii?Q?D2vdjt07S2MnXKIt+0aQ+l2+5zuDkr4scsbJWVkwWPr8KTlaYZaysrlXAJ4m?=
 =?us-ascii?Q?/te2dVDRIYPHTQYCQZtRZZ+YJid3JtCjY9EE9UXSw/KFZ4pu8Qo0vi9CFjmT?=
 =?us-ascii?Q?0BN1k76LPXKjx+HCcocc48zqCQyMstAf2E9Cw14oB7DtvcB5LJcGwrckeBHi?=
 =?us-ascii?Q?TJcH7suGtByzeQ7HAiwVgTxnUrPeMdb/X7hvIu1v9DSA5b4+M7nxO3bbdYjM?=
 =?us-ascii?Q?N/pjfVMYE2tLY41HvFIKg0bnxa7wlbnhh/Fds8sQRG4Z0H01X6YmlP/WATVW?=
 =?us-ascii?Q?2H8o/sarqDRIe4a5/zuMnr5rYGvjMSBH4j66gA9HbG3H2hFyiceQv5GECTZb?=
 =?us-ascii?Q?/ZArfaNrLW0qiUrto7P6r/cGx2Q/3lbYWWjO2y/IrY5NM/TxoMWn7couBoem?=
 =?us-ascii?Q?M9FnVAfE81h2tdeEgqj1s62LO4TN7QiWn+7IXQFVqSYcIw4Pk9BETU8VfjDx?=
 =?us-ascii?Q?lZUU0sz6uQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ff8070-a217-49eb-6ee0-08da43d0b072
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 13:14:42.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXfDyTAxSZmQpuDD+k/8X51OE7eijmHXAt83Z22vgtW+zJ5XQvm5vjYaig6gFEFK1ahoPetZE7wQ20PaVjXYWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3547
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
Cc: Yihao Han <hanyihao@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clk_put() already checks the clk ptr using !clk and IS_ERR()
so there is no need to check it again before calling it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 sound/soc/fsl/imx-sgtl5000.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 580a0d963f0e..16a281820186 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -185,8 +185,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 put_device:
 	put_device(&codec_dev->dev);
 fail:
-	if (data && !IS_ERR(data->codec_clk))
-		clk_put(data->codec_clk);
+	clk_put(data->codec_clk);
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
 
-- 
2.17.1

