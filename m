Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DD6E1200
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4SM2j7Hz3fWQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O8zfWB10;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O8zfWB10;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::326; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O8zfWB10;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=O8zfWB10;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20326.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::326])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gd0kFYz3fRr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpbNhmXl3FSApAu2zjhBGd6YlvwsQfPiALtEj9OfKss=;
 b=O8zfWB10G/Q752+XZqdfHaM2cQ0iC1uQybu7UrKX8OXZyBcd5iyvT4lkuKftLGh6VRdG7KtB80Z9N21sYuTRdzWMa2kGByOPFb9w7PH+fkNThE/Wu/vBCuQVjvdhkthRX/iovd+0xuT0N4I7DZAG5CxvRPtICG+yQ1wuU8a9b5Twu/LKn/HiqgMGQzN0gLJYDrizyWJC4LJPTvTTzsZvlIzA8wp2eBcc26Sb6WcasicDCiMl35O/Jl5cVEpPP2iw/McY80FHv9JYSLsF40kMGQGBxSk2TwHh3TVvEowDTYkA4IVkW9aOs2w8B5+Y+jI9kePPlUzBzmhZw/6ILWb+6A==
Received: from DB6PR0402CA0022.eurprd04.prod.outlook.com (2603:10a6:4:91::32)
 by AM9PR03MB7677.eurprd03.prod.outlook.com (2603:10a6:20b:418::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:02 +0000
Received: from DB8EUR05FT057.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::f6) by DB6PR0402CA0022.outlook.office365.com
 (2603:10a6:4:91::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT057.mail.protection.outlook.com (10.233.239.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:07:02 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id BF66B2008026E;
	Thu, 13 Apr 2023 16:07:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id B922B20080074;
	Thu, 13 Apr 2023 16:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=einPZszjnj/WxAcWLJ5zRX0RFX9yKRD7gLa3XtNNYGyw4VELd+ANC0dPCGjrB6ZkEeT+GSuRyyDPkugL/gWxetVEw/tSfaipDOors0PRgxgc9JNWoCHtbC2/GlQqpKZ20jca7qrcG0CXvXZdRMdSicIB4e1oIESTN86mhVCiGWx6GIe7kQr5jtbqZS/mistCD7faZQrgx4QtDRJWpLMG798ExHi8Cneizn1jWpXmAqRxqIFB2F1wjuFc3x+NqCP7LoRnHHu3eLqyW91AlgnSwdmJFEAD4mPIFcXpjRAoLY2kkSIiac8rdDLzNdQfv5n9CgSiTCmDFoSR7kkWiRixbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpbNhmXl3FSApAu2zjhBGd6YlvwsQfPiALtEj9OfKss=;
 b=daR/dD77eVvkWGPUo0OYCzw6VuEIiTr1j6CCYd/U7Ev2U6VocV5paDJuoVzTiXACkZMhfURHqhfcINvTxUTnDZv5gM2m5YSpLhrtUjmm4vjn3bQ+CmkVgDfmz4t76qbzwmLDv5ROhh9keuWL3VwmERPi2d7GU1D7UVuxHttcT+7PIjDldVHZxm2DqS6xjOs7y95/u8y9M3lKqaUPYfgwzoxTWlU7mCKSSF8f7em1fmYmZXLN89yks5D9/2/kdhdI+dwl1eKIAqNVzsBq5wdgV6E3C/Nb8CGT5RRLBZQq57TfQpPHxIf92oEXcNlNPnbKGuFvk6g/w+SSjo8j5Ee/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpbNhmXl3FSApAu2zjhBGd6YlvwsQfPiALtEj9OfKss=;
 b=O8zfWB10G/Q752+XZqdfHaM2cQ0iC1uQybu7UrKX8OXZyBcd5iyvT4lkuKftLGh6VRdG7KtB80Z9N21sYuTRdzWMa2kGByOPFb9w7PH+fkNThE/Wu/vBCuQVjvdhkthRX/iovd+0xuT0N4I7DZAG5CxvRPtICG+yQ1wuU8a9b5Twu/LKn/HiqgMGQzN0gLJYDrizyWJC4LJPTvTTzsZvlIzA8wp2eBcc26Sb6WcasicDCiMl35O/Jl5cVEpPP2iw/McY80FHv9JYSLsF40kMGQGBxSk2TwHh3TVvEowDTYkA4IVkW9aOs2w8B5+Y+jI9kePPlUzBzmhZw/6ILWb+6A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:44 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:44 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Date: Thu, 13 Apr 2023 12:05:58 -0400
Message-Id: <20230413160607.4128315-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|DB8EUR05FT057:EE_|AM9PR03MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 718da52a-f1df-4e04-f9a1-08db3c391e39
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  0+zOe48aSFRet9JGS+nwP0IU3amuKtYQD8R5ZzGJNGE5vVeR301lLYMBKPIYbI3uQLDp+B95kOIywzTPyfotMaNFjTOHKv45g2maKeqE90g0Mba0U0U7AgexOHq9gpth1SjT0CXbSvOMjd5tLE8MmLwbtCSATObjvZXNt8niogXITIEcBmGoooDQQGK/7SLp+Xlc5ZWeODAmJHLzH/bLhCw2hdQ9YFXoqa+Mlu+vCbHTV4H/KPhfwapkm1Mqkae6BxVksn6IYvCBu+pLL0lRpzxXXe6YOTAtKBM8lpN1syoEQ5/rxnClAow09JAhwAVfMTRhm/l/pUFW2NDz6hGm5++saBDf7dLLn2P4gLtQQSeP2gehXwcMmmtAL+P8fNAjp4a134O30FgCKKFrSbFoyvndWqFYpCZOfbroJRcGsf8EoETRwLInl9a9zU0x7pzlXWggj08gdIc/QV6B6B80+rLO6wFZzlWzhD/OVoaq82YUsQNjYtt3ZOAfm9jNTnIMiXMEDBhBYzN0TGwgKV29pijST3PYUMla0JNLfz9YIjG1Ks7tnAvTxzDJ7I09uY/jbuTLQjXChNxtYYIEptY3sni5Iug2AORisfHBYmF4A0zgvvvTyABDIPOyj3ep+3Un
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(66899021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(30864003)(966005)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	3abbe2cd-317a-45a7-2e9d-08db3c391378
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vOo9hce1MchUQf6o+RuI0TzraojGapB1jr8E2/JGz6r9d8V2EFz2Bqj+VixS8lHA3P4vOErzzl3SFRHIIlUggdoMIo6lnXzokO00uJkf+VCI04N9RiKrdVr36DG+K5ZyDxnWix1IB2Kv/kOJ0mSTkTfNTs+XVoewOMp8JhMLd/bO9V27pXC5rxIjyP7LHE53FHcNF9k/0AhOKVqpsmCcuvHP696F0wWNO8bbAct4YvVaFvzzKvbzYSkZjS0pIJMrIberAcVwNZdseZpb0QS2OZ9qNwEn8qfCdj+Wmz24kpJPT9vneJA+ZTTMl1N+ZmQMrdOhNgqjjulGQHhXzpC1qc845tngc1qhr+8m7fd8aP0QR0VH6I5pKk2AdcRA6942CnMAayegsKhrRENK6YC1pDM0w6LEYvnFB2Q+MLdGYKGhaAzIjNFw9psTsLERE2V0R2uPDDnKWeOa8OsPnB091zkoWOdHbqI+4cdmU5RVKsgzpWt8dL9CZu2+2sJ7T2Dpzx7Ze2MQmFXtZsKM6/9ltYGhiDo08NJQq7a3+IUKzPl9auGdpHrQ9mBZM2dfmZ9G9QYfzRe+UEBZDq14Owj6g09QhtTOMk4NkM1X4EIk6EMyXGu6PHoe0icaO7lpejoIFUJc4PnhfTVRjA9e7VnjhYJKhQ63FxUDank0k4vTZD9yCMvOfEdvBPPDIFkOWgwIpnWCzMRIZFeVsZy2RllPSdcbG3t0+SZ5OPV1czIKPwrMX8Hk5X2l1YXbQyeFR4OxKtx/uHuvH2hKE0cwv+CMbQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(376002)(39850400004)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(336012)(1076003)(70586007)(40480700001)(4326008)(70206006)(6506007)(6512007)(36756003)(26005)(2906002)(30864003)(6666004)(966005)(47076005)(82310400005)(6486002)(2616005)(83380400001)(186003)(36860700001)(66899021)(34070700002)(44832011)(54906003)(86362001)(7416002)(110136005)(40460700003)(5660300002)(8936002)(8676002)(7596003)(478600001)(356005)(7636003)(41300700001)(316002)(82740400003)(21314003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:02.0038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 718da52a-f1df-4e04-f9a1-08db3c391e39
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7677
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
been split from the main PHY driver to allow for better review, even though
these PLLs are not present anywhere else besides the SerDes. An auxiliary
device is not used as it offers no benefits over a function call (and there
is no need to have a separate device).

The PLLs are modeled as clocks proper to let us take advantage of the
existing clock infrastructure. I have not given the same treatment to the
per-lane clocks because they need to be programmed in-concert with the rest
of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
platforms, since clock rates are stored as unsigned longs. To work around
this, the pll clock rate is generally treated in units of kHz.

The PLLs are configured rather interestingly. Instead of the usual direct
programming of the appropriate divisors, the input and output clock rates
are selected directly. Generally, the only restriction is that the input
and output must be integer multiples of each other. This suggests some kind
of internal look-up table. The datasheets generally list out the supported
combinations explicitly, and not all input/output combinations are
documented. I'm not sure if this is due to lack of support, or due to an
oversight. If this becomes an issue, then some combinations can be
blacklisted (or whitelisted). This may also be necessary for other SoCs
which have more stringent clock requirements.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v10)

Changes in v10:
- Remove unnecessary inclusion of clk.h
- Don't gate clocks in compatibility mode

Changes in v9:
- Convert some u32s to unsigned long to match arguments
- Switch from round_rate to determine_rate
- Drop explicit reference to reference clock
- Use .parent_names when requesting parents
- Use devm_clk_hw_get_clk to pass clocks back to serdes
- Fix indentation
- Split off from following patch to allow for better review

 MAINTAINERS                    |   7 +
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-fsl-lynx-10g.c | 510 +++++++++++++++++++++++++++++++++
 drivers/phy/freescale/Kconfig  |   6 +
 include/linux/phy/lynx-10g.h   |  16 ++
 5 files changed, 540 insertions(+)
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 include/linux/phy/lynx-10g.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fce67b74e4a2..8da893681de6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12195,6 +12195,13 @@ S:	Maintained
 W:	http://linux-test-project.github.io/
 T:	git https://github.com/linux-test-project/ltp.git
 
+LYNX 10G SERDES DRIVER
+M:	Sean Anderson <sean.anderson@seco.com>
+S:	Maintained
+F:	drivers/clk/clk-fsl-lynx-10g.c
+F:	include/dt-bindings/clock/fsl,lynx-10g.h
+F:	include/linux/phy/lynx-10g.h
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..eebed69f6c58 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= clk-fsl-lynx-10g.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
new file mode 100644
index 000000000000..78357303b578
--- /dev/null
+++ b/drivers/clk/clk-fsl-lynx-10g.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ *
+ * This file contains the implementation for the PLLs found on Lynx 10G phys.
+ *
+ * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
+ * expressable in an unsigned long. To work around this, rates are specified in
+ * kHz. This is as if there was a division by 1000 in the PLL.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/phy/lynx-10g.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+#include <dt-bindings/clock/fsl,lynx-10g.h>
+
+#define PLL_STRIDE	0x20
+#define PLLa(a, off)	((a) * PLL_STRIDE + (off))
+#define PLLaRSTCTL(a)	PLLa(a, 0x00)
+#define PLLaCR0(a)	PLLa(a, 0x04)
+
+#define PLLaRSTCTL_RSTREQ	BIT(31)
+#define PLLaRSTCTL_RST_DONE	BIT(30)
+#define PLLaRSTCTL_RST_ERR	BIT(29)
+#define PLLaRSTCTL_PLLRST_B	BIT(7)
+#define PLLaRSTCTL_SDRST_B	BIT(6)
+#define PLLaRSTCTL_SDEN		BIT(5)
+
+#define PLLaRSTCTL_ENABLE_SET	(PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
+				 PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
+#define PLLaRSTCTL_ENABLE_MASK	(PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
+
+#define PLLaCR0_POFF		BIT(31)
+#define PLLaCR0_RFCLK_SEL	GENMASK(30, 28)
+#define PLLaCR0_PLL_LCK		BIT(23)
+#define PLLaCR0_FRATE_SEL	GENMASK(19, 16)
+#define PLLaCR0_DLYDIV_SEL	GENMASK(1, 0)
+
+#define PLLaCR0_DLYDIV_SEL_16		0b01
+
+/**
+ * struct lynx_clk - Driver data for the PLLs
+ * @pll: The PLL clock
+ * @ex_dly: The "PLLa_ex_dly_clk" clock
+ * @dev: The serdes device
+ * @regmap: Our registers
+ * @idx: Which PLL this clock is for
+ */
+struct lynx_clk {
+	struct clk_hw pll, ex_dly;
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int idx;
+};
+
+static u32 lynx_read(struct lynx_clk *clk, u32 reg)
+{
+	unsigned int ret = 0;
+
+	WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
+	return ret;
+}
+
+static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
+{
+	WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
+}
+
+static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, pll);
+}
+
+static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, ex_dly);
+}
+
+static void lynx_pll_stop(struct lynx_clk *clk)
+{
+	u32 rstctl;
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(50);
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(100);
+}
+
+static void lynx_pll_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0;
+
+	dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
+
+	lynx_pll_stop(clk);
+
+	cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	cr0 |= PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+}
+
+static int lynx_pll_reset(struct lynx_clk *clk)
+{
+	int ret;
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+
+	rstctl |= PLLaRSTCTL_RSTREQ;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	ret = read_poll_timeout(lynx_read, rstctl,
+				rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
+				100, 5000, true, clk, PLLaRSTCTL(clk->idx));
+	if (rstctl & PLLaRSTCTL_RST_ERR)
+		ret = -EIO;
+	if (ret) {
+		dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
+		return ret;
+	}
+
+	rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	return 0;
+}
+
+static int lynx_pll_prepare(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	/*
+	 * "Enabling" the PLL involves resetting it (and all attached lanes).
+	 * Avoid doing this if we are already enabled.
+	 */
+	if (!(cr0 & PLLaCR0_POFF) &&
+	    (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
+		dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
+		return 0;
+	}
+
+	dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
+
+	cr0 &= ~PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+
+	return lynx_pll_reset(clk);
+}
+
+static int lynx_pll_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	bool enabled = !(cr0 & PLLaCR0_POFF);
+
+	dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
+		enabled ? "is" : "is not");
+
+	return enabled;
+}
+
+static const unsigned long rfclk_sel_map[8] = {
+	[0b000] = 100000000,
+	[0b001] = 125000000,
+	[0b010] = 156250000,
+	[0b011] = 150000000,
+};
+
+/**
+ * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
+ * @rate: The reference clock rate
+ *
+ * To allow for some variation in the reference clock rate, up to 100ppm of
+ * error is allowed.
+ *
+ * Return: An appropriate selector for @rate, or -%EINVAL.
+ */
+static int lynx_rfclk_to_sel(unsigned long rate)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
+		unsigned long rfclk_rate = rfclk_sel_map[ret];
+		/* Allow an error of 100ppm */
+		unsigned long error = rfclk_rate / 10000;
+
+		if (abs(rate - rfclk_rate) < error)
+			return ret;
+	}
+
+	return -EINVAL;
+}
+
+static const unsigned long frate_sel_map[16] = {
+	[0b0000] = 5000000,
+	[0b0101] = 3750000,
+	[0b0110] = 5156250,
+	[0b0111] = 4000000,
+	[0b1001] = 3125000,
+	[0b1010] = 3000000,
+};
+
+/**
+ * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
+ * @rate_khz: The VCO frequency, in kHz
+ *
+ * Return: An appropriate selector for @rate_khz, or -%EINVAL.
+ */
+static int lynx_frate_to_sel(unsigned long rate_khz)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
+		if (frate_sel_map[ret] == rate_khz)
+			return ret;
+
+	return -EINVAL;
+}
+
+static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
+{
+	u64 frate;
+	u32 rfclk, error, ratio;
+
+	frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
+	rfclk = rfclk_sel_map[rfclk_sel];
+
+	if (!frate || !rfclk)
+		return 0;
+
+	ratio = div_u64_rem(frate, rfclk, &error);
+	if (!error)
+		return ratio;
+	return 0;
+}
+
+static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
+	u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
+	u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	unsigned long ret;
+
+	/* Ensure that the parent matches our rfclk selector */
+	if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
+		ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
+	else
+		ret = 0;
+
+	dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)ret * HZ_PER_KHZ, parent_rate);
+	return ret;
+}
+
+static int lynx_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio;
+
+	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)req->rate * HZ_PER_KHZ, req->best_parent_rate);
+
+	frate_sel = lynx_frate_to_sel(req->rate);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	/* Try the current parent rate */
+	rfclk_sel = lynx_rfclk_to_sel(req->best_parent_rate);
+	if (rfclk_sel >= 0) {
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (ratio) {
+			req->rate = mult_frac(req->best_parent_rate, ratio,
+					      HZ_PER_KHZ);
+			return 0;
+		}
+	}
+
+	/* Try all possible parent rates */
+	for (rfclk_sel = 0;
+	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
+	     rfclk_sel++) {
+		unsigned long new_parent_rate;
+
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (!ratio)
+			continue;
+
+		/* Ensure the reference clock can produce this rate */
+		new_parent_rate = rfclk_sel_map[rfclk_sel];
+		new_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+						    new_parent_rate);
+		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
+			continue;
+
+		req->rate = mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
+		req->best_parent_rate = new_parent_rate;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
+			     unsigned long parent_rate)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)rate_khz * HZ_PER_KHZ, parent_rate);
+
+	frate_sel = lynx_frate_to_sel(rate_khz);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	rfclk_sel = lynx_rfclk_to_sel(parent_rate);
+	if (rfclk_sel < 0)
+		return rfclk_sel;
+
+	ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	if (!ratio)
+		return -EINVAL;
+
+	lynx_pll_stop(clk);
+	cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
+	cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
+	cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+	/* Don't bother resetting if it's off */
+	if (cr0 & PLLaCR0_POFF)
+		return 0;
+	return lynx_pll_reset(clk);
+}
+
+static const struct clk_ops lynx_pll_clk_ops = {
+	.prepare = lynx_pll_prepare,
+	.disable = lynx_pll_disable,
+	.is_enabled = lynx_pll_is_enabled,
+	.recalc_rate = lynx_pll_recalc_rate,
+	.determine_rate = lynx_pll_determine_rate,
+	.set_rate = lynx_pll_set_rate,
+};
+
+static void lynx_ex_dly_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+}
+
+static int lynx_ex_dly_enable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+	return 0;
+}
+
+static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+
+	return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
+}
+
+static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	return parent_rate / 16;
+}
+
+static const struct clk_ops lynx_ex_dly_clk_ops = {
+	.enable = lynx_ex_dly_enable,
+	.disable = lynx_ex_dly_disable,
+	.is_enabled = lynx_ex_dly_is_enabled,
+	.recalc_rate = lynx_ex_dly_recalc_rate,
+};
+
+static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
+			 struct device *dev, struct regmap *regmap,
+			 unsigned int index, bool compat)
+{
+	const struct clk_hw *ex_dly_parents;
+	struct clk_parent_data pll_parents[1] = { };
+	struct clk_init_data pll_init = {
+		.ops = &lynx_pll_clk_ops,
+		.parent_data = pll_parents,
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
+			 CLK_OPS_PARENT_ENABLE,
+	};
+	struct clk_init_data ex_dly_init = {
+		.ops = &lynx_ex_dly_clk_ops,
+		.parent_hws = &ex_dly_parents,
+		.num_parents = 1,
+	};
+	struct lynx_clk *clk;
+	int ret;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+
+	clk->dev = dev;
+	clk->regmap = regmap;
+	clk->idx = index;
+
+	pll_parents[0].fw_name = kasprintf(GFP_KERNEL, "ref%d", index);
+	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
+				  index);
+	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
+				     dev_name(dev), index);
+	if (!pll_parents[0].fw_name || !pll_init.name || !ex_dly_init.name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (compat)
+		pll_init.flags |= CLK_IGNORE_UNUSED;
+	clk->pll.init = &pll_init;
+	ret = devm_clk_hw_register(dev, &clk->pll);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      pll_init.name);
+		goto out;
+	}
+
+	ex_dly_parents = &clk->pll;
+	clk->ex_dly.init = &ex_dly_init;
+	ret = devm_clk_hw_register(dev, &clk->ex_dly);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      ex_dly_init.name);
+
+	hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
+	hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
+
+out:
+	kfree(pll_parents[0].fw_name);
+	kfree(pll_init.name);
+	kfree(ex_dly_init.name);
+	return ret;
+}
+
+#define NUM_PLLS 2
+#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat)
+{
+	int ret, i;
+	struct clk_hw_onecell_data *hw_data;
+
+	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+	hw_data->num = NUM_CLKS;
+
+	for (i = 0; i < NUM_PLLS; i++) {
+		ret = lynx_clk_init(hw_data, dev, regmap, i, compat);
+		if (ret)
+			return ret;
+
+		plls[i] = devm_clk_hw_get_clk(dev,
+					      hw_data->hws[LYNX10G_PLLa(i)],
+					      NULL);
+		if (IS_ERR(plls[i]))
+			return PTR_ERR(plls[i]);
+
+		ex_dlys[i] = devm_clk_hw_get_clk(dev,
+						 hw_data->hws[LYNX10G_PLLa_EX_DLY(i)],
+						 NULL);
+		if (IS_ERR(ex_dlys[i]))
+			return PTR_ERR(plls[i]);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register clock provider\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lynx_clks_init);
+
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_DESCRIPTION("Lynx 10G PLL driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..5d461232276f 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -47,3 +47,9 @@ config PHY_FSL_LYNX_28G
 	  found on NXP's Layerscape platforms such as LX2160A.
 	  Used to change the protocol running on SerDes lanes at runtime.
 	  Only useful for a restricted set of Ethernet protocols.
+
+config PHY_FSL_LYNX_10G
+	tristate
+	depends on COMMON_CLK
+	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
+	select REGMAP_MMIO
diff --git a/include/linux/phy/lynx-10g.h b/include/linux/phy/lynx-10g.h
new file mode 100644
index 000000000000..b7b80b3ee988
--- /dev/null
+++ b/include/linux/phy/lynx-10g.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef LYNX_10G
+#define LYNX_10G
+
+struct clk;
+struct device;
+struct regmap;
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
+
+#endif /* LYNX 10G */
-- 
2.35.1.1320.gc452695387.dirty

