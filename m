Return-Path: <linuxppc-dev+bounces-8133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1171AA01AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 07:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmpN32M7fz3050;
	Tue, 29 Apr 2025 15:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745903539;
	cv=none; b=P8hkMJtvSwcx0Q5wU1gmacaRVrsC12H1VZ6qVMBt7JCiBV41DtpX9+yxh+XM/RbH+8vB00/E8JeanrEkJcZ8FEIgUK8dm3CPSk+6e3lTqgmksaNX2eC+nnMHZaFJxfXKSL2uUBwk0llmKlM50+/FF37adOlllOPshSimF5Kr3+a/oohZnxX7sQ2CQ1+RYNdpASojzD9Lbt/zkN45X4QsEE5GNHXtES2qZ3mXQYVWqAZCDwcI7Q14IZHsrJvVsjU9K3fB7QKT/In/KMC+c6jDo7WvPLY8tt2as0QSoMoIKustMtQVTX77kLcGRhAaU/Dw1kX2Z2mi36J5LD+lJv904g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745903539; c=relaxed/relaxed;
	bh=hOwTz0BxlJ4QAgmS44LEL0RWzQlwr32IjUrntFNmUvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/MkFRO2mSbBLZypwuBQLYKVwOikTTQsp4pE3YRX0mae9r1H9sRDn+wOQeB4bymZmfaOInJps6/MvAfNaHH/gtFmNVVp2BDC2FH1O0KjldU5Z4K9eLAHtd9bPFxYdwhyGtbBNAGjh3uw9cXKePmjntVS4UzR3P/qFcdgwn8OTm5BXOXcEgqsnS7OuQ90bg4tdEDi5JRuMrcijEunUbrLsfOBsbf+RGB06c3kFBtVSrOU0Nahz9h0ZAwyD5KrPtODrNTFHAHMyJ84xnBFxnISTElv9RfUDEyrbdDm0RAiK+oyIcdB2dT9XL5TsEkBSYfQ0gkHerd1dMaeCWAyn7vXPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUEQ7JuN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUEQ7JuN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmpN12rytz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 15:12:16 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4EOKW028151;
	Tue, 29 Apr 2025 05:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hOwTz0
	BxlJ4QAgmS44LEL0RWzQlwr32IjUrntFNmUvE=; b=NUEQ7JuNgIe1WNtYmhq8Jx
	/URxZg5hfBdjpKOrllPpH9z5LuTNE8xJCEW1axaOFPe9sM8lChf46oYxgPV7ahMn
	JG19nQ2ku9dFGn6kUYWyO/WSWCWKykC/X5914AsySTH9PK1BMzvolhv6Wt4x2DPn
	NdGAuqg5NrKq4u6h0WQp8eYx1Q9nhGguSvRyzgchlQEhQ4LXqWVoSCmt01/3iut/
	PYzolTOFBJlQyLNrKQsPTHt8nl951BI5ye/USajTNyrXJei7RmiRVC6+PgX9QLcS
	7H/Swr8cAhps11UEYmLb2nI5xWoXFapeDzOM3zaq11/Q7bRc3LY4m5yesbpd3jMw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ah8m9djk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:12:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53T56DLw001662;
	Tue, 29 Apr 2025 05:12:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ah8m9djf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:12:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1BQ4s024679;
	Tue, 29 Apr 2025 05:12:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m1gtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:12:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53T5BxAJ34013798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 05:11:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 298BC20040;
	Tue, 29 Apr 2025 05:11:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71E8720043;
	Tue, 29 Apr 2025 05:11:57 +0000 (GMT)
Received: from [9.199.192.254] (unknown [9.199.192.254])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 05:11:57 +0000 (GMT)
Message-ID: <780bee9f-081d-4d40-b82d-8fd6727f9433@linux.ibm.com>
Date: Tue, 29 Apr 2025 10:41:56 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
 <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com> <aAvKg8K2fyrZ6zy4@x1>
Content-Language: en-US
From: Likhitha Korrapati <likhitha@linux.ibm.com>
In-Reply-To: <aAvKg8K2fyrZ6zy4@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AZWN7fMJg5JATrtyL13CAj3liSirK_K-
X-Proofpoint-GUID: gvTb79_l8ijvR9FbLk3gxylnZM4snZEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzNyBTYWx0ZWRfX/ivTIJqqZHM/ JcVJBRCTp+DO362b2sZEWxEx4Bi86FLIzElUy/d2yOOvWQwJoTvyragcuVjoBqa+iLdBTwdJepa 1IMju1S7Xcn8Ycu63vAWQ8akwunYoGNBzkKIpKeNT6/6WN+SMmDpG0aBnvZv/qjjWCi6W/KetHT
 oYm6GW84xj9F5IAd8ZvSTxV/vcXvLcF0O8ZZnEo+gqtQ09rHmJMHtsuhXttpXSsLitxoDXcD/cI XrdqEG0+cTYQVRCr+exyGgwWbrZdx2g2EN+euCWENZBhqzzU9zPjQBuD7utEZlrdObxFwLfI0Nm DfyM/sA27dYyw7rQRw08/1c1TmaCbfzbNeeWlVjV8Sqld60WjHxZON+hnSXLlnCrLTV+obQRwMH
 XE3cJn+FhQnWPCec8WFRa7tdnUIycu1JB95LkZR1VTay18MUzQf5cEqYyeaScsUMQRHcQtlZ
X-Authority-Analysis: v=2.4 cv=QNRoRhLL c=1 sm=1 tr=0 ts=68105fa4 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=8XcPMh4SkUfmyqR2tSwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnaldo,

On 4/25/25 23:16, Arnaldo Carvalho de Melo wrote:
> On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
>>> On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>>> On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
>>>> On 07/04/25 12:10 am, Athira Rajeev wrote:
>>>>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <likhitha@linux.ibm.com> wrote:
> 
>>>>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>>>>>> with the following error.
> 
>>>>>> cpumap.c: In function 'perf_cpu_map__merge':
>>>>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>>>>>>    414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>>>>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> In file included from cpumap.c:4:
>>>>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>>>>>>    672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>>>>>>        |              ^~~~~~
>>>>>> cc1: all warnings being treated as errors
> 
>>>>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>>>>>> Even though git-bisect pointed bad commit as:
>>>>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
>>>>>> issue is with tmp_len being "int". It holds number of cpus and making
>>>>>> it "unsigned int" fixes the issues.
> 
>>>>>> After the fix:
> 
>>>>>>    CC      util/pmu-flex.o
>>>>>>    CC      util/expr-flex.o
>>>>>>    LD      util/perf-util-in.o
>>>>>>    LD      perf-util-in.o
>>>>>>    AR      libperf-util.a
>>>>>>    LINK    perf
>>>>>>    GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
> 
>>>>>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
>>>>> Looks good to me
> 
>>>>> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>
> 
>>>> Tested this patch on perf-tools-next repo, and this patch fixes the issue.
> 
>>>> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
>>> Arnaldo, Namhyung,
> 
>>> can you consider pulling this fix? since it is breaking the build in gcc13-3 or
>>> if you have any comments do let us know.
> 
> This isn't the only place in that file where this pattern exists:
> 
> ⬢ [acme@toolbx perf-tools-next]$ grep malloc tools/lib/perf/cpumap.c
> 	cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
> 	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> ⬢ [acme@toolbx perf-tools-next]$
> 
> 
> struct perf_cpu_map *perf_cpu_map__alloc(int nr_cpus)
> {
>          RC_STRUCT(perf_cpu_map) *cpus;
>          struct perf_cpu_map *result;
> 
>          if (nr_cpus == 0)
>                  return NULL;
> 
>          cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
> 
> 
> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
> {
>          struct perf_cpu *tmp_cpus;
>          int tmp_len;
>          int i, j, k;
>          struct perf_cpu_map *merged;
> 
>          if (perf_cpu_map__is_subset(*orig, other))
>                  return 0;
>          if (perf_cpu_map__is_subset(other, *orig)) {
>                  perf_cpu_map__put(*orig);
>                  *orig = perf_cpu_map__get(other);
>                  return 0;
>          }
> 
>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>          tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 
> 
> struct perf_cpu_map *perf_cpu_map__intersect(struct perf_cpu_map *orig,
>                                               struct perf_cpu_map *other)
> {
>          struct perf_cpu *tmp_cpus;
>          int tmp_len;
>          int i, j, k;
>          struct perf_cpu_map *merged = NULL;
> 
>          if (perf_cpu_map__is_subset(other, orig))
>                  return perf_cpu_map__get(orig);
>          if (perf_cpu_map__is_subset(orig, other))
>                  return perf_cpu_map__get(other);
> 
>          tmp_len = max(__perf_cpu_map__nr(orig), __perf_cpu_map__nr(other));
>          tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 
> I'm trying to figure out why its only in perf_cpu_map__merge() that this
> triggers :-\
> 
> Maybe that max() call in perf_cpu_map__intersect() somehow makes the
> compiler happy.
> 
> And in perf_cpu_map__alloc() all calls seems to validate it.
> 
> But wouldn't turning this into a calloc() be better?

I have tried using calloc() instead of malloc() and the issue still 
exists even using calloc().

cpumap.c: In function ‘perf_cpu_map__merge’:
cpumap.c:414:20: error: argument 1 range [18446744071562067968, 
18446744073709551615] exceeds maximum object size 9223372036854775807 
[-Werror=alloc-size-larger-than=]

   414 |         tmp_cpus = calloc(tmp_len , sizeof(struct perf_cpu));

> 
> Like:
> 
> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
> index 4454a5987570cfbc..99d21618a252ac0e 100644
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>          }
>   
>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
> -       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> +       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
>          if (!tmp_cpus)
>                  return -ENOMEM;
>   
> ⬢ [acme@toolbx perf-tools-next]$
> 
> 
> And better, do the max size that the compiler is trying to help us
> catch?
> 
> - Arnaldo
I have tried using max and it worked. I am doing testing with this 
change and will be posting a V2.

Thanks
Likhitha

