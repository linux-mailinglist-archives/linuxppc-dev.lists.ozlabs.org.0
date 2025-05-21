Return-Path: <linuxppc-dev+bounces-8844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058BABFC3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 19:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2dgN4nDLz2yZ6;
	Thu, 22 May 2025 03:28:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747848512;
	cv=none; b=k042JpWfKeGOfY+xDeMkUUzxmvR63yx0Di2OJPLsXbV85v4+NEBJirroGySk+B+PjtDOKyL71GbC+tqLuR3j9sw6zVUOBou9zKDoK3TF3xiwYM2qrCjhtPYGOBfPQNIm90Kj22zIXAFwpLqV0KUbaF/AfVqcxbA7RVKrxzGOkh2CH+G1/T2YNnfOWFPhWouV1ociOHEIBpuXELfiTommLcTtawZLjHdNENq/0cgImnVjGLV//Ww0Kcl9qMvh1vF9zPrUSAL1wys903sRPL/03UNGXtInoA94FkEP0IQq8/QMDpILKzK4S316OQrdTmKznO6Ch9gkd7xiNI7ym3Fc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747848512; c=relaxed/relaxed;
	bh=TIWX5eUhkVd7cZ/EezLSz26gKIPuH3xL6yU9suCWBXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gi1p95szvlLZ5cR7s/Lop9lgELY2yB+6aqj8rCnRud3dV1+f/jtE3MPOxJa3v3p4vBFpBFHO4AXEhKlZp7ICMZBUq5/1n/13rx7YzoIyOwMQJTU1mfqJQ2UCAeYnsJPwf1IqWOblTb3FUrFI6DgF64tLe69kezEfehSoWqxU7F2EKmM02dXM5orFC1kiENkA4RV2g19bzckvpSMTrX/88wfoc1zcQwLCo80vk3vo2/7xq43LsTRrxV/DoDxUUE26WBlOZ3EZI2Ds7SVmTZEyDrX+bYLQ9EWiMy074/o7ue+7Q8h+VPMZDeJ9Q9zQRoeQqcg7fjVOTwoW+bBO3HmS4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU4sRII+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU4sRII+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2dgM3NJJz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 03:28:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LFedUH002057;
	Wed, 21 May 2025 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TIWX5e
	UhkVd7cZ/EezLSz26gKIPuH3xL6yU9suCWBXU=; b=OU4sRII+Lsw0+2tVHTytRR
	bY7CK9lkHxIuxgKyztU5UjZSOVmdr8lA0E6cCZ+QoSOQkButpIjSE3m3xAmRii03
	Ju4IsvRO2bNPkrBVPrX5yulIVsz00HrZBFZh7nZTvo6gt3yOn3SWm9q/KJKoLcZJ
	I8lMlRwO+bpKZ/I4UBLmcTU+GliOVVg0hZ+RDToX969o32w/AUbtNUmhiFpVtNLn
	ScLg0rBxH5mWVMFY+KTERJTsoKuw81Grz1bp6FoyyKs+7A4zcLoFQ4ET2lR5cZiQ
	vUuqQYak0h5jOMQbH63ZOQCW5lXduNystSmQHAifzPGAvPg/jImm2ZaIQV/0aH4g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46s9esu7pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 17:28:26 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LHSPH9014898;
	Wed, 21 May 2025 17:28:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46s9esu7p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 17:28:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE1DXH015431;
	Wed, 21 May 2025 17:28:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnnda84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 17:28:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LHSLQu56295738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 17:28:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02EE620043;
	Wed, 21 May 2025 17:28:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB1E920040;
	Wed, 21 May 2025 17:28:18 +0000 (GMT)
Received: from [9.124.218.221] (unknown [9.124.218.221])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 17:28:18 +0000 (GMT)
Message-ID: <8dba0ba8-84dd-4a86-96fd-d72de11d40e0@linux.ibm.com>
Date: Wed, 21 May 2025 22:58:16 +0530
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
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
 <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com> <aAvKg8K2fyrZ6zy4@x1>
 <wqewmdha3bx7pmxqwbna26qnl55fcejqsjs4b2zhuciddpb3b5@7ztolpf6erwo>
 <aCO156Qh5mbeR4Sk@x1> <528d4af0-8e8f-4ab8-a1d0-d0bb937e4f53@linux.ibm.com>
 <CAP-5=fXT0edO0pjO0Ks8vGHgO=iwfuu+Bs5pfccZQhwfSo9mgw@mail.gmail.com>
Content-Language: en-US
From: Likhitha Korrapati <likhitha@linux.ibm.com>
In-Reply-To: <CAP-5=fXT0edO0pjO0Ks8vGHgO=iwfuu+Bs5pfccZQhwfSo9mgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2OCBTYWx0ZWRfX+Nb9Y3gl5n6U uchokgkGGuOSyoZGDxeur2J/sHltudetlZfir/gemwPunh66//CE/A77O42ynVbC2Mrx12/pxAv HLBUmnNuBuCvmAiTRVGEZtkHDFZN5cpsOFZdlXq1gRllNkHbix/3JhqrMDyziyuHCxxlabaGsoY
 5OzyOIt1lJfDN0Ir8cde5ZCW2kPWYWsZhL2E2vrY1+s6WiIU85gVng+Lvj0lk680/1nrZgms/MI tGLJ3PfbxSxiU3eMNyWzfkm20buz0BmzvYrpEdTU/Cxr+UrXMmyKH8DiIafDRmSXpq7zZIeijhY 0401eeSveBe0jTWnDsdHGPSO5oFu0kTLJ61H7fRCz/QdvUVd7VyaXN5Ece+OyQjbpGSPtmmPQgn
 7/Iu8QyhHcyciA1in7q7dcwxVCWNJ6IQHKSuqITRLSUhBjTuFMsVf60COXko0GWWymdt1HyE
X-Proofpoint-ORIG-GUID: dQwnRi-YxvUJNJ_zpEfpNwFeySsZ61uN
X-Proofpoint-GUID: ckPjlqMHZFWKXe4wNM450pRBUJ7dF4fM
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=682e0d3a cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=wzzvm3kuBvU_J5NYBv0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210168
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ian,

On 5/21/25 21:15, Ian Rogers wrote:
> On Wed, May 21, 2025 at 6:03 AM Likhitha Korrapati
> <likhitha@linux.ibm.com> wrote:
>>
>> Hi Arnaldo,
>>
>> On 5/14/25 02:43, Arnaldo Carvalho de Melo wrote:
>>> On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wrote:
>>>> On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wrote:
>>>>> Maybe that max() call in perf_cpu_map__intersect() somehow makes the
>>>>> compiler happy.
>>>
>>>>> And in perf_cpu_map__alloc() all calls seems to validate it.
>>>
>>>>> Like:
>>>
>>>>> +++ b/tools/lib/perf/cpumap.c
>>>>> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>>>>>           }
>>>>>
>>>>>           tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>>>>> -       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>>>> +       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
>>>>>           if (!tmp_cpus)
>>>>>                   return -ENOMEM;
>>>
>>>>> ⬢ [acme@toolbx perf-tools-next]$
>>>
>>>>> And better, do the max size that the compiler is trying to help us
>>>>> catch?
>>>
>>>> Isn't it better to use perf_cpu_map__nr. That should fix this problem.
>>>
>>> Maybe, have you tried it?
>>
>> I have tried this method and it works.
>>
>> --- a/tools/lib/perf/cpumap.c
>> +++ b/tools/lib/perf/cpumap.c
>> @@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig,
>> struct perf_cpu_map *other)
>>                   return 0;
>>           }
>>
>> -       tmp_len = max(__perf_cpu_map__nr(*orig), __perf_cpu_map__nr(other));
>> +       tmp_len = perf_cpu_map__nr(*orig) +  perf_cpu_map__nr(other);
>>           tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>           if (!tmp_cpus)
>>                   return -ENOMEM;
>>
>> I will send a V2 with this change if this looks good.
> 
> How is this different from the existing code:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/lib/perf/cpumap.c?h=perf-tools-next#n423
> ```
>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>          tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>          if (!tmp_cpus)
>                  return -ENOMEM;
> ```
> 
> Thanks,
> Ian

I gave the wrong diff. Here is the corrected diff.

--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, 
struct perf_cpu_map *other)
                 return 0;
         }

-       tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
+       tmp_len = perf_cpu_map__nr(*orig) + perf_cpu_map__nr(other);
         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
         if (!tmp_cpus)
                 return -ENOMEM;


I am using perf_cpu_map__nr instead of __perf_cpu_map__nr.

Thanks,
Likhitha.

> 
>> Thanks
>> Likhitha.
>>
>>>
>>>> One question I have, in perf_cpu_map__nr, the function is returning
>>>> 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause problems?
>>>
>>> Indeed this better be documented, as by just looking at:
>>>
>>> int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
>>> {
>>>           return cpus ? __perf_cpu_map__nr(cpus) : 1;
>>> }
>>>
>>> It really doesn't make much sense to say that a NULL map has one entry.
>>>
>>> But the next functions are:
>>>
>>> bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map *map)
>>> {
>>>           return map ? __perf_cpu_map__cpu(map, 0).cpu == -1 : true;
>>> }
>>>
>>> bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *map)
>>> {
>>>           if (!map)
>>>                   return true;
>>>
>>>           return __perf_cpu_map__nr(map) == 1 && __perf_cpu_map__cpu(map, 0).cpu == -1;
>>> }
>>>
>>> bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
>>> {
>>>           return map == NULL;
>>> }
>>>
>>> So it seems that a NULL cpu map means "any/all CPU) and a map with just
>>> one entry would have as its content "-1" that would mean "any/all CPU".
>>>
>>> Ian did work on trying to simplify/clarify this, so maybe he can chime
>>> in :-)
>>>
>>> - Arnaldo
>>
> 


