Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B6909E2D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 17:37:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q5SBZXzR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2HG81bHBz3cTf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 01:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q5SBZXzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2HFN48hDz30VH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 01:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718552234; x=1750088234;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=grOLrtXokBRxCb602pJ2qqigELqTN7tvSkwUgOFBVHc=;
  b=Q5SBZXzRlQpPGhmBmN0J0W0o0BxGxUpnulBFXABMG7hVQHuKVQwpoK6c
   IBaaXr5P7sa4a0GU3m4n7ENAO+p4M48jxKSGCZ7o7Os7pIdN+sHkSZUY1
   hFsHjxpNHAxj4tyOnmUiHA82uAjo6LfNIJa4Ht3TCZs2/a08xDLysTTL+
   ad69GaicGnb28YNrVWRH4PBalYtUhj6X7jCa7TtJZ08XbgCGOK8+wm4Io
   RSeA6gRk15GBZVMmxb9YNPFY9Fr897utg2EjTGKXMMmq0KjB55ZpnoxrC
   whehnzklXJpDQGqsRtvsWlhc6rPARNTtKs4YmJNAkiKRPoZ9CdZ5ph48f
   Q==;
X-CSE-ConnectionGUID: Ynp4+3qiTCygDdqSLq/AGg==
X-CSE-MsgGUID: q+pRYTQ4Qc6JgsDIYw0fjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="19213770"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="19213770"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 08:37:07 -0700
X-CSE-ConnectionGUID: 7N5rMaRiSTmnktZf+InDXg==
X-CSE-MsgGUID: MCBI5qRfTkqf3EKk0KW+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="72185210"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.94.249.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 08:37:03 -0700
Message-ID: <5d9a9842-9b8a-428c-898f-e1ff866a6e66@intel.com>
Date: Sun, 16 Jun 2024 18:37:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240614172742.56976-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240614172742.56976-1-atrajeev@linux.vnet.ibm.com>
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

On 14/06/24 20:27, Athira Rajeev wrote:
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
> string pattern to check for regex of form "/tmp/perf-*.map"
> 
> With the fix,
> 	# ./perf test "test perf probe of function from different CU"
> 	117: test perf probe of function from different CU                   : Ok
> 
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/symbol.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 9e5940b5bc59..bfb88a4b0987 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -41,6 +41,7 @@
>  #include <limits.h>
>  #include <symbol/kallsyms.h>
>  #include <sys/utsname.h>
> +#include <regex.h>
>  
>  static int dso__load_kernel_sym(struct dso *dso, struct map *map);
>  static int dso__load_guest_kernel_sym(struct dso *dso, struct map *map);
> @@ -1797,9 +1798,18 @@ int dso__load(struct dso *dso, struct map *map)
>  	struct nscookie nsc;
>  	char newmapname[PATH_MAX];
>  	const char *map_path = dso__long_name(dso);
> +	regex_t    regex;
> +	const char *pattern =  "(^/tmp/perf-).*(map)";
>  
>  	mutex_lock(dso__lock(dso));
> -	perfmap = strncmp(dso__name(dso), "/tmp/perf-", 10) == 0;
> +	if (regcomp(&regex, pattern, REG_EXTENDED)) {
> +		pr_debug("regcomp() failed in dso__load\n");
> +		ret = -1;
> +		goto out;
> +	}
> +
> +	perfmap = !regexec(&regex, dso__name(dso), 0, NULL, 0);

This isn't the only place that checks for that name.  Perhaps
create a helper function:

bool is_perf_pid_map_name(const char *name);

Regex looks over complicated.  Maybe sscanf

	int tid;

	return sscanf(name, "/tmp/perf-%d.map", &tid) == 1;

> +
>  	if (perfmap) {
>  		if (dso__nsinfo(dso) &&
>  		    (dso__find_perf_map(newmapname, sizeof(newmapname),

