Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2B5EE1F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:10:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDJt08sSzDqJ1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:10:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="i4hKdNtK"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4t1x4GzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgUxk8dTq2mwEo0f64PnQenk2A+dVjDkixjbOZafERk=;
 b=i4hKdNtKsjKexZmvTrhMprGAYoj0eBvAFHOy9AAmSgXf3PmuEBZvtcXPExgiAmmXlRV2S283GKjdLPwrJw45pxy2uIwioT6feAvN2mUGKD2zjmtGS+ACgZ+ImUop7jHi2vsAJJcMjAG9gIAanSZbu00Y/yqu4KI34IMJaXFEj3k=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 20:59:34 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:34 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 5/7] soc/fsl/qbman: Disable interrupts during portal
 recovery
Thread-Topic: [PATCH v2 5/7] soc/fsl/qbman: Disable interrupts during portal
 recovery
Thread-Index: AQHVMeI3m+zN+6qPYUWl0LfMgTCdFQ==
Date: Wed, 3 Jul 2019 20:59:34 +0000
Message-ID: <1562187548-32261-6-git-send-email-roy.pledge@nxp.com>
References: <1562187548-32261-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1562187548-32261-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN6PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:805:16::18) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d39507a1-14ce-4117-e6e0-08d6fff959be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:
x-microsoft-antispam-prvs: <VE1PR04MB6464D0F382604B426D56919086FB0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(14454004)(2501003)(81156014)(81166006)(4326008)(478600001)(305945005)(8676002)(14444005)(2906002)(7736002)(50226002)(476003)(486006)(2616005)(446003)(25786009)(11346002)(3450700001)(86362001)(2201001)(68736007)(44832011)(36756003)(66946007)(26005)(66476007)(66556008)(64756008)(73956011)(71200400001)(71190400001)(66066001)(53936002)(6116002)(52116002)(386003)(6506007)(66446008)(8936002)(256004)(102836004)(186003)(99286004)(6486002)(5660300002)(110136005)(316002)(3846002)(6436002)(43066004)(6512007)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b2tb+cnlCGLO6Cr4cDnbpjigDcG8OxQWhJ7ZLckKI2XbMqk9j9QhyHHDUAiP7to7/z68wuWYwah8Iq6qiElouoosgn9Gy+TSQHlIRHNkf+hmEeLnrtSRsTQVqbXEIKGd4JwE8os5lvYtbnUrzjp5+TmX5/tgsFXrwz+UHbVKmKxUpziHmRrPTKnHE3wgWHQPKL9KpfSomwB2izTrvZAS4LZpg32PjHG4NxAWgS15qRnBPMXzwGyOKq7vDgNFjm1XcidGcDXIA5BDhqKy/0fg2MbcsU6B9ReKdffW53TyeHR6VM4kbbqIF+ye0DiWOpxmvkLKFT9kMerd+M67WXeeTuMb4TneyNzBARUanaqWqDhTBspnLwbr51hEibCy1pg/L3+EE0fcPv0498fBwPLaiXretD05/ggs0moMvfCAYF8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39507a1-14ce-4117-e6e0-08d6fff959be
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:34.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6464
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
Reply-To: Roy Pledge <roy.pledge@nxp.com>
Cc: Roy Pledge <roy.pledge@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Disable the QBMan interrupts during recovery.

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/qman.c      | 22 +++++++++++++++++++---
 drivers/soc/fsl/qbman/qman_ccsr.c |  1 +
 drivers/soc/fsl/qbman/qman_priv.h |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 2989504..4a99ce5 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1070,6 +1070,20 @@ int qman_wq_alloc(void)
 	return 0;
 }
=20
+
+void qman_enable_irqs(void)
+{
+	int i;
+
+	for (i =3D 0; i < num_possible_cpus(); i++) {
+		if (affine_portals[i]) {
+			qm_out(&affine_portals[i]->p, QM_REG_ISR, 0xffffffff);
+			qm_out(&affine_portals[i]->p, QM_REG_IIR, 0);
+		}
+
+	}
+}
+
 /*
  * This is what everything can wait on, even if it migrates to a different=
 cpu
  * to the one whose affine portal it is waiting on.
@@ -1269,8 +1283,8 @@ static int qman_create_portal(struct qman_portal *por=
tal,
 	qm_out(p, QM_REG_ISDR, isdr);
 	portal->irq_sources =3D 0;
 	qm_out(p, QM_REG_IER, 0);
-	qm_out(p, QM_REG_ISR, 0xffffffff);
 	snprintf(portal->irqname, MAX_IRQNAME, IRQNAME, c->cpu);
+	qm_out(p, QM_REG_IIR, 1);
 	if (request_irq(c->irq, portal_isr, 0, portal->irqname,	portal)) {
 		dev_err(c->dev, "request_irq() failed\n");
 		goto fail_irq;
@@ -1290,7 +1304,7 @@ static int qman_create_portal(struct qman_portal *por=
tal,
 	isdr &=3D ~(QM_PIRQ_DQRI | QM_PIRQ_MRI);
 	qm_out(p, QM_REG_ISDR, isdr);
 	if (qm_dqrr_current(p)) {
-		dev_err(c->dev, "DQRR unclean\n");
+		dev_dbg(c->dev, "DQRR unclean\n");
 		qm_dqrr_cdc_consume_n(p, 0xffff);
 	}
 	if (qm_mr_current(p) && drain_mr_fqrni(p)) {
@@ -1303,8 +1317,10 @@ static int qman_create_portal(struct qman_portal *po=
rtal,
 	}
 	/* Success */
 	portal->config =3D c;
+	qm_out(p, QM_REG_ISR, 0xffffffff);
 	qm_out(p, QM_REG_ISDR, 0);
-	qm_out(p, QM_REG_IIR, 0);
+	if (!qman_requires_cleanup())
+		qm_out(p, QM_REG_IIR, 0);
 	/* Write a sane SDQCR */
 	qm_dqrr_sdqcr_set(p, portal->sdqcr);
 	return 0;
diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman=
_ccsr.c
index fcf77e0..8d17643 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -735,6 +735,7 @@ int qman_requires_cleanup(void)
=20
 void qman_done_cleanup(void)
 {
+	qman_enable_irqs();
 	__qman_requires_cleanup =3D 0;
 }
=20
diff --git a/drivers/soc/fsl/qbman/qman_priv.h b/drivers/soc/fsl/qbman/qman=
_priv.h
index a8a35fe..fd1cf54 100644
--- a/drivers/soc/fsl/qbman/qman_priv.h
+++ b/drivers/soc/fsl/qbman/qman_priv.h
@@ -279,3 +279,4 @@ int qman_shutdown_fq(u32 fqid);
=20
 int qman_requires_cleanup(void);
 void qman_done_cleanup(void);
+void qman_enable_irqs(void);
--=20
2.7.4

