Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED921F8FE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ljgj68RFzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lh1F1WPBzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:16:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F62Im6151107; Mon, 15 Jun 2020 02:16:28 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n45c8jr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:16:28 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6F88l031827;
 Mon, 15 Jun 2020 06:16:27 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 31mpe89deg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:16:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6GOsA23855532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:16:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00215C605B;
 Mon, 15 Jun 2020 06:16:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A60CCC6057;
 Mon, 15 Jun 2020 06:16:23 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:16:23 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 37/41] powerpc/selftest/ptrave-pkey: Rename variables to
 make it easier to follow code
Date: Mon, 15 Jun 2020 11:44:26 +0530
Message-Id: <20200615061430.770174-38-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-12,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 clxscore=1015 cotscore=-2147483648 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename variable to indicate that they are invalid values which we will use to
test ptrace update of pkeys.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-pkey.c    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index bdbbbe8431e0..f9216c7a1829 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -44,7 +44,7 @@ struct shared_info {
 	unsigned long amr2;
 
 	/* AMR value that ptrace should refuse to write to the child. */
-	unsigned long amr3;
+	unsigned long invalid_amr;
 
 	/* IAMR value the parent expects to read from the child. */
 	unsigned long expected_iamr;
@@ -57,8 +57,8 @@ struct shared_info {
 	 * (even though they're valid ones) because userspace doesn't have
 	 * access to those registers.
 	 */
-	unsigned long new_iamr;
-	unsigned long new_uamor;
+	unsigned long invalid_iamr;
+	unsigned long invalid_uamor;
 };
 
 static int sys_pkey_alloc(unsigned long flags, unsigned long init_access_rights)
@@ -100,7 +100,7 @@ static int child(struct shared_info *info)
 
 	info->amr1 |= 3ul << pkeyshift(pkey1);
 	info->amr2 |= 3ul << pkeyshift(pkey2);
-	info->amr3 |= info->amr2 | 3ul << pkeyshift(pkey3);
+	info->invalid_amr |= info->amr2 | 3ul << pkeyshift(pkey3);
 
 	if (disable_execute)
 		info->expected_iamr |= 1ul << pkeyshift(pkey1);
@@ -111,8 +111,8 @@ static int child(struct shared_info *info)
 
 	info->expected_uamor |= 3ul << pkeyshift(pkey1) |
 				3ul << pkeyshift(pkey2);
-	info->new_iamr |= 1ul << pkeyshift(pkey1) | 1ul << pkeyshift(pkey2);
-	info->new_uamor |= 3ul << pkeyshift(pkey1);
+	info->invalid_iamr |= 1ul << pkeyshift(pkey1) | 1ul << pkeyshift(pkey2);
+	info->invalid_uamor |= 3ul << pkeyshift(pkey1);
 
 	/*
 	 * We won't use pkey3. We just want a plausible but invalid key to test
@@ -196,9 +196,9 @@ static int parent(struct shared_info *info, pid_t pid)
 	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync);
 	PARENT_FAIL_IF(ret, &info->child_sync);
 
-	info->amr1 = info->amr2 = info->amr3 = regs[0];
-	info->expected_iamr = info->new_iamr = regs[1];
-	info->expected_uamor = info->new_uamor = regs[2];
+	info->amr1 = info->amr2 = info->invalid_amr = regs[0];
+	info->expected_iamr = info->invalid_iamr = regs[1];
+	info->expected_uamor = info->invalid_uamor = regs[2];
 
 	/* Wake up child so that it can set itself up. */
 	ret = prod_child(&info->child_sync);
@@ -234,10 +234,10 @@ static int parent(struct shared_info *info, pid_t pid)
 		return ret;
 
 	/* Write invalid AMR value in child. */
-	ret = ptrace_write_regs(pid, NT_PPC_PKEY, &info->amr3, 1);
+	ret = ptrace_write_regs(pid, NT_PPC_PKEY, &info->invalid_amr, 1);
 	PARENT_FAIL_IF(ret, &info->child_sync);
 
-	printf("%-30s AMR: %016lx\n", ptrace_write_running, info->amr3);
+	printf("%-30s AMR: %016lx\n", ptrace_write_running, info->invalid_amr);
 
 	/* Wake up child so that it can verify it didn't change. */
 	ret = prod_child(&info->child_sync);
@@ -249,7 +249,7 @@ static int parent(struct shared_info *info, pid_t pid)
 
 	/* Try to write to IAMR. */
 	regs[0] = info->amr1;
-	regs[1] = info->new_iamr;
+	regs[1] = info->invalid_iamr;
 	ret = ptrace_write_regs(pid, NT_PPC_PKEY, regs, 2);
 	PARENT_FAIL_IF(!ret, &info->child_sync);
 
@@ -257,7 +257,7 @@ static int parent(struct shared_info *info, pid_t pid)
 	       ptrace_write_running, regs[0], regs[1]);
 
 	/* Try to write to IAMR and UAMOR. */
-	regs[2] = info->new_uamor;
+	regs[2] = info->invalid_uamor;
 	ret = ptrace_write_regs(pid, NT_PPC_PKEY, regs, 3);
 	PARENT_FAIL_IF(!ret, &info->child_sync);
 
-- 
2.26.2

