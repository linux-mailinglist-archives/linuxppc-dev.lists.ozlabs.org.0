Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07936F6F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlTs5Sbbz3fj0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:12:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJm5wxKz3bTZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:39 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U847RO073149; Fri, 30 Apr 2021 04:04:27 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388ds6ghbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U7xT3k030866;
 Fri, 30 Apr 2021 08:04:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8jy9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84NTd41943298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A65211C052;
 Fri, 30 Apr 2021 08:04:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5731711C04C;
 Fri, 30 Apr 2021 08:04:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D8BC6220193;
 Fri, 30 Apr 2021 10:04:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 23/31] powerpc/xics: Drop unmask of MSIs at startup
Date: Fri, 30 Apr 2021 10:03:59 +0200
Message-Id: <20210430080407.4030767-24-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ED2pq-YRMH_dFz6lMvQi61Dt_1PLAQ63
X-Proofpoint-ORIG-GUID: ED2pq-YRMH_dFz6lMvQi61Dt_1PLAQ63
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_03:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1034
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300056
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

That was a workaround in the XICS domain because of the lack of MSI
domain. This is now handled.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/ics-opal.c | 11 -----------
 arch/powerpc/sysdev/xics/ics-rtas.c |  9 ---------
 2 files changed, 20 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xi=
cs/ics-opal.c
index bf26cae1b982..c4d95d8beb6f 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -62,17 +62,6 @@ static void ics_opal_unmask_irq(struct irq_data *d)
=20
 static unsigned int ics_opal_startup(struct irq_data *d)
 {
-#ifdef CONFIG_PCI_MSI
-	/*
-	 * The generic MSI code returns with the interrupt disabled on the
-	 * card, using the MSI mask bits. Firmware doesn't appear to unmask
-	 * at that level, so we do it here by hand.
-	 */
-	if (irq_data_get_msi_desc(d))
-		pci_msi_unmask_irq(d);
-#endif
-
-	/* unmask it */
 	ics_opal_unmask_irq(d);
 	return 0;
 }
diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xi=
cs/ics-rtas.c
index b50c6341682e..b9da317b7a2d 100644
--- a/arch/powerpc/sysdev/xics/ics-rtas.c
+++ b/arch/powerpc/sysdev/xics/ics-rtas.c
@@ -57,15 +57,6 @@ static void ics_rtas_unmask_irq(struct irq_data *d)
=20
 static unsigned int ics_rtas_startup(struct irq_data *d)
 {
-#ifdef CONFIG_PCI_MSI
-	/*
-	 * The generic MSI code returns with the interrupt disabled on the
-	 * card, using the MSI mask bits. Firmware doesn't appear to unmask
-	 * at that level, so we do it here by hand.
-	 */
-	if (irq_data_get_msi_desc(d))
-		pci_msi_unmask_irq(d);
-#endif
 	/* unmask it */
 	ics_rtas_unmask_irq(d);
 	return 0;
--=20
2.26.3

