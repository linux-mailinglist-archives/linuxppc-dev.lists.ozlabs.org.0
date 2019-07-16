Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6D6A77D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:33:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nyw13X4tzDq61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nysy626BzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nysy4x88z8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nysy4TR7z9sNC; Tue, 16 Jul 2019 21:32:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45nysy0gdtz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:32:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBN6Bi066038
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:01 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tscphawf1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:01 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:31:59 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:31:57 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBVtlJ18088184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:31:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A061342049;
 Tue, 16 Jul 2019 11:31:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A21442042;
 Tue, 16 Jul 2019 11:31:54 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:31:53 +0000 (GMT)
Subject: [PATCH v4 00/25] Add FADump support on PowerNV platform
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:01:53 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0020-0000-0000-00000354050C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0021-0000-0000-000021A7D0ED
Message-Id: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
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
documentation is also updated appropriately.

The patch series is tested with the latest firmware plus the below skiboot
changes for MPIPL support:

    https://patchwork.ozlabs.org/project/skiboot/list/?series=119169
    ("MPIPL support")


Changes in v4:
  * Split the patches.
  * Rebased to latest upstream kernel version.
  * Updated according to latest OPAL changes.

---

Hari Bathini (25):
      powerpc/fadump: move internal macros/definitions to a new header
      powerpc/fadump: move internal code to a new file
      powerpc/fadump: Improve fadump documentation
      pseries/fadump: move rtas specific definitions to platform code
      pseries/fadump: introduce callbacks for platform specific operations
      pseries/fadump: define register/un-register callback functions
      pseries/fadump: move out platform specific support from generic code
      powerpc/fadump: use FADump instead of fadump for how it is pronounced
      opal: add MPIPL interface definitions
      powernv/fadump: add fadump support on powernv
      powernv/fadump: register kernel metadata address with opal
      powernv/fadump: define register/un-register callback functions
      powernv/fadump: support copying multiple kernel memory regions
      powernv/fadump: process the crashdump by exporting it as /proc/vmcore
      powerpc/fadump: Update documentation about OPAL platform support
      powerpc/fadump: consider reserved ranges while reserving memory
      powerpc/fadump: consider reserved ranges while releasing memory
      powernv/fadump: process architected register state data provided by firmware
      powernv/fadump: add support to preserve crash data on FADUMP disabled kernel
      powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
      powernv/opalcore: export /sys/firmware/opal/core for analysing opal crashes
      powernv/fadump: Warn before processing partial crashdump
      powernv/opalcore: provide an option to invalidate /sys/firmware/opal/core file
      powernv/fadump: consider f/w load area
      powernv/fadump: update documentation about option to release opalcore


 Documentation/powerpc/firmware-assisted-dump.txt |  224 +++-
 arch/powerpc/Kconfig                             |   23 
 arch/powerpc/include/asm/fadump.h                |  190 ----
 arch/powerpc/include/asm/opal-api.h              |   50 +
 arch/powerpc/include/asm/opal.h                  |    6 
 arch/powerpc/kernel/Makefile                     |    6 
 arch/powerpc/kernel/fadump-common.c              |  153 +++
 arch/powerpc/kernel/fadump-common.h              |  203 ++++
 arch/powerpc/kernel/fadump.c                     | 1181 ++++++++--------------
 arch/powerpc/kernel/prom.c                       |    4 
 arch/powerpc/platforms/powernv/Makefile          |    3 
 arch/powerpc/platforms/powernv/opal-call.c       |    3 
 arch/powerpc/platforms/powernv/opal-core.c       |  637 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c     |  671 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h     |  154 +++
 arch/powerpc/platforms/pseries/Makefile          |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c     |  595 +++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h     |  123 ++
 18 files changed, 3231 insertions(+), 996 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.c
 create mode 100644 arch/powerpc/kernel/fadump-common.h
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

