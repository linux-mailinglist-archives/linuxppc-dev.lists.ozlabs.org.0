Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8887311D318
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:05:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YgCv5RvyzDr5d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.78; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=youri.querry_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="GomeJut7"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yg7J5RMDzDr48
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:01:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2FTBPaf9f9Kaio+56jGj4OeqJb2Tjrebp0K0MG7fs871fa4X9anNZ20Q5FHvQLP6HCSmxCwPGTKJ9Qm9PE4+LHvaO3i4mSz1MmwkrkLYfJ7Mpf5fIT34YKGRfeNr958a3eYLuyS2v3c/Xvkn2SsbqFFZX9q7sAvH2g4xsUhrhTjdsCyEChHJ5pC7UsTTiJ0Eq9Y0o1a5yw3K9snotLWVBGN0Hl+V7+yNRw9jlN/gT3Xv2l0XFb68QHOnpbaX1AQs4s/jWXTTc24r7s72+U0yOhMUjxnVId77jrB6L66U0D+uRXAAHoMa+OjBpKiRFMnsNUwevdVuoZ0gPzTP8759w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s312bLLq8BW3tjihbul/Ky9QYj7CT8ivqEYLZEb1VsQ=;
 b=g3NWzgrXDLmdJByUL9G5wMw9lVQWDjtFcUjXitoRwVC83bsCQkyOy3CudleZrlk2ouvrJmtXtgNPS4Lfn3HznHEH872/A6DLzep8noreRNAq6l1lcuEyMPTfb22rgcTEN7NXQSVEALl0JcWHVcbgQxPipFoXCq7BD0i97ZqtPQiC/O47zECla3O2NpaK1WwTCm1zSWIX4mbOsi6D32fBKtqJkYNA/kdZHZuftJGQiI4FnDQA1b+vwUWUpEoekptYXOHVk5/yOqlELfQM7IdY3aepOLJf1nRXYBoZ1PDNQtzreYFAjDgPh2MnCxoePQ/jtK/lhjDgiI3rhWu0h69VoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s312bLLq8BW3tjihbul/Ky9QYj7CT8ivqEYLZEb1VsQ=;
 b=GomeJut7fC9el3v7r6f0OUPDhqFfr0+RlavrklafxiDJfgIBN+qp7nPcrKISEU/IYEGpAk0dQdzFIRnBx4kyFbW+ntS73iR/LKvaLD2lSaG9cxSrQzLU37qn1VwArJuyjyXZLz2Nbu/egBwH+WC9a177UrwLsvExWLtpqDCtpRI=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (20.179.11.140) by
 DB8PR04MB6650.eurprd04.prod.outlook.com (20.179.251.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 17:01:13 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe%7]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 17:01:13 +0000
From: Youri Querry <youri.querry_1@nxp.com>
To: Roy Pledge <roy.pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
Subject: [PATCH 1/3] soc: fsl: dpio: Adding QMAN multiple enqueue interface.
Thread-Topic: [PATCH 1/3] soc: fsl: dpio: Adding QMAN multiple enqueue
 interface.
Thread-Index: AQHVsQ3CR8mqOKTLf0SPsodkwGug1g==
Date: Thu, 12 Dec 2019 17:01:13 +0000
Message-ID: <1576170032-3124-2-git-send-email-youri.querry_1@nxp.com>
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
x-ms-office365-filtering-correlation-id: 450f7b09-bfb5-42d5-2688-08d77f24e4b2
x-ms-traffictypediagnostic: DB8PR04MB6650:|DB8PR04MB6650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB665016FC67569A23CF4E0EABF3550@DB8PR04MB6650.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(478600001)(26005)(52116002)(66446008)(6506007)(86362001)(6512007)(316002)(4326008)(2906002)(71200400001)(186003)(36756003)(6486002)(5660300002)(81166006)(81156014)(2616005)(6636002)(64756008)(8676002)(66476007)(66946007)(8936002)(110136005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6650;
 H:DB8PR04MB5931.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JvR0pqsTITmob/22R26QdDPEzsbWHGYVvgOKrGXMubOJvfVBd/Bbi9OcYKo/z3zUyhSPQrH90ArhoydR9aUmTAUiaQNCsVle+rYxsDKR0+I9Szf4qwi6SAjEc210KpcXvKSmnxtAxVlxqtWj/yOdOa1TngAJwSEE9vhPxkS7aNgoXPG4UGtj5X8qwRpAlHR1OwXM23EAqru1cxuW1bWzjh6dRv1sjiMQ3qq3N4IzpGHUST6XltjVYidSTe6/IKk0bMoqC2a5bVuMQRv8fKmHAB2f6LpfyJmoKqFJ69QNagOBNlEPycja0+6TvJu4honqTWJRzsDVIqzB2kx30/NIo96hxcKn/es0c5egQNFFDZVdCSv88ZxDDRsuzcp9BRjFfXYZi7/U5wlex/Tl3d3Uczc+r24gWhwuPC84Ah4Xag7un3DSNBHBZLsquD/fJ365
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450f7b09-bfb5-42d5-2688-08d77f24e4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 17:01:13.0354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzOnL2Kr32fVYnGmlcBCMjRXExFrLds7Jyca80owCPYdq2varViRmws6uRTQUrpJI/r5kc+nESyhdY3NwuZe7Q==
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

Update of QMAN the interface to enqueue frame. We now support multiple
enqueue (qbman_swp_enqueue_multiple) and multiple enqueue with
a table of descriptor (qbman_swp_enqueue_multiple_desc).

Signed-off-by: Youri Querry <youri.querry_1@nxp.com>
---
 drivers/soc/fsl/dpio/dpio-service.c | 69 ++++++++++++++++++++++++++++--
 drivers/soc/fsl/dpio/qbman-portal.c | 83 +++++++++++++++++++++++++++++++--=
----
 drivers/soc/fsl/dpio/qbman-portal.h | 24 +++++++++++
 include/soc/fsl/dpaa2-io.h          |  6 ++-
 4 files changed, 165 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpi=
o-service.c
index 518a8e0..cd4f641 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
  * Copyright 2014-2016 Freescale Semiconductor Inc.
- * Copyright 2016 NXP
+ * Copyright 2016-2019 NXP
  *
  */
 #include <linux/types.h>
@@ -433,6 +433,69 @@ int dpaa2_io_service_enqueue_fq(struct dpaa2_io *d,
 EXPORT_SYMBOL(dpaa2_io_service_enqueue_fq);
=20
 /**
+ * dpaa2_io_service_enqueue_multiple_fq() - Enqueue multiple frames
+ * to a frame queue using one fqid.
+ * @d: the given DPIO service.
+ * @fqid: the given frame queue id.
+ * @fd: the frame descriptor which is enqueued.
+ * @nb: number of frames to be enqueud
+ *
+ * Return 0 for successful enqueue, -EBUSY if the enqueue ring is not read=
y,
+ * or -ENODEV if there is no dpio service.
+ */
+int dpaa2_io_service_enqueue_multiple_fq(struct dpaa2_io *d,
+				u32 fqid,
+				const struct dpaa2_fd *fd,
+				int nb)
+{
+	struct qbman_eq_desc ed;
+
+	d =3D service_select(d);
+	if (!d)
+		return -ENODEV;
+
+	qbman_eq_desc_clear(&ed);
+	qbman_eq_desc_set_no_orp(&ed, 0);
+	qbman_eq_desc_set_fq(&ed, fqid);
+
+	return qbman_swp_enqueue_multiple(d->swp, &ed, fd, 0, nb);
+}
+EXPORT_SYMBOL(dpaa2_io_service_enqueue_multiple_fq);
+
+/**
+ * dpaa2_io_service_enqueue_multiple_desc_fq() - Enqueue multiple frames
+ * to different frame queue using a list of fqids.
+ * @d: the given DPIO service.
+ * @fqid: the given list of frame queue ids.
+ * @fd: the frame descriptor which is enqueued.
+ * @nb: number of frames to be enqueud
+ *
+ * Return 0 for successful enqueue, -EBUSY if the enqueue ring is not read=
y,
+ * or -ENODEV if there is no dpio service.
+ */
+int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d,
+				u32 *fqid,
+				const struct dpaa2_fd *fd,
+				int nb)
+{
+	int i;
+	struct qbman_eq_desc ed[32];
+
+	d =3D service_select(d);
+	if (!d)
+		return -ENODEV;
+
+	for (i =3D 0; i < nb; i++) {
+		qbman_eq_desc_clear(&ed[i]);
+		qbman_eq_desc_set_no_orp(&ed[i], 0);
+		qbman_eq_desc_set_fq(&ed[i], fqid[i]);
+	}
+
+	return qbman_swp_enqueue_multiple_desc(d->swp, &ed[0], fd, nb);
+}
+EXPORT_SYMBOL(dpaa2_io_service_enqueue_multiple_desc_fq);
+
+/**
  * dpaa2_io_service_enqueue_qd() - Enqueue a frame to a QD.
  * @d: the given DPIO service.
  * @qdid: the given queuing destination id.
@@ -526,7 +589,7 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);
=20
 /**
  * dpaa2_io_store_create() - Create the dma memory storage for dequeue res=
ult.
- * @max_frames: the maximum number of dequeued result for frames, must be =
<=3D 16.
+ * @max_frames: the maximum number of dequeued result for frames, must be =
<=3D 32.
  * @dev:        the device to allow mapping/unmapping the DMAable region.
  *
  * The size of the storage is "max_frames*sizeof(struct dpaa2_dq)".
@@ -541,7 +604,7 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigned i=
nt max_frames,
 	struct dpaa2_io_store *ret;
 	size_t size;
=20
-	if (!max_frames || (max_frames > 16))
+	if (!max_frames || (max_frames > 32))
 		return NULL;
=20
 	ret =3D kmalloc(sizeof(*ret), GFP_KERNEL);
diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbm=
an-portal.c
index c66f5b7..5a37ac8 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
  * Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
- * Copyright 2016 NXP
+ * Copyright 2016-2019 NXP
  *
  */
=20
@@ -12,13 +12,6 @@
=20
 #include "qbman-portal.h"
=20
-#define QMAN_REV_4000   0x04000000
-#define QMAN_REV_4100   0x04010000
-#define QMAN_REV_4101   0x04010001
-#define QMAN_REV_5000   0x05000000
-
-#define QMAN_REV_MASK   0xffff0000
-
 /* All QBMan command and result structures use this "valid bit" encoding *=
/
 #define QB_VALID_BIT ((u32)0x80)
=20
@@ -156,7 +149,7 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 wn,=
	u8 est, u8 rpm, u8 dcm,
  */
 struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)
 {
-	struct qbman_swp *p =3D kmalloc(sizeof(*p), GFP_KERNEL);
+	struct qbman_swp *p =3D kzalloc(sizeof(*p), GFP_KERNEL);
 	u32 reg;
=20
 	if (!p)
@@ -467,22 +460,32 @@ static inline void qbman_write_eqcr_am_rt_register(st=
ruct qbman_swp *p,
 int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
 		      const struct dpaa2_fd *fd)
 {
-	struct qbman_eq_desc *p;
+	struct qbman_eq_desc_with_fd *p;
 	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
=20
 	if (!EQAR_SUCCESS(eqar))
 		return -EBUSY;
=20
 	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
-	memcpy(&p->dca, &d->dca, 31);
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
 	memcpy(&p->fd, fd, sizeof(*fd));
=20
 	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
 		/* Set the verb byte, have to substitute in the valid-bit */
 		dma_wmb();
-		p->verb =3D d->verb | EQAR_VB(eqar);
+		p->desc.verb =3D d->verb | EQAR_VB(eqar);
 	} else {
-		p->verb =3D d->verb | EQAR_VB(eqar);
+		p->desc.verb =3D d->verb | EQAR_VB(eqar);
 		dma_wmb();
 		qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
 	}
@@ -490,6 +493,60 @@ int qbman_swp_enqueue(struct qbman_swp *s, const struc=
t qbman_eq_desc *d,
 	return 0;
 }
=20
+/**
+ * qbman_swp_enqueue_multiple() - Issue a multi enqueue command
+ * using one enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @flags: table pointer of flags, not used for the moment
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+int qbman_swp_enqueue_multiple(struct qbman_swp *s,
+			       const struct qbman_eq_desc *d,
+			       const struct dpaa2_fd *fd,
+			       uint32_t *flags,
+			       int num_frames)
+{
+	int count =3D 0;
+
+	while (count < num_frames) {
+		if (qbman_swp_enqueue(s, d, fd) !=3D 0)
+			break;
+		count++;
+	}
+
+	return count;
+}
+
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
+int qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,
+				    const struct qbman_eq_desc *d,
+				    const struct dpaa2_fd *fd,
+				    int num_frames)
+{
+	int count =3D 0;
+
+	while (count < num_frames) {
+		if (qbman_swp_enqueue(s, &(d[count]), fd) !=3D 0)
+			break;
+		count++;
+	}
+
+	return count;
+}
+
 /* Static (push) dequeue */
=20
 /**
diff --git a/drivers/soc/fsl/dpio/qbman-portal.h b/drivers/soc/fsl/dpio/qbm=
an-portal.h
index f3ec5d2..ac58a97 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.h
+++ b/drivers/soc/fsl/dpio/qbman-portal.h
@@ -9,6 +9,13 @@
=20
 #include <soc/fsl/dpaa2-fd.h>
=20
+#define QMAN_REV_4000   0x04000000
+#define QMAN_REV_4100   0x04010000
+#define QMAN_REV_4101   0x04010001
+#define QMAN_REV_5000   0x05000000
+
+#define QMAN_REV_MASK   0xffff0000
+
 struct dpaa2_dq;
 struct qbman_swp;
=20
@@ -81,6 +88,10 @@ struct qbman_eq_desc {
 	u8 wae;
 	u8 rspid;
 	__le64 rsp_addr;
+};
+
+struct qbman_eq_desc_with_fd {
+	struct qbman_eq_desc desc;
 	u8 fd[32];
 };
=20
@@ -193,6 +204,19 @@ void *qbman_swp_mc_start(struct qbman_swp *p);
 void qbman_swp_mc_submit(struct qbman_swp *p, void *cmd, u8 cmd_verb);
 void *qbman_swp_mc_result(struct qbman_swp *p);
=20
+int
+qbman_swp_enqueue_multiple(struct qbman_swp *s,
+			   const struct qbman_eq_desc *d,
+			   const struct dpaa2_fd *fd,
+			   uint32_t *flags,
+			   int num_frames);
+
+int
+qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,
+				const struct qbman_eq_desc *d,
+				const struct dpaa2_fd *fd,
+				int num_frames);
+
 /**
  * qbman_result_is_DQ() - check if the dequeue result is a dequeue respons=
e
  * @dq: the dequeue result to be checked
diff --git a/include/soc/fsl/dpaa2-io.h b/include/soc/fsl/dpaa2-io.h
index 672cfb5..c9d8499 100644
--- a/include/soc/fsl/dpaa2-io.h
+++ b/include/soc/fsl/dpaa2-io.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /*
  * Copyright 2014-2016 Freescale Semiconductor Inc.
- * Copyright NXP
+ * Copyright 2017-2019 NXP
  *
  */
 #ifndef __FSL_DPAA2_IO_H
@@ -109,6 +109,10 @@ int dpaa2_io_service_pull_channel(struct dpaa2_io *d, =
u32 channelid,
=20
 int dpaa2_io_service_enqueue_fq(struct dpaa2_io *d, u32 fqid,
 				const struct dpaa2_fd *fd);
+int dpaa2_io_service_enqueue_multiple_fq(struct dpaa2_io *d, u32 fqid,
+				const struct dpaa2_fd *fd, int number_of_frame);
+int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d, u32 *fqi=
d,
+				const struct dpaa2_fd *fd, int number_of_frame);
 int dpaa2_io_service_enqueue_qd(struct dpaa2_io *d, u32 qdid, u8 prio,
 				u16 qdbin, const struct dpaa2_fd *fd);
 int dpaa2_io_service_release(struct dpaa2_io *d, u16 bpid,
--=20
2.7.4

