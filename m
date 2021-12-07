Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BC46BE31
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 15:53:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7jwD3jgxz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 01:53:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RY6Z8lGq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RY6Z8lGq; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7jvY1RHVz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 01:52:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BD531CE1AB3;
 Tue,  7 Dec 2021 14:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AE1C341C1;
 Tue,  7 Dec 2021 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888752;
 bh=UPlYzu8zK9sCxqUM9Z3ruJ57CLQ7PFmjIvjY+14o3k4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RY6Z8lGq7kmQODbw3MeMmyzDwJlRCy3kFLCsMmD/lyM2/bDI+WoqKXeEkLJhHKbfq
 rVCRAI9e1f1y7E+gFqtzmWo/he9Z+cY9n/XY4yW5vtN+7xYIcXZlw3OoZ5p4FsJQT6
 89uDV8c6/1sc591snay8gTL0q0QChgD2qjVjRp5xPXHrxA7N9Wgti6wKQJmgwE7oJb
 xUili3TjOke0Wkrx87wdo7JSPIKpIIFB1wxX7EUuoxvPJXUlWpzI5OF7fv9H+XZPuH
 QOBFnNQDx4MSbZw4HBW5e+KIpjEb0I/sxrAX79p5oU5YHyu6L8uL6JzS0gIl9OkNph
 fPkE+/8XMTDdw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id D1FBC406C1; Tue,  7 Dec 2021 11:52:29 -0300 (-03)
Date: Tue, 7 Dec 2021 11:52:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
Message-ID: <Ya91LXxp13Nz3JyC@kernel.org>
References: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Dec 03, 2021 at 07:50:37AM +0530, Athira Rajeev escreveu:
> Sort key p_stage_cyc is used to present the latency
> cycles spend in pipeline stages. perf tool has local
> p_stage_cyc sort key to display this info. There is no
> global variant available for this sort key. local variant
> shows latency in a sinlge sample, whereas, global value
> will be useful to present the total latency (sum of
> latencies) in the hist entry. It represents latency
> number multiplied by the number of samples.
> 
> Add global (p_stage_cyc) and local variant
> (local_p_stage_cyc) for this sort key. Use the
> local_p_stage_cyc as default option for "mem" sort mode.
> Also add this to list of dynamic sort keys and made the
> "dynamic_headers" and "arch_specific_sort_keys" as static.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Namhyung Kim <namhyung@kernel.org>

I got this for v1, does it stand for v2?

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
> Changelog:
> v1 -> v2:
>  Addressed review comments from Jiri by making the
>  "dynamic_headers" and "arch_specific_sort_keys"
>  as static.
> 
>  tools/perf/util/hist.c |  4 +++-
>  tools/perf/util/hist.h |  3 ++-
>  tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
>  tools/perf/util/sort.h |  3 ++-
>  4 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
> index b776465e04ef..0a8033b09e28 100644
> --- a/tools/perf/util/hist.c
> +++ b/tools/perf/util/hist.c
> @@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
>  	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
>  	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
>  	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
> -	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
> +
>  	if (symbol_conf.nanosecs)
>  		hists__new_col_len(hists, HISTC_TIME, 16);
>  	else
> diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
> index 621f35ae1efa..2a15e22fb89c 100644
> --- a/tools/perf/util/hist.h
> +++ b/tools/perf/util/hist.h
> @@ -75,7 +75,8 @@ enum hist_column {
>  	HISTC_MEM_BLOCKED,
>  	HISTC_LOCAL_INS_LAT,
>  	HISTC_GLOBAL_INS_LAT,
> -	HISTC_P_STAGE_CYC,
> +	HISTC_LOCAL_P_STAGE_CYC,
> +	HISTC_GLOBAL_P_STAGE_CYC,
>  	HISTC_NR_COLS, /* Last entry */
>  };
>  
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index a111065b484e..e417e47f51b9 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -37,7 +37,7 @@ const char	default_parent_pattern[] = "^sys_|^do_page_fault";
>  const char	*parent_pattern = default_parent_pattern;
>  const char	*default_sort_order = "comm,dso,symbol";
>  const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
> -const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
> +const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,local_p_stage_cyc";
>  const char	default_top_sort_order[] = "dso,symbol";
>  const char	default_diff_sort_order[] = "dso,symbol";
>  const char	default_tracepoint_sort_order[] = "trace";
> @@ -46,8 +46,8 @@ const char	*field_order;
>  regex_t		ignore_callees_regex;
>  int		have_ignore_callees = 0;
>  enum sort_mode	sort__mode = SORT_MODE__NORMAL;
> -const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
> -const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
> +static const char *const dynamic_headers[] = {"local_ins_lat", "ins_lat", "local_p_stage_cyc", "p_stage_cyc"};
> +static const char *const arch_specific_sort_keys[] = {"local_p_stage_cyc", "p_stage_cyc"};
>  
>  /*
>   * Replaces all occurrences of a char used with the:
> @@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat = {
>  };
>  
>  static int64_t
> -sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
> +sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
>  {
>  	return left->p_stage_cyc - right->p_stage_cyc;
>  }
>  
> +static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
> +					size_t size, unsigned int width)
> +{
> +	return repsep_snprintf(bf, size, "%-*u", width,
> +			he->p_stage_cyc * he->stat.nr_events);
> +}
> +
> +
>  static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
>  					size_t size, unsigned int width)
>  {
>  	return repsep_snprintf(bf, size, "%-*u", width, he->p_stage_cyc);
>  }
>  
> -struct sort_entry sort_p_stage_cyc = {
> -	.se_header      = "Pipeline Stage Cycle",
> -	.se_cmp         = sort__global_p_stage_cyc_cmp,
> +struct sort_entry sort_local_p_stage_cyc = {
> +	.se_header      = "Local Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
>  	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
> -	.se_width_idx	= HISTC_P_STAGE_CYC,
> +	.se_width_idx	= HISTC_LOCAL_P_STAGE_CYC,
> +};
> +
> +struct sort_entry sort_global_p_stage_cyc = {
> +	.se_header      = "Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
> +	.se_snprintf    = hist_entry__global_p_stage_cyc_snprintf,
> +	.se_width_idx   = HISTC_GLOBAL_P_STAGE_CYC,
>  };
>  
>  struct sort_entry sort_mem_daddr_sym = {
> @@ -1858,7 +1873,8 @@ static struct sort_dimension common_sort_dimensions[] = {
>  	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>  	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>  	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
> -	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
> +	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", sort_local_p_stage_cyc),
> +	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_global_p_stage_cyc),
>  };
>  
>  #undef DIM
> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
> index 7b7145501933..f994261888e1 100644
> --- a/tools/perf/util/sort.h
> +++ b/tools/perf/util/sort.h
> @@ -235,7 +235,8 @@ enum sort_type {
>  	SORT_CODE_PAGE_SIZE,
>  	SORT_LOCAL_INS_LAT,
>  	SORT_GLOBAL_INS_LAT,
> -	SORT_PIPELINE_STAGE_CYC,
> +	SORT_LOCAL_PIPELINE_STAGE_CYC,
> +	SORT_GLOBAL_PIPELINE_STAGE_CYC,
>  
>  	/* branch stack specific sort keys */
>  	__SORT_BRANCH_STACK,
> -- 
> 2.33.0

-- 

- Arnaldo
