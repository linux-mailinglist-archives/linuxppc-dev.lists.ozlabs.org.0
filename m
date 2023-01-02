Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFEB65B6B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 19:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nm4cT0mZPz3c42
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 05:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DL/jbpyj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DL/jbpyj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nlxsx2tFnz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 00:44:04 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 302DgJCw012346;
	Mon, 2 Jan 2023 13:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=MLlU6vKZTijRWgLSymivX/sCmG+bUOf2m0XNYzmZJOY=;
 b=DL/jbpyj435vrX5BslO149dTTD+KC4oSI2KRvqmUnWuvMskB8l8jT8CiSNpfT6BwIJo4
 pXe+UcfIuch1IKBpOdoBz0xQdpP47EDGhBYwiTPmp/F4rRnZHFzQkYE9prvtT7zAPHrL
 p7wN+9mtAB3+jipDvP/43N2vvon4HtYJ64Ylvfun0S+r4h1MUtwZFmXgMQv0PUGNDubx
 SK4S34UPz+PJBJca/UEOCXr/GE3bZ4ZeAJFhvtM/4acTftly8gYvaQq3m0sUppbAuGsF
 ceOggkmOpPI/JYqcw1KHdgHUsAbn8CzerzwysfkLSR86NSxqAVTk8ot2Y++Dt4DsR/I/ bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mv0cp80jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 13:43:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 302Dg8gA011940;
	Mon, 2 Jan 2023 13:43:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mv0cp80j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 13:43:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 301Kpqtt030029;
	Mon, 2 Jan 2023 13:43:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6agsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 13:43:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 302Dhpbt38404512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jan 2023 13:43:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E47B20043;
	Mon,  2 Jan 2023 13:43:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 136C320040;
	Mon,  2 Jan 2023 13:43:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.114.186])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  2 Jan 2023 13:43:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <3F25062C-EA96-4745-B4E4-1A0375E29FA8@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_90AAB520-7D91-4B7A-914B-B6C3CEBF5DF9"
Subject: Re: [PATCH] perf test bpf: Skip test if kernel-debuginfo is not
 present
Date: Mon, 2 Jan 2023 19:12:50 +0530
In-Reply-To: <Y5nxBuZ2AmKQh93a@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20221028154230.140709-1-kjain@linux.ibm.com>
 <A7B7E3F1-161D-4B1A-A4FE-E4A77EE06F1A@linux.vnet.ibm.com>
 <Y5d5mfyCEcUqI61Y@kernel.org>
 <6D5F1D8A-47FF-46CF-8251-20BABDF283F6@linux.vnet.ibm.com>
 <Y5nxBuZ2AmKQh93a@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5wOoJ3VVDQEg1iOAxAdCDEK1oFNTXOK6
X-Proofpoint-GUID: XluJ5XAic2PWoc6oSoj6Hj6apj48abkW
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_08,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020124
X-Mailman-Approved-At: Tue, 03 Jan 2023 05:47:04 +1100
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_90AAB520-7D91-4B7A-914B-B6C3CEBF5DF9
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 14-Dec-2022, at 9:21 PM, Arnaldo Carvalho de Melo <acme@kernel.org <ma=
ilto:acme@kernel.org>> wrote:
>=20
> Em Tue, Dec 13, 2022 at 03:21:03PM +0530, Athira Rajeev escreveu:
>>> On 13-Dec-2022, at 12:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org =
<mailto:acme@kernel.org>> wrote:
>>> Em Thu, Nov 03, 2022 at 12:27:01PM +0530, Athira Rajeev escreveu:
>>>>> On 28-Oct-2022, at 9:12 PM, Kajol Jain <kjain@linux.ibm.com <mailto:k=
jain@linux.ibm.com>> wrote:
>>>>>=20
>>>>> Perf BPF filter test fails in environment where "kernel-debuginfo"
>>>>> is not installed.
>>>>>=20
>>>>> Test failure logs:
>>>>> <<>>
>>>>> 42: BPF filter                            :
>>>>> 42.1: Basic BPF filtering                 : Ok
>>>>> 42.2: BPF pinning                         : Ok
>>>>> 42.3: BPF prologue generation             : FAILED!
>>>>> <<>>
>>>>>=20
>>>>> Enabling verbose option provided debug logs, which says debuginfo
>>>>> needs to be installed. Snippet of verbose logs:
>>>>>=20
>>>>> <<>>
>>>>> 42.3: BPF prologue generation                                       :
>>>>> --- start ---
>>>>> test child forked, pid 28218
>>>>> <<>>
>>>>> Rebuild with CONFIG_DEBUG_INFO=3Dy, or install an appropriate debugin=
fo
>>>>> package.
>>>>> bpf_probe: failed to convert perf probe events
>>>>> Failed to add events selected by BPF
>>>>> test child finished with -1
>>>>> ---- end ----
>>>>> BPF filter subtest 3: FAILED!
>>>>> <<>>
>>>>>=20
>>>>> Here subtest, "BPF prologue generation" failed and
>>>>> logs shows debuginfo is needed. After installing
>>>>> kernel-debuginfo package, testcase passes.
>>>>>=20
>>>>> Subtest "BPF prologue generation" failed because, the "do_test"
>>>>> function returns "TEST_FAIL" without checking the error type
>>>>> returned by "parse_events_load_bpf_obj" function.
>>>>> Function parse_events_load_bpf_obj can also return error of type
>>>>> "-ENOENT" incase kernel-debuginfo package is not installed. Fix this
>>>>> by adding check for -ENOENT error.
>>>>>=20
>>>>> Test result after the patch changes:
>>>>>=20
>>>>> Test failure logs:
>>>>> <<>>
>>>>> 42: BPF filter                 :
>>>>> 42.1: Basic BPF filtering      : Ok
>>>>> 42.2: BPF pinning              : Ok
>>>>> 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
>>>>> installed or environment missing BPF support)
>>>>>=20
>>>>> Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
>>>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com <mailto:kjain@linux.ib=
m.com>>
>>>>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com <mailto:maddy@l=
inux.ibm.com>>
>>>>> ---
>>>>> tools/perf/tests/bpf.c | 6 +++++-
>>>>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>>>>> index 17c023823713..57cecadc1da2 100644
>>>>> --- a/tools/perf/tests/bpf.c
>>>>> +++ b/tools/perf/tests/bpf.c
>>>>> @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (=
*func)(void),
>>>>>=20
>>>>> 	err =3D parse_events_load_bpf_obj(&parse_state, &parse_state.list, o=
bj, NULL);
>>>>> 	parse_events_error__exit(&parse_error);
>>>>> +	if (err =3D=3D -ENOENT) {
>>>>> +		pr_debug("Failed to add events selected by BPF, debuginfo package =
not installed\n");
>>>>> +		return TEST_SKIP;
>>>>> +	}
>>>>=20
>>>> Hi Kajol,
>>>>=20
>>>> Here, you have used ENOENT to skip the test. But there could be other =
places in the code path for =E2=80=9Cparse_events_load_bpf_obj=E2=80=9D
>>>> which also returns ENOENT. In that case, for any exit that returns ENO=
ENT, test will get skipped.
>>>>=20
>>>> Can we look at the logs, example we have this in commit logs:
>>>>=20
>>>> 	Rebuild with CONFIG_DEBUG_INFO=3Dy, or install an appropriate debugin=
fo
>>>> 	package.
>>>>=20
>>>> so as to decide whether to skip for debug info ?
>>>=20
>>> Kajol?
>=20
>> Hi Arnaldo, looking for your suggestion on how to handle the case where =
debuginfo is missing.
>=20
>> Here the bpf test fails because of missing debuginfo. The function
>> which goes through the debuginfo check is "parse_events_load_bpf_obj"
>> . parse_events_load_bpf_obj internally calls "open_debuginfo" which
>> returns ENOENT when debuginfo is missing. The patch fix from Kajol is
>> to skip the test using error code ENOENT for debuginfo.
>=20
> Lets see:
>=20
> root@roc-rk3399-pc:~# uname -a
> Linux roc-rk3399-pc 6.1.0-rc5-00123-g4dd7ff4a0311 #2 SMP PREEMPT Wed Nov =
16 19:55:11 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
> root@roc-rk3399-pc:~# perf probe -x ~/bin/perf open_debuginfo
> Added new event:
> probe_perf:open_debuginfo (on open_debuginfo in /home/acme/bin/perf)
>=20
> You can now use it in all perf tools, such as:
>=20
> 	perf record -e probe_perf:open_debuginfo -aR sleep 1
>=20
> root@roc-rk3399-pc:~#
>=20
> root@roc-rk3399-pc:~# perf trace --call-graph=3Ddwarf -a -e probe_perf:* =
perf test bpf
> 40: LLVM search and compile                                         :
> 40.1: Basic BPF llvm compile                                        : Ok
> 40.3: Compile source for BPF prologue generation                    : FAI=
LED!
> 40.4: Compile source for BPF relocation                             : Ok
> 42: BPF filter                                                      :
> 42.1: Basic BPF filtering                                           :    =
 0.000 perf/38363 probe_perf:open_debuginfo(__probe_ip: 187650778659428)
>                                     open_debuginfo (/home/acme/bin/perf)
>                                     try_to_find_probe_trace_events (inlin=
ed)
>                                     convert_to_probe_trace_events (inline=
d)
>                                     convert_perf_probe_events (/home/acme=
/bin/perf)
>                                     bpf__probe (/home/acme/bin/perf)
>                                     parse_events_load_bpf_obj (/home/acme=
/bin/perf)
>                                     do_test (/home/acme/bin/perf)
> FAILED!
> 42.2: BPF pinning                                                   :  55=
94.218 perf/38582 probe_perf:open_debuginfo(__probe_ip: 187650778659428)
>                                     open_debuginfo (/home/acme/bin/perf)
>                                     try_to_find_probe_trace_events (inlin=
ed)
>                                     convert_to_probe_trace_events (inline=
d)
>                                     convert_perf_probe_events (/home/acme=
/bin/perf)
>                                     bpf__probe (/home/acme/bin/perf)
>                                     parse_events_load_bpf_obj (/home/acme=
/bin/perf)
>                                     do_test (/home/acme/bin/perf)
> FAILED!
> 42.3: BPF prologue generation                                       : FAI=
LED!
> 63: Test libpfm4 support                                            :
> 99: perf stat --bpf-counters test                                   : Skip
> 100: perf stat --bpf-counters --for-each-cgroup test                 : Sk=
ip
> root@roc-rk3399-pc:~#
>=20
> So that is the callchains leading to open_debuginfo(), perhaps we should
> return ENODATA at try_to_find_probe_trace_events() when open_debuginfo()
> fails?

Hi Arnaldo,

Thanks for the suggestions. I tried with changing return code to ENODATA wh=
en open_debuginfo fails and will
send a separate patch addressing this change.

>=20
> =E2=AC=A2[acme@toolbox perf]$ find tools/perf/ -name "*.[ch]" | xargs gre=
p try_to_find_probe_trace_events
> tools/perf/util/probe-event.c:static int try_to_find_probe_trace_events(s=
truct perf_probe_event *pev,
> tools/perf/util/probe-event.c:static int try_to_find_probe_trace_events(s=
truct perf_probe_event *pev,
> tools/perf/util/probe-event.c:	ret =3D try_to_find_probe_trace_events(pev=
, tevs);
> =E2=AC=A2[acme@toolbox perf]$=20
>=20
> Also it returns ENOENT as well when not finding the probe point... There
> we should return perhaps ENOSYM?

ENOSYM is not defined for all the archs.=20

	arch/parisc/include/uapi/asm/errno.h:#define ENOSYM		215	/* symbol does no=
t exist in executable */

So we need to make this error code generic to use in probe-event. Shall we =
make this error code
generic for all archs to use ?

Thanks
Athira
>=20
>> But issue with using this return code is that, there are other places
>> in the code path for "parse_events_load_bpf_obj" which also returns
>> ENOENT. In that case, for any exit path that returns ENOENT, test will
>> get skipped.  Hence looking for an alternative way to identify missing
>> debuginfo to skip the test. Please share your thoughts on this.
>=20
> See above.
>=20
> - Arnaldo

--Apple-Mail=_90AAB520-7D91-4B7A-914B-B6C3CEBF5DF9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><meta charset=3D"UTF-8" class=3D""><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
14-Dec-2022, at 9:21 PM, Arnaldo Carvalho de Melo &lt;<a =
href=3D"mailto:acme@kernel.org" class=3D"">acme@kernel.org</a>&gt; =
wrote:<br class=3D""><br class=3D"">Em Tue, Dec 13, 2022 at 03:21:03PM =
+0530, Athira Rajeev escreveu:<br class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D"">On 13-Dec-2022, at 12:27 =
AM, Arnaldo Carvalho de Melo &lt;<a href=3D"mailto:acme@kernel.org" =
class=3D"">acme@kernel.org</a>&gt; wrote:<br class=3D"">Em Thu, Nov 03, =
2022 at 12:27:01PM +0530, Athira Rajeev escreveu:<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">On 28-Oct-2022, at 9:12 PM, Kajol Jain &lt;<a =
href=3D"mailto:kjain@linux.ibm.com" class=3D"">kjain@linux.ibm.com</a>&gt;=
 wrote:<br class=3D""><br class=3D"">Perf BPF filter test fails in =
environment where "kernel-debuginfo"<br class=3D"">is not installed.<br =
class=3D""><br class=3D"">Test failure logs:<br =
class=3D"">&lt;&lt;&gt;&gt;<br class=3D"">42: BPF filter =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;:<br class=3D"">42.1: Basic BPF filtering =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;: Ok<br class=3D"">42.2: BPF pinning =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: =
Ok<br class=3D"">42.3: BPF prologue generation =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: =
FAILED!<br class=3D"">&lt;&lt;&gt;&gt;<br class=3D""><br =
class=3D"">Enabling verbose option provided debug logs, which says =
debuginfo<br class=3D"">needs to be installed. Snippet of verbose =
logs:<br class=3D""><br class=3D"">&lt;&lt;&gt;&gt;<br class=3D"">42.3: =
BPF prologue generation =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;:<br class=3D"">--- start ---<br class=3D"">test child forked, pid =
28218<br class=3D"">&lt;&lt;&gt;&gt;<br class=3D"">Rebuild with =
CONFIG_DEBUG_INFO=3Dy, or install an appropriate debuginfo<br =
class=3D"">package.<br class=3D"">bpf_probe: failed to convert perf =
probe events<br class=3D"">Failed to add events selected by BPF<br =
class=3D"">test child finished with -1<br class=3D"">---- end ----<br =
class=3D"">BPF filter subtest 3: FAILED!<br class=3D"">&lt;&lt;&gt;&gt;<br=
 class=3D""><br class=3D"">Here subtest, "BPF prologue generation" =
failed and<br class=3D"">logs shows debuginfo is needed. After =
installing<br class=3D"">kernel-debuginfo package, testcase passes.<br =
class=3D""><br class=3D"">Subtest "BPF prologue generation" failed =
because, the "do_test"<br class=3D"">function returns "TEST_FAIL" =
without checking the error type<br class=3D"">returned by =
"parse_events_load_bpf_obj" function.<br class=3D"">Function =
parse_events_load_bpf_obj can also return error of type<br =
class=3D"">"-ENOENT" incase kernel-debuginfo package is not installed. =
Fix this<br class=3D"">by adding check for -ENOENT error.<br =
class=3D""><br class=3D"">Test result after the patch changes:<br =
class=3D""><br class=3D"">Test failure logs:<br =
class=3D"">&lt;&lt;&gt;&gt;<br class=3D"">42: BPF filter =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;:<br class=3D"">42.1: Basic BPF filtering =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Ok<br class=3D"">42.2: BPF pinning =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;: Ok<br class=3D"">42.3: BPF prologue generation &nbsp;: Skip =
(clang/debuginfo isn't<br class=3D"">installed or environment missing =
BPF support)<br class=3D""><br class=3D"">Fixes: ba1fae431e74bb42 ("perf =
test: Add 'perf test BPF'")<br class=3D"">Signed-off-by: Kajol Jain =
&lt;<a href=3D"mailto:kjain@linux.ibm.com" =
class=3D"">kjain@linux.ibm.com</a>&gt;<br class=3D"">Reviewed-by: =
Madhavan Srinivasan &lt;<a href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">tools/perf/tests/bpf.c | 6 +++++-<br class=3D"">1 file =
changed, 5 insertions(+), 1 deletion(-)<br class=3D""><br class=3D"">diff =
--git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c<br =
class=3D"">index 17c023823713..57cecadc1da2 100644<br class=3D"">--- =
a/tools/perf/tests/bpf.c<br class=3D"">+++ b/tools/perf/tests/bpf.c<br =
class=3D"">@@ -126,6 +126,10 @@ static int do_test(struct bpf_object =
*obj, int (*func)(void),<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>err =3D =
parse_events_load_bpf_obj(&amp;parse_state, &amp;parse_state.list, obj, =
NULL);<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>parse_events_error__exit(&amp;parse_error);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (err =3D=3D -ENOENT) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>pr_debug("Failed to add events selected by BPF, debuginfo package =
not installed\n");<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return TEST_SKIP;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D""></blockquote><br class=3D"">Hi Kajol,<br =
class=3D""><br class=3D"">Here, you have used ENOENT to skip the test. =
But there could be other places in the code path for =
=E2=80=9Cparse_events_load_bpf_obj=E2=80=9D<br class=3D"">which also =
returns ENOENT. In that case, for any exit that returns ENOENT, test =
will get skipped.<br class=3D""><br class=3D"">Can we look at the logs, =
example we have this in commit logs:<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Rebuild =
with CONFIG_DEBUG_INFO=3Dy, or install an appropriate debuginfo<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>package.<br class=3D""><br class=3D"">so as to decide whether to =
skip for debug info ?<br class=3D""></blockquote><br class=3D"">Kajol?<br =
class=3D""></blockquote></blockquote><br class=3D""><blockquote =
type=3D"cite" class=3D"">Hi Arnaldo, looking for your suggestion on how =
to handle the case where debuginfo is missing.<br =
class=3D""></blockquote><br class=3D""><blockquote type=3D"cite" =
class=3D"">Here the bpf test fails because of missing debuginfo. The =
function<br class=3D"">which goes through the debuginfo check is =
"parse_events_load_bpf_obj"<br class=3D"">. parse_events_load_bpf_obj =
internally calls "open_debuginfo" which<br class=3D"">returns ENOENT =
when debuginfo is missing. The patch fix from Kajol is<br class=3D"">to =
skip the test using error code ENOENT for debuginfo.<br =
class=3D""></blockquote><br class=3D"">Lets see:<br class=3D""><br =
class=3D"">root@roc-rk3399-pc:~# uname -a<br class=3D"">Linux =
roc-rk3399-pc 6.1.0-rc5-00123-g4dd7ff4a0311 #2 SMP PREEMPT Wed Nov 16 =
19:55:11 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux<br =
class=3D"">root@roc-rk3399-pc:~# perf probe -x ~/bin/perf =
open_debuginfo<br class=3D"">Added new event:<br =
class=3D"">probe_perf:open_debuginfo (on open_debuginfo in =
/home/acme/bin/perf)<br class=3D""><br class=3D"">You can now use it in =
all perf tools, such as:<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>perf =
record -e probe_perf:open_debuginfo -aR sleep 1<br class=3D""><br =
class=3D"">root@roc-rk3399-pc:~#<br class=3D""><br =
class=3D"">root@roc-rk3399-pc:~# perf trace --call-graph=3Ddwarf -a -e =
probe_perf:* perf test bpf<br class=3D"">40: LLVM search and compile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;:<br class=3D"">40.1: Basic BPF llvm compile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;: Ok<br class=3D"">40.3: Compile source for BPF prologue =
generation =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: FAILED!<br class=3D"">40.4: =
Compile source for BPF relocation =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;: Ok<br class=3D"">42: BPF filter =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;:<br class=3D"">42.1: Basic BPF filtering =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;0.000 perf/38363 =
probe_perf:open_debuginfo(__probe_ip: 187650778659428)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;open_debuginfo (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;try_to_find_probe_trace_events (inlined)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;convert_to_probe_trace_events (inlined)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;convert_perf_probe_events (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;bpf__probe (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;parse_events_load_bpf_obj (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;do_test (/home/acme/bin/perf)<br class=3D"">FAILED!<br =
class=3D"">42.2: BPF pinning =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;: &nbsp;5594.218 perf/38582 probe_perf:open_debuginfo(__probe_ip: =
187650778659428)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;open_debuginfo (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;try_to_find_probe_trace_events (inlined)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;convert_to_probe_trace_events (inlined)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;convert_perf_probe_events (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;bpf__probe (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;parse_events_load_bpf_obj (/home/acme/bin/perf)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;do_test (/home/acme/bin/perf)<br class=3D"">FAILED!<br =
class=3D"">42.3: BPF prologue generation =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;: FAILED!<br class=3D"">63: Test libpfm4 support =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<br class=3D"">99: perf stat =
--bpf-counters test =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Skip<br =
class=3D"">100: perf stat --bpf-counters --for-each-cgroup test =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;: Skip<br class=3D"">root@roc-rk3399-pc:~#<br =
class=3D""><br class=3D"">So that is the callchains leading to =
open_debuginfo(), perhaps we should<br class=3D"">return ENODATA at =
try_to_find_probe_trace_events() when open_debuginfo()<br =
class=3D"">fails?<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">Hi Arnaldo,</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">Thanks for the suggestions. I tried =
with changing return code to ENODATA when open_debuginfo fails and =
will</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">send a separate patch addressing =
this change.</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">=E2=AC=A2[acme@toolbox perf]$ find tools/perf/ -name "*.[ch]" =
| xargs grep try_to_find_probe_trace_events<br =
class=3D"">tools/perf/util/probe-event.c:static int =
try_to_find_probe_trace_events(struct perf_probe_event *pev,<br =
class=3D"">tools/perf/util/probe-event.c:static int =
try_to_find_probe_trace_events(struct perf_probe_event *pev,<br =
class=3D"">tools/perf/util/probe-event.c:<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ret =3D =
try_to_find_probe_trace_events(pev, tevs);<br class=3D"">=E2=AC=A2[acme@to=
olbox perf]$<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">Also it returns ENOENT as well when not =
finding the probe point... There<br class=3D"">we should return perhaps =
ENOSYM?<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">ENOSYM is not defined for all the =
archs.<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;">	</span><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" =
class=3D"">arch/parisc/include/uapi/asm/errno.h:#define =
ENOSYM</span><span class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: pre; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;">	</span><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none; display: inline !important; float: none;" =
class=3D"">215</span><span class=3D"Apple-tab-span" style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: pre; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;">	</span><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">/* symbol does not exist in =
executable */</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">So we need to make this error code =
generic to use in probe-event. Shall we make this error code</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">generic for all archs to use =
?</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">Thanks</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;" class=3D"">Athira</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">But issue with using =
this return code is that, there are other places<br class=3D"">in the =
code path for "parse_events_load_bpf_obj" which also returns<br =
class=3D"">ENOENT. In that case, for any exit path that returns ENOENT, =
test will<br class=3D"">get skipped. &nbsp;Hence looking for an =
alternative way to identify missing<br class=3D"">debuginfo to skip the =
test. Please share your thoughts on this.<br class=3D""></blockquote><br =
class=3D"">See above.<br class=3D""><br class=3D"">- =
Arnaldo</blockquote></div></body></html>=

--Apple-Mail=_90AAB520-7D91-4B7A-914B-B6C3CEBF5DF9--

