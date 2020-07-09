Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AA219717
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:12:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2N6R3cBSzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MC05cvYzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:52 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06931loV024800; Wed, 8 Jul 2020 23:30:46 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kgxbca3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:46 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693FhFj021253;
 Thu, 9 Jul 2020 03:30:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 325k1qu5w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693Ujit55181810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B8B9B2066;
 Thu,  9 Jul 2020 03:30:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F446B2065;
 Thu,  9 Jul 2020 03:30:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 21/23] powerpc/selftest/ptrace-pkey: Update the test to
 mark an invalid pkey correctly
Date: Thu,  9 Jul 2020 08:59:44 +0530
Message-Id: <20200709032946.881753-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=2 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090019
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

