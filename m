Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4343B730D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 15:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDlNr3S1pz3bWg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 23:16:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDlNS0J6sz2yNH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 23:16:07 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TD4eZ0051674; Tue, 29 Jun 2021 09:15:51 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g2na2ytn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 09:15:50 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TDCtn4010862;
 Tue, 29 Jun 2021 13:15:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 39duv8gp7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 13:15:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15TDFjdl25559434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 13:15:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8656A409C;
 Tue, 29 Jun 2021 13:15:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90E16A4099;
 Tue, 29 Jun 2021 13:15:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 29 Jun 2021 13:15:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.151])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BE5C2220021;
 Tue, 29 Jun 2021 15:15:43 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xive: Do not skip CPU-less nodes when creating the
 IPIs
Date: Tue, 29 Jun 2021 15:15:42 +0200
Message-Id: <20210629131542.743888-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uUxqi967g8YRGToYliyfTC_TOr22VzJ1
X-Proofpoint-ORIG-GUID: uUxqi967g8YRGToYliyfTC_TOr22VzJ1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1034 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290088
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
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, stable@vger.kernel.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerVM, CPU-less nodes can be populated with hot-plugged CPUs at
runtime. Today, the IPI is not created for such nodes, and hot-plugged
CPUs use a bogus IPI, which leads to soft lockups.

We could create the node IPI on demand but it is a bit complex because
this code would be called under bringup_up() and some IRQ locking is
being done. The simplest solution is to create the IPIs for all nodes
at startup.

Fixes: 7dcc37b3eff9 ("powerpc/xive: Map one IPI interrupt per node")
Cc: stable@vger.kernel.org # v5.13
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

This patch breaks old versions of irqbalance (<=3D v1.4). Possible nodes
are collected from /sys/devices/system/node/ but CPU-less nodes are
not listed there. When interrupts are scanned, the link representing
the node structure is NULL and segfault occurs.

Version 1.7 seems immune.=20

---
 arch/powerpc/sysdev/xive/common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index f3b16ed48b05..5d2c58dba57e 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1143,10 +1143,6 @@ static int __init xive_request_ipi(void)
 		struct xive_ipi_desc *xid =3D &xive_ipis[node];
 		struct xive_ipi_alloc_info info =3D { node };
=20
-		/* Skip nodes without CPUs */
-		if (cpumask_empty(cpumask_of_node(node)))
-			continue;
-
 		/*
 		 * Map one IPI interrupt per node for all cpus of that node.
 		 * Since the HW interrupt number doesn't have any meaning,
--=20
2.31.1

