Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E7AABAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:04:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PVVB2c2xzDr4d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 05:04:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.54; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=youri.querry_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="ODe8kbyN"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40054.outbound.protection.outlook.com [40.107.4.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PVRb4vKCzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 05:01:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzsZE1l6LsVYekwjhHg3Yifiz+6yvQd8FgyHNjarfUTTcmEBKuyMpk+6D6QTxkwy2IHiO0kklJZREnMI9T9kNgDEautKkIR0/dZvjUIyDaT8tMMlaZ93Qob6d4jC2/RdE1M4HrpNAahAhLmh86SyD/a05rAO14cAGNpZ1BeFboiFTwyqtVqMjx9wWwytg2GfV4GFXAcK8yjrS1x0/9j03ONQ6Vahd6110GayM5rBSLoPH6O/cKQgz0VwuWuj8bevx7drrGsoAPutWEDXW/8AS6lw1wUdBzfFVpMdiksfYdSCRgmqXBX5TlTdcscaafAr580/lp71CURSCkFQjEQmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzynJA1t7meK9SxC9Hs6QVU6rvV+7FdZf5pg0k10TB8=;
 b=lPI4EkNX3185HXQhbduumMqz8/8f9r+2eX8Hjb4pZFY1a59Nf7t4NpBptvzYblYIvEKFpNeFlN/Km0tljniRr/ZmGXIQ0Ja3UlEye7KQLsHXibR5hwnoJ9cvtHQWj1kNxYbauUKjr9qSlE13uiEODduSLLZutDL75ecK/9V5iKC9nWK7xKEUCDYFfgdmtF1+g8/Qm5btl2AgtaYt0AYtE2QTB3F2WcT/inGZfQSe97e3DIZp+7pAci4OHq2skiNVGXiL8yeOYAK9OrwywfjWG4nFhKEic8tfB+6durgkScXcvIB058YRYAERvwLj3B6X4FRQ75o9ezq1KvO2R+GI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzynJA1t7meK9SxC9Hs6QVU6rvV+7FdZf5pg0k10TB8=;
 b=ODe8kbyNaGOT6NF0gH0uVw7R4BnRpCs0GtqiekF2ytBmlTePJ85ui57wKRNDxHLebBlHgNK2+2dLjT6/uhcJjem3bZ1IujUi4MTdMZbj0verjoUBPIIUkyKVCYsdG4O9kau00M1VGO9OHi4MoO4aQLh49huvLREOGptbOlP37Kc=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (20.179.11.140) by
 DB8PR04MB5754.eurprd04.prod.outlook.com (20.179.10.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 5 Sep 2019 19:01:51 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::1103:c959:3d3d:86d5]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::1103:c959:3d3d:86d5%4]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 19:01:51 +0000
From: Youri Querry <youri.querry_1@nxp.com>
To: Roy Pledge <roy.pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciocoi Radulescu
 <ruxandra.radulescu@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2] soc: fsl: dpio: Add support for QBMan ring bulk enqueue.
Thread-Topic: [PATCH v2] soc: fsl: dpio: Add support for QBMan ring bulk
 enqueue.
Thread-Index: AQHVZBxfogPyBrug70O/HGqPQoZScQ==
Date: Thu, 5 Sep 2019 19:01:50 +0000
Message-ID: <1567710063-922-1-git-send-email-youri.querry_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0201CA0036.namprd02.prod.outlook.com
 (2603:10b6:803:2e::22) To DB8PR04MB5931.eurprd04.prod.outlook.com
 (2603:10a6:10:ae::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=youri.querry_1@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e0fc42-849c-4c0b-c430-08d73233822c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB5754; 
x-ms-traffictypediagnostic: DB8PR04MB5754:|DB8PR04MB5754:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB57547F605D07C2595F6FBCF4F3BB0@DB8PR04MB5754.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(199004)(189003)(2501003)(386003)(6506007)(50226002)(6636002)(102836004)(486006)(476003)(5660300002)(316002)(25786009)(2616005)(2906002)(53946003)(14444005)(53936002)(256004)(99286004)(36756003)(4326008)(6436002)(2201001)(52116002)(86362001)(7736002)(6512007)(81156014)(66066001)(8936002)(14454004)(8676002)(71190400001)(110136005)(305945005)(66476007)(66556008)(186003)(66446008)(81166006)(64756008)(30864003)(3846002)(71200400001)(478600001)(26005)(6116002)(66946007)(6486002)(559001)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB5754;
 H:DB8PR04MB5931.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vWHk3iqHOAJKW1KKJsZkpBMdC50u0S8+7udWIwYxlXcdyJd9Tpbkjq7AS6ZQyZOFEG+lInKKPqeL1BhafNI1Pqjy/K5WIU7vXiVc1K35P68Q2WX0MgXlhzpM+CWGG7m345aEC06eKRG+IrhU/p5g3SBmnBZWWt1UJ8jtIJJycoESHIgdB05iH3xPpLFBLySHWMmdRElyp7CQDZskIx8ZD9MdEH7pcritp4C2Iwq3zBR3yjN+wgfYcgtj1xpdEKOhK+xpaeaEcPgbclhoZKxO0g2T51CzLaedi1Y6t3AHNTL5718cm8jH7EQl6XqP9PIqex3e2rmbEaMltRxMJWtQmNWPRpGN3ng57yyt82iCfWe+nWcSjBikqTGZ7AUirt/PYyrOX4DNOQhELsWch7lbs4jIhWI0tWEa2fjWYihQpCs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e0fc42-849c-4c0b-c430-08d73233822c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 19:01:50.9754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTZCWAhL4S2Dm3NmAnon4PMeRdDRK7MrSi4kpL3PKcxMMRzwTHRkMslhnM8+PfF1Ri4DO7j3yy8zvuAwC4yw/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5754
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

The QBMan frame descriptor enqueuing is changed from array
 mode (a single frame enqueue at a time) to bulk ring mode.

This new mode allows the enqueuing of multiple frames in one operation.
The original interface is kept but use the bulk enqueue of one frame

Signed-off-by: Youri Querry <youri.querry_1@nxp.com>
---
 drivers/soc/fsl/dpio/dpio-service.c |  69 +++-
 drivers/soc/fsl/dpio/qbman-portal.c | 772 ++++++++++++++++++++++++++++++++=
----
 drivers/soc/fsl/dpio/qbman-portal.h | 175 +++++++-
 3 files changed, 935 insertions(+), 81 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpi=
o-service.c
index b9539ef..4eb53ee 100644
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
@@ -435,6 +435,69 @@ int dpaa2_io_service_enqueue_fq(struct dpaa2_io *d,
 EXPORT_SYMBOL(dpaa2_io_service_enqueue_fq);
=20
 /**
+ * dpaa2_io_service_enqueue_multiple_fq() - Enqueue multiple frames
+ * to a frame queue using one fqid.
+ * @d: the given DPIO service.
+ * @fqid: the given frame queue id.
+ * @fd: the list of frame descriptors enqueued.
+ * @nb: number of frames to be enqueued
+ *
+ * Return the number of enqueued frames (0 if EQCR is busy)
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
+ * @fd: the list of frame descriptors enqueued.
+ * @nb: number of frames to be enqueued
+ *
+ * Return the number of enqueued frames (0 if EQCR is busy)
+ * or -ENODEV if there is no dpio service.
+ */
+int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d,
+				u32 *fqid,
+				const struct dpaa2_fd *fd,
+				int nb)
+{
+	int i;
+	struct qbman_eq_desc_min ed[32];
+
+	d =3D service_select(d);
+	if (!d)
+		return -ENODEV;
+
+	for (i =3D 0; i < nb; i++) {
+		qbman_eq_desc_min_clear(&ed[i]);
+		qbman_eq_desc_set_no_orp_min(&ed[i], 0);
+		qbman_eq_desc_set_min_fq(&ed[i], fqid[i]);
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
@@ -528,7 +591,7 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);
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
@@ -543,7 +606,7 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigned i=
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
index c66f5b7..0ed2c8f 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
  * Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
- * Copyright 2016 NXP
+ * Copyright 2016-2019 NXP
  *
  */
=20
 #include <asm/cacheflush.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <soc/fsl/dpaa2-global.h>
=20
 #include "qbman-portal.h"
@@ -28,6 +29,7 @@
=20
 /* CINH register offsets */
 #define QBMAN_CINH_SWP_EQCR_PI      0x800
+#define QBMAN_CINH_SWP_EQCR_CI	    0x840
 #define QBMAN_CINH_SWP_EQAR    0x8c0
 #define QBMAN_CINH_SWP_CR_RT        0x900
 #define QBMAN_CINH_SWP_VDQCR_RT     0x940
@@ -51,6 +53,8 @@
 #define QBMAN_CENA_SWP_CR      0x600
 #define QBMAN_CENA_SWP_RR(vb)  (0x700 + ((u32)(vb) >> 1))
 #define QBMAN_CENA_SWP_VDQCR   0x780
+#define QBMAN_CENA_SWP_EQCR_CI 0x840
+#define QBMAN_CENA_SWP_EQCR_CI_MEMBACK 0x1840
=20
 /* CENA register offsets in memory-backed mode */
 #define QBMAN_CENA_SWP_DQRR_MEM(n)  (0x800 + ((u32)(n) << 6))
@@ -78,6 +82,12 @@
 /* opaque token for static dequeues */
 #define QMAN_SDQCR_TOKEN    0xbb
=20
+#define QBMAN_EQCR_DCA_IDXMASK          0x0f
+#define QBMAN_ENQUEUE_FLAG_DCA          (1ULL << 31)
+
+#define EQ_DESC_SIZE_WITHOUT_FD 29
+#define EQ_DESC_SIZE_FD_START 32
+
 enum qbman_sdqcr_dct {
 	qbman_sdqcr_dct_null =3D 0,
 	qbman_sdqcr_dct_prio_ics,
@@ -90,6 +100,82 @@ enum qbman_sdqcr_fc {
 	qbman_sdqcr_fc_up_to_3 =3D 1
 };
=20
+/* Internal Function declaration */
+static int qbman_swp_enqueue_ring_mode_direct(struct qbman_swp *s,
+					      const struct qbman_eq_desc *d,
+					      const struct dpaa2_fd *fd);
+static int qbman_swp_enqueue_ring_mode_mem_back(struct qbman_swp *s,
+						const struct qbman_eq_desc *d,
+						const struct dpaa2_fd *fd);
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
+				       const struct qbman_eq_desc_min *d,
+				       const struct dpaa2_fd *fd,
+				       int num_frames);
+static
+int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
+					     const struct qbman_eq_desc_min *d,
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
+int (*qbman_swp_enqueue_ring_mode_ptr)(struct qbman_swp *s,
+				       const struct qbman_eq_desc *d,
+				       const struct dpaa2_fd *fd)
+	=3D qbman_swp_enqueue_ring_mode_direct;
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
+				       const struct qbman_eq_desc_min *d,
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
@@ -146,6 +232,15 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 wn=
,	u8 est, u8 rpm, u8 dcm,
=20
 #define QMAN_RT_MODE	   0x00000100
=20
+static inline u8 qm_cyc_diff(u8 ringsize, u8 first, u8 last)
+{
+	/* 'first' is included, 'last' is excluded */
+	if (first <=3D last)
+		return last - first;
+	else
+		return (2 * ringsize) - (first - last);
+}
+
 /**
  * qbman_swp_init() - Create a functional object representing the given
  *                    QBMan portal descriptor.
@@ -156,8 +251,12 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 wn=
,	u8 est, u8 rpm, u8 dcm,
  */
 struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)
 {
-	struct qbman_swp *p =3D kmalloc(sizeof(*p), GFP_KERNEL);
+	struct qbman_swp *p =3D kzalloc(sizeof(*p), GFP_KERNEL);
 	u32 reg;
+	u32 mask_size;
+	u32 eqcr_pi;
+
+	spin_lock_init(&p->access_spinlock);
=20
 	if (!p)
 		return NULL;
@@ -189,22 +288,39 @@ struct qbman_swp *qbman_swp_init(const struct qbman_s=
wp_desc *d)
 	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000)
 		memset(p->addr_cena, 0, 64 * 1024);
=20
-	reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,
-				1, /* Writes Non-cacheable */
-				0, /* EQCR_CI stashing threshold */
-				3, /* RPM: Valid bit mode, RCR in array mode */
-				2, /* DCM: Discrete consumption ack mode */
-				3, /* EPM: Valid bit mode, EQCR in array mode */
-				1, /* mem stashing drop enable =3D=3D TRUE */
-				1, /* mem stashing priority =3D=3D TRUE */
-				1, /* mem stashing enable =3D=3D TRUE */
-				1, /* dequeue stashing priority =3D=3D TRUE */
-				0, /* dequeue stashing enable =3D=3D FALSE */
-				0); /* EQCR_CI stashing priority =3D=3D FALSE */
-	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000)
+	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {
+
+		reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,
+			0, /* Writes Non-cacheable */
+			1, /* EQCR_CI stashing threshold */
+			3, /* RPM: RCR in array mode */
+			2, /* DCM: Discrete consumption ack */
+			0, /* EPM: EQCR in ring mode */
+			1, /* mem stashing drop enable */
+			1, /* mem stashing priority enable */
+			1, /* mem stashing enable */
+			1, /* dequeue stashing priority enable */
+			0, /* dequeue stashing enable */
+			0); /* EQCR_CI stashing priority enable */
+	} else {
+		reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,
+			1, /* Writes Non-cacheable */
+			0, /* EQCR_CI stashing threshold */
+			3, /* RPM: RCR in array mode */
+			2, /* DCM: Discrete consumption ack */
+			2, /* EPM: EQCR in ring mode */
+			1, /* mem stashing drop enable enable */
+			1, /* mem stashing priority enable */
+			1, /* mem stashing enable */
+			1, /* dequeue stashing priority enable */
+			0, /* dequeue stashing enable enable */
+			0); /* EQCR_CI stashing priority enable */
+	}
+	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {
 		reg |=3D 1 << SWP_CFG_CPBS_SHIFT | /* memory-backed mode */
 		       1 << SWP_CFG_VPM_SHIFT |  /* VDQCR read triggered mode */
 		       1 << SWP_CFG_CPM_SHIFT;   /* CR read triggered mode */
+	}
=20
 	qbman_write_register(p, QBMAN_CINH_SWP_CFG, reg);
 	reg =3D qbman_read_register(p, QBMAN_CINH_SWP_CFG);
@@ -225,6 +341,30 @@ struct qbman_swp *qbman_swp_init(const struct qbman_sw=
p_desc *d)
 	 * applied when dequeues from a specific channel are enabled.
 	 */
 	qbman_write_register(p, QBMAN_CINH_SWP_SDQCR, 0);
+
+	p->eqcr.pi_ring_size =3D 8;
+	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {
+		p->eqcr.pi_ring_size =3D 32;
+		qbman_swp_enqueue_ring_mode_ptr =3D
+			qbman_swp_enqueue_ring_mode_mem_back;
+		qbman_swp_enqueue_multiple_ptr =3D
+			qbman_swp_enqueue_multiple_mem_back;
+		qbman_swp_enqueue_multiple_desc_ptr =3D
+			qbman_swp_enqueue_multiple_desc_mem_back;
+		qbman_swp_pull_ptr =3D qbman_swp_pull_mem_back;
+		qbman_swp_dqrr_next_ptr =3D qbman_swp_dqrr_next_mem_back;
+		qbman_swp_release_ptr =3D qbman_swp_release_mem_back;
+	}
+
+	for (mask_size =3D p->eqcr.pi_ring_size; mask_size > 0; mask_size >>=3D 1=
)
+		p->eqcr.pi_ci_mask =3D (p->eqcr.pi_ci_mask << 1) + 1;
+	eqcr_pi =3D qbman_read_register(p, QBMAN_CINH_SWP_EQCR_PI);
+	p->eqcr.pi =3D eqcr_pi & p->eqcr.pi_ci_mask;
+	p->eqcr.pi_vb =3D eqcr_pi & QB_VALID_BIT;
+	p->eqcr.ci =3D qbman_read_register(p, QBMAN_CINH_SWP_EQCR_CI)
+			& p->eqcr.pi_ci_mask;
+	p->eqcr.available =3D p->eqcr.pi_ring_size;
+
 	return p;
 }
=20
@@ -378,6 +518,7 @@ enum qb_enqueue_commands {
 #define QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT      2
 #define QB_ENQUEUE_CMD_IRQ_ON_DISPATCH_SHIFT 3
 #define QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT     4
+#define QB_ENQUEUE_CMD_DCA_EN_SHIFT          7
=20
 /**
  * qbman_eq_desc_clear() - Clear the contents of a descriptor to
@@ -389,6 +530,16 @@ void qbman_eq_desc_clear(struct qbman_eq_desc *d)
 }
=20
 /**
+ * qbman_eq_desc_min_clear() - Clear the contents of a minimal
+ *			   enqueue descriptor to
+ *                         default/starting state.
+ */
+void qbman_eq_desc_min_clear(struct qbman_eq_desc_min *d)
+{
+	memset(d, 0, sizeof(*d));
+}
+
+/**
  * qbman_eq_desc_set_no_orp() - Set enqueue descriptor without orp
  * @d:                the enqueue descriptor.
  * @response_success: 1 =3D enqueue with response always; 0 =3D enqueue wi=
th
@@ -403,6 +554,22 @@ void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *d,=
 int respond_success)
 		d->verb |=3D enqueue_rejects_to_fq;
 }
=20
+/**
+ * qbman_eq_desc_set_no_orp_min() - Set minimal enqueue descriptor without=
 orp
+ * @d:                the enqueue descriptor.
+ * @response_success: 1 =3D enqueue with response always; 0 =3D enqueue wi=
th
+ *                    rejections returned on a FQ.
+ */
+void qbman_eq_desc_set_no_orp_min(struct qbman_eq_desc_min *d,
+				  int respond_success)
+{
+	d->verb &=3D ~(1 << QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT);
+	if (respond_success)
+		d->verb |=3D enqueue_response_always;
+	else
+		d->verb |=3D enqueue_rejects_to_fq;
+}
+
 /*
  * Exactly one of the following descriptor "targets" should be set. (Calli=
ng any
  * one of these will replace the effect of any prior call to one of these.=
)
@@ -422,6 +589,17 @@ void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u32=
 fqid)
 }
=20
 /**
+ * qbman_eq_desc_set_min_fq() - set the FQ for the minimal enqueue command
+ * @d:    the enqueue descriptor
+ * @fqid: the id of the frame queue to be enqueued
+ */
+void qbman_eq_desc_set_min_fq(struct qbman_eq_desc_min *d, u32 fqid)
+{
+	d->verb &=3D ~(1 << QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT);
+	d->tgtid =3D cpu_to_le32(fqid);
+}
+
+/**
  * qbman_eq_desc_set_qd() - Set Queuing Destination for the enqueue comman=
d
  * @d:       the enqueue descriptor
  * @qdid:    the id of the queuing destination to be enqueued
@@ -453,41 +631,340 @@ static inline void qbman_write_eqcr_am_rt_register(s=
truct qbman_swp *p,
 				     QMAN_RT_MODE);
 }
=20
+#define QB_RT_BIT ((u32)0x100)
 /**
- * qbman_swp_enqueue() - Issue an enqueue command
+ * qbman_swp_enqueue_ring_mode_direct() - Issue an enqueue command
  * @s:  the software portal used for enqueue
  * @d:  the enqueue descriptor
  * @fd: the frame descriptor to be enqueued
  *
- * Please note that 'fd' should only be NULL if the "action" of the
- * descriptor is "orp_hole" or "orp_nesn".
+ * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
+ */
+static
+int qbman_swp_enqueue_ring_mode_direct(struct qbman_swp *s,
+				       const struct qbman_eq_desc *d,
+				       const struct dpaa2_fd *fd)
+{
+	int flags =3D 0;
+	int ret =3D qbman_swp_enqueue_multiple_direct(s, d, fd, &flags, 1);
+
+	if (ret >=3D 0)
+		ret =3D 0;
+	else
+		ret =3D -EBUSY;
+	return  ret;
+}
+
+/**
+ * qbman_swp_enqueue_ring_mode_mem_back() - Issue an enqueue command
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: the frame descriptor to be enqueued
  *
  * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
  */
-int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
-		      const struct dpaa2_fd *fd)
+static
+int qbman_swp_enqueue_ring_mode_mem_back(struct qbman_swp *s,
+					 const struct qbman_eq_desc *d,
+					 const struct dpaa2_fd *fd)
 {
-	struct qbman_eq_desc *p;
-	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
+	int flags =3D 0;
+	int ret =3D qbman_swp_enqueue_multiple_mem_back(s, d, fd, &flags, 1);
=20
-	if (!EQAR_SUCCESS(eqar))
-		return -EBUSY;
+	if (ret >=3D 0)
+		ret =3D 0;
+	else
+		ret =3D -EBUSY;
+	return  ret;
+}
=20
-	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
-	memcpy(&p->dca, &d->dca, 31);
-	memcpy(&p->fd, fd, sizeof(*fd));
+/**
+ * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
+ * using one enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+static
+int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+				      int num_frames)
+{
+	uint32_t *p =3D NULL;
+	const uint32_t *cl =3D (uint32_t *)d;
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
+		s->eqcr.ci =3D __raw_readl(p) & full_mask;
+
+		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
+					eqcr_ci, s->eqcr.ci);
+		if (!s->eqcr.available)
+			return 0;
+	}
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
-		/* Set the verb byte, have to substitute in the valid-bit */
-		dma_wmb();
-		p->verb =3D d->verb | EQAR_VB(eqar);
-	} else {
-		p->verb =3D d->verb | EQAR_VB(eqar);
-		dma_wmb();
-		qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
+	eqcr_pi =3D s->eqcr.pi;
+	num_enqueued =3D (s->eqcr.available < num_frames) ?
+			s->eqcr.available : num_frames;
+	s->eqcr.available -=3D num_enqueued;
+	/* Fill in the EQCR ring */
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		/* Skip copying the verb */
+		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
+		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
+		       &fd[i], sizeof(*fd));
+		eqcr_pi++;
 	}
=20
-	return 0;
+	dma_wmb();
+
+	/* Set the verb byte, have to substitute in the valid-bit */
+	eqcr_pi =3D s->eqcr.pi;
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		p[0] =3D cl[0] | s->eqcr.pi_vb;
+		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
+			struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
+
+			d->dca =3D (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
+				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
+		}
+		eqcr_pi++;
+		if (!(eqcr_pi & half_mask))
+			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
+	}
+
+	s->eqcr.pi =3D (s->eqcr.pi + num_enqueued) & full_mask;
+
+	return num_enqueued;
+}
+
+/**
+ * qbman_swp_enqueue_multiple_mem_back() - Issue a multi enqueue command
+ * using one enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  the enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+static
+int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
+					const struct qbman_eq_desc *d,
+					const struct dpaa2_fd *fd,
+					uint32_t *flags,
+					int num_frames)
+{
+	uint32_t *p =3D NULL;
+	const uint32_t *cl =3D (uint32_t *)(d);
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+	unsigned long irq_flags;
+
+	spin_lock(&s->access_spinlock);
+	local_irq_save(irq_flags);
+
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI_MEMBACK;
+		s->eqcr.ci =3D __raw_readl(p) & full_mask;
+		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
+					eqcr_ci, s->eqcr.ci);
+		if (!s->eqcr.available) {
+			local_irq_restore(irq_flags);
+			spin_unlock(&s->access_spinlock);
+			return 0;
+		}
+	}
+
+	eqcr_pi =3D s->eqcr.pi;
+	num_enqueued =3D (s->eqcr.available < num_frames) ?
+			s->eqcr.available : num_frames;
+	s->eqcr.available -=3D num_enqueued;
+	/* Fill in the EQCR ring */
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		/* Skip copying the verb */
+		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
+		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
+		       &fd[i], sizeof(*fd));
+		eqcr_pi++;
+	}
+
+	/* Set the verb byte, have to substitute in the valid-bit */
+	eqcr_pi =3D s->eqcr.pi;
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		p[0] =3D cl[0] | s->eqcr.pi_vb;
+		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
+			struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
+
+			d->dca =3D (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
+				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
+		}
+		eqcr_pi++;
+		if (!(eqcr_pi & half_mask))
+			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
+	}
+	s->eqcr.pi =3D eqcr_pi & full_mask;
+
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,
+				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);
+	local_irq_restore(irq_flags);
+	spin_unlock(&s->access_spinlock);
+
+	return num_enqueued;
+}
+
+/**
+ * qbman_swp_enqueue_multiple_desc_direct() - Issue a multi enqueue comman=
d
+ * using multiple enqueue descriptor
+ * @s:  the software portal used for enqueue
+ * @d:  table of minimal enqueue descriptor
+ * @fd: table pointer of frame descriptor table to be enqueued
+ * @num_frames: number of fd to be enqueued
+ *
+ * Return the number of fd enqueued, or a negative error number.
+ */
+static
+int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
+					   const struct qbman_eq_desc_min *d,
+					   const struct dpaa2_fd *fd,
+					   int num_frames)
+{
+	uint32_t *p;
+	const uint32_t *cl;
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
+		s->eqcr.ci =3D __raw_readl(p) & full_mask;
+		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
+					eqcr_ci, s->eqcr.ci);
+		if (!s->eqcr.available)
+			return 0;
+	}
+
+	eqcr_pi =3D s->eqcr.pi;
+	num_enqueued =3D (s->eqcr.available < num_frames) ?
+			s->eqcr.available : num_frames;
+	s->eqcr.available -=3D num_enqueued;
+	/* Fill in the EQCR ring */
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		cl =3D (uint32_t *)(&d[i]);
+		/* Skip copying the verb */
+		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
+		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
+		       &fd[i], sizeof(*fd));
+		eqcr_pi++;
+	}
+
+	dma_wmb();
+
+	/* Set the verb byte, have to substitute in the valid-bit */
+	eqcr_pi =3D s->eqcr.pi;
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		cl =3D (uint32_t *)(&d[i]);
+		p[0] =3D cl[0] | s->eqcr.pi_vb;
+		eqcr_pi++;
+		if (!(eqcr_pi & half_mask))
+			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
+	}
+	s->eqcr.pi =3D (s->eqcr.pi + num_enqueued) & full_mask;
+
+	return num_enqueued;
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
+static
+int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
+					     const struct qbman_eq_desc_min *d,
+					     const struct dpaa2_fd *fd,
+					     int num_frames)
+{
+	uint32_t *p;
+	const uint32_t *cl;
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI_MEMBACK;
+		s->eqcr.ci =3D __raw_readl(p) & full_mask;
+		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
+					eqcr_ci, s->eqcr.ci);
+		if (!s->eqcr.available)
+			return 0;
+	}
+
+	eqcr_pi =3D s->eqcr.pi;
+	num_enqueued =3D (s->eqcr.available < num_frames) ?
+			s->eqcr.available : num_frames;
+	s->eqcr.available -=3D num_enqueued;
+	/* Fill in the EQCR ring */
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		cl =3D (uint32_t *)(&d[i]);
+		/* Skip copying the verb */
+		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
+		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
+		       &fd[i], sizeof(*fd));
+		eqcr_pi++;
+	}
+
+	/* Set the verb byte, have to substitute in the valid-bit */
+	eqcr_pi =3D s->eqcr.pi;
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		cl =3D (uint32_t *)(&d[i]);
+		p[0] =3D cl[0] | s->eqcr.pi_vb;
+		eqcr_pi++;
+		if (!(eqcr_pi & half_mask))
+			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
+	}
+
+	s->eqcr.pi =3D eqcr_pi & full_mask;
+
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,
+				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);
+
+	return num_enqueued;
 }
=20
 /* Static (push) dequeue */
@@ -645,7 +1122,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_des=
c *d, u32 chid,
 }
=20
 /**
- * qbman_swp_pull() - Issue the pull dequeue command
+ * qbman_swp_pull_direct() - Issue the pull dequeue command
  * @s: the software portal object
  * @d: the software portal descriptor which has been configured with
  *     the set of qbman_pull_desc_set_*() calls
@@ -653,7 +1130,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_des=
c *d, u32 chid,
  * Return 0 for success, and -EBUSY if the software portal is not ready
  * to do pull dequeue.
  */
-int qbman_swp_pull(struct qbman_swp *s, struct qbman_pull_desc *d)
+static int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_de=
sc *d)
 {
 	struct qbman_pull_desc *p;
=20
@@ -671,18 +1148,48 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbman=
_pull_desc *d)
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
+static int qbman_swp_pull_mem_back(struct qbman_swp *s,
+				   struct qbman_pull_desc *d)
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
+
+	/* Set the verb byte, have to substitute in the valid-bit */
+	p->verb =3D d->verb | s->vdq.valid_bit;
+	s->vdq.valid_bit ^=3D QB_VALID_BIT;
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_VDQCR_RT, QMAN_RT_MODE);
=20
 	return 0;
 }
@@ -690,14 +1197,14 @@ int qbman_swp_pull(struct qbman_swp *s, struct qbman=
_pull_desc *d)
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
@@ -740,10 +1247,7 @@ const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbm=
an_swp *s)
 				       QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
 	}
=20
-	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));
-	else
-		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR_MEM(s->dqrr.next_idx));
+	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx));
 	verb =3D p->dq.verb;
=20
 	/*
@@ -785,6 +1289,98 @@ const struct dpaa2_dq *qbman_swp_dqrr_next(struct qbm=
an_swp *s)
 }
=20
 /**
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
+			 QBMAN_CENA_SWP_DQRR(s->dqrr.next_idx)));
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
+	if (response_verb =3D=3D QBMAN_RESULT_DQ &&
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
  * qbman_swp_dqrr_consume() -  Consume DQRR entries previously returned fr=
om
  *                             qbman_swp_dqrr_next().
  * @s: the software portal object
@@ -872,7 +1468,7 @@ void qbman_release_desc_set_rcdi(struct qbman_release_=
desc *d, int enable)
 #define RAR_SUCCESS(rar) ((rar) & 0x100)
=20
 /**
- * qbman_swp_release() - Issue a buffer release command
+ * qbman_swp_release_direct() - Issue a buffer release command
  * @s:           the software portal object
  * @d:           the release descriptor
  * @buffers:     a pointer pointing to the buffer address to be released
@@ -880,8 +1476,53 @@ void qbman_release_desc_set_rcdi(struct qbman_release=
_desc *d, int enable)
  *
  * Return 0 for success, -EBUSY if the release command ring is not ready.
  */
-int qbman_swp_release(struct qbman_swp *s, const struct qbman_release_desc=
 *d,
-		      const u64 *buffers, unsigned int num_buffers)
+int qbman_swp_release_direct(struct qbman_swp *s,
+			     const struct qbman_release_desc *d,
+			     const u64 *buffers, unsigned int num_buffers)
+{
+	int i;
+	struct qbman_release_desc *p;
+	u32 rar;
+
+	if (!num_buffers || num_buffers > 7)
+		return -EINVAL;
+
+	rar =3D qbman_read_register(s, QBMAN_CINH_SWP_RAR);
+	if (!RAR_SUCCESS(rar))
+		return -EBUSY;
+
+	/* Start the release command */
+	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
+		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR(RAR_IDX(rar)));
+	else
+		p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_RCR_MEM(RAR_IDX(rar)));
+	/* Copy the caller's buffer pointers to the command */
+	for (i =3D 0; i < num_buffers; i++)
+		p->buf[i] =3D cpu_to_le64(buffers[i]);
+	p->bpid =3D d->bpid;
+
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
 {
 	int i;
 	struct qbman_release_desc *p;
@@ -904,19 +1545,10 @@ int qbman_swp_release(struct qbman_swp *s, const str=
uct qbman_release_desc *d,
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
+	p->verb =3D d->verb | RAR_VB(rar) | num_buffers;
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_RCR_AM_RT +
+			     RAR_IDX(rar)  * 4, QMAN_RT_MODE);
=20
 	return 0;
 }
diff --git a/drivers/soc/fsl/dpio/qbman-portal.h b/drivers/soc/fsl/dpio/qbm=
an-portal.h
index f3ec5d2..f4b6e47 100644
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
@@ -67,6 +74,22 @@ enum qbman_pull_type_e {
 #define QBMAN_FQ_XOFF		0x4e
=20
 /* structure of enqueue descriptor */
+struct qbman_eq_desc_min {
+	u8 verb;
+	u8 dca;
+	__le16 seqnum;
+	__le16 orpid;
+	__le16 reserved1;
+	__le32 tgtid;
+	__le32 tag;
+	__le16 qdbin;
+	u8 qpri;
+	u8 reserved[3];
+	u8 wae;
+	u8 rspid;
+	__le64 rsp_addr;
+};
+
 struct qbman_eq_desc {
 	u8 verb;
 	u8 dca;
@@ -132,8 +155,48 @@ struct qbman_swp {
 		u8 dqrr_size;
 		int reset_bug; /* indicates dqrr reset workaround is needed */
 	} dqrr;
+
+	struct {
+		u32 pi;
+		u32 pi_vb;
+		u32 pi_ring_size;
+		u32 pi_ci_mask;
+		u32 ci;
+		int available;
+		u32 pend;
+		u32 no_pfdr;
+	} eqcr;
+
+	spinlock_t access_spinlock;
 };
=20
+/* Function pointers */
+extern
+int (*qbman_swp_enqueue_ring_mode_ptr)(struct qbman_swp *s,
+				       const struct qbman_eq_desc *d,
+				       const struct dpaa2_fd *fd);
+extern
+int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
+				      const struct qbman_eq_desc *d,
+				      const struct dpaa2_fd *fd,
+				      uint32_t *flags,
+				      int num_frames);
+extern
+int (*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,
+					   const struct qbman_eq_desc_min *d,
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
@@ -158,29 +221,25 @@ void qbman_pull_desc_set_wq(struct qbman_pull_desc *d=
, u32 wqid,
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
=20
 void qbman_eq_desc_clear(struct qbman_eq_desc *d);
+void qbman_eq_desc_min_clear(struct qbman_eq_desc_min *d);
 void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *d, int respond_success=
);
+void qbman_eq_desc_set_no_orp_min(struct qbman_eq_desc_min *d,
+				  int respond_success);
 void qbman_eq_desc_set_token(struct qbman_eq_desc *d, u8 token);
 void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u32 fqid);
+void qbman_eq_desc_set_min_fq(struct qbman_eq_desc_min *d, u32 fqid);
 void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,
 			  u32 qd_bin, u32 qd_prio);
=20
-int qbman_swp_enqueue(struct qbman_swp *p, const struct qbman_eq_desc *d,
-		      const struct dpaa2_fd *fd);
-
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
@@ -194,6 +253,61 @@ void qbman_swp_mc_submit(struct qbman_swp *p, void *cm=
d, u8 cmd_verb);
 void *qbman_swp_mc_result(struct qbman_swp *p);
=20
 /**
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
+	return qbman_swp_enqueue_ring_mode_ptr(s, d, fd);
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
+qbman_swp_enqueue_multiple(struct qbman_swp *s,
+			   const struct qbman_eq_desc *d,
+			   const struct dpaa2_fd *fd,
+			   uint32_t *flags,
+			   int num_frames)
+{
+	return qbman_swp_enqueue_multiple_ptr(s, d, fd, flags, num_frames);
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
+static inline int
+qbman_swp_enqueue_multiple_desc(struct qbman_swp *s,
+				const struct qbman_eq_desc_min *d,
+				const struct dpaa2_fd *fd,
+				int num_frames)
+{
+	return qbman_swp_enqueue_multiple_desc_ptr(s, d, fd, num_frames);
+}
+
+/**
  * qbman_result_is_DQ() - check if the dequeue result is a dequeue respons=
e
  * @dq: the dequeue result to be checked
  *
@@ -504,4 +618,49 @@ int qbman_bp_query(struct qbman_swp *s, u16 bpid,
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

