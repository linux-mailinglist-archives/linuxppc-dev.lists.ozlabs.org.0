Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E502D6374
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:25:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLRP1GSfzDr10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:25:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLC51FDBzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:12 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH39wE068303; Thu, 10 Dec 2020 12:15:05 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bqqu8ekb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:05 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHEBUH004158;
 Thu, 10 Dec 2020 17:15:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u86149-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:15:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHF0rA26083836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:15:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB279AE051;
 Thu, 10 Dec 2020 17:15:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A321AE053;
 Thu, 10 Dec 2020 17:15:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:15:00 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0D73822012A;
 Thu, 10 Dec 2020 18:14:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/13] powerpc/xive: Improve error reporting of OPAL calls
Date: Thu, 10 Dec 2020 18:14:49 +0100
Message-Id: <20201210171450.1933725-13-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=1 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100106
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a vp_err() macro to standardize error reporting.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/native.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index e91519c42463..05a800a3104e 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -122,6 +122,8 @@ static int xive_native_get_irq_config(u32 hw_irq, u32=
 *target, u8 *prio,
 	return rc =3D=3D 0 ? 0 : -ENXIO;
 }
=20
+#define vp_err(vp, fmt, ...) pr_err("VP[0x%x]: " fmt, vp, ##__VA_ARGS__)
+
 /* This can be called multiple time to change a queue configuration */
 int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
 				__be32 *qpage, u32 order, bool can_escalate)
@@ -149,7 +151,7 @@ int xive_native_configure_queue(u32 vp_id, struct xiv=
e_q *q, u8 prio,
 				      &esc_irq_be,
 				      NULL);
 	if (rc) {
-		pr_err("Error %lld getting queue info prio %d\n", rc, prio);
+		vp_err(vp_id, "Failed to get queue %d info : %lld\n", prio, rc);
 		rc =3D -EIO;
 		goto fail;
 	}
@@ -172,7 +174,7 @@ int xive_native_configure_queue(u32 vp_id, struct xiv=
e_q *q, u8 prio,
 		msleep(OPAL_BUSY_DELAY_MS);
 	}
 	if (rc) {
-		pr_err("Error %lld setting queue for prio %d\n", rc, prio);
+		vp_err(vp_id, "Failed to set queue %d info: %lld\n", prio, rc);
 		rc =3D -EIO;
 	} else {
 		/*
@@ -199,7 +201,7 @@ static void __xive_native_disable_queue(u32 vp_id, st=
ruct xive_q *q, u8 prio)
 		msleep(OPAL_BUSY_DELAY_MS);
 	}
 	if (rc)
-		pr_err("Error %lld disabling queue for prio %d\n", rc, prio);
+		vp_err(vp_id, "Failed to disable queue %d : %lld\n", prio, rc);
 }
=20
 void xive_native_disable_queue(u32 vp_id, struct xive_q *q, u8 prio)
@@ -698,6 +700,8 @@ int xive_native_enable_vp(u32 vp_id, bool single_esca=
lation)
 			break;
 		msleep(OPAL_BUSY_DELAY_MS);
 	}
+	if (rc)
+		vp_err(vp_id, "Failed to enable VP : %lld\n", rc);
 	return rc ? -EIO : 0;
 }
 EXPORT_SYMBOL_GPL(xive_native_enable_vp);
@@ -712,6 +716,8 @@ int xive_native_disable_vp(u32 vp_id)
 			break;
 		msleep(OPAL_BUSY_DELAY_MS);
 	}
+	if (rc)
+		vp_err(vp_id, "Failed to disable VP : %lld\n", rc);
 	return rc ? -EIO : 0;
 }
 EXPORT_SYMBOL_GPL(xive_native_disable_vp);
@@ -723,8 +729,10 @@ int xive_native_get_vp_info(u32 vp_id, u32 *out_cam_=
id, u32 *out_chip_id)
 	s64 rc;
=20
 	rc =3D opal_xive_get_vp_info(vp_id, NULL, &vp_cam_be, NULL, &vp_chip_id=
_be);
-	if (rc)
+	if (rc) {
+		vp_err(vp_id, "Failed to get VP info : %lld\n", rc);
 		return -EIO;
+	}
 	*out_cam_id =3D be64_to_cpu(vp_cam_be) & 0xffffffffu;
 	*out_chip_id =3D be32_to_cpu(vp_chip_id_be);
=20
@@ -755,8 +763,7 @@ int xive_native_get_queue_info(u32 vp_id, u32 prio,
 	rc =3D opal_xive_get_queue_info(vp_id, prio, &qpage, &qsize,
 				      &qeoi_page, &escalate_irq, &qflags);
 	if (rc) {
-		pr_err("OPAL failed to get queue info for VCPU %d/%d : %lld\n",
-		       vp_id, prio, rc);
+		vp_err(vp_id, "failed to get queue %d info : %lld\n", prio, rc);
 		return -EIO;
 	}
=20
@@ -784,8 +791,7 @@ int xive_native_get_queue_state(u32 vp_id, u32 prio, =
u32 *qtoggle, u32 *qindex)
 	rc =3D opal_xive_get_queue_state(vp_id, prio, &opal_qtoggle,
 				       &opal_qindex);
 	if (rc) {
-		pr_err("OPAL failed to get queue state for VCPU %d/%d : %lld\n",
-		       vp_id, prio, rc);
+		vp_err(vp_id, "failed to get queue %d state : %lld\n", prio, rc);
 		return -EIO;
 	}
=20
@@ -804,8 +810,7 @@ int xive_native_set_queue_state(u32 vp_id, u32 prio, =
u32 qtoggle, u32 qindex)
=20
 	rc =3D opal_xive_set_queue_state(vp_id, prio, qtoggle, qindex);
 	if (rc) {
-		pr_err("OPAL failed to set queue state for VCPU %d/%d : %lld\n",
-		       vp_id, prio, rc);
+		vp_err(vp_id, "failed to set queue %d state : %lld\n", prio, rc);
 		return -EIO;
 	}
=20
@@ -827,8 +832,7 @@ int xive_native_get_vp_state(u32 vp_id, u64 *out_stat=
e)
=20
 	rc =3D opal_xive_get_vp_state(vp_id, &state);
 	if (rc) {
-		pr_err("OPAL failed to get vp state for VCPU %d : %lld\n",
-		       vp_id, rc);
+		vp_err(vp_id, "failed to get vp state : %lld\n", rc);
 		return -EIO;
 	}
=20
--=20
2.26.2

