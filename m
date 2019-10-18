Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03056DC64C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:39:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vnG22Hk1zF0Tr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:39:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmWS36kLzDrdf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 00:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46vmWM5q0Xz8tKk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 00:06:23 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46vmWM22Npz9sNw; Sat, 19 Oct 2019 00:06:23 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 46vmWJ5YWsz9sPW
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 00:06:19 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ID37l1005958
 for <linuxppc-dev@ozlabs.org>; Fri, 18 Oct 2019 09:06:16 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqdf4hcwb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 18 Oct 2019 09:06:16 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 18 Oct 2019 14:06:13 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 18 Oct 2019 14:06:10 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ID68EW41746434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 13:06:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABD5EA404D;
 Fri, 18 Oct 2019 13:06:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B48AAA405D;
 Fri, 18 Oct 2019 13:06:06 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.73.145])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Oct 2019 13:06:06 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/4] Documentation/ABI: add ABI documentation for
 /sys/kernel/fadump_*
Date: Fri, 18 Oct 2019 18:35:54 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
References: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19101813-0016-0000-0000-000002B949DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101813-0017-0000-0000-0000331A7798
Message-Id: <20191018130557.2217-2-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-18_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=944 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Add the missing ABI documentation for the already available FADump
sysfs files.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump_enabled     | 7 +++++++
 Documentation/ABI/testing/sysfs-kernel-fadump_registered  | 8 ++++++++
 Documentation/ABI/testing/sysfs-kernel-fadump_release_mem | 8 ++++++++
 .../ABI/testing/sysfs-kernel-fadump_release_opalcore      | 7 +++++++
 4 files changed, 30 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump_registered
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled b/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
new file mode 100644
index 000000000000..f73632b1c006
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
@@ -0,0 +1,7 @@
+What:		/sys/kernel/fadump_enabled
+Date:		Feb 2012
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Primarily used to identify whether the FADump is enabled in
+		the kernel or not.
+User:		Kdump service
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_registered b/Documentation/ABI/testing/sysfs-kernel-fadump_registered
new file mode 100644
index 000000000000..dcf925e53f0f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump_registered
@@ -0,0 +1,8 @@
+What:		/sys/kernel/fadump_registered
+Date:		Feb 2012
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read/write
+		Helps to control the dump collect feature from userspace.
+		Setting 1 to this file enables the system to collect the
+		dump and 0 to disable it.
+User:		Kdump service
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem b/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
new file mode 100644
index 000000000000..9c20d64ab48d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
@@ -0,0 +1,8 @@
+What:		/sys/kernel/fadump_release_mem
+Date:		Feb 2012
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	write only
+		This is a special sysfs file and only available when
+		the system is booted to capture the vmcore using FADump.
+		It is used to release the memory reserved by FADump to
+		save the crash dump.
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
new file mode 100644
index 000000000000..53313c1d4e7a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
@@ -0,0 +1,7 @@
+What:		/sys/kernel/fadump_release_opalcore
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	write only
+		The sysfs file is available when the system is booted to
+		collect the dump on OPAL based machine. It used to release
+		the memory used to collect the opalcore.
-- 
2.17.2

