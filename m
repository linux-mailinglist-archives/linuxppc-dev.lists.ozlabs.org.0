Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97866E11EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4PT4clCz3fcp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:13:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gUJ/kme1;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gUJ/kme1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::322; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gUJ/kme1;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gUJ/kme1;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20322.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::322])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gb2GwFz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=gUJ/kme1acvgiE39wCzO0ythXRadDAIXYZ4myCLIie3gBlbNQvAcndV9Q9x7XXewsEPsSQYj5nGtQg8ydBbTqGb7tBMHGWzDoQDJ/9XuTND86+01xsMPJXGBqhttvUyqWzCYWGtqfmgiSikP5winE2ZIZDbwoO7BbVDKDM/WODZQyHKq1jAgcCy5oRmzrUn9z51u1RYfNyWtyU70TprbV2Z+NuNjLGExeWUpN9n3wJB+O0iloroGY/ODxMw2a2Llp8EhPUscgFG291gWBhgEAbXHLfmfFxj5EoB1F5xtKRWXZUWHryipNpzKQVxeodXBqVj3eHy+q5lQltw2SA6Sjw==
Received: from AM6P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::30)
 by PAWPR03MB10043.eurprd03.prod.outlook.com (2603:10a6:102:35d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:06:59 +0000
Received: from VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::c3) by AM6P191CA0053.outlook.office365.com
 (2603:10a6:209:7f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 VI1EUR05FT013.mail.protection.outlook.com (10.233.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 16:06:59 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 067D02008026F;
	Thu, 13 Apr 2023 16:06:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 5C41420080073;
	Thu, 13 Apr 2023 16:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHEgl0OqHjF01XqpcOne3xfe7nv6Qsa1mKUmED0vrBJNkh1QMOhObtwQ59HGvfZrNVf8XEavhIoNLtzMT0pWSp+FiXHqFI6LRIX1T7sXcd2gV1LUTbh0JGknJyYVaWpRVq3+5M737dtCv+E2gm/wPYTt45hs1E51M6cfsojjSl2M1kp45LdOCTWNQNX4A75mlJSuOhmxPKrGJ4DUMSDF+r+AVe6LT8+kYmLmMzG+xLgJJ967V18XJVnML0YuJmwPw42lIhWY1iY1X2cs+aFA/mSMdNA8tjZW/MuYodDUwuniqY44/4yg4OWMi5FKJ0Zp1NJX2I7p7nWRrXelGdMvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=fHr7T022I0TDM5xRP7OPIVMxO1pfdJs6ZLYvz+3dJKqcUf2p5xa9hRDRNZflbjj/EjuL/SuU0QnLzFu0vwPhvvStqs2Lgg7jGy84QL8IzU86+XIpu6ywE+8YsogmGTmB8R4G7+Ub7ANOtTzeCVzDDcfzGMtrPzWq+ptM4e+/zG01Sq75+IG1KjQyUzwAhE3M9azsWkLVZAPolPUh0cfDNoQd4fWOOd077X9GMrxmXmf9z0ST6QYPsw3LNcgd4e06z+64PPfhMB6QGWfACoebMTa2s97K1IJmgXru/q78iuappo2fsk5qec3inoaiaCkvth4HsNbgrYI4bwlp0tkHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=gUJ/kme1acvgiE39wCzO0ythXRadDAIXYZ4myCLIie3gBlbNQvAcndV9Q9x7XXewsEPsSQYj5nGtQg8ydBbTqGb7tBMHGWzDoQDJ/9XuTND86+01xsMPJXGBqhttvUyqWzCYWGtqfmgiSikP5winE2ZIZDbwoO7BbVDKDM/WODZQyHKq1jAgcCy5oRmzrUn9z51u1RYfNyWtyU70TprbV2Z+NuNjLGExeWUpN9n3wJB+O0iloroGY/ODxMw2a2Llp8EhPUscgFG291gWBhgEAbXHLfmfFxj5EoB1F5xtKRWXZUWHryipNpzKQVxeodXBqVj3eHy+q5lQltw2SA6Sjw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:42 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:42 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 05/15] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Thu, 13 Apr 2023 12:05:57 -0400
Message-Id: <20230413160607.4128315-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|VI1EUR05FT013:EE_|PAWPR03MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 641395ad-04a6-48d8-5eb8-08db3c391c9e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  xUMhQtmRZlWbp4rva+FPwQQfKBhHq7n0sIBbDMiNo6NhEqAV7PEBeuaFQWJFN6LS90l0Tuhgo1rTDKc6epo5rVGazj44PpaCq3//8uvsxGW+g9LXB9uwSckzaQL2T9m0LWOTBwqfohHZaEYX5M+7y02/paGJKQPHOJV9lpB5XloHZ30ak04TUGOCi+e+Iika1ek0Z13x29SsWTZdnafCWXqZQPpZvIezsmR0HzqrrO/VbExZo66QQ8o2lKk1BGSIMutPRB5do+Dm34jr118INAuvtkMyXWL/lfOLUTxrvdOLzsW+JGPjn8nAteQ+QGt01TydxXVqgm+folk2d5UZM+wUQM90NDYqEQ0Zx7JxKgZCRdaSlG0P0SI7wi/nazoCj38mSaY1LXWfVl285aLdJr5/HcbqsFkci2qq9L4RRxM27jjqXYvjqfh2+sUVWwBgjnNTEd98bI7ou1XZXN8JGxr2kMUScJA678/xZ99xy4Wdq08Hx6OdynguRFSzbot72svr5DzJFxj5BsHooiQ1K0HjXHZUj6PoZD4eICFPZJExWqYtdTil1hOu2XReMPqEtVSIXYiaHyD7V1w2gfGvHxTBG98fli6ObC2tYjvDa1qWMhk548XwMvIVP2db1rZP
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	8c8dfde8-c889-4a2c-20c7-08db3c391274
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MTdeOV3sR4OpKntlXc5uUvKiogECE4NKgCZRq6bILCHQ1ymlmdpa/f6i9R2cWsUV6MBWJdspG8kQ5/TFlup94P1UaDB8QyqNTatweMb/i+RQZkex58ODPLukFsHx2a7bzqwU2xwxYY++O4LY9va6nlS7CkEgpmASNcEgaG3P02dWdjK2wUfwmHlX70YkDeL/CpkVXUTW00UTgB87c+7QTCLNKajIJaS/ix3qaTEPoo6Cpz9/mz3J7W/kBO6G3fTZJ199CPRtq5ylgA+7lsGI/+Y1NDbKqoak2Ww6wXZ6rMuv8BGiLkyJWiNTiYwFp1uOtvt6y0xqGsssSnqZ39UUVc8bQDjAoXWseG3uZi3EPCD/f+JbcufVjvRmb4VpkXqp3gpGZRf+QQnkO+Jw3rFcHYXj4Z/A/JgFTsHZmAhIbBLTGo2dh/BhtxQ0uayRmhbo0MlmEEk30lKyrVk/GbFQpFaj5PRljSb5ZzKC3dABzXgsMXGdh97DbDcREQxtAINEVQVCP4heoPMPXGNT4g22YeDvHJU0vqj2IDklVC8SwK24u2Wy3KU/PYBczCkGdYABVTP96mmaEptPhf05/n/V5gtK1z+jkc+nbT7ypR2gcUCpmoZyrIjcS5S7F2srER5XIWAKWYq3+l7//atFQwfV371oPYAfj6F9v4X9SLkf6lkJNIwPmm2fyK8tpeTjYte7gf7wJjfy2Udr79BLJRy7DEWxmSHAwlfUNqmEkG4RCB8euaIKB8GSMEtGrEpAbVDUuHjVrAtXdbyGOG15MMi+6Q==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39850400004)(5400799015)(451199021)(46966006)(36840700001)(40470700004)(2906002)(7636003)(356005)(7596003)(40480700001)(86362001)(83380400001)(6506007)(44832011)(26005)(6512007)(336012)(82740400003)(1076003)(186003)(2616005)(316002)(110136005)(5660300002)(54906003)(6666004)(8936002)(40460700003)(41300700001)(6486002)(478600001)(36756003)(82310400005)(8676002)(70206006)(70586007)(4326008)(47076005)(7416002)(36860700001)(34070700002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:59.3063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641395ad-04a6-48d8-5eb8-08db3c391c9e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10043
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
with assigned-clock* to specify a particular frequency to use. For
example, to set the second PLL (at offset 0x20)'s frequency, use
LYNX10G_PLLa(1). These are for use only in the device tree, and are not
otherwise used by the driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v6)

Changes in v6:
- frequence -> frequency

Changes in v5:
- Update commit description
- Dual id header

Changes in v4:
- New

 include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
new file mode 100644
index 000000000000..15362ae85304
--- /dev/null
+++ b/include/dt-bindings/clock/fsl,lynx-10g.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
+#define __DT_BINDINGS_CLK_LYNX_10G_H
+
+#define LYNX10G_CLKS_PER_PLL 2
+
+#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
+#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
+
+#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */
-- 
2.35.1.1320.gc452695387.dirty

