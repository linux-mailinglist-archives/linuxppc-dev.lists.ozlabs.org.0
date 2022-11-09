Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3862285C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 11:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6h1F1PFRz3cMw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 21:25:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6EbH6+U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6EbH6+U;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6h0F2X4vz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 21:24:12 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A98g5o6002280;
	Wed, 9 Nov 2022 10:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gLvRbnEM3M0rDrTFL5isxIIAuNK0+1RcXFBORpLJ3ZI=;
 b=m6EbH6+UySJcuHPADj8+lOYaV9XfbUzbASbJjQefhAUm2IKsY5m45Vtj7MB56BOB2Sjg
 bPVrUxbUczKJuEnG9kOfVWSte4dfGcXZaQOdLZx44LaU6f6W/JdSgxj6fdQhft2Q1kNS
 qLwUvn8a2ZcDA4zPr8xcXo8hJ2E7P8hrZzw/2IVV4hkslhih+gRYZotsUetF0CK2NA1y
 yTE8dAjwAibjqGC+JwJdgjVq9IGBkbG6awkAGesYc9PD/1TuAgH7VJ13Fk0j2EzxuNX2
 DUErwSlWThWGZOSMM40bUqVkoOQh3hj5C4KugRvTkhYcTZfAFHBjWavCxtd+Ggcfp6og bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr8wxjm5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 10:23:43 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A99odnX017389;
	Wed, 9 Nov 2022 10:23:42 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr8wxjm4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 10:23:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A9AKWTM012426;
	Wed, 9 Nov 2022 10:23:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03fra.de.ibm.com with ESMTP id 3kngp5m0ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 10:23:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A9ANaZa63242584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 10:23:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FB604C046;
	Wed,  9 Nov 2022 10:23:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58CD54C04A;
	Wed,  9 Nov 2022 10:23:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.119.87])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Nov 2022 10:23:33 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/2] tools/perf: Fix printing field separator in CSV
 metrics output
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y2rCuGSKoIjHwWGx@kernel.org>
Date: Wed, 9 Nov 2022 15:53:30 +0530
Message-Id: <B036F80D-D642-439A-B5ED-A8D79853E20D@linux.vnet.ibm.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
 <20221018085605.63834-2-atrajeev@linux.vnet.ibm.com>
 <173AA14E-B018-4BA7-A7A8-E7069E273960@linux.vnet.ibm.com>
 <Y2rCuGSKoIjHwWGx@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8VLVwqVLG5LbTRdRwDBH_GdHVF_KXGAC
X-Proofpoint-GUID: qLI09scSvM_jAnOD5kpXalzQCpKLS0ug
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_03,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090077
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



> On 09-Nov-2022, at 2:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>=20
> Em Wed, Nov 02, 2022 at 02:07:06PM +0530, Athira Rajeev escreveu:
>>=20
>>=20
>>> On 18-Oct-2022, at 2:26 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com>=
 wrote:
>>>=20
>>> In perf stat with CSV output option, number of fields
>>> in metrics output is not matching with number of fields
>>> in other event output lines.
>>>=20
>>> Sample output below after applying patch to fix
>>> printing os->prefix.
>>>=20
>>> 	# ./perf stat -x, --per-socket -a -C 1 ls
>>> 	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
>>> 	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
>>> 	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
>>> 	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
>>> 	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
>>> 	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycl=
es idle
>>> 	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycle=
s idle
>>> 	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
>>> =3D=3D=3D>	S0,1,,,,,,,1.34,stalled cycles per insn
>>>=20
>>> The above command line uses field separator as ","
>>> via "-x," option and per-socket option displays
>>> socket value as first field. But here the last line
>>> for "stalled cycles per insn" has more separators.
>>> Each csv output line is expected to have 8 field
>>> separatorsi (for the 9 fields), where as last line
>>> has 10 "," in the result. Patch fixes this issue.
>>>=20
>>> The counter stats are displayed by function
>>> "perf_stat__print_shadow_stats" in code
>>> "util/stat-shadow.c". While printing the stats info
>>> for "stalled cycles per insn", function "new_line_csv"
>>> is used as new_line callback.
>>>=20
>>> The fields printed in each line contains:
>>> "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
>>>=20
>>> The metric output prints Socket_id, aggr nr, ratio
>>> and unit. It has to skip through remaining five fields
>>> ie, Avg,unit,event_name,run,enable_percent. The csv
>>> line callback uses "os->nfields" to know the number of
>>> fields to skip to match with other lines.
>>> Currently it is set as:
>>> 	os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1=
 : 0);
>>>=20
>>> But in case of aggregation modes, csv_sep already
>>> gets printed along with each field (Function "aggr_printout"
>>> in util/stat-display.c). So aggr_fields can be
>>> removed from nfields. And fixed number of fields to
>>> skip has to be "4". This is to skip fields for:
>>> "avg, unit, event name, run, enable_percent"
>>> Example from line for instructions:
>>> "1.89,msec,cpu-clock,1887692,100.00"
>>>=20
>>> This needs 4 csv separators. Patch removes aggr_fields
>>> and uses 4 as fixed number of os->nfields to skip.
>>>=20
>>> After the patch:
>>>=20
>>> 	# ./perf stat -x, --per-socket -a -C 1 ls
>>> 	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
>>> 	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
>>> 	-------
>>> 	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
>>> 	S0,1,,,,,,1.81,stalled cycles per insn
>>>=20
>>> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
>>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>=20
>> Hi All,
>>=20
>> Looking for review comments for this change.
>=20
> This clashed with a patch from Namhyung that I just applied:
>=20
> http://lore.kernel.org/lkml/20221107213314.3239159-2-namhyung@kernel.org
>=20
> Can you please check? I just applied the other patch in this series.
>=20
> Thanks,
>=20
> - Arnaldo

Hi Arnaldo,

Thanks for checking the patch series.
Please find the updated patch below which is created on top of perf/urgent.

From dde8f830ad318c9111c3fea5415fd8170b4c51bd Mon Sep 17 00:00:00 2001
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Date: Tue, 18 Oct 2022 14:26:05 +0530
Subject: [PATCH] tools/perf: Fix printing field separator in CSV metrics
 output

In perf stat with CSV output option, number of fields
in metrics output is not matching with number of fields
in other event output lines.

Sample output below after applying patch to fix
printing os->prefix.

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycles i=
dle
	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycles id=
le
	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
=3D=3D=3D>	S0,1,,,,,,,1.34,stalled cycles per insn

The above command line uses field separator as ","
via "-x," option and per-socket option displays
socket value as first field. But here the last line
for "stalled cycles per insn" has more separators.
Each csv output line is expected to have 8 field
separatorsi (for the 9 fields), where as last line
has 10 "," in the result. Patch fixes this issue.

The counter stats are displayed by function
"perf_stat__print_shadow_stats" in code
"util/stat-shadow.c". While printing the stats info
for "stalled cycles per insn", function "new_line_csv"
is used as new_line callback.

The fields printed in each line contains:
"Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"

The metric output prints Socket_id, aggr nr, ratio
and unit. It has to skip through remaining five fields
ie, Avg,unit,event_name,run,enable_percent. The csv
line callback uses "os->nfields" to know the number of
fields to skip to match with other lines.
Currently it is set as:
	os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0=
);

But in case of aggregation modes, csv_sep already
gets printed along with each field (Function "aggr_printout"
in util/stat-display.c). So aggr_fields can be
removed from nfields. And fixed number of fields to
skip has to be "4". This is to skip fields for:
"avg, unit, event name, run, enable_percent"
Example from line for instructions:
"1.89,msec,cpu-clock,1887692,100.00"

This needs 4 csv separators. Patch removes aggr_fields
and uses 4 as fixed number of os->nfields to skip.

After the patch:

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
	-------
	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
	S0,1,,,,,,1.81,stalled cycles per insn

Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/stat-display.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index ba66bb7fc1ca..5ce14bf18055 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *config, =
struct aggr_cpu_id id, int
 	new_line_t nl;
=20
 	if (config->csv_output) {
-		static const int aggr_fields[AGGR_MAX] =3D {
-			[AGGR_NONE] =3D 1,
-			[AGGR_GLOBAL] =3D 0,
-			[AGGR_SOCKET] =3D 2,
-			[AGGR_DIE] =3D 2,
-			[AGGR_CORE] =3D 2,
-			[AGGR_THREAD] =3D 1,
-			[AGGR_UNSET] =3D 0,
-			[AGGR_NODE] =3D 1,
-		};
-
 		pm =3D config->metric_only ? print_metric_only_csv : print_metric_csv;
 		nl =3D config->metric_only ? new_line_metric : new_line_csv;
-		os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 :=
 0);
+		os.nfields =3D 4 + (counter->cgrp ? 1 : 0);
 	} else if (config->json_output) {
 		pm =3D config->metric_only ? print_metric_only_json : print_metric_json;
 		nl =3D config->metric_only ? new_line_metric : new_line_json;
--=20
2.31.1


Thanks
Athira

>=20
>> Thanks
>> Athira
>>=20
>>> ---
>>> tools/perf/util/stat-display.c | 13 +------------
>>> 1 file changed, 1 insertion(+), 12 deletions(-)
>>>=20
>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-disp=
lay.c
>>> index 879874a4bc07..5ca151adf826 100644
>>> --- a/tools/perf/util/stat-display.c
>>> +++ b/tools/perf/util/stat-display.c
>>> @@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *conf=
ig, struct aggr_cpu_id id, int
>>> 	new_line_t nl;
>>>=20
>>> 	if (config->csv_output) {
>>> -		static const int aggr_fields[AGGR_MAX] =3D {
>>> -			[AGGR_NONE] =3D 1,
>>> -			[AGGR_GLOBAL] =3D 0,
>>> -			[AGGR_SOCKET] =3D 2,
>>> -			[AGGR_DIE] =3D 2,
>>> -			[AGGR_CORE] =3D 2,
>>> -			[AGGR_THREAD] =3D 1,
>>> -			[AGGR_UNSET] =3D 0,
>>> -			[AGGR_NODE] =3D 0,
>>> -		};
>>> -
>>> 		pm =3D config->metric_only ? print_metric_only_csv : print_metric_csv;
>>> 		nl =3D config->metric_only ? new_line_metric : new_line_csv;
>>> -		os.nfields =3D 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ?=
 1 : 0);
>>> +		os.nfields =3D 4 + (counter->cgrp ? 1 : 0);
>>> 	} else if (config->json_output) {
>>> 		pm =3D config->metric_only ? print_metric_only_json : print_metric_js=
on;
>>> 		nl =3D config->metric_only ? new_line_metric : new_line_json;
>>> --=20
>>> 2.31.1
>>>=20
>=20
> --=20
>=20
> - Arnaldo

