Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE55EE0C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:01:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fD7J4ZsVzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.82; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="GTJzXA6i"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4m38dJzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvsWJrvejOHxRClN3xZ1gkKefbbL+X6CPpVlIbOXHYc=;
 b=GTJzXA6ir3gFOEEfmpkarS4nFiqdXecrfHwOfYRCOCvcP9yI8Vie68AbRw9+OlB7M50RGW+dII71bALretx7HWkzW2DYb7BvniftqsBUDktYTVG2du/pK5xtMWsaEH0pqfhd9uhJPqHd7X4Ybx+rnGrlELuNCfEQoEFj0imLJrE=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6592.eurprd04.prod.outlook.com (20.179.234.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Wed, 3 Jul 2019 20:59:30 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:30 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 3/7] soc/fsl/qbman: Cleanup QMan queues if device was
 already initialized
Thread-Topic: [PATCH v2 3/7] soc/fsl/qbman: Cleanup QMan queues if device was
 already initialized
Thread-Index: AQHVMeI1E8Yqep3QnkaAT4Gy8a4rQg==
Date: Wed, 3 Jul 2019 20:59:30 +0000
Message-ID: <1562187548-32261-4-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: dc1c4512-6da9-4399-df53-08d6fff95779
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6592; 
x-ms-traffictypediagnostic: VE1PR04MB6592:
x-microsoft-antispam-prvs: <VE1PR04MB659261256A3841F9EF70218286FB0@VE1PR04MB6592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(2616005)(6636002)(52116002)(2201001)(446003)(86362001)(476003)(7736002)(11346002)(110136005)(44832011)(3450700001)(256004)(6486002)(478600001)(5660300002)(305945005)(486006)(99286004)(14454004)(316002)(43066004)(66446008)(66946007)(73956011)(6512007)(8936002)(50226002)(81166006)(81156014)(3846002)(26005)(6116002)(71200400001)(186003)(71190400001)(2501003)(68736007)(64756008)(53936002)(386003)(66066001)(25786009)(8676002)(102836004)(76176011)(66556008)(6506007)(2906002)(66476007)(36756003)(4326008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6592;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dRiOS99F3NK1mL8s5JFdD178voaZR/v23tvnZ3N+aQoDbJgsylRiYpUY7JT845GgiYHbSW1YR625ai9SEB+8C50ercoBEymX4gqFQGQxPa5jEMEkiAkz0spaCtSJS8ppjA628ap4AUSxMsZuzZlaZ2QvXjKqo5o+kUEFK9FWEnu48DJhAfrd9BBhHSVDqBoQ2ICVsXsVWCwcrk33cJGj9tJTK1s1zCSY/GuinnNCAiOLt5EdnRRdn83Uw870nTTrOu0zf2u1y62urEiQoerOLebTSkZc6JRn5xCQ50NkG1jUKSQv2b0TnHQPBItQf4Gsn9MRNyFFRdLerjEwkDYWBqduf72QTtAa4TwtjEMUgsnM7ZIsnBynmHuokFXQqc2iBvm01v5DbSpQ11ev7Zpmqk5enN9zU6DLI3DQlTJ6qP4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1c4512-6da9-4399-df53-08d6fff95779
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:30.2326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6592
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

If the QMan device was previously initialized make sure all the
frame queues are out of service once all the portals are probed.
This handles the case where the kernel is restarted without the
SoC being reset (kexec for example)

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/qman.c        |  4 ++--
 drivers/soc/fsl/qbman/qman_ccsr.c   | 13 ++++++++++++-
 drivers/soc/fsl/qbman/qman_portal.c | 18 +++++++++++++++++-
 drivers/soc/fsl/qbman/qman_priv.h   |  7 +++++++
 4 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 636f83f..f10f77d 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -2581,7 +2581,7 @@ static int _qm_dqrr_consume_and_match(struct qm_porta=
l *p, u32 fqid, int s,
 #define qm_dqrr_drain_nomatch(p) \
 	_qm_dqrr_consume_and_match(p, 0, 0, false)
=20
-static int qman_shutdown_fq(u32 fqid)
+int qman_shutdown_fq(u32 fqid)
 {
 	struct qman_portal *p;
 	struct device *dev;
@@ -2754,7 +2754,7 @@ static int qman_shutdown_fq(u32 fqid)
=20
 		DPAA_ASSERT((mcr->verb & QM_MCR_VERB_MASK) =3D=3D
 			    QM_MCR_VERB_ALTER_OOS);
-		if (mcr->result) {
+		if (mcr->result !=3D QM_MCR_RESULT_OK) {
 			dev_err(dev, "OOS fail: FQ 0x%x (0x%x)\n",
 				fqid, mcr->result);
 			ret =3D -EIO;
diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman=
_ccsr.c
index 39f6fc1..fcf77e0 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -483,7 +483,7 @@ RESERVEDMEM_OF_DECLARE(qman_pfdr, "fsl,qman-pfdr", qman=
_pfdr);
=20
 #endif
=20
-static unsigned int qm_get_fqid_maxcnt(void)
+unsigned int qm_get_fqid_maxcnt(void)
 {
 	return fqd_sz / 64;
 }
@@ -728,6 +728,17 @@ int qman_is_probed(void)
 }
 EXPORT_SYMBOL_GPL(qman_is_probed);
=20
+int qman_requires_cleanup(void)
+{
+	return __qman_requires_cleanup;
+}
+
+void qman_done_cleanup(void)
+{
+	__qman_requires_cleanup =3D 0;
+}
+
+
 static int fsl_qman_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qm=
an_portal.c
index 75717bc..153727c 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -233,7 +233,7 @@ static int qman_portal_probe(struct platform_device *pd=
ev)
 	struct device_node *node =3D dev->of_node;
 	struct qm_portal_config *pcfg;
 	struct resource *addr_phys[2];
-	int irq, cpu, err;
+	int irq, cpu, err, i;
 	u32 val;
=20
 	err =3D qman_is_probed();
@@ -328,6 +328,22 @@ static int qman_portal_probe(struct platform_device *p=
dev)
 	if (!cpu_online(cpu))
 		qman_offline_cpu(cpu);
=20
+	if (__qman_portals_probed =3D=3D 1 && qman_requires_cleanup()) {
+		/*
+		 * QMan wasn't reset prior to boot (Kexec for example)
+		 * Empty all the frame queues so they are in reset state
+		 */
+		for (i =3D 0; i < qm_get_fqid_maxcnt(); i++) {
+			err =3D  qman_shutdown_fq(i);
+			if (err) {
+				dev_err(dev, "Failed to shutdown frame queue %d\n",
+					i);
+				goto err_portal_init;
+			}
+		}
+		qman_done_cleanup();
+	}
+
 	return 0;
=20
 err_portal_init:
diff --git a/drivers/soc/fsl/qbman/qman_priv.h b/drivers/soc/fsl/qbman/qman=
_priv.h
index 0451571..a8a35fe 100644
--- a/drivers/soc/fsl/qbman/qman_priv.h
+++ b/drivers/soc/fsl/qbman/qman_priv.h
@@ -272,3 +272,10 @@ extern struct qman_portal *affine_portals[NR_CPUS];
 extern struct qman_portal *qman_dma_portal;
 const struct qm_portal_config *qman_get_qm_portal_config(
 						struct qman_portal *portal);
+
+unsigned int qm_get_fqid_maxcnt(void);
+
+int qman_shutdown_fq(u32 fqid);
+
+int qman_requires_cleanup(void);
+void qman_done_cleanup(void);
--=20
2.7.4

