Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56929804AF7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 08:15:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4/H4iYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SksHs48Kpz3ckc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 18:15:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4/H4iYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SksGx2xfzz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 18:14:32 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B56bLva005965;
	Tue, 5 Dec 2023 07:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=W03BAM1dwfa62e0yZERYiXA7hzsYpoofazCRGbIlG4M=;
 b=V4/H4iYrO0r3e51zj8BniwL/CxkGAnq17uT7jF41+p6dfkmBGxg5A/SV1oDPB3RIHru5
 cafqADceWxbyfmyd0/4AMSFcXjltsA6Y/8SwwuYcua5O/IXRHpzKF2RH3uUnXZF+LK7c
 EhgvLfpUlW/hLT+owYyn6bcunOrYNMtEbvFw6vMNfGDpEtfOD4waR7ufaCHPGNh0e1bf
 z2Dj8w8swDqyHQaAZO8UmxID6oeEClv4QborWiZwoC8KdoZIvyptUwYQPNk7hA2cJyFC
 Jtnea5pxjPMpfpQAnp4xzV/0mQ6BS/vjG+05Rxv9KKvcKrK5LuFdlJKx9UAqBrhzFNZA 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3usxrm96rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:14:23 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B57B4E0032561;
	Tue, 5 Dec 2023 07:14:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3usxrm96qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:14:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B56Y17u024726;
	Tue, 5 Dec 2023 07:14:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urv8dswpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:14:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B57EJrh18612864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 07:14:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37D8520043;
	Tue,  5 Dec 2023 07:14:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E09C20040;
	Tue,  5 Dec 2023 07:14:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.218])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  5 Dec 2023 07:14:17 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
Date: Tue, 5 Dec 2023 12:44:05 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD37AC99-0B4A-4F37-9ECB-80A79EFF30A2@linux.vnet.ibm.com>
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wBQ9G56PEI3EZn75v98qvoNipDbURYf0
X-Proofpoint-ORIG-GUID: Dj532z8JX9agtMh94uHwlKmmRp-00lc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050057
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Dec-2023, at 1:42=E2=80=AFAM, Ian Rogers <irogers@google.com> =
wrote:
>=20
> On Thu, Nov 23, 2023 at 8:01=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Running "perf list" on powerpc fails with segfault
>> as below:
>>=20
>>   ./perf list
>>   Segmentation fault (core dumped)
>>=20
>> This happens because of duplicate events in the json list.
>> The powerpc Json event list contains some event with same
>> event name, but different event code. They are:
>> - PM_INST_FROM_L3MISS (Present in datasource and frontend)
>> - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
>> - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
>> - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
>>=20
>> pmu_events_table__num_events uses the value from
>> table_pmu->num_entries which includes duplicate events as
>> well. This causes issue during "perf list" and results in
>> segmentation fault.
>>=20
>> Since both event codes are valid, append _DSRC to the Data
>> Source events (datasource.json), so that they would have a
>> unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
>> PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
>> works as expected.
>>=20
>> Fixes: fc1435807533 ("perf vendor events power10: Update =
JSON/events")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Given duplicate events creates broken pmu-events.c we should capture
> that as an exception in jevents.py. That way a JEVENTS_ARCH=3Dall =
build
> will fail if any vendor/architecture would break in this way. We
> should also add JEVENTS_ARCH=3Dall to tools/perf/tests/make. Athira, =
do
> you want to look at doing this?
>=20
> Thanks,
> Ian

Hi Ian,

That=E2=80=99s a great suggestion. This will definitely help to capture =
the issues ahead.
I am interested and will work on adding this as part of =
tools/perf/tests/make

Thanks
Athira
>=20
>> ---
>> .../arch/powerpc/power10/datasource.json       | 18 =
++++++++++++++----
>> 1 file changed, 14 insertions(+), 4 deletions(-)
>>=20
>> diff --git =
a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json =
b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> index 6b0356f2d301..0eeaaf1a95b8 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> @@ -99,6 +99,11 @@
>>     "EventName": "PM_INST_FROM_L2MISS",
>>     "BriefDescription": "The processor's instruction cache was =
reloaded from a source beyond the local core's L2 due to a demand miss."
>>   },
>> +  {
>> +    "EventCode": "0x0003C0000000C040",
>> +    "EventName": "PM_DATA_FROM_L2MISS_DSRC",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded =
from a source beyond the local core's L2 due to a demand miss."
>> +  },
>>   {
>>     "EventCode": "0x000380000010C040",
>>     "EventName": "PM_INST_FROM_L2MISS_ALL",
>> @@ -161,9 +166,14 @@
>>   },
>>   {
>>     "EventCode": "0x000780000000C040",
>> -    "EventName": "PM_INST_FROM_L3MISS",
>> +    "EventName": "PM_INST_FROM_L3MISS_DSRC",
>>     "BriefDescription": "The processor's instruction cache was =
reloaded from beyond the local core's L3 due to a demand miss."
>>   },
>> +  {
>> +    "EventCode": "0x0007C0000000C040",
>> +    "EventName": "PM_DATA_FROM_L3MISS_DSRC",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded =
from beyond the local core's L3 due to a demand miss."
>> +  },
>>   {
>>     "EventCode": "0x000780000010C040",
>>     "EventName": "PM_INST_FROM_L3MISS_ALL",
>> @@ -981,7 +991,7 @@
>>   },
>>   {
>>     "EventCode": "0x0003C0000000C142",
>> -    "EventName": "PM_MRK_DATA_FROM_L2MISS",
>> +    "EventName": "PM_MRK_DATA_FROM_L2MISS_DSRC",
>>     "BriefDescription": "The processor's L1 data cache was reloaded =
from a source beyond the local core's L2 due to a demand miss for a =
marked instruction."
>>   },
>>   {
>> @@ -1046,12 +1056,12 @@
>>   },
>>   {
>>     "EventCode": "0x000780000000C142",
>> -    "EventName": "PM_MRK_INST_FROM_L3MISS",
>> +    "EventName": "PM_MRK_INST_FROM_L3MISS_DSRC",
>>     "BriefDescription": "The processor's instruction cache was =
reloaded from beyond the local core's L3 due to a demand miss for a =
marked instruction."
>>   },
>>   {
>>     "EventCode": "0x0007C0000000C142",
>> -    "EventName": "PM_MRK_DATA_FROM_L3MISS",
>> +    "EventName": "PM_MRK_DATA_FROM_L3MISS_DSRC",
>>     "BriefDescription": "The processor's L1 data cache was reloaded =
from beyond the local core's L3 due to a demand miss for a marked =
instruction."
>>   },
>>   {
>> --
>> 2.39.3


