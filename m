Return-Path: <linuxppc-dev+bounces-2317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0149A09D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 14:30:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT9KJ2lTvz2yst;
	Wed, 16 Oct 2024 23:30:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729081812;
	cv=none; b=FYkrPo+eqQVTC98JNb+vBGOGqmN7+RSWH1mcrL2boulIH09PyiZbhEno9HvWLdJy2J8MLQwWwW1SktR/C19WpLyKp8YgfjwyCY7RIY24afp5lNioaAQ5r2yAMKn2ImQKP3rkylKyHB+l8F+xHl7JGg2Sb7rljYnEZAsGYJcP6JmesMKn/v6MujDzq+Oo16LAyH+bLMtEZZDE+9aqxM0RanA3HIrzrbauD2wdZ7q9tOwm2I1JUwrj5CTVTBehhTFGw2lgxi2BMGlM9MdRJHwaLrQnjISyc1j68Zw5Pkx0xeYukMNCubnHSTrN41mGWNCw5JXmZth+SYFDaW9fDa6Tow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729081812; c=relaxed/relaxed;
	bh=aiUeGk+hwdjG29xRD5MljY+A1mdGiwdWe9aACfJUrrA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D0bHyScey2nJCVBtxcbn3Dr+o7G7lThhrmUt7v5OZ2XcdULAndZJoJSv5ERQHEGDOdqE/yPM7ID4LqyDNLos4CjbYYvJSrnLkB/7kBjQYvz0Kc3J5SP6haS0Gt5qmuxknrx2pa04yxtLrnn37UsQB7c7g+XO/anLjZWBteECQnBwJOVla5snr5aBON2YuQgdWlMaqMKVW9XyYQQxsaZFBXRRyA1jwYUSkHnPXzkdecmcq4AtyM7KljEVzuDmL2ugPYHxv+dUx/PLqX1XUWX55DhIoZl/BmJKcY++PnS5JcplTpN6RZFD+ydm6dcTbqthH+vj+h6o/HnxBdE7mRupbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVoLq4tZ; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVoLq4tZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT9KG23Xjz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 23:30:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAK5wj022175;
	Wed, 16 Oct 2024 12:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aiUeGk
	+hwdjG29xRD5MljY+A1mdGiwdWe9aACfJUrrA=; b=iVoLq4tZHwI4vrCekeJIzb
	D734bvlWs8bMyXNyJ/Qfps+sbYnwiHrI5GH205zsT4hRyaML/B4rVEML7eOlsQIy
	oFNazcsv4yD4nR8f7VmcXBoz8LzPYkd/BHryC1OC+uwMQLn/QfdckLyUuC9vshIT
	V1anHb0iY5zhc6M+NAgyYP07sXZPRfbdVgsU7syAB/KDJR6NKp0bTtz6eu7+Hh8I
	FVLWt2wyJNu0QImJquKvKsZlPDyHwIVESBB662OczkjbKWM/4zasakBHjrwMOSVj
	ofNj8oZ20UzDAwEtE2zjMKR39XyYNwXYAj2kpS7H3ZSvwvduwrM5koO24dyE3cqg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42abn0gksu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 12:30:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49GCU2nS021931;
	Wed, 16 Oct 2024 12:30:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42abn0gksh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 12:30:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49G9WV2B006663;
	Wed, 16 Oct 2024 12:30:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4283es1hhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 12:30:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49GCTv7A56885682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 12:29:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3F612004B;
	Wed, 16 Oct 2024 12:29:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB7F820043;
	Wed, 16 Oct 2024 12:29:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.244.19])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 12:29:52 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/tests: Fix compilation error with strncpy in
 tests/tool_pmu
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Zw1UXbWTS9Gk3lmw@google.com>
Date: Wed, 16 Oct 2024 17:59:38 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B5B2251-E41E-4584-881E-61A468AFB222@linux.vnet.ibm.com>
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
 <Zw1UXbWTS9Gk3lmw@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AeZNnQnQtUJIn2eVam4w1166aIGkbFDd
X-Proofpoint-ORIG-GUID: oo4sG4uSbvgG9k-VfJ-VJJmHLsoBQc2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 14 Oct 2024, at 10:56=E2=80=AFPM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> Hello Athira,
>=20
> On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
>> perf fails to compile on systems with GCC version11
>> as below:
>>=20
>> In file included from /usr/include/string.h:519,
>>                 from =
/home/athir/perf-tools-next/tools/include/linux/bitmap.h:5,
>>                 from =
/home/athir/perf-tools-next/tools/perf/util/pmu.h:5,
>>                 from =
/home/athir/perf-tools-next/tools/perf/util/evsel.h:14,
>>                 from =
/home/athir/perf-tools-next/tools/perf/util/evlist.h:14,
>>                 from tests/tool_pmu.c:3:
>> In function =E2=80=98strncpy=E2=80=99,
>>    inlined from =E2=80=98do_test=E2=80=99 at tests/tool_pmu.c:25:3:
>> /usr/include/bits/string_fortified.h:95:10: error: =
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 128 equals =
destination size [-Werror=3Dstringop-truncation]
>>   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
>>      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   96 |                                   __glibc_objsize (__dest));
>>      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> The compile error is from strncpy refernce in do_test:
>> strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
>>=20
>> This behaviour is not observed with GCC version 8, but observed
>> with GCC version 11 . This is message from gcc for detecting
>> truncation while using strncpu. Use snprintf instead of strncpy
>> here to be safe.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> I found this issue now and thanks for the quick fix.  I will push to
> perf-tools-next soon.
>=20
> Thanks,
> Namhyung
>=20

Sure

Thanks Namhyung for pulling in the change

Athira
>> ---
>> tools/perf/tests/tool_pmu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/tests/tool_pmu.c =
b/tools/perf/tests/tool_pmu.c
>> index 94d0dd8fd3cb..297cc8c55579 100644
>> --- a/tools/perf/tests/tool_pmu.c
>> +++ b/tools/perf/tests/tool_pmu.c
>> @@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool =
with_pmu)
>> if (with_pmu)
>> snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
>> else
>> - strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
>> + snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
>>=20
>> parse_events_error__init(&err);
>> ret =3D parse_events(evlist, str, &err);
>> --=20
>> 2.43.5



