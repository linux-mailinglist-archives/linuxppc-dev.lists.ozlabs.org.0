Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E71352449
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBLG05hqnz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 11:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gyfVcEAZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gyfVcEAZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBLFY5NfHz2yjN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 11:16:33 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13204kNj059942; Thu, 1 Apr 2021 20:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yBP5NigmIF2O36fNEfbzAomeglOJ+Etoeytml3suDXI=;
 b=gyfVcEAZ6VnzspY1+lIZdqBg/XaVkgjrR/bIZiBnKEXWiu5XRboCaH127eU4UvPpv6li
 VL52bNvJCOrJ1WId4aat5UkCwOQUGRAOpvJWUK7CZ/V3bHagTIWjZ4CFBkuVQ50kveCu
 oU8S66pfQ73/iOb2Ob5TyM/aKB88atMYSCC2YzWK27/QxCkoaEmAPXws7zV6CEI2gpug
 fH6ff2OD6rAMvaUGrtNvbwdjPm92B8h4ttRYrbIdR9et0ohKozb3gjfQ/GLBiFCGFjZJ
 GgNa9vtEzM01hOlv948P6x1ydKSy2Kpkv17zqyITlxDT29oVlVMo4picDz9may2YyyEc ag== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n9mx19eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 20:13:28 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1320D1Hr009780;
 Fri, 2 Apr 2021 00:13:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 37n297yt6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 00:13:27 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1320DQG827590936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Apr 2021 00:13:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B12CF6E04E;
 Fri,  2 Apr 2021 00:13:26 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7423B6E052;
 Fri,  2 Apr 2021 00:13:26 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Apr 2021 00:13:26 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries: Add shutdown() to vio_driver and vio_bus
Date: Thu,  1 Apr 2021 18:13:25 -0600
Message-Id: <20210402001325.939668-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EQMQz0O1F37Bn1eaeHgS5mTiZE8rnTPp
X-Proofpoint-ORIG-GUID: EQMQz0O1F37Bn1eaeHgS5mTiZE8rnTPp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_14:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1011 suspectscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010156
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, neither the vio_bus or vio_driver structures provide support
for a shutdown() routine.

Add support for shutdown() by allowing drivers to provide a
implementation via function pointer in their vio_driver struct and
provide a proper implementation in the driver template for the vio_bus
that calls a vio drivers shutdown() if defined.

In the case that no shutdown() is defined by a vio driver and a kexec is
in progress we implement a big hammer that calls remove() to ensure no
further DMA for the devices is possible.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/include/asm/vio.h       |  1 +
 arch/powerpc/platforms/pseries/vio.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/vio.h b/arch/powerpc/include/asm/vio.h
index 721c0d6715ac..e7479a4abf96 100644
--- a/arch/powerpc/include/asm/vio.h
+++ b/arch/powerpc/include/asm/vio.h
@@ -114,6 +114,7 @@ struct vio_driver {
 	const struct vio_device_id *id_table;
 	int (*probe)(struct vio_dev *dev, const struct vio_device_id *id);
 	void (*remove)(struct vio_dev *dev);
+	void (*shutdown)(struct vio_dev *dev);
 	/* A driver must have a get_desired_dma() function to
 	 * be loaded in a CMO environment if it uses DMA.
 	 */
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 9cb4fc839fd5..d122b8644319 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/dma-map-ops.h>
 #include <linux/kobject.h>
+#include <linux/kexec.h>
 
 #include <asm/iommu.h>
 #include <asm/dma.h>
@@ -1278,6 +1279,20 @@ static int vio_bus_remove(struct device *dev)
 	return 0;
 }
 
+static void vio_bus_shutdown(struct device *dev)
+{
+	struct vio_dev *viodev = to_vio_dev(dev);
+	struct vio_driver *viodrv;
+
+	if (dev->driver) {
+		viodrv = to_vio_driver(dev->driver);
+		if (viodrv->shutdown)
+			viodrv->shutdown(viodev);
+		else if (kexec_in_progress)
+			vio_bus_remove(dev);
+	}
+}
+
 /**
  * vio_register_driver: - Register a new vio driver
  * @viodrv:	The vio_driver structure to be registered.
@@ -1613,6 +1628,7 @@ struct bus_type vio_bus_type = {
 	.match = vio_bus_match,
 	.probe = vio_bus_probe,
 	.remove = vio_bus_remove,
+	.shutdown = vio_bus_shutdown,
 };
 
 /**
-- 
2.27.0

