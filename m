Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F211BBC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:34:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5DZ27YJzDqvL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y2221LknzDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Y2215vgSz8wHf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Y22035yLzB3y7; Thu, 12 Dec 2019 03:09:44 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 47Y21z5Htbz9sfG
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Dec 2019 03:09:43 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBG7Wif062731
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:41 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wu1fmegxs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:41 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 11 Dec 2019 16:09:39 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 16:09:36 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBG9YmQ28967038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 16:09:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF93DA405F;
 Wed, 11 Dec 2019 16:09:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93BEEA4054;
 Wed, 11 Dec 2019 16:09:32 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 16:09:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v6 5/6] Documentation/ABI: mark /sys/kernel/fadump_* sysfs
 files deprecated
Date: Wed, 11 Dec 2019 21:39:09 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19121116-0008-0000-0000-0000033FDBD3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-0009-0000-0000-00004A5F12C2
Message-Id: <20191211160910.21656-6-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912110136
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

Add a deprecation note in FADump sysfs ABI documentation files and move
them from ABI/testing to ABI/obsolete directory.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled | 2 ++
 .../{testing => obsolete}/sysfs-kernel-fadump_registered  | 2 ++
 .../{testing => obsolete}/sysfs-kernel-fadump_release_mem | 2 ++
 Documentation/powerpc/firmware-assisted-dump.rst          | 8 ++++++++
 4 files changed, 14 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled (73%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_registered (77%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_mem (78%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
similarity index 73%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_enabled
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
index f73632b1c006..e9c2de8b3688 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
@@ -1,3 +1,5 @@
+This ABI is renamed and moved to a new location /sys/kernel/fadump/enabled.
+
 What:		/sys/kernel/fadump_enabled
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_registered b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
similarity index 77%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_registered
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
index dcf925e53f0f..0360be39c98e 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_registered
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
@@ -1,3 +1,5 @@
+This ABI is renamed and moved to a new location /sys/kernel/fadump/registered.¬
+
 What:		/sys/kernel/fadump_registered
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
similarity index 78%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
index 9c20d64ab48d..6ce0b129ab12 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
@@ -1,3 +1,5 @@
+This ABI is renamed and moved to a new location /sys/kernel/fadump/release_mem.¬
+
 What:		/sys/kernel/fadump_release_mem
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 345a3405206e..365c10209ef3 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -295,6 +295,14 @@ Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
 
     echo 1  > /sys/firmware/opal/mpipl/release_core
 
+Note: The following FADump sysfs files are deprecated.
+
+    Deprecated                           Alternative
+    --------------------------------------------------------------------
+    /sys/kernel/fadump_enabled           /sys/kernel/fadump/enabled
+    /sys/kernel/fadump_registered        /sys/kernel/fadump/registered
+    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/release_mem
+
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
 
-- 
2.17.2

