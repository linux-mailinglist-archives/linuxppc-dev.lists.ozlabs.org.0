Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6846CBC5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 04:52:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J83CF4CV2z307x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 14:52:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5oFHdLb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s5oFHdLb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J83BP6TRNz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 14:51:40 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B80bRRK018781; 
 Wed, 8 Dec 2021 03:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=suyl+7p8nK7tF7O3bPVPRgyf4NZ8aeOCkiUGWxM5l1M=;
 b=s5oFHdLbBeVju4CPr9QvMOd955EN2ZQZkDkW0gS46Dlw1yIxKuGmGgBcD90FYh4idFLs
 Q2TISQzFTAwjA1eXgaONKANzGYJUHwABuDKm2Ckv+kBnhBIS4m3vOiwadDjfHFqvTGia
 6E52z0G+dmd4b8SQu/VopzarNaz730Wso/Vfd8Gt7yD1cTzPc+gK6rFNA0BnTCQx6sRi
 Hp/IdMzDY2bKR/z6SiWC0QQrSYR0ireyrkyzcAVNgU17Oh+5xf3SKtDTOIjsrFABdocV
 Ow5nwMTAMKt/pzTgiIjzDoYTrVL/XasvM8qbtTncicOAaZGUAPPnmif6fQTf1yY1/jFa aw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctdn6ftu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:51:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B83hnZD029134;
 Wed, 8 Dec 2021 03:51:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3cqykft8gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:51:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B83pRV330146920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 03:51:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B6E4C046;
 Wed,  8 Dec 2021 03:51:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80B2E4C044;
 Wed,  8 Dec 2021 03:51:25 +0000 (GMT)
Received: from [9.43.89.40] (unknown [9.43.89.40])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Dec 2021 03:51:25 +0000 (GMT)
Message-ID: <afd3af8c-a450-79b2-e678-e07766c5efd1@linux.ibm.com>
Date: Wed, 8 Dec 2021 09:21:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH V2 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
 <Ya91LXxp13Nz3JyC@kernel.org>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <Ya91LXxp13Nz3JyC@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pussbAvTkn1rciXRO5cdWyeTwtzgNrb9
X-Proofpoint-ORIG-GUID: pussbAvTkn1rciXRO5cdWyeTwtzgNrb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_01,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080024
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
 jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/12/21 8:22 pm, Arnaldo Carvalho de Melo wrote:
> Em Fri, Dec 03, 2021 at 07:50:37AM +0530, Athira Rajeev escreveu:
>> Sort key p_stage_cyc is used to present the latency
>> cycles spend in pipeline stages. perf tool has local
>> p_stage_cyc sort key to display this info. There is no
>> global variant available for this sort key. local variant
>> shows latency in a sinlge sample, whereas, global value
>> will be useful to present the total latency (sum of
>> latencies) in the hist entry. It represents latency
>> number multiplied by the number of samples.
>>
>> Add global (p_stage_cyc) and local variant
>> (local_p_stage_cyc) for this sort key. Use the
>> local_p_stage_cyc as default option for "mem" sort mode.
>> Also add this to list of dynamic sort keys and made the
>> "dynamic_headers" and "arch_specific_sort_keys" as static.
>>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reported-by: Namhyung Kim <namhyung@kernel.org>
> 
> I got this for v1, does it stand for v2?
> 
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>


Tested with v2 also.


Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> 
>> ---
>> Changelog:
>> v1 -> v2:
>>   Addressed review comments from Jiri by making the
>>   "dynamic_headers" and "arch_specific_sort_keys"
>>   as static.
>>
>>   tools/perf/util/hist.c |  4 +++-
>>   tools/perf/util/hist.h |  3 ++-
>>   tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
>>   tools/perf/util/sort.h |  3 ++-
>>   4 files changed, 32 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
>> index b776465e04ef..0a8033b09e28 100644
>> --- a/tools/perf/util/hist.c
>> +++ b/tools/perf/util/hist.c
>> @@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
>>   	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
>>   	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
>>   	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
>> -	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
>> +	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
>> +	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
>> +
>>   	if (symbol_conf.nanosecs)
>>   		hists__new_col_len(hists, HISTC_TIME, 16);
>>   	else
>> diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
>> index 621f35ae1efa..2a15e22fb89c 100644
>> --- a/tools/perf/util/hist.h
>> +++ b/tools/perf/util/hist.h
>> @@ -75,7 +75,8 @@ enum hist_column {
>>   	HISTC_MEM_BLOCKED,
>>   	HISTC_LOCAL_INS_LAT,
>>   	HISTC_GLOBAL_INS_LAT,
>> -	HISTC_P_STAGE_CYC,
>> +	HISTC_LOCAL_P_STAGE_CYC,
>> +	HISTC_GLOBAL_P_STAGE_CYC,
>>   	HISTC_NR_COLS, /* Last entry */
>>   };
>>   
>> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
>> index a111065b484e..e417e47f51b9 100644
>> --- a/tools/perf/util/sort.c
>> +++ b/tools/perf/util/sort.c
>> @@ -37,7 +37,7 @@ const char	default_parent_pattern[] = "^sys_|^do_page_fault";
>>   const char	*parent_pattern = default_parent_pattern;
>>   const char	*default_sort_order = "comm,dso,symbol";
>>   const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
>> -const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
>> +const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,local_p_stage_cyc";
>>   const char	default_top_sort_order[] = "dso,symbol";
>>   const char	default_diff_sort_order[] = "dso,symbol";
>>   const char	default_tracepoint_sort_order[] = "trace";
>> @@ -46,8 +46,8 @@ const char	*field_order;
>>   regex_t		ignore_callees_regex;
>>   int		have_ignore_callees = 0;
>>   enum sort_mode	sort__mode = SORT_MODE__NORMAL;
>> -const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
>> -const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
>> +static const char *const dynamic_headers[] = {"local_ins_lat", "ins_lat", "local_p_stage_cyc", "p_stage_cyc"};
>> +static const char *const arch_specific_sort_keys[] = {"local_p_stage_cyc", "p_stage_cyc"};
>>   
>>   /*
>>    * Replaces all occurrences of a char used with the:
>> @@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat = {
>>   };
>>   
>>   static int64_t
>> -sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
>> +sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
>>   {
>>   	return left->p_stage_cyc - right->p_stage_cyc;
>>   }
>>   
>> +static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
>> +					size_t size, unsigned int width)
>> +{
>> +	return repsep_snprintf(bf, size, "%-*u", width,
>> +			he->p_stage_cyc * he->stat.nr_events);
>> +}
>> +
>> +
>>   static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
>>   					size_t size, unsigned int width)
>>   {
>>   	return repsep_snprintf(bf, size, "%-*u", width, he->p_stage_cyc);
>>   }
>>   
>> -struct sort_entry sort_p_stage_cyc = {
>> -	.se_header      = "Pipeline Stage Cycle",
>> -	.se_cmp         = sort__global_p_stage_cyc_cmp,
>> +struct sort_entry sort_local_p_stage_cyc = {
>> +	.se_header      = "Local Pipeline Stage Cycle",
>> +	.se_cmp         = sort__p_stage_cyc_cmp,
>>   	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
>> -	.se_width_idx	= HISTC_P_STAGE_CYC,
>> +	.se_width_idx	= HISTC_LOCAL_P_STAGE_CYC,
>> +};
>> +
>> +struct sort_entry sort_global_p_stage_cyc = {
>> +	.se_header      = "Pipeline Stage Cycle",
>> +	.se_cmp         = sort__p_stage_cyc_cmp,
>> +	.se_snprintf    = hist_entry__global_p_stage_cyc_snprintf,
>> +	.se_width_idx   = HISTC_GLOBAL_P_STAGE_CYC,
>>   };
>>   
>>   struct sort_entry sort_mem_daddr_sym = {
>> @@ -1858,7 +1873,8 @@ static struct sort_dimension common_sort_dimensions[] = {
>>   	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>>   	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>>   	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
>> -	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
>> +	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", sort_local_p_stage_cyc),
>> +	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_global_p_stage_cyc),
>>   };
>>   
>>   #undef DIM
>> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
>> index 7b7145501933..f994261888e1 100644
>> --- a/tools/perf/util/sort.h
>> +++ b/tools/perf/util/sort.h
>> @@ -235,7 +235,8 @@ enum sort_type {
>>   	SORT_CODE_PAGE_SIZE,
>>   	SORT_LOCAL_INS_LAT,
>>   	SORT_GLOBAL_INS_LAT,
>> -	SORT_PIPELINE_STAGE_CYC,
>> +	SORT_LOCAL_PIPELINE_STAGE_CYC,
>> +	SORT_GLOBAL_PIPELINE_STAGE_CYC,
>>   
>>   	/* branch stack specific sort keys */
>>   	__SORT_BRANCH_STACK,
>> -- 
>> 2.33.0
> 

-- 
Thanks and Regards
R.Nageswara Sastry
