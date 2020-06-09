Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3B1F382A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 12:31:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h5xt3qVrzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 20:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sathnaga@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h5vq4nbdzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 20:29:27 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 059A3DPp170054; Tue, 9 Jun 2020 06:29:21 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31grrhyscn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 06:29:21 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 059ALEmv032642;
 Tue, 9 Jun 2020 10:29:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 31g2s82br8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 10:29:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 059ATFWM59244598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 10:29:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28894A405B;
 Tue,  9 Jun 2020 10:29:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0A34A4054;
 Tue,  9 Jun 2020 10:29:09 +0000 (GMT)
Received: from satheesh (unknown [9.85.125.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Jun 2020 10:29:09 +0000 (GMT)
Date: Tue, 9 Jun 2020 15:59:04 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Harish <harish@linux.ibm.com>
Subject: Re: [PATCH v3] selftests: powerpc: Fix CPU affinity for child process
Message-ID: <20200609102904.GA5194@satheesh>
References: <20200609081423.529664-1-harish@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609081423.529664-1-harish@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_03:2020-06-08,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 cotscore=-2147483648 malwarescore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090076
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
 sathnaga@linux.vnet.ibm.com, sandipan@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 01:44:23PM +0530, Harish wrote:
> On systems with large number of cpus, test fails trying to set
> affinity by calling sched_setaffinity() with smaller size for
> affinity mask. This patch fixes it by making sure that the size of
> allocated affinity mask is dependent on the number of CPUs as
> reported by get_nprocs().
> 
> Fixes: 00b7ec5c9cf3 ("selftests/powerpc: Import Anton's context_switch2 benchmark")
> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Harish <harish@linux.ibm.com>
> ---

Reviewed-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

> v2: https://lore.kernel.org/linuxppc-dev/20200609034005.520137-1-harish@linux.ibm.com/
> 
> Changes from v2:
> - Interchanged size and ncpus as suggested by Satheesh
> - Revert the exit code as suggested by Satheesh
> - Added NULL check for the affinity mask as suggested by Kamalesh
> - Freed the affinity mask allocation after affinity is set
>   as suggested by Kamalesh
> - Changed "cpu set" to "affinity mask" in the commit message
> 
> ---
>  .../powerpc/benchmarks/context_switch.c       | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/benchmarks/context_switch.c b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
> index a2e8c9da7fa5..d50cc05df495 100644
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
> @@ -116,14 +118,23 @@ static void start_process_on(void *(*fn)(void *), void *arg, unsigned long cpu)
>  	if (pid)
>  		return;
> 
> -	CPU_ZERO(&cpuset);
> -	CPU_SET(cpu, &cpuset);
> +	ncpus = get_nprocs();
> +	size = CPU_ALLOC_SIZE(ncpus);
> +	cpuset = CPU_ALLOC(ncpus);
> +	if (!cpuset) {
> +		perror("malloc");
> +		exit(1);
> +	}
> +	CPU_ZERO_S(size, cpuset);
> +	CPU_SET_S(cpu, size, cpuset);
> 
> -	if (sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
> +	if (sched_setaffinity(0, size, cpuset)) {
>  		perror("sched_setaffinity");
> +		CPU_FREE(cpuset);
>  		exit(1);
>  	}
> 
> +	CPU_FREE(cpuset);
>  	fn(arg);
> 
>  	exit(0);
> -- 
> 2.24.1
> 
