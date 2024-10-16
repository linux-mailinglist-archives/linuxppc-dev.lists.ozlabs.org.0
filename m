Return-Path: <linuxppc-dev+bounces-2324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CF9A116D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 20:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTK9B0vLQz2yPD;
	Thu, 17 Oct 2024 05:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729103022;
	cv=none; b=QSSp+dg9Q3XTGcfsHi4yNY4RH+0bGkUs4fXKCfPMQNVJ5+g2hwrG/AEH9gXIcDP/WOBcUprAKv6M28Xmn/wmS2MaMgMIPoSoxjS60UkHc02nIdHyjux4YGXJ22u0ZYRS7zF2Ehh4Ha/3wIiGOZF3SV+R3Ezjl3DhUBnRU+rf6ZJ7NDLeTEgKE50vWp97MNPkc87qW7OHGBris+jsyBD3OliEDz33pksCDKxqdojlqk845h0aYk5/RbaMOg5ELrl9XA5/Xfmf8dKdrxDduSHiLcCVbytALIDSgCzJaWGjXE5iBeko6MjYD+etmpCJ7Kc0YgJIVVne94ax3sUbg/zJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729103022; c=relaxed/relaxed;
	bh=VruusQONQFjzT9HW1JV4XihdJJFRYObHq45UpBeErO8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aOBhbjacOk0fMC/ZMHGBFUrdxA0/PVcoNePMqjy0JXI/485Q8/o38QAcoYxwGutNW45jV3K2r9lp9MnzmmmDNEHkvrz2BaLxjS3PzPNT8G4EkEITJCD0cGYJQSqJoSE8hvlsjyt7/jxkpvjif8q4cuIZ70LG5UPpqeOot0ijfNIj5EytgPS7LhcwLMYILWBxljVuYflq3+VE/s1nuXQ72bGKXDR9Tx29YfRoItEOcw+pYUZcTbr2L3YueQD6nBibwD8k0ArXEuqKFpm8E+g88Q0ZZ6pvxPBP8xEeBM1a1DgFA8BHlm3IHyd2+ZgxRB1O2H1ubtQtB8jV7/HP/egSbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eJAnY8r2; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eJAnY8r2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTK985Fd1z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 05:23:39 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GHUKTg022043;
	Wed, 16 Oct 2024 18:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VruusQ
	ONQFjzT9HW1JV4XihdJJFRYObHq45UpBeErO8=; b=eJAnY8r2jyzHnKgQ3QnkfJ
	okzLCdIpoZ/N1Hflc+sItSAZjctNtVD55CYV2PmAA63/DUuShGVsxUyMci/ULuZp
	BWJ1wKcuZePK4TcLKsU+jNZpvprguF3NTRi/JWP1v1X4mFUUfyN3Zz51ZjKtjf/z
	N6s8PK5YHIRzIqm9SAyF8N+a4R5LIkIjy/9ekHgaHX2yJbE3pwVJXQjCBHPm4bq2
	8SYqN4QIlFi1iNW9lVspX6Jq2rTqo8LxEZKL8h1lP4oAs5nIpN777hGEmHEdIYvF
	cjVZxso61MYDlAlhwwlSEhF2rlmO/Hi6gWYHe3JWKGOOVkNmeUGbD4lBNG7i3QhA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ahxj06tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 18:23:34 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49GINYtH004060;
	Wed, 16 Oct 2024 18:23:34 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ahxj06tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 18:23:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49GHxY7V005215;
	Wed, 16 Oct 2024 18:23:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285njak7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 18:23:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49GINT2j54133186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 18:23:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF35920043;
	Wed, 16 Oct 2024 18:23:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E58520040;
	Wed, 16 Oct 2024 18:23:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.239])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 18:23:23 +0000 (GMT)
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
In-Reply-To: <CAP-5=fWQsQp3WgJcLvZWsBsiJ2VzxP6j2kOfd5Hrzi0oBUNy2g@mail.gmail.com>
Date: Wed, 16 Oct 2024 23:53:10 +0530
Cc: Namhyung Kim <namhyung@kernel.org>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E64BA2C9-3046-4C96-ACB8-A4F0D99BDA40@linux.vnet.ibm.com>
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
 <Zw1UXbWTS9Gk3lmw@google.com>
 <8B5B2251-E41E-4584-881E-61A468AFB222@linux.vnet.ibm.com>
 <CAP-5=fWQsQp3WgJcLvZWsBsiJ2VzxP6j2kOfd5Hrzi0oBUNy2g@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dbADMUnoAbi2KqOhgH4vZM8ROHXSU7HI
X-Proofpoint-ORIG-GUID: 6r9WWZlP-1id1hj75wgGiZ0uRW2Halng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 16 Oct 2024, at 8:36=E2=80=AFPM, Ian Rogers <irogers@google.com> =
wrote:
>=20
> On Wed, Oct 16, 2024 at 5:30=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 14 Oct 2024, at 10:56=E2=80=AFPM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>>>=20
>>> Hello Athira,
>>>=20
>>> On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
>>>> perf fails to compile on systems with GCC version11
>>>> as below:
>>>>=20
>>>> In file included from /usr/include/string.h:519,
>>>>                from =
/home/athir/perf-tools-next/tools/include/linux/bitmap.h:5,
>>>>                from =
/home/athir/perf-tools-next/tools/perf/util/pmu.h:5,
>>>>                from =
/home/athir/perf-tools-next/tools/perf/util/evsel.h:14,
>>>>                from =
/home/athir/perf-tools-next/tools/perf/util/evlist.h:14,
>>>>                from tests/tool_pmu.c:3:
>>>> In function =E2=80=98strncpy=E2=80=99,
>>>>   inlined from =E2=80=98do_test=E2=80=99 at tests/tool_pmu.c:25:3:
>>>> /usr/include/bits/string_fortified.h:95:10: error: =
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 128 equals =
destination size [-Werror=3Dstringop-truncation]
>>>>  95 |   return __builtin___strncpy_chk (__dest, __src, __len,
>>>>     |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>  96 |                                   __glibc_objsize (__dest));
>>>>     |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>=20
>>>> The compile error is from strncpy refernce in do_test:
>>>> strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
>>>>=20
>>>> This behaviour is not observed with GCC version 8, but observed
>>>> with GCC version 11 . This is message from gcc for detecting
>>>> truncation while using strncpu. Use snprintf instead of strncpy
>>>> here to be safe.
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>=20
>>> I found this issue now and thanks for the quick fix.  I will push to
>>> perf-tools-next soon.
>>>=20
>>> Thanks,
>>> Namhyung
>>>=20
>>=20
>> Sure
>>=20
>> Thanks Namhyung for pulling in the change
>>=20
>> Athira
>=20
> Thanks for the fixes. As this is test code I don't think performance,
> style, etc. matter much. The GCC strncpy warnings are annoying imo,
> I'm not sure it makes sense for them to be enabled. I see in the
> kernel lots of "sizeof(foo)-1" as a workaround. strlcpy looks like a
> better alternative but it gets a checkpatch warning as in the kernel
> strscpy is preferred. Perhaps we should create a strscpy shim.
>=20

IIUC, strscpy is defined in kernel source and is currently not used in =
tools side.

Ian,
Your point here is that we can create an interface in tools side so that =
we can later safely use strscpy in cases like this ?

Thanks
Athira

> Thanks,
> Ian
>=20
>>>> ---
>>>> tools/perf/tests/tool_pmu.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/tools/perf/tests/tool_pmu.c =
b/tools/perf/tests/tool_pmu.c
>>>> index 94d0dd8fd3cb..297cc8c55579 100644
>>>> --- a/tools/perf/tests/tool_pmu.c
>>>> +++ b/tools/perf/tests/tool_pmu.c
>>>> @@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool =
with_pmu)
>>>> if (with_pmu)
>>>> snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
>>>> else
>>>> - strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
>>>> + snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
>>>>=20
>>>> parse_events_error__init(&err);
>>>> ret =3D parse_events(evlist, str, &err);
>>>> --
>>>> 2.43.5



