Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11D1165FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 06:02:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WWKL0JCdzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WWDg5Zp4zDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 15:58:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47WWDf3q0yz8t70
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 15:58:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47WWDf39D7z9sR0; Mon,  9 Dec 2019 15:58:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47WWDd6QNgz9sP6
 for <linuxppc-dev@ozlabs.org>; Mon,  9 Dec 2019 15:58:41 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB94ups3102200
 for <linuxppc-dev@ozlabs.org>; Sun, 8 Dec 2019 23:58:38 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrte5a4sx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 08 Dec 2019 23:58:38 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Mon, 9 Dec 2019 04:58:35 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 04:58:32 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB94wVT357475116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 04:58:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0C1CA404D;
 Mon,  9 Dec 2019 04:58:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B274A4040;
 Mon,  9 Dec 2019 04:58:29 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.249])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 04:58:29 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 0/6] reorganize and add FADump sysfs files
Date: Mon,  9 Dec 2019 10:28:20 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19120904-0020-0000-0000-00000395B171
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120904-0021-0000-0000-000021ECEA2E
Message-Id: <20191209045826.30076-1-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 mlxscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=822
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090042
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, gregkh@linuxfoundation.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, FADump sysfs files are present inside /sys/kernel directory.
But as the number of FADump sysfs file increases it is not a good idea to
push all of them in /sys/kernel directory. It is better to have separate
directory to keep all the FADump sysfs files.

Patch series reorganizes the FADump sysfs files and avail all the existing
FADump sysfs files present inside /sys/kernel into a new directory
/sys/kernel/fadump. The backward compatibility is maintained by adding a
symlink for every sysfs file that has moved to new location. Also a new
FADump sys interface is added to get the amount of memory reserved by FADump
for saving the crash dump.

Changelog:
v1 -> v2:
 - Move fadump_release_opalcore sysfs to FADump Kobject instead of
   replicating.
 - Changed the patch order 1,2,3,4 -> 2,1,3,4 (First add the ABI doc for
   exisiting sysfs file then replicate them under FADump kobject).

v2 -> v3:
 - Remove the fadump_ prefix from replicated FADump sysfs file names.

 v3 -> v4:
 - New patch that adds a wrapper function to create symlink with
   custom symlink file name.
 - Add symlink instead of replicating the FADump sysfs files.
 - Move the OPAL core rel

v4 -> v5:
 - Changed the wrapper function name in 2/6.
 - Defined FADump kobject attributes using __ATTR_* macros.
 - Replace individual FADump sysfs file creation with group.
 - Added a macro to create symlink.

Sourabh Jain (6):
  Documentation/ABI: add ABI documentation for /sys/kernel/fadump_*
  sysfs: wrap __compat_only_sysfs_link_entry_to_kobj function to change
    the symlink name
  powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs files
  powerpc/powernv: move core and fadump_release_opalcore under new
    kobject
  Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
  powerpc/fadump: sysfs for fadump memory reservation

 .../ABI/obsolete/sysfs-kernel-fadump_enabled  |   9 ++
 .../obsolete/sysfs-kernel-fadump_registered   |  10 ++
 .../obsolete/sysfs-kernel-fadump_release_mem  |  10 ++
 .../sysfs-kernel-fadump_release_opalcore      |   9 ++
 Documentation/ABI/testing/sysfs-kernel-fadump |  40 +++++++
 .../powerpc/firmware-assisted-dump.rst        |  28 ++++-
 arch/powerpc/kernel/fadump.c                  | 104 ++++++++++++------
 arch/powerpc/platforms/powernv/opal-core.c    |  55 ++++++---
 fs/sysfs/group.c                              |  28 ++++-
 include/linux/sysfs.h                         |  12 ++
 10 files changed, 247 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

-- 
2.17.2

