Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE7D4BD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 03:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qnL7655mzDqby
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 12:29:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qnGB0HtFzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 12:26:09 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9C1N043060838
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:26:06 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vk0tmxudr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:26:06 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 12 Oct 2019 02:26:03 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 12 Oct 2019 02:25:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9C1PR4D13828398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Oct 2019 01:25:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95DD352050;
 Sat, 12 Oct 2019 01:25:57 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.130.213])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D71705204F;
 Sat, 12 Oct 2019 01:25:52 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
Date: Fri, 11 Oct 2019 18:25:19 -0700
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19101201-0020-0000-0000-0000037855A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101201-0021-0000-0000-000021CE68A1
Message-Id: <1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910120005
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
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
 jasowang@redhat.com, aik@linux.ibm.com, linuxram@us.ibm.com,
 mdroth@linux.vnet.ibm.com, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, paul.burton@mips.com, robin.murphy@arm.com,
 m.szyprowski@samsung.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
be set by both device and guest driver. However, as a hack, when DMA API
returns physical addresses, guest driver can use the DMA API; even though
device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
addresses.

Doing this works-around POWER secure guests for which only the bounce
buffer is accessible to the device, but which don't set
VIRTIO_F_IOMMU_PLATFORM due to a set of hypervisor and architectural bugs.
To guard against platform changes, breaking any of these assumptions down
the road, we check at probe time and fail if that's not the case.

cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc: David Gibson <david@gibson.dropbear.id.au>
cc: Michael Ellerman <mpe@ellerman.id.au>
cc: Paul Mackerras <paulus@ozlabs.org>
cc: Michael Roth <mdroth@linux.vnet.ibm.com>
cc: Alexey Kardashevskiy <aik@linux.ibm.com>
cc: Jason Wang <jasowang@redhat.com>
cc: Christoph Hellwig <hch@lst.de>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 drivers/virtio/virtio.c       | 18 ++++++++++++++++++
 drivers/virtio/virtio_ring.c  |  8 ++++++++
 include/linux/virtio_config.h | 14 ++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a977e32..77a3baf 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -4,6 +4,7 @@
 #include <linux/virtio_config.h>
 #include <linux/module.h>
 #include <linux/idr.h>
+#include <linux/dma-mapping.h>
 #include <uapi/linux/virtio_ids.h>
 
 /* Unique numbering for virtio devices. */
@@ -245,6 +246,23 @@ static int virtio_dev_probe(struct device *_d)
 	if (err)
 		goto err;
 
+	/*
+	 * If memory is encrypted, but VIRTIO_F_IOMMU_PLATFORM is not set, then
+	 * the device is broken: DMA API is required for these platforms, but
+	 * the only way using the DMA API is going to work at all is if the
+	 * device is ready for it. So we need a flag on the virtio device,
+	 * exposed by the hypervisor (or hardware for hw virtio devices) that
+	 * says: hey, I'm real, don't take a shortcut.
+	 *
+	 * There's one exception where guest can make things work, and that is
+	 * when DMA API is guaranteed to always return physical addresses.
+	 */
+	if (mem_encrypt_active() && !virtio_can_use_dma_api(dev)) {
+		dev_err(_d, "virtio: device unable to access encrypted memory\n");
+		err = -EINVAL;
+		goto err;
+	}
+
 	err = drv->probe(dev);
 	if (err)
 		goto err;
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index c8be1c4..9c56b61 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -255,6 +255,14 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
 	if (xen_domain())
 		return true;
 
+	/*
+	 * Also, if guest memory is encrypted the host can't access it
+	 * directly. We need to either use an IOMMU or do bounce buffering.
+	 * Both are done via the DMA API.
+	 */
+	if (mem_encrypt_active() && virtio_can_use_dma_api(vdev))
+		return true;
+
 	return false;
 }
 
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index bb4cc49..57bc25c 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -4,6 +4,7 @@
 
 #include <linux/err.h>
 #include <linux/bug.h>
+#include <linux/dma-mapping.h>
 #include <linux/virtio.h>
 #include <linux/virtio_byteorder.h>
 #include <uapi/linux/virtio_config.h>
@@ -174,6 +175,19 @@ static inline bool virtio_has_iommu_quirk(const struct virtio_device *vdev)
 	return !virtio_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
 }
 
+/**
+ * virtio_can_use_dma_api - determine whether the DMA API can be used
+ * @vdev: the device
+ *
+ * The DMA API can be used either when the device doesn't have the IOMMU quirk,
+ * or when the DMA API is guaranteed to always return physical addresses.
+ */
+static inline bool virtio_can_use_dma_api(const struct virtio_device *vdev)
+{
+	return !virtio_has_iommu_quirk(vdev) ||
+	       dma_addr_is_phys_addr(vdev->dev.parent);
+}
+
 static inline
 struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
 					vq_callback_t *c, const char *n)
-- 
1.8.3.1

