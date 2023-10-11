Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C837C5272
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 13:49:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eTsC+k3N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S59zs05x8z3cGc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 22:49:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eTsC+k3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::604; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S59yv4tTCz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:48:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc/ZM1LZ+L0kNoWL8gt9a1IIvkuGz58re6GNqeMbajwupGe0Zuy8yseMsfl/gA1eL0yHh+Ov+5FKES0U71JyRCUpZMBo9/HmnDnZGjKuqTJ92fOUWpUbOgBhh+Nv1Jq5T1IB8G3Whzlu1fZhNN6LRlmH9mGPwHIh9Aodh5J/SIf71AiKkoGtEnENbe4yi6UC1swp+cPKw41L4qElZYO1/sKhZdD+1uvtCEUrrC2Eeyi3uJpbqiTh8sgJ1PFnXXSxo0Xv21WhV8nJuji64opaUiNrvvxakqBWW2XS4/H6+3nRXleFSIFtS1UR9U9wEIvsZiuvM3AOtKEbH+ZjNfR8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ6K9XQpKYme/J4N/MNWVaFAPGeXREktm84uM0KX4yk=;
 b=d4J++M7S9l0e/2bdqeUThuQP50cPJf/0N+3nKftBsNLdjH/9HEFfMAQ7ApoYBam2cvacqeqxokw3DouTe6P4anL9zAHnvacOnhe0AefRykMZKD8Eky2w4zlXEyD3n7IosHIlY/v3uqh8e2AIMCsZ4u0Q/mF2SHCH6UE4yAlW/n3VuGq1LC1Jb9CH0oBW5LEpGJaLOuoISIIno1D2EXUxa3A2TarrUz6FKQlOCDmVRldCxS84YG0prshyNggeBHDGFToCkkA8SCdRuwKozaLGMaExaPaLr07oaURPraEFn8v8Cak6rzmvSGrXJN5ajrHZ/RjjyLDc7NiO95OumI21ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ6K9XQpKYme/J4N/MNWVaFAPGeXREktm84uM0KX4yk=;
 b=eTsC+k3NvYo5wh3edGqFWzjix+HxJKUSY7cO9lau9KRlf7ZwWsSf5CymCDLY1kN5CSTbh0pwgIBTXH9CEUg2KPReOfzzu9BAbhlIr8TLI5AfTwdxJqBN8M+Ijqm64vgsiVsOC5BTTfwgBM5gNM/cx4RVSReNyCcURAyMSZfVRO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 11:48:30 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 11:48:29 +0000
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
Subject: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List DAPM endpoints ignoring system suspend
Date: Wed, 11 Oct 2023 19:47:58 +0800
Message-Id: <20231011114759.1073757-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffddb9b-51b6-41e3-5655-08dbca4ffcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TGi6RzXPOZw9VEdzJk+SWTjRBBck2zK8PGBN1NDlkoHXEddj8/NTgdjYPGGtn65hW6CvyC94NtTOA/C5Y8IkQVfP6fdBjTwWQPu4B8o47t+ibV8vdgMoYbrhQ7zOiZ8xC4qeYuDMYqd0M1S/gAfbxkhU6zuWYdnGFAkRMj9OR57+Cory31p9EMO7pUnZH5rlF/Y/Glcz+G1sVlrbrUrYsLjKaYippzo2hBPt/6//HEHwJ8k9CKt/K6V1fjM9n2pocRE0eKjDDX390yiBsTwxLnIQVLcHlLEbWLc6lYoTrUj2VgLCnY/KTIW35LWvU9H80YLq+pH+T+iWkr9nm5aCRqd+rSbzgZoU+41rW1xsYVnDj7td9z8YpJv9tpN9Lbg0ID3yGKLmC+26ndBh3FDnKeAuGN7XMBfCk30N9OxSxYNhZsvzSXO2ROSB+K2Rc5Rd7NdEwXJS6EbUjm1rWWIg7gwllXWc4HC0SbhIVIFGMZg7qms/nkWd28EIg91jLeLTrWjr1F3xpMUoZTkpJsCHxdLL2SJJqr1n1LhHHDUvL0ND77YpCwQXo09f4qtGNfQSF01U6xvcbUyiB5haKUOCNsM7N7x+3dfsM6fS8FIiqjvqHFIQ4c8VeV5oYjlf0GUMYAmDJPHM+3b5BIPSSqIJ6w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(6512007)(52116002)(1076003)(478600001)(921005)(44832011)(6486002)(6666004)(2616005)(26005)(15650500001)(83380400001)(7416002)(2906002)(5660300002)(66556008)(66946007)(66476007)(8936002)(8676002)(4326008)(316002)(41300700001)(36756003)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DtLkls71WtuLmKETLOiFqazqYpyK97YHzAcvKFLUluTXbZsiW9lvgn9M7ItZ?=
 =?us-ascii?Q?JqWJNjWA+aMAhjthmZwFD0j3ucpNATvkPSivjiW8v/Dw3xHAU6tsdD6ovf1q?=
 =?us-ascii?Q?8U+qkkLRanOuHydtU2u19G++Y02ZW9Ae+qj/wnTxtpK2g5bVK0vZKqf0KJS9?=
 =?us-ascii?Q?gh+NpFeLI76ATBO6bHEVsyX8tbu6HUkwU4I5f8haBEDRnF+JVPfWagYffhiV?=
 =?us-ascii?Q?E3GqgDYpISgzWx6WY9f2dBzLgJsaZ0d4tKjnd8BXxgIAOeUEsm76sNtoYNSc?=
 =?us-ascii?Q?of/2MceJIEjZV7nyo7VlT4DdT6mGVSEmk/2KeTbjISIV/NIAsmeqrI8Pbkvl?=
 =?us-ascii?Q?8d31GYj4xSHDKCTL1EvQR+f9bBWqZTsjArgg7j2Bu5c2/9awbGlayNQvplhK?=
 =?us-ascii?Q?zwmLPvEOGOcsiegLpUXDGhSnXLg2B/O2zZ8HTMAkQxIPrwhGk1CqHwJ70psW?=
 =?us-ascii?Q?caC3sa/aeuBDTqHG+XJ21mTSAexEg5yvOsLicUJXmkn/iUZxBMBeZb/hxOyE?=
 =?us-ascii?Q?9KzLibwM228D0DnqEhNU1tWggWUlncDUKlGgRrFqBguzerTswoLrGEeosgev?=
 =?us-ascii?Q?AH96ADakltVhA5nBAUFiK0Vt5VJ4gdwugZmFYN21yPM+msJUd1bhG3Wd4jwE?=
 =?us-ascii?Q?X015nIoAeHo+Hwvrewv5olT930WrhyPPQQNht0ozaFaaGUUMsnVpUQebJTLR?=
 =?us-ascii?Q?v3FTavG+qdKfna/HYeWO2mFEs2YXWcoSBzXmcEIkc4l7TFpY1ArQKj8zpMvu?=
 =?us-ascii?Q?vKBTb4F3qBHKyDg+kmZN5n1N229HvZ7nMw0mRhK07uDhN48wLzWC3tqL5OOk?=
 =?us-ascii?Q?HYANSczy/PthtdkpWW1T32k8Z1SvRxUWlGBSzdnV5WcHZszjzJ8rLgj4weX2?=
 =?us-ascii?Q?zzvcDtu5+7/WUY9w0ui3Fw5Lqrc8RKFF4tJ3IyrHlLWinoz4IQSK3cpoAZAT?=
 =?us-ascii?Q?aX2eyDmj6kHFIHIUhYT0v4UID8zfwLeU4FdkhutSUcWhtrjThKT74s0FbPnF?=
 =?us-ascii?Q?CbrutA4C71BV2HoyV17gbIZwsvNSn6QqpScAooR5ux0J4R4dX9NgZwXe9u8h?=
 =?us-ascii?Q?qzAfULaHbOnIUVRWs05MO0cPeUEe01Hu5jwKV29O9QFE5Wkr18iGXt3ku+Jf?=
 =?us-ascii?Q?e+uk4FS9YO7Kch2WKkIlF8yyYqZcbB9UY1JEdZP/4K5uqGN0LiV4cd0j9ta7?=
 =?us-ascii?Q?n6xuXGyDPoofh/YusiywJWrjIFmdFEZl1G4ZjIA2ksJErc8sEInqwkx+5WoM?=
 =?us-ascii?Q?qa++FMZZX77dNz+ARFXgPnlRwMe6JU5PQvaenpeJTyjN1GjbclwxUh6ACa4d?=
 =?us-ascii?Q?PVl5yYppHUc4MoKUpoo2cM7pVNGt7zm92zqdy/fr+pCr3cucgpy+VwWoHLoo?=
 =?us-ascii?Q?c8yJUqSd/w+ERQxVx+S+BBUxe/AbgqPkt1KhR61eiie7BCS+U8p5CIli8N4I?=
 =?us-ascii?Q?lPULRDMEdYx12eh5OBbojQREJ+vW1YraxSJbNYNLz1ewl+z+KeSEI+wBALjL?=
 =?us-ascii?Q?sEeX++TlfiNsUoyOVbJaZuuYlSCA9e4DD1/tpA1iMQHE029iCjbSRpFBbOnb?=
 =?us-ascii?Q?T4HdiIGKGuomji1cYJbiwko/zZmSyCU0nryItOFS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffddb9b-51b6-41e3-5655-08dbca4ffcdf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:48:29.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbDuxK2PEd1skTdJpWKOMP9VKlZfuTH7YjXDIeD0CmbI9C1eiswAWOyg8LY/Pkt/gV8eBBJ3VLuwaTUvIK/2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300
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

Add a property to list DAPM endpoints which mark paths between these
endpoints should not be disabled when system enters in suspend state.

LPA means low power audio case. For example on asymmetric
multiprocessor, there are Cortex-A core and Cortex-M core, Linux is
running on Cortex-A core, RTOS or other OS is running on Cortex-M core.
The audio hardware devices can be controlled by Cortex-M. LPA can be
explained as a mechanism that Cortex-A allocates a large buffer and
fill audio data, then Cortex-A can enter into suspend for the purpose
of power saving. Cortex-M continues to play the sound during suspend
phase of Cortex-A. LPA requires some audio paths still enabled when
Cortex-A enters into suspend.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/sound/sound-card-common.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sound-card-common.yaml b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
index 3a941177f684..f43147c78651 100644
--- a/Documentation/devicetree/bindings/sound/sound-card-common.yaml
+++ b/Documentation/devicetree/bindings/sound/sound-card-common.yaml
@@ -17,6 +17,20 @@ properties:
       pair of strings, the first being the connection's sink, the second
       being the connection's source.
 
+  lpa-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of DAPM endpoints which mark paths between these endpoints should
+      not be disabled when system enters in suspend state. LPA means low power
+      audio case. For example on asymmetric multiprocessor, there are Cortex-A
+      core and Cortex-M core, Linux is running on Cortex-A core, RTOS or other
+      OS is running on Cortex-M core. The audio hardware devices can be
+      controlled by Cortex-M. LPA can be explained as a mechanism that Cortex-A
+      allocates a large buffer and fill audio data, then Cortex-A can enter
+      into suspend for the purpose of power saving. Cortex-M continues to play
+      the sound during suspend phase of Cortex-A. LPA requires some audio paths
+      still enabled when Cortex-A enters into suspend.
+
   model:
     $ref: /schemas/types.yaml#/definitions/string
     description: User specified audio sound card name
-- 
2.25.1

