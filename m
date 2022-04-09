Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DB4FA93F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 17:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbJkB70g9z3bWx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 01:21:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbFy3Jon;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qbFy3Jon; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbJjT1bxBz2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 01:21:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF4ADB80835;
 Sat,  9 Apr 2022 15:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDF3C385A0;
 Sat,  9 Apr 2022 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649517655;
 bh=RFO67uDd9EDe1krV0dlKNauL935e+ZJMN3omRC06vZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qbFy3JonIa9nFjcDEShumglQ6uDTySBoCKYp0hdTheQAuWlc0746BGIiBisIOz02Y
 kp1EoSOtHvG4s6zcU3i6hXGgQPgfcG2IFX4iPAs3DmvvPELPfFuIoi0G55kf9uMkvs
 jKRuU6nL/5qIP/3sRJqN9YrWvtYmZAkJjjPDWcN31oedfJkdeTo9Pvc71xZ5H1QV2W
 j82/JtQpeKzP9Kv/JhJn6VbwaYVNqB3aku9ofPOUsT5tAb01Ba7HqtjEbUtCyXtMwZ
 t7NubrNmdayKXHb7xYDzt1ev7CjcG1H8obnCNXLD8AY/NijTwu5rMrlbG1+gLrzSgK
 XxBRteplifryA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 6D18C40407; Sat,  9 Apr 2022 12:20:52 -0300 (-03)
Date: Sat, 9 Apr 2022 12:20:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/4] tools/perf: Fix perf bench numa testcase to check
 if CPU used to bind task is online
Message-ID: <YlGkVPyn2/tpUZl2@kernel.org>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Apr 06, 2022 at 11:21:13PM +0530, Athira Rajeev escreveu:
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
> The Testcases uses CPU’s 0 and 8. In function "parse_setup_cpu_list",
> There is check to see if cpu number is greater than max cpu’s possible
> in the system ie via "if (bind_cpu_0 >= g->p.nr_cpus ||
> bind_cpu_1 >= g->p.nr_cpus) {". But it could happen that system has
> say 48 CPU’s, but only number of online CPU’s is 0-7. Other CPU’s
> are offlined. Since "g->p.nr_cpus" is 48, so function will go ahead
> and set bit for CPU 8 also in cpumask ( td->bind_cpumask).
> 
> bind_to_cpumask function is called to set affinity using
> sched_setaffinity and the cpumask. Since the CPU8 is not present,
> set affinity will fail here with EINVAL. Fix this issue by adding a
> check to make sure that, CPU’s provided in the input argument values
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

Please use

int sysfs__read_str(const char *entry, char **buf, size_t *sizep)

See how to use it in the smt_on() function at tools/perf/util/smt.c, for
example.

Now looking at the first patches in the series.

- Arnaldo

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

-- 

- Arnaldo
