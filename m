Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CB7CAECC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:19:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ojGMWOuy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8MkF4zR1z2yVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ojGMWOuy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::623; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MjN5tCXz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:18:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO3ZMD9wR/uu4B7xUFq/JnY46Wd8FSqSX6IuxdQOLUqGvfKIlHNJYa1wEepWpyYy1iYjmTmF/eoxIHQK1z//F08uoy8NQFfwHGbUF7nwq5mURl0+pK/ika5bvYDnbIhQClOsVRLtHMI5jHhdMq8I9H0QfAUyG/+K06LIEf0uWM4rfhpLkQIqvhuucPI8XCsSXoyWydQtW10zht2RLcvw6E/9j09Fo74uUiZlLZbHJ5AxcCS2lDqTv4pWvhYy1gBCnzZ4QIV9Gis+gWYhJEsCbr4TcnvVrJiyq1JecNI6JCAT3aUEwDibCTYH5vZfqFcRdLNuDQopj3i98nRVmHa9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFYR+dkGDlgL5yaHVizzXLM62tWzlBzhipd8dcmVGJk=;
 b=IYjIjipDUn3QxtdQB9tE8mV0wFjpJy00Y6rmtcU8oXNFikJNLWVQAuWJ1uKeeIruxJZLi/iE3Yl8i9dOJPlusmXN6AsIYKZiAB2jiJaZt6kKx/hJ7SuilfwJm5np+iqIVTTGOTRYTK1pmZsj1bA4y52QPySdu1ZLmuNMG+DsZuddDhw8qNtbv3aOe2uRT/RmCQqsG0O15ghNh/9KFEjSH3ABjpyolP/5429fzt5S6L9Hqn9/bYdBZaZCFeI5V3bSk6/zShHvcgSpi7bPTKfu4r/XWqzwL1zAsM7W+W83heA+y5JVsBoRYL6bKWxgB0eevT2aNg26evDnzUbMITd4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFYR+dkGDlgL5yaHVizzXLM62tWzlBzhipd8dcmVGJk=;
 b=ojGMWOuybwzq3ITD2ACBXsau3KQ64J7F1hvWNSMHBJwSMyLm3AHntUO9fAmtQgIAV5+lwUrej3k3bPSH3LzrlTV/C30rWBi1gsNJg4lRPObUyHzgTqAohaRDvJBszlYbUa0Ek9X9F1B8VKipm1f5nDfkSqI6H0gYXK41g4iMEZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7489.eurprd04.prod.outlook.com (2603:10a6:20b:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 16:17:57 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:17:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: lpieralisi@kernel.org
Subject: [PATCH v2 1/3] PCI: layerscape: Add function pointer for exit_from_l2()
Date: Mon, 16 Oct 2023 12:17:36 -0400
Message-Id: <20231016161738.2854352-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: fe367f43-d6a4-4929-a475-08dbce637522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Di7xGs++ICMPpBovJfRL8Tf7auA1CEPOY9D1oXyJfVdvZXOnPXlSBBBNiQOXm24xtBuxvLGLG5AythzxurknFMn600eBLY4b+9aJ7w2pqaj2Yi81sj6O5W0ujz+gWupMt6GjnA6WfBTf0QqFerkVzVsM5NuqWHqc9HfcsnTu9c/FytLZt9jEUgccEGQxN08qSwB4E13rFzXBSdCoZT3Vm8Ww7nmYuON2niC2Ntjh1Dx0shk9kzr8Vcy8cCJSG0K054wlZ04bMmhajibPWhLdCZGh/TYOBPp9Wim3vc8MBtXAr3IKsAgDExeP+5rYgcqdvfgBQ+3lNMRlPQIXe8zN3yaWhbT+eZQkpTCWoYpF0k9XHh+p33ShnlOSteoUq/XSfEZKxW41NAxfRcCCbj+biJUsameGjKvaIN4qeP0TnJv5WG0lMrLcIlNQySi+DThjdh8mA4S9bJKQrwfa9SbqziTFsV9dKOrd2Mmm0sJGqIEMB4p1WipSQ+blfJKIBzRoEE/X6uJbxvYX1iBXrMdA1PztqXnPp6dfFXQWxBUI7pjRnhTZH5NjwhtslWWnSrt2By5xBR/aZxUGxZoHBwJ/mFTik0Vr0cJnOLdU5F0sSXSTX/25/zY8BFQ0cCz3TGms
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(38350700005)(36756003)(478600001)(6486002)(41300700001)(52116002)(5660300002)(2906002)(6666004)(6506007)(38100700002)(2616005)(1076003)(26005)(66476007)(66946007)(8936002)(6916009)(316002)(66556008)(8676002)(4326008)(83380400001)(6512007)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rSCJkDwpHnlMxPzR9m3KCZoKjCwKyjq4neGw9NwwikRoLsKLVblB/dZ7gAYp?=
 =?us-ascii?Q?ny7//a6LHt15eHvw8CTrMr05tY9f2idQLeQopwME7iBjrPNtz+87FXTFUCaJ?=
 =?us-ascii?Q?dlq7ZEw+Zn5MRxyBKP7J31MXrtuECDJmKkaP9EG4tn+Q03Diya2gVbHntsbT?=
 =?us-ascii?Q?1o7T3Ua7HNdOT0A+oxPkQ4OtYloaxjYF19Py17PoILf68hWoTFAtyN4oH8L0?=
 =?us-ascii?Q?qnNJmXbxpMqY8kb0Qnm/ndnagf6bBvED2Tw0C31oaAcxOFr3HdXPvUVcQUyE?=
 =?us-ascii?Q?CaETEfPWdGIFPasmowGWXJ3EneM5kXqCwt/tbxHUlkaN/t9Yj9nwd7nAiftY?=
 =?us-ascii?Q?YKmblhXeaVRvyXnJ+JLLaXISF+WJ/k0tFpYOabsH217lIXUaWTDpskdjk/yd?=
 =?us-ascii?Q?CybN9cgkvbUEoa223cMdXivkJ2lCMH6yji3Qglzssadn870Vv2Swui9Hn1pe?=
 =?us-ascii?Q?pkGClKV0MjMiRqL/tcHrA4kHrAz2ZYivVe96KwBvt3HSCdNSxhopaxux3q+K?=
 =?us-ascii?Q?0PBL1mPiCekcQ/EFf8QqjrO8NJFfShB5C1HNVC72uXJN6mPe9Pqd9Lcg5hGr?=
 =?us-ascii?Q?VhaOslWYXzZ3rMxKB9W5cMybAzeIVDz7S1u5EsbDrSnGRPCEaeZhZCgYGQMF?=
 =?us-ascii?Q?90tuDtJmxRsTArgNEc7fphc0rWB+DfdPvtxE0LdCkTVe8bneGCz31+VIz0Hr?=
 =?us-ascii?Q?vlwriUIJ5c5MZFgKTWLSTNLQoONn7XJoTTS2ZB7JOfoJ/7R+IjnV9D/FCrw1?=
 =?us-ascii?Q?mz+VizBy7P+KhZEsuvlXk32L3dFR4MC87vNvOAXFmjwgrmAUAxt/hMvOTl44?=
 =?us-ascii?Q?JL37CseRbtNXC9kY9jf0gKuwiI68bq/NVdSM6W82sgZ9YyUW/YFdq4BRo0AQ?=
 =?us-ascii?Q?sKWcr9PunsPKSbKE88mW/DMxx53DQ2jrV2i1NiviePOEhm3VYbZ7w2/aqf6U?=
 =?us-ascii?Q?tSU5x4c7lLKcVUHLa645y0HuW+/b1DXf+s0l5SWPdmFC24Bt3RvVuBDm87TZ?=
 =?us-ascii?Q?BpZ/VpDS7dXNgs0GYwUs8DWSTCBg2wn3A5HBjvutvzd5wlfv914Z08c9AbIX?=
 =?us-ascii?Q?yiQVf8E0FboI7agi4VVI/MKytOD7gRsS3XdUwq88JMk2c8YLXSd7jBLLLM/B?=
 =?us-ascii?Q?41A5rLxmVZNhDTYOGsHriN/wvx/iz1o86shYupQn2KfJMzsoVGvmuLV+7Cfh?=
 =?us-ascii?Q?8yFsYKBkImm2Fbav7YxM/KL7be09Uh3ghl1zE8Q4GI0WO1OwLL2CcsINNIUQ?=
 =?us-ascii?Q?HkQjvOE/bjd69040HozibUnRJY5CYjmuq3bmPkzD2AsfStyozfGc2TD/gU2l?=
 =?us-ascii?Q?/pvH7Jct4qgoacBybtpIvFoRTV65JD1y4LEztBxYufNmXPcT69UWMvuXqwZK?=
 =?us-ascii?Q?TyewrVKmwSdGZqQrz5WHohJyzTxGnHElglZES+axNqAnOKItpQHDMZ4iz4Y6?=
 =?us-ascii?Q?rsE2ZzQm1vHDzh9mmm1cYF/fEV5SfsFYeACi/9GpiDSCFfTyRp7J0L/fxJ1S?=
 =?us-ascii?Q?KI5hUVU/tj5ufAUC38GLU/TRWMNaG/Usl+kYVcGrT8JXAiyCSjltjftpIbdc?=
 =?us-ascii?Q?wauamnCFNeKk+yfxGRp99vTMg29AcZ71Q6lPUaw1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe367f43-d6a4-4929-a475-08dbce637522
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:17:56.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 383srz7A+or7VhCV9lFVD12TobzlqVB1U2PO7jqhCP9TJWxDvWOt3UcuCHZBkBHHiCztgTDkSxFcrfe4fb6cZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, Frank.li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, helgaas@kernel.org, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Difference layerscape chip have not difference exit_from_l2() method.
Using function pointer for ls1028. It prepare for other layerscape
suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index b931d597656f..20c48c06e224 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -39,6 +39,8 @@
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	const struct dw_pcie_host_ops *ops;
+	void (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
 };
 
@@ -180,6 +182,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
+	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
 static const struct of_device_id ls_pcie_of_match[] = {
@@ -213,7 +216,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->drvdata = of_device_get_match_data(dev);
 
 	pci->dev = dev;
-	pci->pp.ops = &ls_pcie_host_ops;
+	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
 
 	pcie->pci = pci;
 
@@ -251,7 +254,7 @@ static int ls_pcie_resume_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	ls_pcie_exit_from_l2(&pcie->pci->pp);
+	pcie->drvdata->exit_from_l2(&pcie->pci->pp);
 
 	return dw_pcie_resume_noirq(pcie->pci);
 }
-- 
2.34.1

