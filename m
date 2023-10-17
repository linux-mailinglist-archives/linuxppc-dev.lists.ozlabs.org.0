Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6197CCC5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:34:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bRImuUJv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S940y3p17z3cNV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bRImuUJv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::61c; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S93z66bjMz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:32:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCNli6s2zd5Tl9EjbZoR8SVS/OYxm0aAxbrAkB/fk8L8pDN1vKKpcApwGallD6nIJ9u8SHcl2lrdfr3PAHlO34cuLM8ZNHZEZfX7wpupAg4Q7sa5fR40Wes6IkC7Dcf70O7OjwxxJ7bc9AOJHBTd1y97rB6xD9kFs8oy4mbewnv4u5RxHSot3m71AWGfej5ksD5C+/9LzuGShvxdIWomXgAFodWN8/fnL5uyHAXTBaFdS6jplO/t0PbuaVEVHPBt/pqVCIf3uwWm7rssHKnCKC1/9QHqvthCDeikQSY/uqQpIOuAcrLMnBZtu828Q5iFVB60eH7DYXNJ8Jitf9tl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKSv5ns13+Vwh9w5zcidhpwTsxZiZ3E11/VeL77XzYU=;
 b=mzeYhRHOHRAoh+ZUf7NWIVNnvqTb8N08uKzepwCge+6XV8gKLLeuA3tTH8oOUF/cDWuGt+WDYcRSxUsIErSw6W3jdjcBRMSzRc+DQv1hfpsPrLIPw2YYeQOE0dETHC906TPorv/3gmgFEV4O0gLd82EVaTdZGJSgLFIrnredqrqnVqXU/ejFwgs5qBkJw0V2tKET1Ntj1Xh3zPe7aTLpA7QLz1Cxab8858Xy4zMYRDdJTl0oquDhfxLRs0pvRjOXhF1fQf4qG7xt0TnOiBVlqzFL1kHOisgf7nbDudiyy4TsV3wsu0qxbtKiJ0h1FgALM61su9ZwbOjhQ3DdHr7Hag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKSv5ns13+Vwh9w5zcidhpwTsxZiZ3E11/VeL77XzYU=;
 b=bRImuUJvWi1J4wvzFUMJWX3Gksu+xd1A5qYdSzqlsoDP0okl0Oe3vEgFmE2UcEOT7+XA8fP1rPP81FntA4bi6Nz/KuBHH3LsvRZZNiLHb5LkNpjhttIOY/NjJeuvsP33JCk4vrGvGMBCAgpPc1wbZshJYR9EUcN8sZcxiSrZelQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 19:32:11 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:32:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v3 1/4] PCI: layerscape: Add function pointer for exit_from_l2()
Date: Tue, 17 Oct 2023 15:31:42 -0400
Message-Id: <20231017193145.3198380-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017193145.3198380-1-Frank.Li@nxp.com>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d4fd15-2d89-4a5f-27f1-08dbcf47c202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OqegyHv58XLaa4VfAf7HjmBEyjZW1XHjy/PEV+kStMdZODfGHYViiNBdryw+DW9vka5POnquctdWqWJdp/lFNIboNzWQzdWDAirQCIs79unEFi/OMqi3Znvp6FArgr+vElhGpg3krexDXIkk6TVZqATgZu0aDo/0kPHxAYOoGICTri1VilnVL07mp6FyQFCEGrwsDbzAGMrvyb8a1kmFEqPMy8/vDkatd5MJ5vbAM73XShxtNjcVNItzrNgRJK8zaDoItichKo8m0d2TdvUVTh7gYPJ520iTGi21om40Q7mHWcIxJwZeoDGGIwrFSCCecDBjirWDQ4I+nE+mVzodwRZVFfzxODXvh6g/SjEvsiipJWQJdZ+MFSIgMfzeQwlgoEtPXk/8oNWQ2LRYPUN2WtVhDbn+7GptWmIU1bsgWALHOf7vtSSyJcACOTMcJpZtKZ5BG0aQbU7lDsShCuUuU2BBtv+cD9x7IWoKZu8Es3gvPNxg+n9D/9vS1UEKxG6anv2cOwmy55oB9fmw1E7ga0poyXG04BIlfDEifZ7lhvUjDO6/bzaGhps6gmt7fFX7OcnybnFGwb70i6IOhVsTcSQLUAk1ccPEmfWLFKkbvQsfkTj8ZJqSrit9W6sn4cnc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(52116002)(6666004)(83380400001)(38350700005)(26005)(6512007)(2616005)(38100700002)(2906002)(86362001)(4326008)(6486002)(5660300002)(8676002)(36756003)(8936002)(41300700001)(66556008)(66946007)(316002)(66476007)(6916009)(7416002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uU3Xt2/+G5smLPsQp6BDv5SX1fDVsvx2+yF95YPcCy4/oAW6WssedklK1jwD?=
 =?us-ascii?Q?7sCZ2CZfS+TeaXBduc1FXGbGteOEY8IgR7xu9maxOI5z586Cspl8qerAyZWs?=
 =?us-ascii?Q?ePkftz+bUVfuY17C/su2Dxof4giJwso0/qreKIkfWiPtfotC1+xV9arNg89P?=
 =?us-ascii?Q?zQQ037FupTHkipOBw1Zl3PLN7aWOo/1ZhS52Ju7+enmSfUMvi5E0c1tlCh+p?=
 =?us-ascii?Q?J3dH7PJ2ua9tDY6vR/XTYQxR87QIMFmh9i+dWnuw7scKUS6AuVw0kZntQr8h?=
 =?us-ascii?Q?AlCSr+9V0nSU8ybRUWQzMzTNf63xgILmMyPuQmmGoiR9fU1Z07ef6YoPn/w2?=
 =?us-ascii?Q?BpQb1PYbnc2Qt9mK8bDPJd01sMjE4cX87dQ4xIzpzPXPBVoljbui/XVYky4+?=
 =?us-ascii?Q?PSubF2twq5671SEbtNE58vi6Jf5x9ZwJrtpcKZPB93OyKGP/CWQEaD9lAAQu?=
 =?us-ascii?Q?poyIXD4e/EAHlNEUPl3mBjsaDoQ8oAsvuD90kWkj2xoR+7FyW9j4FdvpucKq?=
 =?us-ascii?Q?6Q759aWfIsURGUawNWqnHLX/8KjThunRshiD9QoTJJnM6IipVUJFU84XYeMS?=
 =?us-ascii?Q?USzvD0Evnze5pmLAi18mdO97CPI8YpajJlHRVuNiZOQmQbMIoNCWSlDdwUme?=
 =?us-ascii?Q?qKWSe0daUBj0FEzCXB1Nw09q1Q7zRf++nVNJcbODVFisuvlE/K0lZmUi5JMl?=
 =?us-ascii?Q?5/5j4nv23vc0S0vKzU6IvVF4/fHKSb/JCOc9DmCg9vgKCgunMinv2LZ5exiy?=
 =?us-ascii?Q?PLux2bnmAzLWopErRTbB70UBiflrj4zccy03oSnNsPAHrK/xyENUscHr+S5V?=
 =?us-ascii?Q?iHftXpcvc1t4QVBn77g9FnrnhEFzdydTkQlPjIeWJWdYLeMEgDjut1u789No?=
 =?us-ascii?Q?j2SxEvYU5OQQO0hPdz9Kg+8RFFaRgkkQfySm15hkbQADf+vN8dzQf8e2YxBE?=
 =?us-ascii?Q?BC4b6gonjrUd6ip/Wqq1ZxzvAnTdT5RKfLe9ecbI0IRmcAfVhZ/7wWgSnp2v?=
 =?us-ascii?Q?21uLvI/JPydmKe0FaZ7XprimUP62SithVE32i8Gh/bMeEV8IZTsX5VB7Fwb1?=
 =?us-ascii?Q?EQ3OfDsPHGw7VgqjE01rRhaedi3Y1yvszWE4HB1DqIXRBQsNZb6tmx0fn4nI?=
 =?us-ascii?Q?F3DPfy75bme+OKX5JgbDOSr9OKcDbKRJR2O7yBCHT79UjwZif/xqZeqIO/xA?=
 =?us-ascii?Q?A1F1Bf2p7ZgYLQv8+B9ByGHIjZ6HUmrSgjeeNULrQG6xmGvKBE5slLPUbBnD?=
 =?us-ascii?Q?oFuRIcVYnx1yJU6mPAWz/krMqmaWFwcFkg5M1SoZFsMaDXLvsZ/iA/FmxWBs?=
 =?us-ascii?Q?PmKOo1dpIpVKGzOkTu/4QIiJFOLidY4U9W4GuHinZHTrYP5h85axwlXMQh16?=
 =?us-ascii?Q?iz3VDAXEGqgQNrcVCEGBw6UAyOhQutG/5pO1Y8JZiX8Z6LktlBouURIWaPhA?=
 =?us-ascii?Q?VxodsgBnPMDPyePE+ib3hFi5yUYhQbD7OqSOQUnPlq4rnisXZ+Dq3QRMUobU?=
 =?us-ascii?Q?UxOUmGIc3ECH5cqrzDRu1H/UTmR+vxtDVJbnIWMOfQyJCFJL5NeniwOsP9YX?=
 =?us-ascii?Q?xoA+s+CYz5mOtdwUvEnQF8y98q+ruBXAIqJ1SNgX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d4fd15-2d89-4a5f-27f1-08dbcf47c202
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:32:10.9892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UpQQ9RG6k8q75exJpDPBrocX5Bc4/gdnK/+QoqX9Cu5b+KwTUCrMsuEFxms/k3qa+3rUHnkYXhtTNo35kEXIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948
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

Since difference SoCs require different sequence for exiting L2, let's add
a separate "exit_from_l2()" callback. This callback can be used to execute
SoC specific sequence.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
    - fixed according to mani's feedback
      1. update commit message
      2. move dw_pcie_host_ops to next patch
      3. check return value from exit_from_l2()
    Change from v1 to v2
    - change subject 'a' to 'A'
    
    Change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 37956e09c65bd..aea89926bcc4f 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -39,6 +39,7 @@
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	int (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
 };
 
@@ -125,7 +126,7 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 		dev_err(pcie->pci->dev, "PME_Turn_off timeout\n");
 }
 
-static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
@@ -150,6 +151,8 @@ static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 				 10000);
 	if (ret)
 		dev_err(pcie->pci->dev, "L2 exit timeout\n");
+
+	return ret;
 }
 
 static int ls_pcie_host_init(struct dw_pcie_rp *pp)
@@ -180,6 +183,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
+	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
 static const struct of_device_id ls_pcie_of_match[] = {
@@ -247,11 +251,14 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 static int ls_pcie_resume_noirq(struct device *dev)
 {
 	struct ls_pcie *pcie = dev_get_drvdata(dev);
+	int ret;
 
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	ls_pcie_exit_from_l2(&pcie->pci->pp);
+	ret = pcie->drvdata->exit_from_l2(&pcie->pci->pp);
+	if (ret)
+		return ret;
 
 	return dw_pcie_resume_noirq(pcie->pci);
 }
-- 
2.34.1

