Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF636F6F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlTV70gwz3fcq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:12:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJm5FD2z3bTT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U848ZW073410; Fri, 30 Apr 2021 04:04:32 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388ds6ghdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U84UDp031192;
 Fri, 30 Apr 2021 08:04:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8jxyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U843t720578596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF144AE053;
 Fri, 30 Apr 2021 08:04:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B03ADAE051;
 Fri, 30 Apr 2021 08:04:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2BE93220193;
 Fri, 30 Apr 2021 10:04:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 31/31] genirq: Improve "hwirq" output in /proc and /sys/
Date: Fri, 30 Apr 2021 10:04:07 +0200
Message-Id: <20210430080407.4030767-32-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fVVuA74vXKGALC-e8RPWPslLymgm3xE4
X-Proofpoint-ORIG-GUID: fVVuA74vXKGALC-e8RPWPslLymgm3xE4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_03:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=656
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HW IRQ numbers generated by the PCI MSI layer can be quite large
on a pSeries machine when running under the IBM Hypervisor and they
appear as negative. Use '%u' to show them correctly.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 kernel/irq/irqdesc.c | 2 +-
 kernel/irq/proc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index cc1a09406c6e..85054eb2ae51 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -188,7 +188,7 @@ static ssize_t hwirq_show(struct kobject *kobj,
=20
 	raw_spin_lock_irq(&desc->lock);
 	if (desc->irq_data.domain)
-		ret =3D sprintf(buf, "%d\n", (int)desc->irq_data.hwirq);
+		ret =3D sprintf(buf, "%u\n", (int)desc->irq_data.hwirq);
 	raw_spin_unlock_irq(&desc->lock);
=20
 	return ret;
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 98138788cb04..e2392f05da04 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -513,7 +513,7 @@ int show_interrupts(struct seq_file *p, void *v)
 		seq_printf(p, " %8s", "None");
 	}
 	if (desc->irq_data.domain)
-		seq_printf(p, " %*d", prec, (int) desc->irq_data.hwirq);
+		seq_printf(p, " %*u", prec, (int)desc->irq_data.hwirq);
 	else
 		seq_printf(p, " %*s", prec, "");
 #ifdef CONFIG_GENERIC_IRQ_SHOW_LEVEL
--=20
2.26.3

