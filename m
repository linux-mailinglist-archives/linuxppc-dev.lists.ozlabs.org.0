Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C42F9C1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 11:00:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK6jS6D6NzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 21:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lIY9bYin; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK6gc5pyrzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 20:58:52 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10I9WPvo080519; Mon, 18 Jan 2021 04:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WxAb0VXeJrJNS5LodmQVdUbWo16N+IfRjsa1wS1ZlgU=;
 b=lIY9bYin6RRcoBXRKOJt4MXzeKVJa6rNiUDsNCLnPl0appJP9Iq2h3sE8ql9lFRxEthL
 jpzzvYPZG9VsA7LQPH7+lE8816qM9RKpgo+FP1TjiHL1pKY7lH0bbj3aYvsXgedgNA1/
 nFUL1KK8dT6fcKSFX9hI5xtalTH/+s2GBRxqX1MsqnTyTxJ9k7jbJuT8QZi2ihGUjMqd
 9nOeFvBQplnoQlkUFs60tIesROJlA2VZ9EPrgoOC4TLk/ryBrNYi6saORqAhvKaa8nwD
 socHxpYI5MN2G39X7XnoPySuLEKxXv10JR2DHCWH9vfJMXqMRBJEGMWL1grg6h/R9toW JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3657g9gg34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 04:32:31 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10I9WTEh080998;
 Mon, 18 Jan 2021 04:32:29 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3657g9gfqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 04:32:27 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10I9RIhT019906;
 Mon, 18 Jan 2021 09:31:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 363qs7hvhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 09:31:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10I9VgX525821548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 09:31:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6FA84C052;
 Mon, 18 Jan 2021 09:31:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD77B4C044;
 Mon, 18 Jan 2021 09:31:46 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Jan 2021 09:31:46 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests/powerpc: Fix exit status of pkey tests
Date: Mon, 18 Jan 2021 15:01:45 +0530
Message-Id: <20210118093145.10134-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_07:2021-01-15,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101180053
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
Cc: harish@linux.ibm.com, aneesh.kumar@linux.ibm.com, efuller@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since main() does not return a value explicitly, the
return values from FAIL_IF() conditions are ignored
and the tests can still pass irrespective of failures.
This makes sure that we always explicitly return the
correct test exit status.

Reported-by: Eirik Fuller <efuller@redhat.com>
Fixes: 1addb6444791 ("selftests/powerpc: Add test for execute-disabled pkeys")
Fixes: c27f2fd1705a ("selftests/powerpc: Add test for pkey siginfo verification")
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 9e5c7f3f498a..0af4f02669a1 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -290,5 +290,5 @@ static int test(void)
 
 int main(void)
 {
-	test_harness(test, "pkey_exec_prot");
+	return test_harness(test, "pkey_exec_prot");
 }
diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
index 4f815d7c1214..2db76e56d4cb 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
@@ -329,5 +329,5 @@ static int test(void)
 
 int main(void)
 {
-	test_harness(test, "pkey_siginfo");
+	return test_harness(test, "pkey_siginfo");
 }
-- 
2.25.1

