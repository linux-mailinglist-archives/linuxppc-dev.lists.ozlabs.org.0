Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4F60EFDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 08:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyZtL2TT4z3cF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 17:06:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ks3BeLOv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.8.71; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ks3BeLOv;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyZrL4Cjzz2xsc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 17:04:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUu+k29tr1SYsbyvLA8M1v73J1ExeYutKLlNEvqCPKBqktuZUyP2Wq5TvB4afpfz152jGDFo2RohUNG4zMp9wd8a7EXHTXZEc8xdyKT1XK/Qbd/Q/sEKGYqboV7yHCY1cD+UyNGo9GFKu5YZwwlGeUCzyw8oQcq0u4k7c67bpKq31rUWNl7flEX8QfNMYG9uyh4wVCIgxAoi9ygiEJHvHKK+NdpucRD+p73zKAIMayVKqR6IozT/1AIceMsiPcwH2bEUlP6bMhkDDDsMe5dF3Zz7i9RhPt2C+GJZ+k0V1vhmAl6qP82ApMSWIZTxLlJ6UDjiNggIxkHDn/fsrqF8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL45DnOcIJNlEGA85RiH56V8vAbSN+NSK5ou6vm3bGQ=;
 b=l5KLdXsGb4dvCy0QsHbf8Sh3Q+gCHMZjFP1tb70wg0kWjBZOftDXj5WgTZs0P2hKEoG+gvNLv/ESwNvsReYXh3Awi0ftFJ8nvQNd5HTV/VNSrhnMKPRAKn2+cBUXXATI+DbyV6WFA2MOFdPNUtL5T6BCHHGmXYn7kj2HVG8SCCq/55rVDY7qA7wLvKuifLeec/LAZgaIaQWI3aNOjgFhcvmW/LMhIOo/BWsx1VA+I4Nop/rvDHhiOsZVDLKen/7+iu4gBCZ40ubrSClzR4vJJETsG4qgr8BV8qa0KrRUPOp95LeeuxHki5e2YEd8VVLQAPIzt9+htuVuaYMD/3e3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL45DnOcIJNlEGA85RiH56V8vAbSN+NSK5ou6vm3bGQ=;
 b=Ks3BeLOvTER6EUuORORdi/+aFt9tJO4qA8bNEnKiC0mjUOk7MtAz4iUR2p1T+hidC/ZMg7VpaN2V9it9nJDG/8Uud4rtW/2ILrRVlB1O3hP4TnM5C45yZ7fLgAVOsgxZ84xpBXxdRzxGunWmWAxx6W/slbDOhFY+GkrPavBUr00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 06:04:00 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 06:03:59 +0000
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
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
Date: Thu, 27 Oct 2022 14:03:09 +0800
Message-Id: <20221027060311.2549711-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d362a30-5489-422c-54f4-08dab7e10a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k+SbJKMc9zcPGMXoNEF/OetNkUuj7w2kn1p1zAHxRAlxv0DAAcX2NKR7MmQKi+Bnl2/BmkMntC4lJde+rquciJM+wv0De+yScfXtDJowr1QhdLQVi/nKNo3HX23hLfGRCAcfWv0fKlqrjPakcdaBHqz6RHgf/60AxZ+ptPntDxmGkbdvCj7EOZFaQ99kzO6RxsJ/mrimewpf6PDFLHjHXqvjZfQ+kAqeR95+RVaBhW8yMpQyQrGaf8Rz6W95/RvgNg0HrsXowOJNrEwskFfnsEJAoZ2DESxWVSs5Jy/13sdLreC+0KgZ9bgtX6heHka7wjkwm7nEB5GHEMJicv0ihoB11oKkVlqJb+rXVc5rN6TI3u1Uu8WUXTTljOabP0iTpGyhPPYrf1cg7rl6qBOmFYDE1jUKNLvtjT4TuB+Fl+aSb8BHiirolG8g4sx7cMqzz1lhN31xL84pOdYk2qx0jHb61Inh10sRfU8RfL+5qfBS52JLhJqtlgussayJC0GMv92E74q0fysfhj3s4p8sN5Iht4Jc3qft0nayCS0fD2m6amskT7xDxLAC8L5SflohF5mPUHSetN+XC5+5PHZ5aI35fxvRNyC2MFwJtkmrbeO5Nti4S9yQQcjh6L+wPhbPSu8Y289PwLssMaveqJjKMRYfJPugthW3rjnf6LQrOv79aIjiuL4UbRE3b1RDL4lk7ppw467JOSqOzRixRWtvurLO0cQvyNbk0KQa1vLsPBPop85RvvnyXC3xVGuXzerwFkVgpeY05af4nE623RZTkyEjs+gOMxvz1NNRHYi5jNQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(38350700002)(7416002)(4744005)(38100700002)(2906002)(5660300002)(36756003)(86362001)(921005)(186003)(1076003)(26005)(6512007)(52116002)(6666004)(2616005)(6486002)(478600001)(316002)(41300700001)(44832011)(66476007)(8676002)(66556008)(66946007)(4326008)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?H6wRCMHeGWPPlLvn/TVWpH5RHHZC93Y9IvJZSTpFGNhOH5aNq0zs96tC+eN0?=
 =?us-ascii?Q?TrdJ6TMdXLrjAKbGEJqZ0taC0JUIoMCf2EY3SOilEofbYoujhFazWbmM7y0y?=
 =?us-ascii?Q?KJf2CHlA0GcfE9Ug6pBa3ah1FXIHhX9qsGc0ggornDWWMgUESqS1gbAucwA7?=
 =?us-ascii?Q?rxAFCNbCxOEH+j0EpnLSW8GIDrZHN6d/T+bgl95UzypYsNrwLzkDT776cbOi?=
 =?us-ascii?Q?bbOB0iE8qiY6RL5KYPzqpgTz5LjJ54NGMWKzTUqgGLiWPJbfIlA/pO4n6xFW?=
 =?us-ascii?Q?lsbGGt0H7Bt+oNUZEnTdoGvLUHlgHSq4XZ7bQrHDe+M3MmhezJ2tLjyb+Nh5?=
 =?us-ascii?Q?FwTEybcK0AtmD+Lk88i1B6ulLEZOPfbZCmlO0tei0JXyMG09CDizN75odRvD?=
 =?us-ascii?Q?4ZVf4StVZKqYi5w/6+D+oU99wzuz1o2+D6kqa6qskTuhvm3Sl5iy+VPyoSdU?=
 =?us-ascii?Q?AYDCyLynK09qvs+8IQR7Ycef5JHbPjOPt1fhphfg1smbT3pmVibhPjwMcJ9t?=
 =?us-ascii?Q?5rHpVAUYATNoDZgCAW476RgpykRVPKMKsiGDFXEUiqLT45xUM7suDHGfgMOO?=
 =?us-ascii?Q?ClfnWew+c6u5nW4mrJrBiR76VdbE8O0ivmFgKRgD7VnBgoevCZMvN9QqAdAS?=
 =?us-ascii?Q?QGJWpNUvug9meuGfBbWijlPh42NfoQ0d6JnOfUX/pqMaQ90S05OFg5O2Nk1b?=
 =?us-ascii?Q?3ODi71Twn2ncf91b9KyEhuSS6Qp1rVdavCkosEb0n6kP66CqyquMoWLe31fl?=
 =?us-ascii?Q?/Qv1Yf6VD6p/QsbbvaPs9UgpzLoo+T+qbrzXsiZYIlU/rlKcwZwFvTWFcfCX?=
 =?us-ascii?Q?FP2+YwvUxcHYmpt538hEXUqESQOPsKS3PUuRLvdd2XEKzqXWGP9/rjddpkNJ?=
 =?us-ascii?Q?JRu4hfr0fIvKJOKfxBZFbb7jPlJsan789NxyID1dKgIlPF8Q0SBh5LXqyHjF?=
 =?us-ascii?Q?ijD76aJcxZ91g2IAhp7bpSi3YG7FgxFPmdwfTJrkkNThUCSiXee7nmVO1+5J?=
 =?us-ascii?Q?aw1lbt1gB3zC9uZEYomdQZSQcEyuOVmxypQAQFCa44EDRRn4fp2au32aZ9VS?=
 =?us-ascii?Q?jS+Qvq3ZAyOEu15laVKvMQquJlBn0Ln1zLDEbkoM8oJv9VySs8/3q5Z9AfU5?=
 =?us-ascii?Q?RLSX1nzy9wrLXQ2OZ0ru++AYV7AKQ2VZ0nIuv3KgGcC+ghM0ECCxb0qBIEsp?=
 =?us-ascii?Q?suRCuyVW37Dj0q4jI83GB+oO3aZIv4u37fE2CFeyD0bM1YfLDbnFJjzoUZFr?=
 =?us-ascii?Q?/RPMwawkCBt/JKTRZbHw7I5LMJK2K5R0+Tg5wfBZt+zIjbBICojoJEp/Q/d5?=
 =?us-ascii?Q?8FpZxG6paODmvfjlKHa/pVBumaBUJvnCPeC2Y5CqwwTKbJttxjaL0FuLbR49?=
 =?us-ascii?Q?QNtM02+2mztAQ06A1meit1dD5gVKgTxxXK/H4BhG8wxYgrzFsi/Fi08divFU?=
 =?us-ascii?Q?11pghjFjXyV1G8CKfkYyvDkj/2X77OLijd3yJSFWZNGJDeHPSUawVemhg4Rt?=
 =?us-ascii?Q?XoxOWeoQWezsmUUxLk9wknJf07tb7tJis/gYb3AMC9lC+JNLUNK2imSUeiTq?=
 =?us-ascii?Q?q2TkBpq8aXUrI71LcfCYmbs4wIF/0JkIROvPiCcD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d362a30-5489-422c-54f4-08dab7e10a5a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:03:59.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0PPqUjq3CdVoUtmUtF9MaXQ4MsvJeWSNQ4TgrMmuhvGjtiocG2qUv8KHOL6rAhIQymCNp5e7lGpPlE0hmoY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805
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

Add compatible string "fsl,imx93-sai" for i.MX93 platform

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 70c4111d59c7..11aab891288d 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -26,6 +26,7 @@ properties:
           - fsl,imx8mq-sai
           - fsl,imx8qm-sai
           - fsl,imx8ulp-sai
+          - fsl,imx93-sai
       - items:
           - enum:
               - fsl,imx8mm-sai
-- 
2.25.1

