Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17B7F2585
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 06:49:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=W3U1NYMX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZD3H57SXz3dBt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 16:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=W3U1NYMX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::62c; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZD1R5jmHz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 16:47:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT6k3yIG9uhzIVyJXhHWSEwj+6RiNGi1PZuLQoehLMAe3lBsFEwCkxqKVS9yf44ty+99iE+TjXosSnzMsMcdf/r/HWstOFvTSslrPdmYjNEXHF5FMIdBJQvPv3U0tWwZysXS0J9eYRiLCbFbrMnSO8KDyqyxmZ1Xzs0RpwxRcymYdjh+16PECB+BghwEBXO5rAWxtOdOZIissCdbQ/JLUEqy6oj2fU0kTryADqm4CgiwL8bJrt9juaoCailftYbt/N786gIRalUpaf9ziP9Dw8ZZ5TMK8WMPcKTiCiDyA/P4ALPZ8Sda1Y08HUOSSjViKcqBOMbDY8Zb8DyMDMyPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBxzKScwpsOqEpewethyKY1noRZAj5cDJaCj7/Qjc+g=;
 b=HUsMBncYKC+tFEvJK07B0uClGCCaRKniLzaT4H+Nodzs04gUPnvL1gUWYsl4c7C8i+3v2Lz4z7e7RU3RWzV5HSeqpOCQrG2m5fs3HlumnwC1KOajqA4DO07uPHn8SVeWDJchosfQggEMtkIIJ6EeOk6cJZNZRHCmRHRu5t6JmswmtUba8aXllEo4Mjf85C9yfCBYAQTWo5PIHzr70uV9PRsDy24yiA5bPGBqYhJbMs5n2IRxr5+hMJLMVunhlSzXPxgnMRH3eNUqfsssK23DeA1AXGHX0OrDo4Dj8PFqk8MQO7FTAH70bRqu7z5OUiqqFHEQ6JrWi6qzAzouPbT4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBxzKScwpsOqEpewethyKY1noRZAj5cDJaCj7/Qjc+g=;
 b=W3U1NYMXKQ4cxccbk2U1OFQOtr93jkutSUV8PNsK3fdUkbHSvz42QCSsqfO1BQD9kTWs70f4vmXJWIC+5ZQdBbV1o/ClYWsRyejAeuhJwJMQVW6xh8eDrIXhC6dTYfntxCntdG2vaXq/GM+L9YsBY8zhG41vEqiq+0OzMKfeOcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM7PR04MB6885.eurprd04.prod.outlook.com (2603:10a6:20b:10d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 05:47:25 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768%6]) with mapi id 15.20.7025.015; Tue, 21 Nov 2023
 05:47:24 +0000
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
Subject: [PATCH v5 1/2] ASoC: dt-bindings: sound-card-common: List sound widgets ignoring system suspend
Date: Tue, 21 Nov 2023 13:25:11 +0800
Message-Id: <20231121052512.20235-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM7PR04MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d868bd-7698-4647-264b-08dbea555650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B2zN5h7j1W2A7qjGRSArje5qKL9qwsET+wlseqX0YBM3u71i0bXWcNuxByE62zM9dil1ER0+Ol25MGgbQkF+7t1rCStQmKZJdHjV7/GAjq2VWVlLRlsNQvzSomyj8q5T1BpeI1QZWyNmLmXHsdz6357ecjvrsZSfiOauePoUaL27V/VkntYE7MyhJ9mw9XKEH/Aie0ONOT7H+Cvt0iPJlUb7R1kCcMRu0jc0M38bno5d5iHl3w63xYlrgr60nj+NOeHmqBKjbGFkamSmbQQ331M9YV3UrotXjatYAy72AeLet9ENpt4ULb5qhpFjMz+gcXamQGA7r3RNTsx8494vCaz3ADG+r5Z3rOAaCjH4Axt2g8dDWGK5bf4tM1OzM1zRewbcjP3JH5RWuQPQa1XYr6OotEQomofzpmaeZo2gx3D68D0ePwkPn3Vms32PTp5GSqCu7/SqNDuJps8Fd+KrMgqKStitrYMCp+ui/1RNthyKQN/mY75X94CiHFyiirL63hhA5L7ogt+MCmMB+TqKKTbyGjghz9rd2zZMzpdbnYUzlwPEbFhyuuDHqWMVTVhjveD2FiMpsXmKlJvdgt/L2CkXE/6z+N2AH9isDft+MO/NfbbNVbU33S2gvS1Gi74mdaaNIXz4WR5D9XEeaSKycw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(66946007)(66476007)(66556008)(6506007)(52116002)(36756003)(6512007)(6666004)(478600001)(2616005)(26005)(1076003)(6486002)(38350700005)(921008)(38100700002)(83380400001)(86362001)(44832011)(2906002)(15650500001)(5660300002)(7416002)(8936002)(41300700001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Bf8CpCisnhkTYA+gr15i9TBvTfEz1V1CYS25bln0awEZlXvo0KFFhfHwygYI?=
 =?us-ascii?Q?cupB89V/ieO3VO0jrMnnQXXr2cjdCo+dK198ahMNUEuGWbj7wLBhXjOnW/No?=
 =?us-ascii?Q?adpSWHD9FKuhXfz/IASKvRRrHpxKwHs6fUR4HvvZcq2FU+mw600cJ14CBLTN?=
 =?us-ascii?Q?Bb5MpCZx7zXilEK9dpQEO/P0M+Us5WUmflVLEKiF63iDVDgyejRUQrYafv/0?=
 =?us-ascii?Q?htjJiTC6cnhVPnYOUaJILJWGoCcvQnwsCLtpib7BJPIaDO6LUIS0nNZV2uXP?=
 =?us-ascii?Q?nmEcjmrK68pNDom/mDC1uiEK6d6sara9lBlQaThJvixt/hW/HHOy6GX/uWL6?=
 =?us-ascii?Q?3QuB5DD2E6OXkqE30WAZloplfUmjRM9HuRKuBtfY5k9obwSt10xPSUyUMgCP?=
 =?us-ascii?Q?rIxB+f0u8cJBus05vNXVUCeGvMjFs3IzBPMLNc8ISCiRVDi+gL9Td1anmsVL?=
 =?us-ascii?Q?lZxLANBNYZjyjrrj1MQ/Z9X+v1rxvcyWkggE5rpo4Lq2tBOeUwxn1zvttyKc?=
 =?us-ascii?Q?RafUsgwKsgUB3G4ifpe2dTEzip2r+J7zFXqDTZG6wshW6yT7OlAOqv+KMs4+?=
 =?us-ascii?Q?uatB77/JhV0DY7YaiGArHFVLFcczQVpEfgnqIaT+JFqUKZ9i/4taIn0E7HLw?=
 =?us-ascii?Q?SFTXNNdrf1XLwiJa1J0YYbdZCroAVYgEE8x8JkteEHtodNowO46tNy4pxfmG?=
 =?us-ascii?Q?GJMEVhTTj9bumDXJSuXtr/zYVdDc3JgK5bZE70LEegDlw3S25NMDeSF5voAw?=
 =?us-ascii?Q?WxPZAq8/oXkQes0KkdeF6o0zw83kRECUG/iCvcBZf0ID5QUXslqE/NdxwTJI?=
 =?us-ascii?Q?5gBnyYAZZjDqvXJ7pruIyFm0m/+eJBNa0C9aoQspZgLsTJBR+ofzNQmYWFVj?=
 =?us-ascii?Q?8LkeMCjGcUG/KpbE5UDkOspsaegeeBllIoBEhIm52GsYo18VRLH59Krx941k?=
 =?us-ascii?Q?5dpViquBMEyp0OJXyP9UlGMsmFWCZmYSOCzq2ynmFq6yCL0US5WIbG/o+yDU?=
 =?us-ascii?Q?F2NaC6J8ziIIOg0yxlq67fEibAIFg2+lS1OvhPLv8n/w7Wa5DyX8ax52DJBW?=
 =?us-ascii?Q?ChMThdmnRcRkk9beFS9a7AVpjtecX1FeZxJCpTvLNRMQRg+pLTmhnJ8X+hq/?=
 =?us-ascii?Q?LHTZVXaZP5svPo3O47XhgBYO+PpkqiZqzS3JDMnr9k1MnqZluuAGI7CpZtVp?=
 =?us-ascii?Q?reF8zlhhy7EAYm5QNZ+Jw9Mq14B+PQeRwGTit8HGCyXarLeId8hSjLRPEIJD?=
 =?us-ascii?Q?GAOuvIXueOYcpJQ4wlcFARQMkESnaQrbITaDwJrPLQuXA/7MoCq+HCf4joHK?=
 =?us-ascii?Q?xbrRq+TWDo68GemKtmJ6GjRcWmzhdR+QidJS2jRWY7ff4mlDZSDiBPi/e3TD?=
 =?us-ascii?Q?bcfuvvL1a4gzdFN8s1sIfh84XfVeIvtGiNIDmNyWf/ZPX00JI0XphUWRfOse?=
 =?us-ascii?Q?taqi8gtzSPvIw5A5GQE+YjudOcN4gRfrF2amWY2fIh4nJJYziVBxOnIvOYcT?=
 =?us-ascii?Q?2lIZtTq2P1qL7Vdta+jI/kPWZDzYwekGNk6CpJKvqKOan4HLAXmSlIYgSf1W?=
 =?us-ascii?Q?i1byF//bqdr/yd47iENAiMultr8KYvQYPcSlUpO4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d868bd-7698-4647-264b-08dbea555650
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:47:24.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oZFEkkm/FgAgevC/qpdsNG8GpfUkYqC+dVM2pZMQenv4OehKjNTOLVp2CpDJNuhWZXBzZFkZ1H8s8+zSwZBdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6885
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
2.42.0

