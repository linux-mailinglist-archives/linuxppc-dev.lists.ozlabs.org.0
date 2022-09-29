Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0065EF0DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 10:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdRrt1Fg9z3cD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 18:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qSpoJRP8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qSpoJRP8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdRr86Ygdz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 18:49:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T8d3GV012786;
	Thu, 29 Sep 2022 08:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=rucyaSa/foF/G5zAOigeXhPnSMl/qv6IaUYbeZUpdvA=;
 b=qSpoJRP8+jJa+nInPEE2qf19vqM4k2sJMYBtHGFeGDoIFeGjAxI1C6UXrWxejCMMuqpN
 nKBoXTBxq/bAt9mNDBEKvj2Wu4rwVvv2g4mtC35+dCbJPcQUdvkt8FQJbbeGyC5r//aO
 YrhL0I5sop6lAis/o2LrsOjLEygsIbFyUenHaqIWva5jQeMg8TarcVKAVvk6wBhVE7Dw
 COwDJxEM1sbCqzzvx762niG7FMn9rgBo8cp3yRHj7cg/n1W6j0wE55PLGeYzof8NL8GU
 LE+DCIepLaiGaa9LPWT+djpP9+WIz3sK7wfFdpAg5OHtIC/v1Qh8RsYeWL5dMx5H4OlL 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jw4kcxfu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 08:49:36 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T8nZT4012175;
	Thu, 29 Sep 2022 08:49:35 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jw4kcxft4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 08:49:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28T8auFT024439;
	Thu, 29 Sep 2022 08:49:33 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3jssh94t5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 08:49:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28T8nUUs65339688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 08:49:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FAB4AE04D;
	Thu, 29 Sep 2022 08:49:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E61CAE045;
	Thu, 29 Sep 2022 08:49:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.118.117])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 29 Sep 2022 08:49:25 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com>
Date: Thu, 29 Sep 2022 14:19:21 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com>
To: James Clark <james.clark@arm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AyctUOkWiuBsCKjv1TvpZWo1YO-8csf8
X-Proofpoint-ORIG-GUID: ffsr3pXWE1g4Wjd6rxTqGYQBHhTe2DW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209290051
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28-Sep-2022, at 9:05 PM, James Clark <james.clark@arm.com> wrote:
>=20
>=20
>=20

Hi James,

Thanks for looking at the patch and sharing review comments.

> On 13/09/2022 12:57, Athira Rajeev wrote:
>> perf stat includes option to specify aggr_mode to display
>> per-socket, per-core, per-die, per-node counter details.
>> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
>> counter values are displayed for each cpu along with "CPU"
>> value in one field of the output.
>>=20
>> Each of the aggregate mode uses the information fetched
>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
>=20
> I thought that this wouldn't apply to the cpu field because cpu is
> basically interchangeable as an index in cpumap, rather than anything
> being read from the topology file.

The cpu value is filled in this function:

Function : aggr_cpu_id__cpu
Code: util/cpumap.c

>=20
>> physical_package_id. Utility functions in "cpumap.c" fetches
>> this information and populates the socket id, core id, cpu etc.
>> If the platform does not expose the topology information,
>> these values will be set to -1. Example, in case of powerpc,
>> details like physical_package_id is restricted to be exposed
>> in pSeries platform. So id.socket, id.core, id.cpu all will
>> be set as -1.
>>=20
>> In case of displaying socket or die value, there is no check
>> done in the "aggr_printout" function to see if it points to
>> valid socket id or die. But for displaying "cpu" value, there
>> is a check for "if (id.core > -1)". In case of powerpc pSeries
>> where detail like physical_package_id is restricted to be
>> exposed, id.core will be set to -1. Hence the column or field
>> itself for CPU won't be displayed in the output.
>>=20
>> Result for per-socket:
>>=20
>> <<>>
>> perf stat -e branches --per-socket -a true
>>=20
>> Performance counter stats for 'system wide':
>>=20
>> S-1      32            416,851      branches
>> <<>>
>>=20
>> Here S has -1 in above result. But with -A option which also
>> expects CPU in one column in the result, below is observed.
>>=20
>> <<>>
>> /bin/perf stat -e instructions -A -a true
>>=20
>> Performance counter stats for 'system wide':
>>=20
>>            47,146      instructions
>>            45,226      instructions
>>            43,354      instructions
>>            45,184      instructions
>> <<>>
>>=20
>> If the cpu id value is pointing to -1 also, it makes sense
>> to display the column in the output to replicate the behaviour
>> or to be in precedence with other aggr options(like per-socket,
>> per-core). Remove the check "id.core" so that CPU field gets
>> displayed in the output.
>=20
> Why would you want to print -1 out? Seems like the if statement was a
> good one to me, otherwise the output looks a bit broken to users. Are
> the other aggregation modes even working if -1 is set for socket and
> die? Maybe we need to not print -1 in those cases or exit earlier with =
a
> failure.
>=20
> The -1 value has a specific internal meaning which is "to not
> aggregate". It doesn't mean "not set".

Currently, this check is done only for printing cpu value.
For socket/die/core values, this check is not done. Pasting an
example snippet from a powerpc system ( specifically from pseries =
platform where
the value is set to -1 )

./perf stat --per-core -a -C 1 true

 Performance counter stats for 'system wide':

S-1-D-1-C-1          1               1.06 msec cpu-clock                 =
       #    1.018 CPUs utilized         =20
S-1-D-1-C-1          1                  2      context-switches          =
       #    1.879 K/sec                 =20
S-1-D-1-C-1          1                  0      cpu-migrations            =
       #    0.000 /sec                  =20

Here though the value is -1, we are displaying it. Where as in case of =
cpu, the first column will be
empty since we do a check before printing.=20

Example:

./perf stat --per-core -A -C 1 true

 Performance counter stats for 'CPU(s) 1':

              0.88 msec cpu-clock                        #    1.022 CPUs =
utilized         =20
                 2      context-switches                                 =
                 =20
                 0      cpu-migrations                                   =
                 =20


No sure, whether there are scripts out there, which consume the current =
format and
not displaying -1 may break it. That is why we tried with change to =
remove check for cpu, similar to
other modes like socket, die, core etc.

Also perf code ie =E2=80=9Caggr_cpu_id__empty=E2=80=9D in util/cpumap.c =
initialises the
values to -1 . I was checking to see where we are mapping -1 to =E2=80=9Ct=
o not aggregate=E2=80=9D.
What I could find is AGGR_NONE ( which is for no-aggr ) has value as =
zero.

Reference: defined in util/stat.h

enum aggr_mode {
        AGGR_NONE,

James, can you point me to reference for that meaning if I have missed =
anything.

Thanks
Athira

>=20
>>=20
>> After the fix:
>>=20
>> <<>>
>> perf stat -e instructions -A -a true
>>=20
>> Performance counter stats for 'system wide':
>>=20
>> CPU-1                  64,034      instructions
>> CPU-1                  68,941      instructions
>> CPU-1                  59,418      instructions
>> CPU-1                  70,478      instructions
>> CPU-1                  65,201      instructions
>> CPU-1                  63,704      instructions
>> <<>>
>>=20
>> This is caught while running "perf test" for
>> "stat+json_output.sh" and "stat+csv_output.sh".
>=20
> Is it possible to fix the issue by making the tests cope with the lack
> of the CPU id?
>=20
>>=20
>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/stat-display.c | 6 ++----
>> 1 file changed, 2 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/tools/perf/util/stat-display.c =
b/tools/perf/util/stat-display.c
>> index b82844cb0ce7..1b751a730271 100644
>> --- a/tools/perf/util/stat-display.c
>> +++ b/tools/perf/util/stat-display.c
>> @@ -168,10 +168,9 @@ static void aggr_printout(struct =
perf_stat_config *config,
>> 					id.socket,
>> 					id.die,
>> 					id.core);
>> -			} else if (id.core > -1) {
>> +			} else
>=20
> This should have been "id.cpu.cpu > -1". Looks like it was changed by
> some kind of bad merge or rebase in df936cadfb because there is no
> obvious justification for the change to .core in that commit.

>=20
>> 				fprintf(config->output, "\"cpu\" : =
\"%d\", ",
>> 					id.cpu.cpu);
>> -			}
>> 		} else {
>> 			if (evsel->percore && =
!config->percore_show_thread) {
>> 				fprintf(config->output, =
"S%d-D%d-C%*d%s",
>> @@ -179,11 +178,10 @@ static void aggr_printout(struct =
perf_stat_config *config,
>> 					id.die,
>> 					config->csv_output ? 0 : -3,
>> 					id.core, config->csv_sep);
>> -			} else if (id.core > -1) {
>> +			} else
>> 				fprintf(config->output, "CPU%*d%s",
>> 					config->csv_output ? 0 : -7,
>> 					id.cpu.cpu, config->csv_sep);
>> -			}
>> 		}
>> 		break;
>> 	case AGGR_THREAD:

