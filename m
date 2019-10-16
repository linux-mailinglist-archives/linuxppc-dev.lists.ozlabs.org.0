Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039FD8A5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 09:57:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tPlb2SBRzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 18:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tPjn6QzXzDqR2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:55:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9G7gNqg018139
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 03:55:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vnugpf4mg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 03:55:37 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 16 Oct 2019 08:55:35 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 16 Oct 2019 08:55:29 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9G7tSFt45154546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 07:55:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1818AE063;
 Wed, 16 Oct 2019 07:55:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0871AE051;
 Wed, 16 Oct 2019 07:55:24 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.142.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Oct 2019 07:55:24 +0000 (GMT)
Date: Wed, 16 Oct 2019 00:55:21 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Christoph Hellwig <hch@lst.de>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
 <20191015073501.GA32345@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015073501.GA32345@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19101607-0012-0000-0000-000003587DE7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101607-0013-0000-0000-000021939633
Message-Id: <20191016075521.GA5201@oc0525413822.ibm.com>
Subject: RE: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160072
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
 b.zolnierkie@samsung.com, jasowang@redhat.com, aik@linux.ibm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, paul.burton@mips.com, robin.murphy@arm.com,
 m.szyprowski@samsung.com, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 15, 2019 at 09:35:01AM +0200, Christoph Hellwig wrote:
> On Fri, Oct 11, 2019 at 06:25:19PM -0700, Ram Pai wrote:
> > From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> > 
> > Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
> > be set by both device and guest driver. However, as a hack, when DMA API
> > returns physical addresses, guest driver can use the DMA API; even though
> > device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
> > addresses.
> 
> Sorry, but this is a complete bullshit hack.  Driver must always use
> the DMA API if they do DMA, and if virtio devices use physical addresses
> that needs to be returned through the platform firmware interfaces for
> the dma setup.  If you don't do that yet (which based on previous
> informations you don't), you need to fix it, and we can then quirk
> old implementations that already are out in the field.
> 
> In other words: we finally need to fix that virtio mess and not pile
> hacks on top of hacks.

So force all virtio devices to use DMA API, except when
VIRTIO_F_IOMMU_PLATFORM is not enabled?

Any help detailing the idea, will enable us fix this issue once for all.

Will something like below work? It removes the prior hacks, and
always uses DMA API; except when VIRTIO_F_IOMMU_PLATFORM is not enabled.

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index c8be1c4..b593d3d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -240,22 +240,10 @@ static inline bool virtqueue_use_indirect(struct virtqueue *_vq,
 
 static bool vring_use_dma_api(struct virtio_device *vdev)
 {
-	if (!virtio_has_iommu_quirk(vdev))
-		return true;
-
-	/* Otherwise, we are left to guess. */
-	/*
-	 * In theory, it's possible to have a buggy QEMU-supposed
-	 * emulated Q35 IOMMU and Xen enabled at the same time.  On
-	 * such a configuration, virtio has never worked and will
-	 * not work without an even larger kludge.  Instead, enable
-	 * the DMA API if we're a Xen guest, which at least allows
-	 * all of the sensible Xen configurations to work correctly.
-	 */
-	if (xen_domain())
-		return true;
+	if (virtio_has_iommu_quirk(vdev))
+		return false;
 
-	return false;
+	return true;
 }
 
 size_t virtio_max_dma_size(struct virtio_device *vdev)


-- 
Ram Pai

