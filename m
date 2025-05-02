Return-Path: <linuxppc-dev+bounces-8252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E5AA6D8E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:06:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplQh2c8wz3057;
	Fri,  2 May 2025 19:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176780;
	cv=none; b=NSq/qco069SC8dMrAo1DPNkdEBScBz3cBeajXguDNkoxch/qBEA1rjoEZ+NNVcqxF92tGDo11y3SqgsXoMu1ztRjg0k6wzB4QT5JMT3bL/kvyEjChRD5LKu7bi/xH2Xib7epGIMzcGJXfxDNRWAm1Pqip/CTEESF59msKhqu7uW6UXTtb8oQq2j+hUrrjk/8H02rJLsx97w3xW4x8u29/VkQawyTCaV7Qc68DoQe9iG4N9TBUQR1bdTHcw421whqtWoB5WdZW+fiuwaa7X6o1fKBRm65kkUaxXoEv/pHPY/jZmPD5t/QZWQRKrX1Da8yO7bMTQ2pE9XKX7g8mf35Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176780; c=relaxed/relaxed;
	bh=IAAOoe3Cy/FuVRNXtgYsa7nitP231NLJy4EXeBm89rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7y2DOvgFp11TV0MBD+Uv789ubj3tZH04QsLrZfxs2mCYm6rSUSuSZ4GV+fnEsfn5oolD+/xI210wXxD6qAvjGExw94LpQEyqlvuno4gMwAxCKjocS20vnphtmGmHvJOoRKWHrk+fhuMGbte6w+lk+30ur9Of/UET7kzyKhfejau09ZHO/Thke7XhTvBkAYZKKDcyJoFbWMHHxgQxBCpdPKR0uTORdc1IrC66aNbuH5z4f7X0OnLZPlLGWg2nnQJN6OG4yAgzQMucir+ws7OtzDKyAfLHZpnW9FSDiwr7vC2f8h4/ZFKXxH7yY8eiXTFNGxOwa+XxErodVMMFL9yfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=px+bBO79; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=px+bBO79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplQf6nJVz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 19:06:18 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541M0geq011560;
	Fri, 2 May 2025 09:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IAAOoe
	3Cy/FuVRNXtgYsa7nitP231NLJy4EXeBm89rk=; b=px+bBO79zejt4i7w0/62VH
	j9uBtl+eo2o6rfZr2vk0hWvR6gq6XCeROloRkTLuoDZaoALDFbjaAoxeT84mH17V
	2gpNhHF4sTQ6EFaYKamqNCbhtPY/cy4DWWB7LfdmHy0KFu2lrByN76VWykvK6nrT
	q9vaVushxVIUmDqRdmZSr+HdMeRJaNDlw2YmDD0Min4zeN89hlqaNkZp6YxHE+YE
	3058iEqQ7gOZjmQ7KiAy6SHqJkEqbXscQci1mBQqU4TEFtC5bypKNlE7KRj8Z/mh
	Q4DWQh8tskftBolarvQ1GZI9lPuoYVxwlBgO+WFQlKEn36Z9dNjbgaLwUKXfXjCw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7dsd0x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 09:06:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5428swL5029758;
	Fri, 2 May 2025 09:06:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7dsd0wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 09:06:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5425kcoA031617;
	Fri, 2 May 2025 09:06:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tuhaut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 09:06:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54295vAr59638186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:05:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE2A92004B;
	Fri,  2 May 2025 09:05:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAC0720049;
	Fri,  2 May 2025 09:05:55 +0000 (GMT)
Received: from [9.39.16.240] (unknown [9.39.16.240])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 09:05:55 +0000 (GMT)
Message-ID: <876f14c7-2a9c-403a-809b-2c0f9bb41ba2@linux.ibm.com>
Date: Fri, 2 May 2025 14:35:54 +0530
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
X-Authority-Analysis: v=2.4 cv=afZhnQot c=1 sm=1 tr=0 ts=68148b02 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=zDGJ4L4n3l-mZm_ena4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2JaCjYvcfWzKcZKt7IB5WJ4HBFpC3Db1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3MSBTYWx0ZWRfXyrZKywzvAogg 8o70CJbFwsEIC/bpxjxw+D9FZiljhbZcqyBTjFWLCd48F3NSx5tjj3AbiMD5OoGRtg2QCzWZQKR PX6QD2149fwTi48qxVIr/Zz7uDGpeXI/FGGQZvkNIpB3R0NreQsTjpTtLE3SND1J80NyNzJCMTD
 xELJCnI7o946wozsqhgnRc0rXEXYJtMQFkWPSvGRQx5Y8cpuNkGSUnTu7rFcezgEd+MtBYB7/TD ircpUPss6gTdmp3QsxzowVdvgwshqPoVDgWRktRT9qIGwIZpsgalJpra4HSpkOXOKi5aQYIo3jR E3K52GropfV77Pf2Ei6bX5m5IOw/MKiZLXbi0wHTWRZdK3mQyPVxLU8cAhmqxuGrWA8BNHRRQaX
 dTcBrfxWCz+JqUzeQW3pfbibmYtS5qmlbEmC2xAUJBdBiNcOhMXdDg1fjwdQQkvr1W3CQGS0
X-Proofpoint-GUID: 8x02msb4LjZGj6xc9YwE3Z6h0S0mjYQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505020071
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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

I am not sure if using max() is right incase of perf_cpu_map_merge as 
this is a merge functionality. As this is summation we get a value 
greater than the max of orig and other cpus. And this might be correct 
in perf_cpu_map__intersect() but will cause issues in perf_cpu_map__marge().
Can you please eloborate if you meant this or there is something else I 
missed.

I tried the following:

int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
{
         return cpus ? __perf_cpu_map__nr(cpus) : 1;
}

static int __perf_cpu_map__nr(const struct perf_cpu_map *cpus)
{
         return RC_CHK_ACCESS(cpus)->nr;
}

This got introduced via commit 7d1b529f164d33ad4514b272bcec65036873d717 
where it assumes cpu map as non-null.

And we are checking this non-null in perf_cpu_map__merge()

         if (perf_cpu_map__is_subset(*orig, other))
                 return 0;
         if (perf_cpu_map__is_subset(other, *orig)) {
                 perf_cpu_map__put(*orig);
                 *orig = perf_cpu_map__get(other);
                 return 0;
         }

Using perf_cpu_map__nr instead of __perf_cpu_map__nr  and this works as 
it has a check.

--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, 
struct perf_cpu_map *other)
                 return 0;
         }

-       tmp_len = max(__perf_cpu_map__nr(*orig), __perf_cpu_map__nr(other));
+       tmp_len = perf_cpu_map__nr(*orig) +  perf_cpu_map__nr(other);
         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
         if (!tmp_cpus)
                 return -ENOMEM;
Regards,
Likhitha.

