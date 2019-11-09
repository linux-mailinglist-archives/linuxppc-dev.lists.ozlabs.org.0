Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC8F5F1F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 13:37:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479GqQ4p95zF7GD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 23:37:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479GXY08VbzF271
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:24:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 479GXX26PPz8t5L
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:24:12 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 479GXW61J4z9sR3; Sat,  9 Nov 2019 23:24:11 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 479GXW0986z9sR7
 for <linuxppc-dev@ozlabs.org>; Sat,  9 Nov 2019 23:24:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA9C6eKl009433
 for <linuxppc-dev@ozlabs.org>; Sat, 9 Nov 2019 07:24:09 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5tuabwkj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 09 Nov 2019 07:24:08 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Sat, 9 Nov 2019 12:24:06 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 9 Nov 2019 12:24:04 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA9CO33j58851444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 9 Nov 2019 12:24:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A793A4053;
 Sat,  9 Nov 2019 12:24:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58993A4040;
 Sat,  9 Nov 2019 12:24:01 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.73.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  9 Nov 2019 12:24:01 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs
 files deprecated
Date: Sat,  9 Nov 2019 17:53:38 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
References: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19110912-0016-0000-0000-000002C229B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110912-0017-0000-0000-00003323B3F8
Message-Id: <20191109122339.20484-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-09_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911090131
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

The /sys/kernel/fadump_* sysfs files are replicated under
/sys/kernel/fadump/ directory. But we need to keep the old
sysfs files to maintain the backward compatibility.

The sysfs files are scheduled to remove by 2021.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../sysfs-kernel-fadump_enabled                   |  3 +++
 .../sysfs-kernel-fadump_registered                |  3 +++
 .../sysfs-kernel-fadump_release_mem               |  3 +++
 .../sysfs-kernel-fadump_release_opalcore          |  2 ++
 Documentation/powerpc/firmware-assisted-dump.rst  | 15 +++++++++++++--
 5 files changed, 24 insertions(+), 2 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled (67%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_registered (72%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_mem (74%)
 rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (82%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
similarity index 67%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_enabled
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
index f73632b1c006..96f49f979e9c 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/enabled.
+
 What:		/sys/kernel/fadump_enabled
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_registered b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
similarity index 72%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_registered
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
index dcf925e53f0f..11ab41c673de 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_registered
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/registered.
+
 What:		/sys/kernel/fadump_registered
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
similarity index 74%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
index 9c20d64ab48d..69308b28cb0d 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/release_mem.
+
 What:		/sys/kernel/fadump_release_mem
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
similarity index 82%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
index 53313c1d4e7a..fe42956a3f41 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
+++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
@@ -1,3 +1,5 @@
+This ABI is moved to /sys/kernel/fadump/release_opalcore.
+
 What:		/sys/kernel/fadump_release_opalcore
 Date:		Sep 2019
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 0455a78486d5..fc7b06408cea 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -283,14 +283,25 @@ Here is the list of files under kernel sysfs:
     enhanced to use this interface to release the memory reserved for
     dump and continue without 2nd reboot.
 
- /sys/kernel/fadump_release_opalcore
+Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
+      /sys/kernel/fadump/release_opalcore.
+
+ /sys/kernel/fadump/release_opalcore
 
     This file is available only on OPAL based machines when FADump is
     active during capture kernel. This is used to release the memory
     used by the kernel to export /sys/firmware/opal/core file. To
     release this memory, echo '1' to it:
 
-    echo 1  > /sys/kernel/fadump_release_opalcore
+    echo 1  > /sys/kernel/fadump/release_opalcore
+
+Note: The following FADump sysfs files are deprecated.
+
+    Deprecated                           Alternative
+    --------------------------------------------------------------------
+    /sys/kernel/fadump_enabled           /sys/kernel/fadump/enabled
+    /sys/kernel/fadump_registered        /sys/kernel/fadump/registered
+    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/release_mem
 
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
-- 
2.17.2

