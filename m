Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7D75B0A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 16:01:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VyWIFSNU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6Dqb37Vjz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 00:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VyWIFSNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::622; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6Dnh4K6Sz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 23:59:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuOvbtORuQbONwj/CQ5pdmFzwRJXIj/qYOcMuh4hckRGwf/gw9GDMaoydHyYdDN4qOr8ZdfiiAGWn4uAzF/QSpEe+nejPqFxctISStwunaAEa5BHvTouHB3Q+fVgOsAJP8uy8V+uy80DI9voxexeO1boGKaJ2AiN+BdKqFP5BGPXPUoWyA6/MatJOVCrwNFGLEsoSlbUvj1nNMVEmNIckXR99y0C5h8me8whmD62l+DtD6OaG7DY2WeJmUFxq/gApN+dlcefc2R/+Dm5eOyuW/1L72oa2HJOyKXlZ9xVOBsvxJBNfNEMBKjjSHB3IsrKtzj46/fs50vK1gy1IujqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvvbx1BEBpinxsumUX48rt0sTeC+wt2vpJoWkExyF8s=;
 b=FsKIwVXt9R2loVF0ctRx7OeNm7fIsFBQUCVQVwwSTdlg/bTdIEwn7PFg6O/KKgdhyS8juLqx5TiezwFLskZjhGsXTbhUUek2ntTfyAbcMGkOjryM9t/CbBtsVYU8118MOPztH4Ntqf2+2SoGKtL2GW062X7C4OH/mp8YGM6eCQ5NhpKLjib8UsEBORkJrks1KeIXLmM/oygnstRfNIxdtQ/kZEZwhKEagakuLGjSBhtwH2pbcuwFG60Oh5rpiOTYpOrVuKf9IP0VxvkOPgpnOPzjLieKs1zrlOPCytGjGXdAI9RXuCc9j5W2sE5HQrzawxjw432T5vPsW81wtyFhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvvbx1BEBpinxsumUX48rt0sTeC+wt2vpJoWkExyF8s=;
 b=VyWIFSNUchTMXIR6jVBq9j/HPP2hROpEIufTxMzzbuazefrTEMHbmDh23uSoyskqRA9yeJT6IuRnezhgf7uuUVCzad4ZeKlcisjaGWRlvQ5u1PtD7tEKXddS5vCMYwoZXSDENTrd3O1Kp7zQ7BU4cjlGkIuvWGhgf6P/MoKPSlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB9973.eurprd04.prod.outlook.com (2603:10a6:150:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 13:58:58 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 13:58:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com,
	lpieralisi@kernel.org
Subject: [PATCH v4 2/2] PCI: layerscape: Add the workaround for lost link capabilities during reset.
Date: Thu, 20 Jul 2023 09:58:34 -0400
Message-Id: <20230720135834.1977616-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720135834.1977616-1-Frank.Li@nxp.com>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 838d610e-1fd4-4576-74ca-08db89297672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xXA7F94dlh9zBxN5MbPsHXe8419ukd3JNd+YDwFPNxq+N0WnglCC76LefS289LL+ArZoskmoT4LszCRqnM/cVISVIulmYYwhK5DZKK9go/cTN6/0Gicsly6Er8IrPvqeOBqwQtTlFqIwpe0aEMAqSZdIfhIaUveolyv5xWkEsDW0+k3g7Uw0C9ie98XMJOzHGNhMChdEmtoC3LmiEeq9vOWsUA7t1Ze8vcSYgvfpPYlVZn8CeLCSMDGovNJVq/DoTy1TpnZQKGGaYsbGh7hjPNHccSXQT6yOa1cex6WWlX8Khs+MXAueWpDYY1AvfPhF63fVj1uG2nl2NwwVZ3MigKRnB25eaJNo7t4dQqShCh4gQBdOsngTr2vv1uv705cojI8dGuDS1ZD1oDyGHz5A6s+OEC4smgGFDAavG5YvWBV9oDAPRZvx3jxjh1o4HnJ32rHhPNmK+49RUWlYlwi2Mw07WIttQeNh0u7jMX5fudhVDvpNi3Dj2EoW8dQiSKLjwRxh/BiAAAEbtIVwGtedhuDN31okRwp8H/n3ywGoZeuR0fs3QSutO1uE8+Qlsksnu7DhT3KK2CcSHkV/PclWiM4aTlXY20CqeiKWSPQNtk+alb145RRt9CXj2g4UdIgI
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(66556008)(478600001)(6666004)(6486002)(52116002)(186003)(36756003)(316002)(6512007)(2616005)(5660300002)(6506007)(2906002)(1076003)(38100700002)(8936002)(66476007)(66946007)(7416002)(4326008)(8676002)(41300700001)(26005)(38350700002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fHJdL8bMcVOfndCBdGaTAqykQ6csCH9N2TmjCX/ARNUIB+MjdyUFcKY5DsSu?=
 =?us-ascii?Q?WJdgpu7zmo4PLjYjc/S61KwN2+18vk1HPruziDjayKxq0VuqDcyCq9VFeF+9?=
 =?us-ascii?Q?b5gV+KXFUhW7P/iMgsQbKrF/gUuK5YgXEmjKi2AayHhg5bsc901b3a1CQU0v?=
 =?us-ascii?Q?ZF5MUHHw441kjEPu/5eChrRdHZQgtjMfH41wiRpWR49X6g+yqPNdHJc7PLA6?=
 =?us-ascii?Q?R3zctD7EI1//bK9sPdmXRA+WdYArpGJrYJANQ2m8EMEaQnkFfYqA0N3A/mm4?=
 =?us-ascii?Q?4IE7xNH2z3xEJkg6KWcp8uHdAbXpQrq8txW5kiYmcY1M6iHmT+rwqSn0HQVR?=
 =?us-ascii?Q?9+UU+0J3ZKadQhXLWFbcyHgv8EZncgfJ7T2q3KqOqL8S1Udiql+MEvokn8Ev?=
 =?us-ascii?Q?VbD8bYcXrZwPS7VZgVWUopXrG04cZ31d4oeIxvBXxnRAxHECUxqepDO/Tzn8?=
 =?us-ascii?Q?uYoQ1tyj68oqnPD9MR15H508DnF/tnKErhpz4En9RLZ77vWcUKBC3niWYiFD?=
 =?us-ascii?Q?uIsBNmqDq2JMlBfueALhdFepp9rE8/cQBIq6CjGl4YrnlOa8tr+vobW54P7S?=
 =?us-ascii?Q?rktsZDVxTjKcYlcgfptqwjRHmcPiJwjXJnIAxLZvRkUy5GFRzhtcRFSgbcSk?=
 =?us-ascii?Q?jetUTLjXUO2cw5i/Red/nj1XBwbbqaQGdVp6ueIFO/VJxxRvnXyH/dP5diIt?=
 =?us-ascii?Q?RQRMcd/2jZTo/EOjcKnkEsFnUwRjJdyQTn27GfReBj0G/wFuWy3QmAdxLWRA?=
 =?us-ascii?Q?Ut12bj12sHpst3eJDOAwXg8YRWtVz1fCtaKUVXDHMLiS/UtwGYe/3b8UgU1P?=
 =?us-ascii?Q?GRCcL9J5kDkHCgRVUASpi/G531fP250xnEnRK/FITSuTiwOWiX4fWU4dL4OT?=
 =?us-ascii?Q?Z5a4Z/gOBciTjyFPRE9lY9hmAx8n4P6z6Su7hedFcrm1lQNf9/f5vXIvnUYB?=
 =?us-ascii?Q?dfF2V3WPouFWaVJxjv+EsqvpCscj4o7AFLog9hJX3rAGJWEL1EF1eO9V1ePZ?=
 =?us-ascii?Q?dC5dR9pqADOMC9e9eFveteEP1lt/O4rjwCE8ZwV6ymyWqhu80GBCm+oK8c5K?=
 =?us-ascii?Q?j916PHL/AsKatvpxl4y8pJnpHbl22GgnjXdhuWjlKmDwD1hKURjBiO5VP6sO?=
 =?us-ascii?Q?Pa5Kp1MX1V/mkNBJCUzpQzJ6h1btohX8xV9IwTDJiKiKsyJ+n8AMArHxYfan?=
 =?us-ascii?Q?VWGGPR2c0UNZzgxEBPjwaMW3+huRtoLzlCnOdCyMArhpYyXARvZP3/ltXQh+?=
 =?us-ascii?Q?CFLH7lSXm5D+a/8sumqxBV0c9ITtZ3JdG5yUhmhWc2usoxJlhIxBQrgLjgUG?=
 =?us-ascii?Q?iulzjgplCd6sihKArXbGDW4OX+B9q8Y12CzJNHk9i3Vb77150TQkSZSQhHEl?=
 =?us-ascii?Q?cH9zfVFZoypz1u/dA5Z/lGeR3lTvAKLbtzNUMAX5arF9TQhSj6u48osMAZX/?=
 =?us-ascii?Q?KcRG3pc0Yn+flohw6MmwxuwYLZrKetFzr5ZTqwkdh/ReWy/JDR7GS8pjjSbE?=
 =?us-ascii?Q?0IiJk+YEey+6zF4KOOOUCI/BCzQKVoV95am6tBQbPbEpZ6sWQ5pWLirsI33u?=
 =?us-ascii?Q?JlUAUX6TRjmXWiQLt76U4qbeInhVEoQsCkvjG8Fp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838d610e-1fd4-4576-74ca-08db89297672
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:58:57.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTk6OWYVdAhxQv4XFX7CK7fLGb2d8sswtOEKewFDYcSKTc1GfnNhorAhw3Ngant3lcK+FDlMLOkNqqVdYx6fwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9973
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, markus.elfring@web.de, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaowei Bao <xiaowei.bao@nxp.com>

A workaround for the issue where the PCI Express Endpoint (EP) controller
loses the values of the Maximum Link Width and Supported Link Speed from
the Link Capabilities Register, which initially configured by the Reset
Configuration Word (RCW) during a link-down or hot reset event.

Fixes: a805770d8a22 ("PCI: layerscape: Add EP mode support")
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v3 to v4
 - fix wrong commit a debug code, change pr_err to pr_dbg
change from v2 to v3
 - fix subject typo capabilities
change from v1 to v2:
 - add comments at restore register
 - add fixes tag
 - dw_pcie_writew_dbi to dw_pcie_writel_dbi

 .../pci/controller/dwc/pci-layerscape-ep.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index e0969ff2ddf7..b1faf41a2fae 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -45,6 +45,7 @@ struct ls_pcie_ep {
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
 	int				irq;
+	u32				lnkcap;
 	bool				big_endian;
 };
 
@@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 	struct ls_pcie_ep *pcie = dev_id;
 	struct dw_pcie *pci = pcie->pci;
 	u32 val, cfg;
+	u8 offset;
 
 	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
 	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
@@ -81,6 +83,19 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
+
+		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+		/*
+		 * The values of the Maximum Link Width and Supported Link
+		 * Speed from the Link Capabilities Register will be lost
+		 * during link down or hot reset. Restore initial value
+		 * that configured by the Reset Configuration Word (RCW).
+		 */
+		dw_pcie_dbi_ro_wr_en(pci);
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
+		dw_pcie_dbi_ro_wr_dis(pci);
+
 		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
 		cfg |= PEX_PF0_CFG_READY;
 		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
@@ -216,6 +231,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	u8 offset;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -252,6 +268,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+
 	ret = dw_pcie_ep_init(&pci->ep);
 	if (ret)
 		return ret;
-- 
2.34.1

