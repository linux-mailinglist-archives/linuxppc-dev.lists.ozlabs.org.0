Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C536F6DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlNp2fbyz3dbw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:08:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJc5b2jz30FD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:32 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U84HLP191384; Fri, 30 Apr 2021 04:04:25 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388cm3jn4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:25 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U84OWF025991;
 Fri, 30 Apr 2021 08:04:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 384ay81npw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U83u8034930960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:03:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FA50AE05D;
 Fri, 30 Apr 2021 08:04:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26AA5AE053;
 Fri, 30 Apr 2021 08:04:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 95B692200B7;
 Fri, 30 Apr 2021 10:04:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/31] powerpc/xics: Give a name to the default XICS IRQ domain
Date: Fri, 30 Apr 2021 10:03:54 +0200
Message-Id: <20210430080407.4030767-19-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bUlyvDRR3Vy_985GWVhdzhGqtYWJvehf
X-Proofpoint-GUID: bUlyvDRR3Vy_985GWVhdzhGqtYWJvehf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=889 clxscore=1034 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

and clean up the error path.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index 2fa45cd12a82..9815873333c7 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -412,11 +412,22 @@ static const struct irq_domain_ops xics_host_ops =3D=
 {
 	.xlate =3D xics_host_xlate,
 };
=20
-static void __init xics_init_host(void)
+static int __init xics_allocate_domain(void)
 {
-	xics_host =3D irq_domain_add_tree(NULL, &xics_host_ops, NULL);
-	BUG_ON(xics_host =3D=3D NULL);
+	struct fwnode_handle *fn;
+
+	fn =3D irq_domain_alloc_named_fwnode("XICS");
+	if (!fn)
+		return -ENOMEM;
+
+	xics_host =3D irq_domain_create_tree(fn, &xics_host_ops, NULL);
+	if (!xics_host) {
+		irq_domain_free_fwnode(fn);
+		return -ENOMEM;
+	}
+
 	irq_set_default_host(xics_host);
+	return 0;
 }
=20
 void __init xics_register_ics(struct ics *ics)
@@ -478,6 +489,8 @@ void __init xics_init(void)
 	/* Initialize common bits */
 	xics_get_server_size();
 	xics_update_irq_servers();
-	xics_init_host();
+	rc =3D xics_allocate_domain();
+	if (rc < 0)
+		pr_err("XICS: Failed to create IRQ domain");
 	xics_setup_cpu();
 }
--=20
2.26.3

