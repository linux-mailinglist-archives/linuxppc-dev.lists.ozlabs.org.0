Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39B8EA77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 13:39:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468PcP6lN4zDqtm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46822k19q3zDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 06:57:17 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EKphVL087301
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:57:12 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ucsg70kq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:57:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7EKt07j020923
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:57:11 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2ucr3q0km9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:57:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7EKv9HJ50921972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 20:57:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85DB8C6055;
 Wed, 14 Aug 2019 20:57:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5976EC6057;
 Wed, 14 Aug 2019 20:57:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.161.5])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 20:57:06 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] selftests/powerpc: Ignore generated files
Date: Wed, 14 Aug 2019 15:56:38 -0500
Message-Id: <20190814205638.25322-2-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814205638.25322-1-gromero@linux.ibm.com>
References: <20190814205638.25322-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140189
X-Mailman-Approved-At: Thu, 15 Aug 2019 21:33:39 +1000
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
Cc: Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently some binary files which are generated when tests are compiled
are not ignored by git, so 'git status' catch them.

For copyloops test, fix wrong binary names already in .gitignore. For
ptrace, security, and stringloops tests add missing binary names to the
.gitignore file.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 tools/testing/selftests/powerpc/copyloops/.gitignore   | 8 ++++----
 tools/testing/selftests/powerpc/ptrace/.gitignore      | 3 +++
 tools/testing/selftests/powerpc/security/.gitignore    | 1 +
 tools/testing/selftests/powerpc/stringloops/.gitignore | 5 ++++-
 4 files changed, 12 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/security/.gitignore

diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore b/tools/testing/selftests/powerpc/copyloops/.gitignore
index ce12cd0e2967..de158104912a 100644
--- a/tools/testing/selftests/powerpc/copyloops/.gitignore
+++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
@@ -1,13 +1,13 @@
 copyuser_64_t0
 copyuser_64_t1
 copyuser_64_t2
-copyuser_power7_t0
-copyuser_power7_t1
+copyuser_p7_t0
+copyuser_p7_t1
 memcpy_64_t0
 memcpy_64_t1
 memcpy_64_t2
-memcpy_power7_t0
-memcpy_power7_t1
+memcpy_p7_t0
+memcpy_p7_t1
 copyuser_64_exc_t0
 copyuser_64_exc_t1
 copyuser_64_exc_t2
diff --git a/tools/testing/selftests/powerpc/ptrace/.gitignore b/tools/testing/selftests/powerpc/ptrace/.gitignore
index 07ec449a2767..dce19f221c46 100644
--- a/tools/testing/selftests/powerpc/ptrace/.gitignore
+++ b/tools/testing/selftests/powerpc/ptrace/.gitignore
@@ -10,3 +10,6 @@ ptrace-tm-spd-vsx
 ptrace-tm-spr
 ptrace-hwbreak
 perf-hwbreak
+core-pkey
+ptrace-pkey
+ptrace-syscall
diff --git a/tools/testing/selftests/powerpc/security/.gitignore b/tools/testing/selftests/powerpc/security/.gitignore
new file mode 100644
index 000000000000..0b969fba3beb
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/.gitignore
@@ -0,0 +1 @@
+rfi_flush
diff --git a/tools/testing/selftests/powerpc/stringloops/.gitignore b/tools/testing/selftests/powerpc/stringloops/.gitignore
index 0b43da74ee46..31a17e0ba884 100644
--- a/tools/testing/selftests/powerpc/stringloops/.gitignore
+++ b/tools/testing/selftests/powerpc/stringloops/.gitignore
@@ -1 +1,4 @@
-memcmp
+memcmp_64
+memcmp_32
+strlen
+strlen_32
-- 
2.17.1

