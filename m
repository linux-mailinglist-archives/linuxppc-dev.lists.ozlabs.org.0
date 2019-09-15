Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94AB304A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 15:40:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WVqV5dSQzDqwt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 23:40:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WVSL34zPzF59g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46WVSL28zmz8tWS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46WVSL1RBvz9sPZ; Sun, 15 Sep 2019 23:23:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46WVSK4PX7z9sP4
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 23:23:29 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8FDMcsp053825
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v1djt1ht3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:27 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Sun, 15 Sep 2019 14:23:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 15 Sep 2019 14:23:23 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8FDNMet53674072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Sep 2019 13:23:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EC83A405F;
 Sun, 15 Sep 2019 13:23:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5578A405B;
 Sun, 15 Sep 2019 13:23:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.54.91])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 15 Sep 2019 13:23:20 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs files
 deprecated
Date: Sun, 15 Sep 2019 18:53:09 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
References: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091513-0020-0000-0000-0000036CEECE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091513-0021-0000-0000-000021C28983
Message-Id: <20190915132310.13542-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150147
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
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The /sys/kernel/fadump_* sysfs files are replicated under
/sys/kernel/fadump/ directory. But we need to keep the old
sysfs files to maintain the backward compatibility.

The sysfs files are scheduled to remove by 2021.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../{testing => obsolete}/sysfs-kernel-fadump_enabled    | 3 +++
 .../{testing => obsolete}/sysfs-kernel-fadump_registered | 3 +++
 .../sysfs-kernel-fadump_release_mem                      | 3 +++
 .../sysfs-kernel-fadump_release_opalcore                 | 3 +++
 Documentation/powerpc/firmware-assisted-dump.rst         | 9 +++++++++
 5 files changed, 21 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled (66%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_registered (71%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_mem (73%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_opalcore (70%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
similarity index 66%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_enabled
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
index f73632b1c006..ca35a285905b 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_enabled.
+
 What:		/sys/kernel/fadump_enabled
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_registered b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
similarity index 71%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_registered
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
index 972e8c427ad4..2c1bc4adafb4 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_registered
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_registered.
+
 What:		/sys/kernel/fadump/fadump_registered
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
similarity index 73%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
index 9c20d64ab48d..8fef37d9b5ba 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_release_mem.
+
 What:		/sys/kernel/fadump_release_mem
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
similarity index 70%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
index 53313c1d4e7a..c02be8f4471e 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_release_opalcore.
+
 What:		/sys/kernel/fadump_release_opalcore
 Date:		Sep 2019
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 0455a78486d5..4fd7f5eab97d 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -292,6 +292,15 @@ Here is the list of files under kernel sysfs:
 
     echo 1  > /sys/kernel/fadump_release_opalcore
 
+Note: The following FADump sysfs files are deprecated.
+
+    Deprecated                       Alternative
+    -------------------------------------------------------------------------------
+    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
+    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
+    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem
+    /sys/kernel/fadump_release_opalcore  /sys/kernel/fadump/fadump_release_opalcore
+
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
 
-- 
2.17.2

