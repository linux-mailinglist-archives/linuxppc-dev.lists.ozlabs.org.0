Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7B2D63CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:41:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLn82syKzDqk8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLCL4NRYzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:26 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH9tDp078163; Thu, 10 Dec 2020 12:15:03 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bqj68h27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:02 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHDMsI002820;
 Thu, 10 Dec 2020 17:15:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhp19w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:15:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHEw4r25559546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC2CB4C040;
 Thu, 10 Dec 2020 17:14:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CC874C059;
 Thu, 10 Dec 2020 17:14:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:14:58 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 02D1322012A;
 Thu, 10 Dec 2020 18:14:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/13] powerpc/xive: Remove P9 DD1 flag
 XIVE_IRQ_FLAG_SHIFT_BUG
Date: Thu, 10 Dec 2020 18:14:45 +0100
Message-Id: <20201210171450.1933725-9-clg@kaod.org>
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
 mlxscore=0 mlxlogscore=766
 impostorscore=0 clxscore=1034 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100105
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

This flag was used to support the PHB4 LSIs on P9 DD1 and we have
stopped supporting this CPU when DD2 came out. See skiboot commit:

  https://github.com/open-power/skiboot/commit/0b0d15e3c170

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/opal-api.h     | 2 +-
 arch/powerpc/include/asm/xive.h         | 2 +-
 arch/powerpc/kvm/book3s_xive_native.c   | 3 ---
 arch/powerpc/kvm/book3s_xive_template.c | 3 ---
 arch/powerpc/sysdev/xive/common.c       | 9 ---------
 arch/powerpc/sysdev/xive/native.c       | 2 --
 6 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/a=
sm/opal-api.h
index 1dffa3cb16ba..48ee604ca39a 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1091,7 +1091,7 @@ enum {
 	OPAL_XIVE_IRQ_TRIGGER_PAGE	=3D 0x00000001,
 	OPAL_XIVE_IRQ_STORE_EOI		=3D 0x00000002,
 	OPAL_XIVE_IRQ_LSI		=3D 0x00000004,
-	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008,
+	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008, /* P9 DD1.0 workaround */
 	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010,
 	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020,
 };
diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index d332dd9a18de..b3c039d0bb6e 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -60,7 +60,7 @@ struct xive_irq_data {
 };
 #define XIVE_IRQ_FLAG_STORE_EOI	0x01
 #define XIVE_IRQ_FLAG_LSI	0x02
-#define XIVE_IRQ_FLAG_SHIFT_BUG	0x04
+/* #define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 */ /* P9 DD1.0 workaround */
 #define XIVE_IRQ_FLAG_MASK_FW	0x08
 #define XIVE_IRQ_FLAG_EOI_FW	0x10
 #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
index 9b395381179d..170d1d04e1d1 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -37,9 +37,6 @@ static u8 xive_vm_esb_load(struct xive_irq_data *xd, u3=
2 offset)
 	 * ordering.
 	 */
=20
-	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
-		offset |=3D offset << 4;
-
 	val =3D in_be64(xd->eoi_mmio + offset);
 	return (u8)val;
 }
diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/b=
ook3s_xive_template.c
index 4ad3c0279458..ece36e024a8f 100644
--- a/arch/powerpc/kvm/book3s_xive_template.c
+++ b/arch/powerpc/kvm/book3s_xive_template.c
@@ -61,9 +61,6 @@ static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd=
, u32 offset)
 	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
 		offset |=3D XIVE_ESB_LD_ST_MO;
=20
-	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
-		offset |=3D offset << 4;
-
 	val =3D__x_readq(__x_eoi_page(xd) + offset);
 #ifdef __LITTLE_ENDIAN__
 	val >>=3D 64-8;
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 348445ffa0af..7b6e3149f1ea 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -200,10 +200,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data=
 *xd, u32 offset)
 	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
 		offset |=3D XIVE_ESB_LD_ST_MO;
=20
-	/* Handle HW errata */
-	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
-		offset |=3D offset << 4;
-
 	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
 		val =3D xive_ops->esb_rw(xd->hw_irq, offset, 0, 0);
 	else
@@ -214,10 +210,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data=
 *xd, u32 offset)
=20
 static void xive_esb_write(struct xive_irq_data *xd, u32 offset, u64 dat=
a)
 {
-	/* Handle HW errata */
-	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
-		offset |=3D offset << 4;
-
 	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
 		xive_ops->esb_rw(xd->hw_irq, offset, data, 1);
 	else
@@ -1312,7 +1304,6 @@ static const struct {
 } xive_irq_flags[] =3D {
 	{ XIVE_IRQ_FLAG_STORE_EOI, "STORE_EOI" },
 	{ XIVE_IRQ_FLAG_LSI,       "LSI"       },
-	{ XIVE_IRQ_FLAG_SHIFT_BUG, "SHIFT_BUG" },
 	{ XIVE_IRQ_FLAG_MASK_FW,   "MASK_FW"   },
 	{ XIVE_IRQ_FLAG_EOI_FW,    "EOI_FW"    },
 	{ XIVE_IRQ_FLAG_H_INT_ESB, "H_INT_ESB" },
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index c3182ec9ed65..f501b1640068 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xi=
ve_irq_data *data)
 		data->flags |=3D XIVE_IRQ_FLAG_STORE_EOI;
 	if (opal_flags & OPAL_XIVE_IRQ_LSI)
 		data->flags |=3D XIVE_IRQ_FLAG_LSI;
-	if (opal_flags & OPAL_XIVE_IRQ_SHIFT_BUG)
-		data->flags |=3D XIVE_IRQ_FLAG_SHIFT_BUG;
 	if (opal_flags & OPAL_XIVE_IRQ_MASK_VIA_FW)
 		data->flags |=3D XIVE_IRQ_FLAG_MASK_FW;
 	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)
--=20
2.26.2

