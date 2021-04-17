Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F068363246
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 22:53:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN4zZ4vFKz30Dk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 06:53:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DZ+ud5v9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DZ+ud5v9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN4z50sWSz3023
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 06:52:48 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13HKXTtN119887; Sat, 17 Apr 2021 16:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=yQvJPeWBoNJzEzFhm2Y70O4yvR+UiX7bSWI+Ps8tWDw=;
 b=DZ+ud5v9WsEG5Ox31ho/GBzYXOJzHj1EEURkg/uztiXm4z/QrSvAvJBbqLH8rgdLdQm4
 r4O3FiWK7hpJ9GhlnyWCd82uN9xoxxJerqHFZo9k+fBJvSigQzhGR2bWxSjoxkXQToYJ
 YPcEzx+wPHAPCIy02en5lbEGpUzsNMIDdvt0gs97ykNEVzR4bfGCuC4zMmT3IeZ4+nNo
 pEHnF14iG0P8HoshqD2oqSOFwAc8dBuE13IZJpEBFFdt67hAU9a+QcQI4XZAu1bMIVC4
 sRT4dWAhfkQwkidhuQnExjjc+AE4Sh7jQx+OQAnavyZ2TALIjQVeCMXmo5017q6S1xT5 Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yv64aamm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 16:52:35 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13HKjrBK169149;
 Sat, 17 Apr 2021 16:52:34 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yv64aamc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 16:52:34 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13HKmIWU032684;
 Sat, 17 Apr 2021 20:52:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 37yqa8wegf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 20:52:33 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13HKqX5k31850996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 20:52:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 497C1112062;
 Sat, 17 Apr 2021 20:52:33 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41251112061;
 Sat, 17 Apr 2021 20:52:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 17 Apr 2021 20:52:32 +0000 (GMT)
Message-ID: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
Subject: [V3 PATCH 00/16] Enable VAS and NX-GZIP support on powerVM
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 17 Apr 2021 13:52:30 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OlhEVv4YowQDNrxFlKUkBY9qzpnjdhOa
X-Proofpoint-ORIG-GUID: buKT2lSnt45muqxE5G8zQHqOT1JSnADd
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-17_12:2021-04-16,
 2021-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=1 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170148
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


This patch series enables VAS / NX-GZIP on powerVM which allows
the user space to do copy/paste with the same existing interface
that is available on powerNV.

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

Main feature differences with powerNV implementation:
- Each VAS window will be configured with a number of credits which
  means that many requests can be issues simultaniously on that
  window. On powerNV, 1K credits are configured per window.
  Whereas on powerVM, the hypervisor allows 1 credit per window
  at present.
- The hypervisor introduced 2 different types of credits: Default -
  Uses normal priority FIFO and Quality of Service (QoS) - Uses high
  priority FIFO. On powerVM, VAS/NX HW resources are shared across
  LPARs. The total number of credits available on a system depends
  on cores configured. We may see more credits are assigned across
  the system than the NX HW resources can handle. So to avoid NX HW
  contention, pHyp introduced QoS credits which can be configured
  by system administration with HMC API. Then the total number of
  available default credits on LPAR varies based on QoS credits
  configured.
- On powerNV, windows are allocated on a specific VAS instance
  and the user space can select VAS instance with the open window
  ioctl. Since VAS instances can be shared across partitions on
  powerVM, the hypervisor manages window allocations on different
  VAS instances. So H_ALLOCATE_VAS_WINDOW allows to select by domain
  indentifiers (H_HOME_NODE_ASSOCIATIVITY values by cpu). By default
  the hypervisor selects VAS instance closer to CPU resources that the
  parition uses. So vas_id in ioctl interface is ignored on powerVM
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

Patches 1- 4:   Move the code that is needed for both powerNV and
                powerVM to powerpc book3s platform directory
Patch5:         Modify vas-window struct to support both and the
                related changes.
Patch 6:        Define HCALL and the related VAS/NXGZIP specific
                structs.
Patch 7:        Define QoS credit flag in window open ioctl
Patch 8:        Implement Allocate, Modify and Deallocate HCALLs
Patch 9:        Retrieve VAS capabilities from the hypervisor
Patch 10;       Implement window operations and integrate with API
Patch 11:       Setup IRQ and NX fault handling
Patch 12;       Add sysfs interface to expose VAS capabilities
Patch 13 - 14:  Make the code common to add NX-GZIP enablement
Patch 15:       Get NX capabilities from the hypervisor
patch 16;       Add sysfs interface to expose NX capabilities

Changes in V2:
  - Rebase on 5.12-rc6
  - Moved VAS Kconfig changes to arch/powerpc/platform as suggested
    by Christophe Leroy
  - build fix with allyesconfig (reported by kernel test build)

Changes in V3:
  - Rebase on 5.12-rc7
  - Moved vas-api.c and VAS Kconfig changes to
    arch/powerpc/platform/book3s as Michael Ellerman suggested

Haren Myneni (16):
  powerpc/powernv/vas: Rename register/unregister functions
  powerpc/vas: Make VAS API powerpc platform independent
  powerpc/vas: Create take/drop task reference functions
  powerpc/vas: Move update_csb/dump_crb to common book3s platform
  powerpc/vas:  Define and use common vas_window struct
  powerpc/pseries/vas: Define VAS/NXGZIP HCALLs and structs
  powerpc/vas: Define QoS credit flag to allocate window
  powerpc/pseries/VAS: Implement allocate/modify/deallocate HCALLS
  powerpc/pseries/vas: Implement to get all capabilities
  powerpc/pseries/vas: Integrate API with open/close windows
  powerpc/pseries/vas: Setup IRQ and fault handling
  powerpc/pseries/vas: sysfs interface to export capabilities
  crypto/nx: Rename nx-842-pseries file name to nx-common-pseries
  crypto/nx: Register and unregister VAS interface
  crypto/nx: Get NX capabilities for GZIP coprocessor type
  crypto/nx: Add sysfs interface to export NX capabilities

 arch/powerpc/include/asm/hvcall.h             |   7 +
 arch/powerpc/include/asm/vas.h                | 122 +++-
 arch/powerpc/include/uapi/asm/vas-api.h       |   6 +-
 arch/powerpc/platforms/Kconfig                |   1 +
 arch/powerpc/platforms/Makefile               |   1 +
 arch/powerpc/platforms/book3s/Kconfig         |  15 +
 arch/powerpc/platforms/book3s/Makefile        |   2 +
 arch/powerpc/platforms/book3s/vas-api.c       | 485 +++++++++++++
 arch/powerpc/platforms/powernv/Kconfig        |  14 -
 arch/powerpc/platforms/powernv/Makefile       |   2 +-
 arch/powerpc/platforms/powernv/vas-api.c      | 278 --------
 arch/powerpc/platforms/powernv/vas-debug.c    |  12 +-
 arch/powerpc/platforms/powernv/vas-fault.c    | 155 +---
 arch/powerpc/platforms/powernv/vas-trace.h    |   6 +-
 arch/powerpc/platforms/powernv/vas-window.c   | 250 ++++---
 arch/powerpc/platforms/powernv/vas.h          |  42 +-
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/vas-sysfs.c    | 173 +++++
 arch/powerpc/platforms/pseries/vas.c          | 674 ++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h          |  98 +++
 drivers/crypto/nx/Kconfig                     |   1 +
 drivers/crypto/nx/Makefile                    |   2 +-
 drivers/crypto/nx/nx-common-powernv.c         |   6 +-
 .../{nx-842-pseries.c => nx-common-pseries.c} | 135 ++++
 24 files changed, 1889 insertions(+), 599 deletions(-)
 create mode 100644 arch/powerpc/platforms/book3s/Kconfig
 create mode 100644 arch/powerpc/platforms/book3s/Makefile
 create mode 100644 arch/powerpc/platforms/book3s/vas-api.c
 delete mode 100644 arch/powerpc/platforms/powernv/vas-api.c
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.h
 rename drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} (90%)

-- 
2.18.2


