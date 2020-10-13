Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB428CE3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 14:21:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9ZRG0ckRzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 23:21:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.20.87;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=OIewM+3y;
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9ZLm1FkxzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 23:17:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5l9y21XhSilciOnVt//Duc0kGclmJfXVhy35IcpDgUXdBcHVKfJrzA6T9BA8NcTQavC61h02UnaFgiWIp+QHveP75MmX6f31G12F177BI+T5Zh1bPmOetLg76H9vNWSS6rMA5/745+ckmugFJ40mrThfjziqEmY6PEAm3V6W9yKaASJtxCVVEQElD0+E9NezP4uRVOnjatAXVHFuUdCWolTYjUTEESoEauo4KnUBOhqyPHTeS/U1GSuRQxuSqAbn14G5DEKQn9grzfGvaLmh+exQeWwkj1Ro2ITW2jjwtqCgia44idT/QiTiqO3aMyErsiqMHwsTsZeXT10yf9b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JaE7/bqemLdRxXcnYJy1Z/duOlfz84lZtnvipj0N2E=;
 b=UB/2Um3xAZaVlloMqLtwGS/2LmrvBwSOCip8+0VOqOOOXiF9NnxZLfqQtoycc7wa5+UtK7pSm+8oJztC7Xv78tNIMO6q3XAl7sKune7Fykr8bp3J+hBIq/MFWBu0OCat7PVR+AtyKEfPzUMN4BfF5PjLfqRt+CIG4kLXnBcpT2sBusFUJxt5UrN/VeyJudVz9r9ZX1DYGjMySyTHCMq4dVQBI+bNpIJ9VkfattxcujyRVQubfMXB+2lBQERSckRd+W7QIU5f1yVRnWXN0n8vZEVIsCS9tSRa7KhrsQshIZTRCuVksdWUmOMf+5g1A8qRa/fBNxLottY8KyzWt7kTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JaE7/bqemLdRxXcnYJy1Z/duOlfz84lZtnvipj0N2E=;
 b=OIewM+3yzD/NjNFaQh/VCreBBFZegOwRWO++9jH55lyqKeYPVvbW++NtSr/HWPCMNS3MtBxhy3aWupqkGfseP1CVSJZQNdrMhEZxn3u2DKe3Mu73spjN4EcKStBHUECg+Quhpg3NjR2jtTX2KEegQPJbIfP81CZPfaZD04pYmHk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5198.eurprd04.prod.outlook.com
 (2603:10a6:803:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 12:17:43 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:17:43 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/2] DAI driver for new XCVR IP
Date: Tue, 13 Oct 2020 15:17:31 +0300
Message-Id: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.127.156.60]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::17) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.127.156.60) by
 VI1PR0602CA0007.eurprd06.prod.outlook.com (2603:10a6:800:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 12:17:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a737392-c1ff-4a87-67bc-08d86f71fc7a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5198:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5198E8C7D1586FEF515C48ADD3040@VI1PR04MB5198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlyDB+Bqly34esfairBbcCvYfjWZJuPrxhFiB4uLsbfmgADlnoTHd5iphX6ytHL4hQNpfBtkQ92eCPRFzuRntkLCbarpoR5PKtB8s1MSK+TxAJVunIWqj4AYw6ffguDBj2Io0aNe70D6a4VNNnZSDHf6/vqr+M9ptVDqRzdawGADeu5q/ifM/39BaVfvZv0X3vs/P3zgF2PpAtFefMeBN7Pcxhh82eD6i+Pat9145kWFts/HnJXgHia+RNvJUeBGPCQ2Xt9VbU4MVdTXHqdFJFEQPM6+aNFP2EhdxFhYo5YpEmTywlbMWbbGDWN1v2Ubjc95gHPqUwKL/BLL8Z33JJlyQBmMxEATbVFTqZppu+9Vc+wa3OFDZrmb/hIdNhdLUop30ZDve0qbgeKQ2wWjHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(8676002)(8936002)(5660300002)(66476007)(6506007)(7416002)(498600001)(66556008)(16526019)(66946007)(1076003)(69590400008)(956004)(2616005)(6512007)(6486002)(26005)(6666004)(52116002)(110136005)(2906002)(83380400001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gwt5oawwT9FgdIraAybNjl0HGbGJGngkX5KO8e10EbYlLFB/i6U20o3VjQ+B2dHEBznX6YzS5985eneoNtsQMl5iHG+1p/cWm9nffRMtafimpAhT9iSshobmr7GYlw4R9g0ou8cD07HD0VAHb3maQ/qemgbpKn5S4t2UUXl59LxH8HFg3g7ekeGwhBZ8WbpiH1nm+44MeYLGle5Smyu54tcNuxFyqAkCBR2DRMouTl1YqcZtqyrv1l7DO6Bea0Win/2r8YOAhlynX2LFG0BueKQmCY+4JkD/afluJE+/F6LmarDQrBnytdywk9k8eYFci4jkehA6rWYG7uNxFGJjoQEN8vQtxdrofsCOsxqtSBgeIIwusnDA36+BmXO6xRReIex05e5B0LyQVu0KV6yjFosr68BE+BYDvLahZ5DaFANrkQ+wrpNxPNvBanzpTriekZQD6C8B1qhnVR7L/jDb/GQu5/SXjaXr9PTrG3zEf1weJ4heYFRcI90zhJRK8aC8Hrj4K8QE3LcGfx1WP5IFspu+6oKCVYmErENk2DmtUoESjjysT4dyE5QqnmkjZZhhXlP/HjSl7Vv4bbOXYZRtHULe3ESa71CbRuZvSvo3KUF6rbCc2pxXoDkkBl/6LE6+CGT4b0NK6Tk/UKS1G78qTA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a737392-c1ff-4a87-67bc-08d86f71fc7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:17:43.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Vn3I9D8iCJ0uNTPSBAsY7yG2CZ60f5mek5nEWoBscpA/k2D0vwb9fYrD2oQmFpKkiRJAhzY3gaNSiUJWxJyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5198
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

DAI driver for new XCVR IP found in i.MX8MP.

Viorel Suman (2):
  ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
  ASoC: dt-bindings: fsl_xcvr: Add document for XCVR

Changes since v1:
 - improved 6- and 12-ch layout comment
 - used regmap polling function, improved
   clocks handling in runtime_resume
 - added FW size check in FW load function,
   improved IRQ handler, removed dummy IRQ handlers
 - fixed yaml file

Changes since v2:
 - used devm_reset_control_get_exclusive instead of of_reset_control_get
 - moved reset_control_assert into runtime_suspend

Changes since v3:
 - removed "firmware-name" DTS property from both documentation and
   source code by porting it into SoC specific 'compatible' data structure.

 .../devicetree/bindings/sound/fsl,xcvr.yaml   |  104 ++
 sound/soc/fsl/Kconfig                         |   10 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl_xcvr.c                      | 1359 +++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h                      |  266 ++++
 5 files changed, 1741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

-- 
2.26.2

