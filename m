Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0486D4BE2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 03:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qnX85TgpzDqd2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 12:38:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qnVK50wzzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 12:36:41 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9C1XxAD143863
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:36:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vk59d02ch-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 21:36:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 12 Oct 2019 02:36:36 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 12 Oct 2019 02:36:31 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9C1aUUm52691120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Oct 2019 01:36:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40343A404D;
 Sat, 12 Oct 2019 01:36:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1B33A4040;
 Sat, 12 Oct 2019 01:36:25 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.130.213])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 12 Oct 2019 01:36:25 +0000 (GMT)
Date: Fri, 11 Oct 2019 18:36:22 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org, mst@redhat.com, bauerman@linux.ibm.com
Subject: Re: [PATCH 0/2] virtio: Support encrypted memory on powerpc secure
 guests
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19101201-4275-0000-0000-0000037158C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101201-4276-0000-0000-000038846517
Message-Id: <20191012013622.GC17661@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910120006
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
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
 jasowang@redhat.com, aik@linux.ibm.com, mdroth@linux.vnet.ibm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 paul.burton@mips.com, robin.murphy@arm.com, m.szyprowski@samsung.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hmm.. git-send-email forgot to CC  Michael Tsirkin, and Thiago; the
original author, who is on vacation.

Adding them now.
RP

On Fri, Oct 11, 2019 at 06:25:17PM -0700, Ram Pai wrote:
>  **We would like the patches to be merged through the virtio tree.  Please
>  review, and ack merging the DMA mapping change through that tree. Thanks!**
> 
>  The memory of powerpc secure guests can't be accessed by the hypervisor /
>  virtio device except for a few memory regions designated as 'shared'.
> 
>  At the moment, Linux uses bounce-buffering to communicate with the
>  hypervisor, with a bounce buffer marked as shared. This is how the DMA API
>  is implemented on this platform.
> 
>  In particular, the most convenient way to use virtio on this platform is by
>  making virtio use the DMA API: in fact, this is exactly what happens if the
>  virtio device exposes the flag VIRTIO_F_ACCESS_PLATFORM.  However, bugs in the
>  hypervisor on the powerpc platform do not allow setting this flag, with some
>  hypervisors already in the field that don't set this flag. At the moment they
>  are forced to use emulated devices when guest is in secure mode; virtio is
>  only useful when guest is not secure.
> 
>  Normally, both device and driver must support VIRTIO_F_ACCESS_PLATFORM:
>  if one of them doesn't, the other mustn't assume it for communication
>  to work.
> 
>  However, a guest-side work-around is possible to enable virtio
>  for these hypervisors with guest in secure mode: it so happens that on
>  powerpc secure platform the DMA address is actually a physical address -
>  that of the bounce buffer. For these platforms we can make the virtio
>  driver go through the DMA API even though the device itself ignores
>  the DMA API.
> 
>  These patches implement this work around for virtio: we detect that
>  - secure guest mode is enabled - so we know that since we don't share
>    most memory and Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM,
>    regular virtio code won't work.
>  - DMA API is giving us addresses that are actually also physical
>    addresses.
>  - Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM.
> 
>  and if all conditions are true, we force all data through the bounce
>  buffer.
> 
>  To put it another way, from hypervisor's point of view DMA API is
>  not required: hypervisor would be happy to get access to all of guest
>  memory. That's why it does not set VIRTIO_F_ACCESS_PLATFORM. However,
>  guest decides that it does not trust the hypervisor and wants to force
>  a bounce buffer for its own reasons.
> 
> 
> Thiago Jung Bauermann (2):
>   dma-mapping: Add dma_addr_is_phys_addr()
>   virtio_ring: Use DMA API if memory is encrypted
> 
>  arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
>  arch/powerpc/platforms/pseries/Kconfig |  1 +
>  drivers/virtio/virtio.c                | 18 ++++++++++++++++++
>  drivers/virtio/virtio_ring.c           |  8 ++++++++
>  include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
>  include/linux/virtio_config.h          | 14 ++++++++++++++
>  kernel/dma/Kconfig                     |  3 +++
>  7 files changed, 85 insertions(+)
> 
> -- 
> 1.8.3.1

-- 
Ram Pai

