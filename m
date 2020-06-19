Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F782009A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:13:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pK3q3PZFzDrNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 23:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pK0t0xkdzDrJw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:10:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JD2G3a048593; Fri, 19 Jun 2020 09:10:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rthexemy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:10:14 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JD2OdG049297;
 Fri, 19 Jun 2020 09:10:13 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rthexema-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:10:13 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JD4pXb030013;
 Fri, 19 Jun 2020 13:10:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 31rd95fhqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:10:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDAC9T51380578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:10:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E7E6AE066;
 Fri, 19 Jun 2020 13:10:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57921AE05C;
 Fri, 19 Jun 2020 13:10:09 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.220.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:10:09 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: Re: [PATCH v5 00/10] Support new pmem flush and sync instructions
 for POWER
In-Reply-To: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
References: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 19 Jun 2020 18:40:07 +0530
Message-ID: <87tuz78amo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 cotscore=-2147483648 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190092
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
Cc: Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de, Jan Kara <jack@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patch series enables the usage os new pmem flush and sync instructions on POWER
> architecture. POWER10 introduces two new variants of dcbf instructions (dcbstps and dcbfps)
> that can be used to write modified locations back to persistent storage. Additionally,
> POWER10 also introduce phwsync and plwsync which can be used to establish order of these
> writes to persistent storage.
>     
> This series exposes these instructions to the rest of the kernel. The existing
> dcbf and hwsync instructions in P8 and P9 are adequate to enable appropriate
> synchronization with OpenCAPI-hosted persistent storage. Hence the new instructions
> are added as a variant of the old ones that old hardware won't differentiate.
>
> On POWER10, pmem devices will be represented by a different device tree compat
> strings. This ensures that older kernels won't initialize pmem devices on POWER10.
>
> W.r.t userspace we want to make sure applications are enabled to use MAP_SYNC only
> if they are using the new instructions. To avoid the wrong usage of MAP_SYNC on
> newer hardware, we disable MAP_SYNC by default on newer hardware. The namespace specific
> attribute /sys/block/pmem0/dax/sync_fault can be used to enable MAP_SYNC later.
>
> With this:
> 1) vPMEM continues to work since it is a volatile region. That 
> doesn't need any flush instructions.
>
> 2) pmdk and other user applications get updated to use new instructions
> and updated packages are made available to all distributions
>
> 3) On newer hardware, the device will appear with a new compat string. 
> Hence older distributions won't initialize pmem on newer hardware.
>
> 4) If we have a newer kernel with an older distro, we use the per 
> namespace sysfs knob that prevents the usage of MAP_SYNC.
>
> 5) Sometime in the future, we mark the CONFIG_ARCH_MAP_SYNC_DISABLE=n
> on ppc64 when we are confident that everybody is using the new flush 
> instruction.
>
> Chaanges from V4:
> * Add namespace specific sychronous fault control.
>
> Changes from V3:
> * Add new compat string to be used for the device.
> * Use arch_pmem_flush_barrier() in dm-writecache.
>
> Aneesh Kumar K.V (10):
>   powerpc/pmem: Restrict papr_scm to P8 and above.
>   powerpc/pmem: Add new instructions for persistent storage and sync
>   powerpc/pmem: Add flush routines using new pmem store and sync
>     instruction
>   libnvdimm/nvdimm/flush: Allow architecture to override the flush
>     barrier
>   powerpc/pmem/of_pmem: Update of_pmem to use the new barrier
>     instruction.
>   powerpc/pmem: Avoid the barrier in flush routines
>   powerpc/book3s/pmem: Add WARN_ONCE to catch the wrong usage of pmem
>     flush functions.
>   libnvdimm/dax: Add a dax flag to control synchronous fault support
>   powerpc/pmem: Disable synchronous fault by default
>   powerpc/pmem: Initialize pmem device on newer hardware
>
>  arch/powerpc/include/asm/cacheflush.h     | 10 ++++
>  arch/powerpc/include/asm/ppc-opcode.h     | 12 ++++
>  arch/powerpc/lib/pmem.c                   | 46 ++++++++++++--
>  arch/powerpc/platforms/Kconfig.cputype    |  9 +++
>  arch/powerpc/platforms/pseries/papr_scm.c | 31 +++++++++-
>  arch/powerpc/platforms/pseries/pmem.c     |  6 ++
>  drivers/dax/bus.c                         |  2 +-
>  drivers/dax/super.c                       | 73 +++++++++++++++++++++++
>  drivers/md/dm-writecache.c                |  2 +-
>  drivers/nvdimm/of_pmem.c                  |  8 +++
>  drivers/nvdimm/pmem.c                     |  4 ++
>  drivers/nvdimm/region_devs.c              | 24 ++++++--
>  include/linux/dax.h                       | 16 +++++
>  include/linux/libnvdimm.h                 |  8 +++
>  mm/Kconfig                                |  3 +
>  15 files changed, 243 insertions(+), 11 deletions(-)

Ping.

Are we good with the approach here? 

-aneesh
