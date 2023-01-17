Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F370566DE7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 14:15:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx8XX6KnNz3cgt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 00:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TZbcMyIM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TZbcMyIM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx8WY3v3Mz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:15:04 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HD4avE035827;
	Tue, 17 Jan 2023 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YIcTFtRVSv5KwrXNGVaNBuGcC2gU6jycN/k0hptijDA=;
 b=TZbcMyIMF29IuXSY/IdNZ9PRTVro72qm9i9ntIQR2NAt7R6NaK+40m3xt4UuleMM6Jm4
 N2hWrBRwSzGLAtX+8ZI3tzWcM+DPpyzlRdakiOqXoTqdIBdG1sbAdXXFIV2sZ1FwN1TW
 dteJL68kiM70hym49NzgHDjbF6UaJ0exZQxjeb8PPHDXoPXIH9+h5ylWbzipNdqa4gVC
 klSpS0F/ixhmjt6pK/W/9GVpFFJ1nxs5QkM1PACGlk5XuHVySJlzWpveQ8NMLdhbotEI
 ld/+zbS1Mzi4OvzusZTd1q87LzZctvW7vJMCGOju9BKK6Z83wpNlR1HZzIu5vnMr5JNd uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5qb5y5ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 13:14:55 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HCAj5i012113;
	Tue, 17 Jan 2023 13:14:55 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5qb5y59t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 13:14:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30H855uk023789;
	Tue, 17 Jan 2023 13:14:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16kvmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 13:14:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30HDEnLa47907132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jan 2023 13:14:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8AA520043;
	Tue, 17 Jan 2023 13:14:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA41F2004B;
	Tue, 17 Jan 2023 13:14:46 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.80.22])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Jan 2023 13:14:46 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXS+8Wg8+Qrob+7fb5Y6FeBQphzd=Y0a1eh6xNwc-SfYA@mail.gmail.com>
Date: Tue, 17 Jan 2023 18:44:44 +0530
Message-Id: <8356580F-4D16-47E2-95C7-AD43B3CD437C@linux.vnet.ibm.com>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
 <Yyy0W6CnPk7BkkCU@kernel.org>
 <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
 <3EE5CFF3-51BC-444E-8FEF-2AC219E809F6@linux.vnet.ibm.com>
 <41461A8A-74F7-4938-9E8D-9F275114E906@linux.vnet.ibm.com>
 <CAP-5=fXWCYQSpp92L64+7Piu0sfEq+RsigNLUowgCjsT218jow@mail.gmail.com>
 <5CAD9B57-1788-4C7E-9658-7634A49D8BF0@linux.vnet.ibm.com>
 <CAP-5=fXS+8Wg8+Qrob+7fb5Y6FeBQphzd=Y0a1eh6xNwc-SfYA@mail.gmail.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dWhEG-OW6R1_nYtxdjDPYqJVdQVqlu5Y
X-Proofpoint-ORIG-GUID: tYDYOrSbTNXuK-zihJdsRHZQOPQPD42k
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170108
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 17-Jan-2023, at 3:30 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Mon, Jan 16, 2023 at 4:00 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 16-Jan-2023, at 11:47 AM, Ian Rogers <irogers@google.com> wrote:
>>>=20
>>> On Sun, Jan 15, 2023 at 9:03 PM Athira Rajeev
>>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On 28-Sep-2022, at 10:24 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.c=
om> wrote:
>>>>>=20
>>>>> Hi All,
>>>>>=20
>>>>> Looking for what direction we can take here.
>>>>> Do we want to change all tests in tools/perf/tests/shell except test_=
intel_pt.sh to use "bash" or go with
>>>>> the approach in the patch ? Please share your comments
>>>>>=20
>>>>> Thanks
>>>>> Athira
>>>>>=20
>>>>=20
>>>> Hi All,
>>>>=20
>>>> Looking for what direction we can take here.
>>>> Do we want to change all tests in tools/perf/tests/shell except test_i=
ntel_pt.sh to use "bash" or go with
>>>> the approach in the patch ? Please share your comments
>>>>=20
>>>> Thanks
>>>> Athira
>>>=20
>>=20
>> Thanks Ian for the response.
>>=20
>>> I think some of what the patch is doing is good, some of it the
>>=20
>> Ian, can I take this as an ack for the patch so that Arnaldo can pick th=
is in acme git ?
>=20
> Acked-by: Ian Rogers <irogers@google.com>
>=20
> Thanks,
> Ian

Thanks Ian.

Hi Arnaldo,

I have re-posted the patch 2 ( in this series ) separately in new patchset =
here :
https://lore.kernel.org/linux-perf-users/20230116050131.17221-2-atrajeev@li=
nux.vnet.ibm.com/

Ack from Ian is for Patch 1. Shall I rebase to upstream and post this patch=
 1 separately ?

Thanks
Athira
>=20
>>> readability becomes a little harder by not being bash. I'm agnostic as
>>> to which approach to take for the fix.
>>=20
>> May be we can take this as separate mail thread to get everyone=E2=80=99=
s opinion on changing all tests in "tools/perf/tests/shell" except test_int=
el_pt.sh to use =E2=80=9Cbash" ?
>>=20
>>>=20
>>> An aside, I noticed that we do run some tests at build time:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/lib=
/Makefile?h=3Dperf/core#n390
>>> So perhaps we can have a shellcheck build option, defaulted off but
>>> enabled as part of Arnaldo's regular test scripts. The shellcheck
>>> build option would run shellcheck to make sure that there weren't
>>> errors in the shell code, which it is far too easy to introduce.
>>=20
>> Sure, that is a good option to have. I will check on having =E2=80=9Cshe=
llcheck" as a build option.
>>=20
>> Thanks
>> Athira
>>=20
>>>=20
>>> Thanks,
>>> Ian
>>>=20
>>>>>> On 23-Sep-2022, at 11:54 AM, Adrian Hunter <adrian.hunter@intel.com>=
 wrote:
>>>>>>=20
>>>>>> On 22/09/22 22:15, Arnaldo Carvalho de Melo wrote:
>>>>>>> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
>>>>>>>> The perf test named =E2=80=9Cbuild id cache operations=E2=80=9D sk=
ips with below
>>>>>>>> error on some distros:
>>>>>>>=20
>>>>>>> I wonder if we shouldn't instead state that bash is needed?
>>>>>>>=20
>>>>>>> =E2=AC=A2[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell=
/*.sh | grep ^#
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/bash
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/bash
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/bash
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/bash
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> #!/bin/sh
>>>>>>> =E2=AC=A2[acme@toolbox perf-urgent]$
>>>>>>>=20
>>>>>>> Opinions?
>>>>>>>=20
>>>>>>=20
>>>>>> Please don't change tools/perf/tests/shell/test_intel_pt.sh
>>>>>>=20
>>>>>> I started using shellcheck on that with the "perf test:
>>>>>> test_intel_pt.sh: Add per-thread test" patch set that I sent.
>>>>>>=20
>>>>>> FYI, if you use shellcheck on buildid.sh, it shows up issues even
>>>>>> after changing to bash:
>>>>>>=20
>>>>>> *** Before ***
>>>>>>=20
>>>>>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 69:
>>>>>>     link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
>>>>>>                                    ^-------^ SC2039: In POSIX sh, st=
ring indexing is undefined.
>>>>>>                                              ^-----^ SC2039: In POSI=
X sh, string indexing is undefined.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 77:
>>>>>>     file=3D${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
>>>>>>                                    ^-------^ SC2039: In POSIX sh, st=
ring indexing is undefined.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 123:
>>>>>>     echo "running: perf record $@"
>>>>>>                                ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 124:
>>>>>>     ${perf} record --buildid-all -o ${data} $@ &> ${log}
>>>>>>                                             ^-- SC2068: Double quote=
 array expansions to avoid re-splitting elements.
>>>>>>                                                ^-------^ SC2039: In =
POSIX sh, &> is undefined.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 126:
>>>>>>             echo "failed: record $@"
>>>>>>                                  ^-- SC2145: Argument mixes string a=
nd array. Use * or separate argument.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 131:
>>>>>>     check ${@: -1}
>>>>>>           ^------^ SC2068: Double quote array expansions to avoid re=
-splitting elements.
>>>>>>           ^------^ SC2039: In POSIX sh, string indexing is undefined.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 158:
>>>>>> exit ${err}
>>>>>>  ^----^ SC2154: err is referenced but not assigned.
>>>>>>=20
>>>>>> For more information:
>>>>>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansi=
ons to ...
>>>>>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and =
array. ...
>>>>>> https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, &> is undefin=
ed.
>>>>>>=20
>>>>>> *** After ***
>>>>>>=20
>>>>>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 123:
>>>>>>     echo "running: perf record $@"
>>>>>>                                ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 124:
>>>>>>     ${perf} record --buildid-all -o ${data} $@ &> ${log}
>>>>>>                                             ^-- SC2068: Double quote=
 array expansions to avoid re-splitting elements.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 126:
>>>>>>             echo "failed: record $@"
>>>>>>                                  ^-- SC2145: Argument mixes string a=
nd array. Use * or separate argument.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 131:
>>>>>>     check ${@: -1}
>>>>>>           ^------^ SC2068: Double quote array expansions to avoid re=
-splitting elements.
>>>>>>=20
>>>>>>=20
>>>>>> In tools/perf/tests/shell/buildid.sh line 158:
>>>>>> exit ${err}
>>>>>>  ^----^ SC2154: err is referenced but not assigned.
>>>>>>=20
>>>>>> For more information:
>>>>>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansi=
ons to ...
>>>>>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and =
array. ...
>>>>>> https://www.shellcheck.net/wiki/SC2154 -- err is referenced but not =
assigned.

