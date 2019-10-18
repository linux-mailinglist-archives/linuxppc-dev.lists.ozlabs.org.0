Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D19DC603
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:28:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vn0b1g2gzDsbF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:28:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmWG030CzDrfS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 00:06:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46vmWF3dzXz8t1Z
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 00:06:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46vmWF18L0z9sPZ; Sat, 19 Oct 2019 00:06:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46vmWD2BpLz9sPW
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 00:06:15 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ID3AF7070180
 for <linuxppc-dev@ozlabs.org>; Fri, 18 Oct 2019 09:06:11 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vqbgxnyaa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 18 Oct 2019 09:06:10 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 18 Oct 2019 14:06:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 18 Oct 2019 14:06:06 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ID64kX32243746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 13:06:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5420A404D;
 Fri, 18 Oct 2019 13:06:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6900A4051;
 Fri, 18 Oct 2019 13:06:02 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.73.145])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Oct 2019 13:06:02 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/4] reorganize and add FADump sysfs files
Date: Fri, 18 Oct 2019 18:35:53 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19101813-0008-0000-0000-000003234936
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101813-0009-0000-0000-00004A426AFB
Message-Id: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-18_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=881 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910180123
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
 linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, FADump sysfs files are present inside /sys/kernel directory.
But as the number of FADump sysfs file increases it is not a good idea to
push all of them in /sys/kernel directory. It is better to have separate
directory to keep all the FADump sysfs files.

The patch series reorganizes the FADump sysfs files and avail all the
existing FADump sysfs files present inside /sys/kernel into a new
directory /sys/kernel/fadump. Currently, all the FADump sysfs files
are replicated into a new directory to maintain the backward compatibility
and will eventually get removed in future. In addition to this a new FADump
sys interface is added to get the amount of memory reserved by FADump for
saving the crash dump.

Changelog v1->v2:
 - Move fadump_release_opalcore sysfs to FADump Kobject instead of
   replicating.
 - Changed the patch order 1,2,3,4 -> 2,1,3,4 (First add the ABI doc for
   exisiting sysfs file then replicate them under FADump kobject).

Sourabh Jain (4):
  Documentation/ABI: add ABI documentation for /sys/kernel/fadump_*
  powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs files
  Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
  powerpc/fadump: sysfs for fadump memory reservation

 .../ABI/obsolete/sysfs-kernel-fadump_enabled  | 10 ++++
 .../obsolete/sysfs-kernel-fadump_registered   | 11 +++++
 .../obsolete/sysfs-kernel-fadump_release_mem  | 11 +++++
 .../sysfs-kernel-fadump_release_opalcore      |  9 ++++
 Documentation/ABI/testing/sysfs-kernel-fadump | 48 +++++++++++++++++++
 .../powerpc/firmware-assisted-dump.rst        | 20 +++++++-
 arch/powerpc/kernel/fadump.c                  | 42 ++++++++++++++++
 arch/powerpc/platforms/powernv/opal-core.c    |  6 ++-
 8 files changed, 154 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

-- 
2.17.2

