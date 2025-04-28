Return-Path: <linuxppc-dev+bounces-8113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41221A9F57F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 18:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmTDg5MsMz30Bd;
	Tue, 29 Apr 2025 02:19:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745857187;
	cv=none; b=axegA5xBdH1MFE9q0H6vEQGZIkhFmEyJ42X6UDPwyF2eqf0CHlEdU773PwOTWhdh+3OZEO1fv2u5TI+A3HLq4xuivokiYP62gPktFpWEIMVY2DdpJIw31Qw497wsdv/XML1ttR3ESFPpuBGB/i8nWFcdsWcrja8SEYYiF3NNtZNrO348/KKDL9jTxgdW6JzQv32A5/9Y3wThY5qKQ3gyxDm2OegcPG+JvuHTVPus13EjmOrhsvIRFPRJALJT3Etb3WbY9HMWH1BSl47ATqjrCAYWSW8fuDfwBk6PWm1LIrGxM2KNLjYbgXzj97x8egv6GVWT5EKQJp3lFVtN3Cg2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745857187; c=relaxed/relaxed;
	bh=HGDLC+/tq49HxW9x1W2He+6J9oR5+LubazIU6IB7AU8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=n52BwRuWoG47E9ZRhIRWnn0ISMltr/dwklckIvhy3Gmc/61Vclvl7vp9gW7NRj/50iFEJMgq6l2qQgxmvJyEv0LRhmkZ7PbN+Dr9Q5kDZ0KZP59ahS4t2znASnGBWR+AkDb5J2GCUQS4G8EOmI2VM1PDtZMPApxRYEJylvwb0z4ITAZOGQXq718W2CiKT188P/z2f9b8Uyl+ueOFWQ1yK12zFGdD8DlU8Mtcl4dzj5OyaZROp6I6FWSETJW7JDX5TZiOlkw1Xk/lr1kS3/Mj3E0CEMe0PKGE+xRZpajL7YaHimnYLwIUWbYOk44ulcgLsb/lfAkL0TYB0jHVpllDnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q3egqc6U; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q3egqc6U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmTDf6Mhlz301N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 02:19:46 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SG4EpT028559;
	Mon, 28 Apr 2025 16:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=HGDLC+/tq49HxW9x1W2He+6J9oR5+L
	ubazIU6IB7AU8=; b=q3egqc6Udjk615xUN5323Ozu3bd59SxRvVaTS9/a7hX9tX
	B2ZviWqN1PD7icAQV8xbj0TruPrV2wkcpLx2OEYPEf/i2MIWp91Y8rMMfvU0EM1w
	S1OEXZ5nTWAWmEaU9hbgTuRlSCUVVYOPFgs/Nd8ZH13NHw4R45V2oWKd3e5hpD4L
	XDeYLNwwlmaVRAByUqKPtVrrnNsc+hpV1Y4sL3WB9+g9UGFuev6KNCytfaqTVV26
	76TdYppb0e+woa6SRIe50k5XgH1A4Bx+npLjgpDmCiPp71+e4n9JtMH4xJmv857f
	w3hK0wcrKR2np2ZCm7yGqTxXSgfkhITx3UMa3hwQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a7kk1t28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 16:19:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SGI5gU031323;
	Mon, 28 Apr 2025 16:19:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a7kk1t1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 16:19:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SES6v5031680;
	Mon, 28 Apr 2025 16:19:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699ttydc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 16:19:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SGJZ7o55116168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 16:19:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23E9D20040;
	Mon, 28 Apr 2025 16:19:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAF0720043;
	Mon, 28 Apr 2025 16:19:32 +0000 (GMT)
Received: from [9.124.218.94] (unknown [9.124.218.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 16:19:32 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------18jLi2f98JgDE8yCyKeVQWdw"
Message-ID: <41240a0b-c5d2-40b7-8be8-0f474337be53@linux.ibm.com>
Date: Mon, 28 Apr 2025 21:49:31 +0530
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OYSYDgTY c=1 sm=1 tr=0 ts=680faa9c cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VnNF1IyMAAAA:8 a=35VNYtWOVUhRdQnF18oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VvooFKkyQ5mZQGuT1OcA:9 a=BAfxYNigShONFzd-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: G1NHXDCDEHLzZy2DUZXoN7H7JNnk9jor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX6WRB6OAQ0I+u I8Fplcb5eGFdxkEbZWOwSFp+yaHzlLarCi3qiKqpHV/AL2KIcnNJ9FKOKQksfneYhYCot5s090H fS4lY5tvioVkVluTr7ZLOqLZipKRZmnpTNsw+/hJ49RvMvmAQf50McVMNKiWr+bIHZ7jXpGvbwa
 /vLyYe/WfLKLBhZq/mhC7bzBFSZeuECDxOEcW8qJ+HhYZxTC7nalb1mqZZcwEBohecmUFvIw3VI b95QXx3NtbCgygWKzdtE21H7vXSspTBLzXAUTNuoCn80Hx5+kT0pnQ/6dNV//Vwcx2WC4tRbrex LnjXexV+FZ57EVgLyscXlIKrWwL19TY/iG09c3wDDxHwVrHvxUoaGglhXfjFsYOFy9xNcyskFJK
 fBQ1v8w7seJuPPA2DXcfg2cOatSoqizvrBi87H6HSTt2vCRfOG2wE+ingI/TUQs+AwIjMK71
X-Proofpoint-ORIG-GUID: tsyY2n3w8uXGEjMkKt9Kvu2RwwOmKLD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------18jLi2f98JgDE8yCyKeVQWdw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnaldo,

On 4/25/25 23:16, Arnaldo Carvalho de Melo wrote:
> On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
>>> On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan<maddy@linux.ibm.com> wrote:
>>> On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
>>>> On 07/04/25 12:10 am, Athira Rajeev wrote:
>>>>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati<likhitha@linux.ibm.com> wrote:
>>>>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>>>>>> with the following error.
>>>>>> cpumap.c: In function 'perf_cpu_map__merge':
>>>>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>>>>>>    414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>>>>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> In file included from cpumap.c:4:
>>>>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>>>>>>    672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>>>>>>        |              ^~~~~~
>>>>>> cc1: all warnings being treated as errors
>>>>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>>>>>> Even though git-bisect pointed bad commit as:
>>>>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
>>>>>> issue is with tmp_len being "int". It holds number of cpus and making
>>>>>> it "unsigned int" fixes the issues.
>>>>>> After the fix:
>>>>>>    CC      util/pmu-flex.o
>>>>>>    CC      util/expr-flex.o
>>>>>>    LD      util/perf-util-in.o
>>>>>>    LD      perf-util-in.o
>>>>>>    AR      libperf-util.a
>>>>>>    LINK    perf
>>>>>>    GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>>>>>> Signed-off-by: Likhitha Korrapati<likhitha@linux.ibm.com>
>>>>> Looks good to me
>>>>> Reviewed-by: Athira Rajeev<atrajeev@linux.ibm.com>
>>>> Tested this patch on perf-tools-next repo, and this patch fixes the issue.
>>>> Tested-by: Venkat Rao Bagalkote<venkat88@linux.ibm.com>
>>> Arnaldo, Namhyung,
>>> can you consider pulling this fix? since it is breaking the build in gcc13-3 or
>>> if you have any comments do let us know.
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
exists even using calloc(). cpumap.c: In function ‘perf_cpu_map__merge’:

cpumap.c:414:20: error: argument 1 range [18446744071562067968, 
18446744073709551615] exceeds maximum object size 9223372036854775807 
[-Werror=alloc-size-larger-than=]

414 | tmp_cpus = calloc(tmp_len , sizeof(struct perf_cpu));
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
I have tried using max and it compiles with that. I am doing testing 
with this change and will be posting a V2.

Thanks

Likhitha
--------------18jLi2f98JgDE8yCyKeVQWdw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Arnaldo,</font><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/25 23:16, Arnaldo Carvalho de
      Melo wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aAvKg8K2fyrZ6zy4@x1">
      <pre wrap="" class="moz-quote-pre">On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a> wrote:
On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 07/04/25 12:10 am, Athira Rajeev wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <a class="moz-txt-link-rfc2396E" href="mailto:likhitha@linux.ibm.com">&lt;likhitha@linux.ibm.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">perf build break observed when using gcc 13-3 (FC39 ppc64le)
with the following error.
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">cpumap.c: In function 'perf_cpu_map__merge':
cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
  414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from cpumap.c:4:
/usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
  672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
      |              ^~~~~~
cc1: all warnings being treated as errors
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Error happens to be only in gcc13-3 and not in latest gcc 14.
Even though git-bisect pointed bad commit as:
'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
issue is with tmp_len being "int". It holds number of cpus and making
it "unsigned int" fixes the issues.
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">After the fix:
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">  CC      util/pmu-flex.o
  CC      util/expr-flex.o
  LD      util/perf-util-in.o
  LD      perf-util-in.o
  AR      libperf-util.a
  LINK    perf
  GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Signed-off-by: Likhitha Korrapati <a class="moz-txt-link-rfc2396E" href="mailto:likhitha@linux.ibm.com">&lt;likhitha@linux.ibm.com&gt;</a>
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Looks good to me
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Reviewed-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.ibm.com">&lt;atrajeev@linux.ibm.com&gt;</a>
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Tested this patch on perf-tools-next repo, and this patch fixes the issue.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Tested-by: Venkat Rao Bagalkote <a class="moz-txt-link-rfc2396E" href="mailto:venkat88@linux.ibm.com">&lt;venkat88@linux.ibm.com&gt;</a>
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Arnaldo, Namhyung,
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">can you consider pulling this fix? since it is breaking the build in gcc13-3 or
if you have any comments do let us know.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This isn't the only place in that file where this pattern exists:

⬢ [acme@toolbx perf-tools-next]$ grep malloc tools/lib/perf/cpumap.c 
	cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
⬢ [acme@toolbx perf-tools-next]$


struct perf_cpu_map *perf_cpu_map__alloc(int nr_cpus)
{
        RC_STRUCT(perf_cpu_map) *cpus;
        struct perf_cpu_map *result;

        if (nr_cpus == 0)
                return NULL;

        cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);


int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
{
        struct perf_cpu *tmp_cpus;
        int tmp_len;
        int i, j, k;
        struct perf_cpu_map *merged;

        if (perf_cpu_map__is_subset(*orig, other))
                return 0;
        if (perf_cpu_map__is_subset(other, *orig)) {
                perf_cpu_map__put(*orig);
                *orig = perf_cpu_map__get(other);
                return 0;
        }

        tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
        tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));


struct perf_cpu_map *perf_cpu_map__intersect(struct perf_cpu_map *orig,
                                             struct perf_cpu_map *other)
{
        struct perf_cpu *tmp_cpus;
        int tmp_len;
        int i, j, k;
        struct perf_cpu_map *merged = NULL;

        if (perf_cpu_map__is_subset(other, orig))
                return perf_cpu_map__get(orig);
        if (perf_cpu_map__is_subset(orig, other))
                return perf_cpu_map__get(other);

        tmp_len = max(__perf_cpu_map__nr(orig), __perf_cpu_map__nr(other));
        tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));

I'm trying to figure out why its only in perf_cpu_map__merge() that this
triggers :-\

Maybe that max() call in perf_cpu_map__intersect() somehow makes the
compiler happy.

And in perf_cpu_map__alloc() all calls seems to validate it.

But wouldn't turning this into a calloc() be better?</pre>
    </blockquote>
    <font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I have tried using calloc() instead of malloc() and the issue still exists even using calloc().
cpumap.c: In function ‘perf_cpu_map__merge’:
</span></font>
    <p><font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">cpumap.c:414:20: error: argument 1 range [18446744071562067968, 18446744073709551615] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]</span></font></p>
    <p><font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></font></p>
    <font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">  414 |         tmp_cpus = calloc(tmp_len , sizeof(struct perf_cpu));</span></font><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span>
    <blockquote type="cite" cite="mid:aAvKg8K2fyrZ6zy4@x1">
      <pre wrap="" class="moz-quote-pre">

Like:

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index 4454a5987570cfbc..99d21618a252ac0e 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
        }
 
        tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
-       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
+       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
        if (!tmp_cpus)
                return -ENOMEM;
 
⬢ [acme@toolbx perf-tools-next]$


And better, do the max size that the compiler is trying to help us
catch?

- Arnaldo
</pre>
    </blockquote>
    <font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I have tried using max and it compiles with that. I am doing testing with this change and will be posting a V2.</span></font>
    <p><font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thanks</span></font></p>
    <font face="monospace"><span
style="color: rgb(29, 28, 29); font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Likhitha</span></font>
  </body>
</html>

--------------18jLi2f98JgDE8yCyKeVQWdw--


