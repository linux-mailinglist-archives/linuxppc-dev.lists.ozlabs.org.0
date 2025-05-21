Return-Path: <linuxppc-dev+bounces-8838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF157ABF545
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 15:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Wp71LgQz3c2G;
	Wed, 21 May 2025 23:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747832639;
	cv=none; b=EYil/FFCnW0JPa3shqDVA/neGmMmWEODRJp8eTbqUPckSrKtjWdIZfmjPuSNrrr/9KIfDc0w3oWxh6PpDYP32G55PYis7RJ5462tZqXdKuXoHmItkfJv6q24Nu2MMqDGWto2VIanpKuI0JlSIY0Q39Gi1zbSnU0tKOFCLHyMTPiLdyOV6N6AaOJiD0vxZNg+gGWSpEK4gS292ip2Klt7Ozj55XxPRr2Bqr8Z7CVWx53t0WSLN9an/uu07yC6lJP2ZCVteCNSW7FqSo8EzfIaFEJCapmv4Hh/33CpZcT/nNC8xQWBwKqKzu7ivgUyS54H42j7PTpJEXlgoqnq/yp/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747832639; c=relaxed/relaxed;
	bh=ESkGOVy3GH14TKynJEQQA9J7TlFjk9Nnnf1e1i57kI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4nstAasiMD321ZBe4f9yfwF2ExHb0GkIBxUmELZtNhE4wkaoNjRqk8YbGOTTMCdEXxR/x/rDaXco0osXjlywQJOzAYxBZ+IUbBy0gWk9aHWySE8K/nuyzMKOiEeSH3GfkzlOKglstpukZYR1oFKr4tBooqu1BUQ8RGfl8wLR4xZ0fy1cAxKLRY+o+hLdpznKcbkV7HQ3d0q/3Wjqfaw2r2x8vG/t5Pz+Bczca6XTa7TxVi9sj5ywsPNnlgjpHXKEtPyQRJCdWOZdVu+1EQLHyIq/xlkE2I1ypvDf04mZlyMwH0LGWMtgqy80K1YkeZEslu+hUjnLcgtP6h/Tv4nlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TASPnW7R; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TASPnW7R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Wp60QW6z3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 23:03:57 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6VJJB025231;
	Wed, 21 May 2025 13:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ESkGOV
	y3GH14TKynJEQQA9J7TlFjk9Nnnf1e1i57kI8=; b=TASPnW7R7NJCwKaliErFQ8
	Vs9CO1SoWPPlgw5PyhZUoSC0UkO5FviXHPhFWmO3uLJQn/K0s2XI1dOIQVE8kNoD
	jkkFm5vUWIKCXJagtTgriV4EVO1KCLkrvZBumhwbgBZFQmvchmOxXQybFH6G09Fy
	/y20ArUQGOnCG+CBM+MEIsww56MY6M5lEQJvaiK0Kz7tiYMjamsgutQzFN/dJjXB
	NJRLksTkQ4TcqIHqMZ6gf/QVLWcKUOZQwqABHhp8DOG8odi+BxHSc1B96Zg+4Tb5
	MMN2sVcFU8vKTuzrA+Z2rgBKg7Q1bx7PWx7zM5aXLUCBY51cW+oLkrx83GdL/fBg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rxaamh6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 13:03:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LCwOrg021362;
	Wed, 21 May 2025 13:03:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rxaamh6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 13:03:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9rKPY020707;
	Wed, 21 May 2025 13:03:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwkpv9c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 13:03:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LD3kGB59441660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 13:03:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE7B020043;
	Wed, 21 May 2025 13:03:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51C3F2004B;
	Wed, 21 May 2025 13:03:44 +0000 (GMT)
Received: from [9.39.28.173] (unknown [9.39.28.173])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 13:03:44 +0000 (GMT)
Message-ID: <528d4af0-8e8f-4ab8-a1d0-d0bb937e4f53@linux.ibm.com>
Date: Wed, 21 May 2025 18:33:43 +0530
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
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>,
        Namhyung Kim
 <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
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
 <wqewmdha3bx7pmxqwbna26qnl55fcejqsjs4b2zhuciddpb3b5@7ztolpf6erwo>
 <aCO156Qh5mbeR4Sk@x1>
Content-Language: en-US
From: Likhitha Korrapati <likhitha@linux.ibm.com>
In-Reply-To: <aCO156Qh5mbeR4Sk@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=CMEqXQrD c=1 sm=1 tr=0 ts=682dcf37 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=164j5j3yLVYjNA0Bz0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7diTplBZzv50A3jGkw2zUpmU1jFwgljU
X-Proofpoint-GUID: xKd7Ir9NomOi0JBn4YsjkytAGQk7Kg_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMiBTYWx0ZWRfX0V69b2vn0FR7 OIh4dNrxizU4xeqS9Fsc+DGVluKJhG+XGZ1Fi1BgMgH95yHozOvV/VjsfDJOfLxtHyQHR7QfgmW p3lgnQG2tkynzXEAe2dyi0xv7vy4HY+9jDywI0gn8qW3PXLPu62kcj1JEnDv/pJBtGCXP1PoZV9
 yrkFXoSf1JQxghb3xEB2l6Qx+eEPqtSJa6Eo7qXW9MMnDGV3tAuiY7xejiqo2KjWRN5lZO9xoIG 0lzmEMslg0bDnIC1HtxmAbgZzS6NvpZ/bo2R9HHSDSu5mIKA8HSvWeuOmUXvFqs7s0hw2KzvARR CPevF/jDy2alcCCMTt7qjWk9pMWrPC/UmxOqlT2JAig6FpVADQ7TMPiA80xfAwfLA2oHsOR7CYO
 oejpG0PHzN7U3v2zhP/CennKBBpBh3LvbU7qPemMT5JyOMzmVZ+R0wp9WNm8tvAVdwPH5Wib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210122
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnaldo,

On 5/14/25 02:43, Arnaldo Carvalho de Melo wrote:
> On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wrote:
>> On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wrote:
>>> Maybe that max() call in perf_cpu_map__intersect() somehow makes the
>>> compiler happy.
> 
>>> And in perf_cpu_map__alloc() all calls seems to validate it.
>   
>>> Like:
> 
>>> +++ b/tools/lib/perf/cpumap.c
>>> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>>>          }
>>>   
>>>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>>> -       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>> +       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
>>>          if (!tmp_cpus)
>>>                  return -ENOMEM;
> 
>>> ⬢ [acme@toolbx perf-tools-next]$
> 
>>> And better, do the max size that the compiler is trying to help us
>>> catch?
> 
>> Isn't it better to use perf_cpu_map__nr. That should fix this problem.
> 
> Maybe, have you tried it?

I have tried this method and it works.

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

I will send a V2 with this change if this looks good.

Thanks
Likhitha.

>   
>> One question I have, in perf_cpu_map__nr, the function is returning
>> 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause problems?
> 
> Indeed this better be documented, as by just looking at:
> 
> int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
> {
>          return cpus ? __perf_cpu_map__nr(cpus) : 1;
> }
> 
> It really doesn't make much sense to say that a NULL map has one entry.
> 
> But the next functions are:
> 
> bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map *map)
> {
>          return map ? __perf_cpu_map__cpu(map, 0).cpu == -1 : true;
> }
> 
> bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *map)
> {
>          if (!map)
>                  return true;
> 
>          return __perf_cpu_map__nr(map) == 1 && __perf_cpu_map__cpu(map, 0).cpu == -1;
> }
> 
> bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
> {
>          return map == NULL;
> }
> 
> So it seems that a NULL cpu map means "any/all CPU) and a map with just
> one entry would have as its content "-1" that would mean "any/all CPU".
> 
> Ian did work on trying to simplify/clarify this, so maybe he can chime
> in :-)
> 
> - Arnaldo


