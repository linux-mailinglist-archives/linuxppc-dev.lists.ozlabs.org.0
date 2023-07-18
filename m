Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7E7584AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:23:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=aQRcW/o9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R56l46Ghzz3bqD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 04:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=aQRcW/o9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::61a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R56kB5wHDz2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 04:22:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ28Q6mhZYpYjeN1TW+ufBHWRm8fAE0PCq72U3M20fDLJeo4VG4NQReYR8HO5l/f9A6ncCjniEBMgfuntf6dbgP+3JBFfb62f8Bwc/SZTvkVGItwexNoGCeakEbiDI/SrA/7bNmibhOOuqCidThNkrLchgHTgq919tcjJuygtWMGNdgh4wS4Ff9xjRwfYEM85Ds+klUn6+CdzlYXcicxk4mIpeBbaKG3kfOGxrdsCMXsNLnscWBpZZ6gQab1n287fHh/xei8bVLev4NQnNDWmyz8pBeb+FZsPNl2m+aHzKCGJuydC5YT0gGRMUtTx/Humk1kZrgPffKjqzHAMrUGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOxthBqQqVbNb8u4I3azKid/wHlYPOAu6jllJjdkvPk=;
 b=Xp8L1XjIpMmasb1bLQ8DgDRq3uXjHa7hatRtVCfpJ+Gh3yZt373/qaKe390t0ezlhUJhJlADy//2WNESrVDNTmgQqj4vkH8OunGEuehWeV83w5tZUSBDPcokFdt47GA44fbcT/tbbgyzIm+p2Srhk2ljE6GBvpaBr+Fw643rUGkTNl+KMHMigc9+ENqIemHy4JSptX4XiOIoS60VYAjzsVn2ZMEuIwXDN6NWxGJWPogQ3+gpD0dWXNIrtz+jYyioDk1yo0JqperqqZezvTTIco6PhDjQSs9RLF2TOTsCyZskDNOK7kyE3TRhtWgGk6+Pwl0IFMiwN+AwdhSYQaWTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOxthBqQqVbNb8u4I3azKid/wHlYPOAu6jllJjdkvPk=;
 b=aQRcW/o9ZrRyO7gwSbFKUImF+t3xSmLIuuzkzKNrb+OIGVY93yCgwBiszuTd2/0EA7avB1HrbLdZKnzaie5qVD0FiNIoWgPWZdspMsJSM4rL+BDoA9pxgSEu/AmOZgbi1Ovk1rU1LsllLEvwI6tbb8/wIfvcgUgTk4ptkc2hG2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 18:22:02 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 18:22:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mani@kernel.org
Subject: [PATCH v2 1/2] PCI: layerscape: Add support for Link down notification
Date: Tue, 18 Jul 2023 14:21:41 -0400
Message-Id: <20230718182142.1864070-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 8246d3d0-da16-42c4-b9eb-08db87bbe194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0vKHZqIikRvIiD9iza32eD1me69brccCBUuGbvvYYm7XHkHN/CR0LJJg1AtHy56y5Bv7SBhUOrPT8LejfKlw/oEIK97p6yG4M1aermZXQjp8qorHfwezcxlb5/WCF2fJD9jQvYMEN8+WcTu02nGyw1Y/QsUt/3eOJ0U1xH2X8QCJYYQczWjhWW9kL0+uk7avp6hTSkjIdY/nr2QrDmtVIRUbdyf9PU20TVZb8izBTUswmBTLyxgsnXrd9z4f0l3Sn614+prGG6MtOS/vW1qeAhgxmKPhnzC/7oZR2a6uoxRYC9fKcPZ+wBbEy7Otri84b0gqA43FUX8hECKRb5hVQ5/tgZWwNmvtFCBK2AJo8YWA65wI654wzZ4ewhVVEWHRYyBs8HvHekTNFGdxT24SnOXcF3ZdOv1ljT1HUKkT0/AazEYpdmt/Y+1oG5teCUcDKX3RG89hLXQrYDdeM5B4b/eG6RfdrNwbT8KhkcAKAIF/IZL60UISwqHn0Lp0yj4E2M49U+Qloc+NQdunHBGHmm77PFixy8C4sbLkMNwDzkG5X2wkvESaMNSAAXkxg4RdxUH54lADEWwcAySEsC2RSS8mAi3YofLAzhGkmO9TieXlaydAj7vH5Owga74rxjEqk0IFucxEjdHtzADfYUQ9SZA7XUUzfLCqhH2I0KC/Ax4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(1076003)(478600001)(52116002)(6486002)(6666004)(83380400001)(6506007)(186003)(26005)(6512007)(2906002)(15650500001)(4744005)(66556008)(6916009)(8936002)(7416002)(41300700001)(66946007)(4326008)(316002)(8676002)(5660300002)(38100700002)(38350700002)(66476007)(36756003)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3ApmRD5HZphK/edl7x1Ct7SjVkX553i8kSHwim6m1RBOFq5n/ektB3C3AC9d?=
 =?us-ascii?Q?bbda3iRV6qDgEON3Kru4wzpECmdDvcxduLS0ShfQAsxSHGFsIUUDP1uvADdz?=
 =?us-ascii?Q?tRFXoiV/jFfKk3BD5c4jbOe82xbXBWB1FU69KY3XPQyzp8BLWlJ0Q0pHJcaD?=
 =?us-ascii?Q?ALAeGnATMBgBpVessyWuXk1k2koiIHf62QtZiMRP44Kbc7KPsSWREaJ9Qsu9?=
 =?us-ascii?Q?E1oflOdmIbHkoyonLl7zIIdOXhgM6qUx7SKOMk2tWxpTqxTSeUVA66CEwPEw?=
 =?us-ascii?Q?MxiErgvEw3kYIja9DFMZhjwI5ROT76WYMzwb03hrfmEdD6IL5469FGTUOUdn?=
 =?us-ascii?Q?W93UCjw0SYCLASUAQ3MC1FZ2zJbS00eCDg7+BRrbgnbNTIf6/8tRBzN4SQ7W?=
 =?us-ascii?Q?SN8qKQDcBmq4HCNZ1xH83TWlDbMNOwkHB0KcUs3WC8zjhjQQopeAYRAH3/Po?=
 =?us-ascii?Q?BwzmzHtEM9fxcOR4Elk3G/BBrbx3+NM+Sp2a2k0dy2e5ceUVHX3/H8BYD2fN?=
 =?us-ascii?Q?L3MBzo3TXzr1usotJJUvI/Zt1qyX19SPe+BxvVq6XfLfwz6yJwRP3CKhMOiW?=
 =?us-ascii?Q?elRLnshaCbx/v74iFcxPyhBEqQLTcSViMjJyTYVTFtcCoCh4UiYMg9AKzgVR?=
 =?us-ascii?Q?9ROuhQgzb2aUrhrXvE86DNqB+mWbso+NO408muuv1y0gt4oje6Ntl6r69Joi?=
 =?us-ascii?Q?c9h7NkIzoq+49tfQgFF8KuMYWmtZK2WANVYNCM/A31lrDHi0WbhukB4NPAvz?=
 =?us-ascii?Q?v2b9m4yQO91g/EhrSZF9eEhtxd1SAEgUp5rK6wFRhDZ7fEPv3Ghw9n6k3mty?=
 =?us-ascii?Q?yzNGpcl+oEFLMBven+X7+ly+xb/XlUGzyy1oDoDOQAYCASU+54B2fi8a3HmH?=
 =?us-ascii?Q?sDx2gLHF8KGP2i3g86hHAR7ZzMhMAE8kWsD8sf99jQQqpt1XQzglG822Czx9?=
 =?us-ascii?Q?zt7f0wiKRt+N3oxWw97GFuA9AjbnpK9yHgQVrqlDC4RN9em3ZHNzAfij5V1q?=
 =?us-ascii?Q?1Omn6dkgtJblnZ3Up9d05iUNln5zO+muGiyqPzS6GZT8n/0KQh8GSq8F413C?=
 =?us-ascii?Q?LTl+G3KjCqXN5thBx8dQQx5ri78zcfpKeZy/RMsJ4QoTbAcLUiYQukuafNYc?=
 =?us-ascii?Q?+0+zEHDJS3gsS9sgWhbSRQ8R8yxdgXqUa3fUs6OS5R5PgXq++EKnxgS522Ie?=
 =?us-ascii?Q?JCVAD1+ICxmPmFm1GHL+sa2LdPAbEZWyixUvPhsI3OfLkH1A3JECrmZD0yo6?=
 =?us-ascii?Q?IyON5X06TdkMm+f9C1SOBxqsBQWxP58LJOzBIDVJCTgIVUe2la/7Enxb4GO5?=
 =?us-ascii?Q?VJvzLLFVaROPEf4mEw9Of8AorGQFbHT8zMd1frum6dafr2jDkqOhjh5MiMI6?=
 =?us-ascii?Q?zQTAi6vbRWOr6wKuz5FXYAB1xfUM0uthy6/grawT6jFwgyo7d1oEdH4/joV0?=
 =?us-ascii?Q?A82axOWvc/4k4XKSMw3bw4hxWJoMcRe3qfxqH72qeerRqPTcyG4iISG1wJ2R?=
 =?us-ascii?Q?RB6BFRLGSPo+xDnUApuz9ZPqGjgm3WYEimIfsLdSWeeg8zJJb9+BobW0S5It?=
 =?us-ascii?Q?MquVfri4/mbgsgGNmVLZvWRy5lObzCmg6RcluLAR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246d3d0-da16-42c4-b9eb-08db87bbe194
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 18:22:01.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teRLqMPq3YbCQQniJw8BNoDd9dNPj1uXkflCOd7JW+3RBWULibPQdpfZdGNhoc6d0aAlQv9HOyfSDMqpkqZzZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to pass Link down notification to Endpoint function driver
so that the LINK_DOWN event can be processed by the function.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
 - move pci_epc_linkdown() after dev_dbg()

 drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index de4c1758a6c3..e0969ff2ddf7 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dev_dbg(pci->dev, "Link up\n");
 	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
 		dev_dbg(pci->dev, "Link down\n");
+		pci_epc_linkdown(pci->ep.epc);
 	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
 		dev_dbg(pci->dev, "Hot reset\n");
 	}
-- 
2.34.1

