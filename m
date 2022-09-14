Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA65B86BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHJm5YJXz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:54:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=J5KoNIRI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.85; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=J5KoNIRI;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHJ2lm6z2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:53:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrE4bzOnqpUyHGJ+1QLMmD+3uDSJDsn0bLP1RYJfqP5ucWeFlMNR2gWMaXvdCwPAt7txVx2gKe9WuSOMNrjrUUYkXoXp45sAP03hqBBjuAS0JQpnCPy3PkZHrbr+vAml0opVuEybbf9sEawV8jAdeo256eS6t9qsktL9n7o0ekhwiYdXl0PW2t3LlUlUihPFJNpHcdQ0qX/hOoUqE6KUfk7Q3iqEeleszbVhD/9vdYzgnzGvK4PfAdAQ9ZNPc7HDizItuNEzGkueYUfNfVs3iBkGFKbWEvdmAQkzhbPjhTJfrAbe+AbG940RFSG5daSmwetohdSj9HXPScDJPa+Bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TKgRDoukB1V8cgig6wqC14VRXjV1C9MOU674acfqh4=;
 b=howOUtOJIK4sBNXNHEdGw8I5yfSW46bQJ87BdF1EfICD0kr7OiceYGzNhzDmsoiq4YSNe2zPnKeHjoTCvlEA0MUw0jGazg0K0t1QKHJagXvNAn6K+Eo0kaw02yludvhObyGoTp7O2AJ8O5bdxSnpE8wO4Vmxez+up/xZuwvhNEZNxdDoAoUAOHHvvWd14VqB30gB1067Zx7GP6bzRhZIpFf/lPVVNDLXLq0l+tOHWAKa5WefJOzRCSDVU5g3PRFxxHvwTQl5EQ65tA4oBccy3nLh/7e6u12552qvM/grpqk2ydcjL5WAJDoBFiYkYg36wOeJMmNoG/SsAhh8QtffrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TKgRDoukB1V8cgig6wqC14VRXjV1C9MOU674acfqh4=;
 b=J5KoNIRIY4obssar38p6HUFZ77frNoW5v9MDcslqb7mE2A6IQO1Q9cmcPD1cvkMl/nUxeF3FSXJkGG2IYhSSL1DSCBhiZbA8Mi/qrJqfzdKdxkxKuRrkZOOVBFkmWopLKqY8RZPsRw4Zit+aEFp2xYrXfuNeHaLDOZcwvscT4Hs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:52:41 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:52:41 +0000
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
Subject: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to assign the rpmsg channel
Date: Wed, 14 Sep 2022 18:51:39 +0800
Message-Id: <20220914105145.2543646-2-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5688576-1395-4e4c-f64f-08da963f3f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GAikBegB/awLzKR2Wolgq8rrUSSl9ALAdvDyyli4BW0a4fYi2sHwIIVl3oRe8LiIzXjaMalMXNzfy7rAxMJ4JHJvDdI0is9IqbAa7KB1gWf/kzouDX3VpgYG/b79FxPxGVmyWyyz2JQz5p3mjLsc5AgJvEFuK/OirxEbAJiBGY5qRtD/mIJiSWAOXn+yiY2qnzMc5diwHcoY6OS3wqkVQXZxIVVng9ViNIayLvuYcYUnKWW6HYDR8R0b8fK0kp0fv4T7TudlvZzrz09X6xnpFUGx0eksURBHaKAa4irImMlZSne8CUHFnZKipRkUFUovHRNLVSk511Z3uoVAKuCrhdkSq/NH9hG3nfZ4n/5qNoHMqznVovZ/VBF/25oPoCy/CkL/ee11ZJQk4QnuMT9YL0phXb0pSRm3P3AIf00/bcrLa+0nW8D9rWO+TLrMjP1BtN5+7agDbK0S3twhbsWkTYOn+TNh2QHN0XhouVMwGMjfRp7BZnZC3e9GL+zpE6e3u+zL0W7A8gx8ypZB9FhEvHZnxznuS6pd3z2Tl8L7lqGf1TATBxFAociumQeGugmv5zPqG0jvhttr7DcztKI+ZwJDa4E0jc19x+0pn/In1a8xwcbJE2gvMWWzajr89X+G1uWy4IvUMfDfy2DbE2n8rY/Ds6jkumVviTmfk+u9trSrWHLYPGpYOjhIx7+tkLcfuVuTXtIafJpXdc/KBRSbutk+bI1NeajYvJvbz7LjYcQI4N6pv7NBCLmypQoKOLS2pk/kE7vlzT9MDkLIB1zbV37j3bRZEG+CnBOH6JsjT+A=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EnCWGmKFkjqjshTZV5wqXzvBC7GsfhDZHnhJqPO3adaX5XqsbOtvuj/GJWcH?=
 =?us-ascii?Q?sEd3E8YOORcgRHtlI9+6kYG20hE5dhJyUuBWSfNU3haS3Uzwn8V95rE30b03?=
 =?us-ascii?Q?AO52C5Orwq1YcxQYP5kZy/4QfiJpP6DyWYRVvnVKmcPods7wHn7PucNhiUxK?=
 =?us-ascii?Q?6v1MEUVKGSc4uiZiCJByVYZ8k3G99MOg4gILTpJ4gfeCNyy+QlzpHBceGNMB?=
 =?us-ascii?Q?jtPRn8BfigH/Drr8/tu86qOdC146vbA5Vt6RYd+smZ8WTvDAUy6z75KmFVu6?=
 =?us-ascii?Q?u+ti0xc/K2QoXkIByvxsOkfwqEUZj4/G+E9zvxweHh9TplwKeG03Pukq4kuR?=
 =?us-ascii?Q?6gAbqldn4kdeuBDL8L9ICWmuJSyXZRBA2OaLIpBQw9dUOkfTHj+Nhfq68Haw?=
 =?us-ascii?Q?0Xp07X6ipk0CHJhVOTNAfnMHvktsMap5HWjy6AuRrCJRk3d9z2RGIFgbfyoh?=
 =?us-ascii?Q?qBJ/DOsQJID1+wgOz+bN3b5PVVjdB2M+VrEEbdMKl7Tf7bnsG0rAprGPjr5f?=
 =?us-ascii?Q?sSqxHtQfjV5wY7gw2P/NGdK29Rrcgv3Nli8Ob2NIttdR7pmZKhLa+j3Qb7Zx?=
 =?us-ascii?Q?Z3nOLpu+c0YFp12rfICYX73h6PNbpbiNc97IX1IcRKIXsqbDPS3ZKRDmaBNp?=
 =?us-ascii?Q?FrEkuB3PyR0GpNwWrYxruiRXADNy6V52l5vtgrdjeskWxcTqHDrvNJacxzPe?=
 =?us-ascii?Q?8SCSI0gkFb9jDEmPe4LZZkMtXM2s8cWrM3gDIv1FjFaY4TknX00hKIx+uD7d?=
 =?us-ascii?Q?+rlOmjt+SW8ejp3MQ6wXBxBBUkqmk6yPnlESYTwzsrtAR8wruQhgckE7SCgu?=
 =?us-ascii?Q?Jqau3h2XnnnVN/o/LdargafiLzEQsnX9mK1S40ouxga7hlJQ8UNKKS77xuCG?=
 =?us-ascii?Q?QeyJ7YzLbFpsyPr6l+MnWpMNDe2ZVYlD3Nvu87c/QwvH0NhDLaULU3xlhPyL?=
 =?us-ascii?Q?Px6jOrc8sE+OnuFGwaTLu9uYu91vcpmFwv5SPRfsaXgqgDo98B/c5XS/IbtU?=
 =?us-ascii?Q?PiFfe1cjMSIg4uQD4JVuOqPARoZ8RAPxiIYNcxPQJcbg0dI9xSU7zVzWkn2r?=
 =?us-ascii?Q?KHXi996vZLa65z2w0lcXy0732augx5Qko7aF/mq7UPYiszUhKug6fdLbLaSj?=
 =?us-ascii?Q?odFHpxMH1vJIMHO8fYVeoceNfFW2nNLH13gJEUAiMKUaJc2XEsTAPeLWNDmr?=
 =?us-ascii?Q?7Aojf/ONYEzPCzw287OKqftexFjkNLSJndtAl82dsJ1z5ui12PElAavBNg/3?=
 =?us-ascii?Q?hxWzZBfeJTpYOKN2fnJObd+HU4RZWZ2rjsoKGYq6DKjpWApDipEFHEOPAHIi?=
 =?us-ascii?Q?vxUbjkRvDgCuzLUO3lXtuOObTLdj0JBk9Y8xySSonXZarvgx1s0814NRmhIC?=
 =?us-ascii?Q?zipRIqk7jF+v2ErDaiKYODbTl8tNENurrK8LeUCf3fZOOC1GMlfbomoxpXo2?=
 =?us-ascii?Q?PE+sYi5UVbzUCvnPbhxvHrQ0I1q9Ob/Y2i89ZeEdHtV7OFOCYXxBRf9WBV1Q?=
 =?us-ascii?Q?fIkut/qFIy4TI1E1amPnBBjXKYJ7pr8ShSLqESXgYgEXVLZwGfgVV0EcH/kQ?=
 =?us-ascii?Q?0bq9JuqnrcTU5LaE6ETqF8N7s6RBxwP1ZhV7xVWp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5688576-1395-4e4c-f64f-08da963f3f2a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:52:41.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VZCFfHTxf19CHUoaMwRfN5nm/LNs2sr+K5Dcaxi04yMTouPMTuJEps0DjPvYvLyB0GSPAipJ0NJj8vePHKneQ==
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

Add a string property to assign the rpmsg channel this sound card sits
on. It also represents the name of ASoC platform driver. This property
can be omitted if there is only one sound card and it sits on
"rpmsg-audio-channel".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index d370c98a62c7..3744ae794c00 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 description: |
   fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
-  are SAI, DMA controlled by Cortex M core. What we see from Linux
-  side is a device which provides audio service by rpmsg channel.
+  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
+  Linux side is a device which provides audio service by rpmsg channel.
+  We can create different sound cards which access different hardwares
+  such as SAI, MICFIL, .etc through building rpmsg channels between
+  Cortex-A and Cortex-M.
 
 properties:
   compatible:
@@ -85,6 +88,17 @@ properties:
       This is a boolean property. If present, the receiving function
       will be enabled.
 
+  fsl,rpmsg-channel-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      A string property to assign rpmsg channel this sound card sits on.
+      It also represents the name of ASoC platform driver. This property
+      can be omitted if there is only one sound card and it sits on
+      "rpmsg-audio-channel".
+    enum:
+      - rpmsg-audio-channel
+      - rpmsg-micfil-channel
+
 required:
   - compatible
   - model
@@ -107,3 +121,22 @@ examples:
                  <&clk IMX8MN_AUDIO_PLL2_OUT>;
         clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
     };
+
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
+    rpmsg_micfil: audio-controller {
+        compatible = "fsl,imx8mm-rpmsg-audio";
+        model = "micfil-audio";
+        fsl,rpmsg-channel-name = "rpmsg-micfil-channel";
+        fsl,enable-lpa;
+        fsl,rpmsg-in;
+        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
+                 <&clk IMX8MM_CLK_PDM_ROOT>,
+                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
+                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
+                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
+        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
+    };
+
+...
-- 
2.25.1

