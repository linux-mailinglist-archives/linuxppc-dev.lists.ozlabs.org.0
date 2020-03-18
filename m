Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883F189AE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 12:44:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j7W148tYzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:44:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j7Sp2jhyzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 22:42:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IBXlZx110838; Wed, 18 Mar 2020 07:41:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8brdgdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 07:41:24 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02IBYMRW113727;
 Wed, 18 Mar 2020 07:41:23 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8brdgd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 07:41:23 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02IBePNu012022;
 Wed, 18 Mar 2020 11:41:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2yrpw7048t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:41:22 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IBfKQN52888044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 11:41:20 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA768136053;
 Wed, 18 Mar 2020 11:41:20 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D22513604F;
 Wed, 18 Mar 2020 11:41:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.35.107])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 11:41:06 +0000 (GMT)
Subject: Re: [PATCH v5 08/11] perf/tools: Refactoring metricgroup__add_metric
 function
To: Jiri Olsa <jolsa@redhat.com>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
 <20200317062333.14555-9-kjain@linux.ibm.com> <20200317150945.GC757893@krava>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <8597c6e5-d604-e60d-e666-3420b20bd3fc@linux.ibm.com>
Date: Wed, 18 Mar 2020 17:11:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200317150945.GC757893@krava>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_05:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180058
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
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/20 8:39 PM, Jiri Olsa wrote:
> On Tue, Mar 17, 2020 at 11:53:30AM +0530, Kajol Jain wrote:
>> This patch refactor metricgroup__add_metric function where
>> some part of it move to function metricgroup__add_metric_param.
>> No logic change.
> 
> can't compile this change:
> 
> [jolsa@krava perf]$ make JOBS=1
>   BUILD:   Doing 'make -j1' parallel build
>   CC       util/metricgroup.o
> util/metricgroup.c: In function ‘metricgroup__add_metric_param’:
> util/metricgroup.c:486:6: error: too many arguments to function ‘expr__find_other’
>   486 |  if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, 1) < 0)
>       |      ^~~~~~~~~~~~~~~~
> In file included from util/metricgroup.c:14:
> util/expr.h:25:5: note: declared here
>    25 | int expr__find_other(const char *expr, const char *one, const char ***other,
>       |     ^~~~~~~~~~~~~~~~
> mv: cannot stat 'util/.metricgroup.o.tmp': No such file or directory
> make[4]: *** [/home/jolsa/kernel/linux-perf/tools/build/Makefile.build:97: util/metricgroup.o] Error 1
> make[3]: *** [/home/jolsa/kernel/linux-perf/tools/build/Makefile.build:139: util] Error 2
> make[2]: *** [Makefile.perf:616: perf-in.o] Error 2
> make[1]: *** [Makefile.perf:225: sub-make] Error 2
> make: *** [Makefile:70: all] Error 2

Hi Jiri,
      I made a mistake while arranging the patches in the series. I'll re-arrange it
and send it again.

Thanks,
Kajol

> 
> jirka
> 
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  tools/perf/util/metricgroup.c | 63 +++++++++++++++++++++--------------
>>  1 file changed, 38 insertions(+), 25 deletions(-)
>>
>> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
>> index c3a8c701609a..b4919bcfbd8b 100644
>> --- a/tools/perf/util/metricgroup.c
>> +++ b/tools/perf/util/metricgroup.c
>> @@ -474,6 +474,41 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
>>  	return false;
>>  }
>>  
>> +static int metricgroup__add_metric_param(struct strbuf *events,
>> +			struct list_head *group_list, struct pmu_event *pe)
>> +{
>> +
>> +	const char **ids;
>> +	int idnum;
>> +	struct egroup *eg;
>> +	int ret = -EINVAL;
>> +
>> +	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, 1) < 0)
>> +		return ret;
>> +
>> +	if (events->len > 0)
>> +		strbuf_addf(events, ",");
>> +
>> +	if (metricgroup__has_constraint(pe))
>> +		metricgroup__add_metric_non_group(events, ids, idnum);
>> +	else
>> +		metricgroup__add_metric_weak_group(events, ids, idnum);
>> +
>> +	eg = malloc(sizeof(*eg));
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
>> @@ -493,35 +528,13 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
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
>> +			ret = metricgroup__add_metric_param(events,
>> +							group_list, pe);
>> +			if (ret == -EINVAL)
>>  				continue;
>> -			if (events->len > 0)
>> -				strbuf_addf(events, ",");
>> -
>> -			if (metricgroup__has_constraint(pe))
>> -				metricgroup__add_metric_non_group(events, ids, idnum);
>> -			else
>> -				metricgroup__add_metric_weak_group(events, ids, idnum);
>> -
>> -			eg = malloc(sizeof(struct egroup));
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
>>  		}
>>  	}
>>  	return ret;
>> -- 
>> 2.18.1
>>
> 
