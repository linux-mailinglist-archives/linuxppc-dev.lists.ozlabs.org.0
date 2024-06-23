Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B0913F40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 01:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6nZl2XVWz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 09:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=chaitanyas.prakash@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6Zhz31gjz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 01:27:29 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48645DA7;
	Sun, 23 Jun 2024 08:27:21 -0700 (PDT)
Received: from [10.163.46.232] (unknown [10.163.46.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 633E53F766;
	Sun, 23 Jun 2024 08:26:52 -0700 (PDT)
Message-ID: <adc971c5-f2a7-4f2d-97d8-40ed0cfe03c0@arm.com>
Date: Sun, 23 Jun 2024 20:56:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
 namhyung@kernel.org
References: <20240618140354.5765-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Chaitanya S Prakash <ChaitanyaS.Prakash@arm.com>
In-Reply-To: <20240618140354.5765-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 24 Jun 2024 09:37:30 +1000
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/18/24 19:33, Athira Rajeev wrote:
> Perf test for perf probe of function from different CU fails
> as below:
>
> 	./perf test -vv "test perf probe of function from different CU"
> 	116: test perf probe of function from different CU:
> 	--- start ---
> 	test child forked, pid 2679
> 	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Msa7iy89bx/testfile
> 	  Error: Failed to add events.
> 	--- Cleaning up ---
> 	"foo" does not hit any event.
> 	  Error: Failed to delete events.
> 	---- end(-1) ----
> 	116: test perf probe of function from different CU                   : FAILED!
>
> The test does below to probe function "foo" :
>
> 	# gcc -g -Og -flto -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.c
> 	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
> 	# gcc -g -Og -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.c
> 	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
> 	# gcc -g -Og -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
> 	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
> 	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
>
> 	# ./perf probe -x /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile foo
> 	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
> 	   Error: Failed to add events.
>
> Perf probe fails to find symbol foo in the executable placed in
> /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7
>
> Simple reproduce:
>
>   # mktemp -d /tmp/perf-checkXXXXXXXXXX
>     /tmp/perf-checkcWpuLRQI8j
>
>   # gcc -g -o test test.c
>   # cp test /tmp/perf-checkcWpuLRQI8j/
>   # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
>     00000000100006bc T foo
>
>   # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
>     Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
>        Error: Failed to add events.
>
> But it works with any files like /tmp/perf/test. Only for
> patterns with "/tmp/perf-", this fails.
>
> Further debugging, commit 80d496be89ed ("perf report: Add support
> for profiling JIT generated code") added support for profiling JIT
> generated code. This patch handles dso's of form
> "/tmp/perf-$PID.map" .
>
> The check used "if (strncmp(self->name, "/tmp/perf-", 10) == 0)"
> to match "/tmp/perf-$PID.map". With this commit, any dso in
> /tmp/perf- folder will be considered separately for processing
> (not only JIT created map files ). Fix this by changing the
> string pattern to check for "/tmp/perf-%d.map". Add a helper
> function is_perf_pid_map_name to do this check.
>
> With the fix,
> 	# ./perf test "test perf probe of function from different CU"
> 	117: test perf probe of function from different CU                   : Ok
>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v2 -> v3:
> Addressed review comment from Adrian and James.
> Added perf_pid_map_tid to save the tid and modified
> is_perf_pid_map_name to use this internally.
>
> v1 -> v2:
> Addressed review comments from Adrian.
> Added helper function is_perf_pid_map_name to check
> dso name of form "/tmp/perf-%d.map". Used sscanf
> instead of regex comparison.
>
>   tools/perf/util/dso.c    | 12 ++++++++++++
>   tools/perf/util/dso.h    |  4 ++++
>   tools/perf/util/symbol.c |  3 ++-
>   3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> index dde706b71da7..2340c4f6d0c2 100644
> --- a/tools/perf/util/dso.c
> +++ b/tools/perf/util/dso.c
> @@ -1652,3 +1652,15 @@ int dso__strerror_load(struct dso *dso, char *buf, size_t buflen)
>   	scnprintf(buf, buflen, "%s", dso_load__error_str[idx]);
>   	return 0;
>   }
> +
> +bool perf_pid_map_tid(const char *dso_name, int *tid)
> +{
> +	return sscanf(dso_name, "/tmp/perf-%d.map", tid) == 1;
> +}
> +
> +bool is_perf_pid_map_name(const char *dso_name)
> +{
> +	int tid;
> +
> +	return perf_pid_map_tid(dso_name, &tid);
> +}
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index df2c98402af3..d72f3b8c37f6 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -809,4 +809,8 @@ void reset_fd_limit(void);
>   u64 dso__find_global_type(struct dso *dso, u64 addr);
>   u64 dso__findnew_global_type(struct dso *dso, u64 addr, u64 offset);
>   
> +/* Check if dso name is of format "/tmp/perf-%d.map" */
> +bool perf_pid_map_tid(const char *dso_name, int *tid);
> +bool is_perf_pid_map_name(const char *dso_name);
> +
>   #endif /* __PERF_DSO */
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 9e5940b5bc59..aee0a4cfb383 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1799,7 +1799,8 @@ int dso__load(struct dso *dso, struct map *map)
>   	const char *map_path = dso__long_name(dso);
>   
>   	mutex_lock(dso__lock(dso));
> -	perfmap = strncmp(dso__name(dso), "/tmp/perf-", 10) == 0;
> +	perfmap = is_perf_pid_map_name(map_path);
> +
>   	if (perfmap) {
>   		if (dso__nsinfo(dso) &&
>   		    (dso__find_perf_map(newmapname, sizeof(newmapname),

Reviewed-by: Chaitanya S Prakash<chaitanyas.prakash@arm.com>

I will drop my fix for the same.
https://lore.kernel.org/all/20240601125946.1741414-10-ChaitanyaS.Prakash@arm.com/

The rest of my series can be reviewed as a string function tidy up.

