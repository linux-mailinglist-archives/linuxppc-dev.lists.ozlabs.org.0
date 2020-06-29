Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDD20CF2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 16:36:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wVRW052TzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 00:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wTbn2WRDzDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 23:58:29 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TDaQ3A012548; Mon, 29 Jun 2020 09:58:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31xkqjp577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 09:58:09 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TDiZaY045886;
 Mon, 29 Jun 2020 09:57:52 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31xkqjp50f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 09:57:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TDsVLB017950;
 Mon, 29 Jun 2020 13:57:40 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 31wwr87r4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 13:57:40 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TDvelr54002086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 13:57:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4464BAE062;
 Mon, 29 Jun 2020 13:57:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14129AE05C;
 Mon, 29 Jun 2020 13:57:37 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.197.62])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 13:57:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v6 0/8] Support new pmem flush and sync instructions for POWER
Date: Mon, 29 Jun 2020 19:27:14 +0530
Message-Id: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_11:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 cotscore=-2147483648
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290091
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

Changes from v5:
* Drop CONFIG_ARCH_MAP_SYNC_DISABLE and related changes

Changes from V4:
* Add namespace specific sychronous fault control.

Changes from V3:
* Add new compat string to be used for the device.
* Use arch_pmem_flush_barrier() in dm-writecache.

Aneesh Kumar K.V (8):
  powerpc/pmem: Restrict papr_scm to P8 and above.
  powerpc/pmem: Add new instructions for persistent storage and sync
  powerpc/pmem: Add flush routines using new pmem store and sync
    instruction
  libnvdimm/nvdimm/flush: Allow architecture to override the flush
    barrier
  powerpc/pmem/of_pmem: Update of_pmem to use the new barrier
    instruction.
  powerpc/pmem: Avoid the barrier in flush routines
  powerpc/pmem: Add WARN_ONCE to catch the wrong usage of pmem flush
    functions.
  powerpc/pmem: Initialize pmem device on newer hardware

 arch/powerpc/include/asm/cacheflush.h     | 10 +++++
 arch/powerpc/include/asm/ppc-opcode.h     | 12 ++++++
 arch/powerpc/lib/pmem.c                   | 46 +++++++++++++++++++++--
 arch/powerpc/platforms/pseries/papr_scm.c | 14 +++++++
 arch/powerpc/platforms/pseries/pmem.c     |  6 +++
 drivers/md/dm-writecache.c                |  2 +-
 drivers/nvdimm/of_pmem.c                  |  1 +
 drivers/nvdimm/region_devs.c              |  8 ++--
 include/asm-generic/cacheflush.h          |  4 ++
 9 files changed, 94 insertions(+), 9 deletions(-)

-- 
2.26.2

