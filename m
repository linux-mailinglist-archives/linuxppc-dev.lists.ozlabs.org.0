Return-Path: <linuxppc-dev+bounces-7645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D157A8754D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 03:39:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbVLv1dpBz2yfv;
	Mon, 14 Apr 2025 11:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744594743;
	cv=none; b=eexKh0GWyjMFb1pCKu2XT0IswAA4A9/eYV8sdFoOJg78dFg9gLBGVOouphjniOKSooi5CXX/pbBPFYh7LdGfNCF4kEC1WDgJKvJspXf5YGGg5YbRAxi8Sj/HmE1thMXT3p5CXd6/TxrCI/FkEaOlsyBZniZZPqf3WkKSh9fqIsf3uhckGn/f00rDXXYieB71QI0lhGGsbhbhHcDVgvZPNdmC9CUDg8AxDgDZXAk+rJTV8bmv8RDokQQZ7WsijhXjfxHz6D1XOlSU6JFb2InOR9PlCUqi0c81/ZpC29EnbM79lct5KcGiZrVBJKT0Qabl2Y8T0Si/EZuO/HpOF3vXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744594743; c=relaxed/relaxed;
	bh=dRQx/G0oPlXOaXgJjhj9bivzkn8jF+UwvrchoCIDXWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyGWvK+1mIKWhoXVvIHlHEbesPI9lnnmSSXQC1kvbyXadlv6vKVNHRtHKSu6vwZGxJySp3EqDoOuZdwPRsERUvA3NgcMEA13wOgtoR+ylxP4qxi6YMnYzBxasgWwnQfzUKYrZ6E4m+c/yT/U+bQJqml3PqDmQ+mpZATffLQ4mOZfZFvhN0DQnHcjyPuQ4PmHBRuwBgO5AogGbXNxGnBv9GhYC+QlTzyxGaWZr7GlCfA6Qs8PmfS1KIbvoiU6U6VyrXDg5cYgrKBU2Ekkegl6csZPjQJgNUmCLAD8AFdkrkNG82rWZtiF/t7AupSHmuk9ye/onsseoTGWLdq+0rqwZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcZel8kf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JcZel8kf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbVLs1CyRz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 11:39:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNk8Cn016756;
	Mon, 14 Apr 2025 01:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dRQx/G
	0oPlXOaXgJjhj9bivzkn8jF+UwvrchoCIDXWI=; b=JcZel8kfefqe+FkeeSKd7c
	zfS7T4/TqqN2AwIy70mKbOhbdxtuWtg5DilCoxbN0tHtwIUrfa+3SLBtDKtCB1mm
	gHrHuKArl2fVtMSTCx0MUBicNhf58KXrxSvaR3VTxxmFGYhtSxBXzuSnIX0dkoL6
	gaUrmlvfDGP/WBdQMynA59rGTc+fIDr+dPlD3O9JxcymeCW/0MlT+qSb3QVtIuUJ
	ESTMp1iDcmN2huUnjZ7JxhUL9Ij20UGuy+7on/MdwJ8PBiMPiyuta4v6DFSPWM2d
	z49VEXAFLJfHhGeAUL2fA/VuOexbbE8XDHfQwtCv9bsgIS/+ea9KIrTKMLiUf/hQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 460q7x0ade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 01:38:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53E1cjkH005602;
	Mon, 14 Apr 2025 01:38:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 460q7x0adc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 01:38:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53DMdNbq017183;
	Mon, 14 Apr 2025 01:38:44 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040km0tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 01:38:44 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53E1chwb18285096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 01:38:43 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50DD358058;
	Mon, 14 Apr 2025 01:38:43 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E1635805C;
	Mon, 14 Apr 2025 01:38:36 +0000 (GMT)
Received: from [9.43.3.204] (unknown [9.43.3.204])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Apr 2025 01:38:35 +0000 (GMT)
Message-ID: <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
Date: Mon, 14 Apr 2025 07:08:33 +0530
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
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        Likhitha Korrapati <likhitha@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cku4Dz_w4rMnGh78T_G_k3hYGs9ImlxS
X-Proofpoint-GUID: 6fflamMzOaeZCqX3p6hdGxoAd_pAlKzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_12,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504140009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
> 
> On 07/04/25 12:10 am, Athira Rajeev wrote:
>>
>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <likhitha@linux.ibm.com> wrote:
>>>
>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>>> with the following error.
>>>
>>> cpumap.c: In function 'perf_cpu_map__merge':
>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>>>   414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> In file included from cpumap.c:4:
>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>>>   672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>>>       |              ^~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>>> Even though git-bisect pointed bad commit as:
>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
>>> issue is with tmp_len being "int". It holds number of cpus and making
>>> it "unsigned int" fixes the issues.
>>>
>>> After the fix:
>>>
>>>   CC      util/pmu-flex.o
>>>   CC      util/expr-flex.o
>>>   LD      util/perf-util-in.o
>>>   LD      perf-util-in.o
>>>   AR      libperf-util.a
>>>   LINK    perf
>>>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>>>
>>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
>> Looks good to me
>>
>> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>
> 
> Tested this patch on perf-tools-next repo, and this patch fixes the issue.
> 
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
>

Arnaldo, Namhyung,

can you consider pulling this fix? since it is breaking the build in gcc13-3 or
if you have any comments do let us know.

Thanks
Maddy


 
> Regards,
> 
> Venkat.
> 
>>
>> Thanks
>> Athira
>>> ---
>>> tools/lib/perf/cpumap.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
>>> index 4454a5987570..c7c784e18225 100644
>>> --- a/tools/lib/perf/cpumap.c
>>> +++ b/tools/lib/perf/cpumap.c
>>> @@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct perf_cpu_map *a, const struct perf_cpu
>>> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>>> {
>>> struct perf_cpu *tmp_cpus;
>>> - int tmp_len;
>>> + unsigned int tmp_len;
>>> int i, j, k;
>>> struct perf_cpu_map *merged;
>>>
>>> -- 
>>> 2.43.5
>>>
>>


