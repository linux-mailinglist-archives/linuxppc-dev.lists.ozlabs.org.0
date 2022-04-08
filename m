Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E644F95BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZcvt5dJBz2yWn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 22:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pHe9prWD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pHe9prWD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZcv65ydTz2xvS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 22:26:58 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238Af5pK021148; 
 Fri, 8 Apr 2022 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=mqCLsfHi93jccKStWj5lCi4fkyrQdCYAWdQtQsx7Rqk=;
 b=pHe9prWDZvrytWq3Jx/6UGzdIAw3fxQWhatMcxWnFSVNb6ZeJI+eXhu4mNke7kpxTcKd
 z7lENjeQNWupLFjPe76IAeCzRJ0Z/bkhrq2nBZOICNzarQIgbS3peoMPuVUbHTS2KGM2
 Mgp90/i6IMxbLrLjyqYM5yuXWJvYJFOVVEKfP2DidMgocPU0md/22KVfPJQstY4zFls8
 duWeOdqIvLi/3RQzS5iRI6oXcs1YGX4nqIQoXKXj6M7B294dfT1mALZex3ua+PEnnRgE
 nZM2L5npLnrFvdEHPejo6r5jMpl1zm7Tb4VNmI/qomFyCa5cIlZei8EMB2bFtzXdJp5B jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4jx2sq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:26:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238CJkHx030218;
 Fri, 8 Apr 2022 12:26:50 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4jx2spq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:26:50 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CDjel016458;
 Fri, 8 Apr 2022 12:26:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3f6e491ny5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:26:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 238CEP1b46662088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 12:14:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50A4D42049;
 Fri,  8 Apr 2022 12:26:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF234203F;
 Fri,  8 Apr 2022 12:26:43 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  8 Apr 2022 12:26:43 +0000 (GMT)
Date: Fri, 8 Apr 2022 17:56:42 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/4] tools/perf: Fix perf bench numa testcase to check
 if CPU used to bind task is online
Message-ID: <20220408122642.GE568950@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7OCz8BkOzxvY7vt3ls03oUoKVx4-GN1s
X-Proofpoint-ORIG-GUID: 6OeemDusQzhfXAvTNH8ZAluOplIzYMUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080062
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Athira Rajeev <atrajeev@linux.vnet.ibm.com> [2022-04-06 23:21:13]:

> Perf numa bench test fails with error:
> 
> Testcase:
> ./perf bench numa mem -p 2 -t 1 -P 1024 -C 0,8 -M 1,0 -s 20 -zZq
> --thp  1 --no-data_rand_walk
> 
> Failure snippet:
> <<>>
>  Running 'numa/mem' benchmark:
> 
>  # Running main, "perf bench numa numa-mem -p 2 -t 1 -P 1024 -C 0,8
> -M 1,0 -s 20 -zZq --thp 1 --no-data_rand_walk"
> 
> perf: bench/numa.c:333: bind_to_cpumask: Assertion `!(ret)' failed.
> <<>>
> 
> The Testcases uses CPU???s 0 and 8. In function "parse_setup_cpu_list",
> There is check to see if cpu number is greater than max cpu???s possible
> in the system ie via "if (bind_cpu_0 >= g->p.nr_cpus ||
> bind_cpu_1 >= g->p.nr_cpus) {". But it could happen that system has
> say 48 CPU???s, but only number of online CPU???s is 0-7. Other CPU???s
> are offlined. Since "g->p.nr_cpus" is 48, so function will go ahead
> and set bit for CPU 8 also in cpumask ( td->bind_cpumask).
> 
> bind_to_cpumask function is called to set affinity using
> sched_setaffinity and the cpumask. Since the CPU8 is not present,
> set affinity will fail here with EINVAL. Fix this issue by adding a
> check to make sure that, CPU???s provided in the input argument values
> are online before proceeding further and skip the test. For this,
> include new helper function "is_cpu_online" in
> "tools/perf/util/header.c".
> 
> Since "BIT(x)" definition will get included from header.h, remove
> that from bench/numa.c
> 
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>

Looks good to me.
Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
>  tools/perf/bench/numa.c  |  8 ++++++--
>  tools/perf/util/header.c | 43 ++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/header.h |  1 +
>  3 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
> index 29e41e32bd88..7992d79b3e41 100644
> --- a/tools/perf/bench/numa.c
> +++ b/tools/perf/bench/numa.c
> @@ -34,6 +34,7 @@
>  #include <linux/numa.h>
>  #include <linux/zalloc.h>
> 
> +#include "../util/header.h"
>  #include <numa.h>
>  #include <numaif.h>
> 
> @@ -616,6 +617,11 @@ static int parse_setup_cpu_list(void)
>  			return -1;
>  		}
> 
> +		if (is_cpu_online(bind_cpu_0) != 1 || is_cpu_online(bind_cpu_1) != 1) {
> +			printf("\nTest not applicable, bind_cpu_0 or bind_cpu_1 is offline\n");
> +			return -1;
> +		}
> +
>  		BUG_ON(bind_cpu_0 < 0 || bind_cpu_1 < 0);
>  		BUG_ON(bind_cpu_0 > bind_cpu_1);
> 
> @@ -786,8 +792,6 @@ static int parse_nodes_opt(const struct option *opt __maybe_unused,
>  	return parse_node_list(arg);
>  }
> 
> -#define BIT(x) (1ul << x)
> -
>  static inline uint32_t lfsr_32(uint32_t lfsr)
>  {
>  	const uint32_t taps = BIT(1) | BIT(5) | BIT(6) | BIT(31);
> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> index 6da12e522edc..3f5fcf5d4b3f 100644
> --- a/tools/perf/util/header.c
> +++ b/tools/perf/util/header.c
> @@ -983,6 +983,49 @@ static int write_dir_format(struct feat_fd *ff,
>  	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
>  }
> 
> +#define SYSFS "/sys/devices/system/cpu/"
> +
> +/*
> + * Check whether a CPU is online
> + *
> + * Returns:
> + *     1 -> if CPU is online
> + *     0 -> if CPU is offline
> + *    -1 -> error case
> + */
> +int is_cpu_online(unsigned int cpu)
> +{
> +	char sysfs_cpu[255];
> +	char buf[255];
> +	struct stat statbuf;
> +	size_t len;
> +	int fd;
> +
> +	snprintf(sysfs_cpu, sizeof(sysfs_cpu), SYSFS "cpu%u", cpu);
> +
> +	if (stat(sysfs_cpu, &statbuf) != 0)
> +		return 0;
> +
> +	/*
> +	 * Check if /sys/devices/system/cpu/cpux/online file
> +	 * exists. In kernels without CONFIG_HOTPLUG_CPU, this
> +	 * file won't exist.
> +	 */
> +	snprintf(sysfs_cpu, sizeof(sysfs_cpu), SYSFS "cpu%u/online", cpu);
> +	if (stat(sysfs_cpu, &statbuf) != 0)
> +		return 1;
> +
> +	fd = open(sysfs_cpu, O_RDONLY);
> +	if (fd == -1)
> +		return -1;
> +
> +	len = read(fd, buf, sizeof(buf) - 1);
> +	buf[len] = '\0';
> +	close(fd);
> +
> +	return strtoul(buf, NULL, 16);
> +}
> +
>  #ifdef HAVE_LIBBPF_SUPPORT
>  static int write_bpf_prog_info(struct feat_fd *ff,
>  			       struct evlist *evlist __maybe_unused)
> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
> index c9e3265832d9..0eb4bc29a5a4 100644
> --- a/tools/perf/util/header.h
> +++ b/tools/perf/util/header.h
> @@ -158,6 +158,7 @@ int do_write(struct feat_fd *fd, const void *buf, size_t size);
>  int write_padded(struct feat_fd *fd, const void *bf,
>  		 size_t count, size_t count_aligned);
> 
> +int is_cpu_online(unsigned int cpu);
>  /*
>   * arch specific callback
>   */
> -- 
> 2.35.1
> 
