Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90E35029D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:47:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Tg465dGz3d2R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdG4Wcnz2yjc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEYCrd082955; Wed, 31 Mar 2021 10:45:25 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37mpe1sqkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEgk7x017245;
 Wed, 31 Mar 2021 14:45:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37mngr08um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12VEj1s720382166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BECAE52050;
 Wed, 31 Mar 2021 14:45:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 8037B5204E;
 Wed, 31 Mar 2021 14:45:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B1325220190;
 Wed, 31 Mar 2021 16:45:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/9] powerpc/xive: Drop check on irq_data in
 xive_core_debug_show()
Date: Wed, 31 Mar 2021 16:45:10 +0200
Message-Id: <20210331144514.892250-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MhZLUqodeuIcbSf433S07dWrTvVPZtre
X-Proofpoint-GUID: MhZLUqodeuIcbSf433S07dWrTvVPZtre
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 clxscore=1034 bulkscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310105
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
Cc: kernel test robot <lkp@intel.com>, Greg Kurz <groug@kaod.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When looping on IRQ descriptor, irq_data is always valid.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal X=
IVE state")
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 4149ca846e7c..f5fe60c194bc 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1607,6 +1607,8 @@ static void xive_debug_show_irq(struct seq_file *m,=
 struct irq_data *d)
 	u32 target;
 	u8 prio;
 	u32 lirq;
+	struct xive_irq_data *xd;
+	u64 val;
=20
 	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
@@ -1617,17 +1619,14 @@ static void xive_debug_show_irq(struct seq_file *=
m, struct irq_data *d)
 	seq_printf(m, "IRQ 0x%08x : target=3D0x%x prio=3D%02x lirq=3D0x%x ",
 		   hw_irq, target, prio, lirq);
=20
-	if (d) {
-		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
-		u64 val =3D xive_esb_read(xd, XIVE_ESB_GET);
-
-		seq_printf(m, "flags=3D%c%c%c PQ=3D%c%c",
-			   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
-			   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
-			   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
-			   val & XIVE_ESB_VAL_P ? 'P' : '-',
-			   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
-	}
+	xd =3D irq_data_get_irq_handler_data(d);
+	val =3D xive_esb_read(xd, XIVE_ESB_GET);
+	seq_printf(m, "flags=3D%c%c%c PQ=3D%c%c",
+		   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
+		   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
+		   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
+		   val & XIVE_ESB_VAL_P ? 'P' : '-',
+		   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
 	seq_puts(m, "\n");
 }
=20
--=20
2.26.3

