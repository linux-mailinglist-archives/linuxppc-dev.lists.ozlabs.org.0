Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010D759A50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 17:58:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bWSV0DA9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5gTx0DqDz3bXm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 01:58:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bWSV0DA9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe16::619; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5gT05vwCz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 01:57:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K20IQ9OqILpM+lerGEHXe3LirMemcpnaWZPYcPVmRErItHHTCIUencA1B/K03FX7wfQYPbyJh6GVwyloBDJ7xOSXWj3GM1BP2lcHcfIELkqR98+MEGpsCSS5jpzTYLM43FXb8N6wzmFWKBd8Fq4tXaP753/PVD89V6xsSvLKY8EqmlLEmEOFVw09MNauiG2NWtuV3WUpJaokTjNc9oyDn/nFKc/N8MxfEOxPkUB4fAB6AKmCH7O7nsdYzMRICSNFak2lT1lPf4nH3xA6SAtnf0fsRhNIGKSuVeFtVWM8CG5sGl9WlcaahAuN1aMSDxzm6Dys873vkjjs1jvsM9A7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZycBneTbgXkUljC+nErl4NsfVXu1LOODZM00tD9/H3I=;
 b=DIAEtOwSCvc2VMskPOKMjH3mXco36rsemS9OEmGq36cns5sTK19H2jzFro7tU9/6OFxM0prWVJXmjpVOlPSegRHSJ/S5qe9xJRxpRwg0yiEH5EYaGhTwvT0rLgOmd/8bIsEwyo9I7Hz5REXUGrX9o8ffLGfG4AQwEQA6XjvNwC7L/c2nFIzVxPps/ucYHl0VeBvOWVmzXONgbXJFXF+1/v5sllQLtZzsOGhEEx1Mf2pXNMH4B47Ly9brQV8JxNgdOn5RhunNqqxt9wO0fqHfGZZUqzVllpm4mSMQaTZ8qS1Ar052W0h44O4UKHN+4sWNDShrghx+AeRBu3x1PNdiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZycBneTbgXkUljC+nErl4NsfVXu1LOODZM00tD9/H3I=;
 b=bWSV0DA90r60pHAE2Lxr6aWssvwsEQR/5rDX/1ORupg3oLK6HEVgcqVRcGay/H3vD2eIUJWkqrm1FK1yhXCMPqHNxm8L5rwSNinUG+6c7QEr0Xd3zeO82YIhT+zuKXDsH9/1w0aSRowjWlTbLL5sub9A6fCOsWbDhKvBlZICpm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7399.eurprd04.prod.outlook.com (2603:10a6:10:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 15:57:30 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:57:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: markus.elfring@web.de,
	lpieralisi@kernel.org
Subject: [PATCH v3 1/2] PCI: layerscape: Add support for Link down notification
Date: Wed, 19 Jul 2023 11:57:06 -0400
Message-Id: <20230719155707.1948698-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBAPR04MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: a1732285-a8af-43f1-ed96-08db8870db41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0fndd5lTac0My0bzYhTUuaxRneajdGgO5aAq90P4g/+lzZE/tw1uxeDNNooRBjh1wkRYRBlzUb9xyOp8tT3Zn2rY4xbhPWgXQKZjrpxwh1c0Y0q9/BmV+lLYMhAQv4iMu2dX4c1E90PizOcH3oANKeO/vZffVx48zMAxQ7mHFd48+FfOQf82CIMGS0W5Gzlz3m3pQ13A7N8qgAAUZSi6bqhuZRAl/ViFHO7jRSHAr9IIpGZYtxsoVGqooCMGiOt3QDTWPpfgk98SDd0dTgLsxl2ETi7wAV/yVJtww1udbkcTwyzjXirerSkgb+En1e0YdhceVtPSpAN/RdF1dI3VYuwXy59OdxKHLaKKWtoy9VxXu7niuNYvoI7Ba9Zk6GNBt2i3A4oTJKx0j2KEkGOvGipkKIhP8cfHKmc4FpdMUbCpvyif1vSUh7nr2mrQVGLjoxBTmX4194+mCDK/M/uwy/RLFLNCt7Bn5IfKfod3wi0mCirnd21NHmrFpmWeOOjSqwVHn2863eA4snztRqa6cJjfW8IKYb2Uix6UPST+AYOuksnBcqaaTDdBoW8KU1lnS/xbTnu2rWL/i10lDId428sJ+dsESkgg2ObWYIBveFEC6Tw4J2aS8Cy1AblWmKsk
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199021)(6512007)(6506007)(1076003)(15650500001)(36756003)(38350700002)(8936002)(7416002)(5660300002)(8676002)(86362001)(4326008)(2906002)(4744005)(316002)(66476007)(66556008)(41300700001)(66946007)(6486002)(26005)(38100700002)(6666004)(478600001)(186003)(2616005)(52116002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?K4zVk2G1aWv+l9SAEUXvXaxgAIt1Bfc2tds50A3+FYEcZwww9THMG/sMyQL4?=
 =?us-ascii?Q?2oDFdn38CtjaKXPAhNAcxvB+tyO7VSumSMR9HmkDzBuqYJwWopYMJZfWH239?=
 =?us-ascii?Q?gagQ7Hev+c8PqMz1l9+oP9mrHyrQ9M7cUWpCFKygFJMmQ+60Qr8oHNixN/x2?=
 =?us-ascii?Q?vSqYmG7jDD91cGobhN6IVyhB1oJqFGpeXVpXiLJYhlhiOLCGR9Xyy/At91C5?=
 =?us-ascii?Q?r2T8ASI4hrHkJPAoVZU+6UfYqjCn1dwlDtm5e064FTF8JdGwCeJ04ZrM8aTB?=
 =?us-ascii?Q?TFBnwsVab/qM/NDrrCl6mlZoNStKYx/SFJS81LMel+jTwhLlOk66IqOWauYT?=
 =?us-ascii?Q?9HhB5p6zjxXPqY6PzN+P5myJXO9CQGQGnoaMhq5woRegqCCMu8psrwhxFeyl?=
 =?us-ascii?Q?pxOL/YjEbzGjbSIBuKYeNq2ZD/VksxQ+XBE/uSfxw1duSM4OyYMmrbHWmK9O?=
 =?us-ascii?Q?muq3U5CqTkCYKBW9TlCvNelPuxioxGc3XOudfLWjbnvSOyUitNQNR1pa80Mw?=
 =?us-ascii?Q?OlVhK1qwCBaJjSBTBofzpAm80yWzxzkYkCCCHYbDaLEoKqpAda8fmf2JwTGg?=
 =?us-ascii?Q?BUZf3EE0365WyOlfqAoY2svu4wKuY5Fk6URykZaNGM804We6IQbGBVj8398s?=
 =?us-ascii?Q?2X7PjjYcnu85GTrJ45vxaEnHQlAsqpJjVqA0IJhxAXm0yLYqWlx8j3noKVPY?=
 =?us-ascii?Q?20S8apJFGvS/8Cu7yiglz+hdjVcOpnmBdibTx2cfxnZ+H7H1UEATBxMFaRpi?=
 =?us-ascii?Q?CfvEqCbCZTDtkRuRUZHKocJKYSeLzgmLvhu9sKGt2Xi9D7EMggwNay9huT/m?=
 =?us-ascii?Q?3PIr9ysiOXOD0jxAEfxt+J+aXUbw79Eo9gdzNX3tQ2i8PDlTJ4SRme72Fcxu?=
 =?us-ascii?Q?BNIDeDX/ZQbb1pUWN6B7if0mH5bHiCcu/MYgx8xX7JBLwdWMZMupd44fTR95?=
 =?us-ascii?Q?aTEj/9ApOMkWxeyfTFeetwdANKAcx0MCfpCQMABlb0hsMcyzOby8VL8XPGWV?=
 =?us-ascii?Q?bSrBQ1Jd2IaeDG7xPKCC7rrqJ5RNnlMdqYQsjRkIlcVlEv338EqEuMkWvhHR?=
 =?us-ascii?Q?CKEyYHdyLScNKPHmEqOmZcuoP1BfjwLzQrSUe95dAb14TpSqdydAkmvRaL/2?=
 =?us-ascii?Q?kfBq0oMh9A/bxS6nVLH1T/jDpHC36TmBFuepGkupYxSMVqELgs8Ks8bGEylr?=
 =?us-ascii?Q?Ilf3BF+CtfTSqszbh949T01T1NrvlpBXKuv+6C42ILV3hTaSJXHFQvKhgPxG?=
 =?us-ascii?Q?lYPfk+iv+aH6fdCmvAu1ENBOVVrVNKooA3crHdA9AR7C/Cmy70EREBrX6mrv?=
 =?us-ascii?Q?BKtYK7t/V8HRG9ZlYWne0/wz+VSp34REUE3rDe1SwbewrNpoxolZaOfpXCS1?=
 =?us-ascii?Q?crZx+h7Gx3Yed0RmJ+22tdPjLVvy67aELGt2yKCadGknFnsVGecnTpiGVNkV?=
 =?us-ascii?Q?hVEkm057NTyQ2gdikPmUU/1SgfNUu+heWt0rZ7rDeYcNi4UeD+d2HhjDKdCM?=
 =?us-ascii?Q?VHYgJjLMA1xYOoJLPqrMZFg4jwT/ltw1hpP27tK1RGxLizpsSnVuBtESphze?=
 =?us-ascii?Q?wJmdqLPdvFFGdIuTcOs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1732285-a8af-43f1-ed96-08db8870db41
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:57:30.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6ZNVRKNXJDfG7oPXRy4rOAfNGoqlITx4Vb42vEnmKq29fOF/UMkvMTWrtNbkGNKod74+jfRImUGjRm+pT6bAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7399
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, Frank.Li@nxp.com, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, linux-pci@vger.kernel.org, bhelgaas@google.com, roy.zang@nxp.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to pass Link down notification to Endpoint function driver
so that the LINK_DOWN event can be processed by the function.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
 - none
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

