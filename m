Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 684ACB00A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:56:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T62P4nkSzF14f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:56:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4fl2wBNzF3DK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:54:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4fk6lQXz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:54:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4fk5Ybrz9sNT; Thu, 12 Sep 2019 00:54:06 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4fk0L50z9sNF
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:54:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgdF1136513
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:54:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1rybdu4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:54:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:54:01 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:53:58 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BErWui39387412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:53:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11114204D;
 Wed, 11 Sep 2019 14:53:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 980FF4204C;
 Wed, 11 Sep 2019 14:53:54 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:53:54 +0000 (GMT)
Subject: [PATCH v6 23/36] powerpc/fadump: Update documentation about OPAL
 platform support
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:23:53 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-4275-0000-0000-0000036481CC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-4276-0000-0000-00003876D9D1
Message-Id: <156821361692.5656.11377757995827253404.stgit@hbathini.in.ibm.com>
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

With FADump support now available on both pseries and OPAL platforms,
update FADump documentation with these details.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Specific the firmware release versions that support MPIPL.


 Documentation/powerpc/firmware-assisted-dump.rst |  122 +++++++++++++---------
 1 file changed, 72 insertions(+), 50 deletions(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index d912755..ab578ac 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -46,10 +46,9 @@ as follows:
    These registered sections of memory are reserved by the first
    kernel during early boot.
 
--  When a system crashes, the Power firmware will save
-   the low memory (boot memory of size larger of 5% of system RAM
-   or 256MB) of RAM to the previous registered region. It will
-   also save system registers, and hardware PTE's.
+-  When system crashes, the Power firmware will copy the registered
+   low memory regions (boot memory) from source to destination area.
+   It will also save hardware PTE's.
 
    NOTE:
          The term 'boot memory' means size of the low memory chunk
@@ -61,9 +60,9 @@ as follows:
          the default calculated size. Use this option if default
          boot memory size is not sufficient for second kernel to
          boot successfully. For syntax of crashkernel= parameter,
-         refer to Documentation/admin-guide/kdump/kdump.rst. If any offset is
-         provided in crashkernel= parameter, it will be ignored
-         as FADump uses a predefined offset to reserve memory
+         refer to Documentation/admin-guide/kdump/kdump.rst. If any
+         offset is provided in crashkernel= parameter, it will be
+         ignored as FADump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
 
 -  After the low memory (boot memory) area has been saved, the
@@ -71,8 +70,9 @@ as follows:
    *not* clear the RAM. It will then launch the bootloader, as
    normal.
 
--  The freshly booted kernel will notice that there is a new
-   node (ibm,dump-kernel) in the device tree, indicating that
+-  The freshly booted kernel will notice that there is a new node
+   (rtas/ibm,kernel-dump on pSeries or ibm,opal/dump/mpipl-boot
+   on OPAL platform) in the device tree, indicating that
    there is crash data available from a previous boot. During
    the early boot OS will reserve rest of the memory above
    boot memory size effectively booting with restricted memory
@@ -95,8 +95,11 @@ as follows:
      # echo 1 > /sys/kernel/fadump_release_mem
 
 Please note that the firmware-assisted dump feature
-is only available on Power6 and above systems with recent
-firmware versions.
+is only available on POWER6 and above systems on pSeries
+(PowerVM) platform and POWER9 and above systems with OP940
+or later firmware versions on PowerNV (OPAL) platform.
+Note that, OPAL firmware exports ibm,opal/dump node when
+FADump is supported on PowerNV platform.
 
 Implementation details:
 -----------------------
@@ -111,57 +114,76 @@ that are run. If there is dump data, then the
 /sys/kernel/fadump_release_mem file is created, and the reserved
 memory is held.
 
-If there is no waiting dump data, then only the memory required
-to hold CPU state, HPTE region, boot memory dump and elfcore
-header, is usually reserved at an offset greater than boot memory
-size (see Fig. 1). This area is *not* released: this region will
-be kept permanently reserved, so that it can act as a receptacle
-for a copy of the boot memory content in addition to CPU state
-and HPTE region, in the case a crash does occur. Since this reserved
-memory area is used only after the system crash, there is no point in
-blocking this significant chunk of memory from production kernel.
-Hence, the implementation uses the Linux kernel's Contiguous Memory
-Allocator (CMA) for memory reservation if CMA is configured for kernel.
-With CMA reservation this memory will be available for applications to
-use it, while kernel is prevented from using it. With this FADump will
-still be able to capture all of the kernel memory and most of the user
-space memory except the user pages that were present in CMA region::
+If there is no waiting dump data, then only the memory required to
+hold CPU state, HPTE region, boot memory dump, FADump header and
+elfcore header, is usually reserved at an offset greater than boot
+memory size (see Fig. 1). This area is *not* released: this region
+will be kept permanently reserved, so that it can act as a receptacle
+for a copy of the boot memory content in addition to CPU state and
+HPTE region, in the case a crash does occur.
+
+Since this reserved memory area is used only after the system crash,
+there is no point in blocking this significant chunk of memory from
+production kernel. Hence, the implementation uses the Linux kernel's
+Contiguous Memory Allocator (CMA) for memory reservation if CMA is
+configured for kernel. With CMA reservation this memory will be
+available for applications to use it, while kernel is prevented from
+using it. With this FADump will still be able to capture all of the
+kernel memory and most of the user space memory except the user pages
+that were present in CMA region::
 
   o Memory Reservation during first kernel
 
-  Low memory                                                Top of memory
-  0      boot memory size      |<--Reserved dump area --->|      |
-  |           |                | (Permanent Reservation)  |      |
-  V           V                |                          |      V
-  +-----------+----------/ /---+---+----+--------+---+----+------+
-  |           |                |CPU|HPTE|  DUMP  |HDR|ELF |      |
-  +-----------+----------/ /---+---+----+--------+---+----+------+
-        |                                   ^      ^
-        |                                   |      |
-        \                                   /      |
-         -----------------------------------     FADump Header
-          Boot memory content gets transferred   (meta area)
-          to reserved area by firmware at the
-          time of crash
+  Low memory                                                 Top of memory
+  0    boot memory size   |<--- Reserved dump area --->|       |
+  |           |           |    Permanent Reservation   |       |
+  V           V           |                            |       V
+  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
+  |           |           |///|////|  DUMP | HDR | ELF |////|  |
+  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
+        |                   ^    ^     ^      ^           ^
+        |                   |    |     |      |           |
+        \                  CPU  HPTE   /      |           |
+         ------------------------------       |           |
+      Boot memory content gets transferred    |           |
+      to reserved area by firmware at the     |           |
+      time of crash.                          |           |
+                                          FADump Header   |
+                                           (meta area)    |
+                                                          |
+                                                          |
+                      Metadata: This area holds a metadata struture whose
+                      address is registered with f/w and retrieved in the
+                      second kernel after crash, on platforms that support
+                      tags (OPAL). Having such structure with info needed
+                      to process the crashdump eases dump capture process.
 
                    Fig. 1
 
 
   o Memory Reservation during second kernel after crash
 
-  Low memory                                                Top of memory
-  0      boot memory size                                        |
-  |           |<----------- Crash preserved area --------------->|
-  V           V                |<-- Reserved dump area -->|      V
-  +-----------+----------/ /---+---+----+--------+---+----+------+
-  |           |                |CPU|HPTE|  DUMP  |HDR|ELF |      |
-  +-----------+----------/ /---+---+----+--------+---+----+------+
-        |                                              |
-        V                                              V
-   Used by second                                /proc/vmcore
+  Low memory                                              Top of memory
+  0      boot memory size                                      |
+  |           |<------------ Crash preserved area ------------>|
+  V           V           |<--- Reserved dump area --->|       |
+  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
+  |           |           |///|////|  DUMP | HDR | ELF |////|  |
+  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
+        |                                           |
+        V                                           V
+   Used by second                             /proc/vmcore
    kernel to boot
+
+        +---+
+        |///| -> Regions (CPU, HPTE & Metadata) marked like this in the above
+        +---+    figures are not always present. For example, OPAL platform
+                 does not have CPU & HPTE regions while Metadata region is
+                 not supported on pSeries currently.
+
                    Fig. 2
 
+
 Currently the dump will be copied from /proc/vmcore to a new file upon
 user intervention. The dump data available through /proc/vmcore will be
 in ELF format. Hence the existing kdump infrastructure (kdump scripts)

