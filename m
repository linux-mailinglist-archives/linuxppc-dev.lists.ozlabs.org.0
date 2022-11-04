Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6966461956A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 12:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3dp01byMz3f4p
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 22:34:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FwfNc85Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FwfNc85Y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3XXr2vnXz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 18:38:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A46a592012845;
	Fri, 4 Nov 2022 07:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=3wfV1Pu19eIbhy7drUwh+QBm7nZZNSr3hUmy2p3pCWY=;
 b=FwfNc85YjOaxwCBlZ7OmWbQETI4T8RwyMU9GhJejozL8Lcn68+0FJ9rfWRjdITl6VwyP
 EGTgGwINu6WgWFZitw6TA3AxuZ179z1OvD9lCpTNi7zNxGY25jaXQEwHH781NRLV8wgr
 uc6/XpvGJlbuGy9jmmWySu540jlZwOyPbkxDlAoFwvZNU1P03LXM4fybyY5rqkxrmUs0
 ZFhHdo6iiaQXrZsisgd9XkXGBir9E1z2vwzphutmMJvLK4U2e9HbKSajU7q6ZSLeO3qE
 zehEYr2d5I0UVHUrbaY1UgGobD6IHKUCAe2YqZ91ulMbRnI/7KigofSxT30cKLmQFgyi jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpt0vrj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:37:54 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A46Xcjt005645;
	Fri, 4 Nov 2022 07:37:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpt0vrh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:37:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A47Zii0008658;
	Fri, 4 Nov 2022 07:37:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kgut921ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 07:37:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A47WEgN46924216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 07:32:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55AC742041;
	Fri,  4 Nov 2022 07:37:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C08E4203F;
	Fri,  4 Nov 2022 07:37:43 +0000 (GMT)
Received: from [9.43.44.92] (unknown [9.43.44.92])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 07:37:42 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------chy98hRrbwPZOYSvYIPXbYzn"
Message-ID: <04486d47-0009-adfb-3e5a-553abde42d6e@linux.ibm.com>
Date: Fri, 4 Nov 2022 13:07:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] tools/perf: Fix printing os->prefix in CSV metrics
 output
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Ian Rogers <irogers@google.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
 <0B7A4A12-2528-439A-BB83-BBC5606A27B0@linux.vnet.ibm.com>
 <CAP-5=fVdsaNPptvgQ0NaqhXYELFY8HwwhjAaem0B_HrL2GUkUw@mail.gmail.com>
 <D12F3A8A-AD9F-4B9D-98EA-8E8AD11A858F@linux.vnet.ibm.com>
Content-Language: en-US
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <D12F3A8A-AD9F-4B9D-98EA-8E8AD11A858F@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cahaZbEjeOSIq-EJ-MD0n6klLU0WpEQV
X-Proofpoint-ORIG-GUID: LYaoc7rjMiP3UIQHbZ4_XFqyHzFkQYDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211040050
X-Mailman-Approved-At: Fri, 04 Nov 2022 22:32:15 +1100
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
Cc: Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------chy98hRrbwPZOYSvYIPXbYzn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/22 12:59 PM, Athira Rajeev wrote:
>
>> On 03-Nov-2022, at 9:45 PM, Ian Rogers<irogers@google.com>  wrote:
>>
>> On Wed, Nov 2, 2022 at 1:36 AM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com>  wrote:
>>>
>>>
>>>> On 18-Oct-2022, at 2:26 PM, Athira Rajeev<atrajeev@linux.vnet.ibm.com>  wrote:
>>>>
>>>> Perf stat with CSV output option prints an extra empty
>>>> string as first field in metrics output line.
>>>> Sample output below:
>>>>
>>>>       # ./perf stat -x, --per-socket -a -C 1 ls
>>>>       S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
>>>>       S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
>>>>       S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
>>>>       S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
>>>>       S0,1,875807,,cycles,1769826,100.00,0.491,GHz
>>>>       S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend cycles idle
>>>>       S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend cycles idle
>>>>       S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
>>>> ====> ,S0,1,,,,,,,2.00,stalled cycles per insn
>>>>
>>>> The above command line uses field separator as ","
>>>> via "-x," option and per-socket option displays
>>>> socket value as first field. But here the last line
>>>> for "stalled cycles per insn" has "," in the
>>>> beginning.
>>>>
>>>> Sample output using interval mode:
>>>>       # ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
>>>>       0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs utilized
>>>>       0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
>>>>       ------
>>>>       0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn per cycle
>>>> ====> 0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn
>>>>
>>>> Above result also has an extra csv separator after
>>>> the timestamp. Patch addresses extra field separator
>>>> in the beginning of the metric output line.
>>>>
>>>> The counter stats are displayed by function
>>>> "perf_stat__print_shadow_stats" in code
>>>> "util/stat-shadow.c". While printing the stats info
>>>> for "stalled cycles per insn", function "new_line_csv"
>>>> is used as new_line callback.
>>>>
>>>> The new_line_csv function has check for "os->prefix"
>>>> and if prefix is not null, it will be printed along
>>>> with cvs separator.
>>>> Snippet from "new_line_csv":
>>>>       if (os->prefix)
>>>>               fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
>>>>
>>>> Here os->prefix gets printed followed by ","
>>>> which is the cvs separator. The os->prefix is
>>>> used in interval mode option ( -I ), to print
>>>> time stamp on every new line. But prefix is
>>>> already set to contain csv separator when used
>>>> in interval mode for csv option.
>>>>
>>>> Reference: Function "static void print_interval"
>>>> Snippet:
>>>>       sprintf(prefix, "%6lu.%09lu%s", ts->tv_sec, ts->tv_nsec, config->csv_sep);
>>>>
>>>> Also if prefix is not assigned (if not used with
>>>> -I option), it gets set to empty string.
>>>> Reference: function printout() in util/stat-display.c
>>>> Snippet:
>>>>       .prefix = prefix ? prefix : "",
>>>>
>>>> Since prefix already set to contain cvs_sep in interval
>>>> option, patch removes printing config->csv_sep in
>>>> new_line_csv function to avoid printing extra field.
>>>>
>>>> After the patch:
>>>>
>>>>       # ./perf stat -x, --per-socket -a -C 1 ls
>>>>       S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
>>>>       S0,1,2,,context-switches,2041444,100.00,979.289,/sec
>>>>       S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
>>>>       S0,1,2,,page-faults,2040288,100.00,979.289,/sec
>>>>       S0,1,254589,,cycles,2036066,100.00,0.125,GHz
>>>>       S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles idle
>>>>       S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend cycles idle
>>>>       S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
>>>>       S0,1,,,,,,,1.27,stalled cycles per insn
>>>>
>>>> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
>>>> Reported-by: Disha Goel<disgoel@linux.vnet.ibm.com>
>>>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

perf stat csv test passed after applying the patch
Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>

>>> Hi All,
>>>
>>> Looking for review comments for this change.
>> Hi,
>>
>> Thanks for addressing issues in this code. What is the status of the
>> CSV output test following these changes?
>>
>> I think going forward we need to move away from CSV and columns, to
>> something with structure like json. We also need to refactor this
>> code, trying to add meaning to a newline character is a bad strategy
>> and creates some unnatural things. To some extent this overlaps with
>> Namhyung's aggregation cleanup. There are also weirdnesses in
>> jevents/pmu-events, like the same ScaleUnit applying to a metric and
>> an event - why are metrics even parts of events?
>>
>> Given the current code is wac-a-mole, and this is another whack, if
>> the testing is okay I think we should move forward with this change.
>>
>> Thanks,
>> Ian
> Hi Ian,
>
> Thanks for checking the patch.
> Yes, CSV output test passes with the change.
>
> 	perf stat CSV output linter                                     : Ok
> 	perf stat csv summary test                                      : Ok
>
> Thanks
> Athira
>
>>
>>
>>
>>> Thanks
>>> Athira
>>>
>>>> ---
>>>> tools/perf/util/stat-display.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
>>>> index 5c47ee9963a7..879874a4bc07 100644
>>>> --- a/tools/perf/util/stat-display.c
>>>> +++ b/tools/perf/util/stat-display.c
>>>> @@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config *config, void *ctx)
>>>>
>>>>       fputc('\n', os->fh);
>>>>       if (os->prefix)
>>>> -             fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
>>>> +             fprintf(os->fh, "%s", os->prefix);
>>>>       aggr_printout(config, os->evsel, os->id, os->nr);
>>>>       for (i = 0; i < os->nfields; i++)
>>>>               fputs(config->csv_sep, os->fh);
>>>> --
>>>> 2.31.1
--------------chy98hRrbwPZOYSvYIPXbYzn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/4/22 12:59 PM, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:D12F3A8A-AD9F-4B9D-98EA-8E8AD11A858F@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 03-Nov-2022, at 9:45 PM, Ian Rogers <a class="moz-txt-link-rfc2396E" href="mailto:irogers@google.com">&lt;irogers@google.com&gt;</a> wrote:

On Wed, Nov 2, 2022 at 1:36 AM Athira Rajeev
<a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 18-Oct-2022, at 2:26 PM, Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a> wrote:

Perf stat with CSV output option prints an extra empty
string as first field in metrics output line.
Sample output below:

     # ./perf stat -x, --per-socket -a -C 1 ls
     S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
     S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
     S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
     S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
     S0,1,875807,,cycles,1769826,100.00,0.491,GHz
     S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend cycles idle
     S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend cycles idle
     S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
====&gt; ,S0,1,,,,,,,2.00,stalled cycles per insn

The above command line uses field separator as ","
via "-x," option and per-socket option displays
socket value as first field. But here the last line
for "stalled cycles per insn" has "," in the
beginning.

Sample output using interval mode:
     # ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
     0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs utilized
     0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
     ------
     0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn per cycle
====&gt; 0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn

Above result also has an extra csv separator after
the timestamp. Patch addresses extra field separator
in the beginning of the metric output line.

The counter stats are displayed by function
"perf_stat__print_shadow_stats" in code
"util/stat-shadow.c". While printing the stats info
for "stalled cycles per insn", function "new_line_csv"
is used as new_line callback.

The new_line_csv function has check for "os-&gt;prefix"
and if prefix is not null, it will be printed along
with cvs separator.
Snippet from "new_line_csv":
     if (os-&gt;prefix)
             fprintf(os-&gt;fh, "%s%s", os-&gt;prefix, config-&gt;csv_sep);

Here os-&gt;prefix gets printed followed by ","
which is the cvs separator. The os-&gt;prefix is
used in interval mode option ( -I ), to print
time stamp on every new line. But prefix is
already set to contain csv separator when used
in interval mode for csv option.

Reference: Function "static void print_interval"
Snippet:
     sprintf(prefix, "%6lu.%09lu%s", ts-&gt;tv_sec, ts-&gt;tv_nsec, config-&gt;csv_sep);

Also if prefix is not assigned (if not used with
-I option), it gets set to empty string.
Reference: function printout() in util/stat-display.c
Snippet:
     .prefix = prefix ? prefix : "",

Since prefix already set to contain cvs_sep in interval
option, patch removes printing config-&gt;csv_sep in
new_line_csv function to avoid printing extra field.

After the patch:

     # ./perf stat -x, --per-socket -a -C 1 ls
     S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
     S0,1,2,,context-switches,2041444,100.00,979.289,/sec
     S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
     S0,1,2,,page-faults,2040288,100.00,979.289,/sec
     S0,1,254589,,cycles,2036066,100.00,0.125,GHz
     S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles idle
     S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend cycles idle
     S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
     S0,1,,,,,,,1.27,stalled cycles per insn

Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <pre>perf stat csv test passed after applying the patch
Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:D12F3A8A-AD9F-4B9D-98EA-8E8AD11A858F@linux.vnet.ibm.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Hi All,

Looking for review comments for this change.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for addressing issues in this code. What is the status of the
CSV output test following these changes?

I think going forward we need to move away from CSV and columns, to
something with structure like json. We also need to refactor this
code, trying to add meaning to a newline character is a bad strategy
and creates some unnatural things. To some extent this overlaps with
Namhyung's aggregation cleanup. There are also weirdnesses in
jevents/pmu-events, like the same ScaleUnit applying to a metric and
an event - why are metrics even parts of events?

Given the current code is wac-a-mole, and this is another whack, if
the testing is okay I think we should move forward with this change.

Thanks,
Ian
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Ian,

Thanks for checking the patch.
Yes, CSV output test passes with the change.

	perf stat CSV output linter                                     : Ok
	perf stat csv summary test                                      : Ok

Thanks
Athira

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">



</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Thanks
Athira

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">---
tools/perf/util/stat-display.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 5c47ee9963a7..879874a4bc07 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config *config, void *ctx)

     fputc('\n', os-&gt;fh);
     if (os-&gt;prefix)
-             fprintf(os-&gt;fh, "%s%s", os-&gt;prefix, config-&gt;csv_sep);
+             fprintf(os-&gt;fh, "%s", os-&gt;prefix);
     aggr_printout(config, os-&gt;evsel, os-&gt;id, os-&gt;nr);
     for (i = 0; i &lt; os-&gt;nfields; i++)
             fputs(config-&gt;csv_sep, os-&gt;fh);
--
2.31.1
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------chy98hRrbwPZOYSvYIPXbYzn--

