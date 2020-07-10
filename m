Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A9321C0F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 01:51:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3VFP2BzgzDrNn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 09:51:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3VCS3kLDzDrNj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 09:50:12 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ANXBQO116558; Fri, 10 Jul 2020 19:50:05 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326b8ysyuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 19:50:05 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ANilqB000948;
 Fri, 10 Jul 2020 23:50:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 326bcb07b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 23:50:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06ANnwP119202540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 23:49:58 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CCE76E04C;
 Fri, 10 Jul 2020 23:50:01 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867316E050;
 Fri, 10 Jul 2020 23:50:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.134.102])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jul 2020 23:50:00 +0000 (GMT)
Message-ID: <0315251705baff94f678c33178491b5008723511.camel@linux.ibm.com>
Subject: [PATCH V2 2/2] selftests/powerpc: Use proper error code to check
 fault address
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
Date: Fri, 10 Jul 2020 16:49:58 -0700
In-Reply-To: <019fd53e7538c6f8f332d175df74b1815ef5aa8c.camel@linux.ibm.com>
References: <019fd53e7538c6f8f332d175df74b1815ef5aa8c.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_14:2020-07-10,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=1
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007100155
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
Cc: tulioqm@br.ibm.com, linuxppc-dev@lists.ozlabs.org, abali@us.ibm.com,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


ERR_NX_TRANSLATION(CSB.CC=5) is for internal to VAS for fault handling
and should not used by OS. ERR_NX_AT_FAULT(CSB.CC=250) is the proper
error code should be reported by OS when NX encounters address
translation failure.

This patch uses CC=250 to determine the fault address when the request
is not successful.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 tools/testing/selftests/powerpc/nx-gzip/gunz_test.c  | 4 ++--
 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
index 6ee0fde..7c23d3d 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
@@ -698,13 +698,13 @@ int decompress_file(int argc, char **argv, void *devhandle)
 
 	switch (cc) {
 
-	case ERR_NX_TRANSLATION:
+	case ERR_NX_AT_FAULT:
 
 		/* We touched the pages ahead of time.  In the most common case
 		 * we shouldn't be here.  But may be some pages were paged out.
 		 * Kernel should have placed the faulting address to fsaddr.
 		 */
-		NXPRT(fprintf(stderr, "ERR_NX_TRANSLATION %p\n",
+		NXPRT(fprintf(stderr, "ERR_NX_AT_FAULT %p\n",
 			      (void *)cmdp->crb.csb.fsaddr));
 
 		if (pgfault_retries == NX_MAX_FAULTS) {
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
index 7496a83..02dffb6 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -306,13 +306,13 @@ int compress_file(int argc, char **argv, void *handle)
 			lzcounts, cmdp, handle);
 
 		if (cc != ERR_NX_OK && cc != ERR_NX_TPBC_GT_SPBC &&
-		    cc != ERR_NX_TRANSLATION) {
+		    cc != ERR_NX_AT_FAULT) {
 			fprintf(stderr, "nx error: cc= %d\n", cc);
 			exit(-1);
 		}
 
 		/* Page faults are handled by the user code */
-		if (cc == ERR_NX_TRANSLATION) {
+		if (cc == ERR_NX_AT_FAULT) {
 			NXPRT(fprintf(stderr, "page fault: cc= %d, ", cc));
 			NXPRT(fprintf(stderr, "try= %d, fsa= %08llx\n",
 				  fault_tries,
-- 
1.8.3.1


