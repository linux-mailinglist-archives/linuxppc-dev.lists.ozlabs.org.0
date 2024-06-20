Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2D9109DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 17:30:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HH5TKejO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4kvG0kngz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 01:30:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HH5TKejO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ktX3phrz2xQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 01:29:23 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KDudAK008194;
	Thu, 20 Jun 2024 15:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=c
	IoH/OsYGxOQvmP3g/Ut2izvYfVOckotGHITVUdL2bA=; b=HH5TKejOGhtOK26St
	Xp374fNhKGzRjoJFbF8weJL2flQwHphGg+XD9RWBidmr77jhR4oYbW7UFudoLFkH
	ClaCsIR/F+u9bYocZ+haXL5peXEJD64Za5hmeyTio4uuCC3QXYH+U57ANlrEUQ32
	QwnsSezywpNMs837eNAc+wxL83/vEVkkNW45L4+aK+zP2QW4UaPgdjR8fNFQGWRh
	ehg2w9GpKrsauBS+oe5o4jO9vSmV5+LIi3NX8HmGrG85FXPpPgqEteiqfddGEHEe
	gkja+rvhwK/gCOUdDpp2HzL/QP2sDLdRIuFZ6sYChvRleNiII25GECcibTDoaUQt
	2Z3LQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvndu8aj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 15:29:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45KFT9pW004042;
	Thu, 20 Jun 2024 15:29:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvndu8aj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 15:29:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45KENP7P011037;
	Thu, 20 Jun 2024 15:29:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yspsnq9c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 15:29:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45KFT28450331980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 15:29:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6679320043;
	Thu, 20 Jun 2024 15:29:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B91192004B;
	Thu, 20 Jun 2024 15:28:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.81.239])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Jun 2024 15:28:59 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] tools/perf: Handle perftool-testsuite_probe testcases
 fail when kernel debuginfo is not present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <b31a73f6-b5fe-4ea8-8259-652b344a4cff@arm.com>
Date: Thu, 20 Jun 2024 20:58:47 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F017F40F-28CC-47A6-8FC5-A537B7899EC7@linux.vnet.ibm.com>
References: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
 <588beeaf-2015-40f4-a34b-e36556e20707@arm.com>
 <DA51C986-34EE-4849-B9C4-DB69E2ECF75C@linux.vnet.ibm.com>
 <5a0edf86-fe42-41d6-aa9a-8e88c1ad3f4c@arm.com>
 <b31a73f6-b5fe-4ea8-8259-652b344a4cff@arm.com>
To: James Clark <james.clark@arm.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yOlzRgoR9B6iPrNqJzb9M37UyesT7-YH
X-Proofpoint-ORIG-GUID: jq0JTcsHktJaQmTZbOb1ca1gVZaOC5jC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200111
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20 Jun 2024, at 2:03=E2=80=AFPM, James Clark <james.clark@arm.com> =
wrote:
>=20
>=20
>=20
> On 18/06/2024 11:44, James Clark wrote:
>>=20
>>=20
>> On 17/06/2024 17:47, Athira Rajeev wrote:
>>>=20
>>>=20
>>>> On 17 Jun 2024, at 8:30=E2=80=AFPM, James Clark =
<james.clark@arm.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>> On 17/06/2024 13:21, Athira Rajeev wrote:
>>>>> Running "perftool-testsuite_probe" fails as below:
>>>>>=20
>>>>> ./perf test -v "perftool-testsuite_probe"
>>>>> 83: perftool-testsuite_probe  : FAILED
>>>>>=20
>>>>> There are three fails:
>>>>>=20
>>>>> 1. Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on =
inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
>>>>>  -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added =
probe :: perf probe -l (output regexp parsing)
>>>>>=20
>>>>=20
>>>> On a machine where NO_DEBUGINFO gets set, this one skips for me. =
But on
>>>> a machine where there _is_ debug info this test still fails.
>>>>=20
>>>> But in both cases the probe looks like it was added successfully. =
So I'm
>>>> wondering if this one does need to be skipped, or it's just always
>>>> failing? Do you have this test passing anywhere where there is =
debug info?
>>>>=20
>>>> The list command looks like it successfully lists the probe for me =
in
>>>> both cases, it just doesn't have an address on the end:
>>>>=20
>>>> perf list 'probe:*'
>>>>=20
>>>>  probe:inode_permission (on inode_permission)
>>>>=20
>>>> Does the missing address mean anything or is it just not handled
>>>> properly by the test?
>>>>=20
>>>> Ironically the machine that _does_ pass the debug info test also =
prints
>>>> this, but it looks like it still adds and lists the probe =
correctly:
>>>>=20
>>>> perf probe -l probe:*
>>>>=20
>>>> Failed to find debug information for address 0xffff80008047ac30
>>>>   probe:inode_permission (on inode_permission)
>>>=20
>>> Hi James,
>>>=20
>>> Thanks for checking this patch.
>>>=20
>>> In environment where kernel is compiled with debuginfo:
>>>=20
>>> 1) Add probe point
>>>=20
>>> # ./perf probe --add inode_permission
>>> Added new event:
>>>  probe:inode_permission (on inode_permission)
>>>=20
>>> You can now use it in all perf tools, such as:
>>>=20
>>> perf record -e probe:inode_permission -aR sleep 1
>>>=20
>>>=20
>>> 2) Check using perf probe -l
>>>=20
>>> # ./perf probe -l
>>> probe:inode_permission (on inode_permission:2@fs/namei.c)
>>>=20
>>> With debuginfo, the result has additional info.
>>> The test looks for matching pattern =
"\s*probe:inode_permission(?:_\d+)?\s+\(on =
inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)=E2=80=9D in result
>>> where it is expecting "inode_permission:2@fs/namei.c=E2=80=9D . The =
=E2=80=9C@fs/namei.c=E2=80=9D info needs debuginfo here.
>>>=20
>>=20
>> Hi Athira,
>>=20
>> Maybe there is a real bug and this patch is ok to go in and we should =
leave
>> it as failing. Probe -L shows there is debug info available for =
inode_permission:
>>=20
>>   $ ./perf probe -L inode_permission
>>=20
>>  <inode_permission@linux/fs/namei.c:0>
>>      0  int inode_permission(struct mnt_idmap *idmap,
>>                             struct inode *inode, int mask)
>>  ... more source code ...
>>=20
>> But probe -l has an error which could be related to the following
>> line not showing the filename details:
>>=20
>>  $ ./perf probe -l
>>=20
>>  Failed to find debug information for address 0xffff80008047ac30
>>    probe:inode_permission (on inode_permission)
>>=20
>> I'm running a clang kernel and sometimes I see issues with debug
>> info or toolchain stuff, that could be the reason.
>>=20
>>> The function I am using in patch to check for debuginfo =
(skip_if_no_debuginfo) is from "tests/shell/lib/probe_vfs_getname.sh"
>>>=20
>>> skip_if_no_debuginfo() {
>>>        add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find =
the path for the kernel|Debuginfo-analysis is not supported)|(file has =
no debug information)" && return 2
>>>        return 1
>>> }
>>>=20
>>> So the debuginfo test passes in your case since the log has "Failed =
to find debug information=E2=80=9D which is not present in above grep =
string.=20
>>>=20
>>=20
>> It passes because there is debug info for getname_flags() which is =
what the
>> debug info check looks for. After some greps and seds it ultimately =
does this
>> which succeeds:
>>=20
>> $ perf probe "vfs_getname=3Dgetname_flags:72 =
pathname=3Dresult->name:string"
>>=20
>> Added new event:
>>    probe:vfs_getname    (on getname_flags:72 with =
pathname=3Dresult->name:string)
>>=20
>> "Failed to find debug information for address" is only ever printed
>> with "perf probe -l" when there are probes added. The stderr
>> of that command is never piped into any grep anyway, which is why I
>> see it on the test output.
>>=20
>> So "probe -L" is working but "probe -l" isn't. Ultimately it looks =
like a real
>> issue and we should leave the failure in.
>>=20
>=20
> To avoid confusion, by leave it in I mean this debuginfo patch is ok =
and
> the failure I'm seeing is caused by something else.
>=20
> Reviewed-by: James Clark <james.clark@arm.com>

Thanks James for the Reviewed-by,

Athira
>=20
>>> James,
>>>=20
>>> Only =E2=80=9Cperf probe -l=E2=80=9D subtest fails with debuginfo =
enabled or other two subtests as well? Can you also share result on how =
other two subtests behaves ?=20
>>>=20
>>> 1. Fail 2 :
>>>   perf probe -nf --max-probes=3D512 -a 'vfs_* $params=E2=80=99
>>>=20
>>>=20
>>> 2. Fail 3 :
>>>  perf probe 'vfs_read =
somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64'
>>>=20
>>=20
>> Here's the full output:
>>=20
>> $ sudo ./perf test -vvv "testsuite_probe"
>> 84: perftool-testsuite_probe:
>> --- start ---
>> test child forked, pid 4872
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission ::=20
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission :: -a
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission :: --add
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added =
probe :: perf list
>> Failed to find debug information for address 0xffff80008047ac30
>> Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on =
inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
>> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added =
probe :: perf probe -l (output regexp parsing)
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added probe
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added =
probe
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed =
probe (should NOT be listed)
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: adding =
probe
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: first probe adding
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: second probe adding (without force)
>> Failed to find debug information for address 0xffff80008047ac30
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: second probe adding (with force)
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled =
probe
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing multiple =
probes
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: wildcard adding =
support
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: non-existing =
variable
>> -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with =
retval :: add
>> Regexp not found: "^\[\s+perf\s+record:\s+Woken up [0-9\.]+ times? to =
write data\s+\].*$"
>> Regexp not found: "^\[\s+perf\s+record:\s+Captured and wrote =
[0-9\.]+\s*MB\s+(?:[\w\+\.-]*(?:(?:[\w\+\.-]+)?(?:\/[\w\+\.-]+)+)?\/)?perf=
\.data(?:\.\d+)?\s*\(~?[0-9\.]+ samples\)\s+\].*$"
>> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: function with =
retval :: record (command exitcode + output regexp parsing)
>> zero-sized data =
(/tmp/perftool-testsuite_probe.VMU/perf_probe/perf.data), nothing to do!
>> Regexp not found: =
"\s*cat\s+[0-9\.]+\s+\[[0-9\.]+\]\s+[0-9\.]+:\s+probe:inode_permission\w*:=
\s+\([0-9A-Fa-f]+\s+<\-\s+[0-9A-Fa-f]+\)\s+arg1=3D[0-9A-Fa-f]+"
>> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: function argument =
probing :: script (command exitcode + output regexp parsing)
>> ## [ FAIL ] ## perf_probe :: test_adding_kernel SUMMARY :: 3 failures =
found
>> ---- end(-1) ----
>> 84: perftool-testsuite_probe                                        : =
FAILED!
>>=20
>>=20
>>>=20
>>> Also since you mentioned this gets skipped when debuginfo is not =
enabled, curious to know what is debuginfo message from your setup with =
debuginfo disabled.
>>>=20
>>=20
>>  $ sudo ./perf probe -L getname_flags
>>  Failed to find the path for the kernel: Invalid ELF file
>>    Error: Failed to show lines.
>>=20
>>> Thanks again for checking.
>>>=20
>>> Athira
>>>=20
>>>>=20
>>>=20
>>>=20
>>>>=20
>>>>> 2. Regexp not found: "probe:vfs_mknod"
>>>>>  Regexp not found: "probe:vfs_create"
>>>>>  Regexp not found: "probe:vfs_rmdir"
>>>>>  Regexp not found: "probe:vfs_link"
>>>>>  Regexp not found: "probe:vfs_write"
>>>>>  -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard =
adding support (command exitcode + output regexp parsing)
>>>>>=20
>>>>> 3. Regexp not found: "Failed to find"
>>>>>  Regexp not found: =
"somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
>>>>>  Regexp not found: "in this function|at this address"
>>>>>  Line did not match any pattern: "The /boot/vmlinux file has no =
debug information."
>>>>>  Line did not match any pattern: "Rebuild with =
CONFIG_DEBUG_INFO=3Dy, or install an appropriate debuginfo package."
>>>>>=20
>>>>> These three tests depends on kernel debug info.
>>>>> 1. Fail 1 expects file name along with probe which needs debuginfo
>>>>> 2. Fail 2 :
>>>>>   perf probe -nf --max-probes=3D512 -a 'vfs_* $params'
>>>>>   Debuginfo-analysis is not supported.
>>>>>    Error: Failed to add events.
>>>>>=20
>>>>> 3. Fail 3 :
>>>>>  perf probe 'vfs_read =
somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64'
>>>>>  Debuginfo-analysis is not supported.
>>>>>  Error: Failed to add events.
>>>>>=20
>>>>> There is already helper function skip_if_no_debuginfo in
>>>>> lib/probe_vfs_getname.sh which does perf probe and returns
>>>>> "2" if debug info is not present. Use the skip_if_no_debuginfo
>>>>> function and skip only the three tests which needs debuginfo
>>>>> based on the result.
>>>>>=20
>>>>> With the patch:
>>>>>=20
>>>>>   83: perftool-testsuite_probe:
>>>>>  --- start ---
>>>>>  test child forked, pid 3927
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission ::
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission :: -a
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe =
inode_permission :: --add
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added =
probe :: perf list
>>>>>  Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on =
inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
>>>>>  -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped =
due to missing debuginfo :: testcase skipped
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added =
probe
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added =
probe
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing =
removed probe (should NOT be listed)
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: =
adding probe
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: first probe adding
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: second probe adding (without force)
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding =
probes :: second probe adding (with force)
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled =
probe
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing =
multiple probes
>>>>>  Regexp not found: "probe:vfs_mknod"
>>>>>  Regexp not found: "probe:vfs_create"
>>>>>  Regexp not found: "probe:vfs_rmdir"
>>>>>  Regexp not found: "probe:vfs_link"
>>>>>  Regexp not found: "probe:vfs_write"
>>>>>  -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped =
due to missing debuginfo :: testcase skipped
>>>>>  Regexp not found: "Failed to find"
>>>>>  Regexp not found: =
"somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
>>>>>  Regexp not found: "in this function|at this address"
>>>>>  Line did not match any pattern: "The /boot/vmlinux file has no =
debug information."
>>>>>  Line did not match any pattern: "Rebuild with =
CONFIG_DEBUG_INFO=3Dy, or install an appropriate debuginfo package."
>>>>>  -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped =
due to missing debuginfo :: testcase skipped
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with =
retval :: add
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with =
retval :: record
>>>>>  -- [ PASS ] -- perf_probe :: test_adding_kernel :: function =
argument probing :: script
>>>>>  ## [ PASS ] ## perf_probe :: test_adding_kernel SUMMARY
>>>>>  ---- end(0) ----
>>>>>  83: perftool-testsuite_probe                                      =
  : Ok
>>>>>=20
>>>>> Only the three specific tests are skipped and remaining
>>>>> ran successfully.
>>>>>=20
>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>> ---
>>>>> .../shell/base_probe/test_adding_kernel.sh    | 31 =
+++++++++++++++++--
>>>>> 1 file changed, 28 insertions(+), 3 deletions(-)
>>>>>=20
>>>>> diff --git =
a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> index 63bb8974b38e..187dc8d4b163 100755
>>>>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> @@ -21,8 +21,18 @@
>>>>> THIS_TEST_NAME=3D`basename $0 .sh`
>>>>> TEST_RESULT=3D0
>>>>>=20
>>>>> +# shellcheck source=3Dlib/probe_vfs_getname.sh
>>>>> +. "$(dirname "$0")/../lib/probe_vfs_getname.sh"
>>>>> +
>>>>> TEST_PROBE=3D${TEST_PROBE:-"inode_permission"}
>>>>>=20
>>>>> +# set NO_DEBUGINFO to skip testcase if debuginfo is not present
>>>>> +# skip_if_no_debuginfo returns 2 if debuginfo is not present
>>>>> +skip_if_no_debuginfo
>>>>> +if [ $? -eq 2 ]; then
>>>>> + NO_DEBUGINFO=3D1
>>>>> +fi
>>>>> +
>>>>> check_kprobes_available
>>>>> if [ $? -ne 0 ]; then
>>>>> print_overall_skipped
>>>>> @@ -67,7 +77,12 @@ PERF_EXIT_CODE=3D$?
>>>>> ../common/check_all_patterns_found.pl =
"\s*probe:${TEST_PROBE}(?:_\d+)?\s+\(on =
${TEST_PROBE}(?:[:\+]$RE_NUMBER_HEX)?@.+\)" < =
$LOGS_DIR/adding_kernel_list-l.log
>>>>> CHECK_EXIT_CODE=3D$?
>>>>>=20
>>>>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added =
probe :: perf probe -l"
>>>>> +if [ $NO_DEBUGINFO ] ; then
>>>>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due =
to missing debuginfo"
>>>>> +else
>>>>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added =
probe :: perf probe -l"
>>>>> +fi
>>>>> +
>>>>> (( TEST_RESULT +=3D $? ))
>>>>>=20
>>>>>=20
>>>>> @@ -208,7 +223,12 @@ PERF_EXIT_CODE=3D$?
>>>>> ../common/check_all_patterns_found.pl "probe:vfs_mknod" =
"probe:vfs_create" "probe:vfs_rmdir" "probe:vfs_link" "probe:vfs_write" =
< $LOGS_DIR/adding_kernel_adding_wildcard.err
>>>>> CHECK_EXIT_CODE=3D$?
>>>>>=20
>>>>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding =
support"
>>>>> +if [ $NO_DEBUGINFO ] ; then
>>>>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due =
to missing debuginfo"
>>>>> +else
>>>>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding =
support"
>>>>> +fi
>>>>> +
>>>>> (( TEST_RESULT +=3D $? ))
>>>>>=20
>>>>>=20
>>>>> @@ -232,7 +252,12 @@ CHECK_EXIT_CODE=3D$?
>>>>> ../common/check_no_patterns_found.pl "$RE_SEGFAULT" < =
$LOGS_DIR/adding_kernel_nonexisting.err
>>>>> (( CHECK_EXIT_CODE +=3D $? ))
>>>>>=20
>>>>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing =
variable"
>>>>> +if [ $NO_DEBUGINFO ]; then
>>>>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due =
to missing debuginfo"
>>>>> +else
>>>>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing =
variable"
>>>>> +fi
>>>>> +
>>>>> (( TEST_RESULT +=3D $? ))


