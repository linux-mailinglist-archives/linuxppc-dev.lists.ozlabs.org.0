Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABB6DE43E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwvvm6XBJz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:47:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x2J3QQoe;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x2J3QQoe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::322; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x2J3QQoe;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=x2J3QQoe;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20322.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::322])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvsr4xPyz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMuN71Z/SrP/CJY2isODLZRwMYjIyyhUTxIAaM+yBXc=;
 b=x2J3QQoeWZypTvJke6XedmhhL3AFuTvoZXK7HyVg9YCAuHLL+GGcOddlovejZ8ItbyML/t4+Gf851G2WLLCoaak/RUokOWsTbOs0S4OCvzExEZESSylo6N8PA5r8j6rL88pmwjLqqGegrvQSrS+GQ+dHK2FXdDF2JvLQpNBKwoKHEOl+LEMJpQx2C5IEZFew38mFvxSqcUAul5YxxEpY6avZC2VjAz+8VwtT94EIomrUHdTaf2uBZYS9PiWET+hJKO+MiUxTgP0B3YdHob8SAAByCywKVJAmVTj8Kf6eaziS0bpeRIZ0pDbWIXT4A17tHYB85qqOb+tPDaImhluUYw==
Received: from AM5PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:203:91::12) by GV1PR03MB8734.eurprd03.prod.outlook.com
 (2603:10a6:150:8e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 18:44:55 +0000
Received: from AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::d) by AM5PR0502CA0002.outlook.office365.com
 (2603:10a6:203:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Tue, 11 Apr 2023 18:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AM6EUR05FT013.mail.protection.outlook.com (10.233.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 18:44:55 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 3C4DB2008026E;
	Tue, 11 Apr 2023 18:44:55 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3752420080073;
	Tue, 11 Apr 2023 18:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYpgA9PQ35dUlNGHAPL7w2J0A2+FcQchGB6uHqM4t+x6ROKxPqU3WfCjTQIrLA+SubTBzkf9nSPY9CNfiDUEBtaNdoxJCbZ3nSR8qvALkPVmuCh9afpksCjhV8iWrFkINcw/8j/bM0l67frcfKB6UmiYRuXoqJbwAg6rdsUCBURGsPdNvsouMw3ls+mDaSTbj4l4W+FMOjnkIDLOr3W5tgdfkwHV2ipuKS6hO/yZdugWEIhdR9A+JCe6MlkrJRxWA/AbP8Fh8ULrHJRAY44YhGWpLsJCJqQRCH2YNrPnpNQqAeCUiDrkG359tYftFkiH3QCBLloRGfpGRYbGtCKQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMuN71Z/SrP/CJY2isODLZRwMYjIyyhUTxIAaM+yBXc=;
 b=g8CYC4Su2/s2s900zbz9SBUZPqCVdyx+u2o2yBILk90+LPc+RudS79tzkjnFFJeXEyqMB1fQxJWNn7Tz0aPzALruXn0Y7Dn0XP6kacnbvgftP1eeNW4Rye2or/ozXMZdE3c/vpgj4RusuFTiaziOEaO+rFKuzg9xBlePVoTX6zbty3tvmeeWodCJIPVpmN5/cDU9ypEPfueooGJMK7svwMUOoiyDucyU53tYU3mktbJBIgoR0+n38hoS4WDVmeq/GuWtnCSwBR1nH33WgVKXxYUsLvHwRs9Eow6xNpjAOGzzNXC+8dPMg5MUXbgTA6e6h6BOHswRTxLTt82ANyBRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMuN71Z/SrP/CJY2isODLZRwMYjIyyhUTxIAaM+yBXc=;
 b=x2J3QQoeWZypTvJke6XedmhhL3AFuTvoZXK7HyVg9YCAuHLL+GGcOddlovejZ8ItbyML/t4+Gf851G2WLLCoaak/RUokOWsTbOs0S4OCvzExEZESSylo6N8PA5r8j6rL88pmwjLqqGegrvQSrS+GQ+dHK2FXdDF2JvLQpNBKwoKHEOl+LEMJpQx2C5IEZFew38mFvxSqcUAul5YxxEpY6avZC2VjAz+8VwtT94EIomrUHdTaf2uBZYS9PiWET+hJKO+MiUxTgP0B3YdHob8SAAByCywKVJAmVTj8Kf6eaziS0bpeRIZ0pDbWIXT4A17tHYB85qqOb+tPDaImhluUYw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:39 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 00/15] phy: Add support for Lynx 10G SerDes
Date: Tue, 11 Apr 2023 14:42:57 -0400
Message-Id: <20230411184313.3679145-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|AM6EUR05FT013:EE_|GV1PR03MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 8090d6f6-8143-4dff-db03-08db3abcd7ea
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  vHCy6j4QktqwI6qmRlHplNIErFI3IZ83Y4e6s5Ho6zB82bzrY8fAP/HkAUl9PjiiSmQjdyTCehJZ5p0j2A00YAkK6OH2IsWeAPG48KTfQpzNa5h/KF1hIKqWXHJnWHZRSz3aTxnKxX8AOQ8zW4xn0tf1OmaQ/4KMiOHFs0Y2p8vNqswTH7hz6mI9jB7pIPdbjZOuQszkal7HVUH9+EyA9Sf5oq1mKypkqjCoDxeLuZp4PvIKiHnUPZ14w16WlSoBLRl5bR5NiiC7GbKuBZTd8JJmJcScHX/sl4Z+4t/WrFTc3MKxKVVrFTktvGD5uzMDRp97O39QoDqOM8MP7Rqj0GKoPbFYwXndX6nNF1jyqqERi3CRVpGIhPk3pVdfYALpTHEI6iyO1D49MVTtcoTG6ZSGzhka9A8/pFCFepm5W4+sQ2w7P1rJeQOhr9rTMsx5NF+AjVodBSy8w1t5zpCO9/6W2O3avpBj/BTdy7nrIZl8Edx5U7+ckpj7exOrT8peDDdYrDf+NZeZQtH7cRIY5WlMwJlOtDuTa4p4guy3p5Buox/9ypNIjfLg+h174eetJnbdPHfFTI2dlivEhucsfU86MrUYlWTs371IUGZqWiOicBV+8j7ycbq9pAgRjWho
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(30864003)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1b55f1a2-f063-4c97-9982-08db3abccdff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qUzT4sP+RwBFCnwwDfUn/LjEdPg8ad8ezAAQ1E8RPttw5riy/WZNcoqXwMSXWxqEKZz5bdBbsEfd8Bvsb6IZZ7XSmkGlzNwL7xTmEOP8uRdoNDRIK18rh8klYcbvFi/dF3W+skGLUzu9QxUp6AUhiTnShqpQUf2Ldq7dPvvL2RMTR5iicYIkjvVBkfT6l8WzPnjyywcvh0K+1ND8hrDWiEu1ks0pwYpw5NU9TUfNZJVa/q5+i1ILyl6cbrIsXI0C9PT/qwggFkrDontSPZzOtTnf3OJi7yYSiAfToKLO7D3elBiODxoPtzX2lYlMBv7gX8LXZe1TT1Yw3SW1V0kRKHP0C/vDleiA4qaBqb6p6QWaUc3a+l3DPetDDTm0Mp0p6dd7xP6rB6fvghycY/vSAWFaGzoLkhbz1hBzSOEj8tKkMfvtMMG0dR5GQcW35hTd+otvxE7UCfBBBinleZocb/7mdBMOI7O2FvY3a/rw/HkGvamv4wUr8cnVsqs+ppRtEmkdFdV3I9vOCuJExl+NKUsi5mP/ch6fV9tl7aGav6YnEgIwelzsdoXvy1EZ5Q9M7cOM9e6tbezpue1zqkIVY9T1L0RjJPcEeZtVaBJzwNs8Ipqb1HnCHO0jbfJCT59eJcTu0K8r/4WY+aKMVbiJkA3RLmaZZHWKS6yUXf93/6Zh5U/1tKf8E/HTahzSD39b5RuYmIMlZvrc4fttc2PlPyHV7PHZWmemLiAUBcP8XjO4kMG5fB0OK0fG7ufJLzHfN8gnIp+WWxqe8QYd7br9Tg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(376002)(39850400004)(346002)(396003)(5400799015)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(6666004)(36756003)(5660300002)(2906002)(30864003)(44832011)(7636003)(7416002)(82740400003)(40480700001)(86362001)(8676002)(356005)(7596003)(70586007)(70206006)(82310400005)(8936002)(41300700001)(4326008)(47076005)(83380400001)(54906003)(34070700002)(2616005)(316002)(1076003)(6506007)(6512007)(110136005)(186003)(6486002)(478600001)(26005)(40460700003)(336012)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:44:55.3344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8090d6f6-8143-4dff-db03-08db3abcd7ea
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8734
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
Cc: =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Madalin Bucur <madalin.bucur@nxp.com>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G SerDes found on the QorIQ T-series
and Layerscape series. Due to limited time and hardware, only support
for the LS1046ARDB and LS1088ARDB is added in this initial series.

This series is ready for review by the phy maintainers. I have addressed
all known feedback and there are no outstanding issues.

There are several stand-alone commits in this series. Please feel free
to pick them as appropriate. In particular, commits 1, 3, 4, 12, 13, and
14 are all good candidates for picking.

Major reconfiguration of baud rate (e.g. 1G->10G) does not work. From my
testing, SerDes register settings appear identical. The issue appears to
be between the PCS and the MAC. The link itself comes up at both ends,
and a mac loopback succeeds. However, a PCS loopback results in dropped
packets. Perhaps there is some undocumented register in the PCS?

I suspect this driver is around 95% complete, but I don't have the
documentation to make it work completely. At the very least it is useful
for two cases:

- Although this is untested, it should support 2.5G SGMII as well as
  1000BASE-KX. The latter needs MAC and PCS support, but the former
  should work out of the box.
- It allows for clock configurations not supported by the RCW. This is
  very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
  on the same board. This is because the former setting will use PLL1
  as the 1G reference, but the latter will use PLL1 as the 10G
  reference. Because we can reconfigure the PLLs, it is possible to
  always use PLL1 as the 1G reference.

Changes in v13:
- Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
- Split interrupt changes off from serdes support
- Split off SFP addition from serdes support

Changes in v12:
- Put compatible first
- Keep gpio-controller to one line
- Add little-endian property
- Alphabetize compatibles
- Remove some comments
- Remove some examples with insufficient novelty

Changes in v11:
- Keep empty (or almost-empty) properties on a single line
- Don't use | unnecessarily
- Use gpio as the node name for examples
- Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml

Changes in v10:
- Convert gpio-mmio to yaml
- Add compatible for QIXIS
- Remove unnecessary inclusion of clk.h
- Don't gate clocks in compatibility mode
- Fix debugging print with incorrect error variable
- Move serdes bindings to SoC dtsi
- Add support for all (ethernet) serdes modes
- Refer to "nodes" instead of "bindings"
- Move compatible/reg first

Changes in v9:
- Add fsl,unused-lanes-reserved to allow for a gradual transition
  between firmware and Linux control of the SerDes
- Change phy-type back to fsl,type, as I was getting the error
    '#phy-cells' is a dependency of 'phy-type'
- Convert some u32s to unsigned long to match arguments
- Switch from round_rate to determine_rate
- Drop explicit reference to reference clock
- Use .parent_names when requesting parents
- Use devm_clk_hw_get_clk to pass clocks back to serdes
- Fix indentation
- Split off clock "driver" into its own patch to allow for better
  review.
- Add ability to defer lane initialization to phy_init. This allows
  for easier transitioning between firmware-managed serdes and Linux-
  managed serdes, as the consumer (such as dpaa2, which knows what the
  firmware is doing) has the last say on who gets control.
- Fix name of phy mode node
- Add fsl,unused-lanes-reserved to allow a gradual transition, depending
  on the mac link type.
- Remove unused clocks
- Fix some phy mode node names

Changes in v8:
- Remove unused variable from lynx_ls_mode_init
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.
- Prevent PCSs from probing as phys
- Rename serdes phy handles like the LS1046A
- Add SFP slot binding
- Fix incorrect lane ordering (it's backwards on the LS1088A just like it is in
  the LS1046A).
- Fix duplicated lane 2 (it should have been lane 3).
- Fix incorrectly-documented value for XFI1.
- Remove interrupt for aquantia phy. It never fired for whatever reason,
  preventing the link from coming up.
- Add GPIOs for QIXIS FPGA.
- Enable MAC1 PCS
- Remove si5341 binding

Changes in v7:
- Use double quotes everywhere in yaml
- Break out call order into generic documentation
- Refuse to switch "major" protocols
- Update Kconfig to reflect restrictions
- Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
  anything.

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime
- fsl,type -> phy-type
- frequence -> frequency
- Update MAINTAINERS to include new files
- Include bitfield.h and slab.h to allow compilation on non-arm64
  arches.
- Depend on COMMON_CLK and either layerscape/ppc
- XGI.9 -> XFI.9

Changes in v5:
- Update commit description
- Dual id header
- Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
  series to be applied directly to linux/master.
- Add fsl,lynx-10g.h to MAINTAINERS

Changes in v4:
- Add 2500BASE-X and 10GBASE-R phy types
- Use subnodes to describe lane configuration, instead of describing
  PCCRs. This is the same style used by phy-cadence-sierra et al.
- Add ids for Lynx 10g PLLs
- Rework all debug statements to remove use of __func__. Additional
  information has been provided as necessary.
- Consider alternative parent rates in round_rate and not in set_rate.
  Trying to modify out parent's rate in set_rate will deadlock.
- Explicitly perform a stop/reset sequence in set_rate. This way we
  always ensure that the PLL is properly stopped.
- Set the power-down bit when disabling the PLL. We can do this now that
  enable/disable aren't abused during the set rate sequence.
- Fix typos in QSGMII_OFFSET and XFI_OFFSET
- Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
  reflect its function (adding post-cursor equalization).
- Use of_clk_hw_onecell_get instead of a custom function.
- Return struct clks from lynx_clks_init instead of embedding lynx_clk
  in lynx_priv.
- Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
  primarily in the layout and offset of the PCCRs. This will help bring a
  cleaner abstraction layer. The caps have been removed, since this handles the
  only current usage.
- Convert to use new binding format. As a result of this, we no longer need to
  have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
  instead of lynx_priv.
- Remove teq from lynx_proto_params, since it can be determined from
  preq_ratio/postq_ratio.
- Fix an early return from lynx_set_mode not releasing serdes->lock.
- Rename lynx_priv.conf to .cfg, since I kept mistyping it.

Changes in v3:
- Manually expand yaml references
- Add mode configuration to device tree
- Rename remaining references to QorIQ SerDes to Lynx 10G
- Fix PLL enable sequence by waiting for our reset request to be cleared
  before continuing. Do the same for the lock, even though it isn't as
  critical. Because we will delay for 1.5ms on average, use prepare
  instead of enable so we can sleep.
- Document the status of each protocol
- Fix offset of several bitfields in RECR0
- Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
  a PLL is "enabled."
- Only power off unused lanes.
- Split mode lane mask into first/last lane (like group)
- Read modes from device tree
- Use caps to determine whether KX/KR are supported
- Move modes to lynx_priv
- Ensure that the protocol controller is not already in-use when we try
  to configure a new mode. This should only occur if the device tree is
  misconfigured (e.g. when QSGMII is selected on two lanes but there is
  only one QSGMII controller).
- Split PLL drivers off into their own file
- Add clock for "ext_dly" instead of writing the bit directly (and
  racing with any clock code).
- Use kasprintf instead of open-coding the snprintf dance
- Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
  support, so nothing is truly "enabled" yet.
- Describe modes in device tree
- ls1088a: Add serdes bindings

Changes in v2:
- Rename to fsl,lynx-10g.yaml
- Refer to the device in the documentation, rather than the binding
- Move compatible first
- Document phy cells in the description
- Allow a value of 1 for phy-cells. This allows for compatibility with
  the similar (but according to Ioana Ciornei different enough) lynx-28g
  binding.
- Remove minItems
- Use list for clock-names
- Fix example binding having too many cells in regs
- Add #clock-cells. This will allow using assigned-clocks* to configure
  the PLLs.
- Document the structure of the compatible strings
- Rename driver to Lynx 10G (etc.)
- Fix not clearing group->pll after disabling it
- Support 1 and 2 phy-cells
- Power off lanes during probe
- Clear SGMIIaCR1_PCS_EN during probe
- Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
- Handle 1000BASE-KX in lynx_proto_mode_prep
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

Sean Anderson (15):
  dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
  dt-bindings: phy: Add Lynx 10G phy binding
  dt-bindings: Convert gpio-mmio to yaml
  dt-bindings: gpio-mmio: Add compatible for QIXIS
  dt-bindings: clock: Add ids for Lynx 10g PLLs
  clk: Add Lynx 10G SerDes PLL driver
  phy: fsl: Add Lynx 10G SerDes driver
  phy: lynx10g: Enable by default on Layerscape
  arm64: dts: ls1046a: Add serdes nodes
  arm64: dts: ls1046ardb: Add serdes descriptions
  arm64: dts: ls1088a: Add serdes nodes
  arm64: dts: ls1088a: Prevent PCSs from probing as phys
  arm64: dts: ls1088ardb: Remove aquantia interrupt
  arm64: dts: ls1088ardb: Add SFP cage
  arm64: dts: ls1088ardb: Add serdes descriptions

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |   16 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  123 ++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |   38 -
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |   38 -
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |    4 +-
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |    4 +-
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  248 ++++
 Documentation/driver-api/phy/index.rst        |    1 +
 Documentation/driver-api/phy/lynx_10g.rst     |   58 +
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |   26 +
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  111 ++
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |   82 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  156 ++-
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-fsl-lynx-10g.c                |  510 +++++++
 drivers/phy/freescale/Kconfig                 |   23 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1224 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 include/linux/phy/lynx-10g.h                  |   16 +
 26 files changed, 2606 insertions(+), 115 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
 create mode 100644 include/linux/phy/lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

