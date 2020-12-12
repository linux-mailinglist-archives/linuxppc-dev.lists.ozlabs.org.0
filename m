Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CEB2D8715
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 15:28:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtVQ80Jp4zDqlB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 01:28:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtVNj5DDMzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 01:27:33 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BCE1ql5022494; Sat, 12 Dec 2020 09:27:17 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35cwtcsxcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Dec 2020 09:27:17 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BCEHlX2004295;
 Sat, 12 Dec 2020 14:27:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 35cn4h8dxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Dec 2020 14:27:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BCERBcC34734390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Dec 2020 14:27:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1EB7A405B;
 Sat, 12 Dec 2020 14:27:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94E46A4054;
 Sat, 12 Dec 2020 14:27:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 12 Dec 2020 14:27:11 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CF69B22010B;
 Sat, 12 Dec 2020 15:27:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vas: Fix IRQ name allocation
Date: Sat, 12 Dec 2020 15:27:07 +0100
Message-Id: <20201212142707.2102141-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-12_03:2020-12-11,
 2020-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1034 mlxlogscore=784 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012120106
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VAS device allocates a generic interrupt to handle page faults but
the IRQ name doesn't show under /proc. This is because it's on
stack. Allocate the name.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 I didn't understand this part in init_vas_instance() :

	if (vinst->virq) {
		rc =3D vas_irq_fault_window_setup(vinst);
		/*
		 * Fault window is used only for user space send windows.
		 * So if vinst->virq is NULL, tx_win_open returns -ENODEV
		 * for user space.
		 */
		if (rc)
			vinst->virq =3D 0;
	}

 If the IRQ cannot be requested, the device probing should fail but
 it's not today. The use of 'vinst->virq' is suspicious.

 arch/powerpc/platforms/powernv/vas.h |  1 +
 arch/powerpc/platforms/powernv/vas.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
index 70f793e8f6cc..c7db3190baca 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -340,6 +340,7 @@ struct vas_instance {
 	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
 	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
=20
+	char *name;
 	char *dbgname;
 	struct dentry *dbgdir;
 };
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platform=
s/powernv/vas.c
index 598e4cd563fb..b65256a63e87 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -28,12 +28,10 @@ static DEFINE_PER_CPU(int, cpu_vas_id);
=20
 static int vas_irq_fault_window_setup(struct vas_instance *vinst)
 {
-	char devname[64];
 	int rc =3D 0;
=20
-	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
 	rc =3D request_threaded_irq(vinst->virq, vas_fault_handler,
-				vas_fault_thread_fn, 0, devname, vinst);
+				vas_fault_thread_fn, 0, vinst->name, vinst);
=20
 	if (rc) {
 		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
@@ -80,6 +78,12 @@ static int init_vas_instance(struct platform_device *p=
dev)
 	if (!vinst)
 		return -ENOMEM;
=20
+	vinst->name =3D kasprintf(GFP_KERNEL, "vas-%d", vasid);
+	if (!vinst->name) {
+		kfree(vinst);
+		return -ENOMEM;
+	}
+
 	INIT_LIST_HEAD(&vinst->node);
 	ida_init(&vinst->ida);
 	mutex_init(&vinst->mutex);
@@ -162,6 +166,7 @@ static int init_vas_instance(struct platform_device *=
pdev)
 	return 0;
=20
 free_vinst:
+	kfree(vinst->name);
 	kfree(vinst);
 	return -ENODEV;
=20
--=20
2.26.2

