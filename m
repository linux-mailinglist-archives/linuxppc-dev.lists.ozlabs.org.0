Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC932B99C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:51:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM4k1DZPz3dhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM285lmYz3cYq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:49:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HWOoY055134; Wed, 3 Mar 2021 12:49:07 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372eusgk0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 12:49:07 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123HhS4W019867;
 Wed, 3 Mar 2021 17:49:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 36yj532135-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:49:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123Hn2d730605684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 17:49:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD5011C058;
 Wed,  3 Mar 2021 17:49:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB1C811C04A;
 Wed,  3 Mar 2021 17:49:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 17:49:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 286E5220523;
 Wed,  3 Mar 2021 18:49:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/8] powerpc/xive: Drop check on irq_data in
 xive_core_debug_show()
Date: Wed,  3 Mar 2021 18:48:54 +0100
Message-Id: <20210303174857.1760393-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303174857.1760393-1-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1034 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030124
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
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 7581cb12bb53..60ebd6f4b31d 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1586,6 +1586,8 @@ static void xive_debug_show_irq(struct seq_file *m,=
 struct irq_data *d)
 	u32 target;
 	u8 prio;
 	u32 lirq;
+	struct xive_irq_data *xd;
+	u64 val;
=20
 	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
@@ -1596,17 +1598,14 @@ static void xive_debug_show_irq(struct seq_file *=
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
2.26.2

