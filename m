Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AD6D8E60
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:36:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTGN2mXsz3fTt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:36:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixo03gxV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixo03gxV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCZ1f8jz3f5K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3361uUUW013053
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6WUkvm2fxJaUJ73CrfwGVThEshMSHLoJY8+s3+np4ho=;
 b=ixo03gxVobj1934roM2GTo7D/ukYw+ajg35KJccY0HRrejO4pfTLbHud78+SSKOAUG6o
 H7J+eNOe8wFKDlaH6VFy7/UpoC9MCmyvx69u12wSRyyK4bFP/NQ2Ix97+xz0DA97bcC/
 1UiybfQtoTyGgrUZTPWkRdn41Yxk4sdOvhmIJAqTWtqaueY41NpGVHD7eBheazyfwZwc
 rifjqY/YEnJv8XKCSUbRivYIDQU5/3wqhdQtUuQenlAhEcO22zHo9lpKKkrLuZNYgCaH
 F8Y+9YxBcSwkjBnFWq0gbMceM/PXGdnnLh81GI/xrLMwumq4PR8W4peG1SPyzwEYR+3Q Mw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psar70x7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 335LwMHW009077
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ppc86txxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364Xcsc44827186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F4DF2004B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3D9320043
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1AB0460371;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/7] selftests/powerpc: Move bind_to_cpu() to utils.h
Date: Thu,  6 Apr 2023 14:33:15 +1000
Message-Id: <20230406043320.125138-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ixnTNrJ5ptn7oTBbFvy8IRrXwbv4B0hx
X-Proofpoint-GUID: ixnTNrJ5ptn7oTBbFvy8IRrXwbv4B0hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060039
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function will be useful in the DSCR test patches later in this
series, so promote it to be shared by all powerpc selftests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2:	* New in v2
---
 tools/testing/selftests/powerpc/include/utils.h |  1 +
 tools/testing/selftests/powerpc/pmu/lib.c       | 13 -------------
 tools/testing/selftests/powerpc/pmu/lib.h       |  1 -
 tools/testing/selftests/powerpc/utils.c         | 12 ++++++++++++
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index eed7dd7582b2..d3589e16a20f 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -32,6 +32,7 @@ void *find_auxv_entry(int type, char *auxv);
 void *get_auxv_entry(int type);
 
 int pick_online_cpu(void);
+int bind_to_cpu(int cpu);
 
 int parse_intmax(const char *buffer, size_t count, intmax_t *result, int base);
 int parse_uintmax(const char *buffer, size_t count, uintmax_t *result, int base);
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 719f94f10d41..144f90a78d69 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -14,19 +14,6 @@
 #include "utils.h"
 #include "lib.h"
 
-
-int bind_to_cpu(int cpu)
-{
-	cpu_set_t mask;
-
-	printf("Binding to cpu %d\n", cpu);
-
-	CPU_ZERO(&mask);
-	CPU_SET(cpu, &mask);
-
-	return sched_setaffinity(0, sizeof(mask), &mask);
-}
-
 #define PARENT_TOKEN	0xAA
 #define CHILD_TOKEN	0x55
 
diff --git a/tools/testing/selftests/powerpc/pmu/lib.h b/tools/testing/selftests/powerpc/pmu/lib.h
index bf1bec013bbb..1d62403ae6ea 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.h
+++ b/tools/testing/selftests/powerpc/pmu/lib.h
@@ -20,7 +20,6 @@ union pipe {
 	int fds[2];
 };
 
-extern int bind_to_cpu(int cpu);
 extern int kill_child_and_wait(pid_t child_pid);
 extern int wait_for_child(pid_t child_pid);
 extern int sync_with_child(union pipe read_pipe, union pipe write_pipe);
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 7c8cfedb012a..cdb996dba703 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -452,6 +452,18 @@ int pick_online_cpu(void)
 	return cpu;
 }
 
+int bind_to_cpu(int cpu)
+{
+	cpu_set_t mask;
+
+	printf("Binding to cpu %d\n", cpu);
+
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+
+	return sched_setaffinity(0, sizeof(mask), &mask);
+}
+
 bool is_ppc64le(void)
 {
 	struct utsname uts;
-- 
2.39.2

