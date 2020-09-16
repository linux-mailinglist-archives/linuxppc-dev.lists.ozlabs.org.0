Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210326D05B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 03:06:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJhN3140zDrdF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iEvv//+a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ5w32tvzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 10:40:20 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GH1mNQ032592; Wed, 16 Sep 2020 13:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JVwnq5kZfCkqHhizo7s8mEadeTEXx1dVrrlhgtYtO0I=;
 b=iEvv//+aHtpFe7GuS6MZ8LQ2Hi8wvekUyP5dODs1kpT9mmF3iQHzCK2jgoH7OOwR9pUI
 h7zqxNBdgpzF5jAR/j51nlWeSS5oU8V5wdE4MWBcz5vjSJ7bcmxQXfdVuwrLcZTMVyWi
 tNaZOYj8BYko6rt8dIbhvZCkhh1JrhtpduOFLg4uSTb1EPb9nlUhFi8tzSYoE2Om38Ap
 J8a4PcinJZ+pnLT93rjG/AEiihRJ+Vn+u8q9iI5Ho3/zY/U1US2rF0hqhgOWolYRFLeh
 vpFROi7JjtzuPQSx9Eb4RCSotC8sScMduQEOqsZ624ui0b44Vn1R1YgcrZvcgF2g+ADV Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kp301vxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:23:03 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08GHE0Uo076679;
 Wed, 16 Sep 2020 13:23:03 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kp301vwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:23:03 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GHN1L7003239;
 Wed, 16 Sep 2020 17:23:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 33k5v98ffn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 17:23:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GHMxTW26935616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 17:22:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04F9242047;
 Wed, 16 Sep 2020 17:22:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FC3E42041;
 Wed, 16 Sep 2020 17:22:57 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.2.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 17:22:57 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] selftest/powerpc: Add slb multihit selftest
Date: Wed, 16 Sep 2020 22:52:28 +0530
Message-Id: <20200916172228.83271-4-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_11:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=965
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160118
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
Cc: mahesh@linux.vnet.ibm.com, msuchanek@suse.de,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add selftest to check if the system recovers from slb multihit
errors.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile             | 3 ++-
 tools/testing/selftests/powerpc/mces/Makefile        | 6 ++++++
 tools/testing/selftests/powerpc/mces/slb_multihit.sh | 9 +++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mces/Makefile
 create mode 100755 tools/testing/selftests/powerpc/mces/slb_multihit.sh

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 0830e63818c1..3c900b30da79 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -31,7 +31,8 @@ SUB_DIRS = alignment		\
 	   vphn         \
 	   math		\
 	   ptrace	\
-	   security
+	   security	\
+	   mces
 
 endif
 
diff --git a/tools/testing/selftests/powerpc/mces/Makefile b/tools/testing/selftests/powerpc/mces/Makefile
new file mode 100644
index 000000000000..5a356295e952
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mces/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for machine check exceptions selftests
+
+TEST_PROGS := slb_multihit.sh
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/mces/slb_multihit.sh b/tools/testing/selftests/powerpc/mces/slb_multihit.sh
new file mode 100755
index 000000000000..35c17c619d0a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mces/slb_multihit.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+if [ ! -e "/sys/kernel/debug/powerpc/mce_error_inject/inject_slb_multihit" ] ; then
+        exit 0;
+fi
+
+echo 1 > /sys/kernel/debug/powerpc/mce_error_inject/inject_slb_multihit
+exit 0
-- 
2.26.2

