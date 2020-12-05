Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638532CFE81
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 20:41:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpKgp3034zDqLt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 06:41:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prevas.dk (client-ip=40.107.22.125;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=Bg1PgkW7; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2125.outbound.protection.outlook.com [40.107.22.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpK9k1N1fzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 06:18:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVX4UIeg9/Rx4dAPA1Oin8ZM7hI9frhCY0J6HOB7LKl0ACzp8q+G3iD1mb2UcVmVGax2Ord74hm0sZMuPqzG4IE6akVyjlG5R8FCo9pBNUJqQtS9WkmTNFzKjsFt0rvfwkvEeTgh0pfDDNmMcWGUppzODGtJO+4MsDQ6eRQ9oPmC9/bt196ZoMJKLJX3A8JlAMkCfoASpsIDyU7TI3ow4zJIBV1AiIRrqPIYYQpyTj7Db/36d60V3tH5IYQ9OXggV6KFCO/t9cVbYu3bRFWhK7ZMYRz1CW4r7qtUwlKi2RvJaUr5hfKvqtTW0lv3KhGRYjnIg07jARtymYBPA4GJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nFx5CL8o/Bsv7UCujawuGddlmBUO91xAOUF5SEfX9M=;
 b=JvCxrZfe5Nu7dD05sdDKw6RZm1iafQXE64suuN7eamlwKb2/5LAOEuOHQ5mLB17T+Mou4xB9SFYSINeyJ6Hq6PQpACFN6a2ptG5WvfccWU14RizPGSgU39ts7dQ+JNHt6XsjVnMBGPaBbdyWdBVH/F2ETLefe0sFLLU8YKFWnCFIHdXabc1xO/91OxN90iMVgJB09xIxMsdfpe1xQt0KyGs8fwYe9Dg9JnylxZc80+QmSAU+L4qokJcEFWiXeOpyY4+ogHxdLIj0vZPs1folRwRLcDVOzyJ7QhH0upjiVlaS7Fpq/WkWmMRH0/p7y4J2+ih83z6H6pLW4l1Cnl+6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nFx5CL8o/Bsv7UCujawuGddlmBUO91xAOUF5SEfX9M=;
 b=Bg1PgkW7s80kpuY/Lsj2k7+6X+NHxjhwT+vEGrOC2KzrWnXaIfNJOqtabkpUUlhMxjqOM6UNI8G2BHwMiwMbfU/fVtZk26MoiUYt2hoGZEfvIcMtJ+yeak9/sEqhZnvVy3JTFknixGhlTFYtIO7AqNIfNkQjOpdleJy2kK+iNJY=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Sat, 5 Dec
 2020 19:18:23 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 19:18:23 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 07/20] ethernet: ucc_geth: use qe_muram_free_addr()
Date: Sat,  5 Dec 2020 20:17:30 +0100
Message-Id: <20201205191744.7847-8-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5PR0701CA0063.eurprd07.prod.outlook.com
 (2603:10a6:203:2::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by
 AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Sat, 5 Dec 2020 19:18:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a5f2bd-831c-403d-125a-08d89952887f
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1363E3A6019A5BE37977541E93F00@AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsCRh38ZPo4z9zQ1XXf1L3vtyXYuBkE2YvBHGzjcoS6z8TXsnn/za6TveTXmNkbT2yujh3VGAw8S7jR3UbBVcH3FU49sn0iI5/TFK6kZ18skooKncQd4qVybTexpMfGvMJIJ3xUM7IMVgdt1++UJ9nNDiOEKi5mUXdJEQJ/qbSGYRKNL5uFpihVN6aeKEpguz2JbNNiFbLL2k6PUO/rcccVq8nqQrEVVbFbbpT259w0gCftm6D0RCsvegOSJ5kDMClUExAgkMJgDvrgq9nzj/jRotk1FvrPOauXg8QNE/KFzljaUSylNklfb/nB5eEENv4yc1Vu3hE88W1Yvjfm4pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(346002)(136003)(366004)(376002)(2616005)(2906002)(8676002)(8936002)(83380400001)(52116002)(36756003)(66476007)(66946007)(66556008)(4326008)(8976002)(5660300002)(1076003)(6486002)(44832011)(6512007)(186003)(26005)(6666004)(110136005)(316002)(86362001)(478600001)(16526019)(54906003)(956004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HOUCAeZP71rfnGVkSi0/9Mx/zwtAavh5xZWX2vy03pJ+BpnAE8E5WNxg1zoV?=
 =?us-ascii?Q?nUPtFrHPQWhDPHhSawXXZFznTY46Mp/4y34DdGZDHtjyewpaSd4U705KMkXv?=
 =?us-ascii?Q?GhZJg67quxJ8iCmuphRrc54eGTYjWzNbzCfLgOcTFeaEBPMhSzkr148OQMjv?=
 =?us-ascii?Q?BBhP9bsmVVEOdgTfdXAkp1UBE+hKGdAHibdiQnYv8bk0Qz1Jdtu6KpnBcSiO?=
 =?us-ascii?Q?xTJ+tQpSmjwwSsLgyqjEN++TvOUec1RxLO7AnV3D5uKkU0rGZM9sly5DCw//?=
 =?us-ascii?Q?kQ647NBQWpggt25fNQL0Ahxqe9FruLxbyw9MrQhUu81VAH2i6rDG3jysYdxk?=
 =?us-ascii?Q?AN84+tipxU3KsJRVLKmh/divlsAr4/IfS0bkBNDAHriIOMi+MFCm3xQIiueK?=
 =?us-ascii?Q?YtkIgb0c/EyZWYttF51h0K+0R2K3jSBNlBtSfRZpCzxSAFx/MME7Y2UF3dsi?=
 =?us-ascii?Q?ibr1YJ93mB8G4oJWHR5yyxFc1z8vDgMt8dJOUrC3PlH2HLCXA/S9MkOacwar?=
 =?us-ascii?Q?jkrbG1dpBYvUAOX35FSptqpD9V8IuzsFpPXRgVpjvP189z78m5LLXmKoX6Fy?=
 =?us-ascii?Q?i0qRjkl8PdjTRNKFitpeT1dFZL//KNsynnArxYN04PD4jVavHYi+kI/BL1Sv?=
 =?us-ascii?Q?9j+UA6E/ZVnnTZFSA98vpvO1HGpDVqckB1rjAGMcAGjycpq/HU/fIe4nH6x5?=
 =?us-ascii?Q?HuugJE5bNC6/LmpksNfjOIgTQoQcFgk9MFCRCQUttYMqAmYSYrYVhoPP0Gsy?=
 =?us-ascii?Q?1S2PbYEqMmfVcNT98BnwTtQ57xV0WYsR8bAYCvEtOYubHjTdhH0Fkv+8zFlb?=
 =?us-ascii?Q?LgLU+U29QIOMnO0cgZx46S9SIbMPR0M5r/xX33AugtW6cloEqVMlldX4C4gd?=
 =?us-ascii?Q?Xec0xSP5LskG0zzQIA+tZX3h1tgNcNz4fQHYZV5jpi2075ELG6gDuhva7uIX?=
 =?us-ascii?Q?LenO1Qls7H9l8tHonRQOU5NOaNIqS3+mckAD+A0cVEnfXxqUCsE5OjRlCLMy?=
 =?us-ascii?Q?Pkmy?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a5f2bd-831c-403d-125a-08d89952887f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 19:18:23.0521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFwjY2lnu8a73hhYW7gFuJ3geAJauNH5YhkH3sMJuVQxNNwThh429NgsCKd9VrP7/wgMz0N3Ula84Qfar+jwhZbxswhpvUieFX/QEq9Kcxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1363
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
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes the explicit NULL checks, and allows us to stop storing
at least some of the _offset values separately.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 77 ++++++++++-------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6446f2e562c9..bbcdb77be9a8 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1921,50 +1921,39 @@ static void ucc_geth_memclean(struct ucc_geth_private *ugeth)
 		ugeth->uccf = NULL;
 	}
 
-	if (ugeth->p_thread_data_tx) {
-		qe_muram_free(ugeth->thread_dat_tx_offset);
-		ugeth->p_thread_data_tx = NULL;
-	}
-	if (ugeth->p_thread_data_rx) {
-		qe_muram_free(ugeth->thread_dat_rx_offset);
-		ugeth->p_thread_data_rx = NULL;
-	}
-	if (ugeth->p_exf_glbl_param) {
-		qe_muram_free(ugeth->exf_glbl_param_offset);
-		ugeth->p_exf_glbl_param = NULL;
-	}
-	if (ugeth->p_rx_glbl_pram) {
-		qe_muram_free(ugeth->rx_glbl_pram_offset);
-		ugeth->p_rx_glbl_pram = NULL;
-	}
-	if (ugeth->p_tx_glbl_pram) {
-		qe_muram_free(ugeth->tx_glbl_pram_offset);
-		ugeth->p_tx_glbl_pram = NULL;
-	}
-	if (ugeth->p_send_q_mem_reg) {
-		qe_muram_free(ugeth->send_q_mem_reg_offset);
-		ugeth->p_send_q_mem_reg = NULL;
-	}
-	if (ugeth->p_scheduler) {
-		qe_muram_free(ugeth->scheduler_offset);
-		ugeth->p_scheduler = NULL;
-	}
-	if (ugeth->p_tx_fw_statistics_pram) {
-		qe_muram_free(ugeth->tx_fw_statistics_pram_offset);
-		ugeth->p_tx_fw_statistics_pram = NULL;
-	}
-	if (ugeth->p_rx_fw_statistics_pram) {
-		qe_muram_free(ugeth->rx_fw_statistics_pram_offset);
-		ugeth->p_rx_fw_statistics_pram = NULL;
-	}
-	if (ugeth->p_rx_irq_coalescing_tbl) {
-		qe_muram_free(ugeth->rx_irq_coalescing_tbl_offset);
-		ugeth->p_rx_irq_coalescing_tbl = NULL;
-	}
-	if (ugeth->p_rx_bd_qs_tbl) {
-		qe_muram_free(ugeth->rx_bd_qs_tbl_offset);
-		ugeth->p_rx_bd_qs_tbl = NULL;
-	}
+	qe_muram_free_addr(ugeth->p_thread_data_tx);
+	ugeth->p_thread_data_tx = NULL;
+
+	qe_muram_free_addr(ugeth->p_thread_data_rx);
+	ugeth->p_thread_data_rx = NULL;
+
+	qe_muram_free_addr(ugeth->p_exf_glbl_param);
+	ugeth->p_exf_glbl_param = NULL;
+
+	qe_muram_free_addr(ugeth->p_rx_glbl_pram);
+	ugeth->p_rx_glbl_pram = NULL;
+
+	qe_muram_free_addr(ugeth->p_tx_glbl_pram);
+	ugeth->p_tx_glbl_pram = NULL;
+
+	qe_muram_free_addr(ugeth->p_send_q_mem_reg);
+	ugeth->p_send_q_mem_reg = NULL;
+
+	qe_muram_free_addr(ugeth->p_scheduler);
+	ugeth->p_scheduler = NULL;
+
+	qe_muram_free_addr(ugeth->p_tx_fw_statistics_pram);
+	ugeth->p_tx_fw_statistics_pram = NULL;
+
+	qe_muram_free_addr(ugeth->p_rx_fw_statistics_pram);
+	ugeth->p_rx_fw_statistics_pram = NULL;
+
+	qe_muram_free_addr(ugeth->p_rx_irq_coalescing_tbl);
+	ugeth->p_rx_irq_coalescing_tbl = NULL;
+
+	qe_muram_free_addr(ugeth->p_rx_bd_qs_tbl);
+	ugeth->p_rx_bd_qs_tbl = NULL;
+
 	if (ugeth->p_init_enet_param_shadow) {
 		return_init_enet_entries(ugeth,
 					 &(ugeth->p_init_enet_param_shadow->
-- 
2.23.0

