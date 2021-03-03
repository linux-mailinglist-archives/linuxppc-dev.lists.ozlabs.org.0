Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCC32B997
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:50:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM3Y1xzKz3dNM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:50:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM255wnmz3cJY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:49:17 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HlCNA037192; Wed, 3 Mar 2021 12:49:07 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372f5f01mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 12:49:07 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123Hgpsu015088;
 Wed, 3 Mar 2021 17:49:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37293fr9yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:49:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123Hn36U34079066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 17:49:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 338DCA4040;
 Wed,  3 Mar 2021 17:49:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB93AA404D;
 Wed,  3 Mar 2021 17:49:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 17:49:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 380DB220523;
 Wed,  3 Mar 2021 18:49:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/8] powerpc/xive: Fix xmon command "dxi"
Date: Wed,  3 Mar 2021 18:48:56 +0100
Message-Id: <20210303174857.1760393-8-clg@kaod.org>
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
 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
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

When under xmon, the "dxi" command dumps the state of the XIVE
interrupts. If an interrupt number is specified, only the state of
the associated XIVE interrupt is dumped. This form of the command
lacks an irq_data parameter which is nevertheless used by
xmon_xive_get_irq_config(), leading to an xmon crash.

Fix that by doing a lookup in the system IRQ mapping to query the IRQ
descriptor data. Invalid interrupt numbers, or not belonging to the
XIVE IRQ domain, OPAL event interrupt number for instance, should be
caught by the previous query done at the firmware level.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 97ef27507793 ("powerpc/xive: Fix xmon support on the PowerNV platf=
orm")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index f6b7b15bbb3a..8eefd152b947 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -255,17 +255,20 @@ notrace void xmon_xive_do_dump(int cpu)
 	xmon_printf("\n");
 }
=20
+static struct irq_data *xive_get_irq_data(u32 hw_irq)
+{
+	unsigned int irq =3D irq_find_mapping(xive_irq_domain, hw_irq);
+
+	return irq ? irq_get_irq_data(irq) : NULL;
+}
+
 int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
 {
-	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
 	int rc;
 	u32 target;
 	u8 prio;
 	u32 lirq;
=20
-	if (!is_xive_irq(chip))
-		return -EINVAL;
-
 	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
 		xmon_printf("IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);
@@ -275,6 +278,9 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_d=
ata *d)
 	xmon_printf("IRQ 0x%08x : target=3D0x%x prio=3D%02x lirq=3D0x%x ",
 		    hw_irq, target, prio, lirq);
=20
+	if (!d)
+		d =3D xive_get_irq_data(hw_irq);
+
 	if (d) {
 		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
 		u64 val =3D xive_esb_read(xd, XIVE_ESB_GET);
--=20
2.26.2

