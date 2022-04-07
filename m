Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D990C4F873B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9GZ6zlwz3bc1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 04:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvQJ8vbw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pvQJ8vbw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9Dj2vtMz3bYb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 04:40:37 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237Hl1Ex021744; 
 Thu, 7 Apr 2022 18:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xfQ3E8yUSemWJMWvuJAnI/1Wu3kezd+qtoiUH5u+qPs=;
 b=pvQJ8vbwFx46sV4Y8xGDSDAY7DW9AZWP2xA+p4RUR01gM+dD4O2u0HGQ4iLEMFe1JCmJ
 XyjeTmU7tUwe0JahGyReGqiapaFCYr6qNnRebrDoidKIh+5yK7ApzszKdPSfMcvmR200
 pTRu4YMZGbNoXqz3bI0ln1QKDw9yfuJ4QPpc6QBJDwNaqE+NrcOnTlXHB5NTDUrCsa6E
 XCRZiOafC0s3gYG5bCiaQpEn7La0bOWB6J0TDfPzienodYcFBLlkQq9hCrFzw/9tJXz0
 aPjFqPnn9j3fh2YqpA2pzqWyrDUkv+/pvnVfIHPqTcstgpLc70qtOuMLDXRMQ6Py2xD9 Cw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4a5sr9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:40:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 237INbHK004405;
 Thu, 7 Apr 2022 18:40:21 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3f6e490j6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:40:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 237IeIP535127806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 18:40:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 773D452051;
 Thu,  7 Apr 2022 18:40:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.133.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3B68C5204F;
 Thu,  7 Apr 2022 18:40:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 disgoel@linux.vnet.ibm.com
Subject: [PATCH V2] testing/selftests/mqueue: Fix mq_perf_tests to free the
 allocated cpu set
Date: Fri,  8 Apr 2022 00:10:08 +0530
Message-Id: <20220407184008.93879-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JVkspol0CEqjOAVCtqsO5wNL_61pd4OQ
X-Proofpoint-GUID: JVkspol0CEqjOAVCtqsO5wNL_61pd4OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070092
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
Cc: maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The selftest "mqueue/mq_perf_tests.c" use CPU_ALLOC to allocate
CPU set. This cpu set is used further in pthread_attr_setaffinity_np
and by pthread_create in the code. But in current code, allocated
cpu set is not freed.

Fix this issue by adding CPU_FREE in the "shutdown" function which
is called in most of the error/exit path for the cleanup. Also add
CPU_FREE in some of the error paths where shutdown is not called.

Fixes: 7820b0715b6f ("tools/selftests: add mq_perf_tests")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
From v1 -> v2:
 Addressed review comment from Shuah Khan to add
 CPU_FREE in other exit paths where it is needed

 tools/testing/selftests/mqueue/mq_perf_tests.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index b019e0b8221c..182434c7898d 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -180,6 +180,9 @@ void shutdown(int exit_val, char *err_cause, int line_no)
 	if (in_shutdown++)
 		return;
 
+	/* Free the cpu_set allocated using CPU_ALLOC in main function */
+	CPU_FREE(cpu_set);
+
 	for (i = 0; i < num_cpus_to_pin; i++)
 		if (cpu_threads[i]) {
 			pthread_kill(cpu_threads[i], SIGUSR1);
@@ -589,6 +592,7 @@ int main(int argc, char *argv[])
 						cpu_set)) {
 					fprintf(stderr, "Any given CPU may "
 						"only be given once.\n");
+					CPU_FREE(cpu_set);
 					exit(1);
 				} else
 					CPU_SET_S(cpus_to_pin[cpu],
@@ -607,6 +611,7 @@ int main(int argc, char *argv[])
 				queue_path = malloc(strlen(option) + 2);
 				if (!queue_path) {
 					perror("malloc()");
+					CPU_FREE(cpu_set);
 					exit(1);
 				}
 				queue_path[0] = '/';
@@ -619,6 +624,7 @@ int main(int argc, char *argv[])
 	}
 
 	if (continuous_mode && num_cpus_to_pin == 0) {
+		CPU_FREE(cpu_set);
 		fprintf(stderr, "Must pass at least one CPU to continuous "
 			"mode.\n");
 		poptPrintUsage(popt_context, stderr, 0);
@@ -628,10 +634,12 @@ int main(int argc, char *argv[])
 		cpus_to_pin[0] = cpus_online - 1;
 	}
 
-	if (getuid() != 0)
+	if (getuid() != 0) {
+		CPU_FREE(cpu_set);
 		ksft_exit_skip("Not running as root, but almost all tests "
 			"require root in order to modify\nsystem settings.  "
 			"Exiting.\n");
+	}
 
 	max_msgs = fopen(MAX_MSGS, "r+");
 	max_msgsize = fopen(MAX_MSGSIZE, "r+");
-- 
2.35.1

