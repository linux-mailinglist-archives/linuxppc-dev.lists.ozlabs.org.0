Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C300E11D335
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:09:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YgJy5PXKzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.78; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=youri.querry_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="O3Yee5ST"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yg7M2YfnzDr4N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:01:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/3T7P4252DJbFGlXcPZhNIuBZhYLx2FIac0OiZZ/BYIFbiQM2q411bmKzu1HGZNoETqlKHyPvNN56kuAH27F9a+ROxJ5DmPY/Zjzg2dknhakwIKXpw9JII68z7F50aHXXlsiJGtqOUk/0NBV7tXKV/VYU7u2GEj8PiEiJPGTsXnna537aV6r4VWdUjxD8bvgJX0+AbIofjNJGiD3lCDiYoHGiK+Dv/EhKHrxIJfbcO/Pm8dXGHkC/ICsfUaavmfBQyFboVZgBTmXppqBMS9rrH4CcB7VfkTT1Tk2cShQ4kMYLfOqfgpv6zhGeRksVXJjUjzaTZS9vSAS2WBN+eKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZbfMKfMt4F3fKRrX5gCewSkm2ngfNGwBWX1Tm+Gg0=;
 b=dpHvjMShflG/GlScHDU2E3YI+Q3smjlHjsDCqiiuvnQcBvuXteVZaH7n/Y1rFYSJQn9cDG+sdFP/83Y/hPGNWL2RVzCHIwscBiS/gga18p2a6TTsshGeSM1k+pMRh/a1fJM4qU7CTU3Wsvxnvx26dVIjZg0doDfnmxS+V4EmBmgfGayvmJxkkSUMGkIPQP5lRXQp5DJYiDFvmhcG8vuHDQHHqqE7NQXb6lm8nY3awWK6gKaUQzAbNNGHZEAWABGhkHnYHzgrMhgGOQuUgcrc7PT86Mmt9yfiQzCb0SWJ3JGaZ7ZayzDjSDmFKbPXFJzhOQVYjGuNGmAL5nhwAKJ3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZbfMKfMt4F3fKRrX5gCewSkm2ngfNGwBWX1Tm+Gg0=;
 b=O3Yee5STFpV2uKWWj1PFKsPG6J9auEItJfbko4+SyF1Amg4Xnqrv1S6maF++JVNS2bTz0mAKA5Irh1sbuntxy6MxXk/HSxIhL6gSVlAA393lrZA48DJz711zr7JTUNOiHOUJinlM9hIqlyw23vWoxvycH6O0zPEOaP3LWnYmd1o=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (20.179.11.140) by
 DB8PR04MB6650.eurprd04.prod.outlook.com (20.179.251.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 17:01:18 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe%7]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 17:01:18 +0000
From: Youri Querry <youri.querry_1@nxp.com>
To: Roy Pledge <roy.pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
Subject: [PATCH 3/3] soc: fsl: dpio: Replace QMAN array mode by ring mode
 enqueue.
Thread-Topic: [PATCH 3/3] soc: fsl: dpio: Replace QMAN array mode by ring mode
 enqueue.
Thread-Index: AQHVsQ3FmtuoU+XPlUy0BVJpe8ZaMg==
Date: Thu, 12 Dec 2019 17:01:18 +0000
Message-ID: <1576170032-3124-4-git-send-email-youri.querry_1@nxp.com>
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
x-ms-office365-filtering-correlation-id: aff5724a-e762-4a0c-7eab-08d77f24e7b5
x-ms-traffictypediagnostic: DB8PR04MB6650:|DB8PR04MB6650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6650C175D96C5318D16CCB2AF3550@DB8PR04MB6650.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(478600001)(26005)(52116002)(66446008)(6506007)(86362001)(6512007)(316002)(4326008)(2906002)(71200400001)(186003)(36756003)(6486002)(5660300002)(81166006)(81156014)(2616005)(6636002)(64756008)(8676002)(66476007)(30864003)(66946007)(8936002)(110136005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6650;
 H:DB8PR04MB5931.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPQHJZDsu07uUr0e5dknn8H2Wz3Q7mx7wlZKwJIkC/s9nGcIfLhI6zpFfWZIAcxuudO+Mooolcr9cKwqzPze2/ohvWWc9UnUY4XjBZQjmtWAIvWwNRLfbFQE6uQFBBhjojxLYHnE0MFMGpqmWmXdwo+nrXEgG/ORdqnnAg3GK2UMqqWDjVdqbDl9GZiN5DA+5A4TkOUiBIp7S3dKmVXnBDTUUOa10K9uP3cHYsWySt/2XEz9gIj5OnWcFED9SNYoLCI7v5DfMn9S/qo8mpb3/bxKOLbeO/2Y+4YfZDt6DcgYX7VewezvZdHu4cglE/Ij/8a3cSIxXtBnwQUjYg3A/DQmEDNz3yv0DbCXPXpw0hb38ZRwsz/3s/biIh03XR4jS/XfIX5ZUGx1ZO3TyXcEFQmkiO2qDH+dpHr42HdRY+IcU4A1GRw3VcFE803vr8PR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff5724a-e762-4a0c-7eab-08d77f24e7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 17:01:18.1564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wb/f+PJ3jb2cJdDbtPPYkfDHYeHiJbOBRX/uCfmJehged8Ulft5BG0rsKsyRUdFZxn7IeeCjCWh3Vk5oS18JzQ==
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

This change of algorithm will enable faster bulk enqueue.
This will grately benefit XDP bulk enqueue.

Signed-off-by: Youri Querry <youri.querry_1@nxp.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 410 +++++++++++++++++++++++++++-----=
----
 drivers/soc/fsl/dpio/qbman-portal.h |  13 ++
 2 files changed, 328 insertions(+), 95 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbm=
an-portal.c
index 0ffe018..740ee0d 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <soc/fsl/dpaa2-global.h>
=20
 #include "qbman-portal.h"
@@ -21,6 +22,7 @@
=20
 /* CINH register offsets */
 #define QBMAN_CINH_SWP_EQCR_PI      0x800
+#define QBMAN_CINH_SWP_EQCR_CI	    0x840
 #define QBMAN_CINH_SWP_EQAR    0x8c0
 #define QBMAN_CINH_SWP_CR_RT        0x900
 #define QBMAN_CINH_SWP_VDQCR_RT     0x940
@@ -44,6 +46,8 @@
 #define QBMAN_CENA_SWP_CR      0x600
 #define QBMAN_CENA_SWP_RR(vb)  (0x700 + ((u32)(vb) >> 1))
 #define QBMAN_CENA_SWP_VDQCR   0x780
+#define QBMAN_CENA_SWP_EQCR_CI 0x840
+#define QBMAN_CENA_SWP_EQCR_CI_MEMBACK 0x1840
=20
 /* CENA register offsets in memory-backed mode */
 #define QBMAN_CENA_SWP_DQRR_MEM(n)  (0x800 + ((u32)(n) << 6))
@@ -71,6 +75,12 @@
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
@@ -215,6 +225,15 @@ static inline u32 qbman_set_swp_cfg(u8 max_fill, u8 wn=
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
@@ -227,6 +246,10 @@ struct qbman_swp *qbman_swp_init(const struct qbman_sw=
p_desc *d)
 {
 	struct qbman_swp *p =3D kzalloc(sizeof(*p), GFP_KERNEL);
 	u32 reg;
+	u32 mask_size;
+	u32 eqcr_pi;
+
+	spin_lock_init(&p->access_spinlock);
=20
 	if (!p)
 		return NULL;
@@ -255,25 +278,38 @@ struct qbman_swp *qbman_swp_init(const struct qbman_s=
wp_desc *d)
 	p->addr_cena =3D d->cena_bar;
 	p->addr_cinh =3D d->cinh_bar;
=20
-	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000)
-		memset(p->addr_cena, 0, 64 * 1024);
+	if ((p->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
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
+	} else {
+		memset(p->addr_cena, 0, 64 * 1024);
+		reg =3D qbman_set_swp_cfg(p->dqrr.dqrr_size,
+			1, /* Writes Non-cacheable */
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
 		reg |=3D 1 << SWP_CFG_CPBS_SHIFT | /* memory-backed mode */
 		       1 << SWP_CFG_VPM_SHIFT |  /* VDQCR read triggered mode */
 		       1 << SWP_CFG_CPM_SHIFT;   /* CR read triggered mode */
+	}
=20
 	qbman_write_register(p, QBMAN_CINH_SWP_CFG, reg);
 	reg =3D qbman_read_register(p, QBMAN_CINH_SWP_CFG);
@@ -295,7 +331,9 @@ struct qbman_swp *qbman_swp_init(const struct qbman_swp=
_desc *d)
 	 */
 	qbman_write_register(p, QBMAN_CINH_SWP_SDQCR, 0);
=20
+	p->eqcr.pi_ring_size =3D 8;
 	if ((p->desc->qman_version & QMAN_REV_MASK) >=3D QMAN_REV_5000) {
+		p->eqcr.pi_ring_size =3D 32;
 		qbman_swp_enqueue_ptr =3D
 			qbman_swp_enqueue_mem_back;
 		qbman_swp_enqueue_multiple_ptr =3D
@@ -307,6 +345,15 @@ struct qbman_swp *qbman_swp_init(const struct qbman_sw=
p_desc *d)
 		qbman_swp_release_ptr =3D qbman_swp_release_mem_back;
 	}
=20
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
@@ -460,6 +507,7 @@ enum qb_enqueue_commands {
 #define QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT      2
 #define QB_ENQUEUE_CMD_IRQ_ON_DISPATCH_SHIFT 3
 #define QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT     4
+#define QB_ENQUEUE_CMD_DCA_EN_SHIFT          7
=20
 /**
  * qbman_eq_desc_clear() - Clear the contents of a descriptor to
@@ -535,6 +583,7 @@ static inline void qbman_write_eqcr_am_rt_register(stru=
ct qbman_swp *p,
 				     QMAN_RT_MODE);
 }
=20
+#define QB_RT_BIT ((u32)0x100)
 /**
  * qbman_swp_enqueue_direct() - Issue an enqueue command
  * @s:  the software portal used for enqueue
@@ -546,34 +595,19 @@ static inline void qbman_write_eqcr_am_rt_register(st=
ruct qbman_swp *p,
  *
  * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
  */
-int qbman_swp_enqueue_direct(struct qbman_swp *s, const struct qbman_eq_de=
sc *d,
-		      const struct dpaa2_fd *fd)
+static
+int qbman_swp_enqueue_direct(struct qbman_swp *s,
+			     const struct qbman_eq_desc *d,
+			     const struct dpaa2_fd *fd)
 {
-	struct qbman_eq_desc_with_fd *p;
-	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
-
-	if (!EQAR_SUCCESS(eqar))
-		return -EBUSY;
+	int flags =3D 0;
+	int ret =3D qbman_swp_enqueue_multiple_direct(s, d, fd, &flags, 1);
=20
-	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
-	/* This is mapped as DEVICE type memory, writes are
-	 * with address alignment:
-	 * desc.dca address alignment =3D 1
-	 * desc.seqnum address alignment =3D 2
-	 * desc.orpid address alignment =3D 4
-	 * desc.tgtid address alignment =3D 8
-	 */
-	p->desc.dca =3D d->dca;
-	p->desc.seqnum =3D d->seqnum;
-	p->desc.orpid =3D d->orpid;
-	memcpy(&p->desc.tgtid, &d->tgtid, 24);
-	memcpy(&p->fd, fd, sizeof(*fd));
-
-	/* Set the verb byte, have to substitute in the valid-bit */
-	dma_wmb();
-	p->desc.verb =3D d->verb | EQAR_VB(eqar);
-
-	return 0;
+	if (ret >=3D 0)
+		ret =3D 0;
+	else
+		ret =3D -EBUSY;
+	return  ret;
 }
=20
 /**
@@ -587,35 +621,19 @@ int qbman_swp_enqueue_direct(struct qbman_swp *s, con=
st struct qbman_eq_desc *d,
  *
  * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
  */
+static
 int qbman_swp_enqueue_mem_back(struct qbman_swp *s,
 			       const struct qbman_eq_desc *d,
 			       const struct dpaa2_fd *fd)
 {
-	struct qbman_eq_desc_with_fd *p;
-	u32 eqar =3D qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
-
-	if (!EQAR_SUCCESS(eqar))
-		return -EBUSY;
+	int flags =3D 0;
+	int ret =3D qbman_swp_enqueue_multiple_mem_back(s, d, fd, &flags, 1);
=20
-	p =3D qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
-	/* This is mapped as DEVICE type memory, writes are
-	 * with address alignment:
-	 * desc.dca address alignment =3D 1
-	 * desc.seqnum address alignment =3D 2
-	 * desc.orpid address alignment =3D 4
-	 * desc.tgtid address alignment =3D 8
-	 */
-	p->desc.dca =3D d->dca;
-	p->desc.seqnum =3D d->seqnum;
-	p->desc.orpid =3D d->orpid;
-	memcpy(&p->desc.tgtid, &d->tgtid, 24);
-	memcpy(&p->fd, fd, sizeof(*fd));
-
-	p->desc.verb =3D d->verb | EQAR_VB(eqar);
-	dma_wmb();
-	qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
-
-	return 0;
+	if (ret >=3D 0)
+		ret =3D 0;
+	else
+		ret =3D -EBUSY;
+	return  ret;
 }
=20
 /**
@@ -624,26 +642,82 @@ int qbman_swp_enqueue_mem_back(struct qbman_swp *s,
  * @s:  the software portal used for enqueue
  * @d:  the enqueue descriptor
  * @fd: table pointer of frame descriptor table to be enqueued
- * @flags: table pointer of flags, not used for the moment
+ * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
  * @num_frames: number of fd to be enqueued
  *
  * Return the number of fd enqueued, or a negative error number.
  */
+static
 int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 				      const struct qbman_eq_desc *d,
 				      const struct dpaa2_fd *fd,
 				      uint32_t *flags,
 				      int num_frames)
 {
-	int count =3D 0;
+	uint32_t *p =3D NULL;
+	const uint32_t *cl =3D (uint32_t *)d;
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+	uint64_t addr_cena;
+
+	spin_lock(&s->access_spinlock);
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
+		s->eqcr.ci =3D qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
+
+		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
+					eqcr_ci, s->eqcr.ci);
+		if (!s->eqcr.available) {
+			spin_unlock(&s->access_spinlock);
+			return 0;
+		}
+	}
=20
-	while (count < num_frames) {
-		if (qbman_swp_enqueue_direct(s, d, fd) !=3D 0)
-			break;
-		count++;
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
-	return count;
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
+	/* Flush all the cacheline without load/store in between */
+	eqcr_pi =3D s->eqcr.pi;
+	addr_cena =3D (size_t)s->addr_cena;
+	for (i =3D 0; i < num_enqueued; i++)
+		eqcr_pi++;
+	s->eqcr.pi =3D eqcr_pi & full_mask;
+	spin_unlock(&s->access_spinlock);
+
+	return num_enqueued;
 }
=20
 /**
@@ -652,26 +726,80 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_sw=
p *s,
  * @s:  the software portal used for enqueue
  * @d:  the enqueue descriptor
  * @fd: table pointer of frame descriptor table to be enqueued
- * @flags: table pointer of flags, not used for the moment
+ * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
  * @num_frames: number of fd to be enqueued
  *
  * Return the number of fd enqueued, or a negative error number.
  */
+static
 int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
-				      const struct qbman_eq_desc *d,
-				      const struct dpaa2_fd *fd,
-				      uint32_t *flags,
-				      int num_frames)
+					const struct qbman_eq_desc *d,
+					const struct dpaa2_fd *fd,
+					uint32_t *flags,
+					int num_frames)
 {
-	int count =3D 0;
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
=20
-	while (count < num_frames) {
-		if (qbman_swp_enqueue_mem_back(s, d, fd) !=3D 0)
-			break;
-		count++;
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
 	}
+	s->eqcr.pi =3D eqcr_pi & full_mask;
=20
-	return count;
+	dma_wmb();
+	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,
+				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);
+	local_irq_restore(irq_flags);
+	spin_unlock(&s->access_spinlock);
+
+	return num_enqueued;
 }
=20
 /**
@@ -684,20 +812,66 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_=
swp *s,
  *
  * Return the number of fd enqueued, or a negative error number.
  */
+static
 int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
 					   const struct qbman_eq_desc *d,
 					   const struct dpaa2_fd *fd,
 					   int num_frames)
 {
-	int count =3D 0;
+	uint32_t *p;
+	const uint32_t *cl;
+	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
+	int i, num_enqueued =3D 0;
+	uint64_t addr_cena;
+
+	half_mask =3D (s->eqcr.pi_ci_mask>>1);
+	full_mask =3D s->eqcr.pi_ci_mask;
+	if (!s->eqcr.available) {
+		eqcr_ci =3D s->eqcr.ci;
+		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
+		s->eqcr.ci =3D qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
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
=20
-	while (count < num_frames) {
-		if (qbman_swp_enqueue_direct(s, &(d[count]), fd) !=3D 0)
-			break;
-		count++;
+	/* Set the verb byte, have to substitute in the valid-bit */
+	eqcr_pi =3D s->eqcr.pi;
+	for (i =3D 0; i < num_enqueued; i++) {
+		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
+		cl =3D (uint32_t *)(&d[i]);
+		p[0] =3D cl[0] | s->eqcr.pi_vb;
+		eqcr_pi++;
+		if (!(eqcr_pi & half_mask))
+			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
 	}
=20
-	return count;
+	/* Flush all the cacheline without load/store in between */
+	eqcr_pi =3D s->eqcr.pi;
+	addr_cena =3D (uint64_t)s->addr_cena;
+	for (i =3D 0; i < num_enqueued; i++)
+		eqcr_pi++;
+	s->eqcr.pi =3D eqcr_pi & full_mask;
+
+	return num_enqueued;
 }
=20
 /**
@@ -710,20 +884,62 @@ int qbman_swp_enqueue_multiple_desc_direct(struct qbm=
an_swp *s,
  *
  * Return the number of fd enqueued, or a negative error number.
  */
+static
 int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
 					   const struct qbman_eq_desc *d,
 					   const struct dpaa2_fd *fd,
 					   int num_frames)
 {
-	int count =3D 0;
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
=20
-	while (count < num_frames) {
-		if (qbman_swp_enqueue_mem_back(s, &(d[count]), fd) !=3D 0)
-			break;
-		count++;
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
 	}
=20
-	return count;
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
@@ -889,6 +1105,7 @@ void qbman_pull_desc_set_channel(struct qbman_pull_des=
c *d, u32 chid,
  * Return 0 for success, and -EBUSY if the software portal is not ready
  * to do pull dequeue.
  */
+static
 int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_desc *d)
 {
 	struct qbman_pull_desc *p;
@@ -924,6 +1141,7 @@ int qbman_swp_pull_direct(struct qbman_swp *s, struct =
qbman_pull_desc *d)
  * Return 0 for success, and -EBUSY if the software portal is not ready
  * to do pull dequeue.
  */
+static
 int qbman_swp_pull_mem_back(struct qbman_swp *s, struct qbman_pull_desc *d=
)
 {
 	struct qbman_pull_desc *p;
@@ -942,6 +1160,8 @@ int qbman_swp_pull_mem_back(struct qbman_swp *s, struc=
t qbman_pull_desc *d)
 	p->dq_src =3D d->dq_src;
 	p->rsp_addr =3D d->rsp_addr;
 	p->rsp_addr_virt =3D d->rsp_addr_virt;
+
+	/* Set the verb byte, have to substitute in the valid-bit */
 	p->verb =3D d->verb | s->vdq.valid_bit;
 	s->vdq.valid_bit ^=3D QB_VALID_BIT;
 	dma_wmb();
diff --git a/drivers/soc/fsl/dpio/qbman-portal.h b/drivers/soc/fsl/dpio/qbm=
an-portal.h
index 3b3fb86..c7c2225 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.h
+++ b/drivers/soc/fsl/dpio/qbman-portal.h
@@ -143,6 +143,19 @@ struct qbman_swp {
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
 /* Function pointers */
--=20
2.7.4

