Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45464F5C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 01:12:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYmd46nkKz2xl5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 11:12:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HGv9BvTT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.249.47; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HGv9BvTT;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2047.outbound.protection.outlook.com [40.107.249.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYZ3b1M6Hz2ymk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 03:16:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezOLJUpCUDAYfC0rVHC8a3PGHxXHQiPRqXvXPWcbCj++h4dR2rf/AJfMRz1OtmJYDljhO8fg3tCoL3wN6F6oPuVUAYQu/XzN7UpAVycaywUYF36U9+aoX4sBIJhh6CjUZ9gOswfNkc98QEmXj574H+dfZ86LkOKO88PtxIZU+I4L3EdU4byzt7FJvYsd6Phoy6Ya9E6PmYHKRc1l1t+ZduP32dFoTGZaavAYhImrOcVGKpzSGolu5bBNBNz1jvp4bIARzl9zdFY0ZT2FKrrrs/zYOJ1Ha7QkIjUJvgJ0dK1q/5RSVgvlD5I2wUjCRDKs5rA3bML2dw9F8zIWNsTZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV8Y9LpoZSRyz9y5n6d9BA2TkhUJlHTWofDb93EDr64=;
 b=FFHmfuXdDtqb3ie3GeQYZo4sL3rlIdDPnGZXOswFWWUOCY6l/0N9nZWbWH4cuWhbwoCs/EQmzz/7aiB1IePAhytGpinWRCrDkAGT0CUAg0EZ0BX5hiSciFCwDQYeJCwizOvun4SwO6liRKaJ1DoSKoW1gCJk+27sfum7LxZOTCh+XG0YtaFHHZEtgALoXqyP5lwuTNKTGA2FaL4LkR9Dx9MJWx/bpH3vxPB2RcVJ45hSHFfa5wf1CXUYdGztshO3chhXb+SKX5WxVA0FRWydr1Fnd3GysJBlqgamQOyUAYfk17Q4WFuS/5j2U10Ylco+MGJQVlDQIuZ0yKgt33tAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV8Y9LpoZSRyz9y5n6d9BA2TkhUJlHTWofDb93EDr64=;
 b=HGv9BvTTW8slwMRdfaW7Qepb8Y5+LuVqUxhJkPxRi8ON05D452u+HesxrknHrin9+Zr6OisFHeiYlVL1mg4ex/vMnU74BwyuMwhi5QX9EfbDDyGgVCik7w153t1SiWjj5s3XfAVf/qEYXLSBl+D3/8nmncvfml8HX9fhheRF7iA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM8PR04MB7220.eurprd04.prod.outlook.com (2603:10a6:20b:1d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 16:16:05 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663%12]) with mapi id 15.20.5924.012; Fri, 16 Dec 2022
 16:16:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Date: Fri, 16 Dec 2022 11:15:37 -0500
Message-Id: <20221216161537.1003595-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To HE1PR0401MB2331.eurprd04.prod.outlook.com
 (2603:10a6:3:24::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2331:EE_|AM8PR04MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 409fd006-78b1-441c-8cfa-08dadf80d4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2mVyjx5dkU9ZqNMp3k4hq/vKrvVbdN7jK8RKDl8iO80lYjdIP8s7rDIv1sb4vSuQs7pSOYUDLfmbb6MdwbwMHKxi/cWBMYGjLKN1ky3ofy38yjWjamKpp6y+rnMMaoxD8i97SiW4I7dXBrsv1qKRg3UzG8TOdOpTvGFVXnczHwxYUHkwEWXYwdDRMbacWASJPMmHhpEwl3S+rpbwxDp6TNlV7djEAuGDRsFeQqmIruLg5+tgTruZfOwRCkFg336YRFg9kFqbm6Jt0nel60+ZX0YGT22OaB2KCD44V3Q1WyUKXELlewMtEpm1dDICwjKh31oI1RhFPrde3jBaEpH1FSLQ4KdE3S+2cuczP1k5QQXfNzp+0hytcWokWyaSx/A8KQdSuqgwDf4I8qDg6eYQR5YXkBoBr2rWrMzd2FIJkfuJvyFso8HAMG9m9I7+FKhv2OBm3zHqVnBWOHHCdfg0X4blqf8XfG/qV2xl/KJikxG4V9UHo1gAxQTilMS5L/n+eEN1rxSzpVOW7dq4lEhJPARIana0TvAYKT/61UuufViO274W6babfQUzwk2LsOSOpUUYrDWAT/QaWWL4SyG5ql+ud69Whfcq5u3J0u0ELL58atYjBUfr4CBhVZ1QQmrpY6poOqRqMO+tzKf6HGXE1i1iUvyAcTvt7FsISTL69w6qoPAHY5HakBbjxonPaitrKoqSse5q/s5ynMZnFDMPvXke1VlJWvJGGyudiB8vpFckFqtHFJYMObUO/4OiAB0x
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(8936002)(38350700002)(921005)(38100700002)(5660300002)(52116002)(6506007)(8676002)(41300700001)(6666004)(478600001)(66476007)(186003)(26005)(66556008)(66946007)(4326008)(2616005)(1076003)(110136005)(2906002)(316002)(6512007)(6486002)(966005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8Y9sb/PqE3gWnAXmC6Sq0dvT5i+eyK5NUQsAlgQp22Nb/YiQYFTB5RvKFhAP?=
 =?us-ascii?Q?q60yd9fFu71XrnMhdWW9BfyqwYcinR0SN9qtDW/ehp8qSHQGhEZDJBSgidRm?=
 =?us-ascii?Q?6k4v7v+HPlQwhS4cl1Ys8TMx/aSpmlw7/DOiPej7jEi42Az5u6pPzW9yNfEe?=
 =?us-ascii?Q?eyC1GS7IQh7IgAXiWZ/B7ERJ64KhzYvih2yk9BoD7YfjOSlatW/+FbN7iv1r?=
 =?us-ascii?Q?gVvry9Ke2UrlzMP8hJsNzvsD1Q2cJVIS5KifN9oJxCW/nLI17h1C6aI2/8AW?=
 =?us-ascii?Q?WljIqO6kP2qDdwUfTJLgSKPVNX09uLsLZi79ZRf5Z1ytExj96HMWNZgBAhg0?=
 =?us-ascii?Q?fKd+KOGLCN/rgJeUnCTmJcYwLac4AwKxxIYboHz3/uFQR/4idAChwWP9+a2A?=
 =?us-ascii?Q?tjzyQDNTHr0P1z6e7D66vdFDyCdrGkWsve5PW0wWdUO5JTalRGpVPfgU0rXB?=
 =?us-ascii?Q?l0KTqcJp1M7fuXTGJ+Vgzkg9i/rC4S2yO/uiQvSdSPTe/QMTkUTACtehBU/a?=
 =?us-ascii?Q?kvdrhcATvADb4Ow5opfuI8GbDkOx5JKrtxmyFLSYGUi71m/yxT4lKhU5gKWT?=
 =?us-ascii?Q?h15bQeqgSkNMWYElZjwpLMdBl2m+kBYyQIFGfXMVP4AF0mgwKEQIhMCy8U+v?=
 =?us-ascii?Q?5dZekwG5JgAejBzNOpLBVAa2wFKzdqMXBx2bdWgTCKOHrT8hBZ808m4JCUCr?=
 =?us-ascii?Q?8O0voD8YVuyCPxTxHosfcbAbf6BKikL95Ax6N+zymx6y5erHD33QQi26VgB3?=
 =?us-ascii?Q?e7HzbpGjwuQUoXRrK2Kxo0SF/yiyqmyVBNOoc+wSwDMRq7CFtRguBXEDOAbR?=
 =?us-ascii?Q?AG4SWa2h5aTACYMGzflvKc9ZM2riztI+KrzIGsm4QnNVW9N6EUkFJ53tJMBQ?=
 =?us-ascii?Q?/Gflz9gjecsHrj/S1xYV4Tjv104YKZRjcJ6gVnqwDPAWS1lX2221kFycVKNl?=
 =?us-ascii?Q?6XJmde7zRtxXLVofLrDQFg8Ce9jzYM28Z3sSy3N2KNnvZDYs9TbFMM7VLOBd?=
 =?us-ascii?Q?KBgi01+yZ/qa5fQlEDhbWETVSpACzOnQkBlZpAr2hth/ulXau9q8IIsQSdp9?=
 =?us-ascii?Q?LPzCiN0SOlRttg0sjBYa0OmykTkPOZopWStfhrTXk3Yuo1hs/veWrM5eo+4k?=
 =?us-ascii?Q?fVazPkYmnK4h0hQjtWIi69CVsnNtPmzucyMi8eK0pR34Og4fCYP5rD/pvC2I?=
 =?us-ascii?Q?5SNZV2OP0ZW0ge92I8bJ+LIonHg4mtFLQSw/x4uUPq7l5PeU1s77UN7Pd57D?=
 =?us-ascii?Q?WPNo6nQu3Tx32xiFoeSnxhrV4EdBcKEegQqUdhkNgb7zfyvPi1OBe0r/bc4q?=
 =?us-ascii?Q?5BaeMRvWNiN/3EyUyJapuPcc7fUJg6xTtY/o0wLJX4Cr7b/DezL5uTEVNM8L?=
 =?us-ascii?Q?uBMK7Z+w7xXv/GO3jFEuTuZlUg7txDolWV3Y/GlgfTX7U+LXOrTVYktp0alZ?=
 =?us-ascii?Q?Qn3uSmmwleSpQByK5xXJ7mLcMP1AxQXA2Y9/7/zt0HnUI7OJAgV4VHFRVqG1?=
 =?us-ascii?Q?jK9o9CwU9qBUyhx4s/oHWQgyQGEu+dMyug0yTD23xgT33AyKbadi3RXuIUQ9?=
 =?us-ascii?Q?RtwfQgc5RRAcatYf2ikCB43bIZ15YvVdaVCBQRg+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409fd006-78b1-441c-8cfa-08dadf80d4f3
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 16:16:05.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIdN9WTgrabCx2CnjjM95RUIq3uz7dPDgMwVPeZ34/cx99Kk/dta5PR0GBk1saPLL1WMFcQ7vJNWVFpMO+fprQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7220
X-Mailman-Approved-At: Sat, 17 Dec 2022 11:11:00 +1100
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaowei Bao <xiaowei.bao@nxp.com>

Add PCIe EP mode support for ls1028a.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---

All other patches were already accepte by maintainer in 
https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/

But missed this one.

Re-post.

 drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index ad99707b3b99..ed5cfc9408d9 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -112,6 +112,7 @@ static const struct ls_pcie_ep_drvdata lx2_ep_drvdata = {
 static const struct of_device_id ls_pcie_ep_of_match[] = {
 	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
 	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
+	{ .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
 	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
 	{ .compatible = "fsl,lx2160ar2-pcie-ep", .data = &lx2_ep_drvdata },
 	{ },
-- 
2.34.1

