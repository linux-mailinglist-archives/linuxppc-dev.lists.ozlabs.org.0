Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F01F52FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:20:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hl054QVPzDq9j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:20:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj5d0LvzzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:55:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9Y0eN013201; Wed, 10 Jun 2020 05:54:56 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31j6sfgs1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:54:56 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9fB78029479;
 Wed, 10 Jun 2020 09:54:56 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 31hw1bnyxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:54:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9rtEl48038162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:53:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DAC2112065;
 Wed, 10 Jun 2020 09:53:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4658F112061;
 Wed, 10 Jun 2020 09:53:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:53:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 38/41] powerpc/selftest/ptrace-pkey: Update the test to
 mark an invalid pkey correctly
Date: Wed, 10 Jun 2020 15:22:01 +0530
Message-Id: <20200610095204.608183-39-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_06:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 cotscore=-2147483648 mlxlogscore=999
 suspectscore=2 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100073
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

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-pkey.c    | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index f9216c7a1829..bc33d748d95b 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -66,11 +66,6 @@ static int sys_pkey_alloc(unsigned long flags, unsigned long init_access_rights)
 	return syscall(__NR_pkey_alloc, flags, init_access_rights);
 }
 
-static int sys_pkey_free(int pkey)
-{
-	return syscall(__NR_pkey_free, pkey);
-}
-
 static int child(struct shared_info *info)
 {
 	unsigned long reg;
@@ -100,7 +95,11 @@ static int child(struct shared_info *info)
 
 	info->amr1 |= 3ul << pkeyshift(pkey1);
 	info->amr2 |= 3ul << pkeyshift(pkey2);
-	info->invalid_amr |= info->amr2 | 3ul << pkeyshift(pkey3);
+	/*
+	 * invalid amr value where we try to force write
+	 * things which are deined by a uamor setting.
+	 */
+	info->invalid_amr = info->amr2 | (~0x0UL & ~info->expected_uamor);
 
 	if (disable_execute)
 		info->expected_iamr |= 1ul << pkeyshift(pkey1);
@@ -111,17 +110,12 @@ static int child(struct shared_info *info)
 
 	info->expected_uamor |= 3ul << pkeyshift(pkey1) |
 				3ul << pkeyshift(pkey2);
-	info->invalid_iamr |= 1ul << pkeyshift(pkey1) | 1ul << pkeyshift(pkey2);
-	info->invalid_uamor |= 3ul << pkeyshift(pkey1);
-
 	/*
-	 * We won't use pkey3. We just want a plausible but invalid key to test
-	 * whether ptrace will let us write to AMR bits we are not supposed to.
-	 *
-	 * This also tests whether the kernel restores the UAMOR permissions
-	 * after a key is freed.
+	 * Create an IAMR value different from expected value.
+	 * Kernel will reject an IAMR and UAMOR change.
 	 */
-	sys_pkey_free(pkey3);
+	info->invalid_iamr = info->expected_iamr | (1ul << pkeyshift(pkey1) | 1ul << pkeyshift(pkey2));
+	info->invalid_uamor = info->expected_uamor & ~(0x3ul << pkeyshift(pkey1));
 
 	printf("%-30s AMR: %016lx pkey1: %d pkey2: %d pkey3: %d\n",
 	       user_write, info->amr1, pkey1, pkey2, pkey3);
@@ -196,9 +190,9 @@ static int parent(struct shared_info *info, pid_t pid)
 	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync);
 	PARENT_FAIL_IF(ret, &info->child_sync);
 
-	info->amr1 = info->amr2 = info->invalid_amr = regs[0];
-	info->expected_iamr = info->invalid_iamr = regs[1];
-	info->expected_uamor = info->invalid_uamor = regs[2];
+	info->amr1 = info->amr2 = regs[0];
+	info->expected_iamr = regs[1];
+	info->expected_uamor = regs[2];
 
 	/* Wake up child so that it can set itself up. */
 	ret = prod_child(&info->child_sync);
-- 
2.26.2

