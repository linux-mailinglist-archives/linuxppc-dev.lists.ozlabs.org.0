Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0B14128F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 22:04:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ztpg5tgxzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 08:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ztl828L7zDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 08:01:07 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HKv6Iv117150; Fri, 17 Jan 2020 16:01:04 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xk0qs2qfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:01:04 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00HL0JPf021892;
 Fri, 17 Jan 2020 21:01:03 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 2xjvwp5970-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 21:01:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HL11dX17694998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 21:01:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F27AC605F;
 Fri, 17 Jan 2020 21:01:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26217C6061;
 Fri, 17 Jan 2020 21:01:00 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.80.203.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 21:00:59 +0000 (GMT)
Subject: Re: [PATCH 3/3] selftests/powerpc: Don't rely on segfault to rerun
 the test
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200116220531.4715-1-gustavold@linux.ibm.com>
 <20200116220531.4715-3-gustavold@linux.ibm.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <2e523bd0-a9e9-e211-8d47-52769c6af876@linux.vnet.ibm.com>
Date: Fri, 17 Jan 2020 18:00:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200116220531.4715-3-gustavold@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170161
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

On 01/16/2020 07:05 PM, Gustavo Luiz Duarte wrote:
> The test case tm-signal-context-force-tm expects a segfault to happen on
> returning from signal handler, and then does a setcontext() to run the test
> again. However, the test doesn't always segfault, causing the test to run a
> single time.
> 
> This patch fixes the test by putting it within a loop and jumping, via
> setcontext, just prior to the loop in case it segfaults. This way we get the
> desired behavior (run the test COUNT_MAX times) regardless if it segfaults or
> not. This also reduces the use of setcontext for control flow logic, keeping it
> only in the segfault handler.
> 
> Also, since 'count' is changed within the signal handler, it is declared as
> volatile to prevent any compiler optimization getting confused with
> asynchronous changes.
> 
> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
> ---
>   .../powerpc/tm/tm-signal-context-force-tm.c   | 79 +++++++++----------
>   1 file changed, 37 insertions(+), 42 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> index 31717625f318..9ff7bdb6d47a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
> @@ -42,9 +42,10 @@
>   #endif
>   
>   /* Setting contexts because the test will crash and we want to recover */
> -ucontext_t init_context, main_context;
> +ucontext_t init_context;
>   
> -static int count, first_time;
> +/* count is changed in the signal handler, so it must be volatile */
> +static volatile int count;
>   
>   void usr_signal_handler(int signo, siginfo_t *si, void *uc)
>   {
> @@ -98,11 +99,6 @@ void usr_signal_handler(int signo, siginfo_t *si, void *uc)
>   
>   void seg_signal_handler(int signo, siginfo_t *si, void *uc)
>   {
> -	if (count == COUNT_MAX) {
> -		/* Return to tm_signal_force_msr() and exit */
> -		setcontext(&main_context);
> -	}
> -
>   	count++;
>   
>   	/* Reexecute the test */
> @@ -126,37 +122,40 @@ void tm_trap_test(void)
>   	 */
>   	getcontext(&init_context);
>   
> -	/* Allocated an alternative signal stack area */
> -	ss.ss_sp = mmap(NULL, SIGSTKSZ, PROT_READ | PROT_WRITE,
> -			MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> -	ss.ss_size = SIGSTKSZ;
> -	ss.ss_flags = 0;
> -
> -	if (ss.ss_sp == (void *)-1) {
> -		perror("mmap error\n");
> -		exit(-1);
> -	}
> -
> -	/* Force the allocation through a page fault */
> -	if (madvise(ss.ss_sp, SIGSTKSZ, MADV_DONTNEED)) {
> -		perror("madvise\n");
> -		exit(-1);
> -	}
> -
> -	/* Setting an alternative stack to generate a page fault when
> -	 * the signal is raised.
> -	 */
> -	if (sigaltstack(&ss, NULL)) {
> -		perror("sigaltstack\n");
> -		exit(-1);
> +	while (count < COUNT_MAX) {
> +		/* Allocated an alternative signal stack area */
> +		ss.ss_sp = mmap(NULL, SIGSTKSZ, PROT_READ | PROT_WRITE,
> +				MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> +		ss.ss_size = SIGSTKSZ;
> +		ss.ss_flags = 0;
> +
> +		if (ss.ss_sp == (void *)-1) {
> +			perror("mmap error\n");
> +			exit(-1);
> +		}
> +
> +		/* Force the allocation through a page fault */
> +		if (madvise(ss.ss_sp, SIGSTKSZ, MADV_DONTNEED)) {
> +			perror("madvise\n");
> +			exit(-1);
> +		}
> +
> +		/* Setting an alternative stack to generate a page fault when
> +		 * the signal is raised.
> +		 */
> +		if (sigaltstack(&ss, NULL)) {
> +			perror("sigaltstack\n");
> +			exit(-1);
> +		}
> +
> +		/* The signal handler will enable MSR_TS */
> +		sigaction(SIGUSR1, &usr_sa, NULL);
> +		/* If it does not crash, it might segfault, avoid it to retest */
> +		sigaction(SIGSEGV, &seg_sa, NULL);
> +
> +		raise(SIGUSR1);
> +		count++;
>   	}
> -
> -	/* The signal handler will enable MSR_TS */
> -	sigaction(SIGUSR1, &usr_sa, NULL);
> -	/* If it does not crash, it will segfault, avoid it to retest */
> -	sigaction(SIGSEGV, &seg_sa, NULL);
> -
> -	raise(SIGUSR1);
>   }
>   
>   int tm_signal_context_force_tm(void)
> @@ -169,11 +168,7 @@ int tm_signal_context_force_tm(void)
>   	 */
>   	SKIP_IF(!is_ppc64le());
>   
> -	/* Will get back here after COUNT_MAX interactions */
> -	getcontext(&main_context);
> -
> -	if (!first_time++)
> -		tm_trap_test();
> +	tm_trap_test();
>   
>   	return EXIT_SUCCESS;
>   }
> 

Reviewed-by: Gustavo Romero <gromero@linux.ibm.com>


Best regards,
Gustavo
