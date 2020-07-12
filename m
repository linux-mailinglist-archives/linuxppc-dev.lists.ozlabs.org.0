Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641521C967
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jul 2020 15:23:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4SBq0F2ZzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jul 2020 23:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4S8d55mpzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jul 2020 23:21:05 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06CD24Hh057911; Sun, 12 Jul 2020 09:20:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32771w3vrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Jul 2020 09:20:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06CDK1Cf020457;
 Sun, 12 Jul 2020 13:20:55 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 327528kmmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Jul 2020 13:20:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06CDKpit23462352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Jul 2020 13:20:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 330796A051;
 Sun, 12 Jul 2020 13:20:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11D916A047;
 Sun, 12 Jul 2020 13:20:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.221.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 12 Jul 2020 13:20:51 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/pkeys: Fix pkey_access_permitted w.r.t
 execute disable pkey
Date: Sun, 12 Jul 2020 18:50:47 +0530
Message-Id: <20200712132047.1038594-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-12_04:2020-07-10,
 2020-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=358 impostorscore=0 malwarescore=0 suspectscore=2 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007120100
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
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even if the IAMR value deny the execute access, current kernel return true
w.r.t pkey_access_permitted() for execute permission check if the AMR
read pkey bit is cleared.

This results in repeated page fault loop with a test like below.

 #define _GNU_SOURCE
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
 #include <inttypes.h>

 #include <assert.h>
 #include <malloc.h>
 #include <unistd.h>
 #include <pthread.h>
 #include <sys/mman.h>

 #ifdef SYS_pkey_mprotect
 #undef SYS_pkey_mprotect
 #endif

 #ifdef SYS_pkey_alloc
 #undef SYS_pkey_alloc
 #endif

 #ifdef SYS_pkey_free
 #undef SYS_pkey_free
 #endif

 #undef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4

 #define SYS_pkey_mprotect	386
 #define SYS_pkey_alloc		384
 #define SYS_pkey_free		385

 #define PPC_INST_NOP		0x60000000
 #define PPC_INST_BLR		0x4e800020
 #define PROT_RWX		(PROT_READ | PROT_WRITE | PROT_EXEC)

static int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
{
	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
}

static int sys_pkey_alloc(unsigned long flags, unsigned long access_rights)
{
	return syscall(SYS_pkey_alloc, flags, access_rights);
}

static int sys_pkey_free(int pkey)
{
	return syscall(SYS_pkey_free, pkey);
}

static void do_execute(void *region)
{
	/* jump to region */
	asm volatile(
		"mtctr	%0;"
		"bctrl"
		: : "r"(region) : "ctr", "lr");
}

static void do_protect(void *region)
{
	size_t pgsize;
	int i, pkey;

	pgsize = getpagesize();

	pkey = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
	assert (pkey > 0);

	/* perform mprotect */
	assert(!sys_pkey_mprotect(region, pgsize, PROT_RWX, pkey));
	do_execute(region);

	/* free pkey */
	assert(!sys_pkey_free(pkey));

}

int main(int argc, char **argv)
{
	size_t pgsize, numinsns;
	unsigned int *region;
	int i;

	/* allocate memory region to protect */
	pgsize = getpagesize();
	region = memalign(pgsize, pgsize);
	assert(region != NULL);
	assert(!mprotect(region, pgsize, PROT_RWX));

	/* fill page with NOPs with a BLR at the end */
	numinsns = pgsize / sizeof(region[0]);
	for (i = 0; i < numinsns - 1; i++)
		region[i] = PPC_INST_NOP;
	region[i] = PPC_INST_BLR;

	do_protect(region);

	return EXIT_SUCCESS;
}

Fixes: f2407ef3ba22 ("powerpc: helper to validate key-access permissions of a pte")

Reported-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index ca5fcb4bff32..d174106bab67 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -354,12 +354,14 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 	u64 amr;
 
 	pkey_shift = pkeyshift(pkey);
-	if (execute && !(read_iamr() & (IAMR_EX_BIT << pkey_shift)))
-		return true;
+	if (execute)
+		return !(read_iamr() & (IAMR_EX_BIT << pkey_shift));
+
+	amr = read_amr();
+	if (write)
+		return !(amr & (AMR_WR_BIT << pkey_shift));
 
-	amr = read_amr(); /* Delay reading amr until absolutely needed */
-	return ((!write && !(amr & (AMR_RD_BIT << pkey_shift))) ||
-		(write &&  !(amr & (AMR_WR_BIT << pkey_shift))));
+	return !(amr & (AMR_RD_BIT << pkey_shift));
 }
 
 bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
-- 
2.26.2

