Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72B1828DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 07:17:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dJXF57vTzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 17:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dJVW3GDqzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 17:16:03 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02C69Wbu118839; Thu, 12 Mar 2020 02:13:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqffm0dwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 02:13:13 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02C69Vke118790;
 Thu, 12 Mar 2020 02:12:42 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqffm0cp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 02:12:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02C67Jr1010058;
 Thu, 12 Mar 2020 06:12:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2ypjxs5ghp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 06:12:18 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02C6CHJK57147850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 06:12:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2873F6A051;
 Thu, 12 Mar 2020 06:12:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86A326A04D;
 Thu, 12 Mar 2020 06:11:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.36.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2020 06:11:58 +0000 (GMT)
Subject: Re: [PATCH v4 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309062552.29911-7-kjain@linux.ibm.com>
 <20200310183455.GB12036@kernel.org>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <60bcb39d-36f3-3e73-049a-4c87caafaa03@linux.ibm.com>
Date: Thu, 12 Mar 2020 11:41:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200310183455.GB12036@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_15:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=2 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120032
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/11/20 12:04 AM, Arnaldo Carvalho de Melo wrote:
> Em Mon, Mar 09, 2020 at 11:55:50AM +0530, Kajol Jain escreveu:
>> Patch enhances current metric infrastructure to handle "?" in the metric
>> expression. The "?" can be use for parameters whose value not known while
>> creating metric events and which can be replace later at runtime to
>> the proper value. It also add flexibility to create multiple events out
>> of single metric event added in json file.
>>
>> Patch adds function 'arch_get_runtimeparam' which is a arch specific
>> function, returns the count of metric events need to be created.
>> By default it return 1.
>>
>> One loop is added in function 'metricgroup__add_metric', which create
>> multiple events at run time depend on return value of
>> 'arch_get_runtimeparam' and merge that event in 'group_list'.
>>
>> This infrastructure needed for hv_24x7 socket/chip level events.
>> "hv_24x7" chip level events needs specific chip-id to which the
>> data is requested. Function 'arch_get_runtimeparam' implemented
>> in header.c which extract number of sockets from sysfs file
>> "sockets" under "/sys/devices/hv_24x7/interface/".
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  tools/perf/arch/powerpc/util/header.c |  22 +++++
>>  tools/perf/util/expr.h                |   1 +
>>  tools/perf/util/expr.l                |  19 +++-
>>  tools/perf/util/metricgroup.c         | 124 ++++++++++++++++++++------
>>  tools/perf/util/metricgroup.h         |   1 +
>>  tools/perf/util/stat-shadow.c         |   8 ++
>>  6 files changed, 148 insertions(+), 27 deletions(-)
>>
>> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
>> index 3b4cdfc5efd6..036f6b2ce202 100644
>> --- a/tools/perf/arch/powerpc/util/header.c
>> +++ b/tools/perf/arch/powerpc/util/header.c
>> @@ -7,6 +7,11 @@
>>  #include <string.h>
>>  #include <linux/stringify.h>
>>  #include "header.h"
>> +#include "metricgroup.h"
>> +#include "evlist.h"
>> +#include <dirent.h>
>> +#include "pmu.h"
>> +#include <api/fs/fs.h>
>>  
>>  #define mfspr(rn)       ({unsigned long rval; \
>>  			 asm volatile("mfspr %0," __stringify(rn) \
>> @@ -16,6 +21,8 @@
>>  #define PVR_VER(pvr)    (((pvr) >>  16) & 0xFFFF) /* Version field */
>>  #define PVR_REV(pvr)    (((pvr) >>   0) & 0xFFFF) /* Revison field */
>>  
>> +#define SOCKETS_INFO_FILE_PATH "/devices/hv_24x7/interface/"
>> +
>>  int
>>  get_cpuid(char *buffer, size_t sz)
>>  {
>> @@ -44,3 +51,18 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
>>  
>>  	return bufp;
>>  }
>> +
>> +int arch_get_runtimeparam(void)
>> +{
>> +	int count;
>> +	char path[PATH_MAX];
>> +	char filename[] = "sockets";
>> +
>> +	snprintf(path, PATH_MAX,
>> +		 SOCKETS_INFO_FILE_PATH "%s", filename);
>> +
>> +	if (sysfs__read_ull(path, (unsigned long long *)&count) < 0)
>> +		return 1;
>> +	else
>> +		return count;
> 
> Why this cast dance? We have sysfs__read_int(path, &count).
> 
> Also this is more compact:
> 
> 	return sysfs__read_int(path, &count) < 0 ? 1 : count;

Hi Arnaldo,
     Yes it will be better to use like that.
> 
>> +}
>> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
>> index 9377538f4097..d17664e628db 100644
>> --- a/tools/perf/util/expr.h
>> +++ b/tools/perf/util/expr.h
>> @@ -15,6 +15,7 @@ struct parse_ctx {
>>  	struct parse_id ids[MAX_PARSE_ID];
>>  };
>>  
>> +int expr__runtimeparam;
>>  void expr__ctx_init(struct parse_ctx *ctx);
>>  void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
>>  int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr);
>> diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
>> index 1928f2a3dddc..ec4b00671f67 100644
>> --- a/tools/perf/util/expr.l
>> +++ b/tools/perf/util/expr.l
>> @@ -45,6 +45,21 @@ static char *normalize(char *str)
>>  			*dst++ = '/';
>>  		else if (*str == '\\')
>>  			*dst++ = *++str;
>> +        else if (*str == '?') {
>> +
>> +			int size = snprintf(NULL, 0, "%d", expr__runtimeparam);
> 
> TIL that C99 allows for a NULL str to format and return the number of
> bytes it would write if the string was large enough... wonders never
> cease :-)
> 
>> +			char * paramval = (char *)malloc(size);
> 
> No need for the cast, malloc returns void *, or has that changed? 8-)
> and please no space before the variable name.
> 

Okk, Will take care of that.

> Humm this is all complicated, why not use asprintf and have something
> like:
> 
>> +			int i = 0;
>> +
>> +			if(!paramval)
>> +				*dst++ = '0';
>> +			else {
>> +				sprintf(paramval, "%d", expr__runtimeparam);
>> +				while(i < size)
>> +					*dst++ = paramval[i++];
>> +				free(paramval);
>> +			}
> 
> 			char *paramval;
> 			int size = asprintf(&paramval, "%d", expr__runtimeparam);
> 
> 			if (size < 0)
> 				*dst++ = '0';
> 			else {
> 				while (i < size)
> 					*dst++ = paramval[i++];
> 				free(paramval);
> 			}
> 
> 
>> +		}
>>  		else
>>  			*dst++ = *str;
>>  		str++;
>> @@ -72,8 +87,8 @@ number		[0-9]+
>>  
>>  sch		[-,=]
>>  spec		\\{sch}
>> -sym		[0-9a-zA-Z_\.:@]+
>> -symbol		{spec}*{sym}*{spec}*{sym}*
>> +sym		[0-9a-zA-Z_\.:@?]+
>> +symbol		{spec}*{sym}*{spec}*{sym}*{spec}*{sym}
>>  
>>  %%
>>  	{
>> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
>> index c3a8c701609a..11eeeb929b91 100644
>> --- a/tools/perf/util/metricgroup.c
>> +++ b/tools/perf/util/metricgroup.c
>> @@ -474,6 +474,98 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
>>  	return false;
>>  }
>>  
>> +int __weak arch_get_runtimeparam(void)
>> +{
>> +	return 1;
>> +}
>> +
>> +static int metricgroup__add_metric_runtime_param(struct strbuf *events,
>> +			struct list_head *group_list, struct pmu_event *pe)
>> +{
>> +	int i, count;
>> +	int ret = -EINVAL;
>> +
>> +	count = arch_get_runtimeparam();
>> +
>> +	/* This loop is added to create multiple
>> +	 * events depend on count value and add
>> +	 * those events to group_list.
>> +	 */
>> +
>> +	for (i = 0; i < count; i++) {
>> +		const char **ids;
>> +		int idnum;
>> +		struct egroup *eg;
>> +		char value[PATH_MAX];
>> +
>> +		expr__runtimeparam = i;
>> +
>> +		if (expr__find_other(pe->metric_expr,
>> +					NULL, &ids, &idnum) < 0)
>> +			return ret;
>> +
>> +		if (events->len > 0)
>> +			strbuf_addf(events, ",");
>> +
>> +		if (metricgroup__has_constraint(pe))
>> +			metricgroup__add_metric_non_group(events, ids, idnum);
>> +		else
>> +			metricgroup__add_metric_weak_group(events, ids, idnum);
>> +
>> +		eg = malloc(sizeof(struct egroup));
> 
> Shorter form that works even if you change that type:
> 
> +		eg = malloc(sizeof(*eg));
> 
>> +		if (!eg) {
>> +			ret = -ENOMEM;
>> +			return ret;
>> +		}
>> +		sprintf(value, "%s%c%d", pe->metric_name, '_', i);
>> +		eg->ids = ids;
>> +		eg->idnum = idnum;
>> +		eg->metric_name = strdup(value);
> 
> Please check strdup() return just like you checked the malloc(sizeof(struct egroup)).

Right, I missed that part, will update it.

> 
>> +		eg->metric_expr = pe->metric_expr;
>> +		eg->metric_unit = pe->unit;
>> +		list_add_tail(&eg->nd, group_list);
>> +		ret = 0;
>> +
>> +		if (ret != 0)
>> +			break;
>> +	}
>> +	return ret;
>> +}
>> +static int metricgroup__add_metric_param(struct strbuf *events,
>> +			struct list_head *group_list, struct pmu_event *pe)
>> +{
>> +
>> +	const char **ids;
>> +	int idnum;
>> +	struct egroup *eg;
>> +	int ret = -EINVAL;
>> +
>> +	if (expr__find_other(pe->metric_expr,
>> +					     NULL, &ids, &idnum) < 0)
> 
> Why break the above in two lines?
> 
>> +		return ret;
>> +	if (events->len > 0)
>> +		strbuf_addf(events, ",");
>> +
>> +	if (metricgroup__has_constraint(pe))
>> +		metricgroup__add_metric_non_group(events, ids, idnum);
>> +	else
>> +		metricgroup__add_metric_weak_group(events, ids, idnum);
>> +
>> +	eg = malloc(sizeof(struct egroup));
> 
> Ditto
> 
>> +	if (!eg)
>> +		ret = -ENOMEM;
>> +
>> +	eg->ids = ids;
>> +	eg->idnum = idnum;
>> +	eg->metric_name = pe->metric_name;
>> +	eg->metric_expr = pe->metric_expr;
>> +	eg->metric_unit = pe->unit;
>> +	list_add_tail(&eg->nd, group_list);
>> +	ret = 0;
>> +
>> +	return ret;
>> +}
>> +
>>  static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>>  				   struct list_head *group_list)
>>  {
>> @@ -493,35 +585,17 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>>  			continue;
>>  		if (match_metric(pe->metric_group, metric) ||
>>  		    match_metric(pe->metric_name, metric)) {
>> -			const char **ids;
>> -			int idnum;
>> -			struct egroup *eg;
>>  
>>  			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
>>  
>> -			if (expr__find_other(pe->metric_expr,
>> -					     NULL, &ids, &idnum) < 0)
>> -				continue;
>> -			if (events->len > 0)
>> -				strbuf_addf(events, ",");
>> -
>> -			if (metricgroup__has_constraint(pe))
>> -				metricgroup__add_metric_non_group(events, ids, idnum);
>> +			if (strstr(pe->metric_expr, "?"))
>> +				ret = metricgroup__add_metric_runtime_param(events,
>> +							group_list, pe);
>>  			else
>> -				metricgroup__add_metric_weak_group(events, ids, idnum);
>> -
>> -			eg = malloc(sizeof(struct egroup));
> 
>                                              *eg
>> -			if (!eg) {
>> -				ret = -ENOMEM;
>> -				break;
>> -			}
>> -			eg->ids = ids;
>> -			eg->idnum = idnum;
>> -			eg->metric_name = pe->metric_name;
>> -			eg->metric_expr = pe->metric_expr;
>> -			eg->metric_unit = pe->unit;
>> -			list_add_tail(&eg->nd, group_list);
>> -			ret = 0;
>> +				ret = metricgroup__add_metric_param(events,
>> +							group_list, pe);
>> +			if (ret == -EINVAL)
>> +				continue;
>>  		}
>>  	}
>>  	return ret;
>> diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
>> index 475c7f912864..81224ba1270d 100644
>> --- a/tools/perf/util/metricgroup.h
>> +++ b/tools/perf/util/metricgroup.h
>> @@ -34,4 +34,5 @@ int metricgroup__parse_groups(const struct option *opt,
>>  void metricgroup__print(bool metrics, bool groups, char *filter,
>>  			bool raw, bool details);
>>  bool metricgroup__has_metric(const char *metric);
>> +int arch_get_runtimeparam(void);
>>  #endif
>> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
>> index 0fd713d3674f..92c4c9abbaa0 100644
>> --- a/tools/perf/util/stat-shadow.c
>> +++ b/tools/perf/util/stat-shadow.c
>> @@ -777,6 +777,14 @@ static void generic_metric(struct perf_stat_config *config,
>>  	}
>>  
>>  	if (!metric_events[i]) {
>> +
>> +		if (strstr(metric_expr, "?")) {
>> +			char *tmp = strrchr(metric_name, '_');
>> +
> 
> So at this point a metric name is guaranteed to have a _?

Yes, because we are appending '_' with parameter value in metric name
when we adding these events in 'group_list'. So, I added it, because
we can have multiple values of that runtime_parameter, so by appending it
in metric name, we can understand to which event the counter data belongs.
Thanks for reviewing the patch, I will send updated patch.

Thanks,
Kajol
> 
>> +			tmp++;
>> +			expr__runtimeparam = strtol(tmp, &tmp, 10);
>> +		}
>> +
>>  		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
>>  			char *unit;
>>  			char metric_bf[64];
>> -- 
>> 2.18.1
>>
> 
