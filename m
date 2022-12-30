Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF6665939D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjlyW6XPpz3fC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:10:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KWkHoI2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.77; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KWkHoI2a;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln85D5rz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ0yMYwz19kgq7urM0CbVHF/llUX48+xeh0Q/J47lKLIJyYpoZYAA3pJ3i4sFQzboG4cbMyDSyy7d6iOQ3DwEQXGADgKfA7ZZdbNPerCbLcN9+pzKIzR7g4xqQHX+urgrJHZ6YEZGdRoL1cOTRyQ4Ol8zez0R5C/7dmH3aokcz1wd+mLBu5JFyosVZCNAzGY2cAO+JK014BE2IC/ZHflep7j7liZ7We1Law4wNJ1Ip8rAvbAHCIb6QmwFemgDldQNPRmlUhiVYmr6B7xAPkZcwIl9jneeDdTxGdanqSSp8Hnekfd9LSFdhitacM2C4pO3k0rxrDqQOGflYQdj/xLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmXUHDEBebltIRHzgNcQIJwyOttzR7k9ipV0TPqzEnw=;
 b=PY/vyii3cBo0BjSDp5rfghqEiO+Pz7LKmr0czS+r9DdozAmCkFaxF9WGG8qtV8u+XcEhfeGpWwW8u2eam3tskqulbFgb2ypd/CqOgsmxMlMp7YINyBgz5FZ3RmC+BS2lEB4CQ3EgGe+XBF61wmRw6dDEPEhrL4e9hX+WNdgU7oxzPunkOyYTQlGGvjnbOrrMbxlPCSiurxy9bWIGjdKL311/UU52BuwGZWYzP5W9lhqvN95iQyzU7/iMGEUmJh4mHADYrSKqn+zYIS72cKzkY7pmaJoNk7sNQC3TMf0WI2SiSuSD+vCWm9ucJwRquptL72oKhi1EA93MLSnPgjFIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmXUHDEBebltIRHzgNcQIJwyOttzR7k9ipV0TPqzEnw=;
 b=KWkHoI2aVUCTSONImu3Zb50AA1a7QVrWjpi18IkVYIcCcm1Q9W/W1wnBKlI88OqfYxKwyiwVHvEDX0kkI4DRcQ9ptki8Cm6loOKB+CfLt6Y1svKHENdWkIM4MYpHgls8rX+LObFaUZMQdD0B9uqCb6Xc94fklXBuDjmAjVuwjwvpQT68b7bvxFkb4MhFO7gMjJDAeE9Jf45oy8TF5uSLjcwc3nJ5Y31oVsQ7iWDQpsgd/GC3w57X6QTSmXUSRpRhSSquUOrtf16F8RxvsSLChozI32MlELJAFRGPJJngKdARO4baKJeV5cxr8TQjrulOT0qmZDhA+199DJ6zY24EGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:02:03 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:02:02 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 08/10] arm64: dts: ls1088a: Add serdes bindings
Date: Thu, 29 Dec 2022 19:01:37 -0500
Message-Id: <20221230000139.2846763-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: c7990ebe-1dc3-4318-6385-08dae9f91483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CW9OkyAVzeZhBMNExeWC0TGFqzZCwO/4ZBWwnThrweBvqSNQW7wJW7WNZWfHKGWCly4Gy3E4xZy2Aykhfz597Et0RpIyPbEmNMnktS5AbaKQYF6pRwaWCyRhqiFFiF4L+K+ShVzHWVFHl0CMJkz7OcXKGoRPAULBf3ziUOgg9vBFVGJ1Bj4qzHRFzIkgS6sKINTaTl9Jv083yGseM0sbRYSYh61QMj+Y3uQsgtgmJh3QxxlTbbv/5uHs2AGBysXqglYbhARaeIO2vYRYsS67dP/RBiR6z/PC66+CgUOTsrlRYsw5npIR1pW5EWEresOu80ax5/pQtqqilPT2KDxS+YyD3QSQPgsC3NUeRBRW8C3YlLIqX2qQpN+4HLMpMEH+Czlme9mcX2I02e9uvlj8uGIz4rlYaENAPNQwfQc+eyuxy27SE/w5w250r/cy3QYWXlqluWZICztNQLuAcjRL8vhLb3zr/N0TLYdLFRt1xChMrsE+9GuQgKowwz07FsrmAu9iuhevQ3C/O9MYM6PvSjZJ+2RcK5oqfHQr+kR73yBl82BenIP/9wnQuNRW2daffMXsZE+JAzgl3CB914r1LrOEJIOTh3cxHXpP1D1pKhV/tI0vFJZmrjAMoIc4m9IUO6OzNZ3DMXl8YqzE1bsw+xcNH4M93e48x/ZD1X6Lgcs/UtN0c21SmVQcAIsIj3SG
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dft1f+x/E+vNrPAordE1rlxOtIc0DnA7k/c5/S+Sx+XLGKwO0gZqqHB9w4l6?=
 =?us-ascii?Q?xrRTlBETfqfjgUjvNP/fMzI+LjjuS8Z223uRH/iQRHputalmQRSW4R+2rr79?=
 =?us-ascii?Q?+Dk+b8RwXWggzGb7GypfSzhGtAl1CdYyjueqQ1e7ksLDy022l/pESz9nHmuH?=
 =?us-ascii?Q?/eCkzPma0/JPKvFB+pbz372eEbnUCbuepFrycLw2cO7G3S3Vki4Xlfrkq2gW?=
 =?us-ascii?Q?AFX7jvG4NsX6yOtPdXEd9CJ563g9kviK/fHWlLBQa+VcuVtfkdjzpYlZxE9B?=
 =?us-ascii?Q?0uKLKPMXFr2PC1FTOhnSqcOk2L45LSx4y0Yk6U8JPnu1jsP9z813wmV2htm4?=
 =?us-ascii?Q?CfJmsI359ms2h1FY/Z/QhRxs3Cn7sVODeh0TPvpsV0JOVzJ1jJV9Ar5Go+8Z?=
 =?us-ascii?Q?U61UexbN5Op4DWUg9B3za/fkQeNQim7nbPxVDjO0ebnR46EX+vsoh/ates4o?=
 =?us-ascii?Q?zKVKDCf+6W1yPsoFrKZFDoYifBRGnqo4Ey0eFeXBeI20TZY98TuK03Vrcf2+?=
 =?us-ascii?Q?Q/oL5Hdxm7Ar+csWsJUuXJ8I8NaaxE8agPDDJVVwTFfoaQ2nFVCB/SGs/Cu6?=
 =?us-ascii?Q?Ssutw+fJzF+HqjpGnn41TM0lIRJV4/LPmCXzGTSDgcoHxNTGha+CKIucpvD7?=
 =?us-ascii?Q?RIgLc81QIxlEpZncDgOr95ZFpOdFi5kJqchEKsuYrqBdLMuVKxJiy/pnA5Iv?=
 =?us-ascii?Q?W2D2jq3fRMZgqZ8wO7imlkQ+SA5PtDPSTdaFJW/wIKOqDzSxejSIlft95ChG?=
 =?us-ascii?Q?A4/99XtrRiugaOi01FvLWiU0bzsxqnYXHk2Xcf9n9EjirS2q8Dx8FVb+kIPK?=
 =?us-ascii?Q?omKZolUylzZi3dSKAffvuulaZoJEXIN0YIiypXLhap9CdOoncn7pAOcQFarA?=
 =?us-ascii?Q?feb155645CJZoZWgp50K4DSZexwIk9mPejanIwP3Uy++Wr+Lukjeb7Q+TqCo?=
 =?us-ascii?Q?T2H+viyrjlgVBUMWx4tnAzBt4xknW9cZO27EZEHoUIWYUA90Cl9IRXVTeP6p?=
 =?us-ascii?Q?t9PR++bX/MdJAc24HT4VdFpsvh9TsVmRKF/i98Rsv2zx8dtI4NUvwrJlImAs?=
 =?us-ascii?Q?g+EgIunycWxFx4Acgn8x+7D/JZPfZ66Jr8+u2gZvCOczGzcki8Q1K/QVPf5J?=
 =?us-ascii?Q?4lp0/AI9L9H7as12VEI6o62awRFlpnluXGdqts/EeCw+wziCK+Yj6JtvGtk7?=
 =?us-ascii?Q?gxhUu6gdydOLzFMYMz+C72WK5colvjiYvevK2rvqeKZSg3g7cSKWMiuNGHbo?=
 =?us-ascii?Q?s/Y75lolFGOncpJqpjGyPfZS32JFK+Ca/KopMDYq+UWXGYT+R51aMWagwJg7?=
 =?us-ascii?Q?g2ZNWiPNzWx5h++766D+4x95W1ylb/3/SBnB9WUmaJI2Wtf+9q/HC2CsZVEK?=
 =?us-ascii?Q?cvsmNKHMFFTjr3VwJFwJTuKLzCSASSp2MO5pyc+/KJ6DBKmEqMUa2V4IulbN?=
 =?us-ascii?Q?jzSrD1ipcP68bOi1UKYc1WSOqDCTmff6ecwf8wpOHYKJn7yjYWNGdOI3DWot?=
 =?us-ascii?Q?EN84Rx0zcpKg9W6hRkjgxIPFWmxSonquEiaAvtyp70jyoZBVORpOsZEaqcac?=
 =?us-ascii?Q?bmX/gyjVK2z7PngbxCvjsb2SsTRtmO1zKowX2/PYq8a8+wVhzkqVgA/coV+W?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7990ebe-1dc3-4318-6385-08dae9f91483
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:02:02.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ku9SaZcbBv/ph6kQsakeZkpyrtSOvpo77S/9nsD6flD+D6To/m2sLfSSz3Gq/JTsKwxD1Q166Hu+HHsx6QMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

Changes in v4:
- Convert to new bindings

Changes in v3:
- New

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 260d045dbd9a..ecf9d830e36f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -238,6 +238,24 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.35.1.1320.gc452695387.dirty

