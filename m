Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC05280002
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 15:23:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2DMv6ZXlzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 23:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.21.64; helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=XsLk8cD2; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2DJx0vmzzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 23:20:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Anq8lxZcqk7541frcWpS9IiKOpPYTC4KD9sg0wNC2ewRNoo2jjeAT5JzarbiDf1eWL3uveIXmYyioq0CN7AJTu7dt12X/8bE4wvKgxXb4dIv+eaUoAjBJVCeW6zaw/vjFnV7FZTxa0v7GfI1uvf7N7l32KZHE5OUUgze3K/K9ufStHjwmuPXD5jkyIuOkrmfSPj5/G4wtFYjHcJoGH9BeC33AyuPY+7sTbZvlhkG3NhUJ/OSkS3/9J++stbaAP4uZaO4gDKI/gvdz/n2G/4t9FYeASRCN+g1/YtuY2WTl7Diyf6GigUWR8++yX96bUC28rQfW/wgY4h4q1WXVFiOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOqgJ8yN0efJyf3YAgSCkBsnYQC/VOTIY0vXCZxdtrs=;
 b=bPQiG7lyQxHXNWKlFoJ3hil5Eflzz2OvCeL3rrnyRJMhxQR4oK53AgUVW+MsON7KVMKeYahbn8+wE5PJJC7j0GuL7x2dJW5o+f4H/GitSLojIE2sJ3sDhnpFd+XoTBvcW2cwbxIeuKnuPtyBsyUZZZfnROqStpNQ44fUaAA5iiJFuBlfjMoPYkDEhjGAi67Wk0UR6rv6KSC322ocONcZ2LXSpoK+K+brNI/VPcdPav3Z3Epq6qjKTivRxltFbX6KibiqdpGfJGrmIHL87Yvo6uhGh3FQW/zEGK5fOAS4Nh/lZ1sKY4o3U3HWrN5yAI/9nd1YWRlw9q8RF3p8VPR5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOqgJ8yN0efJyf3YAgSCkBsnYQC/VOTIY0vXCZxdtrs=;
 b=XsLk8cD2CRsIwmQcjRhMH/AZa+E71j2TNuIsI3GMpTVaDUrbTo7euMW5oNhxeQw4cFe26DNpu14eIQcTXBqu18OgfU7Bin4vBf5q77rCB/M1lbDwgDQhhTk9Y7XnIQgW2TKNQ2ye6cIBzcihfF5A4406wKoL4TuHcrcB2Nk6tI4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5696.eurprd04.prod.outlook.com (2603:10a6:803:e7::13)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Thu, 1 Oct
 2020 13:20:38 +0000
Received: from VI1PR04MB5696.eurprd04.prod.outlook.com
 ([fe80::983b:73a7:cc93:e63d]) by VI1PR04MB5696.eurprd04.prod.outlook.com
 ([fe80::983b:73a7:cc93:e63d%3]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 13:20:38 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: robh+dt@kernel.org, shawnguo@kernel.org, mpe@ellerman.id.au,
 devicetree@vger.kernel.org
Subject: [PATCH v3 devicetree 0/2] Add Seville Ethernet switch to T1040RDB
Date: Thu,  1 Oct 2020 16:20:11 +0300
Message-Id: <20201001132013.1866299-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [188.26.229.171]
X-ClientProxiedBy: VI1PR09CA0064.eurprd09.prod.outlook.com
 (2603:10a6:802:28::32) To VI1PR04MB5696.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (188.26.229.171) by
 VI1PR09CA0064.eurprd09.prod.outlook.com (2603:10a6:802:28::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Thu, 1 Oct 2020 13:20:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53545e9f-f524-41ac-c965-08d8660cc968
X-MS-TrafficTypeDiagnostic: VE1PR04MB7374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7374C10582F47A768CC8F67DE0300@VE1PR04MB7374.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6N734wekpPNIZv8zE90xwiESte7eY7trZ56jVJjsm2QaD79sN7sdYXO3W5vVUJWDJrf1u33JiIme7ENl6/fbJ+f548wkcAgYsdKGyw9vRHE23mQJFT5Qc0xWIREXhmfefCzeFteisYQQ9dH7cCcsz2igD0z3AhOnfxlcy8mNGzcAjd3Ns4p7XP/grKf1YE7JHAPvKcTQGbzne5b3Sdjbl4X6o4X5k7RMqMbZYau3+UHNPBINCDkTO/YBbfCaIHR1xrS8Cj4XjYQ8H9VOhEa2QSh2k4fkrxGFQbUpVeJpgzv/p6HyJ6AK3ja1pSNbFLrjZFMPM5nEUkHHmICro/Y+GzH6etqITyrj54LbULbDChmgyvuIsRAaMp8k5yWxCeHBJ/rOaLAxJbpk1WQmDmuGg+tJ2wNgukkJxyoZtN6e5kWSfx5HjjFMlsTPSCymCp5z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5696.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(5660300002)(8936002)(316002)(6512007)(26005)(6666004)(6486002)(2906002)(66946007)(66556008)(86362001)(66476007)(8676002)(4744005)(1076003)(7416002)(6506007)(52116002)(69590400008)(956004)(186003)(44832011)(478600001)(2616005)(4326008)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zw+gfYCJwiiZxbIu9Rg9XooebHHmcF46B2TJyNiW7tAdpvw/ARTXWGKK5hMjGnv5MEZG+ccVVgbEmfPcvEXtWdo7TgUEo5cdEexNefxwUt9xt6kSCNVKukZ7iXPWrkhcxC0StwnHtbGz8BqUQ1X9v+TGlzirb9Z70hYEtn6xiWlqyoweK5Uo5sqHHJZ3SQHzERR0AGD1Efuavy19zqrew7DN1TcF1nCj6etRpX4wxcKKmFh+uZ4RVLBH7Lj3ePnXcya+MDtIjRXrY3tkVH0RgZbmz7XqZgpr3JwndOjDvAshz1vEoeGabrucAoUm6cK/yVhdpRivvsFILNZDID8lTTuF4h3m5Hf5PtxTKOyiAhBDWfoASNRhN/z404nExailIlfYBSAjKJifCk64RprS56GaHXyfqRuHb5pBFMAl7J5tR1fG7GX61CQHQQkuKV57FPz3gsGcPgbYe8V8a8aZq1+WA9l4C75qrMoArgfaQUx6ZoqAZ8vnsuC+vi2ArhmAXl/yDlFMaN4LAtMuV2wkXoxxhA8Sm4G3jJFXesFSsIfQ2HyEyzwn7+kt4GkaZOzicF1FmpQzNfixyWHEeuioFu+U54VNJTOsJgQWZOR/P/gUz9wATpQZkekaqwW9lZ6ENqJlUh0YWib9T9HDdJfWaw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53545e9f-f524-41ac-c965-08d8660cc968
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5696.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 13:20:38.0062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwjZB6Ow6WrzQ+bUpFFb9/IgW1USyE+n6aQgRhJ5sHKb1htOv2q1uL22ras6IAIOMG3A5Mx4moWWW5gqvF8syQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
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
Cc: andrew@lunn.ch, madalin.bucur@oss.nxp.com, linux-kernel@vger.kernel.org,
 radu-andrei.bulie@nxp.com, fido_max@inbox.ru, paulus@samba.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Seville is a DSA switch that is embedded inside the T1040 SoC, and
supported by the mscc_seville DSA driver inside drivers/net/dsa/ocelot.

This series adds this switch to the SoC's dtsi files and to the T1040RDB
board file.

Vladimir Oltean (2):
  powerpc: dts: t1040: add bindings for Seville Ethernet switch
  powerpc: dts: t1040rdb: add ports for Seville Ethernet switch

 arch/powerpc/boot/dts/fsl/t1040rdb.dts      | 107 ++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  78 ++++++++++++++
 2 files changed, 185 insertions(+)

-- 
2.25.1

