Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7728146A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 15:45:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2rpj4NBfzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 23:45:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.43; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=obG65JtS; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2rkW3j6YzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 23:41:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip4s/KWVPRvvi3lQYdP8x+wUnOCCOQSCDq3oTgBmg/s5Zu6E3i3K2PGtT9l4qSahlPnpgSxWMC2Sg1jZLruk3ws5z6pULOyv2lSkE4h+9HSEBVuZuq3Ev3vCjMWBH4ZUA39fFGwoBIWZEFGih/769ZxOAL0cty9Od1YzN3d98uYEB7n3mzWYS02O6vku7I1vHgGcx1TcjYsmN6eha/IE8hhTdMzhJ5NmwEQCbObQQBP98gjiLY8xBHHvSWnX+/yDocTcd4cLxQY3B/d9prnlQjLNsC6HdBBn59P4/nuGfEGAdJDakUBKl2/V4ww390lHs7NjcGfQ59bIrBKFLctqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yZzyE3Y6L0G/GxlNwC2VNKQ+0D00VSK/nZm5Z1Nj1s=;
 b=K9Gw7romRUmCV0+I7MUonOm/UpDITi6nM0ANs0T/yKvX6M9c5EVuIrgIo5vr0QByy2fReNHyx1uPdWs6YQq3xdVbShbSHeotgvUJk2mWePJVZRBH+/8InN0XMWU6Z+SE5fXrcONr8Xanb7Uv0W9WDkqU42ltnlPJ1w5lNmcjaWgQEAhX51dl0uJzyEpDLA4FqkEDHJ2+c4cfX9DQU0tp4gGOy0/ZziS4r2C5XzyChY2+aD5O2c6vwuJD2Y8M+kEmrLjnG6nnwxDXjg5AMU5Kiyq926Jj6rCcfHbb04gw7u1TvlZ4UaeXHeEt87C4A9toO9C6CF4zaJ+gW2pnVifBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yZzyE3Y6L0G/GxlNwC2VNKQ+0D00VSK/nZm5Z1Nj1s=;
 b=obG65JtSAuMgomofK3qxVSABou/g1pWfG9ENbxioFjPxeeAvHBa8TuBRAI3zFGlxt/HBbreBQZ2tTOme30z3Xxete46xUKvRZHRCdkLSO4QXunVOsVIionrHinnXSxumtwctGoDwZTykZHzC762QX+zLfmwk8yDzJo6+PouRMuw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5696.eurprd04.prod.outlook.com (2603:10a6:803:e7::13)
 by VI1PR04MB5504.eurprd04.prod.outlook.com (2603:10a6:803:d8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 13:41:23 +0000
Received: from VI1PR04MB5696.eurprd04.prod.outlook.com
 ([fe80::983b:73a7:cc93:e63d]) by VI1PR04MB5696.eurprd04.prod.outlook.com
 ([fe80::983b:73a7:cc93:e63d%3]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 13:41:23 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH v4 net-next 0/2] Add Seville Ethernet switch to T1040RDB
Date: Fri,  2 Oct 2020 16:41:04 +0300
Message-Id: <20201002134106.3485970-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [188.26.229.171]
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To VI1PR04MB5696.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (188.26.229.171) by
 AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 13:41:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78307599-4edf-402c-dabc-08d866d8d9de
X-MS-TrafficTypeDiagnostic: VI1PR04MB5504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5504F950368583BF6F26CCCFE0310@VI1PR04MB5504.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRdQ/BeIRwdyYDm9U5yOAmlcuNZjJn3bU4DGUqWNmLUAXxoC5ouCqdZNzD2F+RJyDpKPR9StSqv0YWTHhxVeOOjYPEv0FgbLvOXO4jUghnc/c5qnamEKuGMA2+Z2oWyfDeQpxEukVdiz7ZSHMOVsoy+puF21kYkXbn1qjLroE/ExvlqMRnW0EJ2R+UBYrBDbA17toXYm6QmHT3h6HlEEs/jOLI3Bo6vewJeWQ/idUYPxqy1BQSUT0IZgotMAY2ScFitt1KnrxsYeC2OiuZcY5tqJXy0/Te7oSlL00r2ZTCyTvIVbNr+zcASzBcFojWyoRawXRWpx2dPrREKX3eIDj0X7ZxuGK7/JErK4dV1LLRrVXyyO6iLoBc4raYnGn4rX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5696.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(8936002)(1076003)(478600001)(4326008)(44832011)(52116002)(26005)(4744005)(5660300002)(7416002)(69590400008)(6512007)(16526019)(186003)(6506007)(8676002)(66476007)(66946007)(86362001)(6486002)(66556008)(6666004)(2906002)(2616005)(956004)(316002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hwa8Dj0VGGew6BcVTQqpN1W2CELFl1aJS1ObcVBMsusbAzi09wn+koOw+GTeFWhf18y3oP8/sGV20i/KRnYO13eSr2WRxK5GcF2ZUqMOqAzoyd7s95lIQtI/Ld7InIGUBQ2XYAIe8/MLpWdyzARWcmJqHtx4m1XhZhI+jdYVXMpMvXW5AiJ1WkwR18gKkkp5Mg7rBHvBrhCmVzW0CNZCOkDa2Fh8xzghiftmpi2VCwtq2e6vJYktA/fL6fGcr7cu2iDqPJjMVJPqxETQyko0WIlXwC6T6Ck0d0ykX9URoDibJjNifTcNZ41Fkwn12F8h7Mn+NkC3e6mwz/guKLydrkzI+n4wEJLYjCZp/pYCASTg0LdHC/tFgT+e+4ahGXyzVFldwVrdrt9tak2RCgfCvVDQmIiSkQLgWe1eKsFpxwUtMM6HRFFjs4iAggNrYpJIGz9JluRmu1aKCUJN0u55ilY+Wb5YiK6f1YnPqE5ryLKC3PePHxoxnS8Myc0ovsHO7Bioq5u7/9CfADYPXATAamweaxY3sCR79H7Hhd665kEG1/nq+tg8ux4Hf6AHobSG4DD6ODCo57J0UfxuW7FWmH5GdTk3r55ZTZjHNZsVdu+tvGkGLYfcpJ2cd2zIM6l1VU5PfIAyfaop6n8VMfzTrg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78307599-4edf-402c-dabc-08d866d8d9de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5696.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 13:41:23.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDa/XkgL2keJnvum38qvaY5NqE5UMmBkpYOHd6YxqsZ2SqgN2KFEndImQBsyN4tsgsWaZ4taeEuplcvT2KnRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5504
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
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, madalin.bucur@oss.nxp.com,
 radu-andrei.bulie@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, fido_max@inbox.ru, robh+dt@kernel.org,
 paulus@samba.org, shawnguo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Seville is a DSA switch that is embedded inside the T1040 SoC, and
supported by the mscc_seville DSA driver inside drivers/net/dsa/ocelot.

This series adds this switch to the SoC's dtsi files and to the T1040RDB
board file.

I would like to send this series through net-next. There is no conflict
with other patches submitted to T1040 device tree. Maybe this could at
least get an ACK from devicetree maintainers.

Vladimir Oltean (2):
  powerpc: dts: t1040: add bindings for Seville Ethernet switch
  powerpc: dts: t1040rdb: add ports for Seville Ethernet switch

 arch/powerpc/boot/dts/fsl/t1040rdb.dts      | 107 ++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  78 ++++++++++++++
 2 files changed, 185 insertions(+)

-- 
2.25.1

