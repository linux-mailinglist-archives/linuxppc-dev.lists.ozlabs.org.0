Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55641597EF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 09:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7bWq11XLz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 17:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaTSo2oy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaTSo2oy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7bW31NDrz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 17:05:18 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I6pnsK015551;
	Thu, 18 Aug 2022 07:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HAURsoLLMO68sCPiE57Cr46JKxzEar+fGhZlLMEaVc8=;
 b=gaTSo2oyBGTqug07bo6sZhuaXzd2ftCCVeV1o8kKtnpzzulAJvxy965jNHqngB5mNZWo
 /TU/0WpMla39BvpMqbw6ROzLqfU+MQ4spZTJTqB6+WU1Fw9bd+40TQcChVvofPklkR0p
 CycwZVMOwOsApEqLGOwDL0EUuEiuKfXgCf60MQytrT6cmkFXfN3ADCnumIugyZnHTFUI
 7xM5AIErQnc/4n+tXnxxEtW/o1E1MZzbihpow/JoSKaZHsCqUVRtDiW4OeiXC7GFpMPh
 sIZSu7qPZC43HysGIMYKfS4wXvqIk07P2bnPVHlCS6264BDhrQ/OoVwVjzpcTFejf7BP /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1ghfrb6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 07:05:11 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27I6qB8F016252;
	Thu, 18 Aug 2022 07:05:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1ghfrb4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 07:05:11 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27I6oOTT004483;
	Thu, 18 Aug 2022 07:05:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8wfsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 07:05:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27I75Pe234406684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 07:05:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A3AFA4051;
	Thu, 18 Aug 2022 07:05:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC891A4055;
	Thu, 18 Aug 2022 07:05:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 07:05:05 +0000 (GMT)
Received: from [9.160.164.176] (unknown [9.160.164.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4B83860125;
	Thu, 18 Aug 2022 17:04:54 +1000 (AEST)
Message-ID: <daffd6e0-7dd7-8699-6136-fa63a15a7b47@linux.ibm.com>
Date: Thu, 18 Aug 2022 17:04:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v4 2/2] selftests/powerpc: Add a test for execute-only
 memory
Content-Language: en-US
To: Jordan Niethe <jniethe5@gmail.com>, Russell Currey <ruscur@russell.cc>,
        linuxppc-dev@lists.ozlabs.org
References: <20220817050640.406017-1-ruscur@russell.cc>
 <20220817050640.406017-2-ruscur@russell.cc>
 <faa82449f058e4d57372dc4e7b5ca2dc091cb454.camel@gmail.com>
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <faa82449f058e4d57372dc4e7b5ca2dc091cb454.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dZTywz-usbWXi4WV8-Ofi_Z26jnkhxjX
X-Proofpoint-ORIG-GUID: V1NmPDfDlueEDPhk-2tsp-r4uz57625X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180021
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
Cc: aneesh.kumar@linux.ibm.com, linux-hardening@vger.kernel.org, ajd@linux.ibm.com, npiggin@gmail.com, anshuman.khandual@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/8/2022 4:15 pm, Jordan Niethe wrote:
> On Wed, 2022-08-17 at 15:06 +1000, Russell Currey wrote:
>> From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>>
>> This selftest is designed to cover execute-only protections
>> on the Radix MMU but will also work with Hash.
>>
>> The tests are based on those found in pkey_exec_test with modifications
>> to use the generic mprotect() instead of the pkey variants.
> 
> Would it make sense to rename pkey_exec_test to exec_test and have this test be apart of that?
> 
I think might make it unnecessarily complex. The checks needed when 
testing with pkeys would mean that it would be necessary to check if 
pkeys are enabled and choose which set of tests to run depending on the 
result. The differences are substantial enough that it would be 
challenging to combine them into a single set of tests.

>>
>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> ---
>> v4: new
>>
>>   tools/testing/selftests/powerpc/mm/Makefile   |   3 +-
>>   .../testing/selftests/powerpc/mm/exec_prot.c  | 231 ++++++++++++++++++
>>   2 files changed, 233 insertions(+), 1 deletion(-)
>>   create mode 100644 tools/testing/selftests/powerpc/mm/exec_prot.c
>>
>> diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
>> index 27dc09d0bfee..19dd0b2ea397 100644
>> --- a/tools/testing/selftests/powerpc/mm/Makefile
>> +++ b/tools/testing/selftests/powerpc/mm/Makefile
>> @@ -3,7 +3,7 @@ noarg:
>>   	$(MAKE) -C ../
>>   
>>   TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
>> -		  large_vm_fork_separation bad_accesses pkey_exec_prot \
>> +		  large_vm_fork_separation bad_accesses exec_prot pkey_exec_prot \
>>   		  pkey_siginfo stack_expansion_signal stack_expansion_ldst \
>>   		  large_vm_gpr_corruption
>>   TEST_PROGS := stress_code_patching.sh
>> @@ -22,6 +22,7 @@ $(OUTPUT)/wild_bctr: CFLAGS += -m64
>>   $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
>>   $(OUTPUT)/large_vm_gpr_corruption: CFLAGS += -m64
>>   $(OUTPUT)/bad_accesses: CFLAGS += -m64
>> +$(OUTPUT)/exec_prot: CFLAGS += -m64
>>   $(OUTPUT)/pkey_exec_prot: CFLAGS += -m64
>>   $(OUTPUT)/pkey_siginfo: CFLAGS += -m64
>>   
>> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
>> new file mode 100644
>> index 000000000000..db75b2225de1
>> --- /dev/null
>> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
>> @@ -0,0 +1,231 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright 2022, Nicholas Miehlbradt, IBM Corporation
>> + * based on pkey_exec_prot.c
>> + *
>> + * Test if applying execute protection on pages works as expected.
>> + */
>> +
>> +#define _GNU_SOURCE
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <signal.h>
>> +
>> +#include <unistd.h>
>> +#include <sys/mman.h>
>> +
>> +#include "pkeys.h"
>> +
>> +
>> +#define PPC_INST_NOP	0x60000000
>> +#define PPC_INST_TRAP	0x7fe00008
>> +#define PPC_INST_BLR	0x4e800020
>> +
>> +static volatile sig_atomic_t fault_code;
>> +static volatile sig_atomic_t remaining_faults;
>> +static volatile unsigned int *fault_addr;
>> +static unsigned long pgsize, numinsns;
>> +static unsigned int *insns;
>> +static bool pkeys_supported;
>> +
>> +static bool is_fault_expected(int fault_code)
>> +{
>> +	if (fault_code == SEGV_ACCERR)
>> +		return true;
>> +
>> +	/* Assume any pkey error is fine since pkey_exec_prot test covers them */
>> +	if (fault_code == SEGV_PKUERR && pkeys_supported)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static void trap_handler(int signum, siginfo_t *sinfo, void *ctx)
>> +{
>> +	/* Check if this fault originated from the expected address */
>> +	if (sinfo->si_addr != (void *)fault_addr)
>> +		sigsafe_err("got a fault for an unexpected address\n");
>> +
>> +	_exit(1);
>> +}
>> +
>> +static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
>> +{
>> +	fault_code = sinfo->si_code;
>> +
>> +	/* Check if this fault originated from the expected address */
>> +	if (sinfo->si_addr != (void *)fault_addr) {
>> +		sigsafe_err("got a fault for an unexpected address\n");
>> +		_exit(1);
>> +	}
>> +
>> +	/* Check if too many faults have occurred for a single test case */
>> +	if (!remaining_faults) {
>> +		sigsafe_err("got too many faults for the same address\n");
>> +		_exit(1);
>> +	}
>> +
>> +
>> +	/* Restore permissions in order to continue */
>> +	if (is_fault_expected(fault_code)) {
>> +		if (mprotect(insns, pgsize, PROT_READ | PROT_WRITE | PROT_EXEC)) {
>> +			sigsafe_err("failed to set access permissions\n");
>> +			_exit(1);
>> +		}
>> +	} else {
>> +		sigsafe_err("got a fault with an unexpected code\n");
>> +		_exit(1);
>> +	}
>> +
>> +	remaining_faults--;
>> +}
>> +
>> +static int check_exec_fault(int rights)
>> +{
>> +	/*
>> +	 * Jump to the executable region.
>> +	 *
>> +	 * The first iteration also checks if the overwrite of the
>> +	 * first instruction word from a trap to a no-op succeeded.
>> +	 */
>> +	fault_code = -1;
>> +	remaining_faults = 0;
>> +	if (!(rights & PROT_EXEC))
>> +		remaining_faults = 1;
>> +
>> +	FAIL_IF(mprotect(insns, pgsize, rights) != 0);
>> +	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
>> +
>> +	FAIL_IF(remaining_faults != 0);
>> +	if (!(rights & PROT_EXEC))
>> +		FAIL_IF(!is_fault_expected(fault_code));
>> +
>> +	return 0;
>> +}
>> +
>> +static int test(void)
>> +{
>> +	struct sigaction segv_act, trap_act;
>> +	int i;
>> +
>> +	/* Skip the test if the CPU doesn't support Radix */
>> +	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
>> +
>> +	/* Check if pkeys are supported */
>> +	pkeys_supported = pkeys_unsupported() == 0;
>> +
>> +	/* Setup SIGSEGV handler */
>> +	segv_act.sa_handler = 0;
>> +	segv_act.sa_sigaction = segv_handler;
>> +	FAIL_IF(sigprocmask(SIG_SETMASK, 0, &segv_act.sa_mask) != 0);
>> +	segv_act.sa_flags = SA_SIGINFO;
>> +	segv_act.sa_restorer = 0;
>> +	FAIL_IF(sigaction(SIGSEGV, &segv_act, NULL) != 0);
>> +
>> +	/* Setup SIGTRAP handler */
>> +	trap_act.sa_handler = 0;
>> +	trap_act.sa_sigaction = trap_handler;
>> +	FAIL_IF(sigprocmask(SIG_SETMASK, 0, &trap_act.sa_mask) != 0);
>> +	trap_act.sa_flags = SA_SIGINFO;
>> +	trap_act.sa_restorer = 0;
>> +	FAIL_IF(sigaction(SIGTRAP, &trap_act, NULL) != 0);
>> +
>> +	/* Setup executable region */
>> +	pgsize = getpagesize();
>> +	numinsns = pgsize / sizeof(unsigned int);
>> +	insns = (unsigned int *)mmap(NULL, pgsize, PROT_READ | PROT_WRITE,
>> +				      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> +	FAIL_IF(insns == MAP_FAILED);
>> +
>> +	/* Write the instruction words */
>> +	for (i = 1; i < numinsns - 1; i++)
>> +		insns[i] = PPC_INST_NOP;
>> +
>> +	/*
>> +	 * Set the first instruction as an unconditional trap. If
>> +	 * the last write to this address succeeds, this should
>> +	 * get overwritten by a no-op.
>> +	 */
>> +	insns[0] = PPC_INST_TRAP;
>> +
>> +	/*
>> +	 * Later, to jump to the executable region, we use a branch
>> +	 * and link instruction (bctrl) which sets the return address
>> +	 * automatically in LR. Use that to return back.
>> +	 */
>> +	insns[numinsns - 1] = PPC_INST_BLR;
>> +
>> +	/*
>> +	 * Pick the first instruction's address from the executable
>> +	 * region.
>> +	 */
>> +	fault_addr = insns;
>> +
>> +	/*
>> +	 * Read an instruction word from the address when the page
>> +	 * is execute only. This should generate an access fault.
>> +	 */
>> +	fault_code = -1;
>> +	remaining_faults = 1;
>> +	printf("Testing read on --x, should fault...");
>> +	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
>> +	i = *fault_addr;
>> +	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
>> +	printf("ok!\n");
>> +
>> +	/*
>> +	 * Write an instruction word to the address when the page
>> +	 * execute only. This should also generate an access fault.
>> +	 */
>> +	fault_code = -1;
>> +	remaining_faults = 1;
>> +	printf("Testing write on --x, should fault...");
>> +	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
>> +	*fault_addr = PPC_INST_NOP;
>> +	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on ---, should fault...");
>> +	FAIL_IF(check_exec_fault(PROT_NONE));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on r--, should fault...");
>> +	FAIL_IF(check_exec_fault(PROT_READ));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on -w-, should fault...");
>> +	FAIL_IF(check_exec_fault(PROT_WRITE));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on rw-, should fault...");
>> +	FAIL_IF(check_exec_fault(PROT_READ | PROT_WRITE));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on --x, should succeed...");
>> +	FAIL_IF(check_exec_fault(PROT_EXEC));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on r-x, should succeed...");
>> +	FAIL_IF(check_exec_fault(PROT_READ | PROT_EXEC));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on -wx, should succeed...");
>> +	FAIL_IF(check_exec_fault(PROT_WRITE | PROT_EXEC));
>> +	printf("ok!\n");
>> +
>> +	printf("Testing exec on rwx, should succeed...");
>> +	FAIL_IF(check_exec_fault(PROT_READ | PROT_WRITE | PROT_EXEC));
>> +	printf("ok!\n");
>> +
>> +	/* Cleanup */
>> +	FAIL_IF(munmap((void *)insns, pgsize));
>> +
>> +	return 0;
>> +}
>> +
>> +int main(void)
>> +{
>> +	return test_harness(test, "exec_prot");
>> +}
> 
