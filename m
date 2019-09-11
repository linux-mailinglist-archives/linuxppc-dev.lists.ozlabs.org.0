Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA324AFF15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:47:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4W34D6kzF3Bh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4Sv3bxDzF1Nv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:45:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4Sv2N4Rz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:45:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4Sv1qZsz9sNT; Thu, 12 Sep 2019 00:45:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4St5t05z9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:45:34 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEghkO089326
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:45:32 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2vk87fr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:45:32 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:45:29 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:45:27 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BEj1ZO32899398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:45:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19ACE5205A;
 Wed, 11 Sep 2019 14:45:26 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 023165204E;
 Wed, 11 Sep 2019 14:45:23 +0000 (GMT)
Subject: [PATCH v6 00/36] Add FADump support on PowerNV platform
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:15:22 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0012-0000-0000-0000034A0E5B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0013-0000-0000-000021847764
Message-Id: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Firmware-Assisted Dump (FADump) is currently supported only on pSeries
platform. This patch series adds support for PowerNV platform too.

The first few patches refactor the FADump code to make use of common
code across multiple platforms. Then basic FADump support is added for
PowerNV platform. Followed by patches to honour reserved-ranges DT node
while reserving/releasing memory used by FADump. The subsequent patch
processes CPU state data provided by firmware to create and append core
notes to the ELF core file and the next patch adds support to preserve
crash data for subsequent boots (useful in cases like petitboot). The
subsequent patches add support to export opalcore. opalcore makes
debugging of failures in OPAL code easier. Firmware-Assisted Dump
documentation (Documentation/powerpc/firmware-assisted-dump.rst) is
also updated appropriately. Refer to the documentation for flow related
details. The patch series is tested with the latest firmware that has
MPIPL support included.

Changes in v6:
  * Addressed review comments and also, did a bit of code clean-up.

Changes in v5:
  * Split the patches further.
  * Rebased to latest upstream kernel version.
  * Updated the patches based on discussions with mahesh on V4.

---

Hari Bathini (36):
      powerpc/fadump: move internal macros/definitions to a new header
      powerpc/fadump: add helper functions
      powerpc/fadump: declare helper functions in internal header file
      powerpc/fadump: Improve fadump documentation
      powerpc/fadump: use helper functions to reserve/release cpu notes buffer
      pseries/fadump: move rtas specific definitions to platform code
      pseries/fadump: introduce callbacks for platform specific operations
      pseries/fadump: define RTAS register/un-register callback functions
      pseries/fadump: add source info while displaying region contents
      powerpc/fadump: release all the memory above boot memory size
      pseries/fadump: move out platform specific support from generic code
      powerpc/fadump: use FADump instead of fadump for how it is pronounced
      opal: add MPIPL interface definitions
      powernv/fadump: add fadump support on powernv
      powerpc/fadump: improve fadump_reserve_mem()
      powernv/fadump: register kernel metadata address with opal
      powernv/fadump: reset metadata address during clean up
      powernv/fadump: define OPAL register/un-register callback functions
      powernv/fadump: support copying multiple kernel boot memory regions
      powernv/fadump: process the crashdump by exporting it as /proc/vmcore
      powernv/fadump: Warn before processing partial crashdump
      powernv/fadump: handle invalidation of crashdump and re-registraion
      powerpc/fadump: Update documentation about OPAL platform support
      powerpc/fadump: make use of memblock's bottom up allocation mode
      powernv/fadump: process architected register state data provided by firmware
      powerpc/fadump: make crash memory ranges array allocation generic
      powerpc/fadump: consider reserved ranges while releasing memory
      powerpc/fadump: improve how crashed kernel's memory is reserved
      powernv/fadump: add support to preserve crash data on FADUMP disabled kernel
      powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
      powernv/opalcore: export /sys/firmware/opal/core for analysing opal crashes
      powernv/opalcore: provide an option to invalidate /sys/firmware/opal/core file
      powerpc/fadump: consider f/w load area
      powernv/fadump: update documentation about option to release opalcore
      powerpc/fadump: remove RMA_START and RMA_END macros
      powernv/fadump: support holes in kernel boot memory area


 Documentation/powerpc/firmware-assisted-dump.rst |  220 ++--
 arch/powerpc/Kconfig                             |   23 
 arch/powerpc/include/asm/fadump-internal.h       |  169 +++
 arch/powerpc/include/asm/fadump.h                |  194 ---
 arch/powerpc/include/asm/opal-api.h              |   44 +
 arch/powerpc/include/asm/opal.h                  |    5 
 arch/powerpc/kernel/Makefile                     |    4 
 arch/powerpc/kernel/fadump.c                     | 1340 ++++++++++------------
 arch/powerpc/kernel/prom.c                       |    4 
 arch/powerpc/platforms/powernv/Makefile          |    3 
 arch/powerpc/platforms/powernv/opal-call.c       |    3 
 arch/powerpc/platforms/powernv/opal-core.c       |  636 ++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c     |  716 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h     |  146 ++
 arch/powerpc/platforms/pseries/Makefile          |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c     |  550 +++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h     |  114 ++
 17 files changed, 3160 insertions(+), 1012 deletions(-)
 create mode 100644 arch/powerpc/include/asm/fadump-internal.h
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

