Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CF11D32A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:07:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YgGL5JSLzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:07:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.78; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=youri.querry_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="cIMr15R9"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yg7K5fXnzDr48
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:01:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJyf3QAoMIWW+k9uQJlgYBmbLMTytnzictf6h+Q5Y5+GHNtEPh+f82fngzQD7SGij2To2f50c6VKLMVqQykk4ZJdCrHcU4EtKNYRkmkErcr165D40/0TfROuhS3zHdrl2APjKKVETb+tZxFuEK/a9ntZIfpXwJf76CkyKEaKZsHBX08qoyPDj7W9Az4qejBigQY9QQJ9fJ/nJFQYMKLneiB+6DlKPtZOhYHuVN5jy2O97KfZ43azugwC2PVWcKUYkwsvjIpYiHkTKRhju2mSe3uKeg1EmMEL7e65JcKxN36UWq6I9xxI9n8xJVXJCoLzqjhxsBEv5DOvlCugUgh6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTd/TRUBA2vgJmeKBOczwGPO1TrxRESQViNxs1A4hpU=;
 b=Nif8mEJemyDn6p6l/qMl8+wemNtzbFoK5rO/iXJeWBy2soKp983YTDFRtVHQUJtKpepMTPKUZDWTedh+RUrRv7FsdcXVkxvcko/Zu7oJ0RiLMSI5CI5cCrSPRyLj9LPfqosBm0JbbxcxFPblnyGdvrXBEtFqLpkRH5ZikBGpzfwaKGynwe4IyEbJGf2MhvrSG1hseFjA07I/YGshVF5zusnUxPphaT7erS1Cik6gceabCClIkVWj3+wWSOb9gf5Ug75dVsrpzl+qr65IsVcWTPKg5fEHW1dppl+rIRJT2wl7TZfeHNNh4Z1gDdne+ZeAi8cD6U/aMVir9Q/9jlgQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTd/TRUBA2vgJmeKBOczwGPO1TrxRESQViNxs1A4hpU=;
 b=cIMr15R9utcQqeeuZPV9/df9QsO7vF+FrpJaIEPvl1vlJK0SnjrXgbJWzH4yoF4hCTqrgq2zRj3L9usXM3yBwZVF1L0kN3nhFGlaPgD8Mk1Ky3d+HPb71LBsD8ZnEKFri70Fcplc2LcROlKnfrWp74+VvpuFacmMpuxw92MdKqc=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (20.179.11.140) by
 DB8PR04MB6650.eurprd04.prod.outlook.com (20.179.251.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 17:01:15 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe%7]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 17:01:15 +0000
From: Youri Querry <youri.querry_1@nxp.com>
To: Roy Pledge <roy.pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
Subject: [PATCH 2/3] soc: fsl: dpio: QMAN performance improvement. Function
 pointer indirection.
Thread-Topic: [PATCH 2/3] soc: fsl: dpio: QMAN performance improvement.
 Function pointer indirection.
Thread-Index: AQHVsQ3DvYFUAFdXAU292XsGq6P6og==
Date: Thu, 12 Dec 2019 17:01:15 +0000
Message-ID: <1576170032-3124-3-git-send-email-youri.querry_1@nxp.com>
References: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
In-Reply-To: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To DB8PR04MB5931.eurprd04.prod.outlook.com
 (2603:10a6:10:ae::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=youri.querry_1@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2de50b13-5dbe-4a92-25cf-08d77f24e629
x-ms-traffictypediagnostic: DB8PR04MB6650:|DB8PR04MB6650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6650C6C7165E4DD75559E50CF3550@DB8PR04MB6650.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(478600001)(26005)(52116002)(66446008)(6506007)(86362001)(6512007)(316002)(4326008)(2906002)(71200400001)(186003)(36756003)(6486002)(5660300002)(81166006)(81156014)(2616005)(6636002)(64756008)(8676002)(66476007)(30864003)(66946007)(8936002)(110136005)(66556008)(559001)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6650;
 H:DB8PR04MB5931.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: raDdW75GhGR0O92nCJjLjiFyr5TzIu17+yYt96XbkR8w2s7N9vuG1h5/zqYByMa+u5qKevnNgdEFMKQn2xxdyKCt5al3EADS4IV9WCFRlAnSDItYniD1gJTWVyImIBzs4v/BX7FnsDqLE4csZAS8YorytRZAvSmJABbB5JQv7/ydnDwUD2ORynF4ytBcnyv6q04R/859GtpMb4EVak6kVeDA8/orTkU+zlf+qOuCinqMdWhzcmjY0XZ+hxihfkK2DvlU4g9WBmaj7YiwXhG9IUY/M3TnfeKKoCK0oDUM5mtDPPSJcOBa+Hg57rvL+Qi3oSEhURw2RJJpsYVRfbFY05fUooGtkn9KGPr11GWIVjxIbfAtIweJ8LN4BUduGkMo268Ip2aX7ZyDJsdGQ62ZPj1fBZ6D9Q+VSVf3i0vWtGoeI2VIi46mCIarLSynQPj5
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de50b13-5dbe-4a92-25cf-08d77f24e629
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 17:01:15.6439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RD2KGX1a+5iZIWsyotiEzQ2dzeAg/lH8LZuNGCJLT4vg+YTBGui+BznmwJGOtsgA/zdMmAv7LsmR/sNE/Mgp/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6650
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
Cc: Youri Querry <youri.querry_1@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We are making the access decision in the initialization and
setting the function pointers accordingly.

Signed-off-by: Youri Querry <youri.querry_1@nxp.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 451 +++++++++++++++++++++++++++++++-=
----
 drivers/soc/fsl/dpio/qbman-portal.h | 129 ++++++++++-
 2 files changed, 507 insertions(+), 73 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbm=
an-portal.c
index 5a37ac8..0ffe018 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -83,6 +83,82 @@ enum qbman_sdqcr_fc {
 	qbman_sdqcr_fc_up_to_3 =3D 1
 };
=20
+/* Internal Function declaration */
+static int qbman_swp_enqueue_direct(struct qbman_swp *s,
+				    const struct qbman_eq_desc *d,
+				    const struct dpaa2_fd *fd);
+static int qbman_swp_enqueue_mem_back(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd);
+static int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
+					     const struct qbman_eq_desc *d,
+					     const struct dpaa2_fd *fd,
+					     uint32_t *flags,
+					     int num_frames);
+static int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
+					       const struct qbman_eq_desc *d,
+					       const struct dpaa2_fd *fd,
+					       uint32_t *flags,
+					       int num_frames);
+static int
+qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
+				       const struct qbman_eq_desc *d,
+				       const struct dpaa2_fd *fd,
+				       int num_frames);
+static
+int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
+					     const struct qbman_eq_desc *d,
+					     const struct dpaa2_fd *fd,
+					     int num_frames);
+static int qbman_swp_pull_direct(struct qbman_swp *s,
+				 struct qbman_pull_desc *d);
+static int qbman_swp_pull_mem_back(struct qbman_swp *s,
+				   struct qbman_pull_desc *d);
+
+const struct dpaa2_dq *qbman_swp_dqrr_next_direct(struct qbman_swp *s);
+const struct dpaa2_dq *qbman_swp_dqrr_next_mem_back(struct qbman_swp *s);
+
+static int qbman_swp_release_direct(struct qbman_swp *s,
+				    const struct qbman_release_desc *d,
+				    const u64 *buffers,
+				    unsigned int num_buffers);
+static int qbman_swp_release_mem_back(struct qbman_swp *s,
+				      const struct qbman_release_desc *d,
+				      const u64 *buffers,
+				      unsigned int num_buffers);
+
+/* Function pointers */
+int (*qbman_swp_enqueue_ptr)(struct qbman_swp *s,
+			     const struct qbman_eq_desc *d,
+			     const struct dpaa2_fd *fd)
+	=3D qbman_swp_enqueue_direct;
+
+int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+					     int num_frames)
+	=3D qbman_swp_enqueue_multiple_direct;
+
+int
+(*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,
+				       const struct qbman_eq_desc *d,
+				       const struct dpaa2_fd *fd,
+				       int num_frames)
+	=3D qbman_swp_enqueue_multiple_desc_direct;
+
+int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d)
+			=3D qbman_swp_pull_direct;
+
+const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s)
+			=3D qbman_swp_dqrr_next_direct;
+
+int (*qbman_swp_release_ptr)(struct qbman_swp *s,
+			     const struct qbman_release_desc *d,
+			     const u64 *buffers,
+			     unsigned int num_buffers)
+			=3D qbman_swp_release_direct;
+
 /* Portal Access */
=20
 static inline u32 qbman_read_register(struct qbman_swp *p, u32 offset)
@@ -218,6 +294,19 @@ struct qbman_swp *qbman_swp_init(const struct qbman_sw=
p_desc *d)
 	 * applied when dequeues from a specific channel are enabled.
 	 */
 	qbman_write_register(p, QBMAN_CINH_SWP_SDQCR, 0);
+
+	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {
+		qbman_swp_enqueue_ptr =3D
+			qbman_swp_enqueue_mem_back;
+		qbman_swp_enqueue_multiple_ptr =3D
+			qbman_swp_enqueue_multiple_mem_back;
+		qbman_swp_enqueue_multiple_desc_ptr =3D
+			qbman_swp_enqueue_multiple_desc_mem_back;
+		qbman_swp_pull_ptr =3D qbman_swp_pull_mem_back;
+		qbman_swp_dqrr_next_ptr =3D qbman_swp_dqrr_next_mem_back;
+		qbman_swp_release_ptr =3D qbman_swp_release_mem_back;
+	}
+
 	return p;
 }
=20
@@ -447,7 +536,7 @@ static inline void qbman_write_eqcr_am_rt_register(stru=
ct qbman_swp *p,
 }
=20
 /**
- * qbman_swp_enqueue() - Issue an enqueue command
+ * qbman_swp_enqueue_direct() - Issue an enqueue command
  * @s:  the software portal used for enqueue
  * @d:  the enqueue descriptor
  * @fd: the frame descriptor to be enqueued
@@ -457,7 +546,7 @@ static inline void qbman_write_eqcr_am_rt_register(stru=
ct qbman_swp *p,
  *
  * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
  */
-int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
+int qbman_swp_enqueue_direct(struct qbman_swp *s, const struct qbman_eq_de=
sc *d,
 		      const struct dpaa2_fd *fd)
 {
 	struct qbman_eq_desc_with_fd *p;
@@ -480,21 +569,57 @@ int qbman_swp_enqueue(struct qbman_swp *s, const stru=
ct qbman_eq_desc *d,
 	memcpy(&p->desc.tgtid, &d->tgtid, 24);
 	memcpy(&p->fd, fd, sizeof(*fd));
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
-		/* Set the verb byte, have to substitute in the valid-bit */
-		dma_wmb();
-		p->desc.verb =3D d->verb | EQAR_VB(eqar);
-	} else {
-		p->desc.verb =3D d->verb | EQAR_VB(eqar);
-		dma_wmb();
-		qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
-	}
+	/* Set the verb byte, have to substitute in the valid-bit */
+	dma_wmb();
+	p->desc.verb =3D d->verb | EQAR_VB(eqar);
=20
 	return 0;
 }
=20
 /**
- * qbman_swp_enqueue_multiple() - Issue a multi enqueue command
+ * qbman_swp_enqueue_mem_back() - Issue an enqueue command
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: the frame descriptor to be enqueued
+ *
+ * Please note that 'fd' should only be NULL if the "action" of the
+ * descriptor is "orp_hole" or "orp_nesn".
+ *
+ * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
+ */
+int qbman_swp_enqueue_mem_back(struct qbman_swp *s,
+			       const struct qbman_eq_desc *d,
+			       const struct dpaa2_fd *fd)
+{
+	struct qbman_eq_desc_with_fd *p;
+	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
+
+	if (!EQAR_SUCCESS(eqar))
+		return -EBUSY;
+
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
+	/* This is mapped as DEVICE type memory, writes are
+	 * with address alignment:
+	 * desc.dca address alignment =3D 1
+	 * desc.seqnum address alignment =3D 2
+	 * desc.orpid address alignment =3D 4
+	 * desc.tgtid address alignment =3D 8
+	 */
+	p->desc.dca =3D d->dca;
+	p->desc.seqnum =3D d->seqnum;
+	p->desc.orpid =3D d->orpid;
+	memcpy(&p->desc.tgtid, &d->tgtid, 24);
+	memcpy(&p->fd, fd, sizeof(*fd));
+
+	p->desc.verb =3D d->verb | EQAR_VB(eqar);
+	dma_wmb();
+	qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
+
+	return 0;
+}
+
+/**
+ * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
  * using one enqueue descriptor
  * @s:  the software portal used for enqueue
  * @d:  the enqueue descriptor
@@ -504,16 +629,44 @@ int qbman_swp_enqueue(struct qbman_swp *s, const stru=
ct qbman_eq_desc *d,
  *
  * Return the number of fd enqueued, or a negative error number.
  */
-int qbman_swp_enqueue_multiple(struct qbman_swp *s,
-			       const struct qbman_eq_desc *d,
-			       const struct dpaa2_fd *fd,
-			       uint32_t *flags,
-			       int num_frames)
+int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+				      int num_frames)
+{
+	int count =3D 0;
+
+	while (count < num_frames) {
+		if (qbman_swp_enqueue_direct(s, d, fd) !=3D 0)
+			break;
+		count++;
+	}
+
+	return count;
+}
+
+/**
+ * qbman_swp_enqueue_multiple_mem_back() - Issue a multi enqueue command
+ * using one enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @flags: table pointer of flags, not used for the moment
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+				      int num_frames)
 {
 	int count =3D 0;
=20
 	while (count < num_frames) {
-		if (qbman_swp_enqueue(s, d, fd) !=3D 0)
+		if (qbman_swp_enqueue_mem_back(s, d, fd) !=3D 0)
 			break;
 		count++;
 	}
@@ -522,7 +675,7 @@ int qbman_swp_enqueue_multiple(struct qbman_swp *s,
 }
=20
 /**
- * qbman_swp_enqueue_multiple_desc() - Issue a multi enqueue command
+ * qbman_swp_enqueue_multiple_desc_direct() - Issue a multi enqueue comman=
d
  * using multiple enqueue descriptor
  * @s:  the software portal used for enqueue
  * @d:  table of minimal enqueue descriptor
@@ -531,15 +684,41 @@ int qbman_swp_enqueue_multiple(struct qbman_swp *s,
  *
  * Return the number of fd enqueued, or a negative error number.
  */
-int qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,
-				    const struct qbman_eq_desc *d,
-				    const struct dpaa2_fd *fd,
-				    int num_frames)
+int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
+					   const struct qbman_eq_desc *d,
+					   const struct dpaa2_fd *fd,
+					   int num_frames)
+{
+	int count =3D 0;
+
+	while (count < num_frames) {
+		if (qbman_swp_enqueue_direct(s, &(d[count]), fd) !=3D 0)
+			break;
+		count++;
+	}
+
+	return count;
+}
+
+/**
+ * qbman_swp_enqueue_multiple_desc_mem_back() - Issue a multi enqueue comm=
and
+ * using multiple enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  table of minimal enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
+					   const struct qbman_eq_desc *d,
+					   const struct dpaa2_fd *fd,
+					   int num_frames)
 {
 	int count =3D 0;
=20
 	while (count < num_frames) {
-		if (qbman_swp_enqueue(s, &(d[count]), fd) !=3D 0)
+		if (qbman_swp_enqueue_mem_back(s, &(d[count]), fd) !=3D 0)
 			break;
 		count++;
 	}
@@ -702,7 +881,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_desc=
 *d, u32 chid,
 }
=20
 /**
- * qbman_swp_pull() - Issue the pull dequeue command
+ * qbman_swp_pull_direct() - Issue the pull dequeue command
  * @s: the software portal object
  * @d: the software portal descriptor which has been configured with
  *     the set of qbman_pull_desc_set_*() calls
@@ -710,7 +889,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_desc=
 *d, u32 chid,
  * Return 0 for success, and -EBUSY if the software portal is not ready
  * to do pull dequeue.
  */
-int qbman_swp_pull(struct qbman_swp *s, struct qbman_pull_desc *d)
+int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_desc *d)
 {
 	struct qbman_pull_desc *p;
=20
@@ -728,18 +907,45 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbman_=
pull_desc *d)
 	p->dq_src =3D d->dq_src;
 	p->rsp_addr =3D d->rsp_addr;
 	p->rsp_addr_virt =3D d->rsp_addr_virt;
+	dma_wmb();
+	/* Set the verb byte, have to substitute in the valid-bit */
+	p->verb =3D d->verb | s->vdq.valid_bit;
+	s->vdq.valid_bit ^=3D QB_VALID_BIT;
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
-		dma_wmb();
-		/* Set the verb byte, have to substitute in the valid-bit */
-		p->verb =3D d->verb | s->vdq.valid_bit;
-		s->vdq.valid_bit ^=3D QB_VALID_BIT;
-	} else {
-		p->verb =3D d->verb | s->vdq.valid_bit;
-		s->vdq.valid_bit ^=3D QB_VALID_BIT;
-		dma_wmb();
-		qbman_write_register(s, QBMAN_CINH_SWP_VDQCR_RT, QMAN_RT_MODE);
+	return 0;
+}
+
+/**
+ * qbman_swp_pull_mem_back() - Issue the pull dequeue command
+ * @s: the software portal object
+ * @d: the software portal descriptor which has been configured with
+ *     the set of qbman_pull_desc_set_*() calls
+ *
+ * Return 0 for success, and -EBUSY if the software portal is not ready
+ * to do pull dequeue.
+ */
+int qbman_swp_pull_mem_back(struct qbman_swp *s, struct qbman_pull_desc *d=
)
+{
+	struct qbman_pull_desc *p;
+
+	if (!atomic_dec_and_test(&s->vdq.available)) {
+		atomic_inc(&s->vdq.available);
+		return -EBUSY;
 	}
+	s->vdq.storage =3D (void *)(uintptr_t)d->rsp_addr_virt;
+	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
+		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR);
+	else
+		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR_MEM);
+	p->numf =3D d->numf;
+	p->tok =3D QMAN_DQ_TOKEN_VALID;
+	p->dq_src =3D d->dq_src;
+	p->rsp_addr =3D d->rsp_addr;
+	p->rsp_addr_virt =3D d->rsp_addr_virt;
+	p->verb =3D d->verb | s->vdq.valid_bit;
+	s->vdq.valid_bit ^=3D QB_VALID_BIT;
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_VDQCR_RT, QMAN_RT_MODE);
=20
 	return 0;
 }
@@ -747,14 +953,14 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbman_=
pull_desc *d)
 #define QMAN_DQRR_PI_MASK   0xf
=20
 /**
- * qbman_swp_dqrr_next() - Get an valid DQRR entry
+ * qbman_swp_dqrr_next_direct() - Get an valid DQRR entry
  * @s: the software portal object
  *
  * Return NULL if there are no unconsumed DQRR entries. Return a DQRR entr=
y
  * only once, so repeated calls can return a sequence of DQRR entries, wit=
hout
  * requiring they be consumed immediately or in any particular order.
  */
-const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_swp *s)
+const struct dpaa2_dq *qbman_swp_dqrr_next_direct(struct qbman_swp *s)
 {
 	u32 verb;
 	u32 response_verb;
@@ -797,10 +1003,99 @@ const struct dpaa2_dq *qbman_swp_dqrr_next(struct qb=
man_swp *s)
 				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
 	}
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));
-	else
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR_MEM(s->dqrr.next_idx));
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));
+	verb =3D p->dq.verb;
+
+	/*
+	 * If the valid-bit isn't of the expected polarity, nothing there. Note,
+	 * in the DQRR reset bug workaround, we shouldn't need to skip these
+	 * check, because we've already determined that a new entry is available
+	 * and we've invalidated the cacheline before reading it, so the
+	 * valid-bit behaviour is repaired and should tell us what we already
+	 * knew from reading PI.
+	 */
+	if ((verb & QB_VALID_BIT) !=3D s->dqrr.valid_bit) {
+		prefetch(qbman_get_cmd(s,
+				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
+		return NULL;
+	}
+	/*
+	 * There's something there. Move "next_idx" attention to the next ring
+	 * entry (and prefetch it) before returning what we found.
+	 */
+	s->dqrr.next_idx++;
+	s->dqrr.next_idx &=3D s->dqrr.dqrr_size - 1; /* Wrap around */
+	if (!s->dqrr.next_idx)
+		s->dqrr.valid_bit ^=3D QB_VALID_BIT;
+
+	/*
+	 * If this is the final response to a volatile dequeue command
+	 * indicate that the vdq is available
+	 */
+	flags =3D p->dq.stat;
+	response_verb =3D verb & QBMAN_RESULT_MASK;
+	if ((response_verb =3D=3D QBMAN_RESULT_DQ) &&
+	    (flags & DPAA2_DQ_STAT_VOLATILE) &&
+	    (flags & DPAA2_DQ_STAT_EXPIRED))
+		atomic_inc(&s->vdq.available);
+
+	prefetch(qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
+
+	return p;
+}
+
+/**
+ * qbman_swp_dqrr_next_mem_back() - Get an valid DQRR entry
+ * @s: the software portal object
+ *
+ * Return NULL if there are no unconsumed DQRR entries. Return a DQRR entr=
y
+ * only once, so repeated calls can return a sequence of DQRR entries, wit=
hout
+ * requiring they be consumed immediately or in any particular order.
+ */
+const struct dpaa2_dq *qbman_swp_dqrr_next_mem_back(struct qbman_swp *s)
+{
+	u32 verb;
+	u32 response_verb;
+	u32 flags;
+	struct dpaa2_dq *p;
+
+	/* Before using valid-bit to detect if something is there, we have to
+	 * handle the case of the DQRR reset bug...
+	 */
+	if (unlikely(s->dqrr.reset_bug)) {
+		/*
+		 * We pick up new entries by cache-inhibited producer index,
+		 * which means that a non-coherent mapping would require us to
+		 * invalidate and read *only* once that PI has indicated that
+		 * there's an entry here. The first trip around the DQRR ring
+		 * will be much less efficient than all subsequent trips around
+		 * it...
+		 */
+		u8 pi =3D qbman_read_register(s, QBMAN_CINH_SWP_DQPI) &
+			QMAN_DQRR_PI_MASK;
+
+		/* there are new entries if pi !=3D next_idx */
+		if (pi =3D=3D s->dqrr.next_idx)
+			return NULL;
+
+		/*
+		 * if next_idx is/was the last ring index, and 'pi' is
+		 * different, we can disable the workaround as all the ring
+		 * entries have now been DMA'd to so valid-bit checking is
+		 * repaired. Note: this logic needs to be based on next_idx
+		 * (which increments one at a time), rather than on pi (which
+		 * can burst and wrap-around between our snapshots of it).
+		 */
+		if (s->dqrr.next_idx =3D=3D (s->dqrr.dqrr_size - 1)) {
+			pr_debug("next_idx=3D%d, pi=3D%d, clear reset bug\n",
+				 s->dqrr.next_idx, pi);
+			s->dqrr.reset_bug =3D 0;
+		}
+		prefetch(qbman_get_cmd(s,
+				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
+	}
+
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR_MEM(s->dqrr.next_idx));
 	verb =3D p->dq.verb;
=20
 	/*
@@ -929,7 +1224,7 @@ void qbman_release_desc_set_rcdi(struct qbman_release_=
desc *d, int enable)
 #define RAR_SUCCESS(rar) ((rar) & 0x100)
=20
 /**
- * qbman_swp_release() - Issue a buffer release command
+ * qbman_swp_release_direct() - Issue a buffer release command
  * @s:           the software portal object
  * @d:           the release descriptor
  * @buffers:     a pointer pointing to the buffer address to be released
@@ -937,8 +1232,9 @@ void qbman_release_desc_set_rcdi(struct qbman_release_=
desc *d, int enable)
  *
  * Return 0 for success, -EBUSY if the release command ring is not ready.
  */
-int qbman_swp_release(struct qbman_swp *s, const struct qbman_release_desc=
 *d,
-		      const u64 *buffers, unsigned int num_buffers)
+int qbman_swp_release_direct(struct qbman_swp *s,
+			     const struct qbman_release_desc *d,
+			     const u64 *buffers, unsigned int num_buffers)
 {
 	int i;
 	struct qbman_release_desc *p;
@@ -952,28 +1248,59 @@ int qbman_swp_release(struct qbman_swp *s, const str=
uct qbman_release_desc *d,
 		return -EBUSY;
=20
 	/* Start the release command */
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR(RAR_IDX(rar)));
-	else
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR_MEM(RAR_IDX(rar)));
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR(RAR_IDX(rar)));
+
 	/* Copy the caller's buffer pointers to the command */
 	for (i =3D 0; i < num_buffers; i++)
 		p->buf[i] =3D cpu_to_le64(buffers[i]);
 	p->bpid =3D d->bpid;
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
-		/*
-		 * Set the verb byte, have to substitute in the valid-bit
-		 * and the number of buffers.
-		 */
-		dma_wmb();
-		p->verb =3D d->verb | RAR_VB(rar) | num_buffers;
-	} else {
-		p->verb =3D d->verb | RAR_VB(rar) | num_buffers;
-		dma_wmb();
-		qbman_write_register(s, QBMAN_CINH_SWP_RCR_AM_RT +
-				     RAR_IDX(rar)  * 4, QMAN_RT_MODE);
-	}
+	/*
+	 * Set the verb byte, have to substitute in the valid-bit
+	 * and the number of buffers.
+	 */
+	dma_wmb();
+	p->verb =3D d->verb | RAR_VB(rar) | num_buffers;
+
+	return 0;
+}
+
+/**
+ * qbman_swp_release_mem_back() - Issue a buffer release command
+ * @s:           the software portal object
+ * @d:           the release descriptor
+ * @buffers:     a pointer pointing to the buffer address to be released
+ * @num_buffers: number of buffers to be released,  must be less than 8
+ *
+ * Return 0 for success, -EBUSY if the release command ring is not ready.
+ */
+int qbman_swp_release_mem_back(struct qbman_swp *s,
+			       const struct qbman_release_desc *d,
+			       const u64 *buffers, unsigned int num_buffers)
+{
+	int i;
+	struct qbman_release_desc *p;
+	u32 rar;
+
+	if (!num_buffers || (num_buffers > 7))
+		return -EINVAL;
+
+	rar =3D qbman_read_register(s, QBMAN_CINH_SWP_RAR);
+	if (!RAR_SUCCESS(rar))
+		return -EBUSY;
+
+	/* Start the release command */
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR_MEM(RAR_IDX(rar)));
+
+	/* Copy the caller's buffer pointers to the command */
+	for (i =3D 0; i < num_buffers; i++)
+		p->buf[i] =3D cpu_to_le64(buffers[i]);
+	p->bpid =3D d->bpid;
+
+	p->verb =3D d->verb | RAR_VB(rar) | num_buffers;
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_RCR_AM_RT +
+			     RAR_IDX(rar)  * 4, QMAN_RT_MODE);
=20
 	return 0;
 }
diff --git a/drivers/soc/fsl/dpio/qbman-portal.h b/drivers/soc/fsl/dpio/qbm=
an-portal.h
index ac58a97..3b3fb86 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.h
+++ b/drivers/soc/fsl/dpio/qbman-portal.h
@@ -145,6 +145,33 @@ struct qbman_swp {
 	} dqrr;
 };
=20
+/* Function pointers */
+extern
+int (*qbman_swp_enqueue_ptr)(struct qbman_swp *s,
+			     const struct qbman_eq_desc *d,
+			     const struct dpaa2_fd *fd);
+extern
+int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+				      int num_frames);
+extern
+int (*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,
+					   const struct qbman_eq_desc *d,
+					   const struct dpaa2_fd *fd,
+					   int num_frames);
+extern
+int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d);
+extern
+const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s);
+extern
+int (*qbman_swp_release_ptr)(struct qbman_swp *s,
+			     const struct qbman_release_desc *d,
+			     const u64 *buffers,
+			     unsigned int num_buffers);
+
+/* Functions */
 struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d);
 void qbman_swp_finish(struct qbman_swp *p);
 u32 qbman_swp_interrupt_read_status(struct qbman_swp *p);
@@ -169,9 +196,6 @@ void qbman_pull_desc_set_wq(struct qbman_pull_desc *d, =
u32 wqid,
 void qbman_pull_desc_set_channel(struct qbman_pull_desc *d, u32 chid,
 				 enum qbman_pull_type_e dct);
=20
-int qbman_swp_pull(struct qbman_swp *p, struct qbman_pull_desc *d);
-
-const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_swp *s);
 void qbman_swp_dqrr_consume(struct qbman_swp *s, const struct dpaa2_dq *dq=
);
=20
 int qbman_result_has_new_result(struct qbman_swp *p, const struct dpaa2_dq=
 *dq);
@@ -183,15 +207,11 @@ void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u3=
2 fqid);
 void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,
 			  u32 qd_bin, u32 qd_prio);
=20
-int qbman_swp_enqueue(struct qbman_swp *p, const struct qbman_eq_desc *d,
-		      const struct dpaa2_fd *fd);
=20
 void qbman_release_desc_clear(struct qbman_release_desc *d);
 void qbman_release_desc_set_bpid(struct qbman_release_desc *d, u16 bpid);
 void qbman_release_desc_set_rcdi(struct qbman_release_desc *d, int enable)=
;
=20
-int qbman_swp_release(struct qbman_swp *s, const struct qbman_release_desc=
 *d,
-		      const u64 *buffers, unsigned int num_buffers);
 int qbman_swp_acquire(struct qbman_swp *s, u16 bpid, u64 *buffers,
 		      unsigned int num_buffers);
 int qbman_swp_alt_fq_state(struct qbman_swp *s, u32 fqid,
@@ -204,18 +224,60 @@ void *qbman_swp_mc_start(struct qbman_swp *p);
 void qbman_swp_mc_submit(struct qbman_swp *p, void *cmd, u8 cmd_verb);
 void *qbman_swp_mc_result(struct qbman_swp *p);
=20
-int
+/**
+ * qbman_swp_enqueue() - Issue an enqueue command
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: the frame descriptor to be enqueued
+ *
+ * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
+ */
+static inline int
+qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
+		  const struct dpaa2_fd *fd)
+{
+	return qbman_swp_enqueue_ptr(s, d, fd);
+}
+
+/**
+ * qbman_swp_enqueue_multiple() - Issue a multi enqueue command
+ * using one enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+static inline int
 qbman_swp_enqueue_multiple(struct qbman_swp *s,
 			   const struct qbman_eq_desc *d,
 			   const struct dpaa2_fd *fd,
 			   uint32_t *flags,
-			   int num_frames);
+			   int num_frames)
+{
+	return qbman_swp_enqueue_multiple_ptr(s, d, fd, flags, num_frames);
+}
=20
-int
+/**
+ * qbman_swp_enqueue_multiple_desc() - Issue a multi enqueue command
+ * using multiple enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  table of minimal enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+static inline int
 qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,
 				const struct qbman_eq_desc *d,
 				const struct dpaa2_fd *fd,
-				int num_frames);
+				int num_frames)
+{
+	return qbman_swp_enqueue_multiple_desc_ptr(s, d, fd, num_frames);
+}
=20
 /**
  * qbman_result_is_DQ() - check if the dequeue result is a dequeue respons=
e
@@ -528,4 +590,49 @@ int qbman_bp_query(struct qbman_swp *s, u16 bpid,
=20
 u32 qbman_bp_info_num_free_bufs(struct qbman_bp_query_rslt *a);
=20
+/**
+ * qbman_swp_release() - Issue a buffer release command
+ * @s:           the software portal object
+ * @d:           the release descriptor
+ * @buffers:     a pointer pointing to the buffer address to be released
+ * @num_buffers: number of buffers to be released,  must be less than 8
+ *
+ * Return 0 for success, -EBUSY if the release command ring is not ready.
+ */
+static inline int qbman_swp_release(struct qbman_swp *s,
+				    const struct qbman_release_desc *d,
+				    const u64 *buffers,
+				    unsigned int num_buffers)
+{
+	return qbman_swp_release_ptr(s, d, buffers, num_buffers);
+}
+
+/**
+ * qbman_swp_pull() - Issue the pull dequeue command
+ * @s: the software portal object
+ * @d: the software portal descriptor which has been configured with
+ *     the set of qbman_pull_desc_set_*() calls
+ *
+ * Return 0 for success, and -EBUSY if the software portal is not ready
+ * to do pull dequeue.
+ */
+static inline int qbman_swp_pull(struct qbman_swp *s,
+				 struct qbman_pull_desc *d)
+{
+	return qbman_swp_pull_ptr(s, d);
+}
+
+/**
+ * qbman_swp_dqrr_next() - Get an valid DQRR entry
+ * @s: the software portal object
+ *
+ * Return NULL if there are no unconsumed DQRR entries. Return a DQRR entr=
y
+ * only once, so repeated calls can return a sequence of DQRR entries, wit=
hout
+ * requiring they be consumed immediately or in any particular order.
+ */
+static inline const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbman_swp =
*s)
+{
+	return qbman_swp_dqrr_next_ptr(s);
+}
+
 #endif /* __FSL_QBMAN_PORTAL_H */
--=20
2.7.4

