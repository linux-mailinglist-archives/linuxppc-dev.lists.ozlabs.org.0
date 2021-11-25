Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3545D5FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 09:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J09Yx0QVkz307B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 19:11:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YFJCakUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YFJCakUQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J09Y8002pz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 19:10:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP7kFdu032389; 
 Thu, 25 Nov 2021 08:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9cjB5HLHy2NWbbXLuGg91mhg+DXmxF5jR2J06YvEPos=;
 b=YFJCakUQtSJcFANmExzuUkpsDiejwDA7TYsDL/zd056OAWP3VXDO/q/YVYZYfh2Xlf04
 fDzqHYWlhPUP+y/hpdqKCCehhvxAWnvS5zyl8cLmJZAfxHSUUbdrmfXmnd5CU2o46FbS
 vIbFtzvhuo/B4UoUnJ8y8PsmmGJ9ACyMYxr1m8jkPnB3AEy7A9Dx/SqROb4g0KYNLHT0
 gxFdRRbW8tbczwvJMOW35LzcnwFnwSVEqvpePjYyKrm6w9w17eOQyTBLICCmyaMrluSS
 EHMAIMYsaXcgUMVEs5Ga4JKpH9kZajAdfh9e3YpVbEC9VqG12g/ypHbwl6aivctqaZo0 VA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj6cx0f72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 08:10:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AP872NI007614;
 Thu, 25 Nov 2021 08:10:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3cernagj8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 08:10:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AP8AMZ830015832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 08:10:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 202C1AE051;
 Thu, 25 Nov 2021 08:10:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18BD5AE045;
 Thu, 25 Nov 2021 08:10:18 +0000 (GMT)
Received: from [9.211.89.4] (unknown [9.211.89.4])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 25 Nov 2021 08:10:17 +0000 (GMT)
Message-ID: <1fe2a580-63db-9098-3b38-d50aeacaca00@linux.ibm.com>
Date: Thu, 25 Nov 2021 13:40:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
References: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YeHGzofgDOFerKPK5dRC2IJkmTlVqoNR
X-Proofpoint-GUID: YeHGzofgDOFerKPK5dRC2IJkmTlVqoNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250043
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
Cc: maddy@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org,
 kjain@linux.ibm.com, namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25/11/21 8:18 am, Athira Rajeev wrote:
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
> Also add this to list of dynamic sort keys.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Namhyung Kim <namhyung@kernel.org>

Tested the patch on Power10 LPAR and could see the required data.

# Overhead       Samples  Command  Shared Object               Symbol 
                              Dispatch Cyc
# ........  ............  .......  .......................... 
....................................  .............
#
      9.41%           156  dd       [kernel.vmlinux]            [k] 
system_call_common                1
      4.91%            82  dd       [kernel.vmlinux]            [k] 
__fget_light                      1
...

# Overhead       Samples  Command  Shared Object               Symbol 
                              Dispatch Cyc   Global Dispatch_cyc
# ........  ............  .......  .......................... 
....................................  .............  ...................
#
      9.41%           156  dd       [kernel.vmlinux]            [k] 
system_call_common                1              156
      4.91%            82  dd       [kernel.vmlinux]            [k] 
__fget_light                      1              82
...

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   tools/perf/util/hist.c |  4 +++-
>   tools/perf/util/hist.h |  3 ++-
>   tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
>   tools/perf/util/sort.h |  3 ++-
>   4 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
> index b776465e04ef..0a8033b09e28 100644
> --- a/tools/perf/util/hist.c
> +++ b/tools/perf/util/hist.c
> @@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
>   	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
>   	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
>   	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
> -	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
> +
>   	if (symbol_conf.nanosecs)
>   		hists__new_col_len(hists, HISTC_TIME, 16);
>   	else
> diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
> index 5343b62476e6..2752ce681108 100644
> --- a/tools/perf/util/hist.h
> +++ b/tools/perf/util/hist.h
> @@ -75,7 +75,8 @@ enum hist_column {
>   	HISTC_MEM_BLOCKED,
>   	HISTC_LOCAL_INS_LAT,
>   	HISTC_GLOBAL_INS_LAT,
> -	HISTC_P_STAGE_CYC,
> +	HISTC_LOCAL_P_STAGE_CYC,
> +	HISTC_GLOBAL_P_STAGE_CYC,
>   	HISTC_NR_COLS, /* Last entry */
>   };
>   
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index e9216a292a04..e978f7883e07 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -37,7 +37,7 @@ const char	default_parent_pattern[] = "^sys_|^do_page_fault";
>   const char	*parent_pattern = default_parent_pattern;
>   const char	*default_sort_order = "comm,dso,symbol";
>   const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
> -const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
> +const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,local_p_stage_cyc";
>   const char	default_top_sort_order[] = "dso,symbol";
>   const char	default_diff_sort_order[] = "dso,symbol";
>   const char	default_tracepoint_sort_order[] = "trace";
> @@ -46,8 +46,8 @@ const char	*field_order;
>   regex_t		ignore_callees_regex;
>   int		have_ignore_callees = 0;
>   enum sort_mode	sort__mode = SORT_MODE__NORMAL;
> -const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
> -const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
> +const char	*dynamic_headers[] = {"local_ins_lat", "ins_lat", "local_p_stage_cyc", "p_stage_cyc"};
> +const char	*arch_specific_sort_keys[] = {"local_p_stage_cyc", "p_stage_cyc"};
>   
>   /*
>    * Replaces all occurrences of a char used with the:
> @@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat = {
>   };
>   
>   static int64_t
> -sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
> +sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
>   {
>   	return left->p_stage_cyc - right->p_stage_cyc;
>   }
>   
> +static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
> +					size_t size, unsigned int width)
> +{
> +	return repsep_snprintf(bf, size, "%-*u", width,
> +			he->p_stage_cyc * he->stat.nr_events);
> +}
> +
> +
>   static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
>   					size_t size, unsigned int width)
>   {
>   	return repsep_snprintf(bf, size, "%-*u", width, he->p_stage_cyc);
>   }
>   
> -struct sort_entry sort_p_stage_cyc = {
> -	.se_header      = "Pipeline Stage Cycle",
> -	.se_cmp         = sort__global_p_stage_cyc_cmp,
> +struct sort_entry sort_local_p_stage_cyc = {
> +	.se_header      = "Local Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
>   	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
> -	.se_width_idx	= HISTC_P_STAGE_CYC,
> +	.se_width_idx	= HISTC_LOCAL_P_STAGE_CYC,
> +};
> +
> +struct sort_entry sort_global_p_stage_cyc = {
> +	.se_header      = "Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
> +	.se_snprintf    = hist_entry__global_p_stage_cyc_snprintf,
> +	.se_width_idx   = HISTC_GLOBAL_P_STAGE_CYC,
>   };
>   
>   struct sort_entry sort_mem_daddr_sym = {
> @@ -1858,7 +1873,8 @@ static struct sort_dimension common_sort_dimensions[] = {
>   	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>   	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>   	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
> -	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
> +	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", sort_local_p_stage_cyc),
> +	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_global_p_stage_cyc),
>   };
>   
>   #undef DIM
> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
> index 3c7518378d62..83abe5e6812a 100644
> --- a/tools/perf/util/sort.h
> +++ b/tools/perf/util/sort.h
> @@ -235,7 +235,8 @@ enum sort_type {
>   	SORT_CODE_PAGE_SIZE,
>   	SORT_LOCAL_INS_LAT,
>   	SORT_GLOBAL_INS_LAT,
> -	SORT_PIPELINE_STAGE_CYC,
> +	SORT_LOCAL_PIPELINE_STAGE_CYC,
> +	SORT_GLOBAL_PIPELINE_STAGE_CYC,
>   
>   	/* branch stack specific sort keys */
>   	__SORT_BRANCH_STACK,
> 

-- 
Thanks and Regards
R.Nageswara Sastry
