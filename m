Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F9D4BCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 03:27:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qnJ6612kzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 12:27:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qnFx6gvkzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 12:25:57 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9C1N2iL135020
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:25:54 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vk2b8c576-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:25:54 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 12 Oct 2019 02:25:52 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 12 Oct 2019 02:25:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9C1Plsf54657110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Oct 2019 01:25:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADFAA52052;
 Sat, 12 Oct 2019 01:25:47 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.130.213])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 56EB752050;
 Sat, 12 Oct 2019 01:25:43 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] virtio: Support encrypted memory on powerpc secure guests
Date: Fri, 11 Oct 2019 18:25:17 -0700
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19101201-0020-0000-0000-00000378559F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101201-0021-0000-0000-000021CE689F
Message-Id: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=987 adultscore=0 classifier=spam adjust=0 reason=mlx
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

 **We would like the patches to be merged through the virtio tree.  Please
 review, and ack merging the DMA mapping change through that tree. Thanks!**

 The memory of powerpc secure guests can't be accessed by the hypervisor /
 virtio device except for a few memory regions designated as 'shared'.
 
 At the moment, Linux uses bounce-buffering to communicate with the
 hypervisor, with a bounce buffer marked as shared. This is how the DMA API
 is implemented on this platform.
 
 In particular, the most convenient way to use virtio on this platform is by
 making virtio use the DMA API: in fact, this is exactly what happens if the
 virtio device exposes the flag VIRTIO_F_ACCESS_PLATFORM.  However, bugs in the
 hypervisor on the powerpc platform do not allow setting this flag, with some
 hypervisors already in the field that don't set this flag. At the moment they
 are forced to use emulated devices when guest is in secure mode; virtio is
 only useful when guest is not secure.
 
 Normally, both device and driver must support VIRTIO_F_ACCESS_PLATFORM:
 if one of them doesn't, the other mustn't assume it for communication
 to work.
 
 However, a guest-side work-around is possible to enable virtio
 for these hypervisors with guest in secure mode: it so happens that on
 powerpc secure platform the DMA address is actually a physical address -
 that of the bounce buffer. For these platforms we can make the virtio
 driver go through the DMA API even though the device itself ignores
 the DMA API.
 
 These patches implement this work around for virtio: we detect that
 - secure guest mode is enabled - so we know that since we don't share
   most memory and Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM,
   regular virtio code won't work.
 - DMA API is giving us addresses that are actually also physical
   addresses.
 - Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM.
 
 and if all conditions are true, we force all data through the bounce
 buffer.
 
 To put it another way, from hypervisor's point of view DMA API is
 not required: hypervisor would be happy to get access to all of guest
 memory. That's why it does not set VIRTIO_F_ACCESS_PLATFORM. However,
 guest decides that it does not trust the hypervisor and wants to force
 a bounce buffer for its own reasons.


Thiago Jung Bauermann (2):
  dma-mapping: Add dma_addr_is_phys_addr()
  virtio_ring: Use DMA API if memory is encrypted

 arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
 arch/powerpc/platforms/pseries/Kconfig |  1 +
 drivers/virtio/virtio.c                | 18 ++++++++++++++++++
 drivers/virtio/virtio_ring.c           |  8 ++++++++
 include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
 include/linux/virtio_config.h          | 14 ++++++++++++++
 kernel/dma/Kconfig                     |  3 +++
 7 files changed, 85 insertions(+)

-- 
1.8.3.1

