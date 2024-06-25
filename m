Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269189166E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:03:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nurEVi5T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7k514v4Sz3dng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 22:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nurEVi5T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7k4J60xYz3dTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 22:03:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719316994; x=1750852994;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h1KG9pjOD+gw+c5c48eLlcq9j1rbDh8dqvwli2CL5+8=;
  b=nurEVi5TuMvejS0fYGop9+jbTB4wB1xZmxEnDZAWhZ/fIZikhN2aqh/O
   RldGvfKgkEpsPyr/W8YZ1gK41Rj2+24Kg0SHfCPffjVWfzX2Ia2AGZKHP
   wrX9odqPXJsHMoxaa1boZ80ijqzWKc9RE1w9wa4NlLNKMcYf4QohiKfrh
   BI6/fAyLBUzTlb9vJBt5zHePTMl7mjaS/weErLNNdPuyIhXbTrgeaITfp
   vRGsMSTexJizT2EIT8rAgCEHaNlqELYySFgn+A37nJ3CwjWX/ikwIAPSS
   1Xgae0JXgm8Uv/Uxu/EbbNxAHnDAUW0qmekbw9D+1myH7G7i2i3AFDPa2
   g==;
X-CSE-ConnectionGUID: EPJZKmOLQFq3qPXQr1BhUA==
X-CSE-MsgGUID: xbk9iTCkR/CMTxX1rmebxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33785106"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="33785106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:03:12 -0700
X-CSE-ConnectionGUID: Fl7H6VkYRwCwXQezshTHBA==
X-CSE-MsgGUID: CL+4CBugRJeEpvzlDHDz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43734896"
Received: from gcivario-mobl.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.48.191])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:03:08 -0700
Message-ID: <536ccca7-278c-4d50-9c24-bf4409cd75dc@intel.com>
Date: Tue, 25 Jun 2024 15:03:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/3] tools/perf: Use is_perf_pid_map_name helper
 function to check dso's of pattern /tmp/perf-%d.map
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
 <20240623064850.83720-2-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240623064850.83720-2-atrajeev@linux.vnet.ibm.com>
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
> commit 80d496be89ed ("perf report: Add support for profiling JIT
> generated code") added support for profiling JIT generated code.
> This patch handles dso's of form "/tmp/perf-$PID.map".
> 
> Some of the references doesn't check exactly for same pattern.
> some uses "if (!strncmp(dso_name, "/tmp/perf-", 10))". Fix
> this by using helper function perf_pid_map_tid and
> is_perf_pid_map_name which looks for proper pattern of
> form: "/tmp/perf-$PID.map" for these checks.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Add a Fixes tag, then

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/util/dsos.c    | 2 +-
>  tools/perf/util/srcline.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> index ab3d0c01dd63..846828ea1f00 100644
> --- a/tools/perf/util/dsos.c
> +++ b/tools/perf/util/dsos.c
> @@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
>  	char *base, *lname;
>  	int tid;
>  
> -	if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) == 1) {
> +	if (perf_pid_map_tid(dso__long_name(dso), &tid)) {
>  		if (asprintf(&base, "[JIT] tid %d", tid) < 0)
>  			return;
>  	} else {
> diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> index 9d670d8c1c08..51eb78993fe2 100644
> --- a/tools/perf/util/srcline.c
> +++ b/tools/perf/util/srcline.c
> @@ -39,7 +39,7 @@ static const char *srcline_dso_name(struct dso *dso)
>  	if (dso_name[0] == '[')
>  		return NULL;
>  
> -	if (!strncmp(dso_name, "/tmp/perf-", 10))
> +	if (is_perf_pid_map_name(dso_name))
>  		return NULL;
>  
>  	return dso_name;

