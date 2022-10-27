Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E161015D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:16:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywQK5841z3f3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:16:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=yy4aPtiQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.46; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=yy4aPtiQ;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKC4DZNz3cBf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:11:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvsv75ZN/fRpReQ3TmNCztxMllEfQBHmFNTlZtU/5295Ln8jZmNA0z1seCeirtiHXJmnU+7F8lvq7YE8+J+57m85ZFTig7gcO2NyHHiE6Tei2l/ZyM1bxbMrKuE6z8KH87hGc2PIHGUts8HF/yjDJBqHHWcmYHotzd0PQlErRWkVlJhyeNI6vZMSuuTbTx03CQSJBN9wqKIQKCSyQvab30Z8PE1swjcDAd1BE6RGNArdE2ZikxsWtmVUqV7ERY3bNTiwoxjRkAitfTimrcRCuF3EKZLN+sqlxVxdU52pg1gVNOOpLxK5PHhgmVszosJwWU59Q169I1CjFNUALS1jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqu94qYNvf9w4pfsAbSJlc3AqtD97kwBepOGm9ixucs=;
 b=OcF0WUclUCiVPMNJ/KliTjBlQgHp177YnfRa1IbrEkwUMC74q96ZWAmqxPOIee0G193JehaBOGuqMss+Tpds+y/zIlGbBHYpcVnoIwkMB4fTF5ZA3qG65PSJZxeTobIaK59SyN12IG5N2rvdbA5xbt3y/lJfoVRc8Hu7jL1l+TnF4B0OQhuUgqoaQDV+M4Bje5MW/AvbV1SAT22jM1Q65UZ97FSGQuY/fxBkihLFMF7SypK/zzMfQJ1By0xuOKl0OxQoC0/xJoLF3L8IxrBCyfILG6mwSHmJ/z5NJjmtD/xbNT63dWY//qwCoWdCBv8CxnSThe3X2eVXVfBvyB/SSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqu94qYNvf9w4pfsAbSJlc3AqtD97kwBepOGm9ixucs=;
 b=yy4aPtiQ3ar4rY7u7JZDohnKMvI2VSzlUf/6ioBaviflIueOXRba/+EdM5UAgQDUhkeR58NUaNweLe61j1XpCaVqlSv5NR/6oeSVBhWYz+OzNz+wOgdCK4AvUCWcgXWazUWwzWOl2Bpst8hFtJuUcuKBNZcvjp5lh3+NgV9ITY7MqXmaVJ2P2/uvbTc7fBWEffP8AnrgpryhKaEQmC7dPw56NC8w+UBENi0kmOx200il+r0BJnnSt9VafhSfALq8V8Y0YxLVkQMh2nwPGMYkgpHdZ7fjDdxclFYWFvYkGoRNZXNEQMP8zb+bpoThGKLFkE7IbeZLv9uhxdxEcRu8aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:40 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:40 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 5/9] arm64: dts: ls1046a: Add serdes bindings
Date: Thu, 27 Oct 2022 15:11:09 -0400
Message-Id: <20221027191113.403712-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221027191113.403712-1-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2276313a-cecc-4770-1c80-08dab84f1394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Uhs5k7dGt8wUhlE1r0PUM3TLcqp3r2PjG2T9Cas9o+Hr4dB9xuLkQwf83Wv0+qg/Y1praP1jx7eQStxj2FJ9xTz5zhGP+SMR731qzNrBzbjK7oJBmVGHWL+q2CiiiY39QhoDyw9+0eaXsNnspOWU3hcmTn6J1H13Qy2ShBVQEnS66ZR/qAeShJNegY6ZJRjsZLWTXC7IXLKLk0m0nWIKVeVLPChzaReCaLckCCd4MHr11DGWwaLwLgOmILa6/7NdntyxLNrzkGnkbmSDwpdn0fLwsJR64P1af0e1kKNs7vJI3IXMjEgWYwYMa/So3RonSb2iykspgJv9eNbWwlEacCz32CcH3M1mM4gfPn/2c97nt4s0UwSndkwuZHd+TtXNlo1cfskDwNRSm8lvQ227v44NRasFLv2hOyT/AQt77Mfdz/oEA5oT6lEcsmYipBnNts7X0kRPzTRQO6rpKQNKDCZxF2Mj/wVFGajs6FEjN9DnyyXexTmsjQG5MvchA4IzBzGfxjYHMLXV0g7H8RYkDQwKKxjVwjQm7sbuz8bzTPj3X+SthioCClOSpwdBu/ZGonLwdAedZ05loV8aBUi/ammF6OYCDOP+BtetzLzVpdpo+IC3o2KX0yND3vTYHH9S+4KZ7mzitdilsnaxXHhQ6XgmEkKabVqGcX0zxGngIr5jAn53yONQTsN4ozLp8KKb7/sxeZSHYJhGHAE4aeLflWEaEaqzvHzoMR4uaU+JupV37GQRw/jQAesoOykv5shh
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7GSwFOeN29wnZRH2eQD6d3CJCXhuOZEUA7mmYwdBfBNikyKus4YyWSR3anaV?=
 =?us-ascii?Q?/S8w8cV2Rc6M6lwSEqCQQl3p96ypzP+ghnxXcntEDczvEmFEXhu5BfvMBBuJ?=
 =?us-ascii?Q?/rIU/Q5LBBckxl3PgyaTWXbQjOYBdYwk7sTKPuUqRhvDE6Kp4phGlxcAKm8q?=
 =?us-ascii?Q?P64RVX11pE2mrTkmo91QD8+S0FhJ4cZljHadHk0Iwo+wdyy3nITtSqVZFzmO?=
 =?us-ascii?Q?KvVNwxajOBpiCfEznTLV3pHaKXEY6BLLo25p2o20o69emu17Pyiw7mMOUWJN?=
 =?us-ascii?Q?/inPGgjghRczz0b3mFXW3c/4LA/Va8XLijbUIVaWRRTouXIz+Aj8L8aklxLx?=
 =?us-ascii?Q?99gjDSLwRUJbRzkg7j6FGqGqBY59SsPcSwYJZJ6HHNiuPWW+C4/BnfcEMnoc?=
 =?us-ascii?Q?jc7C4JI//uSvMdj84Mvn65YyvR32DmK5G74ZASJyEwdMeXZau+4/3gcUaHQA?=
 =?us-ascii?Q?v8xuycSYYL5hGH6etOVt7VGt0UYi73qLYP9jol+5JfZwnod0RH+bgWYO1np+?=
 =?us-ascii?Q?EKBdO3kzi7z8jJm+Jw9sMvvfMouPwiYEcqWR/PSyqHXCe1WfMi82T8gq/3MG?=
 =?us-ascii?Q?us334Jee86pFCh9dFRmnBCKM0qsxX+jodSsXEasiqFcNFzTg+SKXbdPc56Eq?=
 =?us-ascii?Q?tTHDr6AUx8m5I8lkJPnf97y2C4mV5oF1FABToZzF9T6TCSZ8SiaD29Q+pdMA?=
 =?us-ascii?Q?Gxa7snfh9wZL/26TfMz5CO1rzpsbQsPZCz/5ATeN1MTCAwfrS4VIiaein64R?=
 =?us-ascii?Q?GKfnwSEjouG0E11g3dZRPNl3AM/zZZDH1iRllf1FygsZuXVx/LT5fWGrRWij?=
 =?us-ascii?Q?txaa+MiZiPgTpngkXf2OR+ej2JXzd4jowWWv0kSP0B1xSLl572NB3Nc920H/?=
 =?us-ascii?Q?3se6aFZgAWSWf1q1wmcuxNSbCvISJgdzyp058d26jrDx7aVsSeu9sYqTnB6p?=
 =?us-ascii?Q?PHf7WM6VhgI8E37A7ynS6fGrHarPkyOQcxt8chCm9Qli9FkLfH0rWvLYG2la?=
 =?us-ascii?Q?iUdTfYx6n4P5qItBR3NfHJXiEmn4vhbrxSDR299C2XTFELqfWoaBRKoET/zN?=
 =?us-ascii?Q?792C06EX2+Ljdliwa2WymEqRl8ceebIB3Mi1NLxOeiW2KTdC1E29hAPqI5vJ?=
 =?us-ascii?Q?//itRwD+/jUZUW65Y6Q+v8m2tZNLim1aaKyD2BRrHpSF9hoX0lUtf4E/SOsB?=
 =?us-ascii?Q?GwUyH4TYVxUzYgVMscENoTXJs77dOKohhWaHEHAVxS2vGM9smmrR5uZOzuik?=
 =?us-ascii?Q?XfBEKbej/8MGKi8B1OoUsIjdqmvTeQD4cUYzZgCrGJrtwa+R8Q2py3Rh8xvC?=
 =?us-ascii?Q?lgw3npCKy/4nPvEv/g/okSwmS3RJhsCQ9Q4w1om6VUqb07XkjNBjzR+m7SPz?=
 =?us-ascii?Q?RTO/rYXlxRLJ1NCEj49/AEyVHoU9l/G69q5VHx27C2mJTZzYMC6jQsa1mIjA?=
 =?us-ascii?Q?VxZDpKu18vRTsFpvtyYFDyiFvdfXh2APxcLAKfAT11wyHfH+G9HqvGQTnas3?=
 =?us-ascii?Q?35ovRoV/m/Yzk0TEXUuO2g3d1P5BLbD56VN66Pw4HSM7la7fu82WzRn6Gs/V?=
 =?us-ascii?Q?efTz53Wsmwuf5q2A2u+8peZSJ1kn+443pjez/+d/21ldDrC4snKUZll3CqzZ?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2276313a-cecc-4770-1c80-08dab84f1394
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:40.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CflItTMhAQrV8E/lFsLXNEq7WlEKjhvLvM7sNAOpyQdiJeUxDdFTycQ/AOp7Nc37NTJNx5oOMD/2QCiDuWNwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9648
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
- Describe modes in device tree

Changes in v2:
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 3d9e29824bb2..8f986b4f5efc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -423,6 +423,24 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.35.1.1320.gc452695387.dirty

