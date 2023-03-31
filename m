Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0316D23C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3l245hWz3fW4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qPbVzDCE;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qPbVzDCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::614; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qPbVzDCE;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qPbVzDCE;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp3k72tkPz3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:14:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omp7V1S97FAyi73wif/zMkSpT+3MnMf5Youer7m6faE=;
 b=qPbVzDCEz0TLukEIJqKbzUp+GSxH8IqRUmNRy62viH38YgbtcmcbjIUWqHwC3jm0EOTsXkLo58Ebs532Mz3UumuPtKhECiDCBuv1HXYegw9Y1Gfvy5ZEQcRKCmMdU5Cs4N/RfqrkiWNTNdhuUvn4A3PnmGtvkdkFkhcFDZEc4rpuKKOQcY4MUaJLnZwrYOL2My4pbytC66SxniRoYpech6AJKLA4LwTsgzNAyCr0ed7UcsKVAPhvg8361+afsM56JAb2CwsMVVG4UMrI0Ghjcrqu5+WOn3lL7Cok9x0LGoaZg/oUwfTAdaztK3kA6AXpHvhz+PdNeIiljw3KfoKmrA==
Received: from AS9PR05CA0311.eurprd05.prod.outlook.com (2603:10a6:20b:491::28)
 by AS2PR03MB9813.eurprd03.prod.outlook.com (2603:10a6:20b:60b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Fri, 31 Mar
 2023 15:14:34 +0000
Received: from AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::27) by AS9PR05CA0311.outlook.office365.com
 (2603:10a6:20b:491::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 15:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AM6EUR05FT007.mail.protection.outlook.com (10.233.240.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.37 via Frontend Transport; Fri, 31 Mar 2023 15:14:33 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B7BFA2008026E;
	Fri, 31 Mar 2023 15:14:33 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [104.47.2.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 62BF12008006E;
	Fri, 31 Mar 2023 15:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWA4LEIXrYZ1y6UI/hH4At7U5J4TBGQCkG07W8e60EoDvLwuROKwNNvOxpjzRFlus7F8MjfLiB10EKlpJGjGWFx6UgYY+I0W2ED2V7fpFE78xQ4l9kc3b5//9/QRxoV1I1yb8dtc4LBG/PxscMdZLM0DXBliDvVCH6eXN7/L0G9Ja8GpphgEWhyprzt51Zg7vEGcl8BQMDO8d0Xjpxx4bqnhhEtfVDgNmez7Eu3g6Fy63U5BF52x/3djh6dPWTk/NZtW0O7tGROKrnPR32iy0tkeMfhgHri8reTvRh26eLU/yB62USxNj0ZtclpnrBjF8yjFJ07p3Mx9pXRrKi3/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omp7V1S97FAyi73wif/zMkSpT+3MnMf5Youer7m6faE=;
 b=S93NRqJ7VEqr933bvRWHXOUIxj809H+ZA+Wk65CeLvNhak9umLc3d9JcqNCqdj4L7XR1uxtzkngXV3bh6FMd5BpEu/H7gokDZJcdc3DPuSydH0qx+S/ezu3QYTyE/F4RjztLlo9FoVxT9/Y7Vg7jxRNge6KYaZs5EQmwrS1b1VtK0HpXoqAWPdS95RCw+2H1STjrSl6e2jPyZsIhgUrkRLNY3cTqxQi4qKoeGBeAix5LXLKI3DUD5k7YwHkHDf6Xaa/ttKBx2544zskUMhZusNY/HtHm7SHvf8/W4V8fA5+pgCqKElxoB8PuvI4VTNnGiPK6Sw8Nv3B401tSvns49A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omp7V1S97FAyi73wif/zMkSpT+3MnMf5Youer7m6faE=;
 b=qPbVzDCEz0TLukEIJqKbzUp+GSxH8IqRUmNRy62viH38YgbtcmcbjIUWqHwC3jm0EOTsXkLo58Ebs532Mz3UumuPtKhECiDCBuv1HXYegw9Y1Gfvy5ZEQcRKCmMdU5Cs4N/RfqrkiWNTNdhuUvn4A3PnmGtvkdkFkhcFDZEc4rpuKKOQcY4MUaJLnZwrYOL2My4pbytC66SxniRoYpech6AJKLA4LwTsgzNAyCr0ed7UcsKVAPhvg8361+afsM56JAb2CwsMVVG4UMrI0Ghjcrqu5+WOn3lL7Cok9x0LGoaZg/oUwfTAdaztK3kA6AXpHvhz+PdNeIiljw3KfoKmrA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB9662.eurprd03.prod.outlook.com (2603:10a6:10:458::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 15:14:28 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 15:14:28 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Date: Fri, 31 Mar 2023 11:14:13 -0400
Message-Id: <20230331151413.1684105-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230331151413.1684105-1-sean.anderson@seco.com>
References: <20230331151413.1684105-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:91::26) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB9662:EE_|AM6EUR05FT007:EE_|AS2PR03MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: b1537ca3-d11d-42a8-7ee2-08db31faa25f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6LnjyGfFKFpI0J6llfF0IeX3uRIOE0BfbhIGObh5aa+OOGVd64s3aaWAfmSrlj7YpNnopQElNj59GZ7/XM6lNzFNTtzvPd8T3qEugW4tK3+bgELl69sFRQf+jBuXWa2iAUsv1xqh8HDzJzvfN2yqgFbgj3NbfgX2e71AYl66l7hfR2mspiSrPhROc5zDnRsQ8P+XqLQ5H0gQERaQp+96DdUCf7wqDw+DWMowjkY4BQcbRH9fDP7oYXcsRohg5kPC0xS3loyHGNNqwjvhh8UPj4fyOgujoeztLm2PWJ79yRc3QZoos2uebJowEMl14qslZujyhVf+dO5Y+E2zy/k/dKQXbBIFmcLQj7eqrtlfcqR5kNfqhByTSZVBARCs442N4JUByR5pOGFBn+WRCDi0UTC1c+cqZqp9Ismg9fd4dOHiIbQpn1186muB57THrnH+Gpuo5Y0Y0PlTFIfAQjIZZvzF+EYuZcDEziu1cJZtN3aVXGnoQlSvWX1xlpn5LI8Fb345ewlQvwuiGtcviakgAmf4caRCYuhjh+/bXsi16SG/giSj5q4h+f64CoYgmzkBCpqq9uNmSC1w+SIJh5XH8lzgrDOdaDdkhUQaEqRR9mk=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39850400004)(346002)(366004)(136003)(451199021)(478600001)(54906003)(83380400001)(2616005)(26005)(1076003)(6506007)(107886003)(6666004)(6512007)(6486002)(966005)(4326008)(66556008)(8676002)(66476007)(316002)(66946007)(52116002)(186003)(5660300002)(41300700001)(7416002)(44832011)(38350700002)(38100700002)(2906002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9662
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	da2cb8e2-4ed5-4dc7-6992-08db31fa9f18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0jWnEN+Yp7cr9ix2nY3LExjzbAsAD5EkZb2p+MB/xxB+SYBAk6Otog7qIlEy9vViYNwsFOas1YaoynlhRWamRp+dTqeRZuXXJxmQbBz0t3LHj3PjMXoWkp09CvQRa7w2qSsflnZWV09dbo2vCpDq28SkjeRWVDp4qqtUbwzaA0tz0CD++FiDsnMs1FHO8hty0ZpGoKDhxFf75q+CTmSmnJdcODSJfknlXo61U+4F8pDeujDbGelA3K1Cny7anD7nSDmGZWaDdtiFICwlF7hIsJz2S43rRJWpL5bhmtrqpAn4xhMbfrvrVuYD8oFMma6aL5jwg5bMz/gk4ze3uBwdGd9sr2QYbgh2xL1oHCtzkw6zzMRy26qe8Jn5Lcnwa5TvikLxhxrQqo170JVLrEDVtffapRKxLxnClR3nU7xRnuv+1AtOZN82FyURWIM5UtoR4f2Fq/Zbk/B2thDvJZSjXLMwPZqVSLHF4mo+BvQ9QwXgtOwHf9BUMVcAMSTXUZsXHd3w1x14/VkdXM13DtoLApRliEoYQNaCYlRIgVE5KPx8nL5G0Wcoi6fMzeR1GNaPcB5H3Egh/QzxOGzcB2QgvXGehrqY73H0p6YEWsSosLFlpVkbIuEqGxuDE4H5h7XvNi5L2lUt90dEg+zTki4JwbwTJGJ3nJl16pJfLJTb+Chsa01MMnxKGDKKh8t/BQVbRxw4gBWoAS+Sbef6uOmF3qO9EA87WXzwuv2zMyPx6I4=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(7636003)(47076005)(82310400005)(7596003)(356005)(5660300002)(44832011)(7416002)(8936002)(70586007)(40460700003)(70206006)(36756003)(4326008)(82740400003)(8676002)(41300700001)(40480700001)(336012)(966005)(83380400001)(6486002)(2616005)(36860700001)(54906003)(34070700002)(1076003)(26005)(6666004)(6512007)(186003)(86362001)(6506007)(2906002)(107886003)(478600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 15:14:33.8340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1537ca3-d11d-42a8-7ee2-08db31faa25f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9813
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgr_lock may be locked with interrupts already disabled by
smp_call_function_single. As such, we must use a raw spinlock to avoid
problems on PREEMPT_RT kernels. Although this bug has existed for a
while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
queue depth on rate change") which invokes smp_call_function_single via
qman_update_cgr_safe every time a link goes up or down.

Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Link: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v1)

 drivers/soc/fsl/qbman/qman.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 1bf1f1ea67f0..7a1558aba523 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -991,7 +991,7 @@ struct qman_portal {
 	/* linked-list of CSCN handlers. */
 	struct list_head cgr_cbs;
 	/* list lock */
-	spinlock_t cgr_lock;
+	raw_spinlock_t cgr_lock;
 	struct work_struct congestion_work;
 	struct work_struct mr_work;
 	char irqname[MAX_IRQNAME];
@@ -1281,7 +1281,7 @@ static int qman_create_portal(struct qman_portal *portal,
 		/* if the given mask is NULL, assume all CGRs can be seen */
 		qman_cgrs_fill(&portal->cgrs[0]);
 	INIT_LIST_HEAD(&portal->cgr_cbs);
-	spin_lock_init(&portal->cgr_lock);
+	raw_spin_lock_init(&portal->cgr_lock);
 	INIT_WORK(&portal->congestion_work, qm_congestion_task);
 	INIT_WORK(&portal->mr_work, qm_mr_process_task);
 	portal->bits = 0;
@@ -1456,11 +1456,11 @@ static void qm_congestion_task(struct work_struct *work)
 	union qm_mc_result *mcr;
 	struct qman_cgr *cgr;
 
-	spin_lock_irq(&p->cgr_lock);
+	raw_spin_lock_irq(&p->cgr_lock);
 	qm_mc_start(&p->p);
 	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
 	if (!qm_mc_result_timeout(&p->p, &mcr)) {
-		spin_unlock_irq(&p->cgr_lock);
+		raw_spin_unlock_irq(&p->cgr_lock);
 		dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
 		qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 		return;
@@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct *work)
 	list_for_each_entry(cgr, &p->cgr_cbs, node)
 		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
 			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-	spin_unlock_irq(&p->cgr_lock);
+	raw_spin_unlock_irq(&p->cgr_lock);
 	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }
 
@@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	preempt_enable();
 
 	cgr->chan = p->config->channel;
-	spin_lock_irq(&p->cgr_lock);
+	raw_spin_lock_irq(&p->cgr_lock);
 
 	if (opts) {
 		struct qm_mcc_initcgr local_opts = *opts;
@@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
 		cgr->cb(p, cgr, 1);
 out:
-	spin_unlock_irq(&p->cgr_lock);
+	raw_spin_unlock_irq(&p->cgr_lock);
 	put_affine_portal();
 	return ret;
 }
@@ -2512,7 +2512,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
 		return -EINVAL;
 
 	memset(&local_opts, 0, sizeof(struct qm_mcc_initcgr));
-	spin_lock_irqsave(&p->cgr_lock, irqflags);
+	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
 	list_del(&cgr->node);
 	/*
 	 * If there are no other CGR objects for this CGRID in the list,
@@ -2537,7 +2537,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
 		/* add back to the list */
 		list_add(&cgr->node, &p->cgr_cbs);
 release_lock:
-	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
 	put_affine_portal();
 	return ret;
 }
@@ -2577,9 +2577,9 @@ static int qman_update_cgr(struct qman_cgr *cgr, struct qm_mcc_initcgr *opts)
 	if (!p)
 		return -EINVAL;
 
-	spin_lock_irqsave(&p->cgr_lock, irqflags);
+	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
 	ret = qm_modify_cgr(cgr, 0, opts);
-	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
 	put_affine_portal();
 	return ret;
 }
-- 
2.35.1.1320.gc452695387.dirty

