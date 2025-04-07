Return-Path: <linuxppc-dev+bounces-7486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742CEA7DD32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 14:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWSfk1hKdz2yqf;
	Mon,  7 Apr 2025 22:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744027726;
	cv=none; b=WNhYIIuTm06Tlr+06eBZR+F/rlO3Fn+VaOj9XBdCry4S+iBQDedgI4Q58n93MiEUZ+1GYylwBbCtgi7cr9/FAwUEwNUr38f6pGsec5WMgJmM9DFMjrJ8Dy53EzFWGMBU5YM+JWiOM23JDGU8hRA9laj9BBSI6yXHKGkIdPgOPf7b9L07wQXH+mvjigxjr1Z/qVbQnh4pjn8DyVWca62LnzOZmShdRTaFKxFZ9/7OWq9TybVmm3ZC/BFF5ozjD/MJ0n7l+/bXRxNtye4k+yHIh6SnE84CDEvU8g6g86j6y8Xuk28o9jJRqLhPNQllbGkGk5X5no610vUeW6bn+SNHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744027726; c=relaxed/relaxed;
	bh=uUtBZjlU25r6sM+22jsuRQQkmxTm0zoP535SD0mY4H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eS+V3N+K5cSm1vpmRnSORmq8q23kfxlHuwZhoME4RS24NoCajHk66zwvb0WTNInMlYDZUyFytZATCamRWxXBXcimj1AhFMPmtCQzruyZZZxu+Nb4G+M0iH7IdbUSKAEOJ3zjpYb10x3N0khk1o21eh/z804H/Ghl0IzAPs8k8CGc85lhlxUGhsUzZN0B0MdMGoq7MewIL1+InNWhEyWCs6p2hrztGnk5DFa+6W127th2h/FoyB3BxyWbw4Ci4LPb/dWK9co7EepxP+35nKmBw+5C7Hh/emnWdYRAXUX6juOdGmukv4iOHzaTMvx/1zHnpNRa6kfUR71n1o80diiq1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d74wuq7M; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d74wuq7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWSfh6rTsz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 22:08:44 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5373jp4P007750;
	Mon, 7 Apr 2025 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uUtBZj
	lU25r6sM+22jsuRQQkmxTm0zoP535SD0mY4H0=; b=d74wuq7Mh+EbuoXVeWjnCg
	zxUl3UQpuRa8l62spykZvJhtW/hjGfoJx8LNOLgRALwPNUeV1de668vOcMWpaBTT
	huxJusD26dw80wlG1O96HIw/cBZvOcKFSrnwotDjiatWOJqiQft5VQKV1OR6Y+pc
	SPf1tTvXr+bI4cZP4KKhyy6WtUGIfyzxbAJxgupf7o/OYYqmpkV1MZeMAKjR+uE+
	4TbYlV8lOHNa/+Zz71Z6z7Tb97h+hjEuJ//fa9wPgYiJNnEb9cxNh3CFucj0YVFK
	IcwGrrVwn1nvOR+asZnXMhhGAWuJ0+oHtFhhiWKhptzZooTfVOM7XkqxbN0858xQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v739j5dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 12:08:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537BUoKh028422;
	Mon, 7 Apr 2025 12:08:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v739j5dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 12:08:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537AUfMW025598;
	Mon, 7 Apr 2025 12:08:37 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbknm4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 12:08:37 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537C8aqw42926420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 12:08:36 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18E4A58052;
	Mon,  7 Apr 2025 12:08:36 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AE3B5806A;
	Mon,  7 Apr 2025 12:08:31 +0000 (GMT)
Received: from [9.61.255.9] (unknown [9.61.255.9])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 12:08:30 +0000 (GMT)
Message-ID: <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
Date: Mon, 7 Apr 2025 17:38:28 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.ibm.com>,
        Likhitha Korrapati <likhitha@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ifLdxIWfGg5ReWAHUEyAlMZT8v466Gzj
X-Proofpoint-ORIG-GUID: aOV48UOyaIGysoPZKNtLYw7igkNJDQDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504070086
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/04/25 12:10 am, Athira Rajeev wrote:
>
>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <likhitha@linux.ibm.com> wrote:
>>
>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>> with the following error.
>>
>> cpumap.c: In function 'perf_cpu_map__merge':
>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>>   414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from cpumap.c:4:
>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>>   672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>>       |              ^~~~~~
>> cc1: all warnings being treated as errors
>>
>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>> Even though git-bisect pointed bad commit as:
>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
>> issue is with tmp_len being "int". It holds number of cpus and making
>> it "unsigned int" fixes the issues.
>>
>> After the fix:
>>
>>   CC      util/pmu-flex.o
>>   CC      util/expr-flex.o
>>   LD      util/perf-util-in.o
>>   LD      perf-util-in.o
>>   AR      libperf-util.a
>>   LINK    perf
>>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>>
>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> Looks good to me
>
> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>

Tested this patch on perf-tools-next repo, and this patch fixes the issue.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.

>
> Thanks
> Athira
>> ---
>> tools/lib/perf/cpumap.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
>> index 4454a5987570..c7c784e18225 100644
>> --- a/tools/lib/perf/cpumap.c
>> +++ b/tools/lib/perf/cpumap.c
>> @@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct perf_cpu_map *a, const struct perf_cpu
>> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>> {
>> struct perf_cpu *tmp_cpus;
>> - int tmp_len;
>> + unsigned int tmp_len;
>> int i, j, k;
>> struct perf_cpu_map *merged;
>>
>> -- 
>> 2.43.5
>>
>

