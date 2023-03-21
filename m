Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517286C3B90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:17:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2w50l2xz3fRq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=WKcXiQAO;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=WKcXiQAO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::32c; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=WKcXiQAO;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=WKcXiQAO;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn2032c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::32c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2r24Lmwz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=WKcXiQAODHnxVNw1wJA5kYwrolqtzbVpSHRWxMaNQWuR4RNm+wyM0YmxK9W7OLVXb4cV9KZTOYe5+xdsCqg4mxe+F/hv6ujJY4YfNtIOtv5O1nq4nTR7ANUGLCBSGF5n0Hl/gxL37lIYRrR6lr7ICDncLZmL4ZxGF/9boPBLpxUPHbwk8v8Jxt1GEKZURT+VvQPZ1W1JXFthIyOfNuwo7/na976bUkvWTuTi54Caq+nXTkRLn3weEb0D2Cjw1HmRzRXI8FG1SPOphEjGo0/gq26KtgOYW3kBAhf7W9DTPjLMtaq2mzxD71v85L9eVJ5p0aH0iOhfOOme65XKB57z9g==
Received: from DU2PR04CA0299.eurprd04.prod.outlook.com (2603:10a6:10:28c::34)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:51 +0000
Received: from DB8EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::ba) by DU2PR04CA0299.outlook.office365.com
 (2603:10a6:10:28c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT011.mail.protection.outlook.com (10.233.238.114) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 20:13:51 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 1A2DE20080270;
	Tue, 21 Mar 2023 20:13:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 7D0F52008006F;
	Tue, 21 Mar 2023 20:12:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhqzr6JHEWXeaLLKJxIYRORWOquQHPBUp6MQZiscZtdCBtNNi9kFTDxn6QyJA58204G5emqnFvR5hdPaBXCW4smB/JqeTuyxZPb38aSU2ZMEsuRsiSL/pXEzaTfvi0vhrwCDGAlkt7Slt6+eDahRoiILeBidZ/ikkj1Ge51u9H8lesPJ0g1L1GRDGC/M6Ht7wwoLlMJwI19l4jRbpezl9lhWon8i31064/nFY/0eOEcFFzo3ffyOxJt9Zbkpp0PFQbXf7cPgjWZC/iqJelfYgFxen0FfFg4rZ+GBbL3KdB8E3An31+tRYfLcuE0D4gi8RYh8qElwYvhfiyO8zv/GJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=dfoJ+uNJzbXlJdRQS+wrL+OpjoArVO7osu/ndpkyg3ThC1YAb/Xd1PVot3LEw1TKGQVSyA/GuMz0LcVIp1wz+Ntcfby/brcMaS4iBfZCt06hbaEkPZthr7o74/ajD+SSEbkVY3EmK0k5JDPeeRmYyhAonVjIuGfPWhvUtRc8ErlT6MIjPBdpZC9BmMtmGzkWxmZug4MIb2dTapEcqfe7PT3FKoU27Hxp7j5Kp0fhUlahOp/O6n8+Hno8xSpaN7YVs9CGrgAT2YU7N3bcjAhGP8UXRPtJnKN1N19eM9XRrr0rSIYddrCkbXnRjY6R4XHUhs+HU8eLBQIqDuVFcSD4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=WKcXiQAODHnxVNw1wJA5kYwrolqtzbVpSHRWxMaNQWuR4RNm+wyM0YmxK9W7OLVXb4cV9KZTOYe5+xdsCqg4mxe+F/hv6ujJY4YfNtIOtv5O1nq4nTR7ANUGLCBSGF5n0Hl/gxL37lIYRrR6lr7ICDncLZmL4ZxGF/9boPBLpxUPHbwk8v8Jxt1GEKZURT+VvQPZ1W1JXFthIyOfNuwo7/na976bUkvWTuTi54Caq+nXTkRLn3weEb0D2Cjw1HmRzRXI8FG1SPOphEjGo0/gq26KtgOYW3kBAhf7W9DTPjLMtaq2mzxD71v85L9eVJ5p0aH0iOhfOOme65XKB57z9g==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:41 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:41 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 05/13] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Tue, 21 Mar 2023 16:13:04 -0400
Message-Id: <20230321201313.2507539-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|DB8EUR05FT011:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: b558fa81-87ac-4d5f-d0bf-08db2a48c9c9
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  u9aqdYnoNgtBk7HVTVmt7Cd7l0z6dG1GuvuuoOdbRRA73e7VstarQ6N44kM0NSUjUHU9u84A7bemFC0nNpxDi6sYqnOLMK9z2QEJLQ64ZnwiRFgQUuRtuhz+SvsTqTJHMnpuceK3FimpFsi+H4lB4NGfGc5m2HJJrLtxwWbrQ6oap+dHf3PZqXC3evy6cyRaw5iNbCLOhDjwLgLs7Z9Cdfh/vLmuzD+hIxstKaJ5rgQNtppyC+MWI8SnlzuH2yK2MqYPwZSg+8AOEsg6Dt5lXNrj/wWr7nr0lBq7VTxfmOfGBHk0nfmtuEcQjJcuhHnl+/kE7cX4GgrOHD6Hwr3ctfFB9d9UswFTNMdS46HXvBAt3Lr8OUxr6XS2gGHBlF9moQmbAXh7yc1GXQecDDXijZuGn3Gq+T8bHhhDRpb0qcXZXja5Z88waMRZhVKDkXkqx9T4MRS3ACWKq0ZpNkgsRzV5RjnmFuV53B2Q0HCtEA/UyIqaiTkaps9I9bNKYuwjZaLyP2/DlsY1csNFnkunpbJHhh90xYLRPpK6nCU5KYrNUEZwYn2NBk7bwTGgzsmM5rAzUTRmJE6NmyLU/rPeUJkZAXLg/l8IJnlgUNWw7ozQhYzr14RA0aNUFFiboOAEQxysvycbCqfHQijzHwQfNKjysEhxau7Th3GQQiNbiuxtZKSJM5Qj42SOjcCGb0UIhUISMIZXcu9m1VuMlWm1yg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	3ce737f1-184b-45e7-7647-08db2a48c3d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sKJYds07z1QE1fCLxO9uWvWnDS3onpYCv5bJr22lVufNmDtpU28pNAdik5wPGNd5shaymRy8O+RRYfuuFe0ZEBlFG1VGJ/ZB2puAw+beIzDkEWJBQWf0biI3OPpRMYcDGe0sAfGWB4g/9inNIrhNd2MVDvvV/Il2qoIxU9SVzPpxX6TrqhrvdyN9i79LVuXTIZgtq5/maP1CAp6bhZKyBQxAboppghojLLEgWoXeKESc6Qbw0DET0vf4onSmdIlVSP40vpm7lcpMcMqflU1RPEgcAHYX+eieMFpjlecrbwFDcnlHM0PE7ZM88lvURl9IP6WeDRxoiBzIWbOMmcoGkKdp3sUgmgrRQz8a0xLWRcClwvCFJzzhDYRAKqE1iD9mXwcujY1Qm70P1x97LaFvd+w19/ud/nmuDP7hGS0v7znmytW+Ns7kX+7ff8Q9A/xiV7bmw58+TeDtFvY44AmmxS7T0ybFrWcfLoObrTfjAMIL9NzPfN1ryOm4RwY9z71qXHzjILQOSBeGjaXPlgwfbxpmeKCWXyF6mZbau0fXw/pbC2gbCFmf1a4jg6jc3hhqAkCJgUIiJxEgJ7UbTtobb1qdRfZYnaCd4oZBUx9YOATBh4xa1+MMmdchV+fEfL5jCiBELl3mN1mQFx8aELrwaYM+HYbmriiAty/8OB+gpGBqq3ru+K0Jt5x+vHNDX/nz1se+N8A+FhP+5YrUT6dEwZnkgJ/P2MQhVls3QT9c3YsUPXbYO4wMjllE77DBVV69u4L7hWhdZEbOADUKQvMNdA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39860400002)(396003)(376002)(136003)(346002)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(2616005)(47076005)(186003)(6486002)(4326008)(6666004)(478600001)(336012)(83380400001)(316002)(70206006)(70586007)(54906003)(6506007)(26005)(6512007)(1076003)(110136005)(8676002)(41300700001)(34070700002)(36860700001)(7416002)(44832011)(5660300002)(7636003)(40460700003)(82740400003)(7596003)(2906002)(356005)(86362001)(82310400005)(36756003)(40480700001)(8936002)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:51.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b558fa81-87ac-4d5f-d0bf-08db2a48c9c9
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
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

