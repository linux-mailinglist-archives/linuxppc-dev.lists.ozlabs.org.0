Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECF6CAEA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:30:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PljZw24vlz3fWX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 06:30:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iZYsMa17;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iZYsMa17;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::607; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iZYsMa17;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iZYsMa17;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PljYv6pl9z3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 06:29:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU6dPEOgWunbX+Tx7TcUsoyBaBnnh9n44XxEBh2AQJ0=;
 b=iZYsMa17U+8HlT6cMFMxNL7eUnAx7JCVpyNeStZY/pIW5vklpmUz9fIV9PvSs7+lmww+ZjDeFwru1Q32zINd+B7JTM03ABy+EgeO2clWioIy/3KBULtIDu5hzKxrSF9aRo7Qojae8uyGx1N5nO+757JEJhiLFvuFvKycKK81ENUHsUeC2D0NG50Y0UhPcNsPTKAc1fHyx9pu/4RKL2W5rVxKkUI3pXcB/jmailF7Wz13WgCS+ogcClx+6Ot5lre+Hs7y/7CFWKczDQrOhEaiLglLpkU093rroDWy4mWRYVvmC5pASPRVAQquuzYr0ZIifJWhCy2wofwc8yvPnQfwzA==
Received: from AM6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::25)
 by DU0PR03MB8390.eurprd03.prod.outlook.com (2603:10a6:10:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 19:29:15 +0000
Received: from VI1EUR05FT054.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::a9) by AM6P195CA0012.outlook.office365.com
 (2603:10a6:209:81::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 19:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT054.mail.protection.outlook.com (10.233.242.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Mon, 27 Mar 2023 19:29:14 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 81A642008026E;
	Mon, 27 Mar 2023 19:29:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.111])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id AEF3E2008006C;
	Mon, 27 Mar 2023 19:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbe7yj9UyYemmbA+3yNkhOfFdLDQpzKsmVVWlWUCrGeFmvsXSnusEfF1mTt9IrUPJar8FsF0GcmdREJE9lQ8xQ4peq1p++imHQ3u2IsR6JhJafok2Odib3nc2aBJgXJ72AizgcjO5j8b5c3b1FPvoVGCUMn5a3pIuw/XvK1g1l8CPzi96EpppYsQ/W8zQxqPBl1wUt5lxzaS9aMIgiBy9n8fUOSPHQJCozs1iW3y5NVm7bZ1x9hwyRnSGBDySa+owVnckW1tD+0DpYxvPuC69x/68yLDlE+x5ksGG3PYGF5ZAMdXm9iiTh5CfgUDX3uAyb0TJIAEeYj/vpHHl7qymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU6dPEOgWunbX+Tx7TcUsoyBaBnnh9n44XxEBh2AQJ0=;
 b=MerzjDC6OTSuRbXiBKX/DAzrwljNklZF8KyKVLWhEiCJxkmvrczoTgV/+zZvv/eaW69nIH9XehoVNzHhhcy5IeeUcTvTmIJ97hpB4HGul2RCvCoTsd6owvenZL+/gfb+0zXaTC3PFxq8TD9Wsf7Tkw+Zb+GMeUvhjSBm0hN9MasbE+J1iLjpKAtZ5HtDkQrJB3atFQcK8XCKbyMGbNGzAatgUyIUitAM9lIdQxJhtHxB4FfXfOzDG0pQ0uqjmcSgguFF/5mmwlQfHBK5O4vytknQDx5wF0L75u6N71QZKnYVmkPA95DFDldvgE3F69V2LAJiqQd0Fj5GCz/39ZTu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU6dPEOgWunbX+Tx7TcUsoyBaBnnh9n44XxEBh2AQJ0=;
 b=iZYsMa17U+8HlT6cMFMxNL7eUnAx7JCVpyNeStZY/pIW5vklpmUz9fIV9PvSs7+lmww+ZjDeFwru1Q32zINd+B7JTM03ABy+EgeO2clWioIy/3KBULtIDu5hzKxrSF9aRo7Qojae8uyGx1N5nO+757JEJhiLFvuFvKycKK81ENUHsUeC2D0NG50Y0UhPcNsPTKAc1fHyx9pu/4RKL2W5rVxKkUI3pXcB/jmailF7Wz13WgCS+ogcClx+6Ot5lre+Hs7y/7CFWKczDQrOhEaiLglLpkU093rroDWy4mWRYVvmC5pASPRVAQquuzYr0ZIifJWhCy2wofwc8yvPnQfwzA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com (2603:10a6:20b:56e::11)
 by GV1PR03MB8862.eurprd03.prod.outlook.com (2603:10a6:150:85::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 19:29:00 +0000
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::6c3f:aabb:5e8f:6126]) by AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::6c3f:aabb:5e8f:6126%4]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 19:28:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc: fsl: qbman: Always disable interrupts when taking cgr_lock
Date: Mon, 27 Mar 2023 15:28:40 -0400
Message-Id: <20230327192841.952688-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0319.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::24) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	AS8PR03MB8832:EE_|GV1PR03MB8862:EE_|VI1EUR05FT054:EE_|DU0PR03MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e02a0cb-42a8-4bc0-bd24-08db2ef98cfe
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  DUKEiQHnEGewBaSQYYYnnYrLR95aVQzfH7pXH9spBKbWrd6P4PCHD0gq8qbJdzy7R0mSm29xs//kgyP99HPq5Qlb8ygppBU2fabE2ur/Ur1RmT6oF1zHx6k2nt+sgDK/nB7k+/K6ZSNUUYuP8W94g5hqa3x+YQEPUN2pU3kfl+j4CHg7/D4gZxa7uUMNBpkgdYJKIzxa8+jPFR/A5alg6g8N5dRm06GmIZYBafVgrjzvTVM3II2j9VWlsNRwuhQzWB+bBmxe+KCPBObwzHZ8HnJZyMZoGwPP74V3yq2MExAXCMVrG7HydBNMaxkdsYI267aI+y5yMYWyKV4cwcClcjME+MuV8ghfKw3HzGvZj9CcSweBPykvYYM+O5ZDkGhWClBqePAEolL5WsdRiFuqfNP31rM6s7wOTS2q0jrCNdxfkK/YfyaUSOItXXm/RzbhURnijIa5Em3RW9cdjrG/zPeMaPo5+kwqCt/N1OgSgT7pU6AeBM5K1iVW+NUFU03T79GJzxPldPQp0NBoR/eEd6/geHl4TuzoxluM5EaIcT2wNM73vxkcEhYK0MAg4gqeki+xrZL97mR7Ww0afEVkHZmb/IABNvBWHwpqkfi56kF6SR/0W7j3R8dYOh9f8Wq+
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8832.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(83380400001)(7416002)(5660300002)(44832011)(8936002)(38350700002)(36756003)(86362001)(38100700002)(26005)(316002)(1076003)(6512007)(6506007)(54906003)(66476007)(8676002)(4326008)(66556008)(66946007)(186003)(52116002)(6486002)(107886003)(6666004)(478600001)(41300700001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8862
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	5bd28394-fba5-4e95-3b10-08db2ef980db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iwWZSdbAKEBo9qFwoT4yylusTqDwkESjdegp3u8UzqOr2PW81v2ZtSxR73+0nP0iex4hfV/YMDXxFlAd8sdVn/ZaspVDu1A+OxX02dwLzXh0Sx0kEL/h3PJ0RLT7qlxgq841LWP301wXHYClMsAZ10Wrv5i6EHdjNvApnQB3t5kphOlk7gr5F+lBd9jtYilnFEDQktLtKrd9Nq4WGSDOywnX85iocpQoeGkzB8ERmYIvkGTI/2gu1qCIijmTv6EE2D9iWL8fUypTlqQkI/k3ydIflgGdE54jDOFtePG1VDv2w9UCTYiaobhr8CKjwqK8eWctWUjzCRi44ic3HYHhT6lxaScsuQvNSc2ZMr0ReBccIPGioVHtH4yzYPcx3UPGox1Qxim2cVZqPNK4i/FKZUjGATzDygAQoCwNIvGQCNjMJCNcbut5pjHduIypzXFuK1y4qyGHEoHJiEcgQw7OHeUGz9Tzwb6bAIQ/dA0iiOhYEiaWBFeerNPaODg4DmEErrCnPTBen300JM7Myqm1dufjxLVaA33ZMAiI7lRVbLFmMmz0ZiMRzTBG94wlNeC4bTUKCg5FXJoRMNDeeYI46UKHT0xPLPcW7XR8EO1HC1cGHOfjijVQmWlymEACaMESe2UFUIoiG7Si4OXLZo1nbU17fOcxlcxkSgZfhDaFtMyygLcSZYHeVNrJC7ZyY8oOk7fKeNyQ3iN25tj1ONBVwSbmFm9ZtGy/X7abMmONsLo=
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39850400004)(451199021)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(336012)(86362001)(26005)(6506007)(1076003)(186003)(2616005)(83380400001)(7416002)(6512007)(44832011)(7596003)(356005)(7636003)(107886003)(8936002)(82740400003)(5660300002)(6666004)(6486002)(41300700001)(36860700001)(40480700001)(70586007)(34020700004)(4326008)(54906003)(2906002)(47076005)(70206006)(316002)(8676002)(40460700003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:29:14.9515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e02a0cb-42a8-4bc0-bd24-08db2ef98cfe
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8390
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

smp_call_function_single disables IRQs when executing the callback. To
prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
This is already done by qman_update_cgr and qman_delete_cgr; fix the
other lockers.

Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 drivers/soc/fsl/qbman/qman.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 739e4eee6b75..ff870ca07596 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1456,7 +1456,7 @@ static void qm_congestion_task(struct work_struct *work)
 	union qm_mc_result *mcr;
 	struct qman_cgr *cgr;
 
-	spin_lock(&p->cgr_lock);
+	spin_lock_irq(&p->cgr_lock);
 	qm_mc_start(&p->p);
 	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
 	if (!qm_mc_result_timeout(&p->p, &mcr)) {
@@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct *work)
 	list_for_each_entry(cgr, &p->cgr_cbs, node)
 		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
 			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-	spin_unlock(&p->cgr_lock);
+	spin_unlock_irq(&p->cgr_lock);
 	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }
 
@@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	preempt_enable();
 
 	cgr->chan = p->config->channel;
-	spin_lock(&p->cgr_lock);
+	spin_lock_irq(&p->cgr_lock);
 
 	if (opts) {
 		struct qm_mcc_initcgr local_opts = *opts;
@@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
 		cgr->cb(p, cgr, 1);
 out:
-	spin_unlock(&p->cgr_lock);
+	spin_unlock_irq(&p->cgr_lock);
 	put_affine_portal();
 	return ret;
 }
-- 
2.35.1.1320.gc452695387.dirty

