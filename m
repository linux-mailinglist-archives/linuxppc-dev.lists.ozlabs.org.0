Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C92104F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:25:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xXnq1WnpzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xXlD3mXkzDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:23:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06175YaA142713; Wed, 1 Jul 2020 03:23:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32083f6g44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:29 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0617CIEw173984;
 Wed, 1 Jul 2020 03:23:28 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32083f6g3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:28 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0617Fw5o006331;
 Wed, 1 Jul 2020 07:23:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 31wwr95rqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 07:23:27 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0617NOll22807034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 07:23:24 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 432E013605D;
 Wed,  1 Jul 2020 07:23:26 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2755136059;
 Wed,  1 Jul 2020 07:23:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.179])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 07:23:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v7 0/7] Support new pmem flush and sync instructions for POWER
Date: Wed,  1 Jul 2020 12:52:28 +0530
Message-Id: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_03:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010050
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
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 oohall@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series enables the usage os new pmem flush and sync instructions on POWER
architecture. POWER10 introduces two new variants of dcbf instructions (dcbstps and dcbfps)
that can be used to write modified locations back to persistent storage. Additionally,
POWER10 also introduce phwsync and plwsync which can be used to establish order of these
writes to persistent storage.
    
This series exposes these instructions to the rest of the kernel. The existing
dcbf and hwsync instructions in P8 and P9 are adequate to enable appropriate
synchronization with OpenCAPI-hosted persistent storage. Hence the new instructions
are added as a variant of the old ones that old hardware won't differentiate.

On POWER10, pmem devices will be represented by a different device tree compat
strings. This ensures that older kernels won't initialize pmem devices on POWER10.

With this:
1) vPMEM continues to work since it is a volatile region. That 
doesn't need any flush instructions.

2) pmdk and other user applications get updated to use new instructions
and updated packages are made available to all distributions

3) On newer hardware, the device will appear with a new compat string. 
Hence older distributions won't initialize pmem on newer hardware.

Changes from v6:
* rename flush barrier to pmem_wmb(). Update documentation. 
* Drop the WARN_ON in flush routines.
* Drop pap_scm ndr_region flush callback.

Changes from v5:
* Drop CONFIG_ARCH_MAP_SYNC_DISABLE and related changes

Changes from V4:
* Add namespace specific sychronous fault control.

Changes from V3:
* Add new compat string to be used for the device.
* Use arch_pmem_flush_barrier() in dm-writecache.
Aneesh Kumar K.V (7):
  powerpc/pmem: Restrict papr_scm to P8 and above.
  powerpc/pmem: Add new instructions for persistent storage and sync
  powerpc/pmem: Add flush routines using new pmem store and sync
    instruction
  libnvdimm/nvdimm/flush: Allow architecture to override the flush
    barrier
  powerpc/pmem: Update ppc64 to use the new barrier instruction.
  powerpc/pmem: Avoid the barrier in flush routines
  powerpc/pmem: Initialize pmem device on newer hardware

 Documentation/memory-barriers.txt         | 14 ++++++++
 arch/powerpc/include/asm/barrier.h        | 13 +++++++
 arch/powerpc/include/asm/cacheflush.h     |  1 +
 arch/powerpc/include/asm/ppc-opcode.h     | 12 +++++++
 arch/powerpc/lib/pmem.c                   | 44 ++++++++++++++++++++---
 arch/powerpc/platforms/pseries/papr_scm.c |  1 +
 arch/powerpc/platforms/pseries/pmem.c     |  6 ++++
 drivers/md/dm-writecache.c                |  2 +-
 drivers/nvdimm/of_pmem.c                  |  1 +
 drivers/nvdimm/region_devs.c              |  8 ++---
 include/asm-generic/barrier.h             | 10 ++++++
 11 files changed, 103 insertions(+), 9 deletions(-)

-- 
2.26.2

