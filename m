Return-Path: <linuxppc-dev+bounces-6282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51FA38DCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 22:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxZpM3H67z2xxy;
	Tue, 18 Feb 2025 08:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739795165;
	cv=none; b=Jyoo/JyiyvAE7Fh+8syrkFYV+C/kFetaRLWGPeVCezQqPMKOSAg9V1mYYdhegV+2R9HYQ9g2xgtpiR5KefQV08D5Hn9DmkST31qzl5IRpIEWs6+nyrALMFhP+VvVdl2qOEizMWfWvI/8K4E1pwKF/ORc/OFIxZMJsKWzeC70nY6PQ0uhDErp7BEa9g/5vPUBKeJeHkUkgTQl/PZ3vxLevslICGsHwxJLSrIft1SUOHwR1ZpPvZmiq9qwqT77HqJYr2CRNpV4s2gdUmVyQkvpWhEb2yp5IFVwF7eRx5XdVR+ZjnwohEc0L+RGzKjoBUY7O+hnbQa+0rj+Ekr6B8Fpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739795165; c=relaxed/relaxed;
	bh=4VKw9C3nSKpJ7C5bxloJo4w3wslMmJAucN4BmnqbP54=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=B1hmBRFwn80RAvTuSk9EZO5oEPd5ZULR5vWKGIOCdepFD16SKPSf8wFNcK5xc/BTmJPuBnOYPUR75S05cUb72CDKrdR3/CX1uGBZhaemFL+oUTkDTNP8HDbmRTx2oZI/aPikQSv0czS3d8m0uaPozb0R95StE6O/STXGI7XpXWfJutIQLPu097BU4z4OfyUdffZhIBrQqcMcCy/UCquCrtplcLOv1+WhR4sixZc4Mn8qKsFajq8ZROL/e4Ub3ZxPVc/jDDGbAFp94PRyzYb7Xs3Qg2kI/+Imz2cdZYLhaO0PXIN25h7GSzN0J8wG3Wx+fCPb365Rp90o5Uo+6wLCbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4uV4dI3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4uV4dI3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxMMK1jqdz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 23:26:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H7WkFp025556;
	Mon, 17 Feb 2025 12:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4VKw9C
	3nSKpJ7C5bxloJo4w3wslMmJAucN4BmnqbP54=; b=i4uV4dI3s8Fmjw/CzlQYVo
	TjngvZBpbpmCnkcS4IrF5tajkdipB66h6zJSOL8WKW12G4Os7rI6ZAoWvu8yDir3
	q3xhbrK/zqIy3UQ5wFaA9jTPw7p1Z0a0nP1HylMkHQLD6X/l/nai4K1bB3CZEbeA
	X52hcXDkeTZrm5HGh07nixN6DmqMRGId1n+LWCqbvdlgfz+k2OYN1+ZtSvd3BA43
	LiZQDLpbeqUsU0/6fZ2Xg3ttUieXKrRHtWnwdLLqJHZzmej/EtzRSH+YDnBYOJ9t
	VtCO9cyESyRu0DhEqVNt4d0B/84WYeUQi25NuIvJHcQv0e5ZOf0Smumyf6cCqlmw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44v0tp1c7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:25:58 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HCFxUf011215;
	Mon, 17 Feb 2025 12:25:57 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44v0tp1c7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:25:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H8U3WO003891;
	Mon, 17 Feb 2025 12:25:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u68np148-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:25:56 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HCPrgF53674490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 12:25:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4820320043;
	Mon, 17 Feb 2025 12:25:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 556DF20040;
	Mon, 17 Feb 2025 12:25:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.34])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 17 Feb 2025 12:25:46 +0000 (GMT)
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
Subject: Re: [PATCH] tools/perf: Add check to tool pmu tests to ensure if the
 event is valid
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <Z61oWlOoyF0BKwYV@google.com>
Date: Mon, 17 Feb 2025 17:55:33 +0530
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <BCC6464B-C112-4C00-B58D-62F4B1EB0F46@linux.ibm.com>
References: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
 <Z61oWlOoyF0BKwYV@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>,
        James Clark <james.clark@linaro.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ms6mcnvRpME2DgEE77fwcaGEbwsiqXxN
X-Proofpoint-ORIG-GUID: 0hoxVe_OD-FkEb30E07nK7le8zWycRKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 13 Feb 2025, at 9:04=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Thu, Feb 13, 2025 at 12:24:38AM +0530, Athira Rajeev wrote:
>> "Tool PMU" tests fails on powerpc as below:
>>=20
>>   12.1: Parsing without PMU name:
>>   --- start ---
>>   test child forked, pid 48492
>>   Using CPUID 0x00800200
>>   Attempt to add: tool/duration_time/
>>   ..after resolving event: tool/config=3D0x1/
>>   duration_time -> tool/duration_time/
>>   Attempt to add: tool/user_time/
>>   ..after resolving event: tool/config=3D0x2/
>>   user_time -> tool/user_time/
>>   Attempt to add: tool/system_time/
>>   ..after resolving event: tool/config=3D0x3/
>>   system_time -> tool/system_time/
>>   Attempt to add: tool/has_pmem/
>>   ..after resolving event: tool/config=3D0x4/
>>   has_pmem -> tool/has_pmem/
>>   Attempt to add: tool/num_cores/
>>   ..after resolving event: tool/config=3D0x5/
>>   num_cores -> tool/num_cores/
>>   Attempt to add: tool/num_cpus/
>>   ..after resolving event: tool/config=3D0x6/
>>   num_cpus -> tool/num_cpus/
>>   Attempt to add: tool/num_cpus_online/
>>   ..after resolving event: tool/config=3D0x7/
>>   num_cpus_online -> tool/num_cpus_online/
>>   Attempt to add: tool/num_dies/
>>   ..after resolving event: tool/config=3D0x8/
>>   num_dies -> tool/num_dies/
>>   Attempt to add: tool/num_packages/
>>   ..after resolving event: tool/config=3D0x9/
>>   num_packages -> tool/num_packages/
>>=20
>>   ---- unexpected signal (11) ----
>>   12.1: Parsing without PMU name                                      =
: FAILED!
>>=20
>> Same fail is observed for "Parsing with PMU name" as well.
>>=20
>> The testcase loops through events in tool_pmu__for_each_event()
>> and access event name using "tool_pmu__event_to_str()".
>> Here tool_pmu__event_to_str returns null for "slots" event
>> and "system_tsc_freq" event. These two events are only applicable
>> for arm64 and x86 respectively. So the function =
tool_pmu__event_to_str()
>> skips for unsupported events and returns null. This null value is
>> causing testcase fail.
>>=20
>> To address this in "Tool PMU" testcase, add a helper function
>> tool_pmu__all_event_to_str() which returns the name for all
>> events mapping to the tool_pmu_event index including the
>> skipped ones. So that even if its a skipped event, the
>> helper function helps to resolve the tool_pmu_event index to
>> its mapping event name. Update the testcase to check for null event
>> names before proceeding the test.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Please take a look at:
> =
https://lore.kernel.org/r/20250212163859.1489916-1-james.clark@linaro.org
>=20
> Thanks,
> Namhyung

Hi,

Sure thanks for the fix James

Thomas,
Thanks for testing this patch.  But James already fixed this with a =
different patch and it is part of perf-tools-next
=
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/c=
ommit/?h=3Dperf-tools-next&id=3D615ec00b06f78912c370b372426190768402a5b9

Please test with latest perf-tools-next=20

Thanks
Athira

>=20
>> ---
>> tools/perf/tests/tool_pmu.c | 12 ++++++++++++
>> tools/perf/util/tool_pmu.c  | 17 +++++++++++++++++
>> tools/perf/util/tool_pmu.h  |  1 +
>> 3 files changed, 30 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/tool_pmu.c =
b/tools/perf/tests/tool_pmu.c
>> index 187942b749b7..e468e5fb3c73 100644
>> --- a/tools/perf/tests/tool_pmu.c
>> +++ b/tools/perf/tests/tool_pmu.c
>> @@ -19,6 +19,18 @@ static int do_test(enum tool_pmu_event ev, bool =
with_pmu)
>> return TEST_FAIL;
>> }
>>=20
>> + /*
>> +  * if tool_pmu__event_to_str returns NULL, Check if the event is
>> +  * valid for the platform.
>> +  * Example:
>> +  * slots event is only on arm64.
>> +  * system_tsc_freq event is only on x86.
>> +  */
>> + if (!tool_pmu__event_to_str(ev) && =
tool_pmu__skip_event(tool_pmu__all_event_to_str(ev))) {
>> + ret =3D TEST_OK;
>> + goto out;
>> + }
>> +
>> if (with_pmu)
>> snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
>> else
>> diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
>> index 3a68debe7143..572422797f6e 100644
>> --- a/tools/perf/util/tool_pmu.c
>> +++ b/tools/perf/util/tool_pmu.c
>> @@ -60,6 +60,15 @@ int tool_pmu__num_skip_events(void)
>> return num;
>> }
>>=20
>> +/*
>> + * tool_pmu__event_to_str returns only supported event names.
>> + * For events which are supposed to be skipped in the platform,
>> + * return NULL
>> + *
>> + * tool_pmu__all_event_to_str returns the name for all
>> + * events mapping to the tool_pmu_event index including the
>> + * skipped ones.
>> + */
>> const char *tool_pmu__event_to_str(enum tool_pmu_event ev)
>> {
>> if ((ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX) &&
>> @@ -69,6 +78,14 @@ const char *tool_pmu__event_to_str(enum =
tool_pmu_event ev)
>> return NULL;
>> }
>>=20
>> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev)
>> +{
>> + if (ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX)
>> + return tool_pmu__event_names[ev];
>> +
>> + return NULL;
>> +}
>> +
>> enum tool_pmu_event tool_pmu__str_to_event(const char *str)
>> {
>> int i;
>> diff --git a/tools/perf/util/tool_pmu.h b/tools/perf/util/tool_pmu.h
>> index a60184859080..da76808ae71e 100644
>> --- a/tools/perf/util/tool_pmu.h
>> +++ b/tools/perf/util/tool_pmu.h
>> @@ -30,6 +30,7 @@ enum tool_pmu_event {
>> for ((ev) =3D TOOL_PMU__EVENT_DURATION_TIME; (ev) < =
TOOL_PMU__EVENT_MAX; ev++)
>>=20
>> const char *tool_pmu__event_to_str(enum tool_pmu_event ev);
>> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev);
>> enum tool_pmu_event tool_pmu__str_to_event(const char *str);
>> bool tool_pmu__skip_event(const char *name);
>> int tool_pmu__num_skip_events(void);
>> --=20
>> 2.43.5



