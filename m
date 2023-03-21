Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417636C3BB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:24:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph33p0JN2z3fgX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kz2tE0sh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kz2tE0sh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::30f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kz2tE0sh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kz2tE0sh;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn2030f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::30f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2rC696Xz3chV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=kz2tE0shNrxUaxUtjhtPiPw2vAdzv0wHPcVqursU1tFgIMN6CyV90bO7QcyJGqcvgdGW3oUnjk1q5oKYQcqxoXacsFN+UklPiEu3sJuup+WH9KkcW2Yl/xvYT7d/t6Z8EIcbQf44KrPrbT9PGi/j+3yhz659uGr936zvnLrfbkIdJTxMNGlwWors6R00igzsL/JDmYRe+dx2aSq17ZJuY/CR9jOVytrK3VaCeoFrs+Ib4xlKnY6ICsqW7d2dndz3/PnEivbG5b6quKaNx/MzMYEnz/WqeDiDsWS3IScB0SCOZnXNzYcP8flUuMYeLaWfZOvaAkenUXJcWfG8AEb1Xw==
Received: from FR0P281CA0179.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b4::19)
 by DU2PR03MB7845.eurprd03.prod.outlook.com (2603:10a6:10:2d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:14:02 +0000
Received: from VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:b4:cafe::bc) by FR0P281CA0179.outlook.office365.com
 (2603:10a6:d10:b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.16 via Frontend
 Transport; Tue, 21 Mar 2023 20:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 VI1EUR05FT007.mail.protection.outlook.com (10.233.242.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:14:02 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 2A4022008026E;
	Tue, 21 Mar 2023 20:14:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.170])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id B008E2008006F;
	Tue, 21 Mar 2023 20:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhonhixuu6WRZutT6AzpbvwLF+crKjxvnT9VW85shMmvIm8C5bEC/baBKqvkXr/uuoWwj8rvButL1DQ+vgMUHCT4fRMu8+9Vdvsd+K9TxM2svnjP8xZx8psfikDgMbfwo/FzA8aR4+iqE//n3J8ONyxTz6Ehx2oz3hQD1DnysKUznWTrJ/zWzEPKYCmqKZdz7kkQbL+6CNZaN5QX8cWOtjlf1kQ3SqgY6aZky/pALQabs5sIy+I06mXe2s8bBEa5cQ2a1Xq904shHrtGeoChQ4ZkO3lJoeEA4WL1uHyh0o1TjoztL/gK84V8WqdotAwRw9OWQ3kJmxPRF0nc/fKPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=RjOxK2LMvn71bvcEgcpADNdQO0Os1L+oPAX5TxTnNB0tjwmHMVPoGl73bmZl6IVzCrka7BR+1A7XzT3YNp4VFyG+zULY7B6ubEOM3Pw5Xy+jGVv4eOIWFjREsqQ/qWmkin419Oth4sSXvu2rV4yKFRhWbn8py88SGLkyWHjWZZSm18HjAEJTCNcWXcB/kpk7xT+UrQ3sRkTOnWyO3VRooL4ZwNTz0AgcQdi99ZdAw2IuLHWNhZK/iTYAGWfpTG4CVRUYpmCeXnJc6CXJaRJM6FEp2bx18SCvK6WUlj0mtU5SXj2PsM4bbCDD0Ce+L23Cqv7b82xXbmNzj808EOzPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=kz2tE0shNrxUaxUtjhtPiPw2vAdzv0wHPcVqursU1tFgIMN6CyV90bO7QcyJGqcvgdGW3oUnjk1q5oKYQcqxoXacsFN+UklPiEu3sJuup+WH9KkcW2Yl/xvYT7d/t6Z8EIcbQf44KrPrbT9PGi/j+3yhz659uGr936zvnLrfbkIdJTxMNGlwWors6R00igzsL/JDmYRe+dx2aSq17ZJuY/CR9jOVytrK3VaCeoFrs+Ib4xlKnY6ICsqW7d2dndz3/PnEivbG5b6quKaNx/MzMYEnz/WqeDiDsWS3IScB0SCOZnXNzYcP8flUuMYeLaWfZOvaAkenUXJcWfG8AEb1Xw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:50 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:50 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 10/13] arm64: dts: ls1046ardb: Add serdes descriptions
Date: Tue, 21 Mar 2023 16:13:09 -0400
Message-Id: <20230321201313.2507539-11-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT007:EE_|DU2PR03MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 8063dd99-4dc2-47c1-7f43-08db2a48d05f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  ftnXvB5r6nDNDHkIix2zge/tg8mwHu9jvwVm1nJ30UeRd03dJbILaCbGAc7gkVO4ghnRD76liQXGS7DRzgxApGa/a7r6B0Qc4vz12M1stPWSrs6e3HgGsPKTApOLRjsPY9zhve1+joXdLaHdBDqVmdVpG7kpGdxYGhLW+T+VUbQ3yKQFPk8T6n8yqwRJrk4gBRn8eWNxVZIig2AKZ8EaVu68SDAWj+/wBv9zep3QZuNktEC6PxQgeyKF+zchGECD7rAHwsoeR/1k0kbcWovZAZg0JfbVDpL1GeecEsvbb15qYQUsbNyY6l6TOYo1r1RPeSSnT3n7eNN4Fnp9C/HTNxjFZcewEkRQROctWXWzsTCGDCghLmersg5N8O9VruWoY6icbdSc72GTvJsftycLsvOTFyelB7jYfa/GXUddlolOFeG3Km8CTHBN1LBnmU4FbYJhisdKpXRMLg1nF+TDXRGQrT7c9XVlPFGhkT8JV1+q4wi51ZQJ8GLzhwDtA4LEX5gNaS7hUJxboFaFucDXx5fMM1phCVT98VhZ+nl93x940dEP6/FgDdclc5qmh7pJK9Xi723IUOj/C3xNid3zReoIbcIuWWYLQ71sR0A1XXGr3nE7ElbrAs0c5djEMnDeOKenfWLuG2HC8ukDQ54KQ7BLtfhcVecq2uZ5fkMEKMlDgi9w8CecFPYkMQ/wJhZgwR7IZ/ez9ZZ+Hd2iX/2pwg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a8ab6373-0f1a-4dd6-251d-08db2a48c92e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NdT6dS6l9CPzoQeyqYPqjzCnsYWH/QyH9Z4h31y8TXca6XMh7GHy7Q94oTLK5sAEmGVhBtR6jsTUTEZVi0RVUozvM2NvYsVFxbwdV3icfBHyS/DlHtoWINqi6Jgwhkq3WF+PAewsljtz8hnmvu4zMp+qo78I+8IdvT/06UrYa+5VPgoxAghTDtPfGTfAGbmpm65FdPXKa06Z2mEF+FYTtIwD5xaAa43uNKIb6TuwSkd9u8wsSk7n2ghkySYKubFK++4VKC4iYtaAkASNMpaT4mZnX7a7POw/MP0A+KbesdsH7C8UvqNao+1w/Ycnma2sNAkOtAQ2Z6mMK7lGo7QeoGPJLD/IbFH15xiLXo92DfTNKAFP6JYNqFTCzS7+vggruPcYTVepK0Q1phM125AdWqF0Q0CcNx/s2n4oWOqe1PTJwCwyqto8QB7D+CR+LFHUCM9d04vsi9uLDTF2WQpxaRTU00+1WFIkjnoWtZRUEC1Ss0UpL/3+De77eVir7RW9hj3gJIxCmqt2sPJcTyZREQEAIWPbm1f1nTeDdOuBJ3bkBSg8kYi//FlLJXiG1SO2DUq0SndmYFJwtPOMZ7XkdlAn3C2XmNUYhA1EsxN+fzu/WtbrpcZmNL3UvMd/NhBaXcbLc+sahbgMXiFnhCEelmI+616zmP0756biiMI6mmcheWNA1dWBn1iDrLYmy5b/hDFG6lxqCfKgcA4lUmTre8XuJFUkykslFnHKBo01CODUkHPYsVYkKz62t/UfhEHKur/296vxSRNpJO8UwDv44w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(396003)(39860400002)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(2616005)(47076005)(54906003)(34070700002)(83380400001)(82310400005)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(5660300002)(6666004)(186003)(7636003)(36860700001)(110136005)(356005)(7596003)(86362001)(336012)(40460700003)(82740400003)(70586007)(40480700001)(70206006)(41300700001)(44832011)(2906002)(8936002)(8676002)(4326008)(36756003)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:14:02.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8063dd99-4dc2-47c1-7f43-08db2a48d05f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7845
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

This adds appropriate descriptions for the macs which use the SerDes. The
156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
no driver for this device (and as far as I know all you can do with the
100MHz clocks is gate them), so I have chosen to model it as a single
fixed clock.

Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
This means that Lane A (what the driver thinks is lane 0) uses pins
SD1_TX3_P/N.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v10)

Changes in v10:
- Move serdes descriptions to SoC dtsi
- Don't use /clocks
- Use "descriptions" instead of "bindings"
- Split off defconfig change into separate patch

Changes in v9:
- Fix name of phy mode node
- phy-type -> fsl,phy

Changes in v8:
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.

Changes in v6:
- XGI.9 -> XFI.9

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 07f6cc6e354a..0d6dcfd1630a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -26,6 +26,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	clk_100mhz: clock-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk_156mhz: clock-156mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+};
+
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
 };
 
 &duart0 {
@@ -140,21 +158,29 @@ ethernet@e6000 {
 	ethernet@e8000 {
 		phy-handle = <&sgmii_phy1>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_B>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_A>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_D>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		phy-connection-type = "10gbase-r";
 		managed = "in-band-status";
+		phys = <&serdes1_C>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
-- 
2.35.1.1320.gc452695387.dirty

