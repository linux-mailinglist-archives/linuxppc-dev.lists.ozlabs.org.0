Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD390C425
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:12:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrb4RxeF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3HyS4V7Pz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 17:12:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrb4RxeF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3Hx737cQz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 17:11:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718694701; x=1750230701;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lgHzLDcHSlQnwaAoPxMtUeOJT0ovSIbIZaZ/EL3pzAQ=;
  b=jrb4RxeFgf4+0m30xnO9wwGLgLuCU4duJVUGHKARXkWZ+KZDXnvb40Bc
   4fWJPJS3GIJF2h9y2MylwdOzte6VMDsaeh8Yq0l2rPKXxoieGoS8Ip75h
   l9hj2FjxLRzvuPewCgsvLRIXDNmF6hMRKxaC5i98C+zvD9VYetJN+Ehlz
   Cpr45KyRNDrMcHREUhmWxPgqSd2NSpXgucM/HZX04boFdxldeLLJX3QM8
   ct1aMEskTlboidCAP7ZW6d3CyqUdN7NVxp05JPKKPOYg938Spvl8X60SB
   s50kDG/6dMHa1wTKX9t7RE8qRx/TVtY8xcN3cnvP/m2Lb/8Vwk8s7GfQ+
   g==;
X-CSE-ConnectionGUID: z9w51oWZSZWV09PWwB+ayA==
X-CSE-MsgGUID: SS7/+pXCTcqdbAM32gMM7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15383950"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15383950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 00:11:34 -0700
X-CSE-ConnectionGUID: m7SlF0XsT4KOAL4r672Ryg==
X-CSE-MsgGUID: 7rN+29qISE2/Fou/uTtzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42135733"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.41.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 00:11:29 -0700
Message-ID: <223d1e96-223f-4bda-8133-806a3aa61730@intel.com>
Date: Tue, 18 Jun 2024 10:11:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] tools/perf: Use is_perf_pid_map_name helper
 function to check dso's of pattern /tmp/perf-%d.map
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240617130332.13427-1-atrajeev@linux.vnet.ibm.com>
 <20240617130332.13427-2-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240617130332.13427-2-atrajeev@linux.vnet.ibm.com>
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

On 17/06/24 16:03, Athira Rajeev wrote:
> commit 80d496be89ed ("perf report: Add support for profiling JIT
> generated code") added support for profiling JIT generated code.
> This patch handles dso's of form "/tmp/perf-$PID.map".
> 
> Some of the references doesn't check exactly for same pattern.
> some uses "if (!strncmp(dso_name, "/tmp/perf-", 10))". Fix
> this by using helper function is_perf_pid_map_name which looks
> for proper pattern of form: "/tmp/perf-$PID.map" for these checks.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/dsos.c    | 2 +-
>  tools/perf/util/srcline.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> index ab3d0c01dd63..23cd02aa701d 100644
> --- a/tools/perf/util/dsos.c
> +++ b/tools/perf/util/dsos.c
> @@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
>  	char *base, *lname;
>  	int tid;
>  
> -	if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) == 1) {
> +	if (is_perf_pid_map_name(dso__long_name(dso))) {

Perhaps add another helper for this case:

bool perf_pid_map_tid(const char *dso_name, int *tid)
{
	return sscanf(dso_name, "/tmp/perf-%d.map", &tid) == 1;
}

bool is_perf_pid_map_name(const char *dso_name)
{
	int tid;

	return perf_pid_map_tid(dso_name, &tid);
}

And then:

	if (perf_pid_map_tid(dso__long_name(dso), &tid)) {



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

