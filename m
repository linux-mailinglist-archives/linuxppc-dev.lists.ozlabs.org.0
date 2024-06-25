Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D69166B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 13:58:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cc3hFAVB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7jyf3V34z3dFm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 21:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cc3hFAVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7jxw6lStz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 21:57:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719316662; x=1750852662;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jKW9BLNUQnfwbfWacy1aVQxluFCOuOGEj2zQf5otgCA=;
  b=Cc3hFAVBe6xy3sc97ReBsMW+XxvrQ86YAN9A6kzlkCM3GeeDVxGMd8aR
   d+RyGtfM8PdMwO0+87SeHkBk3rUybYKIbugTdIsnkExrbydVo67nrcq39
   jetDc+ln7n1X2saoi5FbOAOK9BGkhl+cjwfiZbBqPrrNrxv1Pw77lWqSu
   AvLU7jCVw13NUGfH+x6XJY06+w1yOw7ZH0jSd5gt3OUcKc208ggE7CxXZ
   vA8l50N1OQpZ3fTQdIT+m7KRCqP99dLw7+eey2iVxQ3gBV+nVQQ7szloW
   Rd++lvl+J5qAPr69GNZgOkI79vKzrXXXuJ4qPWTgIJbfAMkvvYtfY503r
   A==;
X-CSE-ConnectionGUID: DZ8foiqLRWiMAvmutsEwwQ==
X-CSE-MsgGUID: LMGtQkDwStqPWR9wW1iwtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26918357"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="26918357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 04:57:33 -0700
X-CSE-ConnectionGUID: HdcFkiyvTsKeE4i+TV3s4w==
X-CSE-MsgGUID: 0zxKiv0RThWkccTTHa1pCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="44335321"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.48.191])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 04:57:30 -0700
Message-ID: <722cb4bc-89d4-4e03-a80d-ffe05be52c05@intel.com>
Date: Tue, 25 Jun 2024 14:57:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/06/24 09:48, Athira Rajeev wrote:
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
>  # mktemp -d /tmp/perf-checkXXXXXXXXXX
>    /tmp/perf-checkcWpuLRQI8j
> 
>  # gcc -g -o test test.c
>  # cp test /tmp/perf-checkcWpuLRQI8j/
>  # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
>    00000000100006bc T foo
> 
>  # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
>    Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
>       Error: Failed to add events.
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
> function is_perf_pid_map_name to do this check. In "struct dso",
> dso->long_name holds the long name of the dso file. Since the
> /tmp/perf-$PID.map check uses the complete name, use dso___long_name for
> the string name.
> 
> With the fix,
> 	# ./perf test "test perf probe of function from different CU"
> 	117: test perf probe of function from different CU                   : Ok
> 
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Changelog:
> v3 -> v4:
> Added commit message with usage of dso__long_name
> 
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
>  tools/perf/util/dso.c    | 12 ++++++++++++
>  tools/perf/util/dso.h    |  4 ++++
>  tools/perf/util/symbol.c |  3 ++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> index dde706b71da7..2340c4f6d0c2 100644
> --- a/tools/perf/util/dso.c
> +++ b/tools/perf/util/dso.c
> @@ -1652,3 +1652,15 @@ int dso__strerror_load(struct dso *dso, char *buf, size_t buflen)
>  	scnprintf(buf, buflen, "%s", dso_load__error_str[idx]);
>  	return 0;
>  }
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
>  u64 dso__find_global_type(struct dso *dso, u64 addr);
>  u64 dso__findnew_global_type(struct dso *dso, u64 addr, u64 offset);
>  
> +/* Check if dso name is of format "/tmp/perf-%d.map" */
> +bool perf_pid_map_tid(const char *dso_name, int *tid);
> +bool is_perf_pid_map_name(const char *dso_name);
> +
>  #endif /* __PERF_DSO */
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 9e5940b5bc59..aee0a4cfb383 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1799,7 +1799,8 @@ int dso__load(struct dso *dso, struct map *map)
>  	const char *map_path = dso__long_name(dso);
>  
>  	mutex_lock(dso__lock(dso));
> -	perfmap = strncmp(dso__name(dso), "/tmp/perf-", 10) == 0;
> +	perfmap = is_perf_pid_map_name(map_path);
> +
>  	if (perfmap) {
>  		if (dso__nsinfo(dso) &&
>  		    (dso__find_perf_map(newmapname, sizeof(newmapname),

