Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261161C4F0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GWZ30HcBzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWJw3JhQzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:17:52 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0457EuOg193034; Tue, 5 May 2020 03:17:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s317m8rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:46 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0457Hj9I196100;
 Tue, 5 May 2020 03:17:45 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s317m8rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FHut017692;
 Tue, 5 May 2020 07:17:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 30s0g66tph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:17:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457HhGE26870244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:17:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1850BE056;
 Tue,  5 May 2020 07:17:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FD2BBE051;
 Tue,  5 May 2020 07:17:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:17:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 02/22] powerpc/pkeys: Check vma before returning key fault
 error to the user
Date: Tue,  5 May 2020 12:47:09 +0530
Message-Id: <20200505071729.54912-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=2 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ram Pai <linuxram@linux.ibm.com>, Sandipan Das <sandipan@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If multiple threads in userspace keep changing the protection keys
mapping a range, there can be a scenario where kernel takes a key fault
but the pkey value found in the siginfo struct is a permissive one.

This can confuse the userspace as shown in the below test case.

/* use this to control the number of test iterations */

static void pkeyreg_set(int pkey, unsigned long rights)
{
	unsigned long reg, shift;

	shift = (NR_PKEYS - pkey - 1) * PKEY_BITS_PER_PKEY;
	asm volatile("mfspr	%0, 0xd" : "=r"(reg));
	reg &= ~(((unsigned long) PKEY_BITS_MASK) << shift);
	reg |= (rights & PKEY_BITS_MASK) << shift;
	asm volatile("mtspr	0xd, %0" : : "r"(reg));
}

static unsigned long pkeyreg_get(void)
{
	unsigned long reg;

	asm volatile("mfspr	%0, 0xd" : "=r"(reg));
	return reg;
}

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

static int faulting_pkey;
static int permissive_pkey;
static pthread_barrier_t pkey_set_barrier;
static pthread_barrier_t mprotect_barrier;

static void pkey_handle_fault(int signum, siginfo_t *sinfo, void *ctx)
{
	unsigned long pkeyreg;

	/* FIXME: printf is not signal-safe but for the current purpose,
	          it gets the job done. */
	printf("pkey: exp = %d, got = %d\n", faulting_pkey, sinfo->si_pkey);
	fflush(stdout);

	assert(sinfo->si_code == SEGV_PKUERR);
	assert(sinfo->si_pkey == faulting_pkey);

	/* clear pkey permissions to let the faulting instruction continue */
	pkeyreg_set(faulting_pkey, 0x0);
}

static void *do_mprotect_fault(void *p)
{
	unsigned long rights, pkeyreg, pgsize;
	unsigned int i;
	void *region;
	int pkey;

	srand(time(NULL));
	pgsize = sysconf(_SC_PAGESIZE);
	rights = PKEY_DISABLE_WRITE;
	region = p;

	/* allocate key, no permissions */
	assert((pkey = sys_pkey_alloc(0, PKEY_DISABLE_ACCESS)) > 0);
	pkeyreg_set(4, 0x0);

	/* cache the pkey here as the faulting pkey for future reference
	   in the signal handler */
	faulting_pkey = pkey;
	printf("%s: faulting pkey = %d\n", __func__, faulting_pkey);

	/* try to allocate, mprotect and free pkeys repeatedly */
	for (i = 0; i < NUM_ITERATIONS; i++) {
		/* sync up with the other thread here */
		pthread_barrier_wait(&pkey_set_barrier);

		/* make sure that the pkey used by the non-faulting thread
		   is made permissive for this thread's context too so that
		   no faults are triggered because it still might have been
		   set to a restrictive value */
//		pkeyreg_set(permissive_pkey, 0x0);

		/* sync up with the other thread here */
		pthread_barrier_wait(&mprotect_barrier);

		/* perform mprotect */
		assert(!sys_pkey_mprotect(region, pgsize, PROT_READ | PROT_WRITE, pkey));

		/* choose a random byte from the protected region and
		   attempt to write to it, this will generate a fault */
		*((char *) region + (rand() % pgsize)) = rand();

		/* restore pkey permissions as the signal handler may have
		   cleared the bit out for the sake of continuing */
		pkeyreg_set(pkey, PKEY_DISABLE_WRITE);
	}

	/* free pkey */
	sys_pkey_free(pkey);

	return NULL;
}

static void *do_mprotect_nofault(void *p)
{
	unsigned long pgsize;
	unsigned int i, j;
	void *region;
	int pkey;

	pgsize = sysconf(_SC_PAGESIZE);
	region = p;

	/* try to allocate, mprotect and free pkeys repeatedly */
	for (i = 0; i < NUM_ITERATIONS; i++) {
		/* allocate pkey, all permissions */
		assert((pkey = sys_pkey_alloc(0, 0)) > 0);
		permissive_pkey = pkey;

		/* sync up with the other thread here */
		pthread_barrier_wait(&pkey_set_barrier);
		pthread_barrier_wait(&mprotect_barrier);

		/* perform mprotect on the common page, no faults will
		   be triggered as this is most permissive */
		assert(!sys_pkey_mprotect(region, pgsize, PROT_READ | PROT_WRITE, pkey));

		/* free pkey */
		assert(!sys_pkey_free(pkey));
	}

	return NULL;
}

int main(int argc, char **argv)
{
	pthread_t fault_thread, nofault_thread;
	unsigned long pgsize;
	struct sigaction act;
	pthread_attr_t attr;
	cpu_set_t fault_cpuset, nofault_cpuset;
	unsigned int i;
	void *region;

	/* allocate memory region to protect */
	pgsize = sysconf(_SC_PAGESIZE);
	assert(region = memalign(pgsize, pgsize));

	CPU_ZERO(&fault_cpuset);
	CPU_SET(0, &fault_cpuset);
	CPU_ZERO(&nofault_cpuset);
	CPU_SET(8, &nofault_cpuset);
	assert(!pthread_attr_init(&attr));

	/* setup sigsegv signal handler */
	act.sa_handler = 0;
	act.sa_sigaction = pkey_handle_fault;
	assert(!sigprocmask(SIG_SETMASK, 0, &act.sa_mask));
	act.sa_flags = SA_SIGINFO;
	act.sa_restorer = 0;
	assert(!sigaction(SIGSEGV, &act, NULL));

	/* setup barrier for the two threads */
	pthread_barrier_init(&pkey_set_barrier, NULL, 2);
	pthread_barrier_init(&mprotect_barrier, NULL, 2);

	/* setup and start threads */
	assert(!pthread_create(&fault_thread, &attr, &do_mprotect_fault, region));
	assert(!pthread_setaffinity_np(fault_thread, sizeof(cpu_set_t), &fault_cpuset));
	assert(!pthread_create(&nofault_thread, &attr, &do_mprotect_nofault, region));
	assert(!pthread_setaffinity_np(nofault_thread, sizeof(cpu_set_t), &nofault_cpuset));

	/* cleanup */
	assert(!pthread_attr_destroy(&attr));
	assert(!pthread_join(fault_thread, NULL));
	assert(!pthread_join(nofault_thread, NULL));
	assert(!pthread_barrier_destroy(&pkey_set_barrier));
	assert(!pthread_barrier_destroy(&mprotect_barrier));
	free(region);

	puts("PASS");

	return EXIT_SUCCESS;
}

The above test can result the below failure without this patch.

pkey: exp = 3, got = 3
pkey: exp = 3, got = 4
a.out: pkey-siginfo-race.c:100: pkey_handle_fault: Assertion `sinfo->si_pkey == faulting_pkey' failed.
Aborted

Check for vma access before considering this a key fault. If vma pkey allow
access retry the acess again.

Test case is written by Sandipan Das <sandipan@linux.ibm.com> hence added SOB
from him.

Cc: Ram Pai <linuxram@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/fault.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8e529e4708e1..44457bae77a0 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -319,14 +319,6 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
 			      struct vm_area_struct *vma)
 {
-	/*
-	 * Read or write was blocked by protection keys.  This is
-	 * always an unconditional error and can never result in
-	 * a follow-up action to resolve the fault, like a COW.
-	 */
-	if (is_pkey)
-		return true;
-
 	/*
 	 * Make sure to check the VMA so that we do not perform
 	 * faults just to hit a pkey fault as soon as we fill in a
-- 
2.26.2

