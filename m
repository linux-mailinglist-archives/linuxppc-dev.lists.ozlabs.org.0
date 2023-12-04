Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE08039C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 17:10:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=LYVeTANI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkTD56b6Vz3dRb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:10:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=LYVeTANI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkTBH6ykbz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 03:09:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X46SCRsdphmXwLSOw+SYfxOp9j1C65IKvKlLx48tKRADZz2G5aZIjLi9NiPWei+bh5QSfTAZOGl0pyTJUd22vMCiLqCANbyUbffU9ItW7E1noy3wg2Xw6ymb3EcDH51ncwwS/sMVwE/xRkDRySKllvyfoen73iByCtak5fg6sC6pz8NnncbjJfWOk5POtUhFBBVJFrNehyreu0POBAN8P9+0o4pdX1j4oAQkc7cyzQKxmDEiwpZlZc10B8MA6XfQ2fwI06XuHl7JQawjbQwHhzqB1xqjWQU3TPDKCcZO/jrE1Q6i8jIBFj51gIosn64vpbSJa5nUBNvQRJ4NHYiccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTm6SVn/8Csl+QPlNDo2X2odB9csNy1A8DgDUr0Iiek=;
 b=N8Tgfzt+Ag5+mbntbNBn9FM1mEfkdeVEUkUxawR2qsCPcnII+DNplrra8HrnJ5WIE8M5wVbV833tTkQEEmmSxEfGCWy7lOYbxjz+DRTWYjUKkvKb26/oFMGKKub6Bqyhz0tsZ1JoZq5BeVq5Bbds07waboP2niApDqA+MTXhygM1g03tcbM/DIY8Dmi0/afWm4X3/MKu2JQoq9Gj15W/Ij7XIkwXjVM5ZR/1dhxwjx9SmeF/LgGreGYgKMYVrByP3TRl3AbG8B7uto80HZN9OZvz/6can1CMsNSXcV//v22d3+tV7ira3IqBxHjaRb/KO70UI4Yq+nSj6ng+wz/tyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTm6SVn/8Csl+QPlNDo2X2odB9csNy1A8DgDUr0Iiek=;
 b=LYVeTANIMICT/oUKZDa/2qbz/oIpgnnWAM1nOgMtAt1AGJUFWXbIQCSIziprGDpZsKcyNk5k265etvMMGguZFPySNgD8YarIAyiWqRO1teTM74HuqK2TrJJwGyD4aMpsiBuRcvUHH2sRxzjiRVibCQmf9U3zDxmmwiAgBvWKyl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 16:08:52 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 16:08:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v6 1/4] PCI: layerscape: Add function pointer for exit_from_l2()
Date: Mon,  4 Dec 2023 11:08:26 -0500
Message-Id: <20231204160829.2498703-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204160829.2498703-1-Frank.Li@nxp.com>
References: <20231204160829.2498703-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: a297a239-6e34-491c-fef5-08dbf4e34ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5rSKVZ0hbaDyAowBg3i1DxOgKuJ3RtHJeCJzgqffi1seJgl9iM056NVQZU4aICIqwXWDNdVVIap+ZaUZXp4/Nno1ojYx4YMwIZ51N7mav9Hbjx+XV6aTpiFtduJ9KZXUWykJjKrV+0r7tyuv8N5pfnC+awx4IaQxaLqBOpJNuYA4iewTbybsYwzBs4ARsEK72nmm/udlK/WNzSO3sRBXswyAaRbSlHpdBryRciZ7EudU/7stak435xHakoxaNDb1TZhunxpJBORT8p4r46MWxni/W16u/ep/hmlFn8OGOHjwFEkATrHSZu51C8qOvRIBnlr2PffHu+8VIw5FutcsPPN2N1PQvVmV5xv8PTcpht/4pIa05FKGF4ntXmkFy8SZERtDtory46XADBb//9z4Q+pepUmLSDBRzVvAVEGsZ2OYnojun3BQFRESeMh+2FBoHuWhMwE+aV5jI0smWxzZFvMJMpb4q/9KG0L6BQN42s5FfZi+533oY2YaNLvbFKpapuKny9xCMpfiW+cjNGM4c09sfbsppmJhj6lhGi1wyZAJ0c9q/xtOrGTkBmJPJuuuRycOIWpLN3Us5/ok7e0qErQhQS+O/Cxe1mZvvmGUv2yupd02huKcnNsuIqjR/O++
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6916009)(66556008)(66476007)(8936002)(316002)(86362001)(8676002)(4326008)(6486002)(478600001)(66946007)(36756003)(41300700001)(38350700005)(2906002)(7416002)(5660300002)(26005)(2616005)(1076003)(6506007)(6512007)(52116002)(83380400001)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KkiYNH/8GcLG+Pvsct5JMAYbvxWeMN0yHgYItaNXfaFBwnHzsmM+MxM7mOvm?=
 =?us-ascii?Q?jN+03Xhiq98cmDFZWsQsa1ReCfIJuK0pfQCEjS/bgzGKPbyeZEaGC/3vCUlO?=
 =?us-ascii?Q?Sbq38ItNpTw/gJavNLVYwtZQExn61xBlCWhRlZVEA98y2WvqZ+BkjZddWx2q?=
 =?us-ascii?Q?gC1/QiW6Jv53slFvsoyFJOii2JbG0PWLshGFyumfXiIKXiVBvAEzg6PGjUBe?=
 =?us-ascii?Q?WTqqCbsqkoTFRaVIEyysrQHtq6oSjfNR409VayIuwcDwUIZ8OHiZelhkpOdU?=
 =?us-ascii?Q?caAEdLxIT9FJy4SZuqNOgWBMQJVCPhTFWZDujvnDC3dK2HUIJNp7udQWXeTZ?=
 =?us-ascii?Q?UDLvFbWaubl9119CJsqevOY8RgqIZ9S6AAEyzMkQ+fkjPxp1FxFsyKfE7up+?=
 =?us-ascii?Q?Mpym4YmDUOJHUhzwlzaD3b8hXB80sODAqsuj0a9LrOTnp12JLn9x7gH7VU7G?=
 =?us-ascii?Q?AyjiZXe5sQbcZvNhN12hPp0y0REgGRYJdYGGn7KYIf1c5eD2e+YmNoSP0eoO?=
 =?us-ascii?Q?OgWhmXIK7UkkHBiCdEb8bLucr/GSe4tG+u29eaH6UU86X3oK1RpBHL/ea8P6?=
 =?us-ascii?Q?Udj7XANktBqxinUyk543ufaJJA3wmDINLKHq5M8rguivzvu0zk5NPHeUOvyH?=
 =?us-ascii?Q?MXkzOmuXsCIs9nAcPORUA27uYgjLZ87UAagXMKGenYlEBpZPHbj2whb62ms0?=
 =?us-ascii?Q?ToSLQZNkmddM8fMejBLOQ6nR673F5kHA+XxDPDG9X8TXeTAGRTqXgjQxyMMB?=
 =?us-ascii?Q?6Dq9W6lnWmNI2xvwJKn1dCvQPnvKTZ+hx/jG5CPIsiG9IV+gPvFdAeyrkDzg?=
 =?us-ascii?Q?ibUNQ9ikq38FXZeBGRBgqem7F6iTuAS3A7FCR1xL7/H6qOJmVuDprREodW09?=
 =?us-ascii?Q?NeTppNxUWLqniBYuFPeFbvyj2O41KfFPshbA5EdFwixPR1YMOIgBNq4RhRb0?=
 =?us-ascii?Q?ryhYIec34HseftDZ2ac6H4gFCKkU7QhMZDFnMsOrljsNWm/myZ4/pyt5Ipj2?=
 =?us-ascii?Q?mMy2QVEpES8XWTfXSPre1im5rcThnRaBr3ov5VdVhM4kHV9Ykmss0npqPIsL?=
 =?us-ascii?Q?ejwIdhdWo4fnujgYQCdzP5lGHiVOlAxtDnyduWco6B3/Vk+Mh0slQzfvEutX?=
 =?us-ascii?Q?1KbPSmtXTYJfT4ag6Lkcohtdma+3aLuqkc2ISQqWWGnIpQ/2AarNlSWUM4zW?=
 =?us-ascii?Q?79hgu8Jk9hFjh8sjsy2ggOGEkfThgHql38F/suRZIUkDmu85oku9ALaHLbsc?=
 =?us-ascii?Q?ZN9/zj2DD2KWeyJ6oUp2i7eifDoJoyFPClPK3K+OZJorf81efdqm+D0FE9NC?=
 =?us-ascii?Q?zwMAUTDdCXhrtZqCaO0DS+uVunGdSVcpiZz21UqOQmo0GX1fv7+rTEofOAKV?=
 =?us-ascii?Q?jwtGSaC8JIfZ9tcGDcVtWRS2LAC0sFd5s5fSmozBvzrVSgTOING4WZF/6MJD?=
 =?us-ascii?Q?Ei0ZrSJqj0t/Omt6sNm0DvytCCrbq2kH1IzUwEhpxaVC2f9PtLM/18Y6m3sZ?=
 =?us-ascii?Q?Yr277/NXLRQU23q7IHYD0uYzVjgHKXE6EuPje2rdGB0YpRveFFxJE9UiIAiT?=
 =?us-ascii?Q?O7aFoaR7XeaYf7BITexuG9Dnxw5djgt+5pMHjgec?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a297a239-6e34-491c-fef5-08dbf4e34ef6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:08:52.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WT6ZXki8n3zg+fyUngGpN2+dRd90lSYd0+rKnE7uOYK72/KQsk0jT6f61yaIb4xPQSPc6fvd/tyUyjV85YEqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057
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

Change ls_pcie_exit_from_l2() return value from void to int. Return error
if exit_from_l2() failure at exit resume flow.

Acked-by: Roy Zang <Roy.Zang@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v4 to v6
    - none
    Change from v3 to v4
    - update commit message
      Add mani's review by tag
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

