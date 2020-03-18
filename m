Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC75189439
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:01:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hvv00DQFzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 14:01:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.52; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=peng.ma@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=WPXblPFy; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hvs90ZMlzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:59:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtZzdtBmXczlp/TMYvilkXImx9TScIUzjk7wW9gAkhW7D+swu/oI1Sy6+RP7pC2rYYXU3jIlt0UnuqU3po/vGgzZQ4p07mmMdmNx7sFL5rSWJRci8Xy5fXelpNYAoROdvNVCCyyO19X1trQm9wecwVRSyNeEP0zxjSv/QF3mfdBWj2HnIJe8e3yrbl/V6xb5bwuegV7vNPIkpNDwMNaMG44ROgwiCTlpc0kZypZuOfplCFgyNvZ8022TsM3D3u7jGncdUjs0CpVlfn3kZLhW1Hd4KmIwoRxjtAqiPsQwEypq/3yJ9NHeBfbwuDgKr4K68Q2lE37VFKms7C8EdH6AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMydHRIbTHGOL4stBTGJQEQgpXgMzMnUhuRPmS/lsbk=;
 b=PrgyqcUtoHKmxw2ZDGuhiOr6iYYncgxdDt2fYloyo4K3tBOBW1hPF1EShZP5SlsyM6a+0mJPxy/qsTC/7bOB2IDRRgigmiyaQNlAcqcSQvp4I8STxV9lTByS0+AFOIoJ2oNY8mXTRElPP9xAs0/mD3cfE4H0MhFv6vPnf+Tpe/w405MKDYiyUaZa0U3P93Nk+oEIbtDvV35nmBEFklHYIzlPFNsR+PY/UJB34S9191sMh1Ohs8c7+f5mxys+oP77v3Bc2Rdsh/8BhEnsR/+MyGFxPA5Ela7pfdyf87UawxSpAtEJ1O63En0MvteEwi3A4kzoCclVKqssZPf7+DcBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMydHRIbTHGOL4stBTGJQEQgpXgMzMnUhuRPmS/lsbk=;
 b=WPXblPFy9D0fnwPerfwZwVgeeMkp5yduCnxYaHhR9PDHa52dN3fc9ccewX4LVOptUoorBIiV+8aNB711LItn3NfOVUVVfEplGVZ/TxSCoglikA/H45XvFxRSZV5XjpzDL9E/DUzStfK0f82YAY6OoluE3ezNwcZxB7XDWaL6k9c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6823.eurprd04.prod.outlook.com (10.141.171.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Wed, 18 Mar 2020 02:59:31 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 02:59:31 +0000
From: Peng Ma <peng.ma@nxp.com>
To: leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: fsl: enable acpi support
Date: Wed, 18 Mar 2020 10:56:05 +0800
Message-Id: <20200318025605.6671-1-peng.ma@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:3:1::24) To AM7PR04MB7016.eurprd04.prod.outlook.com
 (2603:10a6:20b:11e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by
 SG2PR0401CA0014.apcprd04.prod.outlook.com (2603:1096:3:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15 via Frontend Transport; Wed, 18 Mar 2020 02:59:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.73]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3e031ac-eb0f-4f18-d67b-08d7cae8615b
X-MS-TrafficTypeDiagnostic: AM7PR04MB6823:|AM7PR04MB6823:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6823C9539465CA19161A418FEDF70@AM7PR04MB6823.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(4326008)(66556008)(66476007)(66946007)(5660300002)(16526019)(44832011)(69590400007)(2616005)(186003)(26005)(956004)(86362001)(1076003)(6506007)(316002)(6486002)(4744005)(6512007)(8676002)(81156014)(36756003)(478600001)(2906002)(52116002)(6666004)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB6823;
 H:AM7PR04MB7016.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrzPY2ejFQqC1OhopF1CCychFqwHMWf563Z7hsS3+oITrD+1+DM59CVtBATIoQ3haFNAaKlJiAu64+yWn76qDG6oBqejMRNjHyKNNrTkpU2ONga5LDzkigL3r8QGd049orwZOacZD6YvaH4QIGNa+2+PZWcaATcnoVQcOrbxO7KMgfeKZt+VeVYmdeh0cQq15hi9PIa+NfbENg56BBV2MqLmFYu2i4EgUS64VvjbBcaYtiAD25M2+bfzV0HyD14lQPfMi++NdssNebLlv5aA/5QOLgwMmyzFHCiieQ25wPBeuYHSsq+vZrNTbEK4JllafhcDh+wvP1U8uU95T1d8YPiFJ2Qsa0+rIddgy+ljeHjW3D2S/sz9XAVO01rjmkU2GIP2vDvQZP+l+B0etWx3ttDQvIOoMlWgBbTMR7dQKhOb1W7WRWF7wvZH39bRPjpJTjns1Om4CR12PaFXGxvHsosfwLVG5qI0rOQEpkvP8VnBxQc0K6yjyZ5W1Ea9Fira
X-MS-Exchange-AntiSpam-MessageData: ydjO25rVKsFY6f9cQDySFWLzv7ry8LCIoV3PAionkQ71YonLblXXRuUtdLG/Fh2fbXYYNEXEGyJ0u0tGl2Oj/wsW6rMBWhLNROwP/12v5Ofw0purLM2GVim4U7apmz1Ipi/46+0C0RaaMVsvbsXdmw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e031ac-eb0f-4f18-d67b-08d7cae8615b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 02:59:31.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zISa8wj5m2ZluF8fMNwwj/OyY1jenmKNKGWPGw0ae71S3WUxfiJVtptPjHHR1wj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823
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
Cc: ran.wang_1@nxp.com, Peng Ma <peng.ma@nxp.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch enables ACPI support in Rcpm driver.

Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
 drivers/soc/fsl/rcpm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe..7da6bbd 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
+#include <linux/acpi.h>
 
 #define RCPM_WAKEUP_CELL_MAX_SIZE	7
 
@@ -139,10 +140,17 @@ static const struct of_device_id rcpm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rcpm_of_match);
 
+static const struct acpi_device_id rcpm_imx_acpi_ids[] = {
+	{"NXP0012",},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, rcpm_imx_acpi_ids);
+
 static struct platform_driver rcpm_driver = {
 	.driver = {
 		.name = "rcpm",
 		.of_match_table = rcpm_of_match,
+		.acpi_match_table = ACPI_PTR(rcpm_imx_acpi_ids),
 		.pm	= &rcpm_pm_ops,
 	},
 	.probe = rcpm_probe,
-- 
2.9.5

