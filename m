Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD4A6CAEAC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pljby3bMjz3fZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 06:31:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OPsA7pKn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OPsA7pKn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::609; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OPsA7pKn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OPsA7pKn;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PljYv6HJTz3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 06:29:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW9AOsssbNQKo6G6+Q4EahP7gD20oUzEn+ReK8qxhiE=;
 b=OPsA7pKnYJQJS07u96xG45r3IDnG7Ig+ZlH70cl1oV9gbFEjEuDZMCOma3J2cYnLIABMHaq7DAVKVTeifJnTVLo+Gl0Low7ZLiMZ3MiorknZz8OSXVKSIZl3voZ5hNk/sn0ycfQKpGgyBCBNGtmZNOQ6CZGQB625KtYgYoICGeHzo3AnwHXS4bvI3rgfE+k1/THt2qJy5EkvThmseLnw9yQXXEzaguDFM77/gQE0Bg9RYZS1G/lfzRjrlCR2DLQPRG/WgMrHnMu/rEyWRchEd388MQ3MYpLz6e0F6EeppS8jlRFPMY91NEU28nKI0oYyL9laSgU23TxeL/hYRnVr+w==
Received: from FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::20)
 by AM9PR03MB6787.eurprd03.prod.outlook.com (2603:10a6:20b:286::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 27 Mar
 2023 19:29:19 +0000
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::36) by FR3P281CA0161.outlook.office365.com
 (2603:10a6:d10:a2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.16 via Frontend
 Transport; Mon, 27 Mar 2023 19:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 VI1EUR05FT025.mail.protection.outlook.com (10.233.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.23 via Frontend Transport; Mon, 27 Mar 2023 19:29:18 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 8D4322008088D;
	Mon, 27 Mar 2023 19:29:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.111])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 297BC2008006D;
	Mon, 27 Mar 2023 19:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGyo5TrklvpCt9WpvIZ2Rl8imeWpLcBNFe7FheJhtALorbUZXj3fJp7vprJu1VzO06oCrkAKjpq0ySSpBPYws/xHaItpw4O9WT1mk2HMc9Z/7Bhxx+AnYp24OL+fiCJcmuQTWtuqzPMUcKTe5JX7T3ic8/IYZ1VPnAWnIzm/O1JFiV5nh11OEL/KWrL2RcctSbG+5UUlgkNFOgHcs7XEeyumkwRpAhcLqujulFEv6B//BoD+1TwsIzNkvehz3uIE6zAsNHd5fRC0x9KUKDNxxPx04wMJrs5mGmIVUJ/IbrHRKczeuSAp8l6N317fDy1fI5vDVo2Hi+hyVLQaSbM8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW9AOsssbNQKo6G6+Q4EahP7gD20oUzEn+ReK8qxhiE=;
 b=aYRjjBM3XBPCb58J3AyvcKEimR2l+7XkeJ50TlV4yOA7LeNz9Ir81JT/0ao9lUx3SJWoB0OtZDoAYZ121+vLJKHoR4mu6taRMpfZYx0VQ+MIXh/Rtls2tgPpT9bdgBV9DqHAIMdWKvvWlpXGkw/NjSQONQ+T8aCN1J+wnawseBSHb0BiKJuj+fQSxPmjhpMWeYDV89Z2A4PMeZgKif4T2i4WjSeZd5+NFTIQlfYcgQsP41yq1s6W+dVht2SmDbXGmfXnIignUgrpHtCiuU/X+NytaITd5MYsT1zeX/meFTyMlKzEpLWiJMRComk6NHMQK/6ORtADg0lMmpfkK69wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW9AOsssbNQKo6G6+Q4EahP7gD20oUzEn+ReK8qxhiE=;
 b=OPsA7pKnYJQJS07u96xG45r3IDnG7Ig+ZlH70cl1oV9gbFEjEuDZMCOma3J2cYnLIABMHaq7DAVKVTeifJnTVLo+Gl0Low7ZLiMZ3MiorknZz8OSXVKSIZl3voZ5hNk/sn0ycfQKpGgyBCBNGtmZNOQ6CZGQB625KtYgYoICGeHzo3AnwHXS4bvI3rgfE+k1/THt2qJy5EkvThmseLnw9yQXXEzaguDFM77/gQE0Bg9RYZS1G/lfzRjrlCR2DLQPRG/WgMrHnMu/rEyWRchEd388MQ3MYpLz6e0F6EeppS8jlRFPMY91NEU28nKI0oYyL9laSgU23TxeL/hYRnVr+w==
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
 19:29:00 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Date: Mon, 27 Mar 2023 15:28:41 -0400
Message-Id: <20230327192841.952688-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230327192841.952688-1-sean.anderson@seco.com>
References: <20230327192841.952688-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0319.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::24) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	AS8PR03MB8832:EE_|GV1PR03MB8862:EE_|VI1EUR05FT025:EE_|AM9PR03MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: df46f40d-48a9-45a0-34ae-08db2ef98f5b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  GLfQlvDM4soX6MVVLoP9IiOP3t+urYozKynNFjz2GK0vy5rKy+5Fviu4BUj1TI26Xq5jnvellbOD6SN0JkUQq9/B/9XK5sk+aKdh4LO362R5JqVX48R33D8xtOx5vAlI07UiVKkNhWk31ECtwVLNDmZP98cf2heoJQp6O763wtbu5dHZlNBAE6Uj2HbzUePUKmcXQoensCfX4T4b+mUuD5tK3KdRCN0X1qWh7/HPtU7Cu1D50jpVj4tPB4Pp0p39EVb8RcrfiKsl5RnfZSbNp3omzEYH+VWlbRovCPepbScLrAfUOHdgZtGeBZZ81w0ImltH5jqNCscQBOwNUJ+WBUOqG188zcFuzU0gaQxqZ8d8y6Sll1nvuTiB7U3FTlU1f2Z/q5v+S0khTrZHF0Z1Nyu45L4/5HoZW3iTQXyB5UCBylc88banHId+i+BpOtUD6FeS66TrQOamzMv4ZpNnFycN5YQtCY+QhZCCpyb+1YJdd7Tw0WTmMTGxwScK85o4WRAH2dWP11mgkuKfqCAgR9nbIEAGAZchO3q0ooNeuBG9MWisu4rdYDP0n3zLDc+FczCjmjswDgPwYMr4u1UEcPyAMazP4DnXIVN7pO3HPNQ=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8832.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(83380400001)(7416002)(5660300002)(44832011)(8936002)(38350700002)(36756003)(86362001)(38100700002)(26005)(316002)(1076003)(6512007)(6506007)(54906003)(66476007)(8676002)(4326008)(66556008)(66946007)(186003)(52116002)(6486002)(966005)(107886003)(6666004)(478600001)(41300700001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8862
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	0d62b9a4-8886-4e56-b87e-08db2ef98245
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mSdftN0SFItLE7ikmqMAz0+DMvOeHLXP6XBN3SCZlEZfWHIalWCvvkOUYujv9os5GINdKSPjXRIzE5fRyfaMZy7Ll/fniwgB9FPdESJQEI7somHzCJunjy0fzeifER/JlVAFHsU/xysMXPvmaPOSX2ss/5xbDBj5/6c/ih5ezFfmf4Qr0rhJC8yjo9h7wX/AmdESml2UtltWMjjITntidq9ch+hsgKD6XY58HziNlyUywjcUiktzhaf75tbVwIq2AeDb4/WBUlv7Yrjd6LLVU8NA43duaeyWDE5JSjxN+QLRD9Ur+tml7mqSLJNXEVWXNI5sdG5FM9RhnhiOlIbXY/G0r6b7DynGFuIF2n1EN64pFPsjIf3Sc12Y+6ZzVskWXRAdALYEvNu6IB/jYZlFnWbnn2vMmgufDtbhvdr2QaVMAap4d679B1zopKdZsMu7B6qt79V9q7Rs6+i757oljMOl2QbpeUeRWFqn3BUAWlfA+SyXX4799ARiVBdZvtgRplERjsm1Qfp42QkfzvCqq6Hmnj6AAEVs/7o7tTHiLK9ZgIlKJ0ef4jhlY2FBOSWwQdLKOMev1y9kkP9JqW7RHIU6htmfF3V3Uq7z4n2K1sSC38yVIGB6610SJi7cq+KI3yvgrMqf/xmC9XJh8bljK66yWM439j1MG6EUuGag+4UKCXRlNc1ZkaGSBnIc5LQhxrPdbkTVUqFvXQzhZt5iGg+N+KMTKywDLCciaBkgpi4=
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(39850400004)(376002)(451199021)(46966006)(36840700001)(40470700004)(54906003)(36756003)(82310400005)(40460700003)(40480700001)(478600001)(70586007)(70206006)(8676002)(4326008)(34020700004)(316002)(36860700001)(26005)(107886003)(6512007)(1076003)(6506007)(186003)(83380400001)(336012)(2616005)(47076005)(6666004)(6486002)(966005)(41300700001)(86362001)(82740400003)(7416002)(5660300002)(44832011)(7636003)(7596003)(8936002)(356005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:29:18.8817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df46f40d-48a9-45a0-34ae-08db2ef98f5b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6787
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

 drivers/soc/fsl/qbman/qman.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index ff870ca07596..cf8606108a81 100644
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
-		spin_unlock(&p->cgr_lock);
+		raw_spin_unlock(&p->cgr_lock);
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

