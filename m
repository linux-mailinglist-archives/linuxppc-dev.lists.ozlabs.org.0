Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B869D627908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 10:32:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9kbr47V0z3dvH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 20:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aIl3wy2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aIl3wy2v;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9kZs38mdz307C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 20:31:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AE9S4tJ023895;
	Mon, 14 Nov 2022 09:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=32BPdbdpFtJ3fWOvSu2R/xScsGtBbc5UB6R3mzntnmo=;
 b=aIl3wy2vQ6rcbjJoE7o2BQZv2KuENuJSZje52/tWIGN5PFm06zLLhGqvlkjYee07HUYG
 7g1OJm/hL1b4dDnAQOIiEgiJA1YCRm0Ji1aYfJqRPd2xEAaL8HCwYRABTTmh52mtVYMW
 ExEp7OcDxNKmEB47w5TyCodYVv0OYSFPCpje5X8ldAhykaVrBvOl6lZgAaAk9W/lWawc
 KCaOczM2zMgqhTmmKk6Ki6id9tH3Na6IOfY6EOcj8Cnv6JMtCHI+KA0bUp5Cm9KfQ/TJ
 vpCUJsMjKCEPHEzxyumqr6jc3GxQHDPznKWmpk7RupklT/7TipRtG2rhk9zbqpv+yyDC 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuk2f02h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 09:30:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AE9SJwX028494;
	Mon, 14 Nov 2022 09:30:57 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuk2f02gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 09:30:57 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AE9KMdO023461;
	Mon, 14 Nov 2022 09:30:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjabg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 09:30:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AE9UqID48365988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 09:30:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A4DBA4054;
	Mon, 14 Nov 2022 09:30:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE942A4060;
	Mon, 14 Nov 2022 09:30:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.93.244])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Mon, 14 Nov 2022 09:30:49 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/2] tools/perf: Fix printing field separator in CSV
 metrics output
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <B036F80D-D642-439A-B5ED-A8D79853E20D@linux.vnet.ibm.com>
Date: Mon, 14 Nov 2022 15:00:47 +0530
Message-Id: <29D476BB-2C6A-41E5-94A8-EA75A41A3196@linux.vnet.ibm.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
 <20221018085605.63834-2-atrajeev@linux.vnet.ibm.com>
 <173AA14E-B018-4BA7-A7A8-E7069E273960@linux.vnet.ibm.com>
 <Y2rCuGSKoIjHwWGx@kernel.org>
 <B036F80D-D642-439A-B5ED-A8D79853E20D@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-y8Iw9suEyAxSY7sOL7duPuFb402Yri
X-Proofpoint-ORIG-GUID: laPEu-D4JGoA-IXLm-RrQ-Zjctg-zTTi
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_07,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140067
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Nov-2022, at 3:53 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
rote:
>=20
>=20
>=20
>> On 09-Nov-2022, at 2:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org> w=
rote:
>>=20
>> Em Wed, Nov 02, 2022 at 02:07:06PM +0530, Athira Rajeev escreveu:
>>>=20
>>>=20
>>>> On 18-Oct-2022, at 2:26 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com=
> wrote:
>>>>=20
>>>> In perf stat with CSV output option, number of fields
>>>> in metrics output is not matching with number of fields
>>>> in other event output lines.
>>>>=20
>>>> Sample output below after applying patch to fix
>>>> printing os->prefix.
>>>>=20
>>>> 	# ./perf stat -x, --per-socket -a -C 1 ls
>>>> 	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
>>>> 	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
>>>> 	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
>>>> 	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
>>>> 	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
>>>> 	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cyc=
les idle
>>>> 	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycl=
es idle
>>>> 	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
>>>> =3D=3D=3D>	S0,1,,,,,,,1.34,stalled cycles per insn
>>>>=20
>>>> The above command line uses field separator as ","
>>>> via "-x," option and per-socket option displays
>>>> socket value as first field. But here the last line
>>>> for "stalled cycles per insn" has more separators.
>>>> Each csv output line is expected to have 8 field
>>>> separatorsi (for the 9 fields), where as last line
>>>> has 10 "," in the result. Patch fixes this issue.
>>>>=20
>>>> The counter stats are displayed by function
>>>> "perf_stat__print_shadow_stats" in code
>>>> "util/stat-shadow.c". While printing the stats info
>>>> for "stalled cycles per insn", function "new_line_csv"
>>>> is used as new_line callback.
>>>>=20
>>>> The fields printed in each line contains:
>>>> "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
>>>>=20
>>>> The metric output prints Socket_id, aggr nr, ratio
>>>> and unit. It has to skip through remaining five fields
>>>> ie, Avg,unit,event_name,run,enable_percent. The csv
>>>> line callback uses "os->nfields" to know the number of
>>>> fields to skip to match with other lines.
>>>> Currently it is set as:
>>>> 	os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? =
1 : 0);
>>>>=20
>>>> But in case of aggregation modes, csv_sep already
>>>> gets printed along with each field (Function "aggr_printout"
>>>> in util/stat-display.c). So aggr_fields can be
>>>> removed from nfields. And fixed number of fields to
>>>> skip has to be "4". This is to skip fields for:
>>>> "avg, unit, event name, run, enable_percent"
>>>> Example from line for instructions:
>>>> "1.89,msec,cpu-clock,1887692,100.00"
>>>>=20
>>>> This needs 4 csv separators. Patch removes aggr_fields
>>>> and uses 4 as fixed number of os->nfields to skip.
>>>>=20
>>>> After the patch:
>>>>=20
>>>> 	# ./perf stat -x, --per-socket -a -C 1 ls
>>>> 	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
>>>> 	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
>>>> 	-------
>>>> 	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
>>>> 	S0,1,,,,,,1.81,stalled cycles per insn
>>>>=20
>>>> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
>>>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>=20
>>> Hi All,
>>>=20
>>> Looking for review comments for this change.
>>=20
>> This clashed with a patch from Namhyung that I just applied:
>>=20
>> http://lore.kernel.org/lkml/20221107213314.3239159-2-namhyung@kernel.org
>>=20
>> Can you please check? I just applied the other patch in this series.
>>=20
>> Thanks,
>>=20
>> - Arnaldo
>=20
> Hi Arnaldo,
>=20
> Thanks for checking the patch series.
> Please find the updated patch below which is created on top of perf/urgen=
t.

Hi Arnaldo,

I posted this as a separate patch with version V2 here:=20

https://lore.kernel.org/linux-perf-users/20221114085523.86570-1-atrajeev@li=
nux.vnet.ibm.com/T/#m1ba8c773b53f198923101684c39b13da686c211d

Thanks
Athira

>=20
> From dde8f830ad318c9111c3fea5415fd8170b4c51bd Mon Sep 17 00:00:00 2001
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Date: Tue, 18 Oct 2022 14:26:05 +0530
> Subject: [PATCH] tools/perf: Fix printing field separator in CSV metrics
> output
>=20
> In perf stat with CSV output option, number of fields
> in metrics output is not matching with number of fields
> in other event output lines.
>=20
> Sample output below after applying patch to fix
> printing os->prefix.
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
> 	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
> 	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
> 	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
> 	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
> 	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycles=
 idle
> 	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycles =
idle
> 	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
> =3D=3D=3D>	S0,1,,,,,,,1.34,stalled cycles per insn
>=20
> The above command line uses field separator as ","
> via "-x," option and per-socket option displays
> socket value as first field. But here the last line
> for "stalled cycles per insn" has more separators.
> Each csv output line is expected to have 8 field
> separatorsi (for the 9 fields), where as last line
> has 10 "," in the result. Patch fixes this issue.
>=20
> The counter stats are displayed by function
> "perf_stat__print_shadow_stats" in code
> "util/stat-shadow.c". While printing the stats info
> for "stalled cycles per insn", function "new_line_csv"
> is used as new_line callback.
>=20
> The fields printed in each line contains:
> "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
>=20
> The metric output prints Socket_id, aggr nr, ratio
> and unit. It has to skip through remaining five fields
> ie, Avg,unit,event_name,run,enable_percent. The csv
> line callback uses "os->nfields" to know the number of
> fields to skip to match with other lines.
> Currently it is set as:
> 	os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 :=
 0);
>=20
> But in case of aggregation modes, csv_sep already
> gets printed along with each field (Function "aggr_printout"
> in util/stat-display.c). So aggr_fields can be
> removed from nfields. And fixed number of fields to
> skip has to be "4". This is to skip fields for:
> "avg, unit, event name, run, enable_percent"
> Example from line for instructions:
> "1.89,msec,cpu-clock,1887692,100.00"
>=20
> This needs 4 csv separators. Patch removes aggr_fields
> and uses 4 as fixed number of os->nfields to skip.
>=20
> After the patch:
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
> 	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
> 	-------
> 	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
> 	S0,1,,,,,,1.81,stalled cycles per insn
>=20
> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> tools/perf/util/stat-display.c | 13 +------------
> 1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-displa=
y.c
> index ba66bb7fc1ca..5ce14bf18055 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *config=
, struct aggr_cpu_id id, int
> 	new_line_t nl;
>=20
> 	if (config->csv_output) {
> -		static const int aggr_fields[AGGR_MAX] =3D {
> -			[AGGR_NONE] =3D 1,
> -			[AGGR_GLOBAL] =3D 0,
> -			[AGGR_SOCKET] =3D 2,
> -			[AGGR_DIE] =3D 2,
> -			[AGGR_CORE] =3D 2,
> -			[AGGR_THREAD] =3D 1,
> -			[AGGR_UNSET] =3D 0,
> -			[AGGR_NODE] =3D 1,
> -		};
> -
> 		pm =3D config->metric_only ? print_metric_only_csv : print_metric_csv;
> 		nl =3D config->metric_only ? new_line_metric : new_line_csv;
> -		os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1=
 : 0);
> +		os.nfields =3D 4 + (counter->cgrp ? 1 : 0);
> 	} else if (config->json_output) {
> 		pm =3D config->metric_only ? print_metric_only_json : print_metric_json;
> 		nl =3D config->metric_only ? new_line_metric : new_line_json;
> --=20
> 2.31.1
>=20
>=20
> Thanks
> Athira
>=20
>>=20
>>> Thanks
>>> Athira
>>>=20
>>>> ---
>>>> tools/perf/util/stat-display.c | 13 +------------
>>>> 1 file changed, 1 insertion(+), 12 deletions(-)
>>>>=20
>>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-dis=
play.c
>>>> index 879874a4bc07..5ca151adf826 100644
>>>> --- a/tools/perf/util/stat-display.c
>>>> +++ b/tools/perf/util/stat-display.c
>>>> @@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *con=
fig, struct aggr_cpu_id id, int
>>>> 	new_line_t nl;
>>>>=20
>>>> 	if (config->csv_output) {
>>>> -		static const int aggr_fields[AGGR_MAX] =3D {
>>>> -			[AGGR_NONE] =3D 1,
>>>> -			[AGGR_GLOBAL] =3D 0,
>>>> -			[AGGR_SOCKET] =3D 2,
>>>> -			[AGGR_DIE] =3D 2,
>>>> -			[AGGR_CORE] =3D 2,
>>>> -			[AGGR_THREAD] =3D 1,
>>>> -			[AGGR_UNSET] =3D 0,
>>>> -			[AGGR_NODE] =3D 0,
>>>> -		};
>>>> -
>>>> 		pm =3D config->metric_only ? print_metric_only_csv : print_metric_cs=
v;
>>>> 		nl =3D config->metric_only ? new_line_metric : new_line_csv;
>>>> -		os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp =
? 1 : 0);
>>>> +		os.nfields =3D 4 + (counter->cgrp ? 1 : 0);
>>>> 	} else if (config->json_output) {
>>>> 		pm =3D config->metric_only ? print_metric_only_json : print_metric_j=
son;
>>>> 		nl =3D config->metric_only ? new_line_metric : new_line_json;
>>>> --=20
>>>> 2.31.1
>>>>=20
>>=20
>> --=20
>>=20
>> - Arnaldo

