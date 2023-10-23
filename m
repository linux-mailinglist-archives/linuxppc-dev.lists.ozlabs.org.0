Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A87D2845
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 04:09:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Aeus8U0c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDJXG2wY2z3cQx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:09:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Aeus8U0c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::61f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDJWK31ytz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 13:08:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzN7aKzCk+BDfNogfjJ5OuluEnhc79327g1uqRlLu2NIINPB4O47eOEqI9pgpy2AyTaJF2d2CFNoZR0TcZPwBkJfFVa+PzRH5ATD2i9ZInV5Vi/wO9v6iWc1uBYtfZE7SWdV+Z8NnYrF1hTmM/VXYR+qhNEQ+zWgsYWc+mfjGmt9EJEuKFxQScpTm9bCHskg7NTWLUJ2xehDZj6yKecD2efGRUmWAiufQASlTamKKciA16wwwPFwEgMCWXx5H4+peMuXV40WGtUUFJNV72PJ5t05R81zrVJMbHzFh+oHukkn4Ynl3ukruLjHkRtvgBfvR/aF3x/u3qfQ2R9Q/7UFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f++g2rGtSQ4fZrJwJVrEOL5nHfAM9mVl1V7lXB+m2eg=;
 b=fAMTzJbckaOM80kRiY1GCv5cjnGOuFRU1Xly3naV93y8STf8mRsjSd6+iwyveak/fXeAo4aCAR0NVm0Amv47JVcHPuQWD9ABiEsUKxGgnattFoGkUHDzXEryVgwz4FJpRJZrxXpyAW6TvFoh0yyOlXlf3uqWc3vU8BezThMd1ioQ6xbOA4ARXErpZw6FXIzHk0R9W+tyvPWsm1caTAbaCdy4Rc2VmZYYVGy+LV7Ye0v1ProrceeRJBXDTgbRsMIJoDCNiNE7NEmOuEpbJ3ykm29At6eksFRHEa+4gZ97jTy1XtSWLiYrZBictDZJc+ReJyYTkxDorhf0DODukr8Lsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f++g2rGtSQ4fZrJwJVrEOL5nHfAM9mVl1V7lXB+m2eg=;
 b=Aeus8U0cwnlk/d79eLKlgbjmwCLbyT670m+g6RUEggYibyNreZVpi/+++77fPAAXv85zEodSGcXGj/OXjYu12jh8mgZ9FDU/20n4z+gxDpAfZFP9EkKmja4/YdHnLFJdn+X7RI04hVcxpQUcefLUdT0BiK7xywl8Oog8YKEn++8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Mon, 23 Oct
 2023 02:07:46 +0000
Received: from AS1PR04MB9504.eurprd04.prod.outlook.com
 ([fe80::ddf9:e4b4:367d:bc06]) by AS1PR04MB9504.eurprd04.prod.outlook.com
 ([fe80::ddf9:e4b4:367d:bc06%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 02:07:46 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: sound-card-common: List sound widgets ignoring system suspend
Date: Mon, 23 Oct 2023 10:07:17 +0800
Message-Id: <20231023020718.1276000-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To AS1PR04MB9504.eurprd04.prod.outlook.com
 (2603:10a6:20b:4c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9504:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1c6f3b-d8e6-4656-fd1e-08dbd36cd98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UvSp8dQQrrb/bpmiRt3iflsef2hNGNaxnH1f1Vm2k0VHneXkLLtipP7aGdcFvGsOkYN/kXPa50p3RSKDCxi8Vk4OFT1401ll6lZ0cqcveFPlekMA110Q9vdCSxa51DEdE1yeEK9AfAXhBYUN4i4mTw/InUSxEmX+VFrVKqFVdfzBHu/G1IXg/kEvdmV/++TxUkcsY/bXTYrKGT4PJtlFEgfvgoezAdigXMWpkEgzKdU2nfNJLcAKWHVbPRUrKn19zLUJrfSl71B8HdjZCVEuJtfHa/Q292xJB4Z0bwYPXvaA04tryeMZ6ECaouOEKC2AYOhDZAGIY67ZNdxV+jPRYuApOdFACzoqPcIEZjPyRezmsV3LRtgaR1sW1xQGqpQHjQ46uY6XXJUuZO1M2zCHSxSdnSfiz274ljJCgpmwFtQUMl4en08K8F4qSICs+s0nTBvda3uKYnZ4H4JA7g4sRvd0nyyzDsdjBKkLIZC127EpZ3iRAYbw+xdBGOB7XSeEa4g9MFQT670tZvTt+vJCqdfL9JtTZ9/K18qkVZgVttyO/n5JAjnDANoJ4Ibo8DxZA3M3IggbLUIjK0tDT8f7u1cB3NxvwV5xtpgMJ7JfbUl6yI47ee36dEpDd0lvySPNq46iauTm3GLu87nlxcqGCg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(15650500001)(2616005)(7416002)(41300700001)(2906002)(36756003)(921008)(86362001)(26005)(38100700002)(38350700005)(83380400001)(66946007)(66556008)(8936002)(316002)(4326008)(8676002)(5660300002)(44832011)(478600001)(1076003)(66476007)(6666004)(6512007)(52116002)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nslUgNC66YvASx1H8VH+RAjT84x2+GYG4MQVPflLnZWQsysQndQiyv7H+XLH?=
 =?us-ascii?Q?mcY8IGrLHTCu0d7TRXBDNGmf9p/DgTB2J0hc8P7lfK/rC9NQQYxIMgEyUgpi?=
 =?us-ascii?Q?WYV6rRoEgRPDEtZpeiycvO47nMFA1x0geA9L6PIF3UBRhFR8+8GvHrsirt+7?=
 =?us-ascii?Q?5gxlbF3xDFcNOxiIRQMugm8EFcKqA3rYrXFZB6DQehfum2RAdHOs9EsNRzFw?=
 =?us-ascii?Q?8VxrqjOk/Eb9o/d2uqyz19eR3TaMqpchOMWmpx/mS/LpBlYfO39xvhqbMbh5?=
 =?us-ascii?Q?GXmgP+6PENgY1xgHqeeL/aLo8OmoYgMYpPIkmWeFiw0CB0lnbYzNg8teJWD2?=
 =?us-ascii?Q?5vxVKZrCXmcp45cFUwUQzNpmKeH3dsCzEpmvnCy31D3DNbR1OClnMDTtI9fh?=
 =?us-ascii?Q?TW2KSNfAAkGLFQ2dIHfGkGRjXpgrs9mBhWvTv5dfbbyYOlb5UUcPSKvtod7p?=
 =?us-ascii?Q?lDlV15UfvAV20bR22Thz9z91rR8SArfzRhvKFx9QzjZfwExVPBjSyvJBSqYF?=
 =?us-ascii?Q?+JIUcbUQwackirDbendxCqB3OFJu/EudvUdWF5/EknE67j31xyXaXPDppcBC?=
 =?us-ascii?Q?tOV2//Z65sCDbJTCXuV8FmWbhQ49+gPYaz2n0l5HOE/BJ+SYSNuxtBCJq+fe?=
 =?us-ascii?Q?unVm9jigK/y25AGLjaMV0KfH39+RY2drXadyaGlzcZEBuoLToihggmbKbbTO?=
 =?us-ascii?Q?/OfTax2mOaa5ARHMH0qofGn8fWS2wad0H2grPL3aX10bC1GqGsK562cZiaWg?=
 =?us-ascii?Q?Kqk2oxnixOxeuVAZid5uYTVq6jUvVPYJ68YrcWZZvcamC2JjNf4rDVE4asIS?=
 =?us-ascii?Q?VQeRwSQS+VQZiuuNMEQnwXMEhs+tKHddVYlSODxBvai0U9t4qRgfptDq0/Yc?=
 =?us-ascii?Q?ic15NM8EouH2W3DIP7QFetADmxN+nPDZV6Rcqz1e92SC2mnIM+zi/oCfywdu?=
 =?us-ascii?Q?166sqW57/rCXaZ8tBxRkovwVVQkEC4k+X351oheid6hc7+ZHxYJfKrBJ4kgw?=
 =?us-ascii?Q?2M1pldC1zul+iPplYQXrYJaTeT28ZpjljkOnTv1J99sUTUBnyAeTizU5K2I3?=
 =?us-ascii?Q?7wXViymXK4YwRBTs1TdHKrexscB1hH/SlCJVktjKox0j/90jLVjTqJIsZQRZ?=
 =?us-ascii?Q?vH43wQ/HX1QtjW66BtCvxSd4eJViyhcWCPloXBKRd1zBaY+4U+DZsLcPyEyK?=
 =?us-ascii?Q?Tsk0TO5OG52fdrTZL7NZ52gBA72Vu2voa2B3T1gzVVDN7ijy1Gij5xVa0egL?=
 =?us-ascii?Q?hik48VeukcSvSFlR6XgCB/XhSY2kr9jNJmF7YE6N5E7KQjxEP8uon/yZ2CA8?=
 =?us-ascii?Q?6WBk1X5aLnpbaJ1EK4AqChCfop6WJUSmpdWrHdOa/EhVL98amb5DGrIryLsC?=
 =?us-ascii?Q?BU1UDo0MZcKRZr0d7TYp81D74j3LOMks3boYf+4Ps/RtByCqg9mfIhvFsMnA?=
 =?us-ascii?Q?eiPEVshLdynjrrdwugbGqHLGdQZvHrW//f/qsyOM+MdPKEBhK94YZgsABuA7?=
 =?us-ascii?Q?CLm4JvEYs3dRmQ3XNAfqOzZa0ifDYtLFhsnzquX+Sr94P+QTfPhGPHENespg?=
 =?us-ascii?Q?ZZj+J2VrphdGIs3Y14ha8f03YcBSvzKsI1As+ZX4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1c6f3b-d8e6-4656-fd1e-08dbd36cd98a
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9504.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 02:07:46.5656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXWoSA0vSbV4lnp388CkcJz8DFvZXnXM7bsPl36Ry6SGSZ+mGr1zjdsI0FQXOqJL2CNj5F1ZXixDSTGkVbtHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837
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

Add a property to list audio sound widgets which are marked ignoring
system suspend. Paths between these endpoints are still active over
suspend of the main application processor that the current operating
system is running.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/sound-card-common.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sound-card-common.yaml b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
index 3a941177f684..721950f65748 100644
--- a/Documentation/devicetree/bindings/sound/sound-card-common.yaml
+++ b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
@@ -17,6 +17,13 @@ properties:
       pair of strings, the first being the connection's sink, the second
       being the connection's source.
 
+  ignore-suspend-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of audio sound widgets which are marked ignoring system suspend.
+      Paths between these endpoints are still active over suspend of the main
+      application processor that the current operating system is running.
+
   model:
     $ref: /schemas/types.yaml#/definitions/string
     description: User specified audio sound card name
-- 
2.25.1

