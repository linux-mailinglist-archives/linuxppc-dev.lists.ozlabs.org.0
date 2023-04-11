Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C63DC6DE43A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwvtp18mrz3f46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:46:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NsY9hj1e;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NsY9hj1e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::321; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NsY9hj1e;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=NsY9hj1e;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20321.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::321])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvsr6rb0z3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=NsY9hj1eph/aTxMbL/TDN8CTRt4e21p8DVuVZuV948RckcIUMq7mX+CLFp6XnPPGpXvTPGgI+N0CIMQoeus8V+/OcOnyt7OJK0uBgsQc7FXkc0Xlqzq0I5FvVor9CrLX5MOl5oAjrPP21IOYfLzfi4X0Pk11OhhSahx7b/7eWT0vioTATDDDeKPzSnNaVwbzCPQfR3QpBBqsQn0ZV4uRF5fVK3+xaFLAgNxkhOuhPiEzZ4+fXMmWTHl6XIDradaet7iloo2eQJQFf2BG/1/p+e3CnyVDX7Q2+33DTcSw/IaU/9VipiXPEbLPt0dLlnU6cv1bzvC/+dsrafnjyQxxdg==
Received: from AS8PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:312::20)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 18:45:02 +0000
Received: from AM6EUR05FT047.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::bb) by AS8PR04CA0045.outlook.office365.com
 (2603:10a6:20b:312::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 AM6EUR05FT047.mail.protection.outlook.com (10.233.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:02 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 986CA2008026E;
	Tue, 11 Apr 2023 18:45:01 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id AAB8A20080078;
	Tue, 11 Apr 2023 18:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8RSt+6/O5fg6NUn/p/kJz4UGEVCO1JaSTEYbsLWaYUJwPbqSSG/ydjw3MxhBz2TblicdL/QS/02wbpr+RjT1+zbJ2CeZLj0Z3fE9WDerN8P3+D3DdEGR92nwg7R1FzB+KZSoFLkuk3Oy7aQnVaMCs1pbD5+40AzpUfUul6asEcrWNFKQJ487tyv8aHlhrsrZvdPlIoo2fABdHTUQIeV1oxhy5V+Qxpx2pTEV+BWbw3RM4BkX9K/cyf6nhUg0LyUJyaBqnSo7JzOPg9QABJsBPwee+wukRprJIZcqrpJxJbg7Nvg7yCawNhmdlds2oNujTGiYriD3KU1wdHQPBbAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=D8OOSffnRkEae/AD8zQ+ZwkRsRc5K/Z4tIC7EW/l+qAUaQ7IJJyOB+acZrNc7rp14X29c3o1P7ssrzFK371O7Y6hf5yat8Ke2VohPzLqJCVLi57+voGWsU4sUx/5QrQUtxTxrG6IAHhGvnGDioy6v0Z5ncsL49sqhynnTlIB8Ji94lM1uOnl0lEGW1n2iW2oZoC2aw7fBNnhRr+ZBrcTsIR4G+pDjQuEAmv7a3TQRXZSH9cwZ1tjIwwvxqQ71OCxg1iPfWUr2JGvWhlWLQTwv01OS5M1HP7fQZi5WspJNGt1pf3RCS0DnBj5+77HLc4DT9IvfV29AVhUiiKF91BFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=NsY9hj1eph/aTxMbL/TDN8CTRt4e21p8DVuVZuV948RckcIUMq7mX+CLFp6XnPPGpXvTPGgI+N0CIMQoeus8V+/OcOnyt7OJK0uBgsQc7FXkc0Xlqzq0I5FvVor9CrLX5MOl5oAjrPP21IOYfLzfi4X0Pk11OhhSahx7b/7eWT0vioTATDDDeKPzSnNaVwbzCPQfR3QpBBqsQn0ZV4uRF5fVK3+xaFLAgNxkhOuhPiEzZ4+fXMmWTHl6XIDradaet7iloo2eQJQFf2BG/1/p+e3CnyVDX7Q2+33DTcSw/IaU/9VipiXPEbLPt0dLlnU6cv1bzvC/+dsrafnjyQxxdg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:46 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:46 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 04/15] dt-bindings: gpio-mmio: Add compatible for QIXIS
Date: Tue, 11 Apr 2023 14:43:01 -0400
Message-Id: <20230411184313.3679145-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|AM6EUR05FT047:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: a21b3d78-5247-4a59-8b7f-08db3abcdbfd
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  GOB5SfgvfsRnC5sCZqNxKGMqRNBV1HZcV7boJkMURNPVGYmcr+n1evpIf2yRpIWaOE52c3p0xnsQI3Vbx2OHmjjKGNsbS2gE/lcFvnrU0mV4bmxpSdNTBoOXPic4UTYCtIRGILdgOsL5jufzH0wxFzWhfXn/r2/+15w+V1FH9VZxSN4nyKkWQExzM8hVMu8qwOaWu7tgfJNNKf29+/PasxvAn4IPIZ1Peahoz9zYiB4LSEucbn+QhwhqXzoY+tPA9li88stGZ1rmLUT8WMb12ERvnivIwQAb+biINMMJgTah4IPtsaka1ur4moIfrvPxXpBLz0G77tJ69qsUZW7rG4rCVG5kCnXenC53qleb3X4F4ojaViA89JQhb+7VzxR3O+jSIL81XiPlS5ZYtLDJaRwu0gT8mFDvz7LUMREt6NTBSfjl7PTBkEiDx6wH8cEi76SfgktdjIqX7yK4NKODn5hoTYkJZpAitaY3fATQm3+4qDz+7cTTCUGXseOykuQ0PGWjHT5u9gZ7ARSquMp2qlf1sakpWoJqpA0SOy7t8AZ8p05hrl6VFlRIsVOw3OgSMTIHi0dGsjX5QiMcawtkhIbbvOGTB/58IXKMZ7PRQ1ZBfS1zXOmu2+KoOznxzW0J
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f81abcbb-af7c-4162-7cfd-08db3abcd26a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OjqYmjOwAocqB83K8/WG/Hk/qQx7i8DoBaLXVGMCZU5DqC7ZO5UQFES0VgBxrtoVEZihAnYhIVvUYQgJ4V4RmaMEwp6mbaaIS0zDiw64gCtq5pveKd+VVQ84sUJVKpcEjenIWFZOf77/O1gkskMC+OVWVgD+rq77GGJxViwQIYV3zQ8w2WBRRgdbfBBrSTI3Kr8ZEGdPhO0tfJ7xwn24V4rvsNMY1GtQ8pRQnUfcWhf7nToIcXWqp8r7j01H2adys8evgc+X2lV/xOE3yVJT3PzvdbdIf9CSLrpjtAWwMMDCBSU64feWJOk+6TO4Qy88z9FONgvf08uEVOEgkhQynr8PzY3qy/Hs+i9gte719IBtqWnjefFXH/BhpP9zlXpXr/htPNGSXXCtP2NBTByu7CDdnGD5qAYmYJ7wUAL7s5gPA5TS03e4ZJ2qS+74Ej6mMWCnQpJtuCfXUzPeIoWE0DL+dFCD2e2KbzZICr82eUW1OiKkRupxDfJe820Euo61ysCBBz+gHVxfRNaekBUSsHGz5TrvutC4pF0XwJn72d/awNkFQORVv5UqLwyAEFSCy/fFDQpU3Eba7FzuQnQQpcy+e5kVGuj7jnsYPEmwnklQXIbEazCvbmwmO/8rjBELkdLwMQb2vLL3lMkqMCtcQl3l7I/Hmn6g7HCxoygwTLH73W0xXirnWvXgx9q+jUpt+LKZAUU+UmA0c1XE4xB2cnW/UlUeXxsqCNvwijAEp3+7t8/MfMO+2rq1BPXYjddNNrCS1oOg9s8DgaT2dHHVsg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(5400799015)(451199021)(36840700001)(46966006)(40470700004)(110136005)(54906003)(36860700001)(7596003)(82740400003)(356005)(7636003)(336012)(82310400005)(2616005)(47076005)(316002)(83380400001)(478600001)(186003)(8676002)(86362001)(4326008)(7416002)(2906002)(70586007)(26005)(6512007)(34070700002)(70206006)(1076003)(6506007)(6666004)(44832011)(36756003)(5660300002)(40460700003)(40480700001)(8936002)(41300700001)(6486002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:02.1677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a21b3d78-5247-4a59-8b7f-08db3abcdbfd
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NXP has a "QIXIS" FPGA on several of their reference design boards. On
the LS1088ARDB there are several registers which control GPIOs. These
can be modeled with the MMIO GPIO driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v10)

Changes in v10:
- New

 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index b394e058256e..5abf3dabcf39 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -18,10 +18,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - brcm,bcm6345-gpio
-      - ni,169445-nand-gpio
-      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+    oneOf:
+      - enum:
+          - brcm,bcm6345-gpio
+          - ni,169445-nand-gpio
+          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - items:
+          - enum:
+              - fsl,fpga-qixis-los-stat
+              - fsl,fpga-qixis-brdcfg9
+          - const: ni,169445-nand-gpio
 
   big-endian: true
 
-- 
2.35.1.1320.gc452695387.dirty

