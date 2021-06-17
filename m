Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E83073ABD61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:25:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YTN4Rdmz3bvW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rqd8AxKr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rqd8AxKr; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YSf02Kqz2yxm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:24:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK2plF171526; Thu, 17 Jun 2021 16:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=LUTI1s9KyK/LuGQMnTwUfakRUtk6FK2IWF7mMhCvE3k=;
 b=rqd8AxKrqdFqwtlTOaKEk0ITTQnOCYoFy4fDqZ51dapi+JZRzSyvxCKHI7NO/kOMoomo
 aYBXUEF5ExNR5gvy/piLpWM0sa8EifuPL0WaondloiAb4iwFTwigwYBn50QawpugXAho
 +YZjJ5+FAEZuwTlqqsk81UrJAd8Ipm5DPdlUI5lvQ5NVISaWenyZRNLUkSG2eawqRcA0
 2lapPGfWbN80oHbMDTOhJJ8FpuBwPBWBY6zlNjdjwVdvaULVoMQ0LYExuwn7X7NmrpqR
 LCqBG7tdxYRhBjGXP4JtEKtOKIAaD2eVET6ik43MyuvMpF8jAKA/Lk+SO/RB0sAZ2DEr Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqreft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:24:37 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HK4TZY182021;
 Thu, 17 Jun 2021 16:24:36 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrefn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:24:36 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKICIG023910;
 Thu, 17 Jun 2021 20:24:36 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 394mjabtqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:24:36 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKOZEg22282690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:24:35 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 492E413605D;
 Thu, 17 Jun 2021 20:24:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAB0E136051;
 Thu, 17 Jun 2021 20:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:24:33 +0000 (GMT)
Message-ID: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Subject: [PATCH v6 00/17] Enable VAS and NX-GZIP support on PowerVM
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:24:31 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CzPuj9HpPWGoJ3bhxZ3PAQIUvzP0HZq_
X-Proofpoint-ORIG-GUID: GzGMoyxWhEQwA6tY4-eRchEGGLPrPwzq
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170122
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Virtual Accelerator Switchboard (VAS) allows kernel subsystems
and user space processes to directly access the Nest Accelerator
(NX) engines which provides HW compression. The true user mode
VAS/NX support on PowerNV is already included in Linux. Whereas
PowerVM support is available from P10 onwards.

This patch series enables VAS / NX-GZIP on PowerVM which allows
the user space to do copy/paste with the same existing interface
that is available on PowerNV.

VAS Enablement:
- Get all VAS capabilities using H_QUERY_VAS_CAPABILITIES that are
  available in the hypervisor. These capabilities tells OS which
  type of features (credit types such as Default and Quality of
  Service (QoS)). Also gives specific capabilities for each credit
  type: Maximum window credits, Maximum LPAR credits, Target credits
  in that parition (varies from max LPAR credits based DLPAR
  operation), whether supports user mode COPY/PASTE and etc.
- Register LPAR VAS operations such as open window. get paste
  address and close window with the current VAS user space API.
- Open window operation - Use H_ALLOCATE_VAS_WINDOW HCALL to open
  window and H_MODIFY_VAS_WINDOW HCALL to setup the window with LPAR
  PID and etc.
- mmap to paste address returned in H_ALLOCATE_VAS_WINDOW HCALL
- To close window, H_DEALLOCATE_VAS_WINDOW HCALL is used to close in
  the hypervisor.

NX Enablement:
- Get NX capabilities from the the hypervisor which provides Maximum
  buffer length in a single GZIP request, recommended minimum
  compression / decompression lengths.
- Register to VAS to enable user space VAS API

Main feature differences with PowerNV implementation:
- Each VAS window will be configured with a number of credits which
  means that many requests can be issues simultaniously on that
  window. On PowerNV, 1K credits are configured per window.
  Whereas on PowerVM, the hypervisor allows 1 credit per window
  at present.
- The hypervisor introduced 2 different types of credits: Default -
  Uses normal priority FIFO and Quality of Service (QoS) - Uses high
  priority FIFO. On PowerVM, VAS/NX HW resources are shared across
  LPARs. The total number of credits available on a system depends
  on cores configured. We may see more credits are assigned across
  the system than the NX HW resources can handle. So to avoid NX HW
  contention, the hypervisor introduced QoS credits which can be
  configured by system administration with HMC API. Then the total
  number of available default credits on LPAR varies based on QoS
  credits configured.
- On PowerNV, windows are allocated on a specific VAS instance
  and the user space can select VAS instance with the open window
  ioctl. Since VAS instances can be shared across partitions on
  PowerVM, the hypervisor manages window allocations on different
  VAS instances. So H_ALLOCATE_VAS_WINDOW allows to select by domain
  indentifiers (H_HOME_NODE_ASSOCIATIVITY values by cpu). By default
  the hypervisor selects VAS instance closer to CPU resources that the
  parition uses. So vas_id in ioctl interface is ignored on PowerVM
  except vas_id=-1 which is used to allocate window based on CPU that
  the process is executing. This option is needed for process affinity
  to NUMA node.

  The existing applications that linked with libnxz should work as
  long as the job request length is restricted to
  req_max_processed_len.

  Tested the following patches on P10 successfully with test cases
  given: https://github.com/libnxz/power-gzip

  Note: The hypervisor supports user mode NX from p10 onwards. Linux
        supports user mode VAS/NX on P10 only with radix page tables.

Patch 1:        Fix to release reference to tgid during window close
Patches 2- 6:   Move the code that is needed for both PowerNV and
                PowerVM to powerpc book3s platform directory
Patch 7:        Modify vas-window struct to support both platforms
                and the related changes.
Patch 8:        Define HCALL and the related VAS/NXGZIP specific
                structs.
Patch 9:        Define QoS credit flag in window open ioctl
Patch 10:       Implement Allocate, Modify and Deallocate HCALLs
Patch 11:       Retrieve VAS capabilities from the hypervisor
Patch 12;       Implement window operations and integrate with API
Patch 13:       Setup IRQ and NX fault handling
Patch 14 - 15:  Make the code common to add NX-GZIP enablement
Patch 16:       Get NX capabilities from the hypervisor
patch 17;       Add sysfs interface to expose NX capabilities

Changes in v2:
  - Rebase on 5.12-rc6
  - Moved VAS Kconfig changes to arch/powerpc/platform as suggested
    by Christophe Leroy
  - build fix with allyesconfig (reported by kernel test build)

Changes in v3:
  - Rebase on 5.12-rc7
  - Moved vas-api.c and VAS Kconfig changes to
    arch/powerpc/platform/book3s as Michael Ellerman suggested

Changes in v4:
  - Rebase on 5.13-rc2
  - Changes based on review comments from Nicholas Piggin
    - Add seperate patch to define user window operations
    - Drop "sysfs interface to export VAS capabilities" patch
      This interface is mainly needed for DLPAR operations
      and this patch will be included when DLPAR/LPM support
      is added.
    - Other cleanup changes

Changes in v5:
  - Rebase on 5.13-rc5
  - Changes based on review comments from Nicholas Piggin
    and Michael Ellerman:
    - Add new patch to fix tgid reference release. This fix
      should be also included in stable 5.8+
    - Define platform specific VAS window structs
    - Define helper functions to take and release pid, tgid
      and mm references
    - Other cleanup suggestions

Changes in v6:
  - Rebase on 5.13-rc6
  - Changes based on suggestions from Nicholas Piggin
    - Create ref_get_pid_and_task() helper function which
      takes task refrence based on pid or tgid
    - Pass vas_id and flags to platform specific open window API
    - Miscellaneous changes

Haren Myneni (17):
  powerpc/powernv/vas: Release reference to tgid during window close
  powerpc/vas: Move VAS API to book3s common platform
  powerpc/powernv/vas: Rename register/unregister functions
  powerpc/vas: Add platform specific user window operations
  powerpc/vas: Create take/drop pid and mm reference functions
  powerpc/vas: Move update_csb/dump_crb to common book3s platform
  powerpc/vas:  Define and use common vas_window struct
  powerpc/pseries/vas: Define VAS/NXGZIP hcalls and structs
  powerpc/vas: Define QoS credit flag to allocate window
  powerpc/pseries/vas: Add hcall wrappers for VAS handling
  powerpc/pseries/vas: Implement getting capabilities from hypervisor
  powerpc/pseries/vas: Integrate API with open/close windows
  powerpc/pseries/vas: Setup IRQ and fault handling
  crypto/nx: Rename nx-842-pseries file name to nx-common-pseries
  crypto/nx: Get NX capabilities for GZIP coprocessor type
  crypto/nx: Add sysfs interface to export NX capabilities
  crypto/nx: Register and unregister VAS interface on PowerVM

 arch/powerpc/include/asm/hvcall.h             |   7 +
 arch/powerpc/include/asm/vas.h                | 109 +++-
 arch/powerpc/include/uapi/asm/vas-api.h       |   6 +-
 arch/powerpc/platforms/Kconfig                |   1 +
 arch/powerpc/platforms/Makefile               |   1 +
 arch/powerpc/platforms/book3s/Kconfig         |  15 +
 arch/powerpc/platforms/book3s/Makefile        |   2 +
 arch/powerpc/platforms/book3s/vas-api.c       | 493 +++++++++++++++
 arch/powerpc/platforms/powernv/Kconfig        |  14 -
 arch/powerpc/platforms/powernv/Makefile       |   2 +-
 arch/powerpc/platforms/powernv/vas-api.c      | 278 --------
 arch/powerpc/platforms/powernv/vas-debug.c    |  27 +-
 arch/powerpc/platforms/powernv/vas-fault.c    | 173 +----
 arch/powerpc/platforms/powernv/vas-trace.h    |   4 +-
 arch/powerpc/platforms/powernv/vas-window.c   | 264 ++++----
 arch/powerpc/platforms/powernv/vas.h          |  50 +-
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/vas.c          | 594 ++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h          | 125 ++++
 drivers/crypto/nx/Kconfig                     |   1 +
 drivers/crypto/nx/Makefile                    |   2 +-
 drivers/crypto/nx/nx-common-powernv.c         |   6 +-
 .../{nx-842-pseries.c => nx-common-pseries.c} | 138 ++++
 23 files changed, 1696 insertions(+), 617 deletions(-)
 create mode 100644 arch/powerpc/platforms/book3s/Kconfig
 create mode 100644 arch/powerpc/platforms/book3s/Makefile
 create mode 100644 arch/powerpc/platforms/book3s/vas-api.c
 delete mode 100644 arch/powerpc/platforms/powernv/vas-api.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.h
 rename drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} (90%)

-- 
2.18.2


