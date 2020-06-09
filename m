Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249791F34CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:26:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1rB2PL6zDqJl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathnaga@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0fm3BcwzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:32:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 059632V6097659; Tue, 9 Jun 2020 02:32:43 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g77qtbq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 02:32:43 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0596L9UU023554;
 Tue, 9 Jun 2020 06:32:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 31g2s7t6gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 06:32:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0596Wcdx65470574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 06:32:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDCE4A4054;
 Tue,  9 Jun 2020 06:32:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 936D4A4067;
 Tue,  9 Jun 2020 06:32:34 +0000 (GMT)
Received: from sathnaga86 (unknown [9.199.50.195])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Jun 2020 06:32:34 +0000 (GMT)
Date: Tue, 9 Jun 2020 12:02:31 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Harish <harish@linux.ibm.com>
Subject: Re: [PATCH v2] selftests: powerpc: Fix CPU affinity for child process
Message-ID: <20200609063231.GA361916@sathnaga86>
References: <20200609034005.520137-1-harish@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609034005.520137-1-harish@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_01:2020-06-08,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=5 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1011
 cotscore=-2147483648 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006090046
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com,
 sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 09:10:05AM +0530, Harish wrote:
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
above two lines should be interchanged, ncpus not assigned while getting used to get size.

> +	cpuset = CPU_ALLOC(ncpus);
> +	CPU_ZERO_S(size, cpuset);
> +	CPU_SET_S(cpu, size, cpuset);
> 
> -	if (sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
> +	if (sched_setaffinity(0, size, cpuset)) {
>  		perror("sched_setaffinity");
> -		exit(1);
> +		CPU_FREE(cpuset);
> +		exit(-1);
do we need to change the return value here?
probably other framework might rely on previous value?

Regards,
-Satheesh.
>  	}
> 
>  	fn(arg);
> -- 

> 2.24.1
> 
