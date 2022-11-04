Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB02619206
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 08:32:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3XQ036tkz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=os/cq5iU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=os/cq5iU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3XP01pnlz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 18:31:15 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A45ZvL6006372;
	Fri, 4 Nov 2022 07:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=nyt3yH/ZUqK5wrFenzM6hbu/nJuAdErSHp4oGbAAwyg=;
 b=os/cq5iUVeqiJLcv505HkTUmjlErGJ9ekEcaUQFGejozFjdFi0qobdguUzyBviELqAbw
 Uiy35IiDlbzunB1SWnRY+FnKxQNPXKxbZsvNF6Rt5iidaL1Yy/+mZU1HdkTBAfNPu5z6
 sOiM/f2dkzGmRh343vMenxRu1Dz3RkFQ3GKx/AIRWlL71wjvmNPUsNCX45+moQQqEBAe
 YREFzhdMKdONeU1XvV/vgwNOBHtor4lR5IMvc+IBgo3A7Cdl2D1zjVaYWvsrrBK5sZdT
 Z3Orcig6kUpMqaa1KOzMxRn+vk0PcrhXCa3QI0sR9V8ifAEDNKEghTxFmGuMye9C5tn6 Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq07mehg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:29:57 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A47Sc6F028056;
	Fri, 4 Nov 2022 07:29:56 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq07megx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:29:56 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A47Locp029245;
	Fri, 4 Nov 2022 07:29:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguej20wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:29:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A47TpaT63439194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 07:29:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44C324C046;
	Fri,  4 Nov 2022 07:29:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 476344C044;
	Fri,  4 Nov 2022 07:29:48 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.68.139])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Fri,  4 Nov 2022 07:29:47 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] tools/perf: Fix printing os->prefix in CSV metrics
 output
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fVdsaNPptvgQ0NaqhXYELFY8HwwhjAaem0B_HrL2GUkUw@mail.gmail.com>
Date: Fri, 4 Nov 2022 12:59:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <D12F3A8A-AD9F-4B9D-98EA-8E8AD11A858F@linux.vnet.ibm.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
 <0B7A4A12-2528-439A-BB83-BBC5606A27B0@linux.vnet.ibm.com>
 <CAP-5=fVdsaNPptvgQ0NaqhXYELFY8HwwhjAaem0B_HrL2GUkUw@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hA3zSuTAS4xq7CDOMOVte4TRpU7U6fMH
X-Proofpoint-ORIG-GUID: Qg4gbmiyHQjEx2-joCWlJ35u7aZ4Wx7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040047
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
Cc: Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 03-Nov-2022, at 9:45 PM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Wed, Nov 2, 2022 at 1:36 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 18-Oct-2022, at 2:26 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Perf stat with CSV output option prints an extra empty
>>> string as first field in metrics output line.
>>> Sample output below:
>>>=20
>>>      # ./perf stat -x, --per-socket -a -C 1 ls
>>>      S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
>>>      S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
>>>      S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
>>>      S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
>>>      S0,1,875807,,cycles,1769826,100.00,0.491,GHz
>>>      =
S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend cycles =
idle
>>>      =
S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend cycles =
idle
>>>      S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
>>> =3D=3D=3D=3D> ,S0,1,,,,,,,2.00,stalled cycles per insn
>>>=20
>>> The above command line uses field separator as ","
>>> via "-x," option and per-socket option displays
>>> socket value as first field. But here the last line
>>> for "stalled cycles per insn" has "," in the
>>> beginning.
>>>=20
>>> Sample output using interval mode:
>>>      # ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
>>>      0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs =
utilized
>>>      0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
>>>      ------
>>>      0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn =
per cycle
>>> =3D=3D=3D=3D> 0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn
>>>=20
>>> Above result also has an extra csv separator after
>>> the timestamp. Patch addresses extra field separator
>>> in the beginning of the metric output line.
>>>=20
>>> The counter stats are displayed by function
>>> "perf_stat__print_shadow_stats" in code
>>> "util/stat-shadow.c". While printing the stats info
>>> for "stalled cycles per insn", function "new_line_csv"
>>> is used as new_line callback.
>>>=20
>>> The new_line_csv function has check for "os->prefix"
>>> and if prefix is not null, it will be printed along
>>> with cvs separator.
>>> Snippet from "new_line_csv":
>>>      if (os->prefix)
>>>              fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
>>>=20
>>> Here os->prefix gets printed followed by ","
>>> which is the cvs separator. The os->prefix is
>>> used in interval mode option ( -I ), to print
>>> time stamp on every new line. But prefix is
>>> already set to contain csv separator when used
>>> in interval mode for csv option.
>>>=20
>>> Reference: Function "static void print_interval"
>>> Snippet:
>>>      sprintf(prefix, "%6lu.%09lu%s", ts->tv_sec, ts->tv_nsec, =
config->csv_sep);
>>>=20
>>> Also if prefix is not assigned (if not used with
>>> -I option), it gets set to empty string.
>>> Reference: function printout() in util/stat-display.c
>>> Snippet:
>>>      .prefix =3D prefix ? prefix : "",
>>>=20
>>> Since prefix already set to contain cvs_sep in interval
>>> option, patch removes printing config->csv_sep in
>>> new_line_csv function to avoid printing extra field.
>>>=20
>>> After the patch:
>>>=20
>>>      # ./perf stat -x, --per-socket -a -C 1 ls
>>>      S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
>>>      S0,1,2,,context-switches,2041444,100.00,979.289,/sec
>>>      S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
>>>      S0,1,2,,page-faults,2040288,100.00,979.289,/sec
>>>      S0,1,254589,,cycles,2036066,100.00,0.125,GHz
>>>      =
S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles =
idle
>>>      =
S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend cycles =
idle
>>>      S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
>>>      S0,1,,,,,,,1.27,stalled cycles per insn
>>>=20
>>> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
>>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>=20
>> Hi All,
>>=20
>> Looking for review comments for this change.
>=20
> Hi,
>=20
> Thanks for addressing issues in this code. What is the status of the
> CSV output test following these changes?
>=20
> I think going forward we need to move away from CSV and columns, to
> something with structure like json. We also need to refactor this
> code, trying to add meaning to a newline character is a bad strategy
> and creates some unnatural things. To some extent this overlaps with
> Namhyung's aggregation cleanup. There are also weirdnesses in
> jevents/pmu-events, like the same ScaleUnit applying to a metric and
> an event - why are metrics even parts of events?
>=20
> Given the current code is wac-a-mole, and this is another whack, if
> the testing is okay I think we should move forward with this change.
>=20
> Thanks,
> Ian

Hi Ian,

Thanks for checking the patch.
Yes, CSV output test passes with the change.

	perf stat CSV output linter                                     =
: Ok
	perf stat csv summary test                                      =
: Ok

Thanks
Athira

>=20
>=20
>=20
>=20
>> Thanks
>> Athira
>>=20
>>> ---
>>> tools/perf/util/stat-display.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/tools/perf/util/stat-display.c =
b/tools/perf/util/stat-display.c
>>> index 5c47ee9963a7..879874a4bc07 100644
>>> --- a/tools/perf/util/stat-display.c
>>> +++ b/tools/perf/util/stat-display.c
>>> @@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config =
*config, void *ctx)
>>>=20
>>>      fputc('\n', os->fh);
>>>      if (os->prefix)
>>> -             fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
>>> +             fprintf(os->fh, "%s", os->prefix);
>>>      aggr_printout(config, os->evsel, os->id, os->nr);
>>>      for (i =3D 0; i < os->nfields; i++)
>>>              fputs(config->csv_sep, os->fh);
>>> --
>>> 2.31.1

