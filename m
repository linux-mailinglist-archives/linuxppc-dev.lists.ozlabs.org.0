Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 146965595B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:47:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJBw6VCMzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 06:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJ8d3BTkzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJ8c39yxz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:45:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJ8c2xgVz9s5c; Wed, 26 Jun 2019 06:45:52 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJ8b72Qtz9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:45:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKhvu7024014
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:45:48 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbs8fv1xa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:45:47 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:45:45 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:45:43 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKjfha40501274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:45:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C4464C062;
 Tue, 25 Jun 2019 20:45:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F9E24C04A;
 Tue, 25 Jun 2019 20:45:39 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:45:39 +0000 (GMT)
Subject: [PATCH v3 00/16] Add FADump support on PowerNV platform
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:15:37 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0008-0000-0000-000002F6FAEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0009-0000-0000-000022642CE6
Message-Id: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250157
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

Firmware-Assisted Dump (FADump) is currently supported only on pseries
platform. This patch series adds support for powernv platform too.

The first and third patches refactor the FADump code to make use of common
code across multiple platforms. The fifth patch adds basic FADump support
for powernv platform. Patches seven & eight honour reserved-ranges DT node
while reserving/releasing memory used by FADump. The next patch processes
CPU state data provided by firmware to create and append core notes to the
ELF core file. The tenth patch adds support for preserving crash data for
subsequent boots (useful in cases like petitboot). Patch twelve provides
support to export opalcore. This is to make debugging of failures in OPAL
code easier. The subsequent patch ensures vmcore processing is skipped
when only OPAL core is exported by f/w. The next patch provides option to
release the kernel memory used to export opalcore. The remaining patches
update Firmware-Assisted Dump documentation appropriately.

The patch series is tested with the latest firmware plus the below skiboot
changes for MPIPL support:

    https://patchwork.ozlabs.org/project/skiboot/list/?series=114104
    ("MPIPL support")


Changes in v3:
  * Rebased to latest upstream kernel version.
  * Updated according to latest OPAL changes.
  * Using metadata tags instead of structs between kernel & OPAL.
  * Exporting OPAL core as /sys/firmware/opal/core (not /proc/opalcore)

---

Hari Bathini (16):
      powerpc/fadump: move internal fadump code to a new file
      powerpc/fadump: Improve fadump documentation
      pseries/fadump: move out platform specific support from generic code
      powerpc/fadump: use FADump instead of fadump for how it is pronounced
      powerpc/fadump: enable fadump support on OPAL based POWER platform
      powerpc/fadump: Update documentation about OPAL platform support
      powerpc/fadump: consider reserved ranges while reserving memory
      powerpc/fadump: consider reserved ranges while releasing memory
      powernv/fadump: process architected register state data provided by firmware
      powernv/fadump: add support to preserve crash data on FADUMP disabled kernel
      powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
      powerpc/powernv: export /sys/firmware/opal/core for analysing opal crashes
      powernv/fadump: Skip processing /proc/vmcore when only OPAL core exists
      powernv/opalcore: provide an option to invalidate /sys/firmware/opal/core file
      powernv/fadump: consider f/w load area
      powernv/fadump: update documentation about option to release opalcore


 Documentation/powerpc/firmware-assisted-dump.txt |  193 ++--
 arch/powerpc/Kconfig                             |   23 
 arch/powerpc/include/asm/fadump.h                |  190 ----
 arch/powerpc/include/asm/opal-api.h              |   89 ++
 arch/powerpc/include/asm/opal.h                  |    4 
 arch/powerpc/kernel/Makefile                     |    6 
 arch/powerpc/kernel/fadump-common.c              |  196 ++++
 arch/powerpc/kernel/fadump-common.h              |  203 ++++
 arch/powerpc/kernel/fadump.c                     | 1183 +++++++++-------------
 arch/powerpc/kernel/prom.c                       |    4 
 arch/powerpc/platforms/powernv/Makefile          |    3 
 arch/powerpc/platforms/powernv/opal-call.c       |    2 
 arch/powerpc/platforms/powernv/opal-core.c       |  634 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c     |  661 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h     |  117 ++
 arch/powerpc/platforms/pseries/Makefile          |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c     |  557 ++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h     |  106 ++
 18 files changed, 3187 insertions(+), 985 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.c
 create mode 100644 arch/powerpc/kernel/fadump-common.h
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

