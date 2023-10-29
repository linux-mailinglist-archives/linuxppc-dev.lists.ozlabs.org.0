Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC37DAC8D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Oct 2023 13:51:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO3DGyXR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJGVV5wTtz3vhb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Oct 2023 23:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO3DGyXR;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJGPL2TnRz3d9G
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Oct 2023 23:46:46 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SJGPL22Znz4xPh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Oct 2023 23:46:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SJGPL1yMdz4wcX; Sun, 29 Oct 2023 23:46:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO3DGyXR;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SJGPK6hvfz4xPc;
	Sun, 29 Oct 2023 23:46:45 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39TCetKS029716;
	Sun, 29 Oct 2023 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VMquWj+4TMFswH17F/huNEnaEC6tt9dNPJR7R5eRY2o=;
 b=qO3DGyXRjYjfuQ3dHdMWbv8bjwgyMuUZdgZmdB8GA67jKJTtRjWwRQfceMmkdlnWtzdb
 GuTubfxV+aOQVVHV10ss3NUYAhjXgZrlusmSui/t+2zC06NN+vh7T6ZSY21qFqfFd8c5
 TWVQ/5+OlxujwgZc6A+Gh0WW9bhibx8Y+IpwtzmC927+uWMbgUend2tsoKdgKkxa87iw
 QRhIN0mh4liwhLQuj7RtavhFInrfHSd4Y0YIdlLoms6UGfa6VYoFvgbp9affx7vmTeyC
 +avGtQLwCFhi65l7Pq4xbgUr+6iea5RBpM1dgM/Vyihe+ZGW5PjF9stBIQ+5eqqsGjSb kw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u14r2s9n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Oct 2023 12:46:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39TAn8EM019876;
	Sun, 29 Oct 2023 12:46:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1d0y32dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Oct 2023 12:46:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39TCjvKw47120662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Oct 2023 12:45:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9674A20043;
	Sun, 29 Oct 2023 12:45:57 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2117820040;
	Sun, 29 Oct 2023 12:45:56 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.98.119])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 29 Oct 2023 12:45:55 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5 3/3] Documentation/powerpc: update fadump implementation details
Date: Sun, 29 Oct 2023 18:15:48 +0530
Message-ID: <20231029124548.12198-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ovq-qbLWxAJo8qBkQ4KNk84jLzYw6NgO
X-Proofpoint-GUID: Ovq-qbLWxAJo8qBkQ4KNk84jLzYw6NgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-29_01,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310290110
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch titled ("powerpc: make fadump resilient with memory add/remove
events") has made significant changes to the implementation of fadump,
particularly on elfcorehdr creation and fadump crash info header
structure. Therefore, updating the fadump implementation documentation
to reflect those changes.

Following updates are done to firmware assisted dump documentation:

1. The elfcorehdr is no longer stored after fadump HDR in the reserved
   dump area. Instead, the second kernel dynamically allocates memory
   for the elfcorehdr within the address range from 0 to the boot memory
   size. Therefore, update figures 1 and 2 of Memory Reservation during
   the first and second kernels to reflect this change.

2. A version field has been added to the fadump header to maintain
   backward compatibility without changing the fadump header magic
   number in the future. Therefore, remove the corresponding TODO from
   the document.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 .../powerpc/firmware-assisted-dump.rst        | 91 +++++++++----------
 1 file changed, 42 insertions(+), 49 deletions(-)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index e363fc48529a..7e37aadd1f77 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -134,12 +134,12 @@ that are run. If there is dump data, then the
 memory is held.
 
 If there is no waiting dump data, then only the memory required to
-hold CPU state, HPTE region, boot memory dump, FADump header and
-elfcore header, is usually reserved at an offset greater than boot
-memory size (see Fig. 1). This area is *not* released: this region
-will be kept permanently reserved, so that it can act as a receptacle
-for a copy of the boot memory content in addition to CPU state and
-HPTE region, in the case a crash does occur.
+hold CPU state, HPTE region, boot memory dump, and FADump header is
+usually reserved at an offset greater than boot memory size (see Fig. 1).
+This area is *not* released: this region will be kept permanently
+reserved, so that it can act as a receptacle for a copy of the boot
+memory content in addition to CPU state and HPTE region, in the case
+a crash does occur.
 
 Since this reserved memory area is used only after the system crash,
 there is no point in blocking this significant chunk of memory from
@@ -153,22 +153,22 @@ that were present in CMA region::
 
   o Memory Reservation during first kernel
 
-  Low memory                                                 Top of memory
-  0    boot memory size   |<--- Reserved dump area --->|       |
-  |           |           |    Permanent Reservation   |       |
-  V           V           |                            |       V
-  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
-  |           |           |///|////|  DUMP | HDR | ELF |////|  |
-  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
-        |                   ^    ^     ^      ^           ^
-        |                   |    |     |      |           |
-        \                  CPU  HPTE   /      |           |
-         ------------------------------       |           |
-      Boot memory content gets transferred    |           |
-      to reserved area by firmware at the     |           |
-      time of crash.                          |           |
-                                          FADump Header   |
-                                           (meta area)    |
+  Low memory                                                  Top of memory
+  0    boot memory size   |<------ Reserved dump area ----->|     |
+  |           |           |      Permanent Reservation      |     |
+  V           V           |                                 |     V
+  +-----------+-----/ /---+---+----+-----------+-------+----+-----+
+  |           |           |///|////|    DUMP   |  HDR  |////|     |
+  +-----------+-----/ /---+---+----+-----------+-------+----+-----+
+        |                   ^    ^       ^         ^      ^
+        |                   |    |       |         |      |
+        \                  CPU  HPTE     /         |      |
+         --------------------------------          |      |
+      Boot memory content gets transferred         |      |
+      to reserved area by firmware at the          |      |
+      time of crash.                               |      |
+                                           FADump Header  |
+                                            (meta area)   |
                                                           |
                                                           |
                       Metadata: This area holds a metadata structure whose
@@ -186,13 +186,20 @@ that were present in CMA region::
   0      boot memory size                                      |
   |           |<------------ Crash preserved area ------------>|
   V           V           |<--- Reserved dump area --->|       |
-  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
-  |           |           |///|////|  DUMP | HDR | ELF |////|  |
-  +-----------+-----/ /---+---+----+-------+-----+-----+----+--+
-        |                                           |
-        V                                           V
-   Used by second                             /proc/vmcore
-   kernel to boot
+  +----+---+--+-----/ /---+---+----+-------+-----+-----+-------+
+  |    |ELF|  |           |///|////|  DUMP | HDR |/////|       |
+  +----+---+--+-----/ /---+---+----+-------+-----+-----+-------+
+       |   |  |                            |     |             |
+       -----  ------------------------------     ---------------
+         \              |                               |
+           \            |                               |
+             \          |                               |
+               \        |    ----------------------------
+                 \      |   /
+                   \    |  /
+                     \  | /
+                  /proc/vmcore
+
 
         +---+
         |///| -> Regions (CPU, HPTE & Metadata) marked like this in the above
@@ -200,6 +207,12 @@ that were present in CMA region::
                  does not have CPU & HPTE regions while Metadata region is
                  not supported on pSeries currently.
 
+        +---+
+        |ELF| -> elfcorehdr, it is created in second kernel after crash.
+        +---+
+
+        Note: Memory from 0 to the boot memory size is used by second kernel
+
                    Fig. 2
 
 
@@ -353,26 +366,6 @@ TODO:
  - Need to come up with the better approach to find out more
    accurate boot memory size that is required for a kernel to
    boot successfully when booted with restricted memory.
- - The FADump implementation introduces a FADump crash info structure
-   in the scratch area before the ELF core header. The idea of introducing
-   this structure is to pass some important crash info data to the second
-   kernel which will help second kernel to populate ELF core header with
-   correct data before it gets exported through /proc/vmcore. The current
-   design implementation does not address a possibility of introducing
-   additional fields (in future) to this structure without affecting
-   compatibility. Need to come up with the better approach to address this.
-
-   The possible approaches are:
-
-	1. Introduce version field for version tracking, bump up the version
-	whenever a new field is added to the structure in future. The version
-	field can be used to find out what fields are valid for the current
-	version of the structure.
-	2. Reserve the area of predefined size (say PAGE_SIZE) for this
-	structure and have unused area as reserved (initialized to zero)
-	for future field additions.
-
-   The advantage of approach 1 over 2 is we don't need to reserve extra space.
 
 Author: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
 
-- 
2.41.0

