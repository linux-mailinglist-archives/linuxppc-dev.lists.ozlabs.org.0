Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 826252D2E59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:36:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4624Tm5zDqB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:36:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3Yf2JPhzDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:11:50 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8Ew10U117235; Tue, 8 Dec 2020 10:11:38 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a4x1d7k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:11:37 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8FB6jW024878;
 Tue, 8 Dec 2020 15:11:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svkjvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:11:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8FBXPw6881866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 15:11:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CD12A4087;
 Tue,  8 Dec 2020 15:11:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79EF8A405E;
 Tue,  8 Dec 2020 15:11:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Dec 2020 15:11:32 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 076BA220190;
 Tue,  8 Dec 2020 16:11:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/13] powerpc/xive: Improve error reporting of OPAL calls
Date: Tue,  8 Dec 2020 16:11:24 +0100
Message-Id: <20201208151124.1329942-14-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208151124.1329942-1-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=1 clxscore=1034 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080086
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a vp_err() macro to standardize error reporting.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/native.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index 4902d05ebbd1..42297a131a6e 100644
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

