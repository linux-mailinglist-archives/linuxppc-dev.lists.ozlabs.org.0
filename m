Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26B5EE29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:12:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDM938Z7zDqDr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="n0omfFAU"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4v4L7nzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFNdC7m1i8uotIquKhicAzTe3cTAsKe+GtuQ3m5P6r0=;
 b=n0omfFAU9OlfOke2OVsdjc+QBqx8I1c62bqzsHLPbo3/1p+59pG11yuh2XBP1CFgpsCRJwueh2UGqxFRbznOvPwZZSgepg+ubq1dRTxTPYvIqqDHekj4nzYyqpsqIOX4vO7vcv/uCPR3qeNB7oRLJswWFCHvznLpVultKXMMbK4=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 20:59:36 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:36 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 6/7] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Topic: [PATCH v2 6/7] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Index: AQHVMeI4r3TjNVl6XUOD+mjo2lQ0Mg==
Date: Wed, 3 Jul 2019 20:59:36 +0000
Message-ID: <1562187548-32261-7-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: 2a074c9b-667a-4524-d6d5-08d6fff95ae5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:
x-microsoft-antispam-prvs: <VE1PR04MB64646A85341E6C87AACB2CD086FB0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:169;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(14454004)(2501003)(81156014)(81166006)(4326008)(478600001)(305945005)(8676002)(14444005)(2906002)(7736002)(50226002)(476003)(486006)(2616005)(446003)(25786009)(11346002)(3450700001)(86362001)(2201001)(68736007)(44832011)(36756003)(66946007)(26005)(66476007)(66556008)(64756008)(73956011)(71200400001)(71190400001)(66066001)(53936002)(6116002)(52116002)(386003)(6506007)(66446008)(8936002)(256004)(102836004)(186003)(99286004)(6486002)(5660300002)(110136005)(316002)(3846002)(6436002)(43066004)(6512007)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e/1X7oWlkcs+fMkVbF07zBq6XmYVAlleINYe+Q8rcG8V7Ug1DXXWXwrVJdzwga8AIk7svMI9f8uPG+wS6ONt1ebmM++0ETYVVzKotqzBT5qOByV7G1RoXkhhFI94GPPdjXtkW2y6TrjAJMpyQFBvVcV1XRx2kWY676aa5o3wB0HCNlvaGsNREa1ZolEKQbStNqlKdb21qtIFrwExonTxk7npXZinxFeAYNcghZt76C4dsNb5aV9gXZ28XTm/BbCQUMGEt+wpupojsF0L5wGjLL9bIFhErlMwGRHFpJWttTIp5fn9wPIKdbE5+OdscLorntoi0ufKC12+fB0QRE15mBJwQwc6Ow2uhERVigNii8y+tgNxQFuoqi4o9GFLJSsrtiofy1ltDU9Jm0pHIzBVhxwiM6XGiU5weUkG9iavMOU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a074c9b-667a-4524-d6d5-08d6fff95ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:36.0083 (UTC)
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

When shutting down a FQ on a dedicated channel only the
SW portal associated with that channel can dequeue from it.
Make sure the correct portal is use.

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/qman.c | 53 +++++++++++++++++++++++++++++++++++-----=
----
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 4a99ce5..bf68d86 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1018,6 +1018,20 @@ static inline void put_affine_portal(void)
 	put_cpu_var(qman_affine_portal);
 }
=20
+
+static inline struct qman_portal *get_portal_for_channel(u16 channel)
+{
+	int i;
+
+	for (i =3D 0; i < num_possible_cpus(); i++) {
+		if (affine_portals[i] &&
+		    affine_portals[i]->config->channel =3D=3D channel)
+			return affine_portals[i];
+	}
+
+	return NULL;
+}
+
 static struct workqueue_struct *qm_portal_wq;
=20
 int qman_dqrr_set_ithresh(struct qman_portal *portal, u8 ithresh)
@@ -2601,7 +2615,7 @@ static int _qm_dqrr_consume_and_match(struct qm_porta=
l *p, u32 fqid, int s,
=20
 int qman_shutdown_fq(u32 fqid)
 {
-	struct qman_portal *p;
+	struct qman_portal *p, *channel_portal;
 	struct device *dev;
 	union qm_mc_command *mcc;
 	union qm_mc_result *mcr;
@@ -2641,17 +2655,28 @@ int qman_shutdown_fq(u32 fqid)
 	channel =3D qm_fqd_get_chan(&mcr->queryfq.fqd);
 	wq =3D qm_fqd_get_wq(&mcr->queryfq.fqd);
=20
+	if (channel < qm_channel_pool1) {
+		channel_portal =3D get_portal_for_channel(channel);
+		if (channel_portal =3D=3D NULL) {
+			dev_err(dev, "Can't find portal for dedicated channel 0x%x\n",
+				channel);
+			ret =3D -EIO;
+			goto out;
+		}
+	} else
+		channel_portal =3D p;
+
 	switch (state) {
 	case QM_MCR_NP_STATE_TEN_SCHED:
 	case QM_MCR_NP_STATE_TRU_SCHED:
 	case QM_MCR_NP_STATE_ACTIVE:
 	case QM_MCR_NP_STATE_PARKED:
 		orl_empty =3D 0;
-		mcc =3D qm_mc_start(&p->p);
+		mcc =3D qm_mc_start(&channel_portal->p);
 		qm_fqid_set(&mcc->fq, fqid);
-		qm_mc_commit(&p->p, QM_MCC_VERB_ALTER_RETIRE);
-		if (!qm_mc_result_timeout(&p->p, &mcr)) {
-			dev_err(dev, "QUERYFQ_NP timeout\n");
+		qm_mc_commit(&channel_portal->p, QM_MCC_VERB_ALTER_RETIRE);
+		if (!qm_mc_result_timeout(&channel_portal->p, &mcr)) {
+			dev_err(dev, "ALTER_RETIRE timeout\n");
 			ret =3D -ETIMEDOUT;
 			goto out;
 		}
@@ -2659,6 +2684,9 @@ int qman_shutdown_fq(u32 fqid)
 			    QM_MCR_VERB_ALTER_RETIRE);
 		res =3D mcr->result; /* Make a copy as we reuse MCR below */
=20
+		if (res =3D=3D QM_MCR_RESULT_OK)
+			drain_mr_fqrni(&channel_portal->p);
+
 		if (res =3D=3D QM_MCR_RESULT_PENDING) {
 			/*
 			 * Need to wait for the FQRN in the message ring, which
@@ -2688,21 +2716,25 @@ int qman_shutdown_fq(u32 fqid)
 			}
 			/* Set the sdqcr to drain this channel */
 			if (channel < qm_channel_pool1)
-				qm_dqrr_sdqcr_set(&p->p,
+				qm_dqrr_sdqcr_set(&channel_portal->p,
 						  QM_SDQCR_TYPE_ACTIVE |
 						  QM_SDQCR_CHANNELS_DEDICATED);
 			else
-				qm_dqrr_sdqcr_set(&p->p,
+				qm_dqrr_sdqcr_set(&channel_portal->p,
 						  QM_SDQCR_TYPE_ACTIVE |
 						  QM_SDQCR_CHANNELS_POOL_CONV
 						  (channel));
 			do {
 				/* Keep draining DQRR while checking the MR*/
-				qm_dqrr_drain_nomatch(&p->p);
+				qm_dqrr_drain_nomatch(&channel_portal->p);
 				/* Process message ring too */
-				found_fqrn =3D qm_mr_drain(&p->p, FQRN);
+				found_fqrn =3D qm_mr_drain(&channel_portal->p,
+							 FQRN);
 				cpu_relax();
 			} while (!found_fqrn);
+			/* Restore SDQCR */
+			qm_dqrr_sdqcr_set(&channel_portal->p,
+					  channel_portal->sdqcr);
=20
 		}
 		if (res !=3D QM_MCR_RESULT_OK &&
@@ -2733,9 +2765,8 @@ int qman_shutdown_fq(u32 fqid)
 				 * Wait for a dequeue and process the dequeues,
 				 * making sure to empty the ring completely
 				 */
-			} while (qm_dqrr_drain_wait(&p->p, fqid, FQ_EMPTY));
+			} while (!qm_dqrr_drain_wait(&p->p, fqid, FQ_EMPTY));
 		}
-		qm_dqrr_sdqcr_set(&p->p, 0);
=20
 		while (!orl_empty) {
 			/* Wait for the ORL to have been completely drained */
--=20
2.7.4

