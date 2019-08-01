Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96997E43F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 22:32:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4602624d7xzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.88; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="H16RaiNA"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4601mV2ZSRzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:17:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoNRLTakm2mLa5gjrj2GknS5zvtR9WZLzPG0DMOFc1SZ2UPxoAazpkKjnmP+SF+iD7ixL3v1JSueHbixVX9Ap+IeVWPM0uByD3Z7PK07lU3n6a9327rIIVEf1AWGgcHOF9mFEeqrd0fFptGt+K1bg7HMG9V8k0EcLEX7ET66WdFjwGk7mSK0rPBvgone1RYouveLaNfvUP+vjr1Sdw3IQz+YY4xlgjPWpR3CsK518/IzTpiXf41pQ9NswcUxup+TG/AUMDzt66mnEzfSpXZX4lBlIfmEsFS9Rb4fySY+xIvkNOYBz4isBMoFyuRETgo4rKrsXgekEdrJzSlWInonlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFNdC7m1i8uotIquKhicAzTe3cTAsKe+GtuQ3m5P6r0=;
 b=WcH5rlH8o9WlABDdaKvYdFAXoA3DTW7Klv8QbfKEPepMsXv2/7JvSrfV0RXXhCN7X3qu/YDxA8XRGzIKGC7pMS0A2RE/z7o5pPZ5ZjWHoNTUtLaGGairkJiM6YVaP4D4uAT6jUCLi4gb6roVGjwIEmrmaJEtdVOSnTR4MGU3FaUsXnRDX61z6IaIAoZ1LOZ1qH+WnlWFItlVbo1M+s0idGBzAcy6S3/yZ25UOhDDlL0T4XPTGZHQO0HWD2QKPJiGWbaXeF2sQLlCsnJKvunDa/OnxblXPP9Hr18bHhYhKRFsTMbHMync17RdN59oCczebYTS3cVJ970qLrzBylpe9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFNdC7m1i8uotIquKhicAzTe3cTAsKe+GtuQ3m5P6r0=;
 b=H16RaiNA+5OQTNuASjupLhv2ffuQj5SAcEvuQwGmx2mZw4EjOMb1PkV3Ye0sOgwK0b30QQO8Pdjo0m0WoIZmGN/ThBW5T0FnbzTZirDO3hrPyz4QNvZWTPv9gVAt1hwuH3fhR5bcz9/8W6YK5D46buXkzIgLfvt0B7DZrVMamRg=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6656.eurprd04.prod.outlook.com (20.179.235.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 1 Aug 2019 20:17:03 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 20:17:03 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v3 6/7] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Topic: [PATCH v3 6/7] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Index: AQHVSKYVfyP8LV3Wb0W4Ptye+S3eRA==
Date: Thu, 1 Aug 2019 20:17:03 +0000
Message-ID: <1564690599-29713-7-git-send-email-roy.pledge@nxp.com>
References: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9183e2e-cfd8-4309-8944-08d716bd37c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6656; 
x-ms-traffictypediagnostic: VE1PR04MB6656:
x-microsoft-antispam-prvs: <VE1PR04MB66567467DE5C4F86C185860B86DE0@VE1PR04MB6656.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:169;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(386003)(6506007)(305945005)(7736002)(71200400001)(71190400001)(68736007)(14454004)(36756003)(54906003)(316002)(110136005)(6116002)(3846002)(486006)(186003)(66066001)(6436002)(256004)(26005)(2201001)(6636002)(3450700001)(44832011)(6486002)(102836004)(2906002)(14444005)(446003)(476003)(2616005)(50226002)(64756008)(66446008)(66476007)(25786009)(81166006)(66946007)(52116002)(5660300002)(11346002)(76176011)(478600001)(66556008)(8676002)(86362001)(81156014)(8936002)(99286004)(6512007)(4326008)(2501003)(53936002)(43066004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6656;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EKsiJnCRT35QsFyGTlm1AUETqdThP2sDKB1DCSxi166ZxC5+twCGT+A1GMKxtMaqIdHeXNv2DYj7BtfMC9mc7K+VkfR879MH/xF+M1+JM6e4RWA9RazSFbedg0SazrSJSbsPHdpAw+HiGm95pfMQMxQllfcvFnMKrogfcu87cSUKKyKp/nRWFiw78BpxIiSQSW0z2kPyt8saueB4uZYAEbRiaZCHSUrZhJRi3AN1qAamwAT9ReGfjvllAfK/UYQkvVu1BzTLtuZtMofvxLD8EtL7DYbgA4eovlJ0yu0DwaEz9SpjoEwIpOEV6JwUEAlvhOTUcegRsk1Ax9TY/zyDdOkoQPtzDQ+aSZ5CcMwswAgeDXJBXqOQWM4qECcfoELuM97RSItlFMxCcIc6QD9l8oJqi7iPAO3tav7lfIpvub4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9183e2e-cfd8-4309-8944-08d716bd37c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 20:17:03.8393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6656
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
Cc: Roy Pledge <roy.pledge@nxp.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
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

