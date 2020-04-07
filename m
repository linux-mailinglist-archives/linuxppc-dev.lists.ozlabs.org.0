Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF801A0806
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 09:14:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xJZ96PtWzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 17:14:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xJX50mLxzDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 17:12:52 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03774eje007407; Tue, 7 Apr 2020 03:11:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082pe4myy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 03:11:51 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03774rI9009337;
 Tue, 7 Apr 2020 03:11:51 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082pe4mxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 03:11:51 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0377ARFC026720;
 Tue, 7 Apr 2020 07:11:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 306hv6ur8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 07:11:49 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0377BmJk53936562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 07:11:48 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 877BE124052;
 Tue,  7 Apr 2020 07:11:48 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 424CF124053;
 Tue,  7 Apr 2020 07:11:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.156])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 07:11:39 +0000 (GMT)
Subject: Re: [PATCH v8 1/7] perf expr: Add expr_ prefix for parse_ctx and
 parse_id
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
 <20200401203340.31402-2-kjain@linux.ibm.com>
 <20200406141357.GG29826@kernel.org>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <e9a31950-8223-d68b-068a-ba95a6d6d30f@linux.ibm.com>
Date: Tue, 7 Apr 2020 12:41:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200406141357.GG29826@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070056
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



On 4/6/20 7:43 PM, Arnaldo Carvalho de Melo wrote:
> Em Thu, Apr 02, 2020 at 02:03:34AM +0530, Kajol Jain escreveu:
>> From: Jiri Olsa <jolsa@kernel.org>
>>
>> Adding expr_ prefix for parse_ctx and parse_id,
>> to straighten out the expr* namespace.
>>
>> There's no functional change.
> 
> Next time please add your Signed-off-by: as well when pushing 3rd party
> patches.
> 
> Applied.
> 
> - Arnaldo

Hi Arnaldo,
	Thanks, I will take care of it next time.

Regards,
Kajol
>  
>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
>> ---
>>  tools/perf/tests/expr.c       |  4 ++--
>>  tools/perf/util/expr.c        | 10 +++++-----
>>  tools/perf/util/expr.h        | 12 ++++++------
>>  tools/perf/util/expr.y        |  6 +++---
>>  tools/perf/util/stat-shadow.c |  2 +-
>>  5 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
>> index 28313e59d6f6..ea10fc4412c4 100644
>> --- a/tools/perf/tests/expr.c
>> +++ b/tools/perf/tests/expr.c
>> @@ -6,7 +6,7 @@
>>  #include <string.h>
>>  #include <linux/zalloc.h>
>>  
>> -static int test(struct parse_ctx *ctx, const char *e, double val2)
>> +static int test(struct expr_parse_ctx *ctx, const char *e, double val2)
>>  {
>>  	double val;
>>  
>> @@ -22,7 +22,7 @@ int test__expr(struct test *t __maybe_unused, int subtest __maybe_unused)
>>  	const char **other;
>>  	double val;
>>  	int i, ret;
>> -	struct parse_ctx ctx;
>> +	struct expr_parse_ctx ctx;
>>  	int num_other;
>>  
>>  	expr__ctx_init(&ctx);
>> diff --git a/tools/perf/util/expr.c b/tools/perf/util/expr.c
>> index fd192ddf93c1..c8ccc548a585 100644
>> --- a/tools/perf/util/expr.c
>> +++ b/tools/perf/util/expr.c
>> @@ -11,7 +11,7 @@ extern int expr_debug;
>>  #endif
>>  
>>  /* Caller must make sure id is allocated */
>> -void expr__add_id(struct parse_ctx *ctx, const char *name, double val)
>> +void expr__add_id(struct expr_parse_ctx *ctx, const char *name, double val)
>>  {
>>  	int idx;
>>  
>> @@ -21,13 +21,13 @@ void expr__add_id(struct parse_ctx *ctx, const char *name, double val)
>>  	ctx->ids[idx].val = val;
>>  }
>>  
>> -void expr__ctx_init(struct parse_ctx *ctx)
>> +void expr__ctx_init(struct expr_parse_ctx *ctx)
>>  {
>>  	ctx->num_ids = 0;
>>  }
>>  
>>  static int
>> -__expr__parse(double *val, struct parse_ctx *ctx, const char *expr,
>> +__expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
>>  	      int start)
>>  {
>>  	YY_BUFFER_STATE buffer;
>> @@ -52,7 +52,7 @@ __expr__parse(double *val, struct parse_ctx *ctx, const char *expr,
>>  	return ret;
>>  }
>>  
>> -int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr)
>> +int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr)
>>  {
>>  	return __expr__parse(final_val, ctx, expr, EXPR_PARSE) ? -1 : 0;
>>  }
>> @@ -75,7 +75,7 @@ int expr__find_other(const char *expr, const char *one, const char ***other,
>>  		     int *num_other)
>>  {
>>  	int err, i = 0, j = 0;
>> -	struct parse_ctx ctx;
>> +	struct expr_parse_ctx ctx;
>>  
>>  	expr__ctx_init(&ctx);
>>  	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER);
>> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
>> index 9377538f4097..b9e53f2b5844 100644
>> --- a/tools/perf/util/expr.h
>> +++ b/tools/perf/util/expr.h
>> @@ -5,19 +5,19 @@
>>  #define EXPR_MAX_OTHER 20
>>  #define MAX_PARSE_ID EXPR_MAX_OTHER
>>  
>> -struct parse_id {
>> +struct expr_parse_id {
>>  	const char *name;
>>  	double val;
>>  };
>>  
>> -struct parse_ctx {
>> +struct expr_parse_ctx {
>>  	int num_ids;
>> -	struct parse_id ids[MAX_PARSE_ID];
>> +	struct expr_parse_id ids[MAX_PARSE_ID];
>>  };
>>  
>> -void expr__ctx_init(struct parse_ctx *ctx);
>> -void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
>> -int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr);
>> +void expr__ctx_init(struct expr_parse_ctx *ctx);
>> +void expr__add_id(struct expr_parse_ctx *ctx, const char *id, double val);
>> +int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr);
>>  int expr__find_other(const char *expr, const char *one, const char ***other,
>>  		int *num_other);
>>  
>> diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
>> index 4720cbe79357..cd17486c1c5d 100644
>> --- a/tools/perf/util/expr.y
>> +++ b/tools/perf/util/expr.y
>> @@ -15,7 +15,7 @@
>>  %define api.pure full
>>  
>>  %parse-param { double *final_val }
>> -%parse-param { struct parse_ctx *ctx }
>> +%parse-param { struct expr_parse_ctx *ctx }
>>  %parse-param {void *scanner}
>>  %lex-param {void* scanner}
>>  
>> @@ -39,14 +39,14 @@
>>  
>>  %{
>>  static void expr_error(double *final_val __maybe_unused,
>> -		       struct parse_ctx *ctx __maybe_unused,
>> +		       struct expr_parse_ctx *ctx __maybe_unused,
>>  		       void *scanner,
>>  		       const char *s)
>>  {
>>  	pr_debug("%s\n", s);
>>  }
>>  
>> -static int lookup_id(struct parse_ctx *ctx, char *id, double *val)
>> +static int lookup_id(struct expr_parse_ctx *ctx, char *id, double *val)
>>  {
>>  	int i;
>>  
>> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
>> index 0fd713d3674f..402af3e8d287 100644
>> --- a/tools/perf/util/stat-shadow.c
>> +++ b/tools/perf/util/stat-shadow.c
>> @@ -729,7 +729,7 @@ static void generic_metric(struct perf_stat_config *config,
>>  			   struct runtime_stat *st)
>>  {
>>  	print_metric_t print_metric = out->print_metric;
>> -	struct parse_ctx pctx;
>> +	struct expr_parse_ctx pctx;
>>  	double ratio, scale;
>>  	int i;
>>  	void *ctxp = out->ctx;
>> -- 
>> 2.21.0
>>
> 
