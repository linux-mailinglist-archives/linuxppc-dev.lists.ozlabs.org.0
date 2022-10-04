Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D04505F3D0B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 09:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhTL25wZvz30NS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 18:07:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=db8TB7mc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=db8TB7mc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhTK30vj4z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 18:06:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2946DIc3007563;
	Tue, 4 Oct 2022 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0CiTem17gfsKOFM1wXQrCPlweP5eblAohGnupNoTwq4=;
 b=db8TB7mcmxnqEjUDi8D2mw4QfmnYmTDoIHG9TDWGnc/0W57GSKdzPqi3kTjIBvLLPeeX
 v7dM1nYZmZG56L1e5x3BaOQsTtCmrzTtaI5llfiD24rMeOmAXnRI7ZC8JdqsL324ntwH
 q8makjne9TqLuNxz4blJGT+CAKzIcx08vFZknyOdyWUQ123paZ6N+0iZsh7pZmdatRQH
 RDn5ar2MxGSpfwW/M4xf8bFN2Es2fxkc2CgX+1OxNIQ0Cr5kOhNv5tiGBBG9aQ96EMAE
 wRIhLBVhsHRfcSVkJylAYmvfQf5x/npwgeH/l4in8E5zm4rr+7q9RaL1wBK87QPEQqnz Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0fc99bb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 07:06:38 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2946kflK014669;
	Tue, 4 Oct 2022 07:06:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0fc99ba9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 07:06:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 294769Qr031094;
	Tue, 4 Oct 2022 07:06:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3jxd693qxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 07:06:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 294724dl37552490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Oct 2022 07:02:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36BCE42045;
	Tue,  4 Oct 2022 07:06:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F9A842042;
	Tue,  4 Oct 2022 07:06:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.104.20])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Tue,  4 Oct 2022 07:06:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
Date: Tue, 4 Oct 2022 12:36:27 +0530
Message-Id: <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com>
 <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
 <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com>
 <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        James Clark <james.clark@arm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yVxAvirSTQmSXjs1dlYxTaHXB0AyszW_
X-Proofpoint-ORIG-GUID: 9fjYzyc4ysjNhxfIbbFGXYh9JpXgBsX3
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040045
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 04-Oct-2022, at 12:21 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Mon, Oct 3, 2022 at 7:03 AM atrajeev <atrajeev@imap.linux.ibm.com> wro=
te:
>>=20
>> On 2022-10-02 05:17, Ian Rogers wrote:
>>> On Thu, Sep 29, 2022 at 5:56 AM James Clark <james.clark@arm.com>
>>> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>> On 29/09/2022 09:49, Athira Rajeev wrote:
>>>>>=20
>>>>>=20
>>>>>> On 28-Sep-2022, at 9:05 PM, James Clark <james.clark@arm.com> wrote:
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>> Hi James,
>>>>>=20
>>>>> Thanks for looking at the patch and sharing review comments.
>>>>>=20
>>>>>> On 13/09/2022 12:57, Athira Rajeev wrote:
>>>>>>> perf stat includes option to specify aggr_mode to display
>>>>>>> per-socket, per-core, per-die, per-node counter details.
>>>>>>> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
>>>>>>> counter values are displayed for each cpu along with "CPU"
>>>>>>> value in one field of the output.
>>>>>>>=20
>>>>>>> Each of the aggregate mode uses the information fetched
>>>>>>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
>>>>>>=20
>>>>>> I thought that this wouldn't apply to the cpu field because cpu is
>>>>>> basically interchangeable as an index in cpumap, rather than anything
>>>>>> being read from the topology file.
>>>>>=20
>>>>> The cpu value is filled in this function:
>>>>>=20
>>>>> Function : aggr_cpu_id__cpu
>>>>> Code: util/cpumap.c
>>>>>=20
>>>>>>=20
>>>>>>> physical_package_id. Utility functions in "cpumap.c" fetches
>>>>>>> this information and populates the socket id, core id, cpu etc.
>>>>>>> If the platform does not expose the topology information,
>>>>>>> these values will be set to -1. Example, in case of powerpc,
>>>>>>> details like physical_package_id is restricted to be exposed
>>>>>>> in pSeries platform. So id.socket, id.core, id.cpu all will
>>>>>>> be set as -1.
>>>>>>>=20
>>>>>>> In case of displaying socket or die value, there is no check
>>>>>>> done in the "aggr_printout" function to see if it points to
>>>>>>> valid socket id or die. But for displaying "cpu" value, there
>>>>>>> is a check for "if (id.core > -1)". In case of powerpc pSeries
>>>>>>> where detail like physical_package_id is restricted to be
>>>>>>> exposed, id.core will be set to -1. Hence the column or field
>>>>>>> itself for CPU won't be displayed in the output.
>>>>>>>=20
>>>>>>> Result for per-socket:
>>>>>>>=20
>>>>>>> <<>>
>>>>>>> perf stat -e branches --per-socket -a true
>>>>>>>=20
>>>>>>> Performance counter stats for 'system wide':
>>>>>>>=20
>>>>>>> S-1      32            416,851      branches
>>>>>>> <<>>
>>>>>>>=20
>>>>>>> Here S has -1 in above result. But with -A option which also
>>>>>>> expects CPU in one column in the result, below is observed.
>>>>>>>=20
>>>>>>> <<>>
>>>>>>> /bin/perf stat -e instructions -A -a true
>>>>>>>=20
>>>>>>> Performance counter stats for 'system wide':
>>>>>>>=20
>>>>>>>           47,146      instructions
>>>>>>>           45,226      instructions
>>>>>>>           43,354      instructions
>>>>>>>           45,184      instructions
>>>>>>> <<>>
>>>>>>>=20
>>>>>>> If the cpu id value is pointing to -1 also, it makes sense
>>>>>>> to display the column in the output to replicate the behaviour
>>>>>>> or to be in precedence with other aggr options(like per-socket,
>>>>>>> per-core). Remove the check "id.core" so that CPU field gets
>>>>>>> displayed in the output.
>>>>>>=20
>>>>>> Why would you want to print -1 out? Seems like the if statement was a
>>>>>> good one to me, otherwise the output looks a bit broken to users. Are
>>>>>> the other aggregation modes even working if -1 is set for socket and
>>>>>> die? Maybe we need to not print -1 in those cases or exit earlier wi=
th a
>>>>>> failure.
>>>>>>=20
>>>>>> The -1 value has a specific internal meaning which is "to not
>>>>>> aggregate". It doesn't mean "not set".
>>>>>=20
>>>>> Currently, this check is done only for printing cpu value.
>>>>> For socket/die/core values, this check is not done. Pasting an
>>>>> example snippet from a powerpc system ( specifically from pseries pla=
tform where
>>>>> the value is set to -1 )
>>>>>=20
>>>>> ./perf stat --per-core -a -C 1 true
>>>>>=20
>>>>> Performance counter stats for 'system wide':
>>>>>=20
>>>>> S-1-D-1-C-1          1               1.06 msec cpu-clock             =
           #    1.018 CPUs utilized
>>>>> S-1-D-1-C-1          1                  2      context-switches      =
           #    1.879 K/sec
>>>>> S-1-D-1-C-1          1                  0      cpu-migrations        =
           #    0.000 /sec
>>>>>=20
>>>>> Here though the value is -1, we are displaying it. Where as in case o=
f cpu, the first column will be
>>>>> empty since we do a check before printing.
>>>>>=20
>>>>> Example:
>>>>>=20
>>>>> ./perf stat --per-core -A -C 1 true
>>>>>=20
>>>>> Performance counter stats for 'CPU(s) 1':
>>>>>=20
>>>>>              0.88 msec cpu-clock                        #    1.022 CP=
Us utilized
>>>>>                 2      context-switches
>>>>>                 0      cpu-migrations
>>>>>=20
>>>>>=20
>>>>> No sure, whether there are scripts out there, which consume the curre=
nt format and
>>>>> not displaying -1 may break it. That is why we tried with change to r=
emove check for cpu, similar to
>>>>> other modes like socket, die, core etc.
>>>>=20
>>>> I wouldn't worry about that because there are json and CSV modes which
>>>> are machine readable, and -1 is already not always displayed. If
>>>> anything this change here is also likely to break parsing by adding -1
>>>> where it wasn't before.
>>>>=20
>>>>>=20
>>>>> Also perf code ie =E2=80=9Caggr_cpu_id__empty=E2=80=9D in util/cpumap=
.c initialises the
>>>>> values to -1 . I was checking to see where we are mapping -1 to =E2=
=80=9Cto not aggregate=E2=80=9D.
>>>>> What I could find is AGGR_NONE ( which is for no-aggr ) has value as =
zero.
>>>>>=20
>>>>> Reference: defined in util/stat.h
>>>>>=20
>>>>> enum aggr_mode {
>>>>>        AGGR_NONE,
>>>>>=20
>>>>=20
>>>> That enum is never written to any of the cpumap members, that defines
>>>> the mode of how to fill the cpu map instead. 0 is a valid value, for
>>>> example "CPU 0". -1 is used as a special case and shouldn't be
>>>> displayed
>>>> IMO.
>>>>=20
>>>> Did you see my comment in the code below about the bad merge? Could
>>>> that
>>>> not be related to your issue?
>>>=20
>>> I'm suspicious of this too. In Claire's patch:
>>>=20
>>>        case AGGR_NONE:
>>> -               if (evsel->percore && !config->percore_show_thread) {
>>> -                       fprintf(config->output, "S%d-D%d-C%*d%s",
>>> -                               id.socket,
>>> -                               id.die,
>>> -                               config->csv_output ? 0 : -3,
>>> -                               id.core, config->csv_sep);
>>> -               } else if (id.cpu.cpu > -1) {
>>> -                       fprintf(config->output, "CPU%*d%s",
>>> -                               config->csv_output ? 0 : -7,
>>> -                               id.cpu.cpu, config->csv_sep);
>>> +               if (config->json_output) {
>>> +                       if (evsel->percore &&
>>> !config->percore_show_thread) {
>>> +                               fprintf(config->output, "\"core\" :
>>> \"S%d-D%d-C%d\"",
>>> +                                       id.socket,
>>> +                                       id.die,
>>> +                                       id.core);
>>> +                       } else if (id.core > -1) {
>>> +                               fprintf(config->output, "\"cpu\" :
>>> \"%d\", ",
>>> +                                       id.cpu.cpu);
>>> +                       }
>>> +               } else {
>>> +                       if (evsel->percore &&
>>> !config->percore_show_thread) {
>>> +                               fprintf(config->output,
>>> "S%d-D%d-C%*d%s",
>>> +                                       id.socket,
>>> +                                       id.die,
>>> +                                       config->csv_output ? 0 : -3,
>>> +                                       id.core, config->csv_sep);
>>> +                       } else if (id.core > -1) {
>>> +                               fprintf(config->output, "CPU%*d%s",
>>> +                                       config->csv_output ? 0 : -7,
>>> +                                       id.cpu.cpu, config->csv_sep);
>>> +                       }
>>>               }
>>>               break;
>>>=20
>>> The old code was using "id.cpu.cpu > -1" while the new code is
>>> "id.core > -1". The value printed is id.cpu.cpu and so testing id.core
>>> makes less sense to me. Going back to the original patch:
>>>=20
>>> https://lore.kernel.org/lkml/20210811224317.1811618-1-cjense@google.com/
>>>  case AGGR_NONE:
>>> - if (evsel->percore && !config->percore_show_thread) {
>>> - fprintf(config->output, "S%d-D%d-C%*d%s",
>>> - id.socket,
>>> - id.die,
>>> - config->csv_output ? 0 : -3,
>>> - id.core, config->csv_sep);
>>> + if (config->json_output) {
>>> + if (evsel->percore && !config->percore_show_thread) {
>>> + fprintf(config->output, "\"core\" : \"S%d-D%d-C%d\"",
>>> + id.socket,
>>> + id.die,
>>> + id.core);
>>> + } else if (id.core > -1) {
>>> + fprintf(config->output, "\"cpu\" : \"%d\", ",
>>> + evsel__cpus(evsel)->map[id.core]);
>>> + }
>>> + } else {
>>> + if (evsel->percore && !config->percore_show_thread) {
>>> + fprintf(config->output, "S%d-D%d-C%*d%s",
>>> + id.socket,
>>> + id.die,
>>> + config->csv_output ? 0 : -3,
>>> + id.core, config->csv_sep);
>>>  } else if (id.core > -1) {
>>>  fprintf(config->output, "CPU%*d%s",
>>>  config->csv_output ? 0 : -7,
>>>  evsel__cpus(evsel)->map[id.core],
>>>  config->csv_sep);
>>> - }
>>> + }
>>> + }
>>> +
>>>  break;
>>>=20
>>> So testing the id.core isn't a bad index makes sense. However, we
>>> changed from core to CPU here:
>>> https://lore.kernel.org/all/20220105061351.120843-26-irogers@google.com/
>>> and that was because of:
>>> https://lore.kernel.org/r/20220105061351.120843-25-irogers@google.com
>>>=20
>>> So I think the code needs to test CPU and not core. Whether that is
>>> addressing the Power test failures is another matter, as James said we
>>> may need a fix in the tests for that.
>>>=20
>>=20
>> Hi Ian, James
>>=20
>> Thanks for the reviews and suggestions.
>>=20
>> After checking through the original commits for id.core vs cpu check,
>> sharing patch below to test CPU and not core.
>>=20
>> From 4dd98d953940deb2f85176cb6b4ecbfd18dbdbf9 Mon Sep 17 00:00:00 2001
>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Date: Mon, 3 Oct 2022 15:47:27 +0530
>> Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in
>> aggr_printout
>>=20
>> perf stat has options to aggregate the counts in different
>> modes like per socket, per core etc. The function "aggr_printout"
>> in util/stat-display.c which is used to print the aggregates,
>> has a check for cpu in case of AGGR_NONE. This check was
>> originally using condition : "if (id.cpu.cpu > -1)". But
>> this got changed after commit df936cadfb58 ("perf stat: Add
>> JSON output option"), which added option to output json format
>> for different aggregation modes. After this commit, the
>> check in "aggr_printout" is using "if (id.core > -1)".
>>=20
>> The old code was using "id.cpu.cpu > -1" while the new code
>> is using "id.core > -1". But since the value printed is
>> id.cpu.cpu, fix this check to use cpu and not core.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Suggested-by: James Clark <james.clark@arm.com>
>> Suggested-by: Ian Rogers <irogers@google.com>
>=20
> The change below works on my dual socket SkylakeX:
> ..
> 85: perf stat CSV output linter                                     :
> Ok
> 86: perf stat csv summary test                                      : Ok
> 87: perf stat JSON output linter                                    : Ok
> ..
> I don't see anything else out of the ordinary.
>=20
> Thanks,
> Ian
>=20

Hi Ian,
Thanks for helping with testing. Can I add your Tested-by for the patch ?

Arnaldo,
Please suggest if I have to send as separate patch for the cpu check fix pa=
tch pasted above:
 "tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout=E2=80=9D

Thanks
Athira
>> ---
>>  tools/perf/util/stat-display.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/util/stat-display.c
>> b/tools/perf/util/stat-display.c
>> index b82844cb0ce7..cf28020798ec 100644
>> --- a/tools/perf/util/stat-display.c
>> +++ b/tools/perf/util/stat-display.c
>> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config
>> *config,
>>                                        id.socket,
>>                                        id.die,
>>                                        id.core);
>> -                       } else if (id.core > -1) {
>> +                       } else if (id.cpu.cpu > -1) {
>>                                fprintf(config->output, "\"cpu\" : \"%d\"=
, ",
>>                                        id.cpu.cpu);
>>                        }
>> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config
>> *config,
>>                                        id.die,
>>                                        config->csv_output ? 0 : -3,
>>                                        id.core, config->csv_sep);
>> -                       } else if (id.core > -1) {
>> +                       } else if (id.cpu.cpu > -1) {
>>                                fprintf(config->output, "CPU%*d%s",
>>                                        config->csv_output ? 0 : -7,
>>                                        id.cpu.cpu, config->csv_sep);
>> --
>> 2.31.1
>>=20
>> Can you suggest or help to test this patch change.
>>=20
>> To address the test failure, as James suggested, I will handle fix in
>> testcases and post them
>> as a separate patch. Plan is to add a sanity check in the tests to see
>> if the "physical_packagge_id" ( ie socket id ) in topology points to -1
>> and if so skip the test. Also in parallel, checking to see how we can
>> handle the aggregation modes to work incase of "-1" value for socket or
>> die
>>=20
>> Thanks
>> Athira
>>=20
>>> Thanks,
>>> Ian
>>>=20
>>>> Or the one about fixing it in the test instead? Or failing early if
>>>> the
>>>> topology can't be read?
>>>>=20
>>>> I'm still not convinced that any of the modes where -1 is printed are
>>>> even working properly so it might be best to fix that rather than just
>>>> the printout.
>>>>=20
>>>>> James, can you point me to reference for that meaning if I have misse=
d anything.
>>>>=20
>>>> It's here:
>>>>=20
>>>>  /** Identify where counts are aggregated, -1 implies not to
>>>> aggregate. */
>>>>  struct aggr_cpu_id {
>>>>=20
>>>>>=20
>>>>> Thanks
>>>>> Athira
>>>>>=20
>>>>>>=20
>>>>>>>=20
>>>>>>> After the fix:
>>>>>>>=20
>>>>>>> <<>>
>>>>>>> perf stat -e instructions -A -a true
>>>>>>>=20
>>>>>>> Performance counter stats for 'system wide':
>>>>>>>=20
>>>>>>> CPU-1                  64,034      instructions
>>>>>>> CPU-1                  68,941      instructions
>>>>>>> CPU-1                  59,418      instructions
>>>>>>> CPU-1                  70,478      instructions
>>>>>>> CPU-1                  65,201      instructions
>>>>>>> CPU-1                  63,704      instructions
>>>>>>> <<>>
>>>>>>>=20
>>>>>>> This is caught while running "perf test" for
>>>>>>> "stat+json_output.sh" and "stat+csv_output.sh".
>>>>>>=20
>>>>>> Is it possible to fix the issue by making the tests cope with the la=
ck
>>>>>> of the CPU id?
>>>>>>=20
>>>>>>>=20
>>>>>>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>>>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>>>> ---
>>>>>>> tools/perf/util/stat-display.c | 6 ++----
>>>>>>> 1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-=
display.c
>>>>>>> index b82844cb0ce7..1b751a730271 100644
>>>>>>> --- a/tools/perf/util/stat-display.c
>>>>>>> +++ b/tools/perf/util/stat-display.c
>>>>>>> @@ -168,10 +168,9 @@ static void aggr_printout(struct perf_stat_con=
fig *config,
>>>>>>>                                    id.socket,
>>>>>>>                                    id.die,
>>>>>>>                                    id.core);
>>>>>>> -                   } else if (id.core > -1) {
>>>>>>> +                   } else
>>>>>>=20
>>>>>> This should have been "id.cpu.cpu > -1". Looks like it was changed by
>>>>>> some kind of bad merge or rebase in df936cadfb because there is no
>>>>>> obvious justification for the change to .core in that commit.
>>>>>=20
>>>>>>=20
>>>>>>>                            fprintf(config->output, "\"cpu\" : \"%d\=
", ",
>>>>>>>                                    id.cpu.cpu);
>>>>>>> -                   }
>>>>>>>            } else {
>>>>>>>                    if (evsel->percore && !config->percore_show_thre=
ad) {
>>>>>>>                            fprintf(config->output, "S%d-D%d-C%*d%s",
>>>>>>> @@ -179,11 +178,10 @@ static void aggr_printout(struct perf_stat_co=
nfig *config,
>>>>>>>                                    id.die,
>>>>>>>                                    config->csv_output ? 0 : -3,
>>>>>>>                                    id.core, config->csv_sep);
>>>>>>> -                   } else if (id.core > -1) {
>>>>>>> +                   } else
>>>>>>>                            fprintf(config->output, "CPU%*d%s",
>>>>>>>                                    config->csv_output ? 0 : -7,
>>>>>>>                                    id.cpu.cpu, config->csv_sep);
>>>>>>> -                   }
>>>>>>>            }
>>>>>>>            break;
>>>>>>>    case AGGR_THREAD:
>>>>>=20

