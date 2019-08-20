Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88A95E80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:29:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVTS5JBkzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTyD6ptFzDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTyD2sCDz8wHQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTyD121jz9sML; Tue, 20 Aug 2019 22:05:24 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CTyC4BlNz9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:05:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC29l1046817
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:22 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uggcf8mh2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:21 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:05:19 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:05:17 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7KC5FqF35782912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:05:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7669BA4062;
 Tue, 20 Aug 2019 12:05:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF079A405C;
 Tue, 20 Aug 2019 12:05:13 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:05:13 +0000 (GMT)
Subject: [PATCH v5 09/31] powerpc/fadump: use FADump instead of fadump for
 how it is pronounced
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:35:13 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0016-0000-0000-000002A0AFC2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0017-0000-0000-00003300DED6
Message-Id: <156630271312.8896.3017187071969263898.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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

fadump is pronounced f-a-dump. Update documentation accordingly. Also,
update how fadump_region contents look like with recent changes.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 Documentation/powerpc/firmware-assisted-dump.rst |   55 ++++++++++++----------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 563c021..d912755 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -9,18 +9,18 @@ a crashed system, and to do so from a fully-reset system, and
 to minimize the total elapsed time until the system is back
 in production use.
 
-- Firmware assisted dump (fadump) infrastructure is intended to replace
+- Firmware-Assisted Dump (FADump) infrastructure is intended to replace
   the existing phyp assisted dump.
 - Fadump uses the same firmware interfaces and memory reservation model
   as phyp assisted dump.
-- Unlike phyp dump, fadump exports the memory dump through /proc/vmcore
+- Unlike phyp dump, FADump exports the memory dump through /proc/vmcore
   in the ELF format in the same way as kdump. This helps us reuse the
   kdump infrastructure for dump capture and filtering.
 - Unlike phyp dump, userspace tool does not need to refer any sysfs
   interface while reading /proc/vmcore.
-- Unlike phyp dump, fadump allows user to release all the memory reserved
+- Unlike phyp dump, FADump allows user to release all the memory reserved
   for dump, with a single operation of echo 1 > /sys/kernel/fadump_release_mem.
-- Once enabled through kernel boot parameter, fadump can be
+- Once enabled through kernel boot parameter, FADump can be
   started/stopped through /sys/kernel/fadump_registered interface (see
   sysfs files section below) and can be easily integrated with kdump
   service start/stop init scripts.
@@ -34,7 +34,7 @@ dump offers several strong, practical advantages:
    in a clean, consistent state.
 -  Once the dump is copied out, the memory that held the dump
    is immediately available to the running kernel. And therefore,
-   unlike kdump, fadump doesn't need a 2nd reboot to get back
+   unlike kdump, FADump doesn't need a 2nd reboot to get back
    the system to the production configuration.
 
 The above can only be accomplished by coordination with,
@@ -63,7 +63,7 @@ as follows:
          boot successfully. For syntax of crashkernel= parameter,
          refer to Documentation/admin-guide/kdump/kdump.rst. If any offset is
          provided in crashkernel= parameter, it will be ignored
-         as fadump uses a predefined offset to reserve memory
+         as FADump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
 
 -  After the low memory (boot memory) area has been saved, the
@@ -123,7 +123,7 @@ blocking this significant chunk of memory from production kernel.
 Hence, the implementation uses the Linux kernel's Contiguous Memory
 Allocator (CMA) for memory reservation if CMA is configured for kernel.
 With CMA reservation this memory will be available for applications to
-use it, while kernel is prevented from using it. With this fadump will
+use it, while kernel is prevented from using it. With this FADump will
 still be able to capture all of the kernel memory and most of the user
 space memory except the user pages that were present in CMA region::
 
@@ -173,14 +173,14 @@ KDump, as dump mechanism.
 The tools to examine the dump will be same as the ones
 used for kdump.
 
-How to enable firmware-assisted dump (fadump):
+How to enable firmware-assisted dump (FADump):
 ----------------------------------------------
 
 1. Set config option CONFIG_FA_DUMP=y and build kernel.
 2. Boot into linux kernel with 'fadump=on' kernel cmdline option.
-   By default, fadump reserved memory will be initialized as CMA area.
+   By default, FADump reserved memory will be initialized as CMA area.
    Alternatively, user can boot linux kernel with 'fadump=nocma' to
-   prevent fadump to use CMA.
+   prevent FADump to use CMA.
 3. Optionally, user can also set 'crashkernel=' kernel cmdline
    to specify size of the memory to reserve for boot memory dump
    preservation.
@@ -206,29 +206,29 @@ the control files and debugfs file to display memory reserved region.
 Here is the list of files under kernel sysfs:
 
  /sys/kernel/fadump_enabled
-    This is used to display the fadump status.
+    This is used to display the FADump status.
 
-    - 0 = fadump is disabled
-    - 1 = fadump is enabled
+    - 0 = FADump is disabled
+    - 1 = FADump is enabled
 
     This interface can be used by kdump init scripts to identify if
-    fadump is enabled in the kernel and act accordingly.
+    FADump is enabled in the kernel and act accordingly.
 
  /sys/kernel/fadump_registered
-    This is used to display the fadump registration status as well
-    as to control (start/stop) the fadump registration.
+    This is used to display the FADump registration status as well
+    as to control (start/stop) the FADump registration.
 
-    - 0 = fadump is not registered.
-    - 1 = fadump is registered and ready to handle system crash.
+    - 0 = FADump is not registered.
+    - 1 = FADump is registered and ready to handle system crash.
 
-    To register fadump echo 1 > /sys/kernel/fadump_registered and
+    To register FADump echo 1 > /sys/kernel/fadump_registered and
     echo 0 > /sys/kernel/fadump_registered for un-register and stop the
-    fadump. Once the fadump is un-registered, the system crash will not
+    FADump. Once the FADump is un-registered, the system crash will not
     be handled and vmcore will not be captured. This interface can be
     easily integrated with kdump service start/stop.
 
  /sys/kernel/fadump_release_mem
-    This file is available only when fadump is active during
+    This file is available only when FADump is active during
     second kernel. This is used to release the reserved memory
     region that are held for saving crash dump. To release the
     reserved memory echo 1 to it::
@@ -246,21 +246,25 @@ Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
 
  /sys/kernel/debug/powerpc/fadump_region
-    This file shows the reserved memory regions if fadump is
+    This file shows the reserved memory regions if FADump is
     enabled otherwise this file is empty. The output format
     is::
 
       <region>: [<start>-<end>] <reserved-size> bytes, Dumped: <dump-size>
 
+    and for kernel DUMP region is:
+
+    DUMP: Src: <src-addr>, Dest: <dest-addr>, Size: <size>, Dumped: # bytes
+
     e.g.
-    Contents when fadump is registered during first kernel::
+    Contents when FADump is registered during first kernel::
 
       # cat /sys/kernel/debug/powerpc/fadump_region
       CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x0
       HPTE: [0x0000006fff0020-0x0000006fff101f] 0x1000 bytes, Dumped: 0x0
       DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x0
 
-    Contents when fadump is active during second kernel::
+    Contents when FADump is active during second kernel::
 
       # cat /sys/kernel/debug/powerpc/fadump_region
       CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x40020
@@ -268,6 +272,7 @@ Here is the list of files under powerpc debugfs:
       DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x10000000
           : [0x00000010000000-0x0000006ffaffff] 0x5ffb0000 bytes, Dumped: 0x5ffb0000
 
+
 NOTE:
       Please refer to Documentation/filesystems/debugfs.txt on
       how to mount the debugfs filesystem.
@@ -278,7 +283,7 @@ TODO:
  - Need to come up with the better approach to find out more
    accurate boot memory size that is required for a kernel to
    boot successfully when booted with restricted memory.
- - The fadump implementation introduces a fadump crash info structure
+ - The FADump implementation introduces a FADump crash info structure
    in the scratch area before the ELF core header. The idea of introducing
    this structure is to pass some important crash info data to the second
    kernel which will help second kernel to populate ELF core header with

