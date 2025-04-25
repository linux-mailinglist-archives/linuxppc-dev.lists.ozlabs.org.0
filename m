Return-Path: <linuxppc-dev+bounces-7987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB155A9CC0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 16:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkbMx4lVvz3020;
	Sat, 26 Apr 2025 00:49:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745592573;
	cv=none; b=Ksvoe36u5L9ocP5ZSwwjzvRTBNaqkZ5xecorv6ykziiVu1CFQhazZCQXQ70N7ucTtEAdPLhfKIIlvph+OsFuQUpnS0DRSNexYEiiQuqh03lddoFyqcA6OHrqYYryBFR8nop+05j3LkxKPl+n+d+eBGzbQwrbHspqTueacNsou0lm8c5pZXzubYuTRe7vaMlaG0ugUHTONqNZ3ADIQP4lRxR1M0+JEV7eAQI1JA1Q+XfcOY4VxU/GGBRdU3guc/d34EmDR8dnT5JJyB78IhRAD4lLxOcF1/At7UboANcURsysd4xrPeTO8vAv+1//sGm5tXcY2lIbug9phNulpO2Lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745592573; c=relaxed/relaxed;
	bh=ol7vTOsl7scqFAh6UR0obc8f7BNcGvHaummwfmheD6c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PsnUADDYYobYx0rxNQprVzeMx6nEhWphla9K/2ymV50/7MYc48KTTDb6m2+Ibd/tl0cW41TZ9rA3dUyBsQhrv1YuhTPiorwV4B+LOAg95saeo7NU2UtULem/ubbMeV5NBlbLN5SVmbGrKP94kWdlpU6SH2t+iQdGAHndxh7i7uuHIuKcnbEGqi3IPOzqW756m+kmLD6TeJLzoOugknAxyUb8zmI30e27kRX8i9Dq8w2E4ZOt63ZQpoudktPctFyhvzNK/Nhjz+AgXEwN//3ZhZsfmjwA0zc55e8hWo0QCGSRrErF8iTSTCiHZwXvoDoxPtS0SyHd/DpTs1TYeBslaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BrImiQKu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BrImiQKu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkbMw2tQJz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 00:49:31 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9YRME006742;
	Fri, 25 Apr 2025 14:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ol7vTO
	sl7scqFAh6UR0obc8f7BNcGvHaummwfmheD6c=; b=BrImiQKun7LXOy9Lqm8PeF
	ppmmhFv8sqxo2xBfvE4eOnXW0wEv7u0KTAnRTHX23snbjEyiJzYxBbXQBEiAQPjf
	z+sZ0P1jj9Ge5JUglhRLjdKU3Ms7VyJdmy9+Wzxw6kMLKB5znBgIuIeQq3rVYV59
	kULfP+tZ37ha0+jQ3Afx1iXcDNxBUrd1VEaDhrBGSf5AcIQqXjnyN+NQU//Jz0WH
	tPjAKaGO66TuEC9s8w+jGkyYf+DV50PMfIIOVDhYjCpFquY4f3KFjdPae3VVe2Uy
	BYvoHNcyyHS2Sd9DCiEVIUvYOx1NTj+K1uxd4gB2RpuVX5hq27KXl754bJ9tD3Ig
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9kvnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:49:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53PEnQxj017788;
	Fri, 25 Apr 2025 14:49:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9kvnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:49:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PCgWiI004052;
	Fri, 25 Apr 2025 14:49:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg05pcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:49:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PEnLeT47055206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 14:49:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5104B20049;
	Fri, 25 Apr 2025 14:49:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DB9F20040;
	Fri, 25 Apr 2025 14:49:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.235])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 14:49:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
Date: Fri, 25 Apr 2025 20:19:02 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        Likhitha Korrapati <likhitha@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s1uH1AQJiepUBPZwHvHVg5f0ePC3Jj34
X-Proofpoint-ORIG-GUID: aM4Wueisrg8bRLX35I5SHfwiK-hSnUH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwNCBTYWx0ZWRfX3w9fKBdga60B zvAm8kQQ2XdgV5MnbPR9dfkEJd9e7N3rlYrL1sjVDQJ66bBF/ioYx5fWU0pMWegIyuwsOKw0r3z k4prBQuAEcSg8ZMAgvl6TplGc6ZKsvvhTA+bK9R2fSnaOUlytdDQMUO36XbpUbLlzwzd96zwsZx
 rEj7M411m4aNjk3QP2zg1eMHI3oNSe3ZO/X0OvbNc1hch0OkYvYp5FpY4FeKWwva69zde+ZY48v /3WZ+sl831W9tCoMEG6y1lFiXBTfHs8WQ3Uawp5b4K5AbLN98Sf2JGalmOH6078/DOv+J1yOTTF 6pIB08ucoHbsa/8H4dS7qfC7bNHJ2Ka4nodBt4rxjBIHrN2g+gild+SEgf6n6PUSn6qPogRArGI
 HNO0tv2LtAf0X3ljgs3XSEqfVbOAGgJIzXqY4a8Wkji9rzu2CtS32QiiUcVeI1c5h3GjTdH/
X-Authority-Analysis: v=2.4 cv=M5lNKzws c=1 sm=1 tr=0 ts=680ba0f6 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=Od1Icoqhj-FY6Pgk5YQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250104
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 14 Apr 2025, at 7:08=E2=80=AFAM, Madhavan Srinivasan =
<maddy@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
>>=20
>> On 07/04/25 12:10 am, Athira Rajeev wrote:
>>>=20
>>>> On 6 Apr 2025, at 10:04=E2=80=AFPM, Likhitha Korrapati =
<likhitha@linux.ibm.com> wrote:
>>>>=20
>>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>>>> with the following error.
>>>>=20
>>>> cpumap.c: In function 'perf_cpu_map__merge':
>>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, =
18446744073709551614] exceeds maximum object size 9223372036854775807 =
[-Werror=3Dalloc-size-larger-than=3D]
>>>>   414 |         tmp_cpus =3D malloc(tmp_len * sizeof(struct =
perf_cpu));
>>>>       |                    =
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> In file included from cpumap.c:4:
>>>> /usr/include/stdlib.h:672:14: note: in a call to allocation =
function 'malloc' declared here
>>>>   672 | extern void *malloc (size_t __size) __THROW =
__attribute_malloc__
>>>>       |              ^~~~~~
>>>> cc1: all warnings being treated as errors
>>>>=20
>>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>>>> Even though git-bisect pointed bad commit as:
>>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS =
are used")',
>>>> issue is with tmp_len being "int". It holds number of cpus and =
making
>>>> it "unsigned int" fixes the issues.
>>>>=20
>>>> After the fix:
>>>>=20
>>>>   CC      util/pmu-flex.o
>>>>   CC      util/expr-flex.o
>>>>   LD      util/perf-util-in.o
>>>>   LD      perf-util-in.o
>>>>   AR      libperf-util.a
>>>>   LINK    perf
>>>>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>>>>=20
>>>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
>>> Looks good to me
>>>=20
>>> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>
>>=20
>> Tested this patch on perf-tools-next repo, and this patch fixes the =
issue.
>>=20
>> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>=20
>>=20
>=20
> Arnaldo, Namhyung,
>=20
> can you consider pulling this fix? since it is breaking the build in =
gcc13-3 or
> if you have any comments do let us know.
>=20
> Thanks
> Maddy

Hi,

Can we get this pulled in if the change looks good ? This is breaking =
build on gcc-13-3=20
Looking for feedback on this patch..

Thanks
Athira
>=20
>=20
>=20
>> Regards,
>>=20
>> Venkat.
>>=20
>>>=20
>>> Thanks
>>> Athira
>>>> ---
>>>> tools/lib/perf/cpumap.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
>>>> index 4454a5987570..c7c784e18225 100644
>>>> --- a/tools/lib/perf/cpumap.c
>>>> +++ b/tools/lib/perf/cpumap.c
>>>> @@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct =
perf_cpu_map *a, const struct perf_cpu
>>>> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct =
perf_cpu_map *other)
>>>> {
>>>> struct perf_cpu *tmp_cpus;
>>>> - int tmp_len;
>>>> + unsigned int tmp_len;
>>>> int i, j, k;
>>>> struct perf_cpu_map *merged;
>>>>=20
>>>> --=20
>>>> 2.43.5



