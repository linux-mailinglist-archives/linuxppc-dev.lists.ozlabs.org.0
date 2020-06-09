Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5E1F3527
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:43:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h2Cs5TdDzDqCh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kamalesh@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1lT6t2KzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:21:57 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05978MiC090491; Tue, 9 Jun 2020 03:21:52 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g79ka12t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 03:21:51 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0597LGna001562;
 Tue, 9 Jun 2020 07:21:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7wek2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 07:21:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0597LjUZ29687914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 07:21:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DCE3A405B;
 Tue,  9 Jun 2020 07:21:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 359AAA4062;
 Tue,  9 Jun 2020 07:21:43 +0000 (GMT)
Received: from JAVRIS.in.ibm.com (unknown [9.199.50.138])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Jun 2020 07:21:43 +0000 (GMT)
Subject: Re: [PATCH v2] selftests: powerpc: Fix CPU affinity for child process
To: Harish <harish@linux.ibm.com>
References: <20200609034005.520137-1-harish@linux.ibm.com>
From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Message-ID: <337b859f-4e26-690e-b1ab-8b9d8e932171@linux.vnet.ibm.com>
Date: Tue, 9 Jun 2020 12:51:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609034005.520137-1-harish@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_02:2020-06-08,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=2 priorityscore=1501 adultscore=0 mlxscore=0
 cotscore=-2147483648 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090048
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
Cc: srikar@linux.vnet.ibm.com, shiganta@in.ibm.com, sandipan@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/9/20 9:10 AM, Harish wrote:
> On systems with large number of cpus, test fails trying to set
> affinity for child process by calling sched_setaffinity() with 
> smaller size for cpuset. This patch fixes it by making sure that
> the size of allocated cpu set is dependent on the number of CPUs
> as reported by get_nprocs().
> 
> Fixes: 00b7ec5c9cf3 ("selftests/powerpc: Import Anton's context_switch2 benchmark")
> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
> Signed-off-by: Harish <harish@linux.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  .../powerpc/benchmarks/context_switch.c        | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/benchmarks/context_switch.c b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
> index a2e8c9da7fa5..de6c49d6f88f 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/context_switch.c
> +++ b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
> @@ -19,6 +19,7 @@
>  #include <limits.h>
>  #include <sys/time.h>
>  #include <sys/syscall.h>
> +#include <sys/sysinfo.h>
>  #include <sys/types.h>
>  #include <sys/shm.h>
>  #include <linux/futex.h>
> @@ -104,8 +105,9 @@ static void start_thread_on(void *(*fn)(void *), void *arg, unsigned long cpu)
> 
>  static void start_process_on(void *(*fn)(void *), void *arg, unsigned long cpu)
>  {
> -	int pid;
> -	cpu_set_t cpuset;
> +	int pid, ncpus;
> +	cpu_set_t *cpuset;
> +	size_t size;
> 
>  	pid = fork();
>  	if (pid == -1) {
> @@ -116,12 +118,16 @@ static void start_process_on(void *(*fn)(void *), void *arg, unsigned long cpu)
>  	if (pid)
>  		return;
> 
> -	CPU_ZERO(&cpuset);
> -	CPU_SET(cpu, &cpuset);
> +	size = CPU_ALLOC_SIZE(ncpus);
> +	ncpus = get_nprocs();
> +	cpuset = CPU_ALLOC(ncpus);

CPU_ALLOC() allocation failure needs to be checked, like malloc() allocations.

> +	CPU_ZERO_S(size, cpuset);
> +	CPU_SET_S(cpu, size, cpuset);
> 
> -	if (sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
> +	if (sched_setaffinity(0, size, cpuset)) {
>  		perror("sched_setaffinity");
> -		exit(1);
> +		CPU_FREE(cpuset);
> +		exit(-1);
>  	}

once the cpu affinity is set, you probably want to free the cpuset mask.

> 
>  	fn(arg);
> 
-- 
Kamalesh
