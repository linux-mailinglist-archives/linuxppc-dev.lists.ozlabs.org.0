Return-Path: <linuxppc-dev+bounces-6281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702DA38DC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 22:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxZng5QNZz2xgp;
	Tue, 18 Feb 2025 08:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739794696;
	cv=none; b=VVjHK9fQwMg53I9Bsfq4ySb+Ud+Hhiqpq5eUbaf52YY1SxyL1CYNxtU9lClo6VMdj9Y6hb78UY5VPNzcU76JMRVK3LQWuYZkWqNDGCqHjpYP4fdEIlCb6/TpseRjRgeu89Zy6sZ3cG/PZHFBo1b0PN3WM/CBBd3ZtgzOwIyIXkI6bvF5P/OyoUfQg49rcGt5tId17zfSlZUJqfXfezE4hDSJTEp/s2zL3PpSNJFTYjS8rkkz66as9TbNsw+fsI+Y6QXLSIXcGqhNnZotT8nd7oDrtLQsyvHFvDJlD5lIHW4eJ2B2hNgR4YqwfTK105C/yz6PCx7eTbdoEISFbphDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739794696; c=relaxed/relaxed;
	bh=MIEQNAU/fiauFH6+CL2PWeRIqpF2Jjl6N4X/geT76YQ=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=NB6KpeYXIiNlVqxw+EPpVWje0Hqs5bpEo6Ru8nTBeIlZZAg3Yae8ybiq4dHJIZ73aWMDR96SiYGe+AhdTZ56kDnLIst/mxpgSmBCaWEsh661c3hQyQTxbl/OXwO5A0ooiyMX4LpwJDmXOenKgEncMrpjJHhI+RoNchCKGPmLvS1VeeaoyWYuVrQqqxTVYYQLmHWlrobhen1UpTvVAJilx99dvLAYFawPclbTyBuIIAaPS4P3uqFngFz2v8n+lUWzg08Jc5voG87/pz98GF3uW1mLLf6hDFS5Q7GzJCLUL6OsNfdV0hwLOjux2w9OwBKf2Tbv7wR7931Q9AmBAofNcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJI9wLOg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJI9wLOg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxMBH0bwbz301n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 23:18:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H19eHE016399;
	Mon, 17 Feb 2025 12:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=MIEQNAU/fiauFH6+CL2PWeRIqpF2Jj
	l6N4X/geT76YQ=; b=IJI9wLOgia54FHIprMdgewJTOBkRF4n1jaUoe//i+kEz7L
	NRGm+hzTvHs54+Y/rFRwnEoiHrVUl39ufLnLkEFThaBAYoelL2eGifVmImfR/SS/
	2B+GM5o4LRY0PP0zJvqmhPvtvVZGnzpIYta8RSK801kmXygOVapFzQGILb5Yw8sX
	CcG7FN/wvGUTqDPbFlp8s5hZinQThQQPyt6DzXFQYasgudu9XWRplemtpspinuwg
	1SI4QUtSm6DnK8y/MEa5VvPBOOVE+K14yBKfGgVF65+marpQ6GF+JQH77/13ukVX
	4kmqBR5vs/zn13lcKhTeErPUAAwTdRj74dSBYbcw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uu69as4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:18:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HC8xYZ008190;
	Mon, 17 Feb 2025 12:18:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uu69as4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:18:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H8U3V4003891;
	Mon, 17 Feb 2025 12:18:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u68np0fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 12:18:06 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HCI2vt44433892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 12:18:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83C5420043;
	Mon, 17 Feb 2025 12:18:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11D1820040;
	Mon, 17 Feb 2025 12:17:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.34])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 17 Feb 2025 12:17:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
Message-Id: <EA54B231-A065-4ED3-8678-1A84CC1D4931@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7189952D-CFA7-4F07-8881-DBBE0AF5CDD0"
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
Date: Mon, 17 Feb 2025 17:47:42 +0530
In-Reply-To: <Z61oWlOoyF0BKwYV@google.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
To: Namhyung Kim <namhyung@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>,
        James Clark <james.clark@linaro.org>
References: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
 <Z61oWlOoyF0BKwYV@google.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ybR_ay0la1r_ZGVpEXnrscnLmzLAVE4h
X-Proofpoint-ORIG-GUID: x82NwIcys8V8FB648D6TLiLK0JFNPphg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--Apple-Mail=_7189952D-CFA7-4F07-8881-DBBE0AF5CDD0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



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
>> 		return TEST_FAIL;
>> 	}
>>=20
>> +	/*
>> +	 * if tool_pmu__event_to_str returns NULL, Check if the event is
>> +	 * valid for the platform.
>> +	 * Example:
>> +	 * slots event is only on arm64.
>> +	 * system_tsc_freq event is only on x86.
>> +	 */
>> +	if (!tool_pmu__event_to_str(ev) && =
tool_pmu__skip_event(tool_pmu__all_event_to_str(ev))) {
>> +		ret =3D TEST_OK;
>> +		goto out;
>> +	}
>> +
>> 	if (with_pmu)
>> 		snprintf(str, sizeof(str), "tool/%s/", =
tool_pmu__event_to_str(ev));
>> 	else
>> diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
>> index 3a68debe7143..572422797f6e 100644
>> --- a/tools/perf/util/tool_pmu.c
>> +++ b/tools/perf/util/tool_pmu.c
>> @@ -60,6 +60,15 @@ int tool_pmu__num_skip_events(void)
>> 	return num;
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
>> 	if ((ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX) &&
>> @@ -69,6 +78,14 @@ const char *tool_pmu__event_to_str(enum =
tool_pmu_event ev)
>> 	return NULL;
>> }
>>=20
>> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev)
>> +{
>> +	if (ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX)
>> +		return tool_pmu__event_names[ev];
>> +
>> +	return NULL;
>> +}
>> +
>> enum tool_pmu_event tool_pmu__str_to_event(const char *str)
>> {
>> 	int i;
>> diff --git a/tools/perf/util/tool_pmu.h b/tools/perf/util/tool_pmu.h
>> index a60184859080..da76808ae71e 100644
>> --- a/tools/perf/util/tool_pmu.h
>> +++ b/tools/perf/util/tool_pmu.h
>> @@ -30,6 +30,7 @@ enum tool_pmu_event {
>> 	for ((ev) =3D TOOL_PMU__EVENT_DURATION_TIME; (ev) < =
TOOL_PMU__EVENT_MAX; ev++)
>>=20
>> const char *tool_pmu__event_to_str(enum tool_pmu_event ev);
>> +const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev);
>> enum tool_pmu_event tool_pmu__str_to_event(const char *str);
>> bool tool_pmu__skip_event(const char *name);
>> int tool_pmu__num_skip_events(void);
>> --=20
>> 2.43.5


--Apple-Mail=_7189952D-CFA7-4F07-8881-DBBE0AF5CDD0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 13 Feb 2025, at 9:04=E2=80=AFAM, Namhyung Kim =
&lt;namhyung@kernel.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On Thu, Feb 13, 2025 at 12:24:38AM +0530, =
Athira Rajeev wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">"Tool PMU" tests fails on powerpc as =
below:<br><br>&nbsp;&nbsp;12.1: Parsing without PMU =
name:<br>&nbsp;&nbsp;--- start ---<br>&nbsp;&nbsp;test child forked, pid =
48492<br>&nbsp;&nbsp;Using CPUID 0x00800200<br>&nbsp;&nbsp;Attempt to =
add: tool/duration_time/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x1/<br>&nbsp;&nbsp;duration_time -&gt; =
tool/duration_time/<br>&nbsp;&nbsp;Attempt to add: =
tool/user_time/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x2/<br>&nbsp;&nbsp;user_time -&gt; =
tool/user_time/<br>&nbsp;&nbsp;Attempt to add: =
tool/system_time/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x3/<br>&nbsp;&nbsp;system_time -&gt; =
tool/system_time/<br>&nbsp;&nbsp;Attempt to add: =
tool/has_pmem/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x4/<br>&nbsp;&nbsp;has_pmem -&gt; =
tool/has_pmem/<br>&nbsp;&nbsp;Attempt to add: =
tool/num_cores/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x5/<br>&nbsp;&nbsp;num_cores -&gt; =
tool/num_cores/<br>&nbsp;&nbsp;Attempt to add: =
tool/num_cpus/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x6/<br>&nbsp;&nbsp;num_cpus -&gt; =
tool/num_cpus/<br>&nbsp;&nbsp;Attempt to add: =
tool/num_cpus_online/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x7/<br>&nbsp;&nbsp;num_cpus_online -&gt; =
tool/num_cpus_online/<br>&nbsp;&nbsp;Attempt to add: =
tool/num_dies/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x8/<br>&nbsp;&nbsp;num_dies -&gt; =
tool/num_dies/<br>&nbsp;&nbsp;Attempt to add: =
tool/num_packages/<br>&nbsp;&nbsp;..after resolving event: =
tool/config=3D0x9/<br>&nbsp;&nbsp;num_packages -&gt; =
tool/num_packages/<br><br>&nbsp;&nbsp;---- unexpected signal (11) =
----<br>&nbsp;&nbsp;12.1: Parsing without PMU name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
: FAILED!<br><br>Same fail is observed for "Parsing with PMU name" as =
well.<br><br>The testcase loops through events in =
tool_pmu__for_each_event()<br>and access event name using =
"tool_pmu__event_to_str()".<br>Here tool_pmu__event_to_str returns null =
for "slots" event<br>and "system_tsc_freq" event. These two events are =
only applicable<br>for arm64 and x86 respectively. So the function =
tool_pmu__event_to_str()<br>skips for unsupported events and returns =
null. This null value is<br>causing testcase fail.<br><br>To address =
this in "Tool PMU" testcase, add a helper =
function<br>tool_pmu__all_event_to_str() which returns the name for =
all<br>events mapping to the tool_pmu_event index including =
the<br>skipped ones. So that even if its a skipped event, the<br>helper =
function helps to resolve the tool_pmu_event index to<br>its mapping =
event name. Update the testcase to check for null event<br>names before =
proceeding the test.<br><br>Signed-off-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Please take a look at:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><a =
href=3D"https://lore.kernel.org/r/20250212163859.1489916-1-james.clark@lin=
aro.org" style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: =
0px;">https://lore.kernel.org/r/20250212163859.1489916-1-james.clark@linar=
o.org</a><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Thanks,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Namhyung</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: =
none;"></div></blockquote>Hi,</div><div><br></div><div>Sure thanks for =
the fix James</div><div><br></div><div>Thomas,</div><div>Thanks for =
testing this patch. &nbsp;But James already fixed this with a different =
patch and it is part of perf-tools-next</div><div><a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-ne=
xt.git/commit/?h=3Dperf-tools-next&amp;id=3D615ec00b06f78912c370b372426190=
768402a5b9">https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tool=
s-next.git/commit/?h=3Dperf-tools-next&amp;id=3D615ec00b06f78912c370b37242=
6190768402a5b9</a><br></div><div><br></div><div>Please test with latest =
perf-tools-next&nbsp;</div><div><br></div><div>Thanks</div><div>Athira</di=
v><div><br><blockquote type=3D"cite"><div><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">---<br>tools/perf/tests/tool_pmu.c | 12 =
++++++++++++<br>tools/perf/util/tool_pmu.c &nbsp;| 17 =
+++++++++++++++++<br>tools/perf/util/tool_pmu.h &nbsp;| &nbsp;1 +<br>3 =
files changed, 30 insertions(+)<br><br>diff --git =
a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c<br>index =
187942b749b7..e468e5fb3c73 100644<br>--- =
a/tools/perf/tests/tool_pmu.c<br>+++ b/tools/perf/tests/tool_pmu.c<br>@@ =
-19,6 +19,18 @@ static int do_test(enum tool_pmu_event ev, bool =
with_pmu)<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return TEST_FAIL;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br><br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/*<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>* if =
tool_pmu__event_to_str returns NULL, Check if the event is<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* valid for the =
platform.<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>* =
Example:<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* slots event =
is only on arm64.<br>+<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>* =
system_tsc_freq event is only on x86.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!tool_pmu__event_to_str(ev) &amp;&amp; =
tool_pmu__skip_event(tool_pmu__all_event_to_str(ev))) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ret =3D =
TEST_OK;<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>goto out;<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>}<br>+<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (with_pmu)<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>snprintf(str, sizeof(str), "tool/%s/", =
tool_pmu__event_to_str(ev));<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>else<br>diff --git =
a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c<br>index =
3a68debe7143..572422797f6e 100644<br>--- =
a/tools/perf/util/tool_pmu.c<br>+++ b/tools/perf/util/tool_pmu.c<br>@@ =
-60,6 +60,15 @@ int tool_pmu__num_skip_events(void)<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
num;<br>}<br><br>+/*<br>+ * tool_pmu__event_to_str returns only =
supported event names.<br>+ * For events which are supposed to be =
skipped in the platform,<br>+ * return NULL<br>+ *<br>+ * =
tool_pmu__all_event_to_str returns the name for all<br>+ * events =
mapping to the tool_pmu_event index including the<br>+ * skipped =
ones.<br>+ */<br>const char *tool_pmu__event_to_str(enum tool_pmu_event =
ev)<br>{<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if ((ev &gt; TOOL_PMU__EVENT_NONE &amp;&amp; ev &lt; =
TOOL_PMU__EVENT_MAX) &amp;&amp;<br>@@ -69,6 +78,14 @@ const char =
*tool_pmu__event_to_str(enum tool_pmu_event ev)<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
NULL;<br>}<br><br>+const char *tool_pmu__all_event_to_str(enum =
tool_pmu_event ev)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (ev &gt; TOOL_PMU__EVENT_NONE =
&amp;&amp; ev &lt; TOOL_PMU__EVENT_MAX)<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return =
tool_pmu__event_names[ev];<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return NULL;<br>+}<br>+<br>enum =
tool_pmu_event tool_pmu__str_to_event(const char *str)<br>{<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int =
i;<br>diff --git a/tools/perf/util/tool_pmu.h =
b/tools/perf/util/tool_pmu.h<br>index a60184859080..da76808ae71e =
100644<br>--- a/tools/perf/util/tool_pmu.h<br>+++ =
b/tools/perf/util/tool_pmu.h<br>@@ -30,6 +30,7 @@ enum tool_pmu_event =
{<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>for ((ev) =3D TOOL_PMU__EVENT_DURATION_TIME; (ev) &lt; =
TOOL_PMU__EVENT_MAX; ev++)<br><br>const char =
*tool_pmu__event_to_str(enum tool_pmu_event ev);<br>+const char =
*tool_pmu__all_event_to_str(enum tool_pmu_event ev);<br>enum =
tool_pmu_event tool_pmu__str_to_event(const char *str);<br>bool =
tool_pmu__skip_event(const char *name);<br>int =
tool_pmu__num_skip_events(void);<br>--<span =
class=3D"Apple-converted-space">&nbsp;</span><br>2.43.5</blockquote></div>=
</blockquote></div><br></body></html>=

--Apple-Mail=_7189952D-CFA7-4F07-8881-DBBE0AF5CDD0--


