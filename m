Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF96A78A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:39:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nz2f0vJyzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:39:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nytM2N5FzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nytM06N0z8wGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nytL4lb4z9sNT; Tue, 16 Jul 2019 21:32:26 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nytL0LFwz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:32:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMVpE126404
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:23 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tsayqyj20-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:23 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:32:21 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:32:19 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBWHtn28246052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:32:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9AAD4203F;
 Tue, 16 Jul 2019 11:32:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EC2842042;
 Tue, 16 Jul 2019 11:32:16 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:32:16 +0000 (GMT)
Subject: [PATCH v4 03/25] powerpc/fadump: Improve fadump documentation
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:02:15 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0012-0000-0000-00000333099B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0013-0000-0000-0000216C82EE
Message-Id: <156327673568.27462.12962666023309715458.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=860 adultscore=0 classifier=spam adjust=0 reason=mlx
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

The figures depicting FADump's (Firmware-Assisted Dump) memory layout
are missing some finer details like different memory regions and what
they represent. Improve the documentation by updating those details.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 Documentation/powerpc/firmware-assisted-dump.txt |   65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.txt b/Documentation/powerpc/firmware-assisted-dump.txt
index 0c41d6d..e9b4e3c 100644
--- a/Documentation/powerpc/firmware-assisted-dump.txt
+++ b/Documentation/powerpc/firmware-assisted-dump.txt
@@ -74,8 +74,9 @@ as follows:
    there is crash data available from a previous boot. During
    the early boot OS will reserve rest of the memory above
    boot memory size effectively booting with restricted memory
-   size. This will make sure that the second kernel will not
-   touch any of the dump memory area.
+   size. This will make sure that this kernel (also, referred
+   to as second kernel or capture kernel) will not touch any
+   of the dump memory area.
 
 -- User-space tools will read /proc/vmcore to obtain the contents
    of memory, which holds the previous crashed kernel dump in ELF
@@ -125,48 +126,52 @@ space memory except the user pages that were present in CMA region.
 
   o Memory Reservation during first kernel
 
-  Low memory                                         Top of memory
-  0      boot memory size                                       |
-  |           |                |<--Reserved dump area -->|      |
-  V           V                |   Permanent Reservation |      V
-  +-----------+----------/ /---+---+----+-----------+----+------+
-  |           |                |CPU|HPTE|  DUMP     |ELF |      |
-  +-----------+----------/ /---+---+----+-----------+----+------+
-        |                                           ^
-        |                                           |
-        \                                           /
-         -------------------------------------------
-          Boot memory content gets transferred to
-          reserved area by firmware at the time of
-          crash
+  Low memory                                                Top of memory
+  0      boot memory size      |<--Reserved dump area --->|      |
+  |           |                |   Permanent Reservation  |      |
+  V           V                |   (Preserve area)        |      V
+  +-----------+----------/ /---+---+----+--------+---+----+------+
+  |           |                |CPU|HPTE|  DUMP  |HDR|ELF |      |
+  +-----------+----------/ /---+---+----+--------+---+----+------+
+        |                                   ^      ^
+        |                                   |      |
+        \                                   /      |
+         -----------------------------------     FADump Header
+          Boot memory content gets transferred   (meta area)
+          to reserved area by firmware at the
+          time of crash
+
                    Fig. 1
 
+
   o Memory Reservation during second kernel after crash
 
-  Low memory                                        Top of memory
-  0      boot memory size                                       |
-  |           |<------------- Reserved dump area ----------- -->|
-  V           V                                                 V
-  +-----------+----------/ /---+---+----+-----------+----+------+
-  |           |                |CPU|HPTE|  DUMP     |ELF |      |
-  +-----------+----------/ /---+---+----+-----------+----+------+
+  Low memory                                                Top of memory
+  0      boot memory size                                        |
+  |           |<------------- Reserved dump area --------------->|
+  V           V                |<---- Preserve area ----->|      V
+  +-----------+----------/ /---+---+----+--------+---+----+------+
+  |           |                |CPU|HPTE|  DUMP  |HDR|ELF |      |
+  +-----------+----------/ /---+---+----+--------+---+----+------+
         |                                              |
         V                                              V
    Used by second                                /proc/vmcore
    kernel to boot
                    Fig. 2
 
-Currently the dump will be copied from /proc/vmcore to a
-a new file upon user intervention. The dump data available through
-/proc/vmcore will be in ELF format. Hence the existing kdump
-infrastructure (kdump scripts) to save the dump works fine with
-minor modifications.
+Currently the dump will be copied from /proc/vmcore to a new file upon
+user intervention. The dump data available through /proc/vmcore will be
+in ELF format. Hence the existing kdump infrastructure (kdump scripts)
+to save the dump works fine with minor modifications. KDump scripts on
+major Distro releases have already been modified to work seemlessly (no
+user intervention in saving the dump) when FADump is used, instead of
+KDump, as dump mechanism.
 
 The tools to examine the dump will be same as the ones
 used for kdump.
 
 How to enable firmware-assisted dump (fadump):
--------------------------------------
+---------------------------------------------
 
 1. Set config option CONFIG_FA_DUMP=y and build kernel.
 2. Boot into linux kernel with 'fadump=on' kernel cmdline option.
@@ -189,7 +194,7 @@ NOTE: 1. 'fadump_reserve_mem=' parameter has been deprecated. Instead
          old behaviour.
 
 Sysfs/debugfs files:
-------------
+-------------------
 
 Firmware-assisted dump feature uses sysfs file system to hold
 the control files and debugfs file to display memory reserved region.

