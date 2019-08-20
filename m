Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D195F5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CWC54vRWzDr7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTzk2nKzzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTzh0Q7Dz8t86
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTzg5wlSz9sML; Tue, 20 Aug 2019 22:06:39 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CTzf6sylz9sBF
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:06:38 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC2Aag012348
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugegq5m36-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:36 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:06:34 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:06:31 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC6TqG55312554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:06:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F4DAAE076;
 Tue, 20 Aug 2019 12:06:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E5FAAE051;
 Tue, 20 Aug 2019 12:06:28 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:06:27 +0000 (GMT)
Subject: [PATCH v5 19/31] powerpc/fadump: Update documentation about OPAL
 platform support
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:36:27 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0012-0000-0000-00000340AF0B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0013-0000-0000-0000217AD2ED
Message-Id: <156630278711.8896.9799921270260662672.stgit@hbathini.in.ibm.com>
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

With FADump support now available on both pseries and OPAL platforms,
update FADump documentation with these details.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 Documentation/powerpc/firmware-assisted-dump.rst |  104 +++++++++++++---------
 1 file changed, 63 insertions(+), 41 deletions(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index d912755..2c3342c 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -72,7 +72,8 @@ as follows:
    normal.
 
 -  The freshly booted kernel will notice that there is a new
-   node (ibm,dump-kernel) in the device tree, indicating that
+   node (ibm,dump-kernel on PSeries or ibm,opal/dump/mpipl-boot
+   on OPAL platform) in the device tree, indicating that
    there is crash data available from a previous boot. During
    the early boot OS will reserve rest of the memory above
    boot memory size effectively booting with restricted memory
@@ -96,7 +97,9 @@ as follows:
 
 Please note that the firmware-assisted dump feature
 is only available on Power6 and above systems with recent
-firmware versions.
+firmware versions on PSeries (PowerVM) platform and Power9
+and above systems with recent firmware versions on PowerNV
+(OPAL) platform.
 
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

