Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59E7AA7C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 06:30:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VlLuyN0y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsK7L504bz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 14:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VlLuyN0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::623; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsK6T0gdVz3bP4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 14:29:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIrY/v1vmG4R/C8F9oOcpRAMNazU0fJ5C9w4H88SiXDDTPKFLX1hDgsHkggzS1p8SkaRu8KwbpUCezerMouLacRmNbA7MNDZGa4grt5GatLhkbl6StogNbMNio6I0djFghhQBDi4gdGnBf2HdXYkwhXp8QVkMc82EemaF1uJm27zyNupnCjuULfeOD6u+pkXDfjw2kTCflPl6nXzbUKn+aTi9C27XKLsFQbXoHaibppyZy3juNGS9+e0LrQEGK16n91JEE8SD+WSJ/l7SEG6A0d0xZeyKVC78htjwAHMwxl3N8+9LiK1TYAGMV/CXFiCS6eysCsVjgittUY/Ldt73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch0fIy8u8ZzKD9dw6NfdlEgvdYMI3x8irCe6QTsdiEI=;
 b=D7i39q61muuBz4F2TKw8gksm+EHXNncyi/QXqO4ON71mOPQitRNas6Ho7qGS4bQmYpAzitsixwsAfS/Lkvi2awp1QCKhi/B5Yn6NIN8J/nOBJShPGWUD9EP/zbftVAbMjK/5v0jUxDuDUB6B6ATJt/dm9naPIxG7JkmYpYPlyR6af2zOHSrKERwu6/bPssRBZfJJhWNf01nyLlSdmukI3pGEuVbbowFu3KcnL4Fh2fn0RnRjdgAVurC8PrLP0TBWtGh5BjLZDoGe8D4OY/pTm7nY96xFbXGfF/+MlK3fvBfstASixqigiEsIjsUm9bG/c1eeMPespms6DcSyfsdHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch0fIy8u8ZzKD9dw6NfdlEgvdYMI3x8irCe6QTsdiEI=;
 b=VlLuyN0yLobAu9Q6AJhRPjiFactcunRp7s0BIn1W1wDJi4Q3Jl26EAg5+qESkj69ianvnjUXabLI2tugp+xReNxXHxWeLOdZJWLgmsQhfdT0KsSlNenazfOdan4baYYnyDRBbc9q2NaWlbRm1vIEDcIiK2rcPQty06cD+KXaxB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 04:28:57 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 04:28:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: christophe.jaillet@wanadoo.fr
Subject: [PATCH v2 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Date: Fri, 22 Sep 2023 00:28:36 -0400
Message-Id: <20230922042836.3311689-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:510:324::19) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 705c4718-dbc7-470d-0730-08dbbb246f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gEnN5iZ3hfrZVgq0qL+t+CWfkapi/9ziOccaFx6xHJ2TFlbZaM25Y19xOeNyIUbrRrtk+AY9viyVyG/KYbJmHxP9jHPKec0RZIatVcV/C+rlzFb2f0vISbkiMGrbjda8AiwhvZk2Tj9iKRUW5oSUObMDuFxeHgAIz3sOdWXe7LilTUgKskybb8V7OfYIuNK8+m3Gz192DbW2l42ALtPIOrto8qJfsaYHP7D+PaJxh3RKtncdYXxAmZXOMwnrPuiayPl1Uima2SSu3gpe8sBGTGJ1mhzVwJYaAGOhX28H+zxyHoxdBwi8lRKv+NLQHHaKtDkH6ZoOE41n+qoLtzJNUDKsW+LID81DbsSYoQQ0UwXwT+znxZn2xkZ93OQAHpC/ItpRzC5iZepAatt7ssUuMgDvfsM+6DrbFjTH6AcC5qq4npz7XoNmjMIuY6wd5FqUWLuYSx1a00G6zj+y6dX8gd5dB46I54cUMpyVhwqbFpwx6CeYSDDgY5RTzH0LPSJkfwlLfvuwtyVrcKx0ABqARZIZYsDhBy4I5BPUL1sCrWyV7vS4y8ul09CKAOQqF56K04R8VhoxTUqNDAOepuSNc17bHwWVifSnFh/UW85pD8JQrPhctNoLrz1ntZxooSnm3MnjUWDoM+bhW58hLjjmvGOUo38sab1AMSirtURS2BY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(1800799009)(451199024)(186009)(6666004)(38350700002)(38100700002)(1076003)(6512007)(2616005)(86362001)(7416002)(4326008)(36756003)(5660300002)(8936002)(2906002)(6506007)(66476007)(66946007)(66556008)(6486002)(52116002)(6916009)(41300700001)(316002)(26005)(478600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WNcGkH5YfBpfyFMsHSCfaCh/tt0QnQyrp5v7z8+sMU5o17lGJrKjstxf5PWG?=
 =?us-ascii?Q?VcpB/ssdWamagxNdqts83OqZEKL3Ck3SfIo2432ZL7KoQwzLnVKgxnJ8FycE?=
 =?us-ascii?Q?dz/ycGNB5Q3NL0ifR4YAJWUQ5+vwDbY+JG9KGyYpCL+d0wF8VromGHVYac2k?=
 =?us-ascii?Q?hftLwwZBEEX2sLbGcLoRzYEw/c1DygDStnf9nVq+5NpZuD2D/4LiPo8QyKJp?=
 =?us-ascii?Q?OPH7RQeUhXEdakFdc4lpvoSf5+IAZaUSCJcVBw9co1QgRmazvaNcAVLHlug8?=
 =?us-ascii?Q?khcohfX5jm7XQFsAAyULhipVziwCkXqN64unEzyaVPvLwyJm523/2cdx+pOI?=
 =?us-ascii?Q?YfAr2tuPebEpmDu2OTXRKE1TovERZ+gyvLEhrzTwYWO0I19AdQ2emiUwoD0/?=
 =?us-ascii?Q?K87aR2AYe21sX/7lfHBMbPXBBibOikyJQ8umW7rdfB40ldGPFmMkh6TR18PJ?=
 =?us-ascii?Q?s19IPehqNFi7TLJkVZdrhyLj5mQkrBSMz4TPbe47n3TuK5XFGBrpECsnQgxs?=
 =?us-ascii?Q?WqLdhfmHNvBDDunqMh591piBNRQQY7jSmPCOmEOrtdNrFzBdpeukiCK0UbTR?=
 =?us-ascii?Q?BqTKIjdRk4eY2hUebsh1EabWTzOxDVfQCBBa12YrQio4HzuKvlEHUKARtkHg?=
 =?us-ascii?Q?2sUsrNO9TtwDeMh5jSUUKBnzHLg25cjrb6cW5nAcBGSpbu+EhggavQ3raIaY?=
 =?us-ascii?Q?+M6ERn03Hie7rTKiQNwbp1vbeCnOm/2KqooUlEnYj6xQ3e3JH4POFYEWgXZ2?=
 =?us-ascii?Q?1+Ok36MqB24CCynpBaN2QthZRZM8XCeTw4AE7DKSCI3MVwwAERrQGkE2cbYv?=
 =?us-ascii?Q?FVO4IOf9MgOz/CWPWOklDMn0HXz/bUp3PO9cV4c2ZARaU1mr3y40VuWu1f6u?=
 =?us-ascii?Q?+Csgaa5Wbyltr7uIplL2FI7iHKt7v5HmzEA/bSpW3ZUR46+SCHozpdwIOrlk?=
 =?us-ascii?Q?sDw9Nmj/3FD1qeib31dR7X0IXW5xTWnpFbzEoCEJmiW1PONifKP8t1Rt65R3?=
 =?us-ascii?Q?/ggHZEhNX0LnU3gMmvxSteZYt5Yq23djdeaCwLfUZEDnnz0f2SGjy0QCYkAZ?=
 =?us-ascii?Q?HHAWGuG8Yjyn8k0lC7b8Lm2YNFx/rb4av6bRrLP0Q+hP/Fa1bLZOJsq+h/yP?=
 =?us-ascii?Q?dkgzwgT7K0VKOOh+bxB0Nr70AMTO3VQQ4tZoCCDVqAuV2wtmQz1rCO8Vo0fH?=
 =?us-ascii?Q?hsM7CwfmwkdeFAfgwN33V3LE7hQQSmormJIM4hqz1SJz5ayO5RQAK1Zi4ADm?=
 =?us-ascii?Q?yO6mTyZ3k/k/Vtv8aYDdnWrPJhbw0/H4RjGwgbh9gibdVqdSj5+7h1Ocv3QH?=
 =?us-ascii?Q?HNTVJmUrTsNmdt7ZejS4mAux141ffvPihcXWQOhXAnoTbqmgsVHe9RBU/zbr?=
 =?us-ascii?Q?yFj3/OIFVpNiwWskR7cy57+mQqCTiiMuhrEwCJfJ2WhzIQ/xL2jdcerhtJS3?=
 =?us-ascii?Q?gew6kR+hiSNvv4DeuoiyaJZ2TmWqKsIXmM3BeQMiixHpUaCh11JDvya5hiEh?=
 =?us-ascii?Q?9e5aN+Qui/8LamMZO7eBpcM2toSORGFDaNnIH0F3JWe7YO29lAOZ5WYAwGks?=
 =?us-ascii?Q?3ZtBiP+AbhEyw4wIlko=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705c4718-dbc7-470d-0730-08dbbb246f47
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 04:28:56.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hXAINvKAJocNDMqZ+KTdEDkY9Tqr2Qk6orHWU9L/aFISryKpBuviqoBPWRA6QnKNgQ9W5oDIQ/zmzNcJC86Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.li@nxp.com, linux-kernel@vger.kernel.org, hch@infradead.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guanhua Gao <guanhua.gao@nxp.com>

Set DMA mask and coherent DMA mask to enable 64-bit addressing.

Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    change from v1 to v2
    - Remove 32bit DMA mask set.

 drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index de4c1758a6c33..026bf08611e13 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
+	/* set 64-bit DMA mask and coherent DMA mask */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, pcie);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.34.1

