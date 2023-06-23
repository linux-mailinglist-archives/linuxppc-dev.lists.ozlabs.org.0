Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9173C310
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 23:43:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CLmABZnq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnrMH06g1z3bsj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 07:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CLmABZnq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnlX01P62z30hF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 04:05:19 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NHeWIr026547;
	Fri, 23 Jun 2023 18:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=wy3oownjzja7yTF5mAMu38fU7Hzugrcoxf/ndpTA9Dc=;
 b=CLmABZnqp4E6jcdxNXhhtdh+bGK6+4hvWdWvEVAAE/QnqlYXufZpP0x6jNTvUbSfu/j7
 M64+sNKf6Pt/t2xeE11e5Wq/g8SrTGgP60X8mO+gsT7mRiuGz4zqVb2kYW3JfOluApfn
 o5rRQGU8Pgf1kbKBf3xvM422EP9YAPPNYi5pkYxvFncpkwYJXRBuk2GlujQqwmbqGEl3
 6+SzHESNLyWPZ3+RGrC5ua6MSt38ch2/t3CYPaeCFsXHtb//fof8zpkS9EUp2jYTGLiK
 TrrFKmJVeaH4DdQuVaNcgbxqtP92iQxem396tLAn3yZC+iaxREZGWLRkTgdplcZ6DFJZ 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rdcwmw8sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 18:04:57 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35NI2cCw019325;
	Fri, 23 Jun 2023 18:04:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rdcwmw8sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 18:04:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35N6eBE2001569;
	Fri, 23 Jun 2023 18:04:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f54b34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 18:04:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35NI4pBd47710476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jun 2023 18:04:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BB5220043;
	Fri, 23 Jun 2023 18:04:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9914820040;
	Fri, 23 Jun 2023 18:04:48 +0000 (GMT)
Received: from [9.43.112.194] (unknown [9.43.112.194])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jun 2023 18:04:48 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------s3YmqAs5jXziIIogENWSWATI"
Message-ID: <6f613a91-e99a-a5f4-e17d-51ea3d53fec1@linux.ibm.com>
Date: Fri, 23 Jun 2023 23:34:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 15/17] perf tests task_analyzer: fix bad substitution
 ${$1}
Content-Language: en-IN, en-US
To: Namhyung Kim <namhyung@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com>
 <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
 <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com>
 <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
 <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com>
 <CAM9d7cgopOAyL0QgHs+x_O9A6v020Jyaju+EOv8ymS_cg1Sarg@mail.gmail.com>
 <CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com>
From: Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PhHVB71fdEUMlV8YFw7LOqm979yNKphP
X-Proofpoint-ORIG-GUID: Zdm0Vl1rFyNRoRK0PhAD4aA1AeYP_GBL
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_09,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=762 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230157
X-Mailman-Approved-At: Sat, 24 Jun 2023 07:40:38 +1000
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, Hagen Paul Pfeifer <hagen@jauu.net>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, ravi.bangoria@amd.com, maddy@linux.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------s3YmqAs5jXziIIogENWSWATI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Namhyung,

On 23/06/23 04:55, Namhyung Kim wrote:

> Ok, I found two problems.
>
> ...
> The first one is related to this message.  It couldn't find the script
> (task-analyzer.py) because PERF_EXEC_PATH is not set.
> Running with --exec-path=$PWD was ok, but I got a segfault.
>
> The other problem is in set_regs_in_dict().  It tries to capture
> register values in the sample and save them to a dictionary.
> The sample doesn't have registers so it should have no problem.
> But the 'bf' was not initialized properly when size is 0, and it led
> PyUnicode_FromString() returning NULL.
>
> After the changes, it ran ok:
>
> $ sudo ./perf test -v task
> 116: perf script task-analyzer tests                                 :
> --- start ---
> test child forked, pid 204088
> PASS: "test_basic"
> PASS: "test_ns_rename"
> PASS: "test_ms_filtertasks_highlight"
> PASS: "test_extended_times_timelimit_limittasks"
> PASS: "test_summary"
> PASS: "test_summaryextended"
> PASS: "test_summaryonly"
> PASS: "test_extended_times_summary_ns"
> PASS: "test_extended_times_summary_ns"
> PASS: "test_csv"
> PASS: "test_csvsummary"
> PASS: "test_csv_extended_times"
> PASS: "test_csvsummary_extended"
> test child finished with 0
> ---- end ----
> perf script task-analyzer tests: Ok
>
This is interesting. I did not encounter these earlier.

> I'll send the fixes soon.
>
Thanks for fixing it.

>> You can try the perf-tools-next branch in the perf/perft-tools-next.git repo.
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
>>
>>    $ make clean all
>>    $ sudo ./perf test -v task
>>
I tested with the steps provided, i.e.. clone, /*apply patch 15 (added this step myself)*/, clean, make, ./perf test -v test. But still- test passed:

'''
~/temp_clones/perf-tools-next/tools/perf git:(master) sudo ./perf test -v test

...

--- start ---
test child forked, pid 75261
PASS: "test_basic"
PASS: "test_ns_rename"
PASS: "test_ms_filtertasks_highlight"
PASS: "test_extended_times_timelimit_limittasks"
PASS: "test_summary"
PASS: "test_summaryextended"
PASS: "test_summaryonly"
PASS: "test_extended_times_summary_ns"
PASS: "test_extended_times_summary_ns"
PASS: "test_csv"
PASS: "test_csvsummary"
PASS: "test_csv_extended_times"
PASS: "test_csvsummary_extended"
test child finished with 0
---- end ----
'''


Maybe my environment had that other things set in such a way that, I did not face any issue (I don't recall doing so though, and these patches have been tested multiple times by more people also).
But thanks for your efforts to debug and fix the issue.

Thanks,

- AdityaG

--------------s3YmqAs5jXziIIogENWSWATI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Namhyung,

</pre>
    <div class="moz-cite-prefix">
      <pre>On 23/06/23 04:55, Namhyung Kim wrote:</pre>
    </div>
    <blockquote type="cite"
cite="mid:CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Ok, I found two problems.

...
</pre>
      <pre class="moz-quote-pre" wrap="">
The first one is related to this message.  It couldn't find the script
(task-analyzer.py) because PERF_EXEC_PATH is not set.
Running with --exec-path=$PWD was ok, but I got a segfault.

The other problem is in set_regs_in_dict().  It tries to capture
register values in the sample and save them to a dictionary.
The sample doesn't have registers so it should have no problem.
But the 'bf' was not initialized properly when size is 0, and it led
PyUnicode_FromString() returning NULL.

After the changes, it ran ok:

$ sudo ./perf test -v task
116: perf script task-analyzer tests                                 :
--- start ---
test child forked, pid 204088
PASS: "test_basic"
PASS: "test_ns_rename"
PASS: "test_ms_filtertasks_highlight"
PASS: "test_extended_times_timelimit_limittasks"
PASS: "test_summary"
PASS: "test_summaryextended"
PASS: "test_summaryonly"
PASS: "test_extended_times_summary_ns"
PASS: "test_extended_times_summary_ns"
PASS: "test_csv"
PASS: "test_csvsummary"
PASS: "test_csv_extended_times"
PASS: "test_csvsummary_extended"
test child finished with 0
---- end ----
perf script task-analyzer tests: Ok

</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">This is interesting. I did not encounter these earlier.

</pre>
    <blockquote type="cite"
cite="mid:CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
I'll send the fixes soon.

</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Thanks for fixing it.</pre>
    <blockquote type="cite"
cite="mid:CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com">
      <blockquote type="cite">
        <pre><font face="monospace">
</font></pre>
        <pre class="moz-quote-pre" wrap="">You can try the perf-tools-next branch in the perf/perft-tools-next.git repo.

  git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git

  $ make clean all
  $ sudo ./perf test -v task

</pre>
      </blockquote>
    </blockquote>
    <pre>
I tested with the steps provided, i.e.. clone, /*apply patch 15 (added this step myself)*/, clean, make, ./perf test -v test. But still- test passed:<font face="monospace">
</font></pre>
    <pre class="moz-quote-pre" wrap="">
'''
~/temp_clones/perf-tools-next/tools/perf git:(master) sudo ./perf test -v test

...

--- start ---
test child forked, pid 75261
PASS: "test_basic"
PASS: "test_ns_rename"
PASS: "test_ms_filtertasks_highlight"
PASS: "test_extended_times_timelimit_limittasks"
PASS: "test_summary"
PASS: "test_summaryextended"
PASS: "test_summaryonly"
PASS: "test_extended_times_summary_ns"
PASS: "test_extended_times_summary_ns"
PASS: "test_csv"
PASS: "test_csvsummary"
PASS: "test_csv_extended_times"
PASS: "test_csvsummary_extended"
test child finished with 0
---- end ----
'''


Maybe my environment had that other things set in such a way that, I did not face any issue (I don't recall doing so though, and these patches have been tested multiple times by more people also).
But thanks for your efforts to debug and fix the issue.</pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">Thanks,</font></pre>
    <pre><font face="monospace">- AdityaG</font></pre>
  </body>
</html>

--------------s3YmqAs5jXziIIogENWSWATI--

