Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18114128D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 22:01:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ztlz6ZVTzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 08:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ztjq4d1TzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 07:59:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HKv6wU104143; Fri, 17 Jan 2020 15:59:57 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qrtcum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 15:59:57 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00HKqTZQ013402;
 Fri, 17 Jan 2020 20:59:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 2xjvwp58n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 20:59:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HKxs7O61342028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 20:59:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDA18C6057;
 Fri, 17 Jan 2020 20:59:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 263E8C6055;
 Fri, 17 Jan 2020 20:59:53 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.80.203.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 20:59:52 +0000 (GMT)
Subject: Re: [PATCH 2/3] selftests/powerpc: Add tm-signal-pagefault test
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200116220531.4715-1-gustavold@linux.ibm.com>
 <20200116220531.4715-2-gustavold@linux.ibm.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <c16fb0a1-7a64-750b-90c2-d1ee283a75c1@linux.vnet.ibm.com>
Date: Fri, 17 Jan 2020 17:59:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200116220531.4715-2-gustavold@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001170161
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
Cc: mikey@neuling.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gustavo,

Nice catch on using userfaultfd() to make it deterministic.

On 01/16/2020 07:05 PM, Gustavo Luiz Duarte wrote:
> This test triggers a TM Bad Thing by raising a signal in transactional state
> and forcing a pagefault to happen in kernelspace when the kernel signal
> handling code first touches the user signal stack.
> 
> This is inspired by the test tm-signal-context-force-tm but uses userfaultfd to
> make the test deterministic. While this test always triggers the bug in one
> run, I had to execute tm-signal-context-force-tm several times (the test runs
> 5000 times each execution) to trigger the same bug.
> 
> tm-signal-context-force-tm is kept instead of replaced because, while this test
> is more reliable and triggers the same bug, tm-signal-context-force-tm has a
> better coverage, in the sense that by running the test several times it might
> trigger the pagefault and/or be preempted at different places.
> 
> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
> ---
>   tools/testing/selftests/powerpc/tm/.gitignore |   1 +
>   tools/testing/selftests/powerpc/tm/Makefile   |   3 +-
>   .../powerpc/tm/tm-signal-pagefault.c          | 272 ++++++++++++++++++
>   3 files changed, 275 insertions(+), 1 deletion(-)
>   create mode 100644 tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
> 
> diff --git a/tools/testing/selftests/powerpc/tm/.gitignore b/tools/testing/selftests/powerpc/tm/.gitignore
> index 98f2708d86cc..e1c72a4a3e91 100644
> --- a/tools/testing/selftests/powerpc/tm/.gitignore
> +++ b/tools/testing/selftests/powerpc/tm/.gitignore
> @@ -13,6 +13,7 @@ tm-signal-context-chk-vmx
>   tm-signal-context-chk-vsx
>   tm-signal-context-force-tm
>   tm-signal-sigreturn-nt
> +tm-signal-pagefault
>   tm-vmx-unavail
>   tm-unavailable
>   tm-trap
> diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
> index b15a1a325bd0..b1d99736f8b8 100644
> --- a/tools/testing/selftests/powerpc/tm/Makefile
> +++ b/tools/testing/selftests/powerpc/tm/Makefile
> @@ -5,7 +5,7 @@ SIGNAL_CONTEXT_CHK_TESTS := tm-signal-context-chk-gpr tm-signal-context-chk-fpu
>   TEST_GEN_PROGS := tm-resched-dscr tm-syscall tm-signal-msr-resv tm-signal-stack \
>   	tm-vmxcopy tm-fork tm-tar tm-tmspr tm-vmx-unavail tm-unavailable tm-trap \
>   	$(SIGNAL_CONTEXT_CHK_TESTS) tm-sigreturn tm-signal-sigreturn-nt \
> -	tm-signal-context-force-tm tm-poison
> +	tm-signal-context-force-tm tm-poison tm-signal-pagefault
>   
>   top_srcdir = ../../../../..
>   include ../../lib.mk
> @@ -22,6 +22,7 @@ $(OUTPUT)/tm-resched-dscr: ../pmu/lib.c
>   $(OUTPUT)/tm-unavailable: CFLAGS += -O0 -pthread -m64 -Wno-error=uninitialized -mvsx
>   $(OUTPUT)/tm-trap: CFLAGS += -O0 -pthread -m64
>   $(OUTPUT)/tm-signal-context-force-tm: CFLAGS += -pthread -m64
> +$(OUTPUT)/tm-signal-pagefault: CFLAGS += -pthread -m64
>   
>   SIGNAL_CONTEXT_CHK_TESTS := $(patsubst %,$(OUTPUT)/%,$(SIGNAL_CONTEXT_CHK_TESTS))
>   $(SIGNAL_CONTEXT_CHK_TESTS): tm-signal.S
> diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c b/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
> new file mode 100644
> index 000000000000..3a2166101d94
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2020, Gustavo Luiz Duarte, IBM Corp.
> + *
> + * This test starts a transaction and triggers a signal, forcing a pagefault to
> + * happen when the kernel signal handling code touches the user signal stack.
> + *
> + * In order to avoid pre-faulting the signal stack memory and to force the
> + * pagefault to happen precisely in the kernel signal handling code, the
> + * pagefault handling is done in userspace using the userfaultfd facility.
> + *
> + * Further pagefaults are triggered by crafting the signal handler's ucontext
> + * to point to additional memory regions managed by the userfaultfd, so using
> + * the same mechanism used to avoid pre-faulting the signal stack memory.
> + *
> + * On failure (bug is present) kernel crashes or never returns control back to
> + * userspace. If bug is not present, tests completes almost immediately.
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <linux/userfaultfd.h>
> +#include <poll.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <sys/syscall.h>
> +#include <fcntl.h>
> +#include <sys/mman.h>
> +#include <pthread.h>
> +#include <signal.h>
> +
> +#include "tm.h"
> +
> +
> +#define UF_MEM_SIZE 655360	/* 10 x 64k pages */
> +
> +/* Memory handled by userfaultfd */
> +static char *uf_mem;
> +static size_t uf_mem_offset = 0;
> +
> +/*
> + * Data that will be copied into the faulting pages (instead of zero-filled
> + * pages). This is used to make the test more reliable and avoid segfaulting
> + * when we return from the signal handler. Since we are making the signal
> + * handler's ucontext point to newly allocated memory, when that memory is
> + * paged-in it will contain the expected content.
> + */
> +static char backing_mem[UF_MEM_SIZE];
> +
> +static size_t pagesize;
> +
> +/*
> + * Return a chunk of at least 'size' bytes of memory that will be handled by
> + * userfaultfd. If 'backing_data' is not NULL, its content will be save to
> + * 'backing_mem' and then copied into the faulting pages when the page fault
> + * is handled.
> + */
> +void *get_uf_mem(size_t size, void *backing_data)
> +{
> +	void *ret;
> +
> +	if (uf_mem_offset + size > UF_MEM_SIZE) {
> +		fprintf(stderr, "Requesting more uf_mem than expected!\n");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	ret = &uf_mem[uf_mem_offset];
> +
> +	/* Save the data that will be copied into the faulting page */
> +	if (backing_data != NULL)
> +		memcpy(&backing_mem[uf_mem_offset], backing_data, size);
> +
> +	/* Reserve the requested amount of uf_mem */
> +	uf_mem_offset += size;
> +	/* Keep uf_mem_offset aligned to the page size (round up) */
> +	uf_mem_offset = (uf_mem_offset + pagesize - 1) & ~(pagesize - 1);
> +
> +	return ret;
> +}
> +
> +void *fault_handler_thread(void *arg)
> +{
> +	struct uffd_msg msg;	/* Data read from userfaultfd */
> +	long uffd;		/* userfaultfd file descriptor */
> +	struct uffdio_copy uffdio_copy;
> +	struct pollfd pollfd;
> +	ssize_t nread, offset;
> +
> +	uffd = (long) arg;
> +
> +	for (;;) {
> +		pollfd.fd = uffd;
> +		pollfd.events = POLLIN;
> +		if (poll(&pollfd, 1, -1) == -1) {
> +			perror("poll() failed");
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		nread = read(uffd, &msg, sizeof(msg));
> +		if (nread == 0) {
> +			fprintf(stderr, "read(): EOF on userfaultfd\n");
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		if (nread == -1) {
> +			perror("read() failed");
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		/* We expect only one kind of event */
> +		if (msg.event != UFFD_EVENT_PAGEFAULT) {
> +			fprintf(stderr, "Unexpected event on userfaultfd\n");
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		/*
> +		 * We need to handle page faults in units of pages(!).
> +		 * So, round faulting address down to page boundary.
> +		 */
> +		uffdio_copy.dst = msg.arg.pagefault.address & ~(pagesize-1);
> +
> +		offset = (char *) uffdio_copy.dst - uf_mem;
> +		uffdio_copy.src = (unsigned long) &backing_mem[offset];
> +
> +		uffdio_copy.len = pagesize;
> +		uffdio_copy.mode = 0;
> +		uffdio_copy.copy = 0;
> +		if (ioctl(uffd, UFFDIO_COPY, &uffdio_copy) == -1) {
> +			perror("ioctl-UFFDIO_COPY failed");
> +			exit(EXIT_FAILURE);
> +		}
> +	}
> +}
> +
> +void setup_uf_mem(void)
> +{
> +	long uffd;		/* userfaultfd file descriptor */
> +	pthread_t thr;
> +	struct uffdio_api uffdio_api;
> +	struct uffdio_register uffdio_register;
> +	int ret;
> +
> +	pagesize = sysconf(_SC_PAGE_SIZE);
> +
> +	/* Create and enable userfaultfd object */
> +	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> +	if (uffd == -1) {
> +		perror("userfaultfd() failed");
> +		exit(EXIT_FAILURE);
> +	}
> +	uffdio_api.api = UFFD_API;
> +	uffdio_api.features = 0;
> +	if (ioctl(uffd, UFFDIO_API, &uffdio_api) == -1) {
> +		perror("ioctl-UFFDIO_API failed");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	/*
> +	 * Create a private anonymous mapping. The memory will be demand-zero
> +	 * paged, that is, not yet allocated. When we actually touch the memory
> +	 * the related page will be allocated via the userfaultfd mechanism.
> +	 */
> +	uf_mem = mmap(NULL, UF_MEM_SIZE, PROT_READ | PROT_WRITE,
> +		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	if (uf_mem == MAP_FAILED) {
> +		perror("mmap() failed");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	/*
> +	 * Register the memory range of the mapping we've just mapped to be
> +	 * handled by the userfaultfd object. In 'mode' we request to track
> +	 * missing pages (i.e. pages that have not yet been faulted-in).
> +	 */
> +	uffdio_register.range.start = (unsigned long) uf_mem;
> +	uffdio_register.range.len = UF_MEM_SIZE;
> +	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
> +	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) == -1) {
> +		perror("ioctl-UFFDIO_REGISTER");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	/* Create a thread that will process the userfaultfd events */
> +	ret = pthread_create(&thr, NULL, fault_handler_thread, (void *) uffd);
> +	if (ret != 0) {
> +		fprintf(stderr, "pthread_create(): Error. Returned %d\n", ret);
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +/*
> + * Assumption: the signal was delivered while userspace was in transactional or
> + * suspended state, i.e. uc->uc_link != NULL.
> + */
> +void signal_handler(int signo, siginfo_t *si, void *uc)
> +{
> +	ucontext_t *ucp = uc;
> +
> +	/* Skip 'trap' after returning, otherwise we get a SIGTRAP again */
> +	ucp->uc_link->uc_mcontext.regs->nip += 4;
> +
> +	ucp->uc_mcontext.v_regs =
> +		get_uf_mem(sizeof(elf_vrreg_t), ucp->uc_mcontext.v_regs);
> +
> +	ucp->uc_link->uc_mcontext.v_regs =
> +		get_uf_mem(sizeof(elf_vrreg_t), ucp->uc_link->uc_mcontext.v_regs);
> +
> +	ucp->uc_link = get_uf_mem(sizeof(ucontext_t), ucp->uc_link);
> +}
> +
> +int tm_signal_pagefault(void)
> +{
> +	struct sigaction sa;
> +	stack_t ss;
> +
> +	SKIP_IF(!have_htm());
> +
> +	setup_uf_mem();
> +
> +	/*
> +	 * Set an alternative stack that will generate a page fault when the
> +	 * signal is raised. The page fault will be treated via userfaultfd,
> +	 * i.e. via fault_handler_thread.
> +	 */
> +	ss.ss_sp = get_uf_mem(SIGSTKSZ, NULL);
> +	ss.ss_size = SIGSTKSZ;
> +	ss.ss_flags = 0;
> +	if (sigaltstack(&ss, NULL) == -1) {
> +		perror("sigaltstack() failed");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
> +	sa.sa_sigaction = signal_handler;
> +	if (sigaction(SIGTRAP, &sa, NULL) == -1) {
> +		perror("sigaction() failed");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	/* Trigger a SIGTRAP in transactional state */
> +	asm __volatile__(
> +			"tbegin.;"
> +			"beq    1f;"
> +			"trap;"
> +			"1: ;"
> +			: : : "memory");
> +
> +	/* Trigger a SIGTRAP in suspended state */
> +	asm __volatile__(
> +			"tbegin.;"
> +			"beq    1f;"
> +			"tsuspend.;"
> +			"trap;"
> +			"tresume.;"
> +			"1: ;"
> +			: : : "memory");
> +
> +	return EXIT_SUCCESS;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	/*
> +	 * Depending on kernel config, the TM Bad Thing might not result in a
> +	 * crash, instead the kernel never returns control back to userspace, so
> +	 * set a tight timeout. If the test passes it completes almost
> +	 * immediately.
> +	 */
> +	test_harness_set_timeout(2);
> +	return test_harness(tm_signal_pagefault, "tm_signal_pagefault");
> +}
> 

Reviewed-by: Gustavo Romero <gromero@linux.ibm.com>


Best regards,
Gustavo
