Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9016D23CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3lz4Gwrz3fYl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:16:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p+R1crxv;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p+R1crxv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::62d; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p+R1crxv;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=p+R1crxv;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp3k73dCLz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:14:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTRXVlpbEuCBH9k+NARDJqadbWm40OuAkQ7QWg4d2WQ=;
 b=p+R1crxvH6BEL7lPRIqGYZmR5v5AbKB2znYcrdvFNwP23jCliH3DBv6miHbsj1rXm4HQ56O55J3y5GVaboCd/AtU+fEtFuD+svCyB5jSGZKR97cAxtDHw09oI0E/rdHZTe3kjy3zNkIw/etSo5zQgcn1aCXYb2uVIYsBH08u4f10T3lPfJ5Cq1kBiJR1qJHMLMmITXx07kqucWDobLsnBCekEklGPKi0Vhus3JXOq5P7QJOK0p84zsMRwT0uN9xmZqqBLmqAn4BaQ8bNlSTYd9T8GnYFRlop4KEroizjmvqHf7dXRz0tRm52LtL2GYB5RfOD9BtCZ3zTiF+ZjJkh2g==
Received: from ZR0P278CA0106.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::21)
 by PA4PR03MB7071.eurprd03.prod.outlook.com (2603:10a6:102:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 15:14:35 +0000
Received: from VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:23:cafe::81) by ZR0P278CA0106.outlook.office365.com
 (2603:10a6:910:23::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 15:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT033.mail.protection.outlook.com (10.233.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.39 via Frontend Transport; Fri, 31 Mar 2023 15:14:34 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 11F4C2008026F;
	Fri, 31 Mar 2023 15:14:34 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [104.47.2.51])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 01FB02008006E;
	Fri, 31 Mar 2023 15:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLeNXYhcFiAA4cfPlhIFc/XFTdwXECKysiSS/m11yfkwoikNfkRxGWdGN7YPyLUYYLOVaoxYQ4haTm4oAUFh6xIKGPiCsOUQFJrNXhoweVWeFPpxR4GMjXBNnydw+z3DQzazAfQQvlFRAzOdROplQuZ6yM58vBNp1UvEyHsjpkjLUyYx+PibKagqcIudDC0axwrkwQOGDTEKwMtuGa3dNTQYIAElYjzzI2i9uTm93huwmkwCHIscQ8FEsvAKdZiuH1M7ArgcJI3PhyvCierfmLOqycAUWwy8hL5cI3ENWXocY0L4D9J3p3t1FSbwpGsPPAjkmzpnFXI/I590CQDbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTRXVlpbEuCBH9k+NARDJqadbWm40OuAkQ7QWg4d2WQ=;
 b=FAMGoMqSqJi014cCBlRgJZxEkqXIk1Gyi/ya1ueB2AsRsLKrffV1Cvm1xEW4T1XYWV/bwe47as333Alaqi1bE4FQqLznxCGs2Bs66AlWzXtQCb5Zi3Yr9uRwa2dBkGrIRvsPf/t0R8cJf+byp0gPFY6TTKSbzyTLY8DhtM0S78yMpdPK42SZ46h5Nsln+ExNrHjXj1urX4pS/VTcectA6aXrbRrjcTpnWcq8/zmxsbnOxovULfWwRw+NS2eBqLjw1X8HDvqJXf4H3fI4CVvl7rJPn/o5ojqUYRn24vhDNMfklWKEw17IKsb16psPRM/9854FbfEQv/WqED9xf1h2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTRXVlpbEuCBH9k+NARDJqadbWm40OuAkQ7QWg4d2WQ=;
 b=p+R1crxvH6BEL7lPRIqGYZmR5v5AbKB2znYcrdvFNwP23jCliH3DBv6miHbsj1rXm4HQ56O55J3y5GVaboCd/AtU+fEtFuD+svCyB5jSGZKR97cAxtDHw09oI0E/rdHZTe3kjy3zNkIw/etSo5zQgcn1aCXYb2uVIYsBH08u4f10T3lPfJ5Cq1kBiJR1qJHMLMmITXx07kqucWDobLsnBCekEklGPKi0Vhus3JXOq5P7QJOK0p84zsMRwT0uN9xmZqqBLmqAn4BaQ8bNlSTYd9T8GnYFRlop4KEroizjmvqHf7dXRz0tRm52LtL2GYB5RfOD9BtCZ3zTiF+ZjJkh2g==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB9662.eurprd03.prod.outlook.com (2603:10a6:10:458::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 15:14:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 15:14:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] soc: fsl: qbman: Always disable interrupts when taking cgr_lock
Date: Fri, 31 Mar 2023 11:14:12 -0400
Message-Id: <20230331151413.1684105-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:91::26) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB9662:EE_|VI1EUR05FT033:EE_|PA4PR03MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 7351cecb-8b40-41c2-051d-08db31faa2e6
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  cbVSpMOOVb/NFEnKYpqZyiNznc2YR2/H81WYnu7GOumO4XcOGsHuA+oicVwSe//9Bzle+TDtT4NqaeZbDa6bCFkhBos0KRA335/NPdoaAB3zUKeIj2QPfrC7dES7PNc9u1MgsoFYhExqbw8b/f8suG12EdIW/I6pXKj699HAeYDI90cHSCocJB0UKArEEEzBF0SF6VpcHpRExNie7RBP7kbILcDdqT8U3mzvadYAEJVCmgC3oo98uBhVGDNjU8njDAmoStu5KwPdN217TqgBl/OVCUvVuvhOinpB0i01LkMJniKdVk07IQUhZuHR9Gn4d1G+H98yQfC/JOs9mWEyewKKcvO+na8UhkeSRCeXXB6GDAgl6kxlcAiGvq+vmSAYU/6oe4hNW/vIqyJsMJIXE67dp4y0Y8V3O/hge22cSm5eQMmm5JlT0tfTWhcFvzELZ/veOg7iSoqdc1UY+I0vShisd87QsnuEzadR8D1NCl8hOSu3AwQurzFSsopxSxqqKr/wmexK04PYMyZJVdzpde/1g5U+v5Lfq7cEFltSpWkF431FYKxFVlWCokstmupAjTIcNGdjWk2FFiKKz/SL6AENN15jPyNiXsRG9nbEBqStowWc17OhmiPTrBMl5JUN
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39850400004)(346002)(366004)(136003)(451199021)(478600001)(54906003)(83380400001)(2616005)(26005)(1076003)(6506007)(107886003)(6666004)(6512007)(6486002)(4326008)(66556008)(8676002)(66476007)(316002)(66946007)(52116002)(186003)(5660300002)(41300700001)(7416002)(44832011)(38350700002)(38100700002)(2906002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9662
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f9cda0ad-29f9-4209-9d53-08db31fa9e48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WdF3gUppxqV6BEILhUC5ic6IOt0bec9+aH3Lbs127+9iH12hfHesdk5kRUkztQdEpaYyj6otETe/1M2bjS5nPOz96o7PMD4n5CFfypPLCqexEMTQ3K8HREt90LrkhIx+IMJNfvj8h7cFYhGMwxObcbeMJqiNhM/MXc3ixGo+lpl8uadFj7UuABGqcoVAF5K2+7awIfZ0Taxtf2A+pRtVKbCi0mqtq71YfgreowRQhjDNPFWTZroif393PeF78chhiBkj6eOG8ojadvLdkRwNizYD2nzJ29P84QSLMyl6d4eOM6+xHTwm1BgsUg/M51UiqokwlQ6CBgC1PD34PEyHporZERqKqyvnVmnf3QVmbElVTOWf7VOQOONVoJj0hUtHX14hD26siitT+iBpVckuU+Gnpa/G6JB8P80NYXiOX6vIXsHkuannPHD7tkDQ3WNEU9iMX5OfE8YEDdK9A+7JC5+XKTanin1MfG5SK86LZE3WSCqLOBjT6ARonk/clTy/sdPG/QmhfxZ7r3yUaOk52q0cUBKpq/20Br4FgDRSVqIqdgVIN9tL4QUmZNisFhNpu0Hr1/b7rEhQN/uT9pfE1CyLfk5UtydvZDuvbMX6lAOCq+sCDLlMHPmGP8OscbK+Thkheuz+3RoMeysuaoq4ZcKPqm3soms2tuBPW8AxiZb1djbjh5p6MLQtRMSLvo/fQti6CtG4EQoUPEbRu1doaLnoKvbpn9ZRH4GW7BbN1GE=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(39850400004)(346002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(2906002)(44832011)(7416002)(5660300002)(8936002)(4326008)(70586007)(8676002)(40460700003)(316002)(36756003)(478600001)(41300700001)(70206006)(6486002)(40480700001)(54906003)(186003)(7596003)(6512007)(356005)(6506007)(26005)(2616005)(107886003)(336012)(1076003)(82310400005)(7636003)(6666004)(86362001)(83380400001)(47076005)(34070700002)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 15:14:34.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351cecb-8b40-41c2-051d-08db31faa2e6
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7071
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

Changes in v2:
- Fix one additional call to spin_unlock

 drivers/soc/fsl/qbman/qman.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 739e4eee6b75..1bf1f1ea67f0 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1456,11 +1456,11 @@ static void qm_congestion_task(struct work_struct *work)
 	union qm_mc_result *mcr;
 	struct qman_cgr *cgr;
 
-	spin_lock(&p->cgr_lock);
+	spin_lock_irq(&p->cgr_lock);
 	qm_mc_start(&p->p);
 	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
 	if (!qm_mc_result_timeout(&p->p, &mcr)) {
-		spin_unlock(&p->cgr_lock);
+		spin_unlock_irq(&p->cgr_lock);
 		dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
 		qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 		return;
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

