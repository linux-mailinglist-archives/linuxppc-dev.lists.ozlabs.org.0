Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0B4BB3E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 09:08:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0PTC2BWBz3cjj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 19:08:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0PSh1Fvnz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 19:07:44 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I5b7bw028673; 
 Fri, 18 Feb 2022 08:07:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jk0kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:07:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I83q29031650;
 Fri, 18 Feb 2022 08:07:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64harajw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:07:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I87IGZ47317484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:07:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7609E11C05E;
 Fri, 18 Feb 2022 08:07:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2354211C052;
 Fri, 18 Feb 2022 08:07:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:07:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EEF3D22016E;
 Fri, 18 Feb 2022 09:07:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Dany Madden <drt@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Subject: [PATCH] net/ibmvnic: Cleanup workaround doing an EOI after partition
 migration
Date: Fri, 18 Feb 2022 09:07:08 +0100
Message-Id: <20220218080708.636587-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DgrUA7rvY7eTV1GkQq-VlxrLSK10lOV3
X-Proofpoint-ORIG-GUID: DgrUA7rvY7eTV1GkQq-VlxrLSK10lOV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=870
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180051
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There were a fair amount of changes to workaround a firmware bug leaving
a pending interrupt after migration of the ibmvnic device :

commit 2df5c60e198c ("net/ibmvnic: Ignore H_FUNCTION return from H_EOI
       		    to tolerate XIVE mode")
commit 284f87d2f387 ("Revert "net/ibmvnic: Fix EOI when running in
       		    XIVE mode"")
commit 11d49ce9f794 ("net/ibmvnic: Fix EOI when running in XIVE mode.")
commit f23e0643cd0b ("ibmvnic: Clear pending interrupt after device reset=
")

Here is the final one taking into account the XIVE interrupt mode.

Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Dany Madden <drt@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 35 ++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ib=
m/ibmvnic.c
index 29617a86b299..61975cb9c1a4 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -60,6 +60,7 @@
 #include <asm/hvcall.h>
 #include <linux/atomic.h>
 #include <asm/vio.h>
+#include <asm/xive.h>
 #include <asm/iommu.h>
 #include <linux/uaccess.h>
 #include <asm/firmware.h>
@@ -3562,6 +3563,30 @@ static int disable_scrq_irq(struct ibmvnic_adapter=
 *adapter,
 	return rc;
 }
=20
+/* We can not use the IRQ chip EOI handler because that has the
+ * unintended effect of changing the interrupt priority.
+ */
+static void ibmvnic_xics_eoi(struct device *dev, struct ibmvnic_sub_crq_=
queue *scrq)
+{
+	u64 val =3D 0xff000000 | scrq->hw_irq;
+	unsigned long rc;
+
+	rc =3D plpar_hcall_norets(H_EOI, val);
+	if (rc)
+		dev_err(dev, "H_EOI FAILED irq 0x%llx. rc=3D%ld\n", val, rc);
+}
+
+/* Due to a firmware bug, the hypervisor can send an interrupt to a
+ * transmit or receive queue just prior to a partition migration.
+ * Force an EOI after migration.
+ */
+static void ibmvnic_clear_pending_interrupt(struct device *dev,
+					    struct ibmvnic_sub_crq_queue *scrq)
+{
+	if (!xive_enabled())
+		ibmvnic_xics_eoi(dev, scrq);
+}
+
 static int enable_scrq_irq(struct ibmvnic_adapter *adapter,
 			   struct ibmvnic_sub_crq_queue *scrq)
 {
@@ -3575,15 +3600,7 @@ static int enable_scrq_irq(struct ibmvnic_adapter =
*adapter,
=20
 	if (test_bit(0, &adapter->resetting) &&
 	    adapter->reset_reason =3D=3D VNIC_RESET_MOBILITY) {
-		u64 val =3D (0xff000000) | scrq->hw_irq;
-
-		rc =3D plpar_hcall_norets(H_EOI, val);
-		/* H_EOI would fail with rc =3D H_FUNCTION when running
-		 * in XIVE mode which is expected, but not an error.
-		 */
-		if (rc && (rc !=3D H_FUNCTION))
-			dev_err(dev, "H_EOI FAILED irq 0x%llx. rc=3D%ld\n",
-				val, rc);
+		ibmvnic_clear_pending_interrupt(dev, scrq);
 	}
=20
 	rc =3D plpar_hcall_norets(H_VIOCTL, adapter->vdev->unit_address,
--=20
2.34.1

