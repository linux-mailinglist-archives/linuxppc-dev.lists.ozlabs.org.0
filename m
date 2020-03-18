Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D528189C4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 13:52:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j91g3KtTzDqlR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:52:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j8tb5pBCzDqwH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 23:46:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ICXtwC135294; Wed, 18 Mar 2020 08:46:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7d9h146-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 08:46:26 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02ICY2Sj136053;
 Wed, 18 Mar 2020 08:46:26 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7d9h13w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 08:46:25 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02ICduoF015937;
 Wed, 18 Mar 2020 12:46:25 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 2yrpw70eat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 12:46:25 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02ICkOSr53346610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 12:46:24 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B7F113604F;
 Wed, 18 Mar 2020 12:46:24 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3D8136061;
 Wed, 18 Mar 2020 12:46:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.35.107])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 12:46:00 +0000 (GMT)
Subject: Re: [PATCH v5 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
To: Jiri Olsa <jolsa@redhat.com>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
 <20200317062333.14555-10-kjain@linux.ibm.com> <20200317150647.GA757893@krava>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <15a73fa0-4c94-221f-020d-687f91d08de6@linux.ibm.com>
Date: Wed, 18 Mar 2020 18:15:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200317150647.GA757893@krava>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_05:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180059
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



On 3/17/20 8:36 PM, Jiri Olsa wrote:
> On Tue, Mar 17, 2020 at 11:53:31AM +0530, Kajol Jain wrote:
> 
> SNIP
> 
>> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
>> index 0938ad166ece..7786829b048b 100644
>> --- a/tools/perf/util/expr.h
>> +++ b/tools/perf/util/expr.h
>> @@ -17,12 +17,13 @@ struct expr_parse_ctx {
>>  
>>  struct expr_scanner_ctx {
>>  	int start_token;
>> +	int expr__runtimeparam;
> 
> no need for expr__ prefix in here.. jsut runtime_param

Hi Jiri,
	Will take care for this part.
> 
>> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
>> index 402af3e8d287..85ac6d913782 100644
>> --- a/tools/perf/util/stat-shadow.c
>> +++ b/tools/perf/util/stat-shadow.c
>> @@ -336,7 +336,7 @@ void perf_stat__collect_metric_expr(struct evlist *evsel_list)
>>  		metric_events = counter->metric_events;
>>  		if (!metric_events) {
>>  			if (expr__find_other(counter->metric_expr, counter->name,
>> -						&metric_names, &num_metric_names) < 0)
>> +						&metric_names, &num_metric_names, 1) < 0)
>>  				continue;
>>  
>>  			metric_events = calloc(sizeof(struct evsel *),
>> @@ -777,7 +777,15 @@ static void generic_metric(struct perf_stat_config *config,
>>  	}
>>  
>>  	if (!metric_events[i]) {
>> -		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
>> +		int param = 1;
>> +		if (strstr(metric_expr, "?")) {
>> +			char *tmp = strrchr(metric_name, '_');
>> +
>> +			tmp++;
>> +			param = strtol(tmp, &tmp, 10);
>> +		}
> 
> so, if metric_expr contains '?' you go and search metric_name for '_'
> and use the number after '_' ... ugh.. what's the logic? 
> 
> I understand you create as many metrics as the magic runtime param
> tells you.. but what's the connection to this?
> 
> could you please outline in the changelog or comment the whole scheme
> of how this all should work? like step by step on some simple example?

Sure, will add that part as comment in my next patch series.
So, you are right, basically right now I am trying to create as many metric events
as define by runtime_param.

To do that, I add one loop in function `metricgroup__add_metric_runtime_param`
where, we are actually passing this parameter value as part of `expr__find_other` function
and changing "?" present in metric expression with this value.

And then adding this metric event to the tail of group_list.

As in our json file, there gonna be single metric event, and out of which we are creating
multiple events, I am also merging this value to the original metric name to specify parameter value.

For example,
command:# ./perf stat  -M PowerBUS_Frequency -C 0 -I 1000
#           time             counts unit events
     1.000101867          9,356,933      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
     1.000101867          9,366,134      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
     2.000314878          9,365,868      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
     2.000314878          9,366,092      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1

So, here _0 and _1 after PowerBUS_Frequency specify parameter value.

So, after adding this to group_list, again we call expr__parse in generic_metric function present in
util/stat-display.c. By this time again we need to pass this parameter value. So, now to get this value actually
I am trying to extract it from metric name itself. Not sure if its good way to do that.

Is it sound fine, or should I add param as part of structure evsel as well. So, another way to do that
is adding this parameter in `evsel` structure and also egroup structure. So, I will update this value
in metricgroup.c and access it in stat-shadow?

Thanks,
Kajol
  

> 
> thanks,
> jirka
> 
